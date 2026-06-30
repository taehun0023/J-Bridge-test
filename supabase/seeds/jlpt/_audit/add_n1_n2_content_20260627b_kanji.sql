-- 한자 레벨 이동 + 신규 추가 (2026-06-27 batch-b)
-- 拘/賜: N2→N1 이동, 贖: N1 신규
-- 漏: N1→N2 이동, 試: N4→N2 이동

-- ── N1으로 이동 ──
UPDATE jlpt_kanji SET jlpt_level='N1', seq=(SELECT COALESCE(max(seq),0)+1 FROM jlpt_kanji WHERE jlpt_level='N1')
WHERE kanji='拘';

UPDATE jlpt_kanji SET jlpt_level='N1', seq=(SELECT COALESCE(max(seq),0)+1 FROM jlpt_kanji WHERE jlpt_level='N1')
WHERE kanji='賜';

-- ── 贖: N1 신규 ──
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, meaning_en, korean_gloss, stroke_count, example_words, jlpt_level, seq)
SELECT '贖','ショク','あがな.う','속(贖), 속죄하다','redeem, atone','속죄할 속',22,
       '[{"word": "贖罪", "meaning": "속죄", "reading": "しょくざい"}, {"word": "贖う", "meaning": "보상하다", "reading": "あがなう"}]'::jsonb,
       'N1',(SELECT COALESCE(max(seq),0)+1 FROM jlpt_kanji WHERE jlpt_level='N1')
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='贖' AND jlpt_level='N1');

-- ── N2로 이동 ──
UPDATE jlpt_kanji SET jlpt_level='N2', seq=(SELECT COALESCE(max(seq),0)+1 FROM jlpt_kanji WHERE jlpt_level='N2')
WHERE kanji='漏';

UPDATE jlpt_kanji SET jlpt_level='N2', seq=(SELECT COALESCE(max(seq),0)+1 FROM jlpt_kanji WHERE jlpt_level='N2')
WHERE kanji='試';

-- 결과 확인
SELECT kanji, jlpt_level, seq FROM jlpt_kanji
WHERE kanji = ANY(ARRAY['拘','賜','贖','漏','試'])
ORDER BY jlpt_level, seq;
