-- N2 공식구성 모의 Set4 컨테이너 (107문항: 言語知識54/読解21/聴解32)
INSERT INTO quizzes (id, title, quiz_type, content_level, is_pool, is_assessment, passing_score) VALUES
('ad000002-0000-0000-0000-000000000241', 'N2 模試(公式) Set4 言語知識', 'jlpt_grammar',   'N2', false, false, 60),
('ad000002-0000-0000-0000-000000000242', 'N2 模試(公式) Set4 読解',     'jlpt_reading',   'N2', false, false, 60),
('ad000002-0000-0000-0000-000000000243', 'N2 模試(公式) Set4 聴解',     'jlpt_listening', 'N2', false, false, 60)
ON CONFLICT (id) DO NOTHING;
