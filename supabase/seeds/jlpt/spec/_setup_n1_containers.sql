-- N1 사양(本番형식) 모의시험 콘텐츠 컨테이너 (問題유형 태깅 문항 보관용)
INSERT INTO quizzes (id, title, quiz_type, content_level, is_pool, is_assessment, passing_score) VALUES
('ad000001-0000-0000-0000-000000000111', 'N1 模試(本番) 言語知識', 'jlpt_grammar',   'N1', false, false, 70),
('ad000001-0000-0000-0000-000000000112', 'N1 模試(本番) 読解',     'jlpt_reading',   'N1', false, false, 70),
('ad000001-0000-0000-0000-000000000113', 'N1 模試(本番) 聴解',     'jlpt_listening', 'N1', false, false, 70)
ON CONFLICT (id) DO NOTHING;
