-- encoding: UTF-8
-- N2 語彙シード batch 16 (130語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: 衣食住・道具・買い物・サービス・観光・旅行
-- 読み確認: 標準辞書準拠
-- 중복제외: n2_vocab_words.txt 기존 1007어 전수 확인 완료

-- ============================================================
-- 衣類・ファッション (의류·패션) — 명사 22語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '衣類', 'いるい', '의류, 의복', 'N2', '명사', '衣類はきれいに畳んでしまう。', '의류는 깔끔하게 접어서 넣어두다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='衣類' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '衣装', 'いしょう', '의상, 의복', 'N2', '명사', '舞台衣装を着て踊る。', '무대 의상을 입고 춤추다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='衣装' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '着物', 'きもの', '기모노, 일본 전통 의복', 'N2', '명사', '成人式に着物を着た。', '성인식에 기모노를 입었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='着物' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '袖', 'そで', '소매', 'N2', '명사', '袖が長すぎて直してもらった。', '소매가 너무 길어서 수선해 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='袖' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '襟', 'えり', '깃, 옷깃', 'N2', '명사', 'シャツの襟が汚れていた。', '셔츠 깃이 더러워져 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='襟' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '裾', 'すそ', '옷단, 옷자락', 'N2', '명사', 'スカートの裾が濡れた。', '스커트 옷단이 젖었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='裾' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '縫い目', 'ぬいめ', '솔기, 바느질 자국', 'N2', '명사', '縫い目がほつれてきた。', '솔기가 풀려왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縫い目' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕立て', 'したて', '맞춤, 재단', 'N2', '명사', 'オーダーメイドの仕立てで作った。', '맞춤 재단으로 만들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕立て' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生地', 'きじ', '천, 원단', 'N2', '명사', '柔らかい生地で作ったシャツ。', '부드러운 원단으로 만든 셔츠.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生地' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '綿', 'めん', '면, 솜', 'N2', '명사', '綿素材のシャツは肌触りがいい。', '면 소재 셔츠는 피부 감촉이 좋다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='綿' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '麻', 'あさ', '삼베, 리넨', 'N2', '명사', '夏は麻の服が涼しくて快適だ。', '여름에는 삼베 옷이 시원하고 쾌적하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='麻' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絹', 'きぬ', '비단, 실크', 'N2', '명사', '絹のスカーフを贈り物にした。', '비단 스카프를 선물로 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絹' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '毛皮', 'けがわ', '모피', 'N2', '명사', '毛皮のコートは高価だ。', '모피 코트는 고가이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='毛皮' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '草履', 'ぞうり', '조리, 일본식 샌들', 'N2', '명사', '浴衣に草履を合わせた。', '유카타에 조리를 맞춰 신었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='草履' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '下駄', 'げた', '게타, 일본 나막신', 'N2', '명사', '下駄を履いてお祭りに行った。', '게타를 신고 축제에 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='下駄' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '帯', 'おび', '오비, 허리띠', 'N2', '명사', '着物に帯を締める。', '기모노에 오비를 두르다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帯' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手袋', 'てぶくろ', '장갑', 'N2', '명사', '冬は手袋が欠かせない。', '겨울에는 장갑이 빠질 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手袋' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '靴下', 'くつした', '양말', 'N2', '명사', '靴下に穴が開いた。', '양말에 구멍이 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='靴下' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '財布', 'さいふ', '지갑', 'N2', '명사', '財布を落としてしまった。', '지갑을 잃어버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='財布' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鞄', 'かばん', '가방', 'N2', '명사', '新しい鞄を買った。', '새 가방을 샀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鞄' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '装飾品', 'そうしょくひん', '장식품, 액세서리', 'N2', '명사', '装飾品で服に華やかさを加える。', '장식품으로 옷에 화려함을 더하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='装飾品' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '試着室', 'しちゃくしつ', '피팅룸, 탈의실', 'N2', '명사', '試着室で服を着てみた。', '피팅룸에서 옷을 입어봤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='試着室' AND jlpt_level='N2');

-- ============================================================
-- 食 (식생활·요리) — 명사 22語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食材', 'しょくざい', '식재료', 'N2', '명사', '新鮮な食材を市場で買う。', '신선한 식재료를 시장에서 산다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食材' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '調味料', 'ちょうみりょう', '조미료, 양념', 'N2', '명사', '調味料を入れすぎて辛くなった。', '조미료를 너무 많이 넣어서 매워졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='調味料' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出汁', 'だし', '국물, 육수', 'N2', '명사', '昆布で出汁を取る。', '다시마로 육수를 내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出汁' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '旬', 'しゅん', '제철', 'N2', '명사', '旬の野菜は栄養が豊富だ。', '제철 채소는 영양이 풍부하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='旬' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '炊事', 'すいじ', '취사, 취사일', 'N2', '명사', '毎日の炊事が大変だ。', '매일 밥을 짓는 일이 힘들다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='炊事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '包丁', 'ほうちょう', '식칼, 부엌칼', 'N2', '명사', '包丁を研いで切れ味を戻す。', '식칼을 갈아서 날카로움을 되찾다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='包丁' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'まな板', 'まないた', '도마', 'N2', '명사', 'まな板の上で野菜を切る。', '도마 위에서 채소를 썬다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まな板' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'フライパン', 'フライパン', '프라이팬', 'N2', '명사', 'フライパンで卵を焼く。', '프라이팬에 달걀을 굽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='フライパン' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おたま', 'おたま', '국자', 'N2', '명사', 'おたまでスープをすくう。', '국자로 수프를 뜨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おたま' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ざる', 'ざる', '채반, 소쿠리', 'N2', '명사', 'ざるで野菜の水を切る。', '채반으로 채소의 물기를 제거하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ざる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '器', 'うつわ', '그릇, 용기', 'N2', '명사', '料理を美しい器に盛り付ける。', '요리를 아름다운 그릇에 담다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '箸', 'はし', '젓가락', 'N2', '명사', '箸の使い方を練習した。', '젓가락 사용법을 연습했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='箸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '献立', 'こんだて', '메뉴, 식단', 'N2', '명사', '今週の献立を考える。', '이번 주 식단을 생각하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='献立' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '盛り付け', 'もりつけ', '담음새, 플레이팅', 'N2', '명사', '盛り付けが美しいと食欲がわく。', '담음새가 아름다우면 식욕이 생긴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='盛り付け' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '残飯', 'ざんぱん', '잔반, 남은 음식', 'N2', '명사', '残飯を捨てずに活用する。', '잔반을 버리지 않고 활용하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='残飯' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '賞味期限', 'しょうみきげん', '유통기한, 소비기한', 'N2', '명사', '賞味期限を確認してから食べる。', '유통기한을 확인하고 나서 먹다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='賞味期限' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食中毒', 'しょくちゅうどく', '식중독', 'N2', '명사', '夏は食中毒に注意が必要だ。', '여름에는 식중독에 주의가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食中毒' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食欲', 'しょくよく', '식욕', 'N2', '명사', '疲れると食欲がなくなる。', '피곤하면 식욕이 없어진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食欲' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食物繊維', 'しょくもつせんい', '식이섬유', 'N2', '명사', '食物繊維が豊富な野菜を食べる。', '식이섬유가 풍부한 채소를 먹다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食物繊維' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食費', 'しょくひ', '식비', 'N2', '명사', '毎月の食費を節約している。', '매달 식비를 절약하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '外食', 'がいしょく', '외식', 'N2', '명사', '忙しい時は外食が増える。', '바쁠 때는 외식이 늘어난다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='外食' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '定食', 'ていしょく', '정식, 세트 메뉴', 'N2', '명사', '昼は日替わり定食を注文した。', '점심은 일일 정식을 주문했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='定食' AND jlpt_level='N2');

-- ============================================================
-- 住 (주거) — 명사 16語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '家賃', 'やちん', '집세, 월세', 'N2', '명사', '家賃が高くて引越しを考えている。', '집세가 비싸서 이사를 생각하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='家賃' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引越し', 'ひっこし', '이사', 'N2', '명사', '引越しの手続きが大変だった。', '이사 절차가 힘들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引越し' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '光熱費', 'こうねつひ', '광열비, 공과금', 'N2', '명사', '冬は光熱費が高くなる。', '겨울에는 공과금이 높아진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='光熱費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生活費', 'せいかつひ', '생활비', 'N2', '명사', '生活費を抑えるために節約する。', '생활비를 줄이기 위해 절약하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生活費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '玄関', 'げんかん', '현관', 'N2', '명사', '玄関で靴を脱いで上がる。', '현관에서 신발을 벗고 올라가다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='玄関' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廊下', 'ろうか', '복도', 'N2', '명사', '廊下を静かに歩く。', '복도를 조용히 걷다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廊下' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '屋根', 'やね', '지붕', 'N2', '명사', '台風で屋根が壊れた。', '태풍으로 지붕이 부서졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='屋根' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '押し入れ', 'おしいれ', '벽장, 붙박이 수납장', 'N2', '명사', '押し入れに布団をしまう。', '벽장에 이불을 넣어두다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='押し入れ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '雨戸', 'あまど', '비바람 막이 덧문', 'N2', '명사', '台風の前に雨戸を閉めた。', '태풍 전에 덧문을 닫았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雨戸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '畳', 'たたみ', '다다미', 'N2', '명사', '畳の部屋でゆっくり休む。', '다다미 방에서 느긋하게 쉬다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='畳' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '縁側', 'えんがわ', '에니와 복도, 툇마루', 'N2', '명사', '縁側で日向ぼっこをする。', '툇마루에서 햇볕을 쬐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縁側' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '建設', 'けんせつ', '건설', 'N2', '명사', '新しいビルの建設が始まった。', '새 빌딩 건설이 시작되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='建設' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '改築', 'かいちく', '개축, 리모델링', 'N2', '명사', '古い家を改築してきれいにした。', '낡은 집을 개축해서 깨끗하게 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改築' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '水道', 'すいどう', '수도', 'N2', '명사', '水道の蛇口から水が漏れている。', '수도 수도꼭지에서 물이 새고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '下水', 'げすい', '하수, 하수도', 'N2', '명사', '下水管の詰まりを修理した。', '하수관 막힘을 수리했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='下水' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暖房', 'だんぼう', '난방', 'N2', '명사', '冬は暖房をつけて過ごす。', '겨울에는 난방을 켜고 지내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暖房' AND jlpt_level='N2');

-- ============================================================
-- 道具・器具 (도구·기구) — 명사 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '道具', 'どうぐ', '도구, 용구', 'N2', '명사', '大工道具を使って棚を作る。', '목수 도구를 써서 선반을 만들다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='道具' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '器具', 'きぐ', '기구, 기기', 'N2', '명사', '実験器具を丁寧に扱う。', '실험 기구를 정중히 다루다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='器具' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '金槌', 'かなづち', '쇠망치', 'N2', '명사', '金槌で釘を打つ。', '쇠망치로 못을 박다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='金槌' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ねじ回し', 'ねじまわし', '드라이버, 나사돌리개', 'N2', '명사', 'ねじ回しでネジを締める。', '드라이버로 나사를 조이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ねじ回し' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'はさみ', 'はさみ', '가위', 'N2', '명사', 'はさみで紙を切る。', '가위로 종이를 자르다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='はさみ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物差し', 'ものさし', '자, 눈금자', 'N2', '명사', '物差しで長さを測る。', '자로 길이를 재다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物差し' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひも', 'ひも', '끈, 줄', 'N2', '명사', 'ひもで荷物を縛る。', '끈으로 짐을 묶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひも' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '容器', 'ようき', '용기, 그릇', 'N2', '명사', '容器にふたをして保存する。', '용기에 뚜껑을 덮어서 보존하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='容器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蛇口', 'じゃぐち', '수도꼭지', 'N2', '명사', '蛇口をひねって水を出す。', '수도꼭지를 틀어서 물을 나오게 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蛇口' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '洗濯機', 'せんたくき', '세탁기', 'N2', '명사', '洗濯機で洗濯物をまとめて洗う。', '세탁기로 세탁물을 한꺼번에 빨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='洗濯機' AND jlpt_level='N2');

-- ============================================================
-- 買い物・サービス (쇼핑·서비스) — 명사 24語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '値段', 'ねだん', '가격, 값', 'N2', '명사', '値段が高くて買えなかった。', '가격이 비싸서 살 수 없었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='値段' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '定価', 'ていか', '정가', 'N2', '명사', '定価の半額で購入できた。', '정가의 절반 가격으로 구입할 수 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='定価' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '割引', 'わりびき', '할인', 'N2', '명사', '会員割引を利用してお得に買った。', '회원 할인을 이용해서 저렴하게 샀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='割引' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '値引き', 'ねびき', '가격 인하, 할인', 'N2', '명사', '値引きをお願いしたら応じてくれた。', '가격을 깎아달라고 하자 응해줬다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='値引き' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '特売', 'とくばい', '특가 판매, 세일', 'N2', '명사', '土曜日は特売日で混んでいる。', '토요일은 특가 판매일로 붐빈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='特売' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '品切れ', 'しなぎれ', '품절', 'N2', '명사', '人気商品が品切れになっていた。', '인기 상품이 품절이 되어 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='品切れ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕入れ', 'しいれ', '사들이기, 매입', 'N2', '명사', '店主は毎朝市場で仕入れをする。', '점주는 매일 아침 시장에서 매입을 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕入れ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見積もり', 'みつもり', '견적', 'N2', '명사', 'リフォームの見積もりを取る。', '리모델링 견적을 받다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見積もり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '請求書', 'せいきゅうしょ', '청구서', 'N2', '명사', '請求書に記載された金額を確認する。', '청구서에 기재된 금액을 확인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='請求書' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '領収書', 'りょうしゅうしょ', '영수증', 'N2', '명사', '領収書をもらって経費に申請する。', '영수증을 받아서 경비로 신청하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='領収書' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'レシート', 'レシート', '영수증 (구매 증빙)', 'N2', '명사', 'レシートを保管しておく。', '영수증을 보관해 두다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='レシート' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おつり', 'おつり', '거스름돈', 'N2', '명사', 'おつりを確認してから店を出た。', '거스름돈을 확인하고 나서 가게를 나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おつり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '会計', 'かいけい', '계산, 회계', 'N2', '명사', 'レジで会計を済ませる。', '계산대에서 계산을 마치다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='会計' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'クーポン', 'クーポン', '쿠폰', 'N2', '명사', 'クーポンを使って安く買えた。', '쿠폰을 사용해서 저렴하게 살 수 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='クーポン' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ポイント', 'ポイント', '포인트', 'N2', '명사', 'ポイントをためて景品と交換する。', '포인트를 모아서 경품과 교환하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ポイント' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '返品', 'へんぴん', '반품', 'N2', '명사', '不良品を店に返品した。', '불량품을 가게에 반품했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='返品' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '交換', 'こうかん', '교환', 'N2', '명사', 'サイズが合わず交換を求めた。', '사이즈가 맞지 않아 교환을 요청했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='交換' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '修理', 'しゅうり', '수리', 'N2', '명사', '壊れた自転車を修理に出した。', '부서진 자전거를 수리에 맡겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='修理' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '在庫', 'ざいこ', '재고', 'N2', '명사', '在庫を確認してから発注する。', '재고를 확인하고 나서 발주하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='在庫' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '送料', 'そうりょう', '배송비', 'N2', '명사', '送料無料のキャンペーンを利用した。', '배송비 무료 캠페인을 이용했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='送料' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '配達', 'はいたつ', '배달', 'N2', '명사', '荷物の配達が明日の予定だ。', '짐 배달이 내일 예정이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='配達' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宅配', 'たくはい', '택배', 'N2', '명사', '宅配で荷物を送った。', '택배로 짐을 보냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宅配' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '試着', 'しちゃく', '착용해보기, 피팅', 'N2', '명사', '試着してみてサイズを確認した。', '착용해보고 사이즈를 확인했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='試着' AND jlpt_level='N2');

-- ============================================================
-- 観光・旅行 (관광·여행) — 명사 21語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '観光地', 'かんこうち', '관광지', 'N2', '명사', '有名な観光地を巡る旅をした。', '유명한 관광지를 도는 여행을 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='観光地' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '名所', 'めいしょ', '명소', 'N2', '명사', '京都の名所を観光した。', '교토의 명소를 관광했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='名所' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '旅館', 'りょかん', '여관, 일본식 숙소', 'N2', '명사', '温泉旅館に一泊した。', '온천 여관에 하룻밤 묵었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='旅館' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宿泊', 'しゅくはく', '숙박', 'N2', '명사', 'ホテルに宿泊の予約をした。', '호텔에 숙박 예약을 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宿泊' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宿', 'やど', '숙소, 여관', 'N2', '명사', '旅先で宿を予約する。', '여행지에서 숙소를 예약하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宿' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出発', 'しゅっぱつ', '출발', 'N2', '명사', '朝早く出発して目的地に向かった。', '아침 일찍 출발해서 목적지로 향했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出発' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '到着', 'とうちゃく', '도착', 'N2', '명사', '飛行機が定刻通りに到着した。', '비행기가 정시에 도착했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='到着' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乗り換え', 'のりかえ', '환승', 'N2', '명사', '新宿で乗り換えをして渋谷に向かう。', '신주쿠에서 환승해서 시부야로 향하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗り換え' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乗車', 'じょうしゃ', '승차', 'N2', '명사', '乗車口から整列して乗る。', '승차구에서 줄 서서 타다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗車' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '降車', 'こうしゃ', '하차', 'N2', '명사', '次の停留所で降車する。', '다음 정류소에서 하차하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='降車' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '運賃', 'うんちん', '운임, 교통 요금', 'N2', '명사', '電車の運賃が値上がりした。', '전철 운임이 인상되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='運賃' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '航空', 'こうくう', '항공', 'N2', '명사', '航空券を早めに予約した。', '항공권을 일찍 예약했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='航空' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '航路', 'こうろ', '항로, 뱃길', 'N2', '명사', '台風で航路が変更になった。', '태풍으로 항로가 변경되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='航路' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '土産', 'みやげ', '기념품, 선물', 'N2', '명사', '旅行先で家族への土産を買った。', '여행지에서 가족에게 줄 기념품을 샀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='土産' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '案内', 'あんない', '안내', 'N2', '명사', '観光案内所で地図をもらった。', '관광 안내소에서 지도를 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='案内' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '予約', 'よやく', '예약', 'N2', '명사', 'レストランの予約を入れた。', '레스토랑 예약을 넣었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='予約' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発着', 'はっちゃく', '발착, 출발과 도착', 'N2', '명사', '発着が定刻通りで助かった。', '출발과 도착이 정시여서 다행이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発着' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '延着', 'えんちゃく', '연착', 'N2', '명사', '悪天候で飛行機が延着した。', '악천후로 비행기가 연착했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='延着' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '路線', 'ろせん', '노선', 'N2', '명사', '地下鉄の路線図を確認する。', '지하철 노선도를 확인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='路線' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '渋滞', 'じゅうたい', '교통 체증', 'N2', '명사', '道路が渋滞していて遅刻した。', '도로가 막혀서 지각했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='渋滞' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '迂回', 'うかい', '우회', 'N2', '명사', '工事のため迂回路を通った。', '공사로 인해 우회로를 통했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='迂回' AND jlpt_level='N2');

-- ============================================================
-- 衣食住・買い物 관련 동사 — 8語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '煮る', 'にる', '끓이다, 조리다', 'N2', '동사', '野菜をやわらかく煮る。', '채소를 부드럽게 조리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煮る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '炒める', 'いためる', '볶다', 'N2', '동사', '野菜と肉を一緒に炒める。', '채소와 고기를 함께 볶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='炒める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蒸す', 'むす', '찌다', 'N2', '동사', '蒸すと栄養が逃げにくい。', '찌면 영양이 빠져나가기 어렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蒸す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '刻む', 'きざむ', '잘게 썰다, 새기다', 'N2', '동사', '玉ねぎを細かく刻む。', '양파를 잘게 썰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刻む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '縫う', 'ぬう', '바느질하다, 꿰매다', 'N2', '동사', '破れた服を縫って直した。', '찢어진 옷을 바느질해서 고쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縫う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '染める', 'そめる', '물들이다, 염색하다', 'N2', '동사', '白い布を青く染める。', '흰 천을 파랗게 염색하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='染める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '泊まる', 'とまる', '묵다, 숙박하다', 'N2', '동사', '旅先のホテルに泊まった。', '여행지 호텔에 묵었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='泊まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '巡る', 'めぐる', '돌아다니다, 순회하다', 'N2', '동사', '観光地を巡る旅が楽しかった。', '관광지를 돌아다니는 여행이 즐거웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='巡る' AND jlpt_level='N2');

-- ============================================================
-- 衣食住・旅行 관련 い형용사 — 4語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '狭い', 'せまい', '좁다', 'N2', 'い형용사', '部屋が狭くて荷物が置けない。', '방이 좁아서 짐을 둘 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='狭い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '広い', 'ひろい', '넓다', 'N2', 'い형용사', '広いリビングがある家に住みたい。', '넓은 거실이 있는 집에 살고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='広い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '新鮮', 'しんせん', '신선함', 'N2', 'な형용사', '新鮮な魚を市場で買う。', '신선한 생선을 시장에서 사다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='新鮮' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '清潔', 'せいけつ', '청결함', 'N2', 'な형용사', '清潔な部屋を保つように心がける。', '청결한 방을 유지하도록 신경 쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清潔' AND jlpt_level='N2');

-- ============================================================
-- 관광·여행 관련 な형용사 — 3語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '快適', 'かいてき', '쾌적함', 'N2', 'な형용사', '快適な旅を楽しんだ。', '쾌적한 여행을 즐겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='快適' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '衛生的', 'えいせいてき', '위생적', 'N2', 'な형용사', '衛生的な環境で食事を楽しむ。', '위생적인 환경에서 식사를 즐기다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='衛生的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '便利', 'べんり', '편리함', 'N2', 'な형용사', '駅に近くて便利な場所に住む。', '역에 가깝고 편리한 곳에 살다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='便利' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不便', 'ふべん', '불편함', 'N2', 'な형용사', '交通が不便な地域に引っ越した。', '교통이 불편한 지역으로 이사했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不便' AND jlpt_level='N2');
