## 概要

<!-- 何を、なぜ変更したかを 2-3 行で -->

## 種別

- [ ] feat: 新機能
- [ ] fix: バグ修正
- [ ] refactor: リファクタリング
- [ ] docs: ドキュメント
- [ ] chore: 雑務 (依存関係、設定等)
- [ ] perf: パフォーマンス改善

## 関連 Issue / 背景

<!-- Closes #123 / 背景となるドキュメントへのリンク -->

## 変更内容

<!-- 主要な変更点を箇条書きで -->
-
-

## DB マイグレーション

- [ ] マイグレーションなし
- [ ] あり (番号: `00___`)
  - [ ] RLS ポリシー定義済み
  - [ ] [DB_Schema.md](../DB_Schema.md) 更新済み
  - [ ] [docs/security/RLS_MATRIX.md](../docs/security/RLS_MATRIX.md) 更新済み

## テスト

- [ ] `npm run lint` 通過
- [ ] `npm run build` 通過
- [ ] `npm test` 通過
- [ ] ローカルで動作確認済み (画面 / API)

### 確認手順

<!-- レビュアーが再現するための手順 -->
1.
2.

## スクリーンショット / 動画

<!-- UI 変更時は必須 -->

## チェックリスト

- [ ] [CONTRIBUTING.md](../docs/CONTRIBUTING.md) を確認した
- [ ] PII の扱いが [DATA_HANDLING.md](../docs/DATA_HANDLING.md) に準拠している
- [ ] 環境変数を追加した場合、`.env.example` と `src/lib/env.ts` 両方を更新した
- [ ] 認可チェック (`requireAuth` / `requireAdmin` 等) が漏れていない
- [ ] CHANGELOG.md に記載した (機能変更の場合)
