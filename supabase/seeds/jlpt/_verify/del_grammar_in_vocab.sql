-- 어휘 테이블에 잘못 들어간 문법 패턴(〜/～ 포함) 삭제
DELETE FROM jlpt_vocabulary WHERE jlpt_level='N1' AND (word LIKE '%〜%' OR word LIKE '%～%');
SELECT count(*) AS n1_vocab FROM jlpt_vocabulary WHERE jlpt_level='N1';
