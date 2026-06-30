-- N2 문법 9개 신규 추가 (2026-06-27) — 사용자 지정 레벨(N2)
WITH base AS (SELECT COALESCE(max(seq),0) AS m FROM jlpt_grammar WHERE jlpt_level='N2'),
src AS (
  SELECT * FROM (VALUES
    (1,'〜といっても','~라고 해도 (실제는 다름)','~とはいっても、実際はそれほどではないことを表す。','名詞/普通形 + といっても','といっても','駅から近いといっても、歩いて20分かかる。','역에서 가깝다고 해도 걸어서 20분 걸린다.','contrast'),
    (2,'〜に比べて','~에 비해, ~와 비교해서','二つを比較して差を述べることを表す。','名詞 + に比べて','に比べて','去年に比べて、今年は雨が多い。','작년에 비해 올해는 비가 많다.','manner'),
    (3,'〜上は','~한 이상은, ~한 바에는','そうした以上は当然~すべきだという意味を表す。','動詞辞書形/た形 + 上は','上は','引き受けた上は、最後まで責任を持つ。','맡은 이상은 끝까지 책임을 진다.','condition'),
    (4,'〜次第で','~에 따라, ~여하에 달려','それによって結果が決まることを表す。','名詞 + 次第で','次第で','結果は本人の努力次第で変わる。','결과는 본인의 노력에 따라 달라진다.','condition'),
    (5,'〜たとたん','~한 순간, ~하자마자','ある動作の直後に別の事が起こることを表す。','動詞た形 + とたん','たとたん','ドアを開けたとたん、猫が飛び出した。','문을 연 순간 고양이가 튀어나왔다.','time'),
    (6,'〜わりに','~에 비해서는, ~치고는','予想される程度と実際が違うことを表す。','名詞の/普通形 + わりに','わりに','値段が高いわりに、品質が良くない。','값이 비싼 것에 비해 품질이 좋지 않다.','contrast'),
    (7,'〜てしょうがない','너무 ~해서 견딜 수 없다','ある感情・感覚が抑えられないほど強いことを表す。','動詞て形/形容詞て + しょうがない','てしょうがない','試験の結果が気になってしょうがない。','시험 결과가 너무 신경 쓰여 견딜 수 없다.','degree'),
    (8,'〜ないことはない','~하지 않는 것은 아니다, ~할 수도 있다','不可能ではない、という控えめな部分肯定を表す。','動詞ない形 + ことはない','ないことはない','頑張れば、できないことはない。','노력하면 못 할 것도 없다.','manner'),
    (9,'〜に限る','~가 최고다, ~하는 것이 제일이다','それが一番良いと主張することを表す。','名詞/動詞辞書形 + に限る','に限る','疲れたときは寝るに限る。','피곤할 때는 자는 게 최고다.','emphasis')
  ) AS v(ord,pattern,meaning_ko,meaning_ja,formation,highlight,ja,ko,category)
  WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE jlpt_level='N2' AND pattern=v.pattern)
)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, example_sentences, jlpt_level, seq)
SELECT s.pattern, s.meaning_ko, s.meaning_ja, s.formation, s.category,
       jsonb_build_array(jsonb_build_object('ja', s.ja, 'ko', s.ko, 'highlight', s.highlight)),
       'N2', b.m + row_number() OVER (ORDER BY s.ord)
FROM src s CROSS JOIN base b;

SELECT jlpt_level, count(*) FROM jlpt_grammar WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
