-- N2 어휘로 잘못 분류된 7개 문법 패턴 → N2 문법으로 이동 (2026-06-27)
-- 적용 대상: test DB (local DB는 이전 세션에 이미 적용됨)
-- seq: 현재 N2 문법 max(seq) 기준 뒤에 append

DO $$
DECLARE
  base  INTEGER;
  v_id  UUID;
  g_id  UUID;
BEGIN
  SELECT COALESCE(max(seq),0) INTO base FROM jlpt_grammar WHERE jlpt_level='N2';

  -- 1. とは限らない
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  VALUES('〜とは限らない','반드시 ~인 것은 아니다','必ずしも〜というわけではない','N2',
         'V・い形・な形・N + とは限らない','contrast','[]'::jsonb,base+1)
  RETURNING id INTO g_id;
  SELECT id INTO v_id FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word='とは限らない';
  DELETE FROM user_mastered_items umi WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=v_id::text
    AND EXISTS(SELECT 1 FROM user_mastered_items u2 WHERE u2.item_type='jlpt_grammar' AND u2.item_id=g_id::text AND u2.user_id=umi.user_id);
  UPDATE user_mastered_items SET item_type='jlpt_grammar',item_id=g_id::text WHERE item_type='jlpt_vocabulary' AND item_id=v_id::text;
  DELETE FROM jlpt_vocabulary WHERE id=v_id;

  -- 2. において
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  VALUES('〜において','~에서, ~에 있어서','〜の場所・分野・状況（書き言葉・フォーマル）','N2',
         'N + において / における + N','formal','[]'::jsonb,base+2)
  RETURNING id INTO g_id;
  SELECT id INTO v_id FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word='において';
  DELETE FROM user_mastered_items umi WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=v_id::text
    AND EXISTS(SELECT 1 FROM user_mastered_items u2 WHERE u2.item_type='jlpt_grammar' AND u2.item_id=g_id::text AND u2.user_id=umi.user_id);
  UPDATE user_mastered_items SET item_type='jlpt_grammar',item_id=g_id::text WHERE item_type='jlpt_vocabulary' AND item_id=v_id::text;
  DELETE FROM jlpt_vocabulary WHERE id=v_id;

  -- 3. に他ならない → 〜にほかならない (히라가나 통일)
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  VALUES('〜にほかならない','~에 다름 아니다, 바로 ~이다','まさに〜だ（断定・強調）','N2',
         'N + にほかならない','emphasis','[]'::jsonb,base+3)
  RETURNING id INTO g_id;
  SELECT id INTO v_id FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word='に他ならない';
  DELETE FROM user_mastered_items umi WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=v_id::text
    AND EXISTS(SELECT 1 FROM user_mastered_items u2 WHERE u2.item_type='jlpt_grammar' AND u2.item_id=g_id::text AND u2.user_id=umi.user_id);
  UPDATE user_mastered_items SET item_type='jlpt_grammar',item_id=g_id::text WHERE item_type='jlpt_vocabulary' AND item_id=v_id::text;
  DELETE FROM jlpt_vocabulary WHERE id=v_id;

  -- 4. に伴って
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  VALUES('〜に伴って','~에 따라, ~와 함께','〜の変化に比例して別の変化も起きる','N2',
         'V-辞書形 / N + に伴って / に伴う + N','change','[]'::jsonb,base+4)
  RETURNING id INTO g_id;
  SELECT id INTO v_id FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word='に伴って';
  DELETE FROM user_mastered_items umi WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=v_id::text
    AND EXISTS(SELECT 1 FROM user_mastered_items u2 WHERE u2.item_type='jlpt_grammar' AND u2.item_id=g_id::text AND u2.user_id=umi.user_id);
  UPDATE user_mastered_items SET item_type='jlpt_grammar',item_id=g_id::text WHERE item_type='jlpt_vocabulary' AND item_id=v_id::text;
  DELETE FROM jlpt_vocabulary WHERE id=v_id;

  -- 5. に沿って
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  VALUES('〜に沿って','~을 따라, ~에 맞게','基準・方向・計画などに従って','N2',
         'N + に沿って / に沿った + N','manner','[]'::jsonb,base+5)
  RETURNING id INTO g_id;
  SELECT id INTO v_id FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word='に沿って';
  DELETE FROM user_mastered_items umi WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=v_id::text
    AND EXISTS(SELECT 1 FROM user_mastered_items u2 WHERE u2.item_type='jlpt_grammar' AND u2.item_id=g_id::text AND u2.user_id=umi.user_id);
  UPDATE user_mastered_items SET item_type='jlpt_grammar',item_id=g_id::text WHERE item_type='jlpt_vocabulary' AND item_id=v_id::text;
  DELETE FROM jlpt_vocabulary WHERE id=v_id;

  -- 6. に過ぎない
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  VALUES('〜に過ぎない','~에 불과하다, ~에 지나지 않다','〜だけである（程度が低い・重要でない）','N2',
         'V-普通形 / N + に過ぎない','degree','[]'::jsonb,base+6)
  RETURNING id INTO g_id;
  SELECT id INTO v_id FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word='に過ぎない';
  DELETE FROM user_mastered_items umi WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=v_id::text
    AND EXISTS(SELECT 1 FROM user_mastered_items u2 WHERE u2.item_type='jlpt_grammar' AND u2.item_id=g_id::text AND u2.user_id=umi.user_id);
  UPDATE user_mastered_items SET item_type='jlpt_grammar',item_id=g_id::text WHERE item_type='jlpt_vocabulary' AND item_id=v_id::text;
  DELETE FROM jlpt_vocabulary WHERE id=v_id;

  -- 7. に関して
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  VALUES('〜に関して','~에 관하여','〜について（フォーマル・書き言葉）','N2',
         'N + に関して / に関する + N','formal','[]'::jsonb,base+7)
  RETURNING id INTO g_id;
  SELECT id INTO v_id FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word='に関して';
  DELETE FROM user_mastered_items umi WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=v_id::text
    AND EXISTS(SELECT 1 FROM user_mastered_items u2 WHERE u2.item_type='jlpt_grammar' AND u2.item_id=g_id::text AND u2.user_id=umi.user_id);
  UPDATE user_mastered_items SET item_type='jlpt_grammar',item_id=g_id::text WHERE item_type='jlpt_vocabulary' AND item_id=v_id::text;
  DELETE FROM jlpt_vocabulary WHERE id=v_id;

END $$;
