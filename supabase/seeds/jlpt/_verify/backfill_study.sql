-- 기존 습득 항목을 학습이력(정답 기록)으로 백필. wrong/duration 없음(과거 데이터라 찍기판정 제외).
INSERT INTO study_attempts (user_id, content_type, item_id, is_correct, wrong_count, duration_ms, created_at)
SELECT u.user_id,
       CASE u.item_type
         WHEN 'jlpt_vocabulary' THEN 'jlpt_vocab'
         WHEN 'jlpt_grammar'    THEN 'jlpt_grammar'
         WHEN 'jlpt_reading'    THEN 'jlpt_reading'
         WHEN 'jlpt_listening'  THEN 'jlpt_listening'
       END,
       u.item_id, true, 0, NULL, u.created_at
FROM user_mastered_items u
WHERE u.item_type IN ('jlpt_vocabulary','jlpt_grammar','jlpt_reading','jlpt_listening');
SELECT content_type, count(*) FROM study_attempts GROUP BY 1 ORDER BY 1;
