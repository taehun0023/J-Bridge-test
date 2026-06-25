-- encoding: UTF-8
-- N1 set3 コンテナ及び模擬試験セット設定
-- set3 専用 quiz コンテナ生成 + jlpt_mock_sets 更新

-- ============================================================
-- 1. quiz コンテナ (set3 専用)
-- ============================================================
INSERT INTO quizzes (id, title, quiz_type, content_level, is_pool, is_assessment, passing_score) VALUES
('ad000001-0000-0000-0000-000000000131', 'N1 模試(本番) 言語知識 Set3', 'jlpt_grammar',   'N1', false, false, 70),
('ad000001-0000-0000-0000-000000000132', 'N1 模試(本番) 読解 Set3',     'jlpt_reading',   'N1', false, false, 70),
('ad000001-0000-0000-0000-000000000133', 'N1 模試(本番) 聴解 Set3',     'jlpt_listening', 'N1', false, false, 70)
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- 2. jlpt_mock_sets — set3 時間/セクション設定
-- ============================================================
UPDATE jlpt_mock_sets
SET time_limit_minutes = 165,
    section_config = '[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":45,"pass_pct":0},{"section":"dokkai","label":"読解","question_count":25,"pass_pct":0},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":0}]'::jsonb
WHERE id = 'aa000001-0000-0000-0000-000000000013';
