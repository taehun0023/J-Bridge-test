SELECT 'n1_vocab_total' AS k, count(*)::text AS v FROM jlpt_vocabulary WHERE jlpt_level='N1'
UNION ALL
SELECT 'mastered_vocab_matching_n1', count(*)::text FROM jlpt_vocabulary v
  WHERE v.jlpt_level='N1' AND v.id::text IN (SELECT item_id FROM user_mastered_items WHERE item_type='jlpt_vocabulary')
UNION ALL
SELECT 'users_with_vocab_mastery', count(DISTINCT user_id)::text FROM user_mastered_items WHERE item_type='jlpt_vocabulary'
UNION ALL
SELECT 'sample_item_id', (SELECT item_id FROM user_mastered_items WHERE item_type='jlpt_vocabulary' LIMIT 1)
UNION ALL
SELECT 'sample_vocab_id', (SELECT id::text FROM jlpt_vocabulary WHERE jlpt_level='N1' LIMIT 1);

SELECT user_id::text, count(*) AS mastered_vocab
FROM user_mastered_items WHERE item_type='jlpt_vocabulary'
GROUP BY user_id ORDER BY 2 DESC LIMIT 5;
