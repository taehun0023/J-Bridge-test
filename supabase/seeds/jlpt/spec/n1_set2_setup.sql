-- encoding: UTF-8
-- N1 set2 컨테이너 및 모의시험 세트 설정
-- set2 전용 quiz 컨테이너 생성 + jlpt_mock_sets 업데이트

-- ============================================================
-- 1. quiz 컨테이너 (set2 전용)
-- ============================================================
INSERT INTO quizzes (id, title, quiz_type, content_level, is_pool, is_assessment, passing_score) VALUES
('ad000001-0000-0000-0000-000000000121', 'N1 模試(本番) 言語知識 Set2', 'jlpt_grammar',   'N1', false, false, 70),
('ad000001-0000-0000-0000-000000000122', 'N1 模試(本番) 読解 Set2',     'jlpt_reading',   'N1', false, false, 70),
('ad000001-0000-0000-0000-000000000123', 'N1 模試(本番) 聴解 Set2',     'jlpt_listening', 'N1', false, false, 70)
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- 2. jlpt_mock_sets — set2 시간/섹션 설정
-- ============================================================
UPDATE jlpt_mock_sets
SET time_limit_minutes = 165,
    section_config = '[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":45,"pass_pct":0},{"section":"dokkai","label":"読解","question_count":25,"pass_pct":0},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":0}]'::jsonb
WHERE id = 'aa000001-0000-0000-0000-000000000012';
