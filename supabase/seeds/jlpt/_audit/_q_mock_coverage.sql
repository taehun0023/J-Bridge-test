-- N2 모의 言語知識가 묻는 항목이 학습 콘텐츠에 있는지 점검. MISSING = 콘텐츠에 없음(추가 필요).
\echo '== 어휘 모의항목 중 콘텐츠 MISSING =='
WITH items(w) AS (VALUES
 ('恐れる'),('悩む'),('挑戦'),('具体的'),('支援'),('技術'),('影響'),('姿勢'),('大いに'),('伴う'),
 ('基づく'),('成長する'),('失敗する'),('予算'),('参加する'),('供給'),('責任'),('指摘する'),('複雑'),('果たす'),
 ('役割'),('恵まれる'),('実態'),('改善する'),('競争する'),('落ち着く'),('連携'),('ますます'),('精神'),('手堅い'),
 ('異なる'),('概ね'))
SELECT i.w AS mock_vocab
FROM items i
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary v WHERE v.word = i.w OR v.word = replace(i.w,'する',''));

\echo '== 문법 모의항목 중 콘텐츠 MISSING =='
WITH g(p) AS (VALUES
 ('に基づいて'),('一方'),('としても'),('を中心に'),('わけにはいかない'),('おそれがある'),
 ('上で'),('に対して'),('に伴い'),('わけがない'),('やむを得ない'),('末に'))
SELECT g.p AS mock_grammar
FROM g
WHERE NOT EXISTS (
  SELECT 1 FROM jlpt_grammar gr
  WHERE regexp_replace(gr.pattern,'[〜～]','','g') = g.p
     OR regexp_replace(gr.pattern,'[〜～]','','g') LIKE g.p || '%'
     OR g.p LIKE regexp_replace(gr.pattern,'[〜～]','','g') || '%'
);
