# プロジェクトコーディング規約 (project_rules)

J-Bridge のコーディング・DB 規約。詳細な貢献フローは [docs/CONTRIBUTING.md](./docs/CONTRIBUTING.md) 参照。

---

## 1. 技術スタック

- **Framework**: Next.js 16 (App Router) — *過去 v14 から段階的に更新*
- **Language**: TypeScript 5 (strict mode)
- **Styling**: Tailwind CSS 4
- **Backend**: Supabase (PostgreSQL + Auth + Storage)
- **Validation**: Zod 4

詳細は [README](./README.md) と [docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md)。

---

## 2. コーディング・スタイル

- コンポーネントは小さく分離し、責務を 1 つに保つ
- 変数名は直感的・記述的に (短縮形は避ける、`u` ではなく `user`)
- Server Action 冒頭で `requireAuth` / `requireAdmin` / `requireAdminOrMentor` を使用 ([auth-helpers.ts](./src/lib/auth-helpers.ts))
- ActionResult 型と ERR 定数を使用 ([action-types.ts](./src/lib/action-types.ts))
- 環境変数は必ず `src/lib/env.ts` 経由 (Zod 検証済み)

---

## 3. DB ネーミング規約

| 区分 | 規約 | 例 |
|---|---|---|
| テーブル名 / カラム名 | `snake_case` (複数形) | `japanese_skills`, `vocab_mastery` |
| Primary Key | `UUID`, `uuid_generate_v4()` | `id UUID PRIMARY KEY DEFAULT uuid_generate_v4()` |
| Timestamp | `TIMESTAMPTZ`, `NOW()` 既定値 | `created_at TIMESTAMPTZ DEFAULT NOW()` |
| Boolean | `is_` 接頭辞 | `is_correct`, `is_published`, `is_sample` |
| Foreign Key | `{参照テーブル単数}_id` | `user_id`, `course_id`, `quiz_id` |
| 正規化スコア | `{項目}_normalized` または `{項目}_score` (0-100, SMALLINT) | `jlpt_score SMALLINT` |
| ソート順 | `sort_order INTEGER DEFAULT 0` | |
| Soft delete | **未使用** — CASCADE で物理削除 | |

---

## 4. RLS 必須

新規テーブル作成時は必ず:
1. `ALTER TABLE <name> ENABLE ROW LEVEL SECURITY;`
2. SELECT / INSERT / UPDATE / DELETE 各 cmd にポリシー定義
3. [docs/security/RLS_MATRIX.md](./docs/security/RLS_MATRIX.md) に行追加

---

## 5. ファイル配置

| 種別 | 配置 |
|---|---|
| ルート (App Router) | `src/app/(main)/<route>/page.tsx` |
| Server Action | `src/app/actions/<feature>.ts` (admin は `src/app/actions/admin/`) |
| API Route | `src/app/api/<endpoint>/route.ts` |
| 共有コンポーネント | `src/components/<category>/<Name>.tsx` |
| ロジック・モジュール | `src/modules/<domain>/` (純関数 + DB 連携分離) |
| ライブラリ | `src/lib/<topic>/` |

---

## 6. テスト

- 単体テストは Vitest (`*.test.ts`)
- スコアリング系は `src/modules/scoring/` のテスト 33 件をリファレンスに
- 重要な Server Actions にはテストを追加することが望ましい
