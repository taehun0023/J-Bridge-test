SELECT word, reading, part_of_speech
FROM jlpt_vocabulary
WHERE jlpt_level='N1' AND (word LIKE '%〜%' OR word LIKE '%～%' OR word LIKE '〜%' OR word LIKE '～%')
ORDER BY word;

SELECT count(*) AS grammar_like_in_vocab
FROM jlpt_vocabulary
WHERE jlpt_level='N1' AND (word LIKE '%〜%' OR word LIKE '%～%');
