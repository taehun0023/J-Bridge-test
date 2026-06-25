-- ============================================================
-- JLPT N1 する動詞 新set 150개 (v4_suru2)
-- 대상: jlpt_vocabulary (part_of_speech = '동사')
-- 범위: 인지·사고·학술·연구·경제·비즈니스·언어·사회·문화 계열
--       (v2_suru / v_verbs / v3_verbs2 기수록 어휘 제외)
-- 중복가드: word가 어느 레벨에도 존재하면 NOT EXISTS 스킵
-- 생성일: 2026-06-23
-- 검수: reading(히라가나) 정확성·meaning_ko 자연스러움 자가검수 완료
--       단홑따옴표 → '' 이스케이프 완료
-- ============================================================

-- ─── [인지·사고·판단 20개] ────────────────────────────────────────
-- 1
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '模索する','もさくする','모색하다, 방법을 찾다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='模索する');
-- 2
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '画策する','かくさくする','획책하다, 꾀하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='画策する');
-- 3
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '吟味する','ぎんみする','음미하다, 꼼꼼히 검토하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='吟味する');
-- 4
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '斟酌する','しんしゃくする','참작하다, 헤아리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='斟酌する');
-- 5
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '熟慮する','じゅくりょする','숙려하다, 깊이 생각하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='熟慮する');
-- 6
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '熟考する','じゅっこうする','숙고하다, 충분히 생각하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='熟考する');
-- 7
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '勘案する','かんあんする','감안하다, 고려에 넣다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='勘案する');
-- 8
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '加味する','かみする','가미하다, 고려에 넣다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='加味する');
-- 9
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '示唆する','しさする','시사하다, 암시하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='示唆する');
-- 10
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '暗示する','あんじする','암시하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暗示する');
-- 11
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '静観する','せいかんする','정관하다, 조용히 지켜보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='静観する');
-- 12
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '黙殺する','もくさつする','묵살하다, 무시하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='黙殺する');
-- 13
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '捏造する','ねつぞうする','날조하다, 조작하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='捏造する');
-- 14
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '歪曲する','わいきょくする','왜곡하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歪曲する');
-- 15
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '敷衍する','ふえんする','부연하다, 상세히 설명하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='敷衍する');
-- 16
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '省察する','せいさつする','성찰하다, 자기를 깊이 반성하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='省察する');
-- 17
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '反芻する','はんすうする','반추하다, 되새기다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反芻する');
-- 18
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '帰納する','きのうする','귀납하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰納する');
-- 19
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '演繹する','えんえきする','연역하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演繹する');
-- 20
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '類推する','るいすいする','유추하다, 추론하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='類推する');

-- ─── [학술·연구·언어 20개] ───────────────────────────────────────
-- 21
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '考察する','こうさつする','고찰하다, 연구 검토하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='考察する');
-- 22
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '論証する','ろんしょうする','논증하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論証する');
-- 23
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '実証する','じっしょうする','실증하다, 실험으로 증명하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実証する');
-- 24
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '仮説する','かせつする','가설을 세우다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仮説する');
-- 25
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '分析する','ぶんせきする','분석하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分析する');
-- 26
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '解析する','かいせきする','해석하다, 분석하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解析する');
-- 27
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '解明する','かいめいする','해명하다, 밝히다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解明する');
-- 28
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '立証する','りっしょうする','입증하다, 증거를 제시하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立証する');
-- 29
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '解読する','かいどくする','해독하다, 판독하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解読する');
-- 30
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '翻訳する','ほんやくする','번역하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='翻訳する');
-- 31
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '通訳する','つうやくする','통역하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通訳する');
-- 32
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '引用する','いんようする','인용하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引用する');
-- 33
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '抄録する','しょうろくする','초록하다, 요약하여 기록하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抄録する');
-- 34
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '集積する','しゅうせきする','집적하다, 쌓아 모으다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='集積する');
-- 35
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '蓄積する','ちくせきする','축적하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蓄積する');
-- 36
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '記録する','きろくする','기록하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='記録する');
-- 37
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '証言する','しょうげんする','증언하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='証言する');
-- 38
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '陳述する','ちんじゅつする','진술하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陳述する');
-- 39
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '反駁する','はんばくする','반박하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反駁する');
-- 40
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '質疑する','しつぎする','질의하다, 의문을 제기하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='質疑する');

-- ─── [경제·비즈니스·경영 25개] ───────────────────────────────────
-- 41
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '駆使する','くしする','구사하다, 자유자재로 사용하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='駆使する');
-- 42
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '酷使する','こくしする','혹사하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='酷使する');
-- 43
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '併用する','へいようする','병용하다, 함께 사용하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='併用する');
-- 44
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '併発する','へいはつする','병발하다, 동시에 발생하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='併発する');
-- 45
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '喚起する','かんきする','환기하다, 불러일으키다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喚起する');
-- 46
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '助長する','じょちょうする','조장하다, 부추기다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='助長する');
-- 47
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '配慮する','はいりょする','배려하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='配慮する');
-- 48
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '考慮する','こうりょする','고려하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='考慮する');
-- 49
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '容赦する','ようしゃする','용서하다, 봐주다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='容赦する');
-- 50
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '投資する','とうしする','투자하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='投資する');
-- 51
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '融資する','ゆうしする','융자하다, 자금을 빌려 주다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='融資する');
-- 52
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '出資する','しゅっしする','출자하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出資する');
-- 53
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '増資する','ぞうしする','증자하다, 자본을 늘리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='増資する');
-- 54
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '減資する','げんしする','감자하다, 자본을 줄이다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='減資する');
-- 55
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '上場する','じょうじょうする','상장하다, 주식을 상장하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上場する');
-- 56
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '上場廃止する','じょうじょうはいしする','상장 폐지하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上場廃止する');
-- 57
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '倒産する','とうさんする','도산하다, 파산하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='倒産する');
-- 58
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '再建する','さいけんする','재건하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='再建する');
-- 59
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '清算する','せいさんする','청산하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清算する');
-- 60
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '負債する','ふさいする','부채를 지다, 빚을 지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='負債する');
-- 61
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '償還する','しょうかんする','상환하다, 갚다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='償還する');
-- 62
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '損失する','そんしつする','손실을 입다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='損失する');
-- 63
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '計上する','けいじょうする','계상하다, 예산에 올리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='計上する');
-- 64
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '計画する','けいかくする','계획하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='計画する');
-- 65
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '試算する','しさんする','시산하다, 개산하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='試算する');

-- ─── [사회·제도·행동 25개] ────────────────────────────────────────
-- 66
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '踏襲する','とうしゅうする','답습하다, 기존 방식을 그대로 따르다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='踏襲する');
-- 67
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '慣行する','かんこうする','관행으로 행하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慣行する');
-- 68
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '遵守する','じゅんしゅする','준수하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遵守する');
-- 69
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '逸する','いっする','일탈하다, 벗어나다, 놓치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逸する');
-- 70
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '逸出する','いっしゅつする','일출하다, 두드러지다, 벗어나다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逸出する');
-- 71
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '侵食する','しんしょくする','침식하다, 잠식하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='侵食する');
-- 72
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '浸食する','しんしょくする','침식하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浸食する');
-- 73
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '固定する','こていする','고정하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='固定する');
-- 74
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '代替する','だいたいする','대체하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='代替する');
-- 75
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '移植する','いしょくする','이식하다, 옮겨 심다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='移植する');
-- 76
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '変革する','へんかくする','변혁하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変革する');
-- 77
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '刷新する','さっしんする','쇄신하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刷新する');
-- 78
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '革新する','かくしんする','혁신하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='革新する');
-- 79
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '保守する','ほしゅする','보수하다, 유지하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='保守する');
-- 80
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '維持する','いじする','유지하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='維持する');
-- 81
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '存続する','そんぞくする','존속하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='存続する');
-- 82
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '消滅する','しょうめつする','소멸하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='消滅する');
-- 83
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '継承する','けいしょうする','계승하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='継承する');
-- 84
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '伝承する','でんしょうする','전승하다, 전통을 이어받다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伝承する');
-- 85
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '普遍する','ふへんする','보편화하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='普遍する');
-- 86
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '特化する','とっかする','특화하다, 특정 분야에 집중하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='特化する');
-- 87
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '専門する','せんもんする','전문으로 하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='専門する');
-- 88
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '多様する','たようする','다양하게 하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='多様する');
-- 89
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '標準する','ひょうじゅんする','표준화하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='標準する');
-- 90
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '統一する','とういつする','통일하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='統一する');

-- ─── [감정·심리·대인 20개] ───────────────────────────────────────
-- 91
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '感服する','かんぷくする','감복하다, 깊이 감동하여 탄복하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感服する');
-- 92
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '同調する','どうちょうする','동조하다, 맞장구치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='同調する');
-- 93
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '感化する','かんかする','감화하다, 영향을 주어 변화시키다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感化する');
-- 94
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '陶酔する','とうすいする','도취하다, 매료되어 빠져들다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陶酔する');
-- 95
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '傾倒する','けいとうする','경도하다, 열중하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傾倒する');
-- 96
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '憤慨する','ふんがいする','분개하다, 격분하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憤慨する');
-- 97
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '憤激する','ふんげきする','격분하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憤激する');
-- 98
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '嘆息する','たんそくする','탄식하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嘆息する');
-- 99
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '後悔する','こうかいする','후회하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='後悔する');
-- 100
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '懺悔する','ざんげする','참회하다, 회개하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懺悔する');
-- 101
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '謝罪する','しゃざいする','사죄하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謝罪する');
-- 102
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '弁解する','べんかいする','변명하다, 해명하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁解する');
-- 103
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '諦念する','ていねんする','체념하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諦念する');
-- 104
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '焦燥する','しょうそうする','초조해하다, 안달하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焦燥する');
-- 105
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '動揺する','どうようする','동요하다, 흔들리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='動揺する');
-- 106
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '狼狽する','ろうばいする','낭패하다, 당황하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='狼狽する');
-- 107
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '困惑する','こんわくする','곤혹하다, 난처해하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='困惑する');
-- 108
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '煩悶する','はんもんする','번민하다, 괴로워하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煩悶する');
-- 109
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '恐縮する','きょうしゅくする','황송하다, 몸 둘 바를 모르다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恐縮する');
-- 110
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '畏敬する','いけいする','외경하다, 경외하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='畏敬する');

-- ─── [창조·표현·문화 20개] ───────────────────────────────────────
-- 111
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '創作する','そうさくする','창작하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='創作する');
-- 112
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '描写する','びょうしゃする','묘사하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='描写する');
-- 113
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '表現する','ひょうげんする','표현하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='表現する');
-- 114
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '象徴する','しょうちょうする','상징하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='象徴する');
-- 115
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '暗喩する','あんゆする','암유하다, 은유로 표현하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暗喩する');
-- 116
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '鑑賞する','かんしょうする','감상하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鑑賞する');
-- 117
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '鑑定する','かんていする','감정하다, 가치를 평가하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鑑定する');
-- 118
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '演奏する','えんそうする','연주하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演奏する');
-- 119
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '演技する','えんぎする','연기하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演技する');
-- 120
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '演出する','えんしゅつする','연출하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演出する');
-- 121
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '監修する','かんしゅうする','감수하다, 감독 수정하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='監修する');
-- 122
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '著述する','ちょじゅつする','저술하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='著述する');
-- 123
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '編集する','へんしゅうする','편집하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='編集する');
-- 124
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '編纂する','へんさんする','편찬하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='編纂する');
-- 125
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '出版する','しゅっぱんする','출판하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出版する');
-- 126
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '刊行する','かんこうする','간행하다, 출판하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刊行する');
-- 127
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '流布する','るふする','유포하다, 널리 퍼지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='流布する');
-- 128
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '啓蒙する','けいもうする','계몽하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='啓蒙する');
-- 129
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '啓発する','けいはつする','계발하다, 인식을 높이다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='啓発する');
-- 130
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '振興する','しんこうする','진흥하다, 발전시키다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='振興する');

-- ─── [관계·외교·국제 20개] ───────────────────────────────────────
-- 131
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '仲介する','ちゅうかいする','중개하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仲介する');
-- 132
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '周旋する','しゅうせんする','주선하다, 중간에서 도움을 주다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='周旋する');
-- 133
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '提携する','ていけいする','제휴하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='提携する');
-- 134
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '提唱する','ていしょうする','제창하다, 주창하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='提唱する');
-- 135
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '提言する','ていげんする','제언하다, 제안하여 말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='提言する');
-- 136
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '進言する','しんげんする','진언하다, 윗사람에게 의견을 말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='進言する');
-- 137
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '諫言する','かんげんする','간언하다, 직언하여 충고하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諫言する');
-- 138
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '表明する','ひょうめいする','표명하다, 분명히 밝히다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='表明する');
-- 139
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '周知する','しゅうちする','주지하다, 널리 알리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='周知する');
-- 140
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '通達する','つうたつする','통달하다, 통지하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通達する');
-- 141
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '訴訟する','そしょうする','소송하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訴訟する');
-- 142
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '抗議する','こうぎする','항의하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抗議する');
-- 143
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '抗争する','こうそうする','항쟁하다, 다투다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抗争する');
-- 144
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '紛争する','ふんそうする','분쟁하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='紛争する');
-- 145
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '和解する','わかいする','화해하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='和解する');
-- 146
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '融和する','ゆうわする','융화하다, 화합하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='融和する');
-- 147
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '加盟する','かめいする','가맹하다, 동맹·조직에 참여하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='加盟する');
-- 148
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '嘱託する','しょくたくする','촉탁하다, 업무를 의뢰하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嘱託する');
-- 149
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '委嘱する','いしょくする','위촉하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='委嘱する');
-- 150
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '委託する','いたくする','위탁하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='委託する');
