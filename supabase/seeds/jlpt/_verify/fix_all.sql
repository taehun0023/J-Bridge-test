-- N1 어휘 전수검증 정정 (로컬DB). 오탐(孤高/広告主/熟考 등 정상 독음)은 제외.

-- 1) part_of_speech 표기 통일 (한자/全角 → 한글 표준)
UPDATE jlpt_vocabulary SET part_of_speech='い형용사' WHERE jlpt_level='N1' AND part_of_speech='形容詞';
UPDATE jlpt_vocabulary SET part_of_speech='부사'     WHERE jlpt_level='N1' AND part_of_speech='副詞';
UPDATE jlpt_vocabulary SET part_of_speech='명사'     WHERE jlpt_level='N1' AND part_of_speech IN ('名詞','명사・形容動詞');
UPDATE jlpt_vocabulary SET part_of_speech='동사'     WHERE jlpt_level='N1' AND part_of_speech='動詞';
UPDATE jlpt_vocabulary SET part_of_speech='な형용사' WHERE jlpt_level='N1' AND part_of_speech IN ('形容動詞','형용사(な)');

-- 2) 비표준 する동사 + 의심어 삭제
DELETE FROM jlpt_vocabulary WHERE jlpt_level='N1' AND word IN
  ('最適する','慣行する','損失する','摩擦する','普遍する','標準する','多様する','専門する','申弁','執拗い');

-- 3) 뜻(meaning_ko) 오역/혼입 정정
UPDATE jlpt_vocabulary SET meaning_ko='여뀌를 먹는 벌레도 있다 — 사람의 취향은 제각각' WHERE jlpt_level='N1' AND word='蓼食う虫も好き好き';
UPDATE jlpt_vocabulary SET meaning_ko='갓파도 강물에 떠내려간다 — 명인도 실수할 때가 있다' WHERE jlpt_level='N1' AND word='河童の川流れ';
UPDATE jlpt_vocabulary SET meaning_ko='안개, 봄 안개' WHERE jlpt_level='N1' AND word='霞';
UPDATE jlpt_vocabulary SET meaning_ko='기껏해야, 고작' WHERE jlpt_level='N1' AND word='精々';
UPDATE jlpt_vocabulary SET meaning_ko='(문서) 변조, 위조' WHERE jlpt_level='N1' AND word='改竄';
UPDATE jlpt_vocabulary SET meaning_ko='변명, 해명' WHERE jlpt_level='N1' AND word='弁解';
UPDATE jlpt_vocabulary SET meaning_ko='착각, 잘못 생각함' WHERE jlpt_level='N1' AND word='思い違い';
UPDATE jlpt_vocabulary SET meaning_ko='관용, 너그러이 받아들임' WHERE jlpt_level='N1' AND word IN ('寛容','寛容な');
UPDATE jlpt_vocabulary SET meaning_ko='표면화, 겉으로 드러남' WHERE jlpt_level='N1' AND word='顕在';

-- 4) 관용구 표기 오류 (根を上げる → 音を上げる)
UPDATE jlpt_vocabulary SET word='音を上げる', reading='ねをあげる' WHERE jlpt_level='N1' AND word='根を上げる';

-- 5) 품사 실질 오류
UPDATE jlpt_vocabulary SET part_of_speech='부사' WHERE jlpt_level='N1' AND word IN ('かたわら','ひとえに');
UPDATE jlpt_vocabulary SET part_of_speech='표현' WHERE jlpt_level='N1' AND word IN ('そぐわない','ままならない','にこりともしない','哀愁漂う');
UPDATE jlpt_vocabulary SET part_of_speech='な형용사' WHERE jlpt_level='N1' AND word IN ('好い加減','いい加減');

-- 6) な형용사 word/reading 정규화 + 어간/な형 중복 제거
-- 6a) 어간 행이 이미 존재하는 「〜な」 중복 삭제
DELETE FROM jlpt_vocabulary v WHERE v.jlpt_level='N1' AND v.word LIKE '%な' AND v.part_of_speech='な형용사'
  AND EXISTS (SELECT 1 FROM jlpt_vocabulary s WHERE s.jlpt_level='N1' AND s.word = left(v.word, char_length(v.word)-1) AND s.id<>v.id);
-- 6b) 남은 「〜な」 표제어: word·reading 어간화
UPDATE jlpt_vocabulary SET
  word = left(word, char_length(word)-1),
  reading = CASE WHEN reading LIKE '%な' THEN left(reading, char_length(reading)-1) ELSE reading END
WHERE jlpt_level='N1' AND word LIKE '%な' AND part_of_speech='な형용사';

-- 7) 문법 category 재분류 (모두 유효 15값 내)
UPDATE jlpt_grammar SET category='condition' WHERE jlpt_level='N1' AND pattern LIKE '%うか%まいか%';
UPDATE jlpt_grammar SET category='manner'    WHERE jlpt_level='N1' AND pattern LIKE '%にかまけて%';
UPDATE jlpt_grammar SET category='degree'    WHERE jlpt_level='N1' AND pattern LIKE '%にもまして%';
UPDATE jlpt_grammar SET category='manner'    WHERE jlpt_level='N1' AND pattern LIKE '%んばかり%';
UPDATE jlpt_grammar SET category='degree'    WHERE jlpt_level='N1' AND pattern LIKE '%始末だ%';
