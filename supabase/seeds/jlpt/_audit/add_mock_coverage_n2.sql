-- N2 모의 言語知識가 묻지만 콘텐츠에 없던 항목 추가 (학습으로 커버되게). encoding: UTF-8
\set ON_ERROR_STOP on

-- 어휘: 挑戦 (명사)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, part_of_speech, jlpt_level, example_sentence, example_sentence_ko)
SELECT '挑戦','ちょうせん','도전','명사','N2','新しい技術に挑戦する。','새로운 기술에 도전한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='挑戦' AND jlpt_level='N2');

-- 문법: 〜おそれがある
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),'〜おそれがある','~할 우려가 있다','〜という悪い可能性がある','N2','動詞辞書形／名詞＋の ＋ おそれがある','conjecture',
 '[{"jp":"台風が上陸するおそれがある。","ko":"태풍이 상륙할 우려가 있다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜おそれがある' AND jlpt_level='N2');

-- 문법: 〜やむを得ない
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),'〜やむを得ない','어쩔 수 없다, 부득이하다','どうしようもない、仕方がない','N2','名詞＋も／動詞ても ＋ やむを得ない','obligation',
 '[{"jp":"締め切りに間に合わないのはやむを得ない。","ko":"마감에 못 맞추는 것은 어쩔 수 없다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜やむを得ない' AND jlpt_level='N2');
