# アーキテクチャ概要 (ARCHITECTURE)

J-Bridge のアーキテクチャ全体像と詳細ドキュメントへの索引。新規参画者は本書 → 各章で詳細を参照する。

---

## 1. アーキテクチャ・スタイル

**Next.js 16 (App Router) を中心としたフルスタック・モノリス + Supabase BFF 構成**

```
┌──────────────────────────────────────────────────────────────────┐
│  Browser                                                         │
└────────────────────────────┬─────────────────────────────────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────────────────────┐
│  Next.js 16 (GitHub Actions self-deploy)                         │
│  ┌────────────────┐  ┌────────────────┐  ┌──────────────────┐    │
│  │ Server Comps   │  │ Server Actions │  │ API Routes       │    │
│  │ (page.tsx)     │  │ ('use server') │  │ (route.ts)       │    │
│  └────────┬───────┘  └────────┬───────┘  └────────┬─────────┘    │
│           │                   │                   │              │
│           ▼                   ▼                   ▼              │
│  ┌────────────────────────────────────────────────────────────┐  │
│  │  Lib / Modules Layer                                       │  │
│  │  - lib/supabase/    - lib/judge0/    - modules/scoring/    │  │
│  │  - lib/auth-helpers - lib/code-review                      │  │
│  └─────────────────────────┬──────────────────────────────────┘  │
└────────────────────────────┼─────────────────────────────────────┘
                             │
            ┌────────────────┼────────────────┐
            ▼                ▼                ▼
   ┌────────────────┐ ┌────────────┐ ┌────────────────────┐
   │ Supabase       │ │ Judge0 CE  │ │ Google Cloud TTS   │
   │ - PostgreSQL   │ │ (採点)      │ │ (音声合成)          │
   │ - Auth (RLS)   │ │            │ │                    │
   │ - Storage      │ │            │ │                    │
   └────────────────┘ └────────────┘ └────────────────────┘
```

**主な特徴:**
- Server Components による SSR + Server Actions による Mutation
- データレイヤーは Supabase が一手に担う (Auth + DB + Storage)
- 採点 (Judge0) と TTS (Google) は外部 API として分離

---

## 2. ディレクトリ構成と責務

```
src/
├── app/                       # ルーティング (App Router)
│   ├── (main)/                # 認証必須エリア (admin/dashboard/japanese/coding/exam)
│   ├── actions/               # Server Actions (38 ファイル)
│   │   └── admin/             # admin 専用 Actions (9 ファイル)
│   └── api/                   # Route Handlers (tts, judge0 proxy)
├── components/                # 共有 UI (約 60 個)
├── lib/
│   ├── supabase/              # Supabase クライアント + 型
│   ├── judge0/                # Judge0 REST ラッパー
│   ├── code-review/           # AI コードレビュー解析
│   ├── auth-helpers.ts        # requireAuth/requireAdmin/requireAdminOrMentor
│   ├── action-types.ts        # ActionResult 型 + ERR 定数
│   └── env.ts                 # Zod 検証済み環境変数
└── modules/
    └── scoring/               # 5 軸スコア計算 (純関数 + DB 連携)

supabase/
└── migrations/                # 170 マイグレーション
```

詳細は [02_folder_responsibility.md](./architecture/02_folder_responsibility.md) 参照。

---

## 3. データ・モデル

**核心は 5 軸レーダーチャート + コーディング等級**

| 軸 | テーブル | 計算ロジック |
|---|---|---|
| 1. JLPT | `japanese_skills.jlpt_score` | `modules/scoring/axis-jlpt.ts` |
| 2. IT 日本語 | `japanese_skills.it_japanese_score` | `modules/scoring/axis-jlpt.ts` |
| 3. コア・プログラミング | `coding_skills.core_score` | `modules/scoring/axis-core-programming.ts` |
| 4. フレームワーク | `coding_skills.framework_score` | `modules/scoring/axis-core-programming.ts` |
| 5. 姿勢・文化 | `attitude_culture_skills.score` | `modules/scoring/axis-attitude-culture.ts` |

→ `dispatch_readiness_scores` テーブルに集計、レーダーチャートで可視化。

詳細は [04_data_architecture.md](./architecture/04_data_architecture.md) と [DB_Schema.md](../DB_Schema.md) 参照。

---

## 4. 認証・認可

- **Supabase Auth** (JWT セッション) + **`@supabase/ssr`** で Cookie-based SSR
- **Middleware** (`src/middleware.ts`) でルートガード + RBAC
- **Server Action** 冒頭で `requireAuth` / `requireAdmin` / `requireAdminOrMentor` ヘルパー使用 ([auth-helpers.ts](../src/lib/auth-helpers.ts))
- **DB レベル**: PostgreSQL RLS ポリシー ([RLS_MATRIX.md](./security/RLS_MATRIX.md))

ロール:

| ロール | 内容 |
|---|---|
| `admin` | 全機能 |
| `mentor` (specialty: japanese / tech / null) | 担当メンティー閲覧、コードレビュー、フィードバック (権限はマトリクスで詳細管理) |
| `mentee` | 学習 + 受験 + 自分のスコア閲覧 |

権限マトリクスは [README#ロール](../README.md) 参照。

詳細は [06_security_design.md](./architecture/06_security_design.md) 参照。

---

## 5. ランタイムフロー

### 5-1. ログイン → ダッシュボード
1. `/login` で Supabase Auth → JWT を Cookie にセット
2. Middleware が `(main)` ルートで認証確認 → `profiles.role` で RBAC
3. `dashboard/page.tsx` (RSC) が並列クエリで stat / 進捗 / ランキングを取得
4. `<DashboardClient>` (CC) が React Query + Recharts で描画

### 5-2. クイズ受験 → スコア反映
1. `quiz/[quizId]/page.tsx` が問題と選択肢を取得 (Fisher-Yates でシャッフル)
2. ユーザー解答 → Server Action `submitQuizAnswers` で `quiz_attempts` + `quiz_answers` 保存
3. `recalculateUserScores` で関連軸の再計算 → `dispatch_readiness_scores` 更新
4. レーダーチャートが次回ログイン時に反映

### 5-3. コード提出 → 採点
1. Monaco エディタ → Server Action `submitCode`
2. `lib/judge0/client.ts` 経由で Judge0 にバッチ提出 → polling で結果取得
3. `code_submissions` + `code_reviews` (AI レビュー結果) 保存
4. `coding_skills` 更新 → 5 軸スコア再計算

詳細は [03_runtime_flow.md](./architecture/03_runtime_flow.md) 参照。

---

## 6. ネットワーク & インフラ

詳細は [05_network_and_infrastructure.md](./architecture/05_network_and_infrastructure.md) 参照。

要点:
- GitHub Actions による自前デプロイ (ホスト環境は社内インフラ)
- Supabase はマルチリージョン PostgreSQL
- TTS 結果は Supabase Storage (`tts-cache` bucket) でハッシュキー・キャッシュ

---

## 7. ドメインモデル — 試験

詳細は [07_exam_and_domain_model.md](./architecture/07_exam_and_domain_model.md) 参照。

要点:
- **理解度テスト**: 動的出題 (問題 + 解答ランダム化、5 段階クイズ)
- **総合試験**: サイクル制 (3 ヶ月 / 14 日経過自動承認)、カテゴリ別ブレンド (CYCLE_QUIZ_TYPES)
- 採点アルゴリズム + 等級換算 (S > A > B > C > D)

---

## 8. スケーラビリティ分析

詳細は [08_scalability_analysis.md](./architecture/08_scalability_analysis.md) 参照。

ボトルネック候補:
- Judge0 同時実行数 (self-hosted の場合 CPU 律速)
- TTS 月間文字数クォータ
- Supabase Egress (大量ダウンロード時)
- N+1 クエリ (一部 admin 画面で最適化済 — JLPT は 43→7 クエリ)

---

## 9. リファクタリング候補

詳細は [09_refactoring_candidates.md](./architecture/09_refactoring_candidates.md) 参照。

主な技術的負債:
- Supabase joined query の型キャスト (`as unknown as`) — 部分的に Phase C で改善
- Server Actions の重複ロジック
- 一部コンポーネントが大きすぎ (>500 行) — 分割可能

---

## 10. 学習ロードマップ

詳細は [10_learning_roadmap_for_architect.md](./architecture/10_learning_roadmap_for_architect.md) 参照。

新規参画者向けの段階的学習パス。
