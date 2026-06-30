-- 〜に際して: N1→N2 이동 / 〜つつ: N2 신규 추가 (2026-06-27)

-- 1) 〜に際して N1 → N2 이동 (해당 레벨 맨 뒤로)
UPDATE jlpt_grammar
SET jlpt_level='N2', seq=(SELECT COALESCE(max(seq),0)+1 FROM jlpt_grammar WHERE jlpt_level='N2')
WHERE pattern='〜に際して' AND jlpt_level='N1';

-- 2) 〜つつ N2 신규 추가 (없을 때만, 맨 뒤 append)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, example_sentences, jlpt_level, seq)
SELECT '〜つつ',
  '~하면서 (동시), ~하면서도 (역접)',
  '二つの動作の同時進行、または「~しながらも」という逆接を表す。',
  '動詞ます形 + つつ',
  'manner',
  '[{"ja":"音楽を聴きつつ、勉強した。","ko":"음악을 들으면서 공부했다.","highlight":"聴きつつ"},{"ja":"体に悪いと知りつつ、ついタバコを吸ってしまう。","ko":"몸에 나쁜 줄 알면서도 그만 담배를 피우고 만다.","highlight":"知りつつ"}]'::jsonb,
  'N2',
  (SELECT COALESCE(max(seq),0)+1 FROM jlpt_grammar WHERE jlpt_level='N2')
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜つつ' AND jlpt_level='N2');

-- 확인
SELECT jlpt_level, pattern, category, seq FROM jlpt_grammar
WHERE pattern IN ('〜に際して','〜つつ','〜つ〜つ') ORDER BY pattern, jlpt_level;
SELECT jlpt_level, count(*) FROM jlpt_grammar WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
