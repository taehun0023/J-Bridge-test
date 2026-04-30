# 引継ぎ書 (HANDOVER)

J-Bridge を社内保守チームへ引き継ぐ際の運用者向けドキュメント。新規参画者は本書 → [README](../README.md) → [ARCHITECTURE](./ARCHITECTURE.md) の順に読むこと。

---

## 1. システム構成図

```
┌──────────────────────────────────────────────────────────────────┐
│                         エンドユーザー (Browser)                   │
└─────────────────────────────┬────────────────────────────────────┘
                              │ HTTPS
                              ▼
┌──────────────────────────────────────────────────────────────────┐
│       GitHub Actions Self-Deploy (Next.js 16 App Router, SSR)    │
│  ┌────────────────┐ ┌────────────────┐ ┌────────────────────┐    │
│  │ Server Comps   │ │ Server Actions │ │ API Routes         │    │
│  │ (page.tsx)     │ │ (actions/*)    │ │ (api/tts, judge0)  │    │
│  └────────┬───────┘ └────────┬───────┘ └─────────┬──────────┘    │
└───────────┼──────────────────┼──────────────────┼──────────────────┘
            │                  │                  │
            ▼                  ▼                  ▼
┌──────────────────┐ ┌──────────────────┐ ┌──────────────────┐
│ Supabase         │ │ Google Cloud TTS │ │ Judge0 (CE)      │
│ - PostgreSQL     │ │  (音声合成)       │ │  (コード採点)     │
│ - Auth           │ │                  │ │                  │
│ - Storage        │ │                  │ │                  │
└──────────────────┘ └──────────────────┘ └──────────────────┘
```

---

## 2. アカウント引継ぎチェックリスト

| サービス | 引継ぎ項目 | 引継ぎ先 |
|---|---|---|
| **GitHub** | Repository Admin、Settings、Secrets and variables、Actions ログ、デプロイ用 workflow | 社内開発リーダー |
| **Supabase** | Project Owner、API キー、Storage | 社内 DBA |
| **Google Cloud** | Project Owner、Billing Account、TTS API | 社内インフラ管理者 |
| **Judge0** | self-hosted の場合: VM/Container アクセス. RapidAPI 経由の場合: アカウント所有権 | 社内インフラ管理者 |
| **本番サーバー** | GitHub Actions deploy ターゲット (SSH 鍵 / API トークン等) | 社内インフラ管理者 |
| **ドメイン** | DNS 管理権限 | 社内インフラ管理者 |

引継ぎ時に **すべてのシークレットを Reset** すること (詳細: [SECRETS_ROTATION.md](./SECRETS_ROTATION.md))。

---

## 3. 環境変数一覧

シークレットの Source of Truth は **GitHub Repository → Settings → Secrets and variables → Actions**。
本プロジェクトは GitHub Actions による自前デプロイを採用しており、追加のホスト管理画面は使用しない。

| 変数 | 用途 | 必須 | 設定場所 |
|---|---|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase 接続 URL | ✓ | GitHub Secrets + .env.local |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase 匿名 JWT | ✓ | GitHub Secrets + .env.local |
| `SUPABASE_SERVICE_ROLE_KEY` | RLS バイパス用 | ✓ | GitHub Secrets (ローカルは原則不要) |
| `JUDGE0_API_URL` | Judge0 エンドポイント | ✓ | GitHub Secrets + .env.local |
| `JUDGE0_API_KEY` | Judge0 認証 | △ | GitHub Secrets + .env.local |
| `GOOGLE_CLOUD_TTS_API_KEY` | TTS API | ✓ | GitHub Secrets + .env.local |

詳細形式は [.env.example](../.env.example) 参照。
ローテーション手順は [SECRETS_ROTATION.md](./SECRETS_ROTATION.md) 参照。

---

## 4. デプロイ・パイプライン

### 構成
- **CI**: `.github/workflows/ci.yml` — push/PR 時に lint + test:coverage + build 実行
- **Deploy**: GitHub Actions による自前 workflow (例: `.github/workflows/deploy.yml`)
- **Secrets**: GitHub Repository → Settings → Secrets and variables → Actions が Source of Truth

### 自動デプロイ
- `main` ブランチへの push → デプロイ workflow が自動 trigger
- PR 作成 → CI のみ実行 (build 検証)

### 手動操作
| 操作 | 場所 | 注意 |
|---|---|---|
| 環境変数変更 | GitHub Repository → Settings → Secrets and variables → Actions | 変更後、main 再 push または手動 workflow_dispatch で反映 |
| 手動デプロイ | GitHub → Actions → Deploy workflow → Run workflow | workflow_dispatch トリガが定義されている場合 |
| ロールバック | `git revert <bad-commit>` → main へ push (再デプロイ走る) | 環境変数も巻き戻る点に注意 |
| ドメイン変更 | DNS 管理画面 | DNS 反映に時間 |

### Branch Protection (推奨設定)
- `main` への直接 push 禁止 (PR 経由のみ)
- CI 失敗時の merge 禁止
- 1 名以上の approve 必須

---

## 5. 障害対応プレイブック

### 5-1. 全機能停止 (500 エラー連発)

1. GitHub → Actions → 直近の Deploy workflow ログ確認
2. Supabase Dashboard → Logs で DB エラー確認
3. 本番サーバーの直接ログ (SSH / 監視ツール) も確認
4. 解決まで時間がかかる場合は **直前の正常コミットへ `git revert` → push**
5. ステータスページ (社内 Slack `#j-bridge-incident`) に告知

### 5-2. 認証ループ / ログイン不可

- Supabase Auth の URL Configuration を確認 (`Site URL` と `Redirect URLs`)
- `NEXT_PUBLIC_SUPABASE_URL` の値が本番と一致するか確認
- Cookie ドメインの設定 (`@supabase/ssr`) が正しいか確認

### 5-3. TTS が再生されない

1. ブラウザコンソールで `/api/tts` のレスポンスコード確認
2. 401 → 認証セッションが切れている (再ログイン)
3. 500 → Google Cloud Console で TTS API クォータ・課金状況確認
4. 200 + 無音 → Supabase Storage の `tts-cache` バケット容量確認

### 5-4. コード採点が動かない (Judge0)

1. Judge0 サーバー (self-hosted) のヘルスチェック: `curl <JUDGE0_API_URL>/system_info`
2. RapidAPI 経由なら Plan のクォータ残量を確認
3. `JUDGE0_API_KEY` の有効期限確認

### 5-5. 採点結果が乱高下する (スコア計算バグ)

- `src/modules/scoring/` にユニットテスト 33 件あり、回帰検出可能
- `npm run test:coverage` で実行
- 影響範囲を見たい場合: `dispatch_readiness_scores` テーブルの `updated_at` で affected rows を絞り込み

---

## 6. データバックアップ・リストア

### 6-1. バックアップ

#### Supabase Database (推奨: 週次)
```bash
# Supabase CLI 経由
supabase db dump --project-ref <ref> -f backup_$(date +%Y%m%d).sql

# または Dashboard → Database → Backups (Pro プラン以上で自動日次バックアップ)
```

#### Storage (avatars / tts-cache)
```bash
# Supabase Storage はバージョン管理されないため定期 rsync 推奨
# tts-cache は再生成可能なので avatars のみで十分な場合あり
```

### 6-2. リストア

```bash
# 別環境 (staging) で先にテストすること
supabase db reset --project-ref <staging-ref>
psql <connection-string> < backup_20260430.sql
```

リストア後は必ず以下を確認:
- [ ] `audit_log` 件数が想定通り
- [ ] `profiles` の admin アカウントが正しい
- [ ] RLS ポリシーが有効化されている (`ALTER TABLE ... ENABLE ROW LEVEL SECURITY`)

---

## 7. コスト管理

| サービス | 料金体系 | 想定月額 (50 ユーザー規模) | 監視ポイント |
|---|---|---|---|
| 本番サーバー (GitHub Actions deploy ターゲット) | サーバー利用料 | (規模次第) | CPU・メモリ・帯域 |
| Supabase | Pro $25/proj + 従量 | $25〜$50 | DB サイズ (8GB 上限)、Egress |
| Google Cloud TTS | $4/100 万文字 (Neural2) | $5〜$30 | 月間文字数 |
| Judge0 (RapidAPI) | $10〜$50 | $10〜$50 | 月間 submissions |
| Judge0 (self-hosted) | VM 代のみ | $10〜$30 | CPU/メモリ |

### コスト監視
- Google Cloud → Billing → Budgets & alerts で **月 $50 で警告** 設定推奨
- Supabase → Usage タブで DB サイズ確認
- 本番サーバーの帯域・CPU 使用率を監視ツールで確認

---

## 8. 監査ログ

`audit_log` テーブルに以下のイベントが記録される:
- 管理者操作 (ユーザー作成/削除、コンテンツ CRUD、課題割当、フィードバック CRUD、再試験承認/却下、共有単語帳管理、学習課題割当)

### 確認方法
- 管理画面 → 監査ログ (`/admin/audit`)
- リソースタイプフィルタで絞り込み (quiz_questions, profiles, task_assignments, admin_feedbacks, quiz_attempts, learning_assignments)

### 保存期間
現状無期限。法務・コンプライアンス要件に応じて社内ポリシー策定すること。

---

## 9. PII (個人情報)

`profiles` テーブルに以下を保存:
- `email`, `display_name`, `avatar_url`, `mentor_specialty`, `role`

詳細・取扱方針は [DATA_HANDLING.md](./DATA_HANDLING.md) 参照。

---

## 10. 緊急連絡先 (引継ぎ時に更新)

| 区分 | 連絡先 |
|---|---|
| 開発リーダー | (社内入力) |
| インフラ責任者 | (社内入力) |
| Supabase サポート | https://supabase.com/dashboard/support/new |
| GitHub Support | https://support.github.com |
| Google Cloud サポート | https://cloud.google.com/support |

---

## 11. 引継ぎ後の最初の 30 日 — 推奨タスク

- Week 1: 環境変数・アカウント引継ぎ、ローカル環境構築、ARCHITECTURE.md 通読
- Week 2: 単純なバグ修正 PR を 1 件出して merge → デプロイまで体験
- Week 3: 監査ログとコスト監視のルーチン化
- Week 4: バックアップ・リストアのリハーサル (staging 環境)、シークレット・ローテーション 1 回実施
