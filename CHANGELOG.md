# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Security (2026-06-11 全体コードレビュー後続 — P0〜P3)
- `quiz_question_options` の SELECT ポリシーを admin/mentor に制限 — 正解 (`is_correct`) が全認証ユーザーから直接照会可能だった問題を修正。採点・本人レビュー・コード読解クイズは service role 経由に切替 (00178)
- `'use server'` モジュールからの認証なし service-role 関数の露出を遮断: exam-scheduling の `'use server'` 除去、`createNotification`/`deleteNotificationsByRelatedId` を `lib/notification-helpers` へ移動、`runCode` に `requireAuth`、learning-assignments 4 関数にガード、`scores.ts` の `recalculateUserScores` re-export 除去
- CSV エクスポートの数式インジェクション対策 (`admin/backup` — `=`/`+`/`-`/`@` 先頭セルを無害化)
- BFF readiness API キー比較を `timingSafeEqual` 化
- `lib/supabase/server.ts` / `lib/env.ts` に `server-only` ガード追加

### Fixed
- 総合試験: 出題セットを全試験タイプで永続化 — 受験中リロードで問題が再抽選されるバグを解消 (`comprehensive_exam_questions` 活用、レガシー再生成フォールバックも撤去)
- Step1 ブレンディングの丸め超過 (60 問試験に 64 問出題・分布歪み) を修正、Step1〜3 選抜ロジックを `pickByCategoryAndDifficulty` に統合 (回帰テスト 5 件追加)
- `submitExam`: 回答の重複除去・出題セット検証・スコア 100 クランプ、二重提出ガード (status 条件付き update + `00180` UNIQUE 制約)
- スコア再計算: DB 読み書きエラーを検査 — 一時障害時に全軸 0 点で実データを上書きする事故を防止 (`recalculateUserScores` は失敗時 success:false)
- 再試験の重複リクエスト防止 + サイクル完了判定を `exam_cycle_id` FK ベースへ (再試験がサイクル試験をシャドーイングする問題を解消)
- 聴解: TTS キャッシュ未生成の問題を Step1 出題から除外する安全装置 / パーサーを `lib/listening.ts` に一本化し `tts-precache` が試験・練習両方のキャッシュキーをウォーム (キャッシュキー不一致による再生不可の根本対策)
- 読解/聴解の選択肢長バイアス (正解=唯一最長、83 問) を修正 (00179)

### Changed
- NotificationBell のポーリングを 5 秒 → 30 秒 + タブ非表示時は停止 (ユーザー毎時 ~1,400 → ~120 リクエスト)
- `submitExam` 完了処理を高速化: 採点クエリ並列化・メンター通知の並行実行・サイクル完了時の重複スコア再計算を除去
- 通知ヘルパー (`notifyMentorsOf`/`notifyAdmins`) を受信者毎の逐次 insert → バルク insert に
- `recalculateAllScores` を 5 人単位のチャンク並列に (タイムアウト対策)
- 偏ったシャッフル `sort(() => Math.random() - 0.5)` 7 箇所を Fisher-Yates (`shuffleArray`) に置換
- アンチチート処理を `useAntiCheat` フックに共通化 (ExamClient / QuizTaker)
- Step5 カテゴリ重みのインラインリテラルを `assessment-config` 定数へ
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
- `@tanstack/react-query` 依存 (マウントのみで使用 0 件、全ページ ~13KB gzip 削減)
- 死蔵コード: `lib/supabase/queries/{profiles,courses,quizzes,vocabulary}.ts` (16 関数・参照 0)、`EarnedBadges.tsx`、無動作の 1-attempt ガード 3 箇所、`AdminCoursesClient` の死蔵関数 + 文字化けキー (~130 行)
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
