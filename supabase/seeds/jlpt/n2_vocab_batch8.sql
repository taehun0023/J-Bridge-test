-- encoding: UTF-8
-- N2 語彙シード batch 8 (130語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: 文化・芸術・娯楽・スポーツ・趣味
-- 除外済み: n2_vocab_words.txt 既存1007語 + batch1〜7 全語
-- 品詞: 名詞65語・動詞33語・い形容詞10語・な形容詞12語・副詞10語
-- 読み確認: 標準辞書準拠

-- ============================================================
-- 名詞 (Nouns) — 65語
-- ============================================================

-- 芸術・美術
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絵画', 'かいが', '회화, 그림', 'N2', '명사', '美術館で絵画を鑑賞した。', '미술관에서 회화를 감상했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絵画' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '彫刻', 'ちょうこく', '조각', 'N2', '명사', '公園に彫刻が展示されている。', '공원에 조각이 전시되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='彫刻' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '陶芸', 'とうげい', '도예', 'N2', '명사', '陶芸教室で茶碗を作った。', '도예 교실에서 찻잔을 만들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陶芸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '書道', 'しょどう', '서도, 서예', 'N2', '명사', '子どものころ書道を習っていた。', '어릴 때 서예를 배웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='書道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '工芸', 'こうげい', '공예', 'N2', '명사', '伝統工芸品を購入した。', '전통 공예품을 구입했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='工芸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '作品', 'さくひん', '작품', 'N2', '명사', '画家の最新作品が公開された。', '화가의 최신 작품이 공개되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='作品' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '展覧会', 'てんらんかい', '전람회, 전시회', 'N2', '명사', '来週から展覧会が始まる。', '다음 주부터 전람회가 시작된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='展覧会' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鑑賞', 'かんしょう', '감상', 'N2', '명사', '映画の鑑賞が好きだ。', '영화 감상을 좋아한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鑑賞' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '美術', 'びじゅつ', '미술', 'N2', '명사', '美術の才能を伸ばしたい。', '미술 재능을 키우고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='美術' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '芸術', 'げいじゅつ', '예술', 'N2', '명사', '芸術は人の心を豊かにする。', '예술은 사람의 마음을 풍요롭게 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='芸術' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '芸能', 'げいのう', '연예, 예능', 'N2', '명사', '芸能界でデビューした。', '연예계에서 데뷔했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='芸能' AND jlpt_level='N2');

-- 音楽
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '演奏', 'えんそう', '연주', 'N2', '명사', 'ピアノの演奏を聴いた。', '피아노 연주를 들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演奏' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '楽器', 'がっき', '악기', 'N2', '명사', '楽器を一つ習いたい。', '악기를 하나 배우고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='楽器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '歌詞', 'かし', '가사', 'N2', '명사', 'この曲の歌詞が好きだ。', '이 노래의 가사가 좋다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歌詞' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '合唱', 'がっしょう', '합창', 'N2', '명사', '学校の合唱大会に参加した。', '학교 합창 대회에 참가했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合唱' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'リズム', 'りずむ', '리듬', 'N2', '명사', 'リズムに合わせて踊る。', '리듬에 맞춰 춤을 춘다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='リズム' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'メロディー', 'めろでぃー', '멜로디', 'N2', '명사', '美しいメロディーが流れてきた。', '아름다운 멜로디가 흘러왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='メロディー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'コンサート', 'こんさーと', '콘서트', 'N2', '명사', '好きなアーティストのコンサートに行った。', '좋아하는 아티스트의 콘서트에 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コンサート' AND jlpt_level='N2');

-- 演劇・映画・文学
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '舞台', 'ぶたい', '무대', 'N2', '명사', '初めて舞台に立った。', '처음으로 무대에 섰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='舞台' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '演劇', 'えんげき', '연극', 'N2', '명사', '高校生のとき演劇部に入った。', '고등학생 때 연극부에 들어갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演劇' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '脚本', 'きゃくほん', '각본, 대본', 'N2', '명사', '映画の脚本を書いた。', '영화 각본을 썼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脚本' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '主演', 'しゅえん', '주연', 'N2', '명사', '彼女が主演を務めた映画を見た。', '그녀가 주연을 맡은 영화를 봤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主演' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '監督', 'かんとく', '감독', 'N2', '명사', '有名な映画監督の作品だ。', '유명한 영화 감독의 작품이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='監督' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '小説', 'しょうせつ', '소설', 'N2', '명사', '推理小説を読むのが趣味だ。', '추리 소설 읽는 것이 취미이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='小説' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '詩', 'し', '시(詩)', 'N2', '명사', '詩を書くことで気持ちを表す。', '시를 씀으로써 감정을 표현한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='詩' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '随筆', 'ずいひつ', '수필, 에세이', 'N2', '명사', '有名な作家の随筆を読んだ。', '유명한 작가의 수필을 읽었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='随筆' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出版', 'しゅっぱん', '출판', 'N2', '명사', '念願の本を出版した。', '염원하던 책을 출판했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出版' AND jlpt_level='N2');

-- 伝統文化
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '茶道', 'さどう', '다도', 'N2', '명사', '茶道を通じて礼儀を学んだ。', '다도를 통해 예의를 배웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='茶道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '華道', 'かどう', '화도, 꽃꽂이', 'N2', '명사', '華道の教室に通っている。', '화도 교실에 다니고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='華道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '歌舞伎', 'かぶき', '가부키', 'N2', '명사', '歌舞伎を初めて観劇した。', '가부키를 처음으로 관람했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歌舞伎' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '能', 'のう', '노(일본 전통 예술)', 'N2', '명사', '能の公演を観に行った。', '노 공연을 보러 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='能' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '民謡', 'みんよう', '민요', 'N2', '명사', '地域の民謡を後世に伝える。', '지역 민요를 후세에 전한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='民謡' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '祭り', 'まつり', '축제', 'N2', '명사', '夏祭りで浴衣を着た。', '여름 축제에서 유카타를 입었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='祭り' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '風習', 'ふうしゅう', '풍습, 관습', 'N2', '명사', '地域の風習を大切にする。', '지역 풍습을 소중히 여긴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='風習' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '伝統', 'でんとう', '전통', 'N2', '명사', '伝統を守りながら革新を目指す。', '전통을 지키면서 혁신을 추구한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伝統' AND jlpt_level='N2');

-- スポーツ
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '競技', 'きょうぎ', '경기, 競技', 'N2', '명사', 'オリンピックの競技を観戦した。', '올림픽 경기를 관람했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='競技' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '試合', 'しあい', '시합, 경기', 'N2', '명사', '決勝試合を観に行った。', '결승전 시합을 보러 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='試合' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '選手', 'せんしゅ', '선수', 'N2', '명사', '彼はプロ野球選手だ。', '그는 프로야구 선수이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='選手' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '優勝', 'ゆうしょう', '우승', 'N2', '명사', 'チームが優勝を果たした。', '팀이 우승을 이루었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優勝' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '得点', 'とくてん', '득점, 점수', 'N2', '명사', '得点を重ねてリードした。', '득점을 거듭해 앞서 나갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='得点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '記念', 'きねん', '기념', 'N2', '명사', '試合の記念写真を撮った。', '시합의 기념사진을 찍었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='記念' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '練習', 'れんしゅう', '연습', 'N2', '명사', '毎日練習を欠かさない。', '매일 연습을 거르지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='練習' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訓練', 'くんれん', '훈련', 'N2', '명사', '厳しい訓練を乗り越えた。', '엄격한 훈련을 극복했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訓練' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'コーチ', 'こーち', '코치', 'N2', '명사', '新しいコーチの指導で実力が伸びた。', '새 코치의 지도로 실력이 늘었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コーチ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '審判', 'しんぱん', '심판', 'N2', '명사', '審判の判定に不満が出た。', '심판의 판정에 불만이 나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='審判' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'チームワーク', 'ちーむわーく', '팀워크', 'N2', '명사', 'チームワークがよければ結果もいい。', '팀워크가 좋으면 결과도 좋다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='チームワーク' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'トレーニング', 'とれーにんぐ', '트레이닝, 훈련', 'N2', '명사', '毎朝トレーニングをしている。', '매일 아침 트레이닝을 하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='トレーニング' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '体操', 'たいそう', '체조', 'N2', '명사', '朝起きたら体操をする。', '아침에 일어나면 체조를 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体操' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '水泳', 'すいえい', '수영', 'N2', '명사', '水泳は全身運動だ。', '수영은 전신 운동이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水泳' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '柔道', 'じゅうどう', '유도', 'N2', '명사', '柔道で黒帯を取得した。', '유도에서 검은 띠를 취득했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='柔道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '剣道', 'けんどう', '검도', 'N2', '명사', '剣道の稽古は週三回だ。', '검도 연습은 주 3회이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='剣道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '武道', 'ぶどう', '무도, 무술', 'N2', '명사', '武道の精神を日常生活に活かす。', '무도 정신을 일상생활에 살린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='武道' AND jlpt_level='N2');

-- 娯楽・レジャー
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '娯楽', 'ごらく', '오락, 여가 활동', 'N2', '명사', '映画は手軽な娯楽だ。', '영화는 간편한 오락이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='娯楽' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'レジャー', 'れじゃー', '레저, 여가', 'N2', '명사', '夏のレジャーを計画している。', '여름 레저를 계획하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='レジャー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '観光', 'かんこう', '관광', 'N2', '명사', '京都の観光名所を巡った。', '교토 관광 명소를 돌아다녔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='観光' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '旅行', 'りょこう', '여행', 'N2', '명사', '海外旅行の計画を立てた。', '해외여행 계획을 세웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='旅行' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '観客', 'かんきゃく', '관객', 'N2', '명사', '会場は観客でいっぱいだった。', '회장은 관객으로 가득했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='観客' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '入場料', 'にゅうじょうりょう', '입장료', 'N2', '명사', '入場料が値上がりした。', '입장료가 올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='入場料' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'チケット', 'ちけっと', '티켓', 'N2', '명사', 'コンサートのチケットが売り切れた。', '콘서트 티켓이 매진되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='チケット' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'アウトドア', 'あうとどあ', '아웃도어, 야외 활동', 'N2', '명사', 'アウトドアが好きでよく登山する。', '아웃도어를 좋아해서 자주 등산한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アウトドア' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '登山', 'とざん', '등산', 'N2', '명사', '週末に登山を楽しんでいる。', '주말에 등산을 즐기고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='登山' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'キャンプ', 'きゃんぷ', '캠핑', 'N2', '명사', '家族でキャンプに行った。', '가족과 캠핑을 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='キャンプ' AND jlpt_level='N2');

-- 趣味
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '趣味', 'しゅみ', '취미', 'N2', '명사', '趣味は読書と料理だ。', '취미는 독서와 요리이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='趣味' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '写真', 'しゃしん', '사진', 'N2', '명사', '写真を撮るのが趣味だ。', '사진 찍는 것이 취미이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='写真' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '料理', 'りょうり', '요리', 'N2', '명사', '料理のレパートリーを増やしたい。', '요리 레퍼토리를 늘리고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='料理' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '読書', 'どくしょ', '독서', 'N2', '명사', '読書で語彙が増える。', '독서로 어휘가 늘어난다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='読書' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手芸', 'しゅげい', '수예, 핸드메이드', 'N2', '명사', '手芸でバッグを作った。', '수예로 가방을 만들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手芸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ガーデニング', 'がーでにんぐ', '가드닝, 정원 가꾸기', 'N2', '명사', 'ガーデニングを始めて庭が明るくなった。', '가드닝을 시작해서 정원이 밝아졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ガーデニング' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'コレクション', 'これくしょん', '컬렉션, 수집', 'N2', '명사', '切手のコレクションを続けている。', '우표 컬렉션을 계속하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コレクション' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '将棋', 'しょうぎ', '장기(쇼기)', 'N2', '명사', '祖父に将棋を教えてもらった。', '할아버지에게 쇼기를 배웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='将棋' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '囲碁', 'いご', '바둑', 'N2', '명사', '囲碁は集中力が鍛えられる。', '바둑은 집중력을 키워준다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='囲碁' AND jlpt_level='N2');

-- ============================================================
-- 動詞 (Verbs) — 33語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鑑賞する', 'かんしょうする', '감상하다', 'N2', '동사', '美術館で絵を鑑賞する。', '미술관에서 그림을 감상한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鑑賞する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '演奏する', 'えんそうする', '연주하다', 'N2', '동사', 'ピアノを演奏するのが好きだ。', '피아노를 연주하는 것을 좋아한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演奏する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '描く', 'えがく', '그리다, 묘사하다', 'N2', '동사', '風景を描くことが好きだ。', '풍경을 그리는 것을 좋아한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='描く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '踊る', 'おどる', '춤추다', 'N2', '동사', '音楽に合わせて踊った。', '음악에 맞춰 춤을 췄다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='踊る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '歌う', 'うたう', '노래하다', 'N2', '동사', 'カラオケで歌うのが好きだ。', '노래방에서 노래하는 것을 좋아한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歌う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '撮る', 'とる', '찍다(사진)', 'N2', '동사', '風景写真を撮るのが趣味だ。', '풍경 사진 찍는 것이 취미이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='撮る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '観戦する', 'かんせんする', '관전하다, 경기를 보다', 'N2', '동사', 'スタジアムで試合を観戦した。', '경기장에서 시합을 관전했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='観戦する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '観劇する', 'かんげきする', '관극하다, 연극을 보다', 'N2', '동사', '友人と一緒に観劇した。', '친구와 함께 관극했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='観劇する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '練習する', 'れんしゅうする', '연습하다', 'N2', '동사', '毎日ギターを練習する。', '매일 기타를 연습한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='練習する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '競う', 'きそう', '경쟁하다, 겨루다', 'N2', '동사', 'お互いの腕前を競う。', '서로의 실력을 겨룬다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='競う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '応援する', 'おうえんする', '응원하다', 'N2', '동사', '地元のチームを応援する。', '지역 팀을 응원한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='応援する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '活躍する', 'かつやくする', '활약하다', 'N2', '동사', '国際大会で活躍した選手だ。', '국제 대회에서 활약한 선수이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='活躍する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出場する', 'しゅつじょうする', '출전하다', 'N2', '동사', 'オリンピックに出場する夢を持つ。', '올림픽에 출전하는 꿈을 가지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出場する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '優勝する', 'ゆうしょうする', '우승하다', 'N2', '동사', '全国大会で優勝した。', '전국 대회에서 우승했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優勝する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '演じる', 'えんじる', '연기하다, 역할을 하다', 'N2', '동사', '主役を演じた俳優が評価された。', '주연을 연기한 배우가 평가받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演じる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '収集する', 'しゅうしゅうする', '수집하다', 'N2', '동사', '古いコインを収集している。', '오래된 동전을 수집하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収集する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '楽しむ', 'たのしむ', '즐기다', 'N2', '동사', '旅先で地元の文化を楽しむ。', '여행지에서 현지 문화를 즐긴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='楽しむ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '磨く', 'みがく', '갈고닦다, 연마하다', 'N2', '동사', '技術を磨いてプロを目指す。', '기술을 갈고닦아 프로를 목표로 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='磨く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '習う', 'ならう', '배우다, 익히다', 'N2', '동사', 'バイオリンを習い始めた。', '바이올린을 배우기 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='習う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '展示する', 'てんじする', '전시하다', 'N2', '동사', '作品を展示するギャラリーを探した。', '작품을 전시할 갤러리를 찾았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='展示する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出版する', 'しゅっぱんする', '출판하다', 'N2', '동사', '自分の小説を出版したい。', '자신의 소설을 출판하고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出版する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '旅行する', 'りょこうする', '여행하다', 'N2', '동사', '毎年海外を旅行する。', '매년 해외를 여행한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='旅行する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '上演する', 'じょうえんする', '상연하다, 공연하다', 'N2', '동사', '劇団が新作を上演した。', '극단이 신작을 상연했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上演する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '上映する', 'じょうえいする', '상영하다', 'N2', '동사', '映画館で新作を上映している。', '영화관에서 신작을 상영하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上映する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '披露する', 'ひろうする', '피로하다, 선보이다', 'N2', '동사', '舞台で新しい演技を披露した。', '무대에서 새로운 연기를 선보였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='披露する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '伝える', 'つたえる', '전하다, 전달하다', 'N2', '동사', '文化を次の世代に伝える。', '문화를 다음 세대에 전한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伝える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受け継ぐ', 'うけつぐ', '계승하다, 이어받다', 'N2', '동사', '師匠の技を受け継いだ。', '스승의 기술을 이어받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受け継ぐ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '興じる', 'きょうじる', '즐기다, 흥에 겨워하다', 'N2', '동사', '夕暮れに音楽に興じた。', '저녁 무렵 음악에 즐거이 빠져들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='興じる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '熱中する', 'ねっちゅうする', '열중하다, 몰두하다', 'N2', '동사', 'ゲームに熱中して時間を忘れた。', '게임에 열중해 시간을 잊었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='熱中する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '極める', 'きわめる', '극致에 달하다, 연마하다', 'N2', '동사', '武道の道を極めた。', '무도의 길을 극치에 이르렀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='極める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '奮闘する', 'ふんとうする', '분투하다', 'N2', '동사', '最後まで諦めずに奮闘した。', '끝까지 포기하지 않고 분투했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奮闘する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凝る', 'こる', '열중하다, 몰두하다, 공들이다', 'N2', '동사', '料理に凝ってレシピを集めている。', '요리에 열중해 레시피를 모으고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凝る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '飾る', 'かざる', '장식하다, 꾸미다', 'N2', '동사', '部屋を絵で飾った。', '방을 그림으로 장식했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飾る' AND jlpt_level='N2');

-- ============================================================
-- い形容詞 (い-Adjectives) — 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '楽しい', 'たのしい', '즐겁다, 재미있다', 'N2', 'い형용사', '旅行はいつも楽しい。', '여행은 언제나 즐겁다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='楽しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輝かしい', 'かがやかしい', '빛나다, 찬란하다', 'N2', 'い형용사', '輝かしい成績を残した選手だ。', '빛나는 성적을 남긴 선수이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輝かしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あっけない', 'あっけない', '싱겁다, 허무하다(순식간에 끝나)', 'N2', 'い형용사', '試合はあっけない結果に終わった。', '시합은 허무한 결과로 끝났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あっけない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '珍しい', 'めずらしい', '드물다, 희귀하다', 'N2', 'い형용사', '珍しい切手を見つけた。', '희귀한 우표를 발견했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='珍しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '美しい', 'うつくしい', '아름답다', 'N2', 'い형용사', '美しい絵に見入った。', '아름다운 그림에 빠져들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='美しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'たくましい', 'たくましい', '듬직하다, 강인하다', 'N2', 'い형용사', 'たくましい体で競技に臨んだ。', '강인한 몸으로 경기에 임했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たくましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見事', 'みごと', '훌륭함, 멋짐, 솜씨 좋음', 'N2', 'な형용사', '見事な演技で観客を魅了した。', '훌륭한 연기로 관객을 매료시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '懐かしい', 'なつかしい', '그립다, 懐かしい', 'N2', 'い형용사', '懐かしい曲を聴いて涙が出た。', '그리운 노래를 듣고 눈물이 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懐かしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '面白い', 'おもしろい', '재미있다, 흥미롭다', 'N2', 'い형용사', '面白い本を見つけた。', '재미있는 책을 발견했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='面白い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'くだらない', 'くだらない', '시시하다, 하찮다', 'N2', 'い형용사', 'くだらないことで言い争った。', '시시한 일로 말다툼했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='くだらない' AND jlpt_level='N2');

-- ============================================================
-- な形容詞 (な-Adjectives) — 12語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '華やか', 'はなやか', '화려함, 찬란함', 'N2', 'な형용사', '華やかな舞台を作り上げた。', '화려한 무대를 완성했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='華やか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '盛ん', 'さかん', '성행함, 활발함', 'N2', 'な형용사', 'この地域ではスポーツが盛んだ。', '이 지역에서는 스포츠가 활발하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='盛ん' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '上手', 'じょうず', '능숙함, 잘함', 'N2', 'な형용사', 'ピアノが上手になりたい。', '피아노를 잘하고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上手' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '下手', 'へた', '서툶, 못함', 'N2', 'な형용사', '歌が下手で恥ずかしかった。', '노래를 못해서 부끄러웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='下手' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '得意', 'とくい', '잘함, 자신 있음', 'N2', 'な형용사', '絵を描くのが得意だ。', '그림 그리는 것이 자신 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='得意' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '苦手', 'にがて', '서툶, 잘 못함', 'N2', 'な형용사', '歌は苦手だが好きだ。', '노래는 잘 못하지만 좋아한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='苦手' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '熱心', 'ねっしん', '열심, 열정적임', 'N2', 'な형용사', '熱心に練習する姿が感動的だ。', '열심히 연습하는 모습이 감동적이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='熱心' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '贅沢', 'ぜいたく', '사치스러움, 호화로움', 'N2', 'な형용사', '贅沢な旅行を楽しんだ。', '호화로운 여행을 즐겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='贅沢' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'のどか', 'のどか', '한가로움, 평화로움', 'N2', 'な형용사', 'のどかな田舎の景色が好きだ。', '한가로운 시골 풍경이 좋다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のどか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '豪快', 'ごうかい', '호쾌함, 시원스러움', 'N2', 'な형용사', '豪快なプレーで観客を沸かせた。', '호쾌한 플레이로 관객을 열광시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='豪快' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '格好いい', 'かっこいい', '멋있다', 'N2', 'な형용사', '格好いいパフォーマンスに魅了された。', '멋있는 퍼포먼스에 매료되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='格好いい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '意外', 'いがい', '의외임, 뜻밖임', 'N2', 'な형용사', '意外な才能が見つかった。', '의외의 재능이 발견되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意外' AND jlpt_level='N2');

-- ============================================================
-- 副詞 (Adverbs) — 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひたすら', 'ひたすら', '오로지, 오직, 묵묵히', 'N2', '부사', 'ひたすら練習を続けた。', '묵묵히 연습을 계속했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひたすら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いきいき', 'いきいき', '생생하게, 활기차게', 'N2', '부사', 'いきいきと演技する俳優だ。', '생생하게 연기하는 배우이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いきいき' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'のびのび', 'のびのび', '자유롭게, 마음껏', 'N2', '부사', 'のびのびと自分の音楽を表現する。', '마음껏 자신의 음악을 표현한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のびのび' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'すっかり', 'すっかり', '완전히, 아주', 'N2', '부사', 'すっかり音楽の虜になった。', '완전히 음악에 빠져들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すっかり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'じっくり', 'じっくり', '차근차근, 꼼꼼히', 'N2', '부사', 'じっくり絵を鑑賞した。', '꼼꼼히 그림을 감상했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='じっくり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'のんびり', 'のんびり', '느긋하게, 여유롭게', 'N2', '부사', '休日はのんびり過ごす。', '휴일에는 느긋하게 지낸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のんびり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'たっぷり', 'たっぷり', '흠뻑, 충분히, 듬뿍', 'N2', '부사', '練習をたっぷりこなした。', '연습을 흠뻑 소화했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たっぷり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'どっぷり', 'どっぷり', '흠뻑, 완전히 빠져', 'N2', '부사', '芸術の世界にどっぷりはまった。', '예술의 세계에 완전히 빠져버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='どっぷり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'わくわく', 'わくわく', '두근두근, 설레는', 'N2', '부사', '試合前にわくわくした。', '경기 전에 두근두근했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わくわく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐっと', 'ぐっと', '훅, 꽉, 더욱(강조)', 'N2', '부사', '本番でぐっとこらえて演じた。', '본공연에서 꾹 참으며 연기했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐっと' AND jlpt_level='N2');
