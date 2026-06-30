-- encoding: UTF-8
-- N2 語彙シード batch 9 (120語 — 歴史20+地理15+伝統20+宗教18+行事17+冠婚葬祭20+動詞5+な형용사5)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: 歴史・地理・伝統・宗教・行事・冠婚葬祭

-- ============================================================
-- 歴史 (역사) 명사 — 30語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '時代', 'じだい', '시대', 'N2', '명사', '江戸時代には多くの文化が花開いた。', '에도 시대에는 많은 문화가 꽃을 피웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='時代' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '文明', 'ぶんめい', '문명', 'N2', '명사', '古代文明の遺跡が発掘された。', '고대 문명의 유적이 발굴되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='文明' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '遺跡', 'いせき', '유적', 'N2', '명사', '縄文時代の遺跡が発見された。', '조몬 시대의 유적이 발견되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遺跡' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '遺産', 'いさん', '유산', 'N2', '명사', 'この寺は世界遺産に登録されている。', '이 절은 세계 유산에 등록되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遺産' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '武士', 'ぶし', '무사', 'N2', '명사', '武士は主君に忠誠を誓った。', '무사는 주군에게 충성을 맹세했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='武士' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '幕府', 'ばくふ', '막부', 'N2', '명사', '江戸幕府は260年間続いた。', '에도 막부는 260년간 지속되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幕府' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '古墳', 'こふん', '고분', 'N2', '명사', '大阪には巨大な古墳がある。', '오사카에는 거대한 고분이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='古墳' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '史跡', 'しせき', '사적, 사적지', 'N2', '명사', 'この城跡は国の史跡に指定されている。', '이 성터는 국가 사적으로 지정되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='史跡' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '古代', 'こだい', '고대', 'N2', '명사', '古代ローマの文化は今も影響を与えている。', '고대 로마의 문화는 지금도 영향을 주고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='古代' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '近代', 'きんだい', '근대', 'N2', '명사', '明治維新は日本の近代化を推し進めた。', '메이지 유신은 일본의 근대화를 촉진시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='近代' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '民衆', 'みんしゅう', '민중', 'N2', '명사', '民衆の声が政治を動かした。', '민중의 목소리가 정치를 움직였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='民衆' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '皇室', 'こうしつ', '황실', 'N2', '명사', '皇室の行事は国民に関心を持たれている。', '황실의 행사는 국민의 관심을 받고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='皇室' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '天皇', 'てんのう', '천황', 'N2', '명사', '天皇は日本の象徴とされている。', '천황은 일본의 상징으로 여겨지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='天皇' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '紛争', 'ふんそう', '분쟁', 'N2', '명사', '領土紛争が長年続いている。', '영토 분쟁이 오랫동안 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='紛争' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '敗北', 'はいぼく', '패배', 'N2', '명사', '戦争での敗北が国の転換点となった。', '전쟁에서의 패배가 나라의 전환점이 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='敗北' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '統治', 'とうち', '통치', 'N2', '명사', '植民地の統治は厳しかった。', '식민지 통치는 가혹했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='統治' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '藩', 'はん', '번(藩), 번국', 'N2', '명사', '江戸時代には約300の藩があった。', '에도 시대에는 약 300개의 번이 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='藩' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '庶民', 'しょみん', '서민', 'N2', '명사', '江戸の庶民は活気ある文化を生み出した。', '에도의 서민들은 활기찬 문화를 만들어 냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='庶民' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '侵略', 'しんりゃく', '침략', 'N2', '명사', '他国への侵略は許されない。', '타국에 대한 침략은 용납될 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='侵略' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '維新', 'いしん', '유신', 'N2', '명사', '明治維新によって日本は大きく変わった。', '메이지 유신으로 일본은 크게 변했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='維新' AND jlpt_level='N2');

-- ============================================================
-- 地理 (지리) 명사 — 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '盆地', 'ぼんち', '분지', 'N2', '명사', '京都は盆地に位置するため夏は暑い。', '교토는 분지에 위치해 여름이 덥다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='盆地' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '半島', 'はんとう', '반도', 'N2', '명사', '伊豆半島は観光地として有名だ。', '이즈 반도는 관광지로 유명하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='半島' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '海峡', 'かいきょう', '해협', 'N2', '명사', '津軽海峡は本州と北海道を隔てている。', '쓰가루 해협은 혼슈와 홋카이도를 가르고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='海峡' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '湾', 'わん', '만(灣)', 'N2', '명사', '東京湾には多くの船が行き交う。', '도쿄만에는 많은 배가 오간다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='湾' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '高原', 'こうげん', '고원', 'N2', '명사', '夏は高原でキャンプを楽しむ。', '여름에는 고원에서 캠핑을 즐긴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高原' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '渓谷', 'けいこく', '계곡', 'N2', '명사', '秋になると渓谷の紅葉が美しい。', '가을이 되면 계곡의 단풍이 아름답다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='渓谷' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '滝', 'たき', '폭포', 'N2', '명사', '那智の滝は日本三大瀑布の一つだ。', '나치 폭포는 일본 3대 폭포 중 하나이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滝' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '峠', 'とうげ', '고갯길, 산마루', 'N2', '명사', '峠を越えると景色が一変した。', '고개를 넘자 경치가 완전히 달라졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='峠' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '岬', 'みさき', '곶, 갑', 'N2', '명사', '岬の先端から水平線が見渡せる。', '곶 끝에서 수평선을 내다볼 수 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='岬' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '山岳', 'さんがく', '산악', 'N2', '명사', '山岳地帯では天候が急変しやすい。', '산악 지대에서는 날씨가 갑자기 변하기 쉽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='山岳' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '内陸', 'ないりく', '내륙', 'N2', '명사', '内陸の都市は海の影響を受けにくい。', '내륙 도시는 바다의 영향을 받기 어렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='内陸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '沿岸', 'えんがん', '연안', 'N2', '명사', '沿岸部では漁業が盛んだ。', '연안 지역에서는 어업이 활발하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='沿岸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大陸', 'たいりく', '대륙', 'N2', '명사', 'ユーラシア大陸は世界最大の大陸だ。', '유라시아 대륙은 세계에서 가장 큰 대륙이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大陸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '丘陵', 'きゅうりょう', '구릉', 'N2', '명사', '丘陵地帯にはブドウ畑が広がる。', '구릉 지대에는 포도밭이 펼쳐진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='丘陵' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '河口', 'かこう', '하구', 'N2', '명사', '川の河口付近では三角州が形成される。', '강의 하구 부근에는 삼각주가 형성된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='河口' AND jlpt_level='N2');

-- ============================================================
-- 伝統 (전통) 명사 — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '茶道', 'さどう', '다도', 'N2', '명사', '茶道は日本の伝統文化の一つだ。', '다도는 일본 전통문화 중 하나이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='茶道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '華道', 'かどう', '화도, 꽃꽂이', 'N2', '명사', '母は華道を長年習っている。', '어머니는 화도를 오랫동안 배우고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='華道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '書道', 'しょどう', '서도, 서예', 'N2', '명사', '書道の授業で毛筆の使い方を学んだ。', '서도 수업에서 붓 사용법을 배웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='書道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '歌舞伎', 'かぶき', '가부키', 'N2', '명사', '歌舞伎は江戸時代に発展した伝統芸能だ。', '가부키는 에도 시대에 발전한 전통 예능이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歌舞伎' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '能', 'のう', '노(能), 노가쿠', 'N2', '명사', '能は世界最古の演劇芸術の一つとされる。', '노는 세계 최고(最古)의 연극 예술 중 하나로 여겨진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='能' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '落語', 'らくご', '라쿠고(만담)', 'N2', '명사', '落語は一人で複数の役を演じる話芸だ。', '라쿠고는 혼자서 여러 역할을 연기하는 화예이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='落語' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '漆器', 'しっき', '칠기', 'N2', '명사', '輪島塗は日本を代表する漆器だ。', '와지마 칠은 일본을 대표하는 칠기이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漆器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '陶芸', 'とうげい', '도예', 'N2', '명사', '陶芸教室で茶碗を作った。', '도예 교실에서 찻잔을 만들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陶芸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '浮世絵', 'うきよえ', '우키요에', 'N2', '명사', '葛飾北斎の浮世絵は世界に影響を与えた。', '가쓰시카 호쿠사이의 우키요에는 세계에 영향을 주었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浮世絵' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '工芸', 'こうげい', '공예', 'N2', '명사', '伝統工芸品を守るための取り組みが進む。', '전통 공예품을 지키기 위한 노력이 진행되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='工芸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '伝承', 'でんしょう', '전승', 'N2', '명사', '昔話が口承で伝承されてきた。', '옛이야기가 구전으로 전승되어 왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伝承' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '民謡', 'みんよう', '민요', 'N2', '명사', '地方の民謡が失われつつある。', '지방 민요가 사라져 가고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='民謡' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '三味線', 'しゃみせん', '샤미센(삼현금)', 'N2', '명사', '三味線の音色が祭りを盛り上げる。', '샤미센의 음색이 축제를 북돋운다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='三味線' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '和紙', 'わし', '화지(일본 전통 종이)', 'N2', '명사', '和紙は丈夫で美しい日本の伝統紙だ。', '화지는 질기고 아름다운 일본의 전통 종이이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='和紙' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '着物', 'きもの', '기모노', 'N2', '명사', '成人式には着物を着て出席した。', '성인식에는 기모노를 입고 참석했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='着物' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '織物', 'おりもの', '직물, 짠 천', 'N2', '명사', '西陣織は京都の伝統的な織物だ。', '니시진오리는 교토의 전통 직물이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='織物' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '版画', 'はんが', '판화', 'N2', '명사', '木版画は江戸時代に盛んに作られた。', '목판화는 에도 시대에 활발히 만들어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='版画' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '太鼓', 'たいこ', '태고, 북', 'N2', '명사', '祭りで太鼓の音が響き渡った。', '축제에서 북소리가 울려 퍼졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='太鼓' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '武道', 'ぶどう', '무도', 'N2', '명사', '剣道や柔道は日本の伝統武道だ。', '검도와 유도는 일본의 전통 무도이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='武道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '芸能', 'げいのう', '예능', 'N2', '명사', '伝統芸能を後世に伝えることが大切だ。', '전통 예능을 후세에 전하는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='芸能' AND jlpt_level='N2');

-- ============================================================
-- 宗教 (종교) 명사 — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '神社', 'じんじゃ', '신사', 'N2', '명사', '初詣に地元の神社を訪れた。', '새해 첫 참배로 동네 신사를 방문했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='神社' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '寺院', 'じいん', '사원, 절', 'N2', '명사', '京都には多くの寺院が点在する。', '교토에는 많은 사원이 곳곳에 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寺院' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '境内', 'けいだい', '경내', 'N2', '명사', '神社の境内には大きな木が立っている。', '신사 경내에는 큰 나무가 서 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='境内' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '参拝', 'さんぱい', '참배', 'N2', '명사', '毎朝神社に参拝するのが習慣だ。', '매일 아침 신사에 참배하는 것이 습관이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='参拝' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '神道', 'しんとう', '신도', 'N2', '명사', '神道は日本固有の宗教だ。', '신도는 일본 고유의 종교이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='神道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仏教', 'ぶっきょう', '불교', 'N2', '명사', '仏教は6世紀に日本に伝わった。', '불교는 6세기에 일본에 전해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仏教' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宗派', 'しゅうは', '종파', 'N2', '명사', '仏教にはさまざまな宗派がある。', '불교에는 다양한 종파가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宗派' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '信仰', 'しんこう', '신앙', 'N2', '명사', '山への信仰は古くから続いている。', '산에 대한 신앙은 예로부터 이어지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='信仰' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鳥居', 'とりい', '도리이(신사 문)', 'N2', '명사', '神社の入口には赤い鳥居がある。', '신사 입구에는 붉은 도리이가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鳥居' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '供養', 'くよう', '공양', 'N2', '명사', '亡くなった人の供養のために法要を行う。', '돌아가신 분의 공양을 위해 법요를 행한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='供養' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '位牌', 'いはい', '위패', 'N2', '명사', '仏壇に位牌を飾って手を合わせる。', '불단에 위패를 놓고 합장한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='位牌' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '法要', 'ほうよう', '법요(불교 의식)', 'N2', '명사', '三回忌の法要に親族が集まった。', '3주기 법요에 친족이 모였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='法要' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '戒名', 'かいみょう', '계명(법명)', 'N2', '명사', '亡くなった後に戒名をいただいた。', '돌아가신 후에 법명을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='戒名' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '縁起', 'えんぎ', '연기, 길흉의 조짐', 'N2', '명사', 'この置物は縁起がいいといわれている。', '이 장식품은 길조가 좋다고 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縁起' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '御守り', 'おまもり', '부적, 부적', 'N2', '명사', '試験前に神社で御守りを買った。', '시험 전에 신사에서 부적을 샀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='御守り' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '彼岸', 'ひがん', '피안, 추분·춘분 주간', 'N2', '명사', 'お彼岸にはお墓参りをする習慣がある。', '오피간에는 성묘를 하는 관습이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='彼岸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '奉納', 'ほうのう', '봉납', 'N2', '명사', '神社に奉納するための舞を練習した。', '신사에 봉납할 춤을 연습했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奉納' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '墓参り', 'はかまいり', '성묘', 'N2', '명사', 'お盆には家族で墓参りに行く。', '오봉에는 가족과 함께 성묘를 하러 간다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='墓参り' AND jlpt_level='N2');

-- ============================================================
-- 行事 (행사) 명사 — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '正月', 'しょうがつ', '정월, 새해', 'N2', '명사', '正月には家族で過ごすのが日本の習慣だ。', '정월에는 가족과 함께 보내는 것이 일본의 관습이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='正月' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '元旦', 'がんたん', '설날 아침, 1월 1일', 'N2', '명사', '元旦には初日の出を見に行った。', '설날 아침에 첫 해돋이를 보러 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='元旦' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '節分', 'せつぶん', '세쓰분(입춘 전날)', 'N2', '명사', '節分には豆まきをして鬼を追い払う。', '세쓰분에는 콩을 던져 도깨비를 쫓아낸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節分' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '七夕', 'たなばた', '칠석', 'N2', '명사', '七夕には短冊に願い事を書く。', '칠석에는 단자쿠에 소원을 쓴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='七夕' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'お盆', 'おぼん', '오봉(우란분재)', 'N2', '명사', 'お盆には先祖の霊が帰ってくるとされる。', '오봉에는 조상의 영혼이 돌아온다고 여겨진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='お盆' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '七五三', 'しちごさん', '시치고산', 'N2', '명사', '七五三は子どもの健やかな成長を祝う行事だ。', '시치고산은 아이의 건강한 성장을 축하하는 행사이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='七五三' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大晦日', 'おおみそか', '섣달그믐날', 'N2', '명사', '大晦日には年越しそばを食べる。', '섣달그믐날에는 해넘이 메밀국수를 먹는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大晦日' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '初詣', 'はつもうで', '새해 첫 참배', 'N2', '명사', '元旦に家族で初詣に行った。', '설날 아침 가족과 함께 새해 첫 참배를 하러 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='初詣' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '門松', 'かどまつ', '가도마쓰(새해 장식 소나무)', 'N2', '명사', '正月には玄関に門松を飾る。', '정월에는 현관에 가도마쓰를 장식한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='門松' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'お年玉', 'おとしだま', '세뱃돈', 'N2', '명사', '子どもたちはお年玉をもらって喜んでいる。', '아이들은 세뱃돈을 받고 기뻐하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='お年玉' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '豆まき', 'まめまき', '콩 뿌리기(세쓰분)', 'N2', '명사', '節分の豆まきで「鬼は外」と叫ぶ。', '세쓰분 콩 뿌리기에서 "귀신은 밖으로"라고 외친다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='豆まき' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '花見', 'はなみ', '꽃구경, 벚꽃놀이', 'N2', '명사', '春になると公園で花見をする人が増える。', '봄이 되면 공원에서 꽃구경하는 사람이 늘어난다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='花見' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '祇園祭', 'ぎおんまつり', '기온 축제', 'N2', '명사', '祇園祭は京都を代表する夏祭りだ。', '기온 축제는 교토를 대표하는 여름 축제이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='祇園祭' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '成人式', 'せいじんしき', '성인식', 'N2', '명사', '成人式に振り袖を着て出席した。', '성인식에 후리소데를 입고 참석했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='成人式' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '端午', 'たんご', '단오', 'N2', '명사', '端午の節句には柏餅を食べる。', '단오에는 가시와모치를 먹는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='端午' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'こいのぼり', 'こいのぼり', '잉어 깃발(단오 장식)', 'N2', '명사', '5月5日にはこいのぼりを空に泳がせる。', '5월 5일에는 잉어 깃발을 하늘에 날린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='こいのぼり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '雛祭り', 'ひなまつり', '히나마쓰리(3월 3일)', 'N2', '명사', '雛祭りには雛人形を飾る。', '히나마쓰리에는 히나 인형을 장식한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雛祭り' AND jlpt_level='N2');

-- ============================================================
-- 冠婚葬祭 (관혼상제) 명사 — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '披露宴', 'ひろうえん', '피로연', 'N2', '명사', '結婚式の後、盛大な披露宴が行われた。', '결혼식 후 성대한 피로연이 열렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='披露宴' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '婚約', 'こんやく', '약혼', 'N2', '명사', '二人は先月婚約を発表した。', '두 사람은 지난달 약혼을 발표했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='婚約' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仲人', 'なこうど', '중매인', 'N2', '명사', '昔は結婚に仲人が欠かせなかった。', '옛날에는 결혼에 중매인이 꼭 필요했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仲人' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '花嫁', 'はなよめ', '신부', 'N2', '명사', '花嫁が白いウエディングドレスを着て入場した。', '신부가 흰 웨딩드레스를 입고 입장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='花嫁' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '花婿', 'はなむこ', '신랑', 'N2', '명사', '花婿は緊張した様子でスピーチをした。', '신랑은 긴장한 모습으로 스피치를 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='花婿' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引き出物', 'ひきでもの', '답례품(피로연)', 'N2', '명사', '披露宴の引き出物にカタログを選んだ。', '피로연 답례품으로 카탈로그를 선택했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き出物' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '香典', 'こうでん', '조의금', 'N2', '명사', '葬儀に参列して香典を持参した。', '장례식에 참석하여 조의금을 지참했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='香典' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '通夜', 'つや', '초상, 빈소(밤샘)', 'N2', '명사', '通夜には多くの知人が訪れた。', '빈소에는 많은 지인이 찾아왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通夜' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '告別式', 'こくべつしき', '고별식, 영결식', 'N2', '명사', '告別式には200人以上が参列した。', '영결식에는 200명 이상이 참례했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='告別式' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '焼香', 'しょうこう', '분향', 'N2', '명사', '祭壇の前で焼香を行った。', '제단 앞에서 분향을 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焼香' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '喪主', 'もしゅ', '상주', 'N2', '명사', '喪主として葬儀の挨拶をした。', '상주로서 장례식 인사를 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喪主' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '四十九日', 'しじゅうくにち', '사십구재', 'N2', '명사', '四十九日の法要を家族で営んだ。', '사십구재 법요를 가족과 함께 치렀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='四十九日' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '喪服', 'もふく', '상복', 'N2', '명사', '葬儀には喪服を着用する。', '장례식에는 상복을 착용한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喪服' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '数珠', 'じゅず', '염주', 'N2', '명사', '数珠を手にかけて手を合わせた。', '염주를 손에 걸고 합장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='数珠' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '遺骨', 'いこつ', '유골', 'N2', '명사', '火葬の後、遺骨を骨壷に納めた。', '화장 후 유골을 골호에 담았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遺骨' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '火葬', 'かそう', '화장', 'N2', '명사', '日本では火葬が一般的な葬法だ。', '일본에서는 화장이 일반적인 장례 방법이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='火葬' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '命日', 'めいにち', '기일(忌日)', 'N2', '명사', '命日には仏壇に花を供える。', '기일에는 불단에 꽃을 바친다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='命日' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '弔問', 'ちょうもん', '조문', 'N2', '명사', '訃報を聞き、すぐに弔問に伺った。', '부고를 듣고 바로 조문하러 찾아갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弔問' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '祝儀', 'しゅうぎ', '축의금, 축하 선물', 'N2', '명사', '結婚式に招かれて祝儀を包んだ。', '결혼식에 초대받아 축의금을 쌌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='祝儀' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '式場', 'しきじょう', '식장', 'N2', '명사', '結婚式の式場を予約した。', '결혼식 식장을 예약했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='式場' AND jlpt_level='N2');

-- ============================================================
-- 동사 (Verbs) — 5語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '拝む', 'おがむ', '절하다, 예배하다', 'N2', '동사', '神社で手を合わせて拝む。', '신사에서 합장하고 절한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拝む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '祈る', 'いのる', '기도하다, 빌다', 'N2', '동사', '合格を祈って神社にお参りした。', '합격을 빌며 신사에 참배했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='祈る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '埋葬する', 'まいそうする', '매장하다', 'N2', '동사', '遺体を墓地に埋葬した。', '시신을 묘지에 매장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='埋葬する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '継承する', 'けいしょうする', '계승하다', 'N2', '동사', '伝統文化を次世代に継承する。', '전통문화를 다음 세대에 계승한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='継承する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '祝う', 'いわう', '축하하다', 'N2', '동사', '友人の結婚を心から祝った。', '친구의 결혼을 진심으로 축하했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='祝う' AND jlpt_level='N2');

-- ============================================================
-- な형용사 (な-Adjectives) — 3語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '神聖', 'しんせい', '신성함', 'N2', 'な형용사', '境内は神聖な場所なので静かにする。', '경내는 신성한 장소이므로 조용히 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='神聖' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '厳粛', 'げんしゅく', '엄숙함', 'N2', 'な형용사', '葬儀は厳粛な雰囲気の中で行われた。', '장례식은 엄숙한 분위기 속에서 거행되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厳粛' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '荘厳', 'そうごん', '장엄함', 'N2', 'な형용사', '古い寺院の荘厳な雰囲気に圧倒された。', '오래된 사원의 장엄한 분위기에 압도되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='荘厳' AND jlpt_level='N2');

-- ============================================================
-- な형용사 추가 (な-Adjectives additional) — 2語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '盛大', 'せいだい', '성대함', 'N2', 'な형용사', '結婚式は盛大に行われた。', '결혼식은 성대하게 거행되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='盛大' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '雄大', 'ゆうだい', '웅대함', 'N2', 'な형용사', '富士山の雄大な姿に感動した。', '후지산의 웅대한 모습에 감동받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雄大' AND jlpt_level='N2');
