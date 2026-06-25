-- 전수검토 1차: 어휘·한자 고신뢰 오류 수정
-- 어휘
UPDATE jlpt_vocabulary SET meaning_ko='뒤집다, 뒤엎다' WHERE word='覆す' AND jlpt_level='N2';
UPDATE jlpt_vocabulary SET meaning_ko='개최하다, (느낌·증상 등을) 일으키다' WHERE word='催す' AND jlpt_level='N1';
-- 傾向 중복 제거 (짧은 뜻 행 삭제, "경향, 추세" 유지)
DELETE FROM jlpt_vocabulary WHERE word='傾向' AND jlpt_level='N2' AND meaning_ko='경향';

-- 한자: 잘못된 음독 정정
UPDATE jlpt_kanji SET reading_on=NULL WHERE kanji='棚' AND jlpt_level='N1';      -- 棚: 음독 없음(訓 たな만)
UPDATE jlpt_kanji SET reading_on='シ', reading_kun='しば' WHERE kanji='芝' AND jlpt_level='N2'; -- 芝: 음 シ / 훈 しば (シバ는 훈)
