-- 문법 테이블과 중복되는(문법 패턴) 접속/부사형을 어휘에서 제거. 모두 로컬 추가분.
DELETE FROM jlpt_vocabulary
WHERE jlpt_level='N1'
  AND word IN ('ゆえに','かたわら','とはいえ','にもかかわらず','のみならず','否が応でも');
SELECT count(*) AS n1_vocab FROM jlpt_vocabulary WHERE jlpt_level='N1';
