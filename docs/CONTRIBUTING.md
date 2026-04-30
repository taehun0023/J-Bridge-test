# 貢献ガイド (CONTRIBUTING)

J-Bridge プロジェクトに変更を加える際のルールをまとめる。社内チーム向け。

---

## 1. ブランチ戦略

| ブランチ | 用途 |
|---|---|
| `main` | 本番デプロイ対象 (GitHub Actions Deploy workflow が自動追従) |
| `feature/<short-name>` | 新機能開発 |
| `fix/<issue-number-or-name>` | バグ修正 |
| `chore/<short-name>` | 雑務 (依存関係更新、ドキュメント等) |
| `hotfix/<issue>` | 本番障害の緊急修正 |

- `main` への直接 push は禁止 (Branch Protection)
- すべての変更は PR 経由

---

## 2. コミットメッセージ

[Conventional Commits](https://www.conventionalcommits.org/) に準拠:

```
<type>: <subject>

[optional body]
```

| type | 用途 |
|---|---|
| `feat` | 新機能 |
| `fix` | バグ修正 |
| `chore` | 雑務 |
| `docs` | ドキュメント |
| `refactor` | 機能変更を伴わないリファクタリング |
| `test` | テスト追加・修正 |
| `perf` | パフォーマンス改善 |
| `style` | フォーマットのみ |

例:
```
feat: add JLPT N3 listening quiz pool
fix: resolve auth redirect loop on Safari
docs: update HANDOVER for new mentor specialty
```

---

## 3. PR 作成フロー

1. issue を立てる (テンプレート使用)
2. `feature/...` ブランチを切る
3. コミットを作る (適度な粒度)
4. push → PR 作成 ([テンプレート](../.github/PULL_REQUEST_TEMPLATE.md) が自動表示)
5. CI 通過を確認 (`npm run lint && npm run build && npm test`)
6. レビュアー指名
7. Approve 取得 → Squash merge

---

## 4. レビュー方針

### レビュアーは以下を確認
- [ ] 仕様を満たしているか
- [ ] 既存の `auth-helpers` パターンに従っているか (Server Actions の認可)
- [ ] 新しいテーブル追加時に RLS ポリシーが定義されているか
- [ ] テストが追加されているか (バグ修正なら回帰テスト必須)
- [ ] PII の扱いが [DATA_HANDLING.md](./DATA_HANDLING.md) に準拠しているか
- [ ] コミットメッセージが規約に沿っているか

### 著者は以下を準備
- [ ] スクリーンショット/動画 (UI 変更の場合)
- [ ] 影響範囲の説明 (DB マイグレーションがある場合は必須)
- [ ] テスト方法の手順

---

## 5. ローカル開発フロー

```bash
# 1. main を最新化
git checkout main && git pull

# 2. ブランチ切る
git checkout -b feature/your-name

# 3. 開発
npm run dev

# 4. テスト
npm run lint
npm test
npm run build  # production build (TS strict チェック)

# 5. push
git push -u origin feature/your-name
```

---

## 6. データベース・マイグレーション

新規マイグレーション作成時は以下に従う:

1. 番号付け: `supabase/migrations/00171_xxx.sql` のように連番
2. 1 マイグレーション 1 トランザクション (BEGIN/COMMIT 不要、Supabase が自動)
3. 新規テーブル作成時は **必ず** `ALTER TABLE ... ENABLE ROW LEVEL SECURITY;` + ポリシー定義
4. [RLS_MATRIX.md](./security/RLS_MATRIX.md) に行を追加
5. [DB_Schema.md](../DB_Schema.md) に反映
6. ローカルで `supabase db reset` または該当 SQL を実行して検証

---

## 7. シークレット・環境変数

- ローカルは `.env.local` (Git 管理外)
- CI / 本番のシークレットは **GitHub Repository → Settings → Secrets and variables → Actions** を Source of Truth とする (デプロイ先ホストへ同期)
- 新規環境変数追加時は:
  1. `.env.example` に行を追加
  2. `src/lib/env.ts` に Zod スキーマを追加
  3. README の環境変数セクションを更新
  4. GitHub Secrets に値を登録 (Settings → Secrets and variables → Actions → New repository secret)

絶対に **`.env.local` を commit しない**。詳細は [SECRETS_ROTATION.md](./SECRETS_ROTATION.md)。

---

## 8. PR 例外規定

以下は PR を介さず main に直接 push 可能 (要 admin 権限):

- ドキュメント単独の typo 修正
- README/CHANGELOG の小修正
- 緊急ロールバック

ただし全ての場合で監査ログ (Slack `#j-bridge-dev` への通知) を残すこと。

---

## 9. 困ったとき

- 過去の判断は `git log --grep="<keyword>"` または GitHub Issues 検索
- アーキテクチャの背景は [ARCHITECTURE.md](./ARCHITECTURE.md) と `docs/architecture/`
- それでも不明な場合は社内 Slack `#j-bridge-dev` で質問
