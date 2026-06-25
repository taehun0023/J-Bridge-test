-- N2 모의 言語知識가 묻지만 콘텐츠에 없던 항목 추가 (학습으로 커버되게). encoding: UTF-8
\set ON_ERROR_STOP on

-- 어휘: 挑戦 (명사)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, part_of_speech, jlpt_level, example_sentence, example_sentence_ko)
SELECT '挑戦','ちょうせん','도전','명사','N2','新しい技術に挑戦する。','새로운 기술에 도전한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='挑戦' AND jlpt_level='N2');

-- 주의: 「おそれがある」「やむを得ない」는 이미 jlpt_vocabulary(N2)에 어휘로 존재 → 모의 커버됨.
--       문법표에 중복 추가하면 어휘-문법 오분류가 되므로 추가하지 않음(어휘로 커버 유지).
