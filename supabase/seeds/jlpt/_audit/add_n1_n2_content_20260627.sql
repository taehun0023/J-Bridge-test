-- N1/N2 어휘·한자·문법 신규 추가 (2026-06-27)
-- 이미 존재하는 항목은 WHERE NOT EXISTS로 스킵

DO $$
DECLARE
  n1v_base INTEGER; n2v_base INTEGER;
  n1k_base INTEGER; n2k_base INTEGER;
  n1g_base INTEGER; n2g_base INTEGER;
BEGIN
  SELECT COALESCE(max(seq),0) INTO n1v_base FROM jlpt_vocabulary WHERE jlpt_level='N1';
  SELECT COALESCE(max(seq),0) INTO n2v_base FROM jlpt_vocabulary WHERE jlpt_level='N2';
  SELECT COALESCE(max(seq),0) INTO n1k_base FROM jlpt_kanji WHERE jlpt_level='N1';
  SELECT COALESCE(max(seq),0) INTO n2k_base FROM jlpt_kanji WHERE jlpt_level='N2';
  SELECT COALESCE(max(seq),0) INTO n1g_base FROM jlpt_grammar WHERE jlpt_level='N1';
  SELECT COALESCE(max(seq),0) INTO n2g_base FROM jlpt_grammar WHERE jlpt_level='N2';

  -- =====================
  -- N1 어휘 신규 3개
  -- =====================
  INSERT INTO jlpt_vocabulary(word,reading,meaning_ko,jlpt_level,part_of_speech,seq)
  SELECT v.word,v.reading,v.meaning_ko,'N1',v.pos,n1v_base + row_number() OVER (ORDER BY v.ord)
  FROM (VALUES
    (1,'はばむ','はばむ','방해하다, 가로막다','動詞'),
    (2,'怠惰','たいだ','태만함, 게으름','名詞・ナ形容詞'),
    (3,'扇動','せんどう','선동','名詞')
  ) AS v(ord,word,reading,meaning_ko,pos)
  WHERE NOT EXISTS(SELECT 1 FROM jlpt_vocabulary WHERE jlpt_level='N1' AND word=v.word);

  -- =====================
  -- N2 어휘 신규 4개
  -- =====================
  INSERT INTO jlpt_vocabulary(word,reading,meaning_ko,jlpt_level,part_of_speech,seq)
  SELECT v.word,v.reading,v.meaning_ko,'N2',v.pos,n2v_base + row_number() OVER (ORDER BY v.ord)
  FROM (VALUES
    (1,'就職','しゅうしょく','취직','名詞'),
    (2,'貿易','ぼうえき','무역','名詞'),
    (3,'報酬','ほうしゅう','보수, 보상','名詞'),
    (4,'輸出','ゆしゅつ','수출','名詞')
  ) AS v(ord,word,reading,meaning_ko,pos)
  WHERE NOT EXISTS(SELECT 1 FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word=v.word);

  -- =====================
  -- N1 한자 신규 6개
  -- =====================
  INSERT INTO jlpt_kanji(kanji,reading_on,reading_kun,meaning_ko,jlpt_level,seq)
  SELECT v.kanji,v.on_r,v.kun_r,v.meaning_ko,'N1',n1k_base + row_number() OVER (ORDER BY v.ord)
  FROM (VALUES
    (1,'阻','そ','はばむ','방해하다, 가로막다'),
    (2,'拘','こう','かかわる','구애되다, 얽매이다'),
    (3,'賜','し','たまわる','하사받다'),
    (4,'虐','ぎゃく','しいたげる','학대하다'),
    (5,'遮','しゃ','さえぎる','가로막다, 차단하다'),
    (6,'贖','しょく','あがなう','속죄하다, 갚다')
  ) AS v(ord,kanji,on_r,kun_r,meaning_ko)
  WHERE NOT EXISTS(SELECT 1 FROM jlpt_kanji WHERE jlpt_level='N1' AND kanji=v.kanji);

  -- =====================
  -- N2 한자 신규 4개
  -- =====================
  INSERT INTO jlpt_kanji(kanji,reading_on,reading_kun,meaning_ko,jlpt_level,seq)
  SELECT v.kanji,v.on_r,v.kun_r,v.meaning_ko,'N2',n2k_base + row_number() OVER (ORDER BY v.ord)
  FROM (VALUES
    (1,'漏','ろう','もれる','새다'),
    (2,'補','ほ','おぎなう','보충하다'),
    (3,'妨','ぼう','さまたげる','방해하다'),
    (4,'試','し','こころみる','시도하다')
  ) AS v(ord,kanji,on_r,kun_r,meaning_ko)
  WHERE NOT EXISTS(SELECT 1 FROM jlpt_kanji WHERE jlpt_level='N2' AND kanji=v.kanji);

  -- =====================
  -- N1 문법 신규 8개
  -- =====================
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  SELECT v.pat,v.mk,v.mj,'N1',v.form,v.cat,'[]'::jsonb,n1g_base + row_number() OVER (ORDER BY v.ord)
  FROM (VALUES
    (1,'〜をしも','~조차도, ~마저도','〜さえも・でさえ（強調）','N + をしも','emphasis'),
    (2,'〜いうまでもなく','말할 것도 없이','当然のことながら〜は明らかである','V-こと / N + というまでもなく','emphasis'),
    (3,'〜とは裏腹に','~와는 반대로','〜と正反対に、〜に反して','N・V-こと + とは裏腹に','contrast'),
    (4,'〜いかんによっては','~여하에 따라서는','〜の内容・状況によっては','N + のいかんによっては / いかんで','condition'),
    (5,'〜をおいてほかにいない','~말고는 없다','〜以外に適した者・物がない（唯一性）','N + をおいてほかにいない / ほかにない','emphasis'),
    (6,'〜げ','~한 듯한 모습','〜そうな様子・気配','い形語幹 / な形語幹 + げ','manner'),
    (7,'〜てはじめて','~하고 나서야 비로소','〜することで初めて実現する','V-て + はじめて','time'),
    (8,'〜だにしない','~조차 하지 않다','〜することさえしない（極端な否定）','V-辞書形 + だにしない','emphasis')
  ) AS v(ord,pat,mk,mj,form,cat)
  WHERE NOT EXISTS(SELECT 1 FROM jlpt_grammar WHERE jlpt_level='N1' AND regexp_replace(pattern,'[〜～]','','g')=regexp_replace(v.pat,'[〜～]','','g'));

  -- =====================
  -- N2 문법 신규 13개 (において는 move_n2_vocab7_to_grammar.sql에서 처리)
  -- =====================
  INSERT INTO jlpt_grammar(pattern,meaning_ko,meaning_ja,jlpt_level,formation,category,example_sentences,seq)
  SELECT v.pat,v.mk,v.mj,'N2',v.form,v.cat,'[]'::jsonb,n2g_base + row_number() OVER (ORDER BY v.ord)
  FROM (VALUES
    (1,'〜てきた','지금까지 ~해 왔다','過去から現在まで続いてきた変化・動作','V-て + きた','change'),
    (2,'〜を問わず','~을 불문하고','〜に関係なく・限らず','N + を問わず','listing'),
    (3,'〜得ない','~할 수 없다','〜することができない・不可能だ','V-連用形 + 得ない（えない）','ability'),
    (4,'〜からすれば','~의 입장에서 보면','〜の観点・立場から判断すると','N + からすれば / からすると / からみれば','conjecture'),
    (5,'〜ずにはいられない','~하지 않을 수 없다','どうしても〜せずにはいられない','V-ない形（ず）+ にはいられない','desire'),
    (6,'〜からといって〜わけではない','~라고 해서 반드시 ~인 것은 아니다','〜という理由だけで必ずしも〜とは言えない','V / い形 / な形 / N + からといって + 〜わけではない','contrast'),
    (7,'〜にとって','~에게 있어서','〜の立場・観点から見て','N + にとって / にとっての + N','formal'),
    (8,'〜ようとしない','~하려고 하지 않다','意志的に〜することを拒む','V-意志形 + としない','desire'),
    (9,'〜ものか','절대로 ~하지 않겠다','絶対に〜しないという強い否定・拒絶','V-辞書形 / V-ない形 + ものか / もんか','emphasis'),
    (10,'〜かねる','~하기 어렵다','〜することが難しい・遠慮して〜できない','V-連用形 + かねる','ability'),
    (11,'〜ことから','~라는 점에서, ~때문에','〜という事実・理由から（命名・判断の根拠）','V / い形 / な形 / N + ことから','reason'),
    (12,'〜べきだ','~해야 한다','〜するのが当然だ・正しい','V-辞書形 + べきだ（する→すべき）','obligation'),
    (13,'〜につれて','~함에 따라','〜の変化に比例して別の変化も起きる','V-辞書形 / N + につれて','change')
  ) AS v(ord,pat,mk,mj,form,cat)
  WHERE NOT EXISTS(SELECT 1 FROM jlpt_grammar WHERE jlpt_level='N2' AND regexp_replace(pattern,'[〜～]','','g')=regexp_replace(v.pat,'[〜～]','','g'));

END $$;
