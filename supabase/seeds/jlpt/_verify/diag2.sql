SELECT u.created_at, left(u.user_id::text,8) AS usr, v.word, v.jlpt_level
FROM user_mastered_items u
JOIN jlpt_vocabulary v ON v.id::text = u.item_id
WHERE u.item_type='jlpt_vocabulary'
ORDER BY u.created_at DESC NULLS LAST
LIMIT 12;
