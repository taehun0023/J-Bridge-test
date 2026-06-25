SELECT
  (SELECT count(*) FROM jlpt_vocabulary WHERE jlpt_level='N1') AS vocab,
  (SELECT count(*) FROM jlpt_grammar WHERE jlpt_level='N1') AS grammar,
  (SELECT count(*) FROM jlpt_vocabulary WHERE jlpt_level='N1' AND word LIKE '%な' AND part_of_speech='な형용사') AS na_left,
  (SELECT count(*) FROM jlpt_vocabulary WHERE jlpt_level='N1' AND part_of_speech IN ('形容詞','副詞','名詞','動詞','形容動詞','형용사(な)')) AS hanja_pos_left;
