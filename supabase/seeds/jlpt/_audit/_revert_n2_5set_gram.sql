-- N2 5set 커버리지에서 어휘와 충돌하는 문법 3개 되돌림(이미 어휘에 존재 → 모의는 어휘로 커버).
DELETE FROM jlpt_grammar WHERE pattern IN ('〜おそれがある','〜に沿って','〜一方だ') AND jlpt_level='N2';
