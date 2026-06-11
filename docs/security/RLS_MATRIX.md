# RLS (Row Level Security) ポリシー・マトリクス

**最終更新**: 2026-06-11 (マイグレーション 00180 時点)
**対象**: Supabase PostgreSQL の全テーブル (48 テーブル)

> **00178 変更点**: `quiz_question_options` の SELECT を admin/mentor に制限 (正解 `is_correct` の露出遮断)。一般ユーザーの表示は `quiz_question_options_safe` ビュー経由、採点・レビューは service role 経由。

本文書は J-Bridge の RLS ポリシーをカテゴリ別に整理し、データアクセス境界の**設計意図**と**現状**を明文化する。新規テーブル追加時、または RLS 関連の本番障害発生時の参照基準とする。

---

## 1. ヘルパー関数

RLS ポリシーは以下のヘルパー関数を共通利用する。定義は `supabase/migrations/00019_admin_rls_policies.sql`, `00030_mentor_rls_policies.sql`, `00035_mentor_mentee_rls.sql` 参照。

| 関数 | 戻り値 | 用途 |
|---|---|---|
| `is_admin()` | bool | 呼出ユーザーが `profiles.role = 'admin'` か判定 |
| `is_admin_or_mentor()` | bool | admin または mentor (specialty 問わず) |
| `is_mentor_of(target_user_id UUID)` | bool | 呼出ユーザーが対象メンティーの担当メンターか |

> **重要**: `service_role` キーで接続したクライアントは RLS をバイパスする。サーバーアクション内で `createServiceRoleClient()` を使う際は、必ず `requireAuth` / `requireAdmin` 等のアプリ層認可と組み合わせること。

---

## 2. テーブルカテゴリ別ポリシー設計

### 2-1. ユーザー & スキル系 (9 テーブル)

| テーブル | SELECT | INSERT | UPDATE | DELETE | 備考 |
|---|---|---|---|---|---|
| `profiles` | 自分 / admin / mentor (担当のみ) | service_role のみ | 自分 (一部) / admin | admin | 新規アカウントは `auth.users` のトリガで自動作成 |
| `japanese_skills` | 自分 / admin / mentor | 自動 (scoring) | 自動 (scoring) | admin | scoring モジュールが service_role 書込 |
| `coding_skills` | 自分 / admin / mentor | 自動 | 自動 | admin | 同上 |
| `attitude_culture_skills` | 自分 / admin / mentor | 自動 | 自動 | admin | 同上 |
| `dispatch_readiness_scores` | 自分 / admin / mentor | 自動 | 自動 | admin | 同上 |
| `enrollments` | 自分 / admin | 自分 (受講申込) | 自分 / admin | admin | |
| `lesson_progress` | 自分 / admin | 自分 (受講記録) | 自分 (進捗更新) | admin | |
| `personal_vocab` | 自分のみ | 自分のみ | 自分のみ | 自分のみ | PII 含む — admin も読まない設計 |
| `shared_vocab_submissions` | 全員 (公開) | 認証済全員 | 自分 / admin | 自分 / admin | 投稿型コンテンツ |

### 2-2. コンテンツ系 (7 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `courses` | 全員 (公開) | admin / tech mentor |
| `lessons` | 全員 | admin / tech mentor |
| `lesson_resources` | 全員 | admin / tech mentor |
| `coding_problems` | 全員 | admin / tech mentor |
| `coding_test_cases` | 全員 (隠れケースのみ admin) | admin / tech mentor |
| `projects` | 全員 | admin / tech mentor |
| `project_requirements` | 全員 | admin / tech mentor |

### 2-3. クイズ系 (5 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `quizzes` | 全員 (`is_published=true` のみ非 admin) | admin / tech mentor |
| `quiz_questions` | 全員 | admin / tech mentor |
| `quiz_question_options` | admin / mentor のみ (一般は `quiz_question_options_safe` ビュー経由 — 00178) | admin / tech mentor |
| `quiz_attempts` | 自分 / admin / mentor (担当) | 自分 (受験時) |
| `quiz_answers` | 自分 / admin / mentor (担当) | 自分 (受験時) |

### 2-4. コード提出系 (2 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `code_submissions` | 自分 / admin / mentor (担当) | 自分 (提出時) |
| `code_reviews` | 提出者 / admin / mentor | mentor / admin (レビュー時) |

### 2-5. 日本語コンテンツ系 (6 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `jlpt_vocabulary` | 全員 | admin / jp mentor |
| `jlpt_grammar` | 全員 | admin / jp mentor |
| `jlpt_reading_passages` | 全員 | admin / jp mentor |
| `jlpt_listening_scripts` | 全員 | admin / jp mentor |
| `jlpt_kanji` | 全員 | admin / jp mentor |
| `it_glossary` | 全員 | admin / jp mentor |

### 2-6. CS知識系 (1 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `cs_terms` | 全員 | admin / tech mentor |

### 2-7. コーディング等級系 (3 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `coding_skill_exams` | 全員 | admin / tech mentor |
| `coding_exam_problems` | 全員 | admin / tech mentor |
| `coding_exam_attempts` | 自分 / admin / mentor (担当) | 自分 (受験時) |

### 2-8. ランキング系 (2 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `ranking_seasons` | 全員 | admin |
| `user_rankings` | 全員 (公開ランキング) | service_role (バッチ更新) |

### 2-9. Admin/Mentor 系 (4 テーブル)

| テーブル | SELECT | INSERT | UPDATE | DELETE |
|---|---|---|---|---|
| `task_assignments` | 自分 / admin | admin | admin / 自分 (進捗) | admin |
| `admin_feedbacks` | 受信者 / 作者 / admin | admin / mentor | 作者のみ | 作者 / admin |
| `feedback_replies` | フィードバック参加者 / admin | フィードバック参加者 | 自分のみ | 自分 / admin |
| `audit_log` | admin のみ | service_role | (不変) | (不変、保管期間後 admin) |

### 2-10. メンター・メンティー & 通知 (2 テーブル)

| テーブル | SELECT | INSERT | UPDATE | DELETE |
|---|---|---|---|---|
| `mentor_mentee_assignments` | admin / 担当メンター / 担当メンティー | admin | admin | admin |
| `notifications` | 自分のみ | admin / 自動 (mentor 自動通知) | 自分 (既読化) | 自分 |

### 2-11. 学習・総合試験 (4 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `learning_assignments` | admin / 担当 mentor / 対象 mentee | admin / 担当 mentor |
| `exam_cycles` | 自分 / admin / 担当 mentor | service_role (自動生成) / admin |
| `comprehensive_exams` | 自分 / admin / 担当 mentor | 自分 (受験) / admin |
| `comprehensive_exam_answers` | 自分 / admin | 自分 (受験) |

### 2-12. アクセス & インタラクション (3 テーブル)

| テーブル | SELECT | INSERT/UPDATE/DELETE |
|---|---|---|
| `content_access_requests` | 自分 / admin | 自分 (申請) / admin (承認) |
| `question_claims` | 自分 / admin | 自分 (申請) / admin (処理) |
| `user_mastered_items` | 自分 / admin / 担当 mentor | 自分 (記録) |

---

## 3. ストレージバケット (Supabase Storage)

| バケット | 公開設定 | 用途 | ポリシー |
|---|---|---|---|
| `avatars` | public | プロフィール画像 | 自分のみ upload, 全員 view |
| `tts-cache` | public | TTS 合成 MP3 | service_role のみ upload, 認証済全員 view |
| (その他) | — | — | — |

---

## 4. 定期点検 SQL

### 4-1. RLS 有効化されていないテーブルを検出

```sql
SELECT schemaname, tablename
FROM pg_tables
WHERE schemaname = 'public'
  AND NOT EXISTS (
    SELECT 1 FROM pg_class c
    WHERE c.relname = tablename AND c.relrowsecurity = true
  );
-- 0 行であること
```

### 4-2. ポリシー数 0 のテーブルを検出

```sql
SELECT t.tablename, COUNT(p.policyname) AS policy_count
FROM pg_tables t
LEFT JOIN pg_policies p ON p.tablename = t.tablename
WHERE t.schemaname = 'public'
GROUP BY t.tablename
HAVING COUNT(p.policyname) = 0;
-- 0 行であること (RLS 有効でポリシー無し = 全アクセス拒否)
```

### 4-3. ポリシー一覧

```sql
SELECT tablename, policyname, cmd, roles, qual, with_check
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, cmd;
```

---

## 5. 新規テーブル追加チェックリスト

- [ ] `ALTER TABLE <name> ENABLE ROW LEVEL SECURITY;` を実行したか
- [ ] SELECT / INSERT / UPDATE / DELETE 各 cmd にポリシーを定義したか
- [ ] PII を含むなら admin も含む全員に「自分のみ」原則を適用したか
- [ ] サーバーアクションが `service_role` を使うなら、アプリ層認可があるか
- [ ] テストで匿名ユーザー / 一般ユーザー / mentor / admin の 4 視点で確認したか
- [ ] 本マトリクスに行を追加したか

---

## 6. 既知の懸念

| 項目 | 影響 | 対応 |
|---|---|---|
| `service_role` 使用箇所が多い (`src/app/actions/admin/*`) | RLS バイパス | 各 action 冒頭で `requireAdmin` 必須 (Phase 1 でヘルパー化済) |
| `personal_vocab` に admin もアクセス不可 | サポート要請対応困難 | 必要時のみ `service_role` 経由でログ取得 |
| 監査ログ (`audit_log`) は不変 | UPDATE/DELETE 不可 | 設計通り — 改ざん防止のため |

---

## 7. 関連マイグレーション

主要 RLS マイグレーション:
- `00013_rls_policies.sql` — 初期ポリシー
- `00019_admin_rls_policies.sql` — `is_admin()` ヘルパー + 管理ポリシー
- `00021_missing_update_policies.sql` — UPDATE ポリシー追加
- `00022_comprehensive_rls_fixes.sql` — 包括修正
- `00027_fix_trigger_and_admin_policies.sql` — トリガ + admin
- `00030_mentor_rls_policies.sql` — `is_admin_or_mentor()`
- `00035_mentor_mentee_rls.sql` — `is_mentor_of()`
- `00067_shared_vocab_rls_fix.sql` — 共有単語帳修正
