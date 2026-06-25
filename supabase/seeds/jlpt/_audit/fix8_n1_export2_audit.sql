-- export2_audit_issues.csv 후속 점검: 원본(_export/N1_*) 대조로 ✅ 확정된 항목만 수정 (N1)
-- 오탐(#10/#11 배열문제), 데이터 정상(#5 빈독음/#12 3지선다), 취향(#7)은 의도적으로 제외.

-- #2 真摯 한국어 뜻 중복("진지함, 진지함") 정정
UPDATE jlpt_vocabulary SET meaning_ko='진지함, 성실함'
  WHERE word='真摯' AND jlpt_level='N1';

-- #3 逼迫 한국어 뜻 부정확("핍박"=迫害 의미) 정정
UPDATE jlpt_vocabulary SET meaning_ko='절박, 궁핍, 압박'
  WHERE word='逼迫' AND jlpt_level='N1';

-- #4 품사 라벨 표준화: 형용동사→な형용사(복합 포함), 형용사(い)→い형용사
UPDATE jlpt_vocabulary SET part_of_speech=replace(part_of_speech,'형용동사','な형용사')
  WHERE part_of_speech LIKE '%형용동사%' AND jlpt_level='N1';
UPDATE jlpt_vocabulary SET part_of_speech='い형용사'
  WHERE part_of_speech='형용사(い)' AND jlpt_level='N1';

-- #6 〜ずにはおかない 접속 표기를 형제 항목과 통일
UPDATE jlpt_grammar SET formation='動詞ない形(ないを取る) + ずにはおかない / する → せずにはおかない'
  WHERE pattern='〜ずにはおかない' AND jlpt_level='N1';

-- #9 矜持 문제 복수정답 위험: 사전상 유효한 읽기 きんじ → 명백한 오답 けんじ 로 교체 (4지선다 유지)
UPDATE quiz_question_options SET option_text='けんじ'
  WHERE option_text='きんじ'
    AND question_id IN (SELECT id FROM quiz_questions WHERE question_text LIKE '%矜持%');
