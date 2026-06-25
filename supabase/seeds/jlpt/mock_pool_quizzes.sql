-- 모의고사 풀 확충용 퀴즈 6개 (제목 N1/N2로 시작, 模 미포함 → 조립 쿼리에 잡힘). encoding: UTF-8
\set ON_ERROR_STOP on
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_pool) VALUES
('bb000002-0000-0000-0000-000000000001','N2 文法テスト拡充','jlpt_grammar',70,20,true),
('bb000002-0000-0000-0000-000000000002','N2 読解テスト拡充','jlpt_reading',70,40,true),
('bb000002-0000-0000-0000-000000000003','N2 聴解テスト拡充','jlpt_listening',70,40,true),
('bb000001-0000-0000-0000-000000000001','N1 文法テスト拡充','jlpt_grammar',70,20,true),
('bb000001-0000-0000-0000-000000000002','N1 読解テスト拡充','jlpt_reading',70,40,true),
('bb000001-0000-0000-0000-000000000003','N1 聴解テスト拡充','jlpt_listening',70,40,true)
ON CONFLICT (id) DO NOTHING;
