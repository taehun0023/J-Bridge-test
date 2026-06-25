-- ============================================================
-- JLPT N1 자연·신체·시간·공간·수량·물질·현상 명사 150개
-- 생성일: 2026-06-23
-- 중복가드: WHERE NOT EXISTS (word 기준)
-- 기존 파일(v_nouns.sql · v2_nouns2.sql) 수록어 제외
-- ============================================================

-- ============================================================
-- [자연·현상] 50개
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '兆候','ちょうこう','징후','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='兆候');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '均衡','きんこう','균형','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='均衡');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '飽和','ほうわ','포화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飽和');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '浸透','しんとう','침투, 스며듦','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浸透');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '凝固','ぎょうこ','응고','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凝固');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '蒸発','じょうはつ','증발','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蒸発');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '融解','ゆうかい','융해, 용해','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='融解');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '昇華','しょうか','승화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='昇華');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '酸化','さんか','산화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='酸化');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '還元','かんげん','환원','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='還元');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '分解','ぶんかい','분해','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分解');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '合成','ごうせい','합성','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合成');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '触媒','しょくばい','촉매','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='触媒');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '反応','はんのう','반응','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反応');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '連鎖','れんさ','연쇄','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='連鎖');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '波紋','はもん','파문','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='波紋');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '振動','しんどう','진동','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='振動');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '共鳴','きょうめい','공명','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='共鳴');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '屈折','くっせつ','굴절','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='屈折');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '反射','はんしゃ','반사','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反射');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '吸収','きゅうしゅう','흡수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='吸収');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '放射','ほうしゃ','방사','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='放射');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '熱伝導','ねつでんどう','열전도','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='熱伝導');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '対流','たいりゅう','대류','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='対流');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気流','きりゅう','기류','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気流');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '海流','かいりゅう','해류','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='海流');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '潮流','ちょうりゅう','조류, 흐름','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='潮流');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '降水','こうすい','강수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='降水');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '蒸散','じょうさん','증산(식물의 수분 방출)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蒸散');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '堆積','たいせき','퇴적','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='堆積');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '侵食','しんしょく','침식','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='侵食');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '地殻','ちかく','지각','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='地殻');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '断層','だんそう','단층','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='断層');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '隆起','りゅうき','융기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='隆起');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '沈降','ちんこう','침강','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='沈降');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '噴火','ふんか','분화(화산)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='噴火');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '溶岩','ようがん','용암','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='溶岩');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '火砕流','かさいりゅう','화쇄류','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='火砕流');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '津波','つなみ','쓰나미','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='津波');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '洪水','こうずい','홍수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='洪水');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '干ばつ','かんばつ','가뭄','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='干ばつ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '暴風','ぼうふう','폭풍','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暴風');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '竜巻','たつまき','토네이도, 회오리바람','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='竜巻');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '雷','かみなり','천둥, 번개','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雷');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '霜','しも','서리','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='霜');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '霧','きり','안개','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='霧');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '露','つゆ','이슬','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='露');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '霞','かすみ','아지랑이, 안개','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='霞');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '陽炎','かげろう','아지랑이','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陽炎');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '虹','にじ','무지개','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虹');

-- ============================================================
-- [신체·생리] 35개
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '網膜','もうまく','망막','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='網膜');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鼓動','こどう','고동, 심장 박동','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鼓動');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '痙攣','けいれん','경련','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='痙攣');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '分泌','ぶんぴつ','분비','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分泌');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '代謝','たいしゃ','대사(신진대사)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='代謝');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '呼吸','こきゅう','호흡','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呼吸');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '循環器','じゅんかんき','순환기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='循環器');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '消化器','しょうかき','소화기(기관)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='消化器');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '神経','しんけい','신경','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='神経');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '脊髄','せきずい','척수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脊髄');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '骨髄','こつずい','골수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='骨髄');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '軟骨','なんこつ','연골','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軟骨');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腱','けん','건(힘줄)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腱');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '筋繊維','きんせんい','근섬유','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='筋繊維');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '毛細血管','もうさいけっかん','모세혈관','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='毛細血管');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '動脈','どうみゃく','동맥','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='動脈');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '静脈','じょうみゃく','정맥','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='静脈');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '血小板','けっしょうばん','혈소판','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='血小板');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '白血球','はっけっきゅう','백혈구','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='白血球');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '赤血球','せっけっきゅう','적혈구','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='赤血球');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '血漿','けっしょう','혈장','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='血漿');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '胆汁','たんじゅう','담즙','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='胆汁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '膵液','すいえき','췌액, 이자액','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='膵液');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '唾液','だえき','타액, 침','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='唾液');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腺','せん','선(분비선)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腺');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '視神経','ししんけい','시신경','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='視神経');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '角膜','かくまく','각막','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='角膜');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '瞳孔','どうこう','동공','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='瞳孔');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鼓膜','こまく','고막','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鼓膜');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '耳小骨','じしょうこつ','이소골','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='耳小骨');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '嗅覚','きゅうかく','후각','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嗅覚');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '味覚','みかく','미각','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='味覚');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '触覚','しょっかく','촉각','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='触覚');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '聴覚','ちょうかく','청각','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='聴覚');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '視覚','しかく','시각(감각)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='視覚');

-- ============================================================
-- [시간·공간] 35개
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '瞬時','しゅんじ','순시, 순간','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='瞬時');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '恒久','こうきゅう','항구, 영속','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恒久');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '界隈','かいわい','일대, 부근','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='界隈');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '至近','しきん','지근(아주 가까움)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='至近');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '近辺','きんぺん','근변, 근처','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='近辺');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '刹那','せつな','찰나','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刹那');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一瞬','いっしゅん','일순간','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一瞬');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '永遠','えいえん','영원','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='永遠');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '年代','ねんだい','연대, 시대','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='年代');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '時代','じだい','시대','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='時代');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '世紀','せいき','세기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='世紀');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '暦','こよみ','달력, 역법','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暦');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '紀元','きげん','기원(연도)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='紀元');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '節目','ふしめ','변곡점, 마디','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節目');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '転換期','てんかんき','전환기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転換期');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過渡期','かとき','과도기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過渡期');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '空間','くうかん','공간','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='空間');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '領域','りょういき','영역','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='領域');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '範囲','はんい','범위','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='範囲');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '境界','きょうかい','경계','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='境界');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '隔たり','へだたり','간격, 거리','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='隔たり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '奥行き','おくゆき','안쪽 깊이, 깊이','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奥行き');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '幅','はば','폭, 너비','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幅');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '面積','めんせき','면적','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='面積');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '体積','たいせき','체적, 부피','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体積');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '奥地','おくち','오지, 오지 지역','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奥地');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '中枢','ちゅうすう','중추','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='中枢');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '周縁','しゅうえん','주연, 주변부','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='周縁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '辺境','へんきょう','변경, 오지','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='辺境');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '方位','ほうい','방위','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='方位');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '経度','けいど','경도(지리)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='経度');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '緯度','いど','위도','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緯度');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '標高','ひょうこう','표고, 해발고도','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='標高');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '水深','すいしん','수심','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水深');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '斜面','しゃめん','사면, 비탈','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='斜面');

-- ============================================================
-- [수량·물질·밀도] 30개
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '微量','びりょう','미량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='微量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過剰','かじょう','과잉','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過剰');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '欠乏','けつぼう','결핍','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='欠乏');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '凝縮','ぎょうしゅく','응축','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凝縮');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '密度','みつど','밀도','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='密度');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '濃度','のうど','농도','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='濃度');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '粘度','ねんど','점도','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粘度');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '透過率','とうかりつ','투과율','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='透過率');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '張力','ちょうりょく','장력, 표면장력','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='張力');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '引力','いんりょく','인력(중력)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引力');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '斥力','せきりょく','척력','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='斥力');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '質量','しつりょう','질량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='質量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '重力','じゅうりょく','중력','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='重力');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '比重','ひじゅう','비중','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='比重');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '容積','ようせき','용적','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='容積');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '容量','ようりょう','용량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='容量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '総量','そうりょう','총량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='総量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '残量','ざんりょう','잔량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='残量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '許容量','きょようりょう','허용량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='許容量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '上限','じょうげん','상한','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上限');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '下限','かげん','하한','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='下限');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '閾値','しきいち','임계값, 역치','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='閾値');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '基準値','きじゅんち','기준값','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='基準値');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '測定値','そくていち','측정값','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='測定値');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '誤差','ごさ','오차','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誤差');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '偏差','へんさ','편차','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='偏差');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '分散','ぶんさん','분산(통계)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分散');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '標本','ひょうほん','표본','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='標本');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '母集団','ぼしゅうだん','모집단','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='母集団');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '相関','そうかん','상관','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相関');
