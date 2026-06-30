-- encoding: UTF-8
-- N2 モック セット4・5 言語知識 30問 カバレッジ補完シード
-- 作成日: 2026-06-26
-- 検査対象: jlpt_vocabulary (語彙) + jlpt_grammar (文法)
--
-- 検査結果サマリー:
--   語彙項目: 25語 抽出 → MISSING 2語 (革命, 漏れる)
--   文法項目:  5項 抽出 → MISSING 0項
--     それにしても → jlpt_vocabulary に N2 で存在
--     とは限らない → jlpt_vocabulary に N2 で存在
--     に違いない   → jlpt_grammar に N2 で存在
--     つつある     → jlpt_grammar に N2 で存在
--     からして     → jlpt_grammar に N2 で存在
--
-- 追加: 2語 (語彙のみ、文法追加なし)

-- 1. 革命 (かくめい) — 名詞 N2
--    問17: 「革命」の読み方として正しいものはどれですか？ → かくめい
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT
  '革命', 'かくめい', '혁명', 'N2', '명사',
  '産業革命は社会を大きく変えた。',
  '산업혁명은 사회를 크게 변화시켰다.'
WHERE NOT EXISTS (
  SELECT 1 FROM jlpt_vocabulary WHERE word = '革命' AND jlpt_level = 'N2'
);

-- 2. 漏れる (もれる) — 動詞 N2
--    問6: 「漏」の意味として正しいものはどれですか？ → 새다
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT
  '漏れる', 'もれる', '새다, 누출되다', 'N2', '동사',
  '水道管から水が漏れている。',
  '수도관에서 물이 새고 있다.'
WHERE NOT EXISTS (
  SELECT 1 FROM jlpt_vocabulary WHERE word = '漏れる' AND jlpt_level = 'N2'
);
