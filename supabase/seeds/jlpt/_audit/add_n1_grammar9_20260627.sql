-- N1 문법 9개 신규 추가 (2026-06-27) — 격식·문어체 고급 표현
WITH base AS (SELECT COALESCE(max(seq),0) AS m FROM jlpt_grammar WHERE jlpt_level='N1'),
src AS (
  SELECT * FROM (VALUES
    (1,'〜に堪えない','~을 참을 수 없다, ~할 가치도 없다','我慢できない、または~する価値もないという意味を表す。','動詞辞書形/名詞 + に堪えない','に堪えない','その番組は見るに堪えない内容だった。','그 프로그램은 차마 볼 수 없는 내용이었다.','degree'),
    (2,'〜に照らして','~에 비추어, ~에 따라','ある基準・規則に基づいて判断・照合することを表す。','名詞 + に照らして','に照らして','社内規定に照らして、厳正に処分する。','사내 규정에 비추어 엄정히 처분한다.','manner'),
    (3,'〜めく','~다워지다, ~기운이 돌다','そのような様子・気配を帯びてくることを表す。','名詞 + めく','めく','日ごとに春めいてきた。','날이 갈수록 봄기운이 돌기 시작했다.','change'),
    (4,'〜ではすまされない','~으로 끝나지 않는다, ~으로 넘어갈 수 없다','それだけでは許されず、責任を免れないことを表す。','名詞/動詞普通形 + ではすまされない','ではすまされない','知らなかったではすまされない。','몰랐다는 말로 넘어갈 수는 없다.','obligation'),
    (5,'〜にしてからが','~조차도, ~부터가','極端な例を挙げて「~でさえ」と強調する。','名詞 + にしてからが','にしてからが','専門家にしてからが解けない難問だ。','전문가조차도 풀지 못하는 난제다.','emphasis'),
    (6,'〜ことこの上ない','더없이 ~하다, 그지없다','この上なく程度が高いことを強調する。','い形容詞辞書形/な形容詞な + ことこの上ない','ことこの上ない','一人で夜道を歩くのは心細いことこの上ない。','혼자 밤길을 걷는 것은 더없이 불안하다.','degree'),
    (7,'〜てはばからない','거리낌 없이 ~하다, 서슴지 않고 ~하다','遠慮せず堂々と~することを表す。','動詞て形 + はばからない','てはばからない','彼は自分が正しいと公言してはばからない。','그는 자기가 옳다고 거리낌 없이 공언한다.','manner'),
    (8,'〜を余儀なくさせる','어쩔 수 없이 ~하게 만들다','やむを得ず相手にそうさせる(使役)ことを表す。','名詞 + を余儀なくさせる','を余儀なくさせる','不況が事業の縮小を余儀なくさせた。','불황이 사업 축소를 어쩔 수 없게 만들었다.','change'),
    (9,'〜ともなしに','무심코 ~하다, 특별히 ~할 생각 없이','特に意識せず何となく~することを表す。','動詞辞書形 + ともなしに','ともなしに','見るともなしにテレビをつけていた。','무심코 텔레비전을 켜 두고 있었다.','manner')
  ) AS v(ord,pattern,meaning_ko,meaning_ja,formation,highlight,ja,ko,category)
  WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE jlpt_level='N1' AND pattern=v.pattern)
)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, example_sentences, jlpt_level, seq)
SELECT s.pattern, s.meaning_ko, s.meaning_ja, s.formation, s.category,
       jsonb_build_array(jsonb_build_object('ja', s.ja, 'ko', s.ko, 'highlight', s.highlight)),
       'N1', b.m + row_number() OVER (ORDER BY s.ord)
FROM src s CROSS JOIN base b;

SELECT jlpt_level, count(*) FROM jlpt_grammar WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
