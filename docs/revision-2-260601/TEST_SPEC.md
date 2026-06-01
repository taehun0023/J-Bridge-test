# J-Bridge 수정 2차 (260601) — テスト仕様書

> 본 문서는 5개 개선 항목의 동작 검증용 체크리스트입니다.  
> 코드 수정 후 각 항목을 수동 또는 자동으로 검증하면서 `[ ]` → `[x]` 로 체크하고,  
> 결과(PASS/FAIL/N/A)와 비고를 기록합니다.

## 共通事項

### テスト環境
- **対象環境:** Test (`taehun0023/J-Bridge-test`, branch: `feature/dashboard-japanese-progress` または `main` after merge)
- **URL:** `http://localhost:3000` (`npm run dev`)
- **DB:** Supabase Test 環境 (`nyymasirfrawsxobmfwi.supabase.co`)
- **本番 (prod) は対象外** — `[[feedback-prod-db-readonly]]` に従い別途明示承認後に反映

### テスト用アカウント (revision-1 から流用)
| 役割 | Email | パスワード |
|---|---|---|
| mentee | `operation-menti@jbridge.test` | `Operation2025!` |
| mentor | `operation-mento@jbridge.test` | `Operation2025!` |
| admin  | `operation-kanri@jbridge.test` | `Operation2025!` |

### 結果記入規約
- **判定:** `PASS` / `FAIL` / `N/A` / `BLOCKED`
- **記入日:** YYYY-MM-DD
- **テスター:** イニシャル
- 失敗時は **再現手順 + 期待値/実値** を「備考」欄に記載

### 凡例
- 🔴 **必須** — マージ前に必ず PASS
- 🟡 **推奨** — 可能であれば検証
- 🟢 **任意** — 余裕があれば

---

# ① ダッシュボード進捗率改善

## 1.1 変更範囲

| 種別 | 対象 |
|---|---|
| **修正** | `src/app/(main)/dashboard/page.tsx`, `AdminDashboard.tsx`, `MentorDashboard.tsx`, `DashboardClient.tsx`, `src/lib/japanese-progress.ts`, `src/app/(main)/admin/tasks/AdminTasksClient.tsx`, `src/app/(main)/dashboard/assignments/page.tsx`, `src/app/actions/learning-assignments.ts` |
| **新規** | `src/lib/exam-progress.ts`, `src/lib/weekly-progress.ts`, `src/components/dashboard/ExamResultsTable.tsx` |
| **DB** | (要決定) `learning_assignments.weekly_target` 追加 もしくは計算ベース |
| **テスト** | `src/modules/dashboard/__tests__/exam-progress.test.ts`, `weekly-progress.test.ts` |

## 1.2 決定事項記入欄
| 項目 | 決定内容 | 決定者 | 日付 |
|---|---|---|---|
| 試験 ⇔ 課題カテゴリマッピング (`seikatsu` / `business-jp` 正規化) |  |  |  |
| 「毎週」の定義 (月曜起算 / 月初 / 課題発行から7日) |  |  |  |
| 遅延判定基準 (`due_date` 経過 + 週次未達?) |  |  |  |
| 試験列の表示形式 (点数 / 合否 / 最新のみ / 履歴あり) |  |  |  |
| 管理者課題付与 UI 改善範囲 (テンプレ / フィルタ / 一括) |  |  |  |

## 1.3 事前条件
- [ ] mentee 1名以上に `learning_assignments` が `category IN ('seikatsu','business-jp')` で配信済み
- [ ] そのうち少なくとも 1件は `status='completed'`、1件は `due_date < now()` で未完了
- [ ] mentee が `comprehensive_exams` の生活日本語/ビジネス日本語をそれぞれ 1回以上受験済み
- [ ] mentor 1名が上記 mentee と `mentor_mentee_assignments` で紐付け済み

## 1.4 テストケース

### TC-1.4.1 🔴 admin ダッシュボード列構成
- **手順:** admin でログイン → `/dashboard`
- **期待:** テーブル列が次の順で表示される
  - `名前 | 担当メンター | 試験 生活日本語 | 試験 ビジネス日本語 | 課題 生活日本語 | 課題 ビジネス日本語 | 未完了 | 遅延 | 今月進捗 | 全体進捗`
- [ ] **結果:** `____` / 日付: `____` / 備考: `____`

### TC-1.4.2 🔴 試験列の値が正しい
- **手順:** TC-1.4.1 の続き。テスト mentee の試験列を確認
- **期待:** 決定事項 1.2-④ の形式に従った値が表示される。受験未済は `—` または `未受験`
- [ ] **結果:** `____`

### TC-1.4.3 🔴 課題列の値が正しい
- **手順:** 同上、課題列を確認
- **期待:** `完了数/全体数` (例: `3/5`) または定めた表記
- [ ] **結果:** `____`

### TC-1.4.4 🔴 未完了 / 遅延カウント
- **手順:** 同上、未完了・遅延列を確認
- **期待:** 未完了 = `status != 'completed'` の件数、遅延 = `due_date < now() AND status != 'completed'` の件数 (もしくは決定事項に従う)
- [ ] **結果:** `____`

### TC-1.4.5 🔴 今月進捗 / 全体進捗
- **手順:** 同上、進捗列を確認
- **期待:** 今月 = 当月内 completed / 当月内 total、全体 = 全期間 completed / 全期間 total
- [ ] **結果:** `____`

### TC-1.4.6 🔴 mentor ダッシュボードは担当 mentee のみ
- **手順:** mentor でログイン → `/dashboard`
- **期待:** `mentor_mentee_assignments` で紐付いた mentee のみが表示。それ以外の mentee は出ない
- [ ] **結果:** `____`

### TC-1.4.7 🔴 mentee ダッシュボードに遅延通知
- **手順:** 遅延あり mentee でログイン → `/dashboard` または `/dashboard/assignments`
- **期待:** 「遅延 N件」「今週の課題が未達成」等のアラートカード/バナーが表示される
- [ ] **結果:** `____`

### TC-1.4.8 🟡 admin 課題付与 UI 改善
- **手順:** admin → `/admin/tasks` → 課題作成フォームを開く
- **期待:** 決定事項 1.2-⑤ で定めた改善が反映 (複数 mentee 選択 / テンプレ / フィルタ等)
- [ ] **結果:** `____`

### TC-1.4.9 🟡 試験未受験 mentee の表示
- **手順:** 試験を受けていない mentee の行を確認
- **期待:** クラッシュせず `—` 等で空表示。`null.score` のような例外なし
- [ ] **結果:** `____`

### TC-1.4.10 🟢 課題 0件 mentee の表示
- **手順:** 課題未配信 mentee の行を確認
- **期待:** `0/0` または `—`。進捗 NaN にならない
- [ ] **結果:** `____`

## 1.5 回帰テスト
- [ ] mentee ダッシュボードの既存お知らせカードが引き続き表示される
- [ ] `aggregateJapaneseProgress()` の既存 vitest が PASS
- [ ] ロード時間が極端に遅くならない (体感 3秒以内)

---

# ② 本番サーバ テストアカウント整理

## 2.1 変更範囲

| 種別 | 対象 |
|---|---|
| **コード** | ほぼ無し (DB 作業) |
| **新規** | `supabase/scripts/cleanup_test_accounts.sql`, `docs/CLEANUP_TEST_ACCOUNTS.md` |
| **DB Cascade 影響** | `quiz_attempts`, `code_submissions`, `notifications`, `mentor_mentee_assignments`, `learning_assignments`, `comprehensive_exams`, `enrollments`, `user_mastered_items`, `coding_exam_attempts` (auto CASCADE) / `audit_log` (SET NULL 要確認) |

## 2.2 決定事項記入欄
| 項目 | 決定内容 | 決定者 | 日付 |
|---|---|---|---|
| 「テストアカウント」識別基準 (email ドメイン / role / created_at / 明示フラグ) |  |  |  |
| バックアップ保存期間 |  |  |  |
| 実行時刻 (メンテナンス窓) |  |  |  |
| `audit_log` SET NULL の可否 |  |  |  |
| 本番 (prod) 適用承認者 |  |  |  |

## 2.3 事前条件
- [ ] cleanup SQL がレビュー済 (drop ではなく archive 経由を推奨)
- [ ] 本番 DB の完全バックアップ取得済 (Supabase スナップショット)
- [ ] 影響範囲のカウント結果を事前 SELECT で記録済

## 2.4 テストケース (test 環境で先行検証)

### TC-2.4.1 🔴 識別クエリの正確性
- **手順:** test DB で識別 SELECT を実行
- **期待:** 想定数の test アカウントのみマッチ。運用アカウントが混入しない
- [ ] **結果:** `____` / 件数: `____`

### TC-2.4.2 🔴 dry-run でカウント検証
- **手順:** 削除前に各関連テーブルの該当行数を COUNT
- **期待:** 結果が事前見積もりと一致
- [ ] **結果:** `____`

### TC-2.4.3 🔴 CASCADE 動作確認 (test DB)
- **手順:** test DB で 1件削除 → 関連テーブルの行数が予測通り減少することを確認
- **期待:** orphan レコード 0
- [ ] **結果:** `____`

### TC-2.4.4 🔴 audit_log の扱い
- **手順:** 削除後 `audit_log.user_id IS NULL AND created_at > [削除前]` を確認
- **期待:** SET NULL が想定通り(または削除なしを想定通り)
- [ ] **結果:** `____`

### TC-2.4.5 🔴 残存アカウントでログイン可能
- **手順:** 削除後、運用アカウント 3名でログイン
- **期待:** 全員ログイン成功・自身のデータが見える
- [ ] **結果:** `____`

### TC-2.4.6 🟡 ロールバック手順検証
- **手順:** バックアップから 1名復元できることを別環境で試す
- **期待:** リストアで profiles + 関連データが復活
- [ ] **結果:** `____`

## 2.5 本番適用チェック (test PASS 後)
- [ ] `[[feedback-deploy-workflow]]` 通り、明示的な本番反映承認を取得した
- [ ] 本番バックアップ直前に再取得した
- [ ] 本番実行ログを別途保存した
- [ ] 本番でログイン疎通テスト (運用 3名) を実施した

---

# ③ ユーザー名表記統一

## 3.1 変更範囲

| 種別 | 対象 |
|---|---|
| **修正** | ~35ファイル: ヘッダー / 大ダッシュボード / ランキング / admin users / 課題画面 / 通知 / 公知 / 監査ログ / プロフィール |
| **新規** | `src/lib/user-name-helpers.ts` (`getHeaderName`, `getDisplayName`, `getShortName`) |
| **DB** | `profiles.kanji_name`, `katakana_name` 追加 + `full_name` データ移行 |
| **検索** | `admin/users` 検索を kanji + katakana 両方対象に拡張 |

## 3.2 決定事項記入欄
| 項目 | 決定内容 | 決定者 | 日付 |
|---|---|---|---|
| カタカナ未入力時の fallback |  |  |  |
| 既存 `full_name` データ移行方式 (一括 / 段階的入力依頼) |  |  |  |
| ヘッダーは本当に漢字名のみ? (検索性) |  |  |  |

## 3.3 事前条件
- [ ] `profiles` マイグレーション (kanji_name, katakana_name 追加) が test DB に適用済
- [ ] テストアカウント 3名に kanji + katakana 両方セット済

## 3.4 テストケース

### TC-3.4.1 🔴 ヘッダーは漢字名のみ
- **手順:** 任意のアカウントでログイン → 右上のヘッダーを確認
- **期待:** 漢字名のみ表示。カタカナは表示しない
- [ ] **結果:** `____`

### TC-3.4.2 🔴 画面本体は漢字名 + カタカナ
- **手順:** ダッシュボード / プロフィール / ランキング を確認
- **期待:** `漢字名 (カタカナ名)` 形式 (確定した表記)
- [ ] **結果:** `____`

### TC-3.4.3 🔴 検索が両方ヒット
- **手順:** `/admin/users` 検索で漢字名で検索 → 続いてカタカナ名で検索
- **期待:** 両方で同じアカウントがヒット
- [ ] **結果:** `____`

### TC-3.4.4 🔴 通知の発信者名
- **手順:** 通知ベルを開く
- **期待:** 決定した表記ルールで統一されている
- [ ] **結果:** `____`

### TC-3.4.5 🔴 カタカナ未入力時の fallback
- **手順:** カタカナ未入力アカウントの行を確認
- **期待:** 決定事項 3.2-① に従った fallback (漢字名のみ表示など)
- [ ] **結果:** `____`

### TC-3.4.6 🟡 監査ログ
- **手順:** `/admin/audit-log` を確認
- **期待:** 統一表記
- [ ] **結果:** `____`

## 3.5 回帰テスト
- [ ] 既存 `full_name` 参照箇所が全て `getDisplayName()` 等に置換されている (grep で確認)
- [ ] アバター/イニシャル表示が崩れていない
- [ ] mentor-mentee アサインメント画面で名前が正しく出る

---

# ④ プロフィール画面項目整理

## 4.1 変更範囲

| 種別 | 対象 |
|---|---|
| **修正** | `src/app/(main)/profile/ProfileForm.tsx`, `profile/page.tsx`, `src/app/actions/profile.ts` |
| **新規** | `src/components/ui/MultiSelect.tsx` |
| **DB** | `jlpt_level` (単一) → `jlpt_levels TEXT[]`、`kanji_name`/`katakana_name` 追加 (③と同梱) |
| **流用** | パスワード変更は既存 Supabase `updateUser` を継続 |

## 4.2 決定事項記入欄
| 項目 | 決定内容 | 決定者 | 日付 |
|---|---|---|---|
| IT 関連資格 (自由記述 vs 事前定義リスト) |  |  |  |
| JLPT 多重表示方式 (N1+N2 併記 / 最高位のみ) |  |  |  |
| kanji_name / katakana_name 必須可否 |  |  |  |

## 4.3 事前条件
- [ ] DB マイグレーション (③と同) 適用済
- [ ] テストアカウント 3名 (mentee/mentor/admin) で動作確認可能

## 4.4 テストケース

### TC-4.4.1 🔴 基本情報セクション構成
- **手順:** `/profile` を開く
- **期待:** 基本情報セクションに `漢字名 / カタカナ名 / 担当メンター` の 3項目が表示
- [ ] **結果:** `____`

### TC-4.4.2 🔴 担当メンターは mentee のみ
- **手順:** mentee / mentor / admin それぞれでログイン → `/profile`
- **期待:** mentee のみ「担当メンター」項目がアクティブ表示。mentor/admin は表示しないか非活性
- [ ] **結果:** mentee `____` / mentor `____` / admin `____`

### TC-4.4.3 🔴 JLPT 多重選択ドロップダウン
- **手順:** `/profile` → 資格情報セクション → JLPT
- **期待:** N1〜N5 を複数選択可。保存後に再表示しても選択状態が維持される
- [ ] **結果:** `____`

### TC-4.4.4 🔴 IT 関連資格 多重選択
- **手順:** 同上 → IT関連資格
- **期待:** 決定事項 4.2-① の方式 (自由記述 or ドロップダウン)。複数指定可
- [ ] **結果:** `____`

### TC-4.4.5 🔴 セキュリティセクション
- **手順:** セキュリティセクションを確認
- **期待:** `パスワード変更` のみ配置。他の項目は出ない
- [ ] **結果:** `____`

### TC-4.4.6 🔴 パスワード変更動作
- **手順:** 現パスワード `Operation2025!` → 仮 `Tempo123!@` に変更 → ログアウト → 新パスワードでログイン → 元に戻す
- **期待:** Supabase Auth で正常に変わる。エラーメッセージは日本語
- [ ] **結果:** `____`

### TC-4.4.7 🟡 旧 jlpt_level 既存データの自動移行
- **手順:** マイグレーション前に `jlpt_level='N2'` だったユーザーを確認
- **期待:** `jlpt_levels = ['N2']` に変換されている
- [ ] **結果:** `____`

## 4.5 回帰テスト
- [ ] スコア計算 (5軸) は JLPT 配列を考慮した値を返している (⑤と関連)
- [ ] プロフィール保存後、ヘッダーや他画面の表記に変更が即反映 (キャッシュ問題なし)

---

# ⑤ 五角形 (5軸レーダー) スコア改善

## 5.1 変更範囲

| 種別 | 対象 |
|---|---|
| **修正** | `src/modules/scoring/fetch-scoring-data.ts`, `axis-core-programming.ts`, `types.ts`, `axis-jlpt.ts` (検討) |
| **要確認** | 呼び出し元: `src/app/actions/quiz.ts`, `coding.ts`, `comprehensive-exam/execution.ts` |
| **DB** | 変更不要 (`coding_problems.difficulty`, `comprehensive_exam_questions.difficulty` 既存) |
| **テスト** | 既存 27件 + 新規 7〜9件 |

## 5.2 決定事項記入欄
| 項目 | 決定内容 | 決定者 | 日付 |
|---|---|---|---|
| 有効スコアの有効期限 (期限あり / 無期限) |  |  |  |
| 同一難易度の再受験 (最新採用 / 最高採用) |  |  |  |
| 「高難易度で落ちた」場合の挙動 (上書き / 維持) |  |  |  |
| コーディング階級 (S/A/B/C/D) も同一規則? |  |  |  |
| Axis 2 (IT Japanese) も同一規則? |  |  |  |

## 5.3 事前条件
- [ ] テスト用 mentee が複数難易度の coding 問題 / 試験を受験済
- [ ] 同一問題を異なる難易度で複数回受験している履歴がある

## 5.4 テストケース (vitest)

### TC-5.4.1 🔴 低難易度結果が高難易度スコアを上書きしない
- **手順:** `npm test -- axis-core-programming`
- **入力:** hard 80点 → 後に easy 100点を受験
- **期待:** スコアは hard 80点ベースを維持。easy は別扱い
- [ ] **結果:** `____`

### TC-5.4.2 🔴 難易度別に最高点を保持
- **手順:** 同上
- **入力:** hard 80点 / medium 70点 / easy 100点
- **期待:** 集計は hard が支配。medium/easy は表示用ヒストリのみ
- [ ] **結果:** `____`

### TC-5.4.3 🔴 同一難易度の再受験ポリシー
- **手順:** 同上、決定事項 5.2-② に従う
- **入力:** hard 80点 → hard 60点
- **期待 (最新採用なら):** 60点。**(最高採用なら):** 80点
- [ ] **結果:** `____`

### TC-5.4.4 🔴 難易度 NULL の安全な扱い
- **手順:** vitest で `coding_problems.difficulty=NULL` のケースを実行
- **期待:** クラッシュしない。デフォルトのバケット(`unknown` 等)に分類されるか除外される
- [ ] **結果:** `____`

### TC-5.4.5 🔴 既存 27件の vitest が PASS
- **手順:** `npm test -- scoring`
- **期待:** 既存テスト全 PASS
- [ ] **結果:** `____` / 件数: `____` / 27

### TC-5.4.6 🟡 統合: 試験提出後にダッシュボードのレーダー値が予測通り更新
- **手順:** mentee で試験提出 → `/dashboard` のレーダーチャートを確認
- **期待:** 低難易度試験で値が下がらない / 高難易度で値が上がる
- [ ] **結果:** `____`

### TC-5.4.7 🟡 コーディング階級表示
- **手順:** 同 mentee のコーディングランクバッジを確認
- **期待:** 決定事項 5.2-④ の規則に従う
- [ ] **結果:** `____`

## 5.5 回帰テスト
- [ ] 既存 `attitude_culture_skills` / `japanese_skills` / `coding_skills` の他軸計算は変わらない
- [ ] `dispatch_readiness_scores` テーブルへの書き込みエラーなし
- [ ] 試験提出フロー全体 (quiz / coding / comprehensive) で 500 エラーなし

---

# 統合受入チェック (Final Sign-off)

すべての項目 PASS 後にチェック。

- [ ] ① ダッシュボード進捗率改善 — 全🔴 PASS
- [ ] ② テストアカウント整理 — test 環境で全🔴 PASS (本番反映は別承認)
- [ ] ③ ユーザー名表記統一 — 全🔴 PASS
- [ ] ④ プロフィール画面項目整理 — 全🔴 PASS
- [ ] ⑤ 五角形スコア改善 — 全🔴 PASS
- [ ] 全 vitest PASS (`npm test`)
- [ ] 本番ビルド成功 (`npm run build`)
- [ ] CI (GitHub Actions) `build` + `lint-and-test` PASS
- [ ] Vercel Preview デプロイ成功
- [ ] 主要 3 画面 (ダッシュボード / プロフィール / ランキング) の手動回帰確認

| サインオフ | 担当 | 日付 |
|---|---|---|
| 開発者 |  |  |
| QA |  |  |
| 承認 (本番反映) |  |  |

---

## 補足

- 本仕様書は **修正前のスコープマップに基づくチェックリスト**。実装中に追加・変更が出たら本ファイルを更新する。
- 「決定事項記入欄」は実装着手前に埋めること。空欄のまま実装すると判定基準が定まらず PASS 判定不能。
- 失敗ケースは GitHub Issue に切り出して別途追跡推奨。
