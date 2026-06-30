-- encoding: UTF-8
-- N2 語彙シード batch 6 (120語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: 自然・環境・健康・身体・医療・食・生活
-- 重複確認済み: n2_vocab_words.txt (既存語彙リスト) との照合済み
-- 読み確認: 標準辞書準拠

-- ============================================================
-- 自然・環境 (Nature & Environment) — 명사 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大気', 'たいき', '대기, 공기', 'N2', '명사', '大気汚染が深刻な問題になっている。', '대기오염이 심각한 문제가 되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大気' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '地層', 'ちそう', '지층', 'N2', '명사', '地層を調べると過去の気候がわかる。', '지층을 조사하면 과거의 기후를 알 수 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='地層' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '山脈', 'さんみゃく', '산맥', 'N2', '명사', 'アルプス山脈はヨーロッパ最大の山脈だ。', '알프스 산맥은 유럽 최대의 산맥이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='山脈' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '平野', 'へいや', '평야', 'N2', '명사', '関東平野は日本一広い平野だ。', '간토 평야는 일본 최대의 평야이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='平野' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '湿地', 'しっち', '습지', 'N2', '명사', '湿地には多様な生物が生息する。', '습지에는 다양한 생물이 서식한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='湿地' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '砂漠', 'さばく', '사막', 'N2', '명사', '砂漠は昼と夜の気温差が激しい。', '사막은 낮과 밤의 기온 차가 크다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='砂漠' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '森林', 'しんりん', '삼림, 숲', 'N2', '명사', '森林破壊が地球温暖化を加速させる。', '삼림 파괴가 지구온난화를 가속시킨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='森林' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '河川', 'かせん', '하천', 'N2', '명사', '河川の水質を改善する取り組みが続いている。', '하천의 수질을 개선하는 노력이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='河川' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '海岸', 'かいがん', '해안', 'N2', '명사', '海岸沿いを散歩するのが好きだ。', '해안을 따라 산책하는 것을 좋아한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='海岸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '火山', 'かざん', '화산', 'N2', '명사', '火山の噴火で周辺に被害が出た。', '화산 분화로 주변에 피해가 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='火山' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '地震', 'じしん', '지진', 'N2', '명사', '地震に備えて非常食を用意した。', '지진에 대비해 비상식량을 준비했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='地震' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '洪水', 'こうずい', '홍수', 'N2', '명사', '大雨で川が氾濫し洪水が起きた。', '폭우로 강이 범람해 홍수가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='洪水' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '干ばつ', 'かんばつ', '가뭄', 'N2', '명사', '長期の干ばつで農作物が枯れた。', '장기 가뭄으로 농작물이 말랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='干ばつ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '台風', 'たいふう', '태풍', 'N2', '명사', '台風の接近に伴い、外出を控えた。', '태풍이 접근함에 따라 외출을 자제했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='台風' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '温暖化', 'おんだんか', '온난화', 'N2', '명사', '地球温暖化の影響で気候が変わっている。', '지구온난화의 영향으로 기후가 변하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='温暖化' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '排気ガス', 'はいきガス', '배기가스', 'N2', '명사', '排気ガスによる大気汚染が問題だ。', '배기가스로 인한 대기오염이 문제이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='排気ガス' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廃棄物', 'はいきぶつ', '폐기물', 'N2', '명사', '産業廃棄物の処理が課題となっている。', '산업 폐기물 처리가 과제가 되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃棄物' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生態系', 'せいたいけい', '생태계', 'N2', '명사', '外来種の侵入が生態系を乱す。', '외래종 침입이 생태계를 교란한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生態系' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絶滅', 'ぜつめつ', '멸종', 'N2', '명사', '多くの動物が絶滅の危機に瀕している。', '많은 동물이 멸종 위기에 처해 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絶滅' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '汚染', 'おせん', '오염', 'N2', '명사', '土壌汚染の調査が行われた。', '토양 오염 조사가 실시되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汚染' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '再生可能', 'さいせいかのう', '재생 가능', 'N2', '명사', '再生可能エネルギーの普及が進んでいる。', '재생 가능 에너지의 보급이 진행되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='再生可能' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '二酸化炭素', 'にさんかたんそ', '이산화탄소', 'N2', '명사', '二酸化炭素の排出量を削減する目標を立てた。', '이산화탄소 배출량을 줄이는 목표를 세웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='二酸化炭素' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '緑化', 'りょくか', '녹화, 녹지화', 'N2', '명사', '都市の緑化を推進するプロジェクトが始まった。', '도시 녹화를 추진하는 프로젝트가 시작되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緑化' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '節水', 'せっすい', '절수', 'N2', '명사', '節水を心がけることが大切だ。', '절수에 신경 쓰는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節水' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '雪解け', 'ゆきどけ', '눈이 녹음, 해빙', 'N2', '명사', '春になると雪解けが始まる。', '봄이 되면 눈이 녹기 시작한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雪解け' AND jlpt_level='N2');

-- ============================================================
-- 健康・身体 (Health & Body) — 명사 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '体力', 'たいりょく', '체력', 'N2', '명사', '体力をつけるために毎日走っている。', '체력을 기르기 위해 매일 뛰고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '免疫', 'めんえき', '면역', 'N2', '명사', '免疫力を高めるには規則正しい生活が大切だ。', '면역력을 높이려면 규칙적인 생활이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='免疫' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '血圧', 'けつあつ', '혈압', 'N2', '명사', '高血圧の治療のために薬を飲んでいる。', '고혈압 치료를 위해 약을 먹고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='血圧' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '脈拍', 'みゃくはく', '맥박', 'N2', '명사', '運動後に脈拍を測定した。', '운동 후 맥박을 측정했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脈拍' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '筋肉', 'きんにく', '근육', 'N2', '명사', '筋肉痛がひどくて歩けない。', '근육통이 심해서 걸을 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='筋肉' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '骨折', 'こっせつ', '골절', 'N2', '명사', '転んで足を骨折してしまった。', '넘어져서 다리가 골절되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='骨折' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '皮膚', 'ひふ', '피부', 'N2', '명사', '皮膚が乾燥しやすい季節だ。', '피부가 건조해지기 쉬운 계절이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='皮膚' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '神経', 'しんけい', '신경', 'N2', '명사', '神経が過敏になっている。', '신경이 예민해져 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='神経' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '臓器', 'ぞうき', '장기(신체 기관)', 'N2', '명사', '臓器移植の倫理問題が議論されている。', '장기 이식의 윤리 문제가 논의되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='臓器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '肺', 'はい', '폐', 'N2', '명사', '喫煙は肺に悪影響を与える。', '흡연은 폐에 나쁜 영향을 준다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肺' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '肝臓', 'かんぞう', '간(장)', 'N2', '명사', '飲みすぎると肝臓に負担がかかる。', '과음하면 간에 부담이 간다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肝臓' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '関節', 'かんせつ', '관절', 'N2', '명사', '寒い日は関節が痛む。', '추운 날은 관절이 아프다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='関節' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '視力', 'しりょく', '시력', 'N2', '명사', '視力が落ちてメガネが必要になった。', '시력이 떨어져 안경이 필요해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='視力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '聴力', 'ちょうりょく', '청력', 'N2', '명사', '騒音が続くと聴力に影響する。', '소음이 계속되면 청력에 영향을 준다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='聴力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '体温', 'たいおん', '체온', 'N2', '명사', '熱があるので体温を測った。', '열이 있어서 체온을 쟀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体温' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '栄養', 'えいよう', '영양', 'N2', '명사', '偏食すると栄養が偏る。', '편식하면 영양이 편중된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='栄養' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '肥満', 'ひまん', '비만', 'N2', '명사', '肥満は生活習慣病の原因になる。', '비만은 생활습관병의 원인이 된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肥満' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '花粉', 'かふん', '꽃가루', 'N2', '명사', '花粉の季節は目がかゆくなる。', '꽃가루 계절에는 눈이 가려워진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='花粉' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'アレルギー', 'アレルギー', '알레르기', 'N2', '명사', '食物アレルギーがある人への配慮が必要だ。', '식품 알레르기가 있는 사람에 대한 배려가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アレルギー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '熱中症', 'ねっちゅうしょう', '열사병, 일사병', 'N2', '명사', '夏場は熱中症に気をつけてください。', '여름철에는 열사병에 주의하세요.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='熱中症' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '睡眠', 'すいみん', '수면', 'N2', '명사', '質の良い睡眠が健康の基本だ。', '질 좋은 수면이 건강의 기본이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='睡眠' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ストレス', 'ストレス', '스트레스', 'N2', '명사', 'ストレスが溜まると体に悪い。', '스트레스가 쌓이면 몸에 나쁘다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ストレス' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '疲労', 'ひろう', '피로', 'N2', '명사', '疲労が蓄積すると集中力が低下する。', '피로가 축적되면 집중력이 저하된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疲労' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '汗', 'あせ', '땀', 'N2', '명사', '運動して汗をかくことは健康に良い。', '운동해서 땀을 흘리는 것은 건강에 좋다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汗' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '呼吸', 'こきゅう', '호흡', 'N2', '명사', '深い呼吸でリラックスする。', '깊은 호흡으로 릴랙스한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呼吸' AND jlpt_level='N2');

-- ============================================================
-- 医療 (Medical) — 명사 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '診断', 'しんだん', '진단', 'N2', '명사', '医師から癌と診断された。', '의사로부터 암이라는 진단을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='診断' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '処方', 'しょほう', '처방', 'N2', '명사', '医師に薬を処方してもらった。', '의사에게 약을 처방받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='処方' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '症状', 'しょうじょう', '증상', 'N2', '명사', '風邪の症状が続いている。', '감기 증상이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='症状' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '副作用', 'ふくさよう', '부작용', 'N2', '명사', '薬の副作用に注意が必要だ。', '약의 부작용에 주의가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='副作用' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手術', 'しゅじゅつ', '수술', 'N2', '명사', '来週、心臓の手術を受ける予定だ。', '다음 주에 심장 수술을 받을 예정이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手術' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '入院', 'にゅういん', '입원', 'N2', '명사', '肺炎で二週間入院した。', '폐렴으로 2주간 입원했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='入院' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '退院', 'たいいん', '퇴원', 'N2', '명사', '手術から一週間で退院できた。', '수술 후 일주일 만에 퇴원할 수 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='退院' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '救急', 'きゅうきゅう', '응급', 'N2', '명사', '急に具合が悪くなり救急で運ばれた。', '갑자기 상태가 나빠져 응급으로 이송됐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='救急' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '予防', 'よぼう', '예방', 'N2', '명사', '病気の予防には規則正しい生活が重要だ。', '질병 예방에는 규칙적인 생활이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='予防' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ワクチン', 'ワクチン', '백신', 'N2', '명사', 'ワクチンの接種で感染症を予防できる。', '백신 접종으로 감염증을 예방할 수 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ワクチン' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感染', 'かんせん', '감염', 'N2', '명사', 'ウイルスの感染拡大を防ぐ対策が必要だ。', '바이러스 감염 확산을 막는 대책이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感染' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '治療', 'ちりょう', '치료', 'N2', '명사', '早期発見で治療の効果が上がる。', '조기 발견으로 치료 효과가 높아진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='治療' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '回復', 'かいふく', '회복', 'N2', '명사', '術後の回復が順調だ。', '수술 후 회복이 순조롭다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='回復' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '後遺症', 'こういしょう', '후유증', 'N2', '명사', '事故の後遺症で足が不自由になった。', '사고의 후유증으로 다리가 불편해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='後遺症' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慢性', 'まんせい', '만성', 'N2', '명사', '慢性的な腰痛に悩んでいる。', '만성적인 허리통증으로 고민하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慢性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '急性', 'きゅうせい', '급성', 'N2', '명사', '急性の胃炎で救急病院を受診した。', '급성 위염으로 응급병원을 진찰받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '健診', 'けんしん', '건강검진', 'N2', '명사', '毎年健診を受けることを勧める。', '매년 건강검진을 받도록 권한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='健診' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '献血', 'けんけつ', '헌혈', 'N2', '명사', '献血は人の命を救う大切な行為だ。', '헌혈은 사람의 목숨을 구하는 중요한 행위이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='献血' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '介護', 'かいご', '돌봄, 간호', 'N2', '명사', '高齢者の介護が社会問題になっている。', '고령자 돌봄이 사회문제가 되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='介護' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'リハビリ', 'リハビリ', '재활', 'N2', '명사', '骨折後にリハビリで回復した。', '골절 후 재활로 회복했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='リハビリ' AND jlpt_level='N2');

-- ============================================================
-- 食・飲食 (Food & Eating) — 명사 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食材', 'しょくざい', '식재료', 'N2', '명사', '新鮮な食材を使った料理は美味しい。', '신선한 식재료를 사용한 요리는 맛있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食材' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食欲', 'しょくよく', '식욕', 'N2', '명사', '夏バテで食欲がなくなった。', '더위 먹어서 식욕이 없어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食欲' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食物繊維', 'しょくもつせんい', '식이섬유', 'N2', '명사', '食物繊維は腸の働きを助ける。', '식이섬유는 장의 활동을 돕는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食物繊維' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '脂肪', 'しぼう', '지방', 'N2', '명사', '摂りすぎた脂肪は体に蓄積される。', '과다 섭취한 지방은 몸에 축적된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脂肪' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'タンパク質', 'タンパクしつ', '단백질', 'N2', '명사', 'タンパク質は筋肉を作るのに必要だ。', '단백질은 근육을 만드는 데 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='タンパク質' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'カロリー', 'カロリー', '칼로리', 'N2', '명사', 'カロリーを抑えた食事を心がけている。', '칼로리를 억제한 식사를 신경 쓰고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='カロリー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '添加物', 'てんかぶつ', '첨가물', 'N2', '명사', '食品添加物が体に与える影響を調べた。', '식품 첨가물이 몸에 주는 영향을 조사했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='添加物' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '有機', 'ゆうき', '유기(농)', 'N2', '명사', '有機野菜を使った料理を提供している。', '유기 야채를 사용한 요리를 제공하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='有機' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '農薬', 'のうやく', '농약', 'N2', '명사', '農薬を減らした野菜が人気を集めている。', '농약을 줄인 야채가 인기를 끌고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='農薬' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '賞味期限', 'しょうみきげん', '유통기한', 'N2', '명사', '賞味期限を確認してから購入する。', '유통기한을 확인하고 나서 구입한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='賞味期限' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食中毒', 'しょくちゅうどく', '식중독', 'N2', '명사', '夏場は食中毒に注意が必要だ。', '여름철에는 식중독 주의가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食中毒' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発酵', 'はっこう', '발효', 'N2', '명사', '発酵食品は健康に良いとされている。', '발효 식품은 건강에 좋다고 알려져 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発酵' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '旬', 'しゅん', '제철', 'N2', '명사', '旬の食材を使った料理が一番おいしい。', '제철 식재료를 사용한 요리가 가장 맛있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='旬' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '収穫', 'しゅうかく', '수확', 'N2', '명사', '秋は米の収穫の季節だ。', '가을은 쌀 수확의 계절이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収穫' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '作物', 'さくもつ', '농작물', 'N2', '명사', '干ばつで作物が育たなかった。', '가뭄으로 농작물이 자라지 못했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='作物' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '飢餓', 'きが', '기아, 굶주림', 'N2', '명사', '世界では今も飢餓に苦しむ人々がいる。', '세계에는 지금도 기아로 고통받는 사람들이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飢餓' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '消費', 'しょうひ', '소비', 'N2', '명사', 'エネルギー消費を抑える工夫をしている。', '에너지 소비를 억제하는 궁리를 하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='消費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食費', 'しょくひ', '식비', 'N2', '명사', '毎月の食費を節約している。', '매달 식비를 절약하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ダイエット', 'ダイエット', '다이어트', 'N2', '명사', '健康のためにダイエットを始めた。', '건강을 위해 다이어트를 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ダイエット' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '水分', 'すいぶん', '수분', 'N2', '명사', '運動中はこまめに水分を補給しよう。', '운동 중에는 자주 수분을 보충하자.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水分' AND jlpt_level='N2');

-- ============================================================
-- 生活 (Daily Life) — 명사 10語 + 동사 10語 + 형용사 10語
-- ============================================================

-- 생활 명사 10語
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '光熱費', 'こうねつひ', '광열비(전기·가스·수도비)', 'N2', '명사', '光熱費の節約のために省エネを心がける。', '광열비 절약을 위해 에너지 절약에 신경 쓴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='光熱費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '家賃', 'やちん', '집세, 월세', 'N2', '명사', '家賃が高くて生活が苦しい。', '집세가 비싸서 생활이 힘들다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='家賃' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '掃除', 'そうじ', '청소', 'N2', '명사', '週末にまとめて掃除をする。', '주말에 한꺼번에 청소를 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='掃除' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '洗濯', 'せんたく', '세탁', 'N2', '명사', '洗濯物が乾かない日が続いている。', '세탁물이 마르지 않는 날이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='洗濯' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '炊事', 'すいじ', '취사, 밥 짓기', 'N2', '명사', '炊事や洗濯など家事全般をこなす。', '취사와 세탁 등 가사 전반을 해낸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='炊事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廃品', 'はいひん', '폐품', 'N2', '명사', '廃品を回収してリサイクルする。', '폐품을 수거해 재활용한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃品' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生活費', 'せいかつひ', '생활비', 'N2', '명사', '物価が上がり生活費が増えた。', '물가가 올라 생활비가 늘었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生活費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暮らし', 'くらし', '생활, 살림', 'N2', '명사', '田舎の暮らしに憧れる人が増えている。', '시골 생활을 동경하는 사람이 늘고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暮らし' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引越し', 'ひっこし', '이사', 'N2', '명사', '新しい仕事のために引越しをした。', '새 직장을 위해 이사를 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引越し' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '近隣', 'きんりん', '근린, 이웃', 'N2', '명사', '近隣の住民と良好な関係を保つ。', '이웃 주민과 좋은 관계를 유지한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='近隣' AND jlpt_level='N2');

-- 생활 관련 동사 10語
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '汚染する', 'おせんする', '오염시키다', 'N2', '동사', '工場の排水が川を汚染した。', '공장 폐수가 강을 오염시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汚染する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '回復する', 'かいふくする', '회복하다', 'N2', '동사', '風邪をひいたが、一週間で回復した。', '감기에 걸렸지만 일주일 만에 회복했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='回復する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感染する', 'かんせんする', '감염되다', 'N2', '동사', 'ウイルスに感染しないよう手洗いを徹底する。', '바이러스에 감염되지 않도록 손 씻기를 철저히 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感染する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '治る', 'なおる', '낫다, 치료되다', 'N2', '동사', '風邪が早く治るよう薬を飲んだ。', '감기가 빨리 낫도록 약을 먹었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='治る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鍛える', 'きたえる', '단련하다', 'N2', '동사', '毎日トレーニングで体を鍛えている。', '매일 트레이닝으로 몸을 단련하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鍛える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '摂取する', 'せっしゅする', '섭취하다', 'N2', '동사', 'バランスよく栄養を摂取することが大切だ。', '균형 있게 영양을 섭취하는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='摂取する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '排出する', 'はいしゅつする', '배출하다', 'N2', '동사', '工場が有害物質を排出しないよう規制している。', '공장이 유해물질을 배출하지 않도록 규제하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='排出する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '枯れる', 'かれる', '시들다, 마르다', 'N2', '동사', '水をやらないと花が枯れてしまう。', '물을 주지 않으면 꽃이 시들어 버린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='枯れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '育てる', 'そだてる', '키우다, 육성하다', 'N2', '동사', '家庭菜園で野菜を育てている。', '텃밭에서 야채를 키우고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='育てる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '煮る', 'にる', '끓이다, 조리다', 'N2', '동사', '野菜を柔らかくなるまで煮る。', '야채가 부드러워질 때까지 끓인다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煮る' AND jlpt_level='N2');

-- 생활·건강·자연 관련 형용사 10語
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '清潔', 'せいけつ', '청결함', 'N2', 'な형용사', '清潔な環境を保つことが大切だ。', '청결한 환경을 유지하는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清潔' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '新鮮', 'しんせん', '신선함', 'N2', 'な형용사', '新鮮な魚を使った刺身が食べたい。', '신선한 생선을 사용한 회가 먹고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='新鮮' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '良質', 'りょうしつ', '양질(좋은 품질)', 'N2', 'な형용사', '良質な睡眠をとることが健康の基本だ。', '양질의 수면을 취하는 것이 건강의 기본이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='良質' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '冷たい', 'つめたい', '차갑다, 냉랭하다', 'N2', 'い형용사', '冷たい水を飲んで体を冷やした。', '차가운 물을 마셔 몸을 식혔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冷たい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '有害', 'ゆうがい', '유해함', 'N2', 'な형용사', '有害な化学物質が土壌に残っている。', '유해한 화학물질이 토양에 남아 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='有害' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '無害', 'むがい', '무해함', 'N2', 'な형용사', '人体に無害な素材を使用している。', '인체에 무해한 소재를 사용하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='無害' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '快適', 'かいてき', '쾌적함', 'N2', 'な형용사', '快適な住環境を整えることが大切だ。', '쾌적한 주거 환경을 갖추는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='快適' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '健全', 'けんぜん', '건전함', 'N2', 'な형용사', '健全な食生活を心がけている。', '건전한 식생활을 신경 쓰고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='健全' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '衛生的', 'えいせいてき', '위생적', 'N2', 'な형용사', '衛生的な環境で食品を管理する。', '위생적인 환경에서 식품을 관리한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='衛生的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '危険', 'きけん', '위험함', 'N2', 'な형용사', '台風の接近で外出が危険な状況だ。', '태풍 접근으로 외출이 위험한 상황이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='危険' AND jlpt_level='N2');
