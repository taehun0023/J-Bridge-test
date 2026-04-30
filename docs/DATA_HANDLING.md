# 個人情報・データ取扱方針 (DATA HANDLING)

J-Bridge は社内 LMS であり、社員の学習履歴や個人プロファイルを保有する。本書は PII (Personally Identifiable Information) の取扱い、保存期間、削除要請への対応を定める。

---

## 1. 保有する PII 一覧

### 1-1. `profiles` テーブル

| カラム | 種別 | 用途 | PII 区分 |
|---|---|---|---|
| `id` | UUID | Supabase Auth と連携 | **機密** |
| `email` | string | ログイン・通知 | **機密** |
| `display_name` | string | 画面表示名 | 中 |
| `avatar_url` | string | プロフィール画像 URL | 低 |
| `role` | enum | admin/mentor/mentee | 中 (社内権限情報) |
| `mentor_specialty` | enum | japanese/tech/null | 低 |
| `created_at` / `updated_at` | timestamp | 監査用 | 低 |

### 1-2. 学習履歴 (関連テーブル)

- `quiz_attempts`, `quiz_answers` — 受験記録
- `code_submissions`, `code_reviews` — コード提出と AI レビュー
- `coding_exam_attempts` — 等級試験記録
- `lesson_progress`, `enrollments` — 学習進捗
- `dispatch_readiness_scores`, `japanese_skills`, `coding_skills`, `attitude_culture_skills` — 5 軸スコア
- `personal_vocab` — 個人単語帳

### 1-3. インタラクション

- `admin_feedbacks`, `feedback_replies` — フィードバック内容
- `notifications` — 通知履歴
- `audit_log` — 管理者操作監査
- `task_assignments`, `learning_assignments` — 課題割当履歴

### 1-4. ストレージ

- `avatars` バケット — プロフィール画像 (PII)
- `tts-cache` バケット — 音声合成結果 (匿名、ハッシュキー)

---

## 2. アクセス制御

すべての PII は **Supabase RLS (Row Level Security)** で保護される。詳細は [RLS_MATRIX.md](./security/RLS_MATRIX.md)。

| アクセス権 | 範囲 |
|---|---|
| 本人 | 自分の全データ |
| 担当 mentor | 担当メンティーの学習データ・スコア (PII の `email` は表示名で隠蔽) |
| admin | 全データ (システム運用上必要) |
| その他 | アクセス不可 |

**注意**: `personal_vocab` は admin もアクセス不可 (本人のみ)。サポート要請時のみ `service_role` 経由で個別取得。

---

## 3. 保存期間

| データ種別 | 保存期間 | 根拠 |
|---|---|---|
| アカウント (`profiles`) | 退職時に削除要請があれば削除 (§4 参照) | 在籍中は必須 |
| 学習履歴 | 退職後 3 年保管後、匿名化または削除 | 人事評価・パフォーマンス分析用途 (要社内ポリシー確定) |
| 監査ログ (`audit_log`) | **無期限** (現状) | 改ざん検知用 |
| TTS キャッシュ | 自動失効なし | 再利用前提、容量逼迫時に LRU で削除検討 |
| バックアップ | 30 日間 (Supabase Pro 自動バックアップ) | DR 用途 |

> **TODO (引継ぎ後の決定事項)**: 上記の保存期間は暫定値。法務・人事と協議の上、社内ポリシーとして確定すること。

---

## 4. 削除要請への対応 (退職・契約終了時)

### 4-1. 標準フロー

1. 削除要請の受領 (本人、人事、または法務から)
2. admin が以下を実行:
   - `profiles.role` を NULL に変更 (システムアクセス遮断)
   - 「退職済み」のフラグ立て (将来的に `deleted_at` カラム追加検討)
3. 30 日経過後、本人または法務から異議がなければ:
   - 関連レコードを **匿名化** (`display_name` を `(退職者)` 等に置換、`email` を hash)
   - `personal_vocab`, `notifications` 等の個人専用データは物理削除
4. 監査ログには「退職処理: <user_id>」として記録

### 4-2. 完全削除 (ハードデリート)

法的要請または重大インシデント時のみ:
- Supabase Auth から user 削除
- 関連テーブルの該当行を CASCADE で削除
- バックアップからも削除可能か検討 (Supabase は自動バックアップから個別削除不可 → 30 日待機)

### 4-3. 削除しない情報

- `audit_log` の自分の操作記録 (改ざん防止のため)
- 集計済みの匿名統計 (ランキング集計値、コース完了率など)

---

## 5. データエクスポート要請 (GDPR-like)

社員から「自分のデータを見せて」の要請があった場合:

1. admin が `/admin/users/<id>` から該当ユーザーを表示
2. 関連テーブルの自分のレコードを CSV エクスポート
   - `src/app/actions/admin/backup.ts` の単一ユーザー版を必要に応じて拡張
3. PDF または ZIP で本人へ提供 (社内 Slack / 暗号化メール)

---

## 6. ログ・トレーシング

`audit_log` に記録される操作:
- ユーザー作成 / 削除 / ロール変更
- コンテンツ CRUD (quiz_questions, profiles, task_assignments, admin_feedbacks, quiz_attempts, learning_assignments)
- 再試験承認 / 却下
- 共有単語帳管理

詳細は [HANDOVER.md §8](./HANDOVER.md) 参照。

---

## 7. 第三者提供

J-Bridge は外部 API として以下を利用するが、**PII を送信しない**:

| サービス | 送信する内容 | PII 含有 |
|---|---|---|
| Google Cloud TTS | テキスト (問題文、解説) | なし (社員個人を特定可能な情報なし) |
| Judge0 | コード提出内容 | なし (匿名 ID で送信) |

ユーザーが入力した自由記述 (フィードバック等) を外部 API に送信する機能は **追加しないこと**。AI コードレビューは現状ローカル処理 (`src/lib/code-review/`)。

---

## 8. インシデント対応

PII 漏洩を疑う場合:

1. 影響範囲の特定 (`audit_log`、Supabase ログ、GitHub Actions ログ、本番サーバーログ)
2. 関連シークレットの即時 Reset ([SECRETS_ROTATION.md](./SECRETS_ROTATION.md) §緊急対応)
3. 法務・セキュリティ責任者へ報告
4. 影響を受けた本人への通知 (法令に従う)
5. 再発防止策の検討と CHANGELOG 記載

---

## 9. 引継ぎ時の確認事項

- [ ] 保存期間ポリシーの正式化 (人事 + 法務と協議)
- [ ] 退職フロー文書化 (HR 規程と整合)
- [ ] エクスポート機能の運用テスト (admin が一連の操作を 1 度実施)
- [ ] インシデント対応手順の社内周知
