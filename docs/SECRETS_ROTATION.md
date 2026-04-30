# シークレット・ローテーション・ガイド (SECRETS ROTATION)

J-Bridge が依存する 4 種類のシークレットの**発行 → 切替 → 旧鍵の失効**手順をまとめる。**最低でも四半期に 1 回**実施する。

## 対象シークレット一覧

| # | キー名 | 発行元 | 用途 | 漏洩時の影響 |
|---|---|---|---|---|
| 1 | `NEXT_PUBLIC_SUPABASE_URL` | Supabase | DB 接続 URL | 公開前提 (RLS で保護) |
| 2 | `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase | クライアント用匿名 JWT | 公開前提 (RLS で保護) |
| 3 | `SUPABASE_SERVICE_ROLE_KEY` | Supabase | RLS バイパス可能な管理キー | **致命的** — 全データ漏洩 |
| 4 | `GOOGLE_CLOUD_TTS_API_KEY` | Google Cloud | TTS 合成課金キー | 課金被害 |
| 5 | `JUDGE0_API_KEY` (RapidAPI / self-hosted token) | Judge0 / RapidAPI | コード実行 API | 課金被害 + 任意コード実行 |

## 鍵保管場所

本プロジェクトは **GitHub** を社内シークレット管理の中心に据える。

| 環境 | 保管場所 | 反映方法 |
|---|---|---|
| CI / CD | GitHub Repository → Settings → Secrets and variables → Actions | `${{ secrets.NAME }}` で `.github/workflows/*.yml` から参照 |
| 本番 (Production) | デプロイ先のホスト側設定 (Vercel / Cloudflare 等) | デプロイ時に GitHub Secrets と同期。GitHub の値を Source of Truth とする |
| 開発者ローカル | 各個人の `.env.local` (Git 管理対象外、`.gitignore` 済) | 各自が GitHub Secrets の値をコピー |

`.env.example` に**形式のみ**を記載 (値は記載しない)。

---

## ローテーション手順

### Step 0: 事前準備

- [ ] 実施担当者 1 名と承認者 1 名を決める
- [ ] 実施日時を決める (極力アクセスの少ない時間帯)
- [ ] GitHub Repository (Settings 編集権限)・Supabase・Google Cloud Console・Judge0/RapidAPI の管理者ログインを準備
- [ ] Vercel 等のデプロイ先ホストを使用している場合は、その管理画面ログインも準備

### Step 1: 新キーの発行

#### 1-A. Supabase (`SUPABASE_SERVICE_ROLE_KEY`)
1. Supabase Dashboard → Project Settings → API
2. `service_role` の "Reset" を実行 → **新キー発行 (旧キーは即時無効化)**
3. 同画面で `anon` キーも同時にローテーション可能 (任意)

> **注意**: `service_role` を Reset すると旧キーは即無効。**Vercel 側に新キーを反映してから本番で動作確認**するために、Reset 直前に新キーをコピーしてから、迅速に Vercel を更新する。

#### 1-B. Google Cloud TTS (`GOOGLE_CLOUD_TTS_API_KEY`)
1. Google Cloud Console → API & Services → Credentials
2. **新規 API Key を作成** (Cloud Text-to-Speech API のみに制限)
3. HTTP リファラ制限または IP 制限を設定
4. **旧キーはまだ削除しない** (Step 4 で削除)

#### 1-C. Judge0 (`JUDGE0_API_KEY`)
- **RapidAPI 経由**: Dashboard → Apps → Security → Rotate Key
- **Self-hosted**: 環境変数 `AUTHN_TOKEN` を再生成し、Judge0 サーバを再起動

### Step 2: GitHub Secrets に新キーを反映

1. GitHub Repository → **Settings** → **Secrets and variables** → **Actions**
2. 対象 secret の `Update` から新しい値を貼り付け → `Save`
3. 必要に応じて Environment 別 (`production` / `preview`) に分けて管理
4. (オプション) Vercel など別ホストで本番デプロイしている場合、そちらの環境変数も同期する

### Step 3: 再デプロイ

#### GitHub Actions 経由でデプロイしている場合
1. main ブランチに空コミット (`git commit --allow-empty -m "chore: trigger deploy after secret rotation"`) または手動 workflow trigger
2. Actions タブでデプロイ完了確認

#### Vercel Git Integration を併用している場合
1. Vercel Dashboard → Deployments → Latest → "Redeploy" (Use existing Build Cache を OFF)

#### 共通: 動作確認
- [ ] ログイン (Supabase 接続確認)
- [ ] 任意の TTS 再生 (Google TTS 確認)
- [ ] 任意のコード提出 (Judge0 確認)
- [ ] 管理者画面のユーザー一覧表示 (service_role 確認)

### Step 4: 旧キーの削除

- Supabase: Reset 時に自動失効済み
- Google Cloud: Credentials 画面で旧キーを **削除**
- Judge0: 旧トークンを失効

### Step 5: 開発者個人 `.env.local` の更新依頼

- Slack / メールでチームに通知:
  - 新キーは **共有しない**
  - 各自が自分の Supabase / Google Cloud アカウントから新キーを取得 (個人 dev 環境用)
  - 本番キーは個人 PC に置かない

### Step 6: 完了記録

- [ ] `docs/security/ROTATION_LOG.md` (なければ新規) に実施日・担当・対象キーを追記
- [ ] 監査用に Supabase ダッシュボード / GitHub Audit log / デプロイ先ホストのアクティビティログをスクリーンショット保存

---

## 緊急対応 (キー漏洩時)

漏洩を検知した場合、Step 1 → Step 2 → Step 3 → Step 4 を **即時実施**する。
さらに次を行う:
1. Supabase `audit_log` テーブルを過去 24 時間分エクスポートし、不審アクセスを確認
2. Google Cloud Billing で異常課金を確認
3. 法務・セキュリティ責任者へ報告

## 参考

- Supabase: https://supabase.com/dashboard/project/_/settings/api
- Google Cloud: https://console.cloud.google.com/apis/credentials
- GitHub Actions Secrets: https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions
- Vercel Env (使用している場合): https://vercel.com/docs/projects/environment-variables
