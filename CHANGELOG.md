# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- 社内保守体制への移行に向けたドキュメント・コード整理 (Phase A〜E)
- README を全面改訂 (社内向け運用情報を反映)
- Google Cloud TTS API キーを URL クエリ → `X-Goog-Api-Key` ヘッダーに移行
- 死亡コード 3 ファイルを削除 (`src/app/actions/shared-vocab.ts`, `src/lib/normalize.ts`, `src/lib/normalize.test.ts`)
- `package.json` の `name` を `temp_next` → `j-bridge` に、`license` に `UNLICENSED` を明記
- `src/app/actions/admin/questions.ts` の `applyFilters` から `any` 型を排除 (構造的型に変更)
- 一時ガバナンス文書 (cs-* / dev-* / audit/) を 2 件の要約に統合し原本削除

### Added
- `LICENSE` (UNLICENSED proprietary)
- `docs/HANDOVER.md` (運用者向け引継ぎ書)
- `docs/ARCHITECTURE.md` (アーキテクチャ概要 + architecture/ への索引)
- `docs/SECRETS_ROTATION.md` (シークレット・ローテーション手順)
- `docs/security/RLS_MATRIX.md` (RLS ポリシー・マトリクス)
- `docs/CONTRIBUTING.md` (貢献ガイド)
- `docs/DATA_HANDLING.md` (PII 取扱方針)
- `.env.example` (環境変数テンプレート)
- `.github/dependabot.yml` (週次依存関係更新)
- `.github/PULL_REQUEST_TEMPLATE.md`, `.github/ISSUE_TEMPLATE/{bug,feature,content}.md`

### Removed
- `260225지시서.md`, `temp_jp_test.txt` (ルート残骸)
- `src/app/actions/admin/feedback.ts` の `console.log`

---

## マイルストーン (引継ぎ前のバージョン履歴)

[ac5b897] feat: 日本語学習 UI 再構成 + 作文(Beta) + コーディング学習(Beta)
[c9022e9] fix: CS quality audit — 8 categories B5-a length bias (00155~00163)
[1ffadb7] fix: BJ quality audit — 4 categories + data restore (00149~00154)
[e64c996] feat: exam review explanation display + claim resolve confirm UX
[ad57990] fix: JLPT N5 grammar answer-leak (00148) + audit utilities
[5e2d049] feat: exam content quality rubric + JLPT grammar overhaul (00145)
[e8e6551] feat: feedback routing fix, クレーム→問い合わせ, CS quiz shuffle, notification cleanup
[bb2e787] feat: CS governance, comprehensive exam migrations, dev practice pools
[b77836e] feat: CS/Dev lesson system with course progress (migrations 108-114)
[b185ae9] feat: keigo category, JLPT kanji quiz type, vocab expansion (migrations 97-103)
[6aec949] feat: pool quiz system, quiz review/retake mode (migrations 82-95)
[7827cc8] feat: Step1 JLPT blending activation, mentor dashboard, exam review
[ee6b55a] feat: admin dashboard charts, feedback relocation, JLPT seed expansion
[6d0f9da] feat: weakness report, glossary CRUD, listening TTS
[874402f] feat: exam cycle scheduling + gate UI
[d6f1c10] feat: tech mentor permissions, audit log expansion, CSV backup
[b27cce0] refactor: complete Phase 1-4 codebase refactoring
[0b33f90] feat: move TTS caching to Supabase Storage + bulk pre-cache

詳細は `git log` を参照。今後のリリースは Keep a Changelog 形式で本ファイルに追記する。

---

## 凡例

- **Added** — 新機能
- **Changed** — 既存機能の変更
- **Deprecated** — 将来削除予定
- **Removed** — 削除
- **Fixed** — バグ修正
- **Security** — 脆弱性対応
