# J-Bridge

韓国人 IT エンジニアを教育し、日本企業へ派遣するための社内 LMS (Learning Management System)。

> **License**: UNLICENSED (社内利用専用 / proprietary). 詳細は [LICENSE](./LICENSE) を参照。

---

## 主な機能

- **派遣レディネス・ダッシュボード** — 5 軸レーダーチャート + Paiza 風コーディング等級バッジ
- **日本語カリキュラム** — JLPT N5〜N1 対策 + IT/ビジネス日本語
- **コーディング・スキル評価** — S / A / B / C / D 等級システム (Judge0 自動採点)
- **クイズ & コーディング演習** — 問題プール + 自動採点 + 解説
- **ランキング** — 3 ヶ月シーズン制 (総合 + カテゴリ別)
- **管理者ダッシュボード** — アカウント管理 / コンテンツ CRUD / 課題割当 / フィードバック
- **AI コードレビュー** — 日本のコーディング規約に沿ったフィードバック
- **TTS 音声** — Google Cloud TTS + Supabase Storage キャッシュ

---

## クイックスタート

### 必要環境

- Node.js 20.x 以上
- npm 10.x 以上
- Supabase アカウント (無料プラン可)
- Google Cloud アカウント (TTS API 有効化)
- Judge0 環境 (self-hosted または RapidAPI)

### セットアップ手順

```bash
# 1. リポジトリ取得
git clone <repo-url> j-bridge
cd j-bridge

# 2. 依存関係のインストール
npm ci

# 3. 環境変数の設定 (.env.example をコピー → .env.local を作成 → 値を埋める)
cp .env.example .env.local
#    詳細は ./docs/SECRETS_ROTATION.md を参照

# 4. 開発サーバー起動
npm run dev
# → http://localhost:3000
```

### 環境変数

`.env.example` を参照してください。本番・CI で使用するシークレットは **GitHub Repository → Settings → Secrets and variables → Actions** を Source of Truth として管理しています (デプロイ先ホストにも同期)。**個人の `.env.local` を Git に commit してはなりません** (`.gitignore` 済)。詳細は [docs/SECRETS_ROTATION.md](./docs/SECRETS_ROTATION.md) 参照。

---

## 開発コマンド

| コマンド | 用途 |
|---|---|
| `npm run dev` | 開発サーバー (localhost:3000) |
| `npm run build` | 本番ビルド (TypeScript strict チェック有効) |
| `npm run start` | 本番ビルド成果物の起動 |
| `npm run lint` | ESLint 9 |
| `npm test` | Vitest 単体テスト (run mode) |
| `npm run test:watch` | Vitest watch mode |
| `npm run test:coverage` | カバレッジレポート |

---

## 技術スタック

| 区分 | 採用技術 |
|---|---|
| Framework | Next.js 16 (App Router) + React 19 |
| Language | TypeScript 5 (strict) |
| Styling | Tailwind CSS 4 |
| Backend / DB | Supabase (PostgreSQL + Auth + Storage) |
| Auth (SSR) | `@supabase/ssr` |
| Validation | Zod 4 |
| Data Fetching | TanStack React Query 5 |
| Chart | Recharts 3 |
| Code Editor | `@monaco-editor/react` |
| Code Execution | Judge0 (self-hosted / RapidAPI) |
| TTS | Google Cloud Text-to-Speech |
| Test | Vitest 4 + Playwright (E2E) |

---

## ディレクトリ構成

```
src/
  app/
    (main)/        # ルートグループ (admin, dashboard, japanese, coding, exam, etc.)
    actions/       # Server Actions (38 ファイル)
    api/           # API Routes (tts, judge0 proxy, admin/tts-precache)
  components/      # 共有 UI コンポーネント
  lib/
    supabase/      # Supabase Client (server/client/types)
    judge0/        # Judge0 API クライアント
    code-review/   # AI コードレビュー解析
    auth-helpers.ts
    env.ts
  modules/
    scoring/       # 5 軸スコア計算ロジック (純関数 + DB 連携)

supabase/
  migrations/      # 170 マイグレーション

docs/
  HANDOVER.md      # 運用者向け引継ぎ書
  ARCHITECTURE.md  # アーキテクチャ概要
  CONTRIBUTING.md  # 貢献ガイド
  SECRETS_ROTATION.md  # シークレット・ローテーション
  DATA_HANDLING.md # PII 取扱方針
  PRD.md           # プロダクト要件定義
  manual/          # 利用マニュアル (admin/mentor/mentee × ja/ko)
```

---

## デプロイ

1. `main` ブランチへの push → 本番自動デプロイ (デプロイ先ホストの設定に依存)
2. PR → Preview デプロイ (使用している場合)
3. CI / シークレット管理は **GitHub Actions + GitHub Secrets**

詳細は [docs/HANDOVER.md](./docs/HANDOVER.md) を参照。

---

## ドキュメント・インデックス

| 用途 | 文書 |
|---|---|
| **新規参画者向け** | この README → [docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md) → [DB_Schema.md](./DB_Schema.md) |
| **運用者向け** | [docs/HANDOVER.md](./docs/HANDOVER.md) — 障害対応・コスト・バックアップ |
| **コントリビューター向け** | [docs/CONTRIBUTING.md](./docs/CONTRIBUTING.md) — ブランチ戦略・PR 規約 |
| **セキュリティ管理** | [docs/SECRETS_ROTATION.md](./docs/SECRETS_ROTATION.md) / [docs/security/RLS_MATRIX.md](./docs/security/RLS_MATRIX.md) |
| **PII 取扱** | [docs/DATA_HANDLING.md](./docs/DATA_HANDLING.md) |
| **プロダクト要件** | [docs/PRD.md](./docs/PRD.md) |
| **機能一覧** | [docs/FEATURE_LIST.md](./docs/FEATURE_LIST.md) |
| **変更履歴** | [CHANGELOG.md](./CHANGELOG.md) |
| **AI 開発エージェント** | [CLAUDE.md](./CLAUDE.md) (Claude Code 用コンテキスト) |
| **コーディング規約** | [project_rules.md](./project_rules.md) |

---

## ロール

| ロール | 役割 |
|---|---|
| `admin` | アカウント生成・管理、コンテンツ CRUD、課題割当、全社員閲覧、フィードバック |
| `mentor` | 学習状況の閲覧、コードレビュー、フィードバック |
| `mentee` | 学習、試験受験、本人スコア / ランキング閲覧 |

メンターは `mentor_specialty` (`japanese` / `tech`) によって権限が細分化される。詳細は [docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md) の権限マトリクス参照。

---

## サポート / お問い合わせ

社内 issue トラッカーまたは社内 Slack チャンネル `#j-bridge-dev` まで。
