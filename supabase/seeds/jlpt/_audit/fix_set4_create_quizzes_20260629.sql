-- Set 4 quiz 레코드 생성 (Set 3 패턴 참고: 131/132/133 → 141/142/143)
INSERT INTO quizzes (id, title, quiz_type)
SELECT 'ad000001-0000-0000-0000-000000000141'::uuid, 'N1 模試(本番) 言語知識 Set4', 'mock_exam'
WHERE NOT EXISTS (SELECT 1 FROM quizzes WHERE id='ad000001-0000-0000-0000-000000000141'::uuid);

INSERT INTO quizzes (id, title, quiz_type)
SELECT 'ad000001-0000-0000-0000-000000000142'::uuid, 'N1 模試(本番) 読解 Set4', 'mock_exam'
WHERE NOT EXISTS (SELECT 1 FROM quizzes WHERE id='ad000001-0000-0000-0000-000000000142'::uuid);

INSERT INTO quizzes (id, title, quiz_type)
SELECT 'ad000001-0000-0000-0000-000000000143'::uuid, 'N1 模試(本番) 聴解 Set4', 'mock_exam'
WHERE NOT EXISTS (SELECT 1 FROM quizzes WHERE id='ad000001-0000-0000-0000-000000000143'::uuid);
