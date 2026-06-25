SELECT 'seq=' || coalesce(seq::text,'null') || '  word=' || word
FROM jlpt_vocabulary WHERE jlpt_level='N1' AND word='抱える';
SELECT seq || '  ' || word AS first10 FROM jlpt_vocabulary WHERE jlpt_level='N1' ORDER BY seq LIMIT 10;
