-- ============================================================
-- JLPT N1 慣用句・四字熟語・ことわざ 150件 (Set 2)
-- v4_idiom2.sql — v_idiom.sql との重複は NOT EXISTS でスキップ
-- part_of_speech: '표현'
-- ============================================================

-- ============================================================
-- 慣用句 (70件)
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気が引ける','きがひける','꺼려지다, 마음이 켕기다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気が引ける');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '棚に上げる','たなにあげる','자신의 결점을 무시하다, 문제를 방치하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='棚に上げる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目を見張る','めをみはる','눈을 크게 뜨다, 놀라서 경탄하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目を見張る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '後手に回る','ごてにまわる','뒤처지다, 수동적 처지가 되다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='後手に回る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '輪をかける','わをかける','한층 더하다, 더욱 심하게 되다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輪をかける');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気を遣う','きをつかう','신경을 쓰다, 배려하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気を遣う');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気に障る','きにさわる','기분을 상하게 하다, 거슬리다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気に障る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気が散る','きがちる','마음이 산만해지다, 집중이 흐트러지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気が散る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気を揉む','きをもむ','애를 태우다, 안절부절못하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気を揉む');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気が向く','きがむく','마음이 내키다, 하고 싶어지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気が向く');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目を光らせる','めをひからせる','눈을 번뜩이다, 엄중히 감시하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目を光らせる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目を丸くする','めをまるくする','눈을 동그랗게 뜨다, 몹시 놀라다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目を丸くする');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目が回る','めがまわる','눈이 어지럽다, 매우 바쁘다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目が回る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目鼻が立つ','めはながたつ','윤곽이 잡히다, 대강 방향이 정해지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目鼻が立つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '口をそろえる','くちをそろえる','입을 맞추다, 모두 같은 말을 하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口をそろえる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '口をはさむ','くちをはさむ','말참견하다, 끼어들어 말하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口をはさむ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '口車に乗せる','くちぐるまにのせる','감언이설로 꾀다, 말로 속이다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口車に乗せる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手を切る','てをきる','관계를 끊다, 손을 떼다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手を切る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手を打つ','てをうつ','대책을 세우다, 손을 쓰다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手を打つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手が届く','てがとどく','손이 미치다, 세심히 배려가 닿다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手が届く');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手に負えない','てにおえない','감당할 수 없다, 어쩔 수 없다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手に負えない');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手を貸す','てをかす','도움의 손길을 내밀다, 거들어주다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手を貸す');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手が込む','てがこむ','공이 많이 들다, 복잡하고 정교하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手が込む');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '足がつく','あしがつく','꼬리가 잡히다, 범행이 탄로나다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='足がつく');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '足が出る','あしがでる','적자가 나다, 예산을 초과하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='足が出る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '足を運ぶ','あしをはこぶ','발길을 옮기다, 직접 찾아가다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='足を運ぶ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '足元を見る','あしもとをみる','약점을 간파하다, 상대의 약점을 이용하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='足元を見る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腹が立つ','はらがたつ','화가 나다, 속이 끓어오르다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腹が立つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腹を固める','はらをかためる','결심을 굳히다, 마음을 정하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腹を固める');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腹を探る','はらをさぐる','속마음을 떠보다, 의중을 살피다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腹を探る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頭を下げる','あたまをさげる','머리를 숙이다, 사과하거나 부탁하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頭を下げる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頭角を現す','とうかくをあらわす','두각을 나타내다, 재능이 두드러지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頭角を現す');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鼻をあかす','はなをあかす','코를 납작하게 만들다, 한 수 앞서 이기다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鼻をあかす');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '耳を疑う','みみをうたがう','귀를 의심하다, 믿기 어려운 말을 듣다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='耳を疑う');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '耳が早い','みみがはやい','소식에 밝다, 정보를 빨리 입수하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='耳が早い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '胸を借りる','むねをかりる','강자에게 덤벼 배움을 얻다, 실력자를 상대로 연습하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='胸を借りる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '胸に刻む','むねにきざむ','가슴에 새기다, 깊이 기억하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='胸に刻む');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '肩を持つ','かたをもつ','편을 들다, 두둔하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肩を持つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '背を向ける','せをむける','등을 돌리다, 외면하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='背を向ける');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腰を上げる','こしをあげる','허리를 들다, 드디어 행동을 개시하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腰を上げる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腰を折る','こしをおる','분위기를 깨다, 말을 중간에 끊다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腰を折る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '骨を折る','ほねをおる','힘을 다하다, 수고를 아끼지 않다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='骨を折る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '骨身を惜しまない','ほねみをおしまない','수고를 아끼지 않다, 몸을 아끼지 않고 일하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='骨身を惜しまない');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '汗をかく','あせをかく','땀을 흘리다, 수고하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汗をかく');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '血がつながる','ちがつながる','피가 이어지다, 혈연관계다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='血がつながる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '血の気が引く','ちのけがひく','핏기가 가시다, 놀라서 창백해지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='血の気が引く');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '根に持つ','ねにもつ','마음속에 담아두다, 원한을 품다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根に持つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '根を上げる','ねをあげる','포기하다, 항복하다, 지쳐서 손을 들다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根を上げる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '拍車をかける','はくしゃをかける','박차를 가하다, 더욱 촉진하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拍車をかける');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '幕を引く','まくをひく','막을 내리다, 일을 끝내다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幕を引く');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '幕を切って落とす','まくをきっておとす','막이 오르다, 본격적으로 시작되다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幕を切って落とす');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '折り紙つき','おりがみつき','정평이 나 있다, 보증이 붙어 있다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='折り紙つき');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '角が立つ','かどがたつ','모가 나다, 관계가 험악해지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='角が立つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '板につく','いたにつく','익숙해지다, 자리가 잡히다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='板につく');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '的を射る','まとをいる','핵심을 찌르다, 정확히 맞히다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='的を射る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '矢面に立つ','やおもてにたつ','화살받이에 서다, 비판의 최전선에 서다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='矢面に立つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '風向きが変わる','かざむきがかわる','풍향이 바뀌다, 형세가 달라지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='風向きが変わる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '波に乗る','なみにのる','파도를 타다, 좋은 흐름을 타다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='波に乗る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '火花を散らす','ひばなをちらす','불꽃을 튀기다, 치열하게 경쟁하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='火花を散らす');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '水を得た魚','みずをえたさかな','물을 만난 물고기, 제 분야에서 활기를 찾다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水を得た魚');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '石橋を叩いて渡る','いしばしをたたいてわたる','돌다리도 두드려 보고 건너다, 매우 신중하게 행동하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='石橋を叩いて渡る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '尻に火がつく','しりにひがつく','엉덩이에 불이 붙다, 다급한 상황이 되다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='尻に火がつく');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '尻をたたく','しりをたたく','독촉하다, 채근하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='尻をたたく');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '眉をひそめる','まゆをひそめる','눈살을 찌푸리다, 불쾌감을 드러내다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='眉をひそめる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '眉唾','まゆつば','속임수, 의심스러운 것','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='眉唾');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '喉から手が出る','のどからてがでる','목구멍에서 손이 나오다, 몹시 탐나다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喉から手が出る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '虫が知らせる','むしがしらせる','느낌이 오다, 예감이 들다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虫が知らせる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '虫の息','むしのいき','겨우 숨만 붙어 있다, 사경을 헤매다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虫の息');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '天狗になる','てんぐになる','으스대다, 잘난 체하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='天狗になる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '猫の手も借りたい','ねこのてもかりたい','고양이 손이라도 빌리고 싶다, 몹시 바쁘다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='猫の手も借りたい');

-- ============================================================
-- 四字熟語 (50件)
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '優柔不断','ゆうじゅうふだん','우유부단, 결단력이 없고 망설임','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優柔不断');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '質実剛健','しつじつごうけん','질실강건, 꾸밈없이 견실하고 씩씩함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='質実剛健');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '公明正大','こうめいせいだい','공명정대, 공정하고 떳떳함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公明正大');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '七転八倒','しちてんばっとう','칠전팔도, 몹시 고통스러워 몸부림침','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='七転八倒');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '森羅万象','しんらばんしょう','삼라만상, 우주의 온갖 사물과 현상','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='森羅万象');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不撓不屈','ふとうふくつ','불요불굴, 어떤 어려움에도 굴하지 않음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不撓不屈');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一念発起','いちねんほっき','일념발기, 굳게 결심하고 일어섬','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一念発起');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不惜身命','ふしゃくしんみょう','불석신명, 목숨을 아끼지 않고 헌신함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不惜身命');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '温厚篤実','おんこうとくじつ','온후독실, 온화하고 성실하며 두터움','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='温厚篤実');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '剛毅木訥','ごうきぼくとつ','강의목눌, 의지가 굳세고 말이 어눌하지만 진실함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='剛毅木訥');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '傍若無人','ぼうじゃくぶじん','방약무인, 주위를 아랑곳하지 않고 제멋대로 행동함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傍若無人');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '天衣無縫','てんいむほう','천의무봉, 꾸밈없이 자연스럽고 완벽함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='天衣無縫');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一言一行','いちごんいっこう','일언일행, 하나하나의 말과 행동','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一言一行');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '明鏡止水','めいきょうしすい','명경지수, 맑은 거울과 고요한 물처럼 고요하고 맑은 마음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='明鏡止水');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '切磋琢磨','せっさたくま','절차탁마, 서로 갈고닦으며 노력함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切磋琢磨');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '勇猛果敢','ゆうもうかかん','용맹과감, 용감하고 결단력이 있음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='勇猛果敢');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '孤立無援','こりつむえん','고립무원, 혼자 남아 아무런 도움도 없음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='孤立無援');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '悪戦苦闘','あくせんくとう','악전고투, 어려운 상황에서 힘껏 싸우고 고투함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悪戦苦闘');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '喜怒哀楽','きどあいらく','희로애락, 기쁨·분노·슬픔·즐거움','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喜怒哀楽');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自由奔放','じゆうほんぽう','자유분방, 구속 없이 마음대로 행동함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自由奔放');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '独立独歩','どくりつどっぽ','독립독보, 남에게 의지하지 않고 스스로 나아감','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='独立独歩');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '波乱万丈','はらんばんじょう','파란만장, 변화가 심하고 굴곡이 많음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='波乱万丈');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '用意周到','よういしゅうとう','용의주도, 빈틈없이 준비가 철저함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='用意周到');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '全力投球','ぜんりょくとうきゅう','전력투구, 온 힘을 다해 임함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='全力投球');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '四面楚歌','しめんそか','사면초가, 사방이 적으로 둘러싸인 고립 상태','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='四面楚歌');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一蓮托生','いちれんたくしょう','일련탁생, 운명을 함께함, 공동 운명체','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一蓮托生');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '呉越同舟','ごえつどうしゅう','오월동주, 적대 관계에 있는 자들이 같은 처지가 됨','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呉越同舟');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大山鳴動','たいざんめいどう','태산명동, 큰 소란이 있었지만 결과는 보잘것없음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大山鳴動');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '羊頭狗肉','ようとうくにく','양두구육, 겉과 속이 다름, 속임수','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='羊頭狗肉');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '竜頭蛇尾','りゅうとうだび','용두사미, 시작은 거창하나 끝이 보잘것없음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='竜頭蛇尾');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '東奔西走','とうほんせいそう','동분서주, 이리저리 바삐 뛰어다님','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='東奔西走');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '南船北馬','なんせんほくば','남선북마, 쉬지 않고 각지를 돌아다님','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='南船北馬');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '右往左往','うおうさおう','우왕좌왕, 갈피를 못 잡고 허둥댐','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='右往左往');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '八方美人','はっぽうびじん','팔방미인(일본어 용법: 모든 사람에게 잘 보이려 하는 사람)','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='八方美人');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一見識','いちけんしき','일가견, 독자적인 견해나 의견','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一見識');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '杓子定規','しゃくしじょうぎ','규칙이나 원칙에 지나치게 얽매임, 융통성 없음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='杓子定規');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '快刀乱麻','かいとうらんま','쾌도난마, 복잡한 문제를 시원하게 해결함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='快刀乱麻');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '盲点をつく','もうてんをつく','맹점을 찌르다, 허점을 공략하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='盲点をつく');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '天下無双','てんかむそう','천하무쌍, 세상에 둘도 없는','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='天下無双');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自問自答','じもんじとう','자문자답, 스스로 묻고 스스로 답함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自問自答');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '名実相伴う','めいじつあいともなう','명실상부하다, 이름과 실질이 함께 따르다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='名実相伴う');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過去帳に載る','かこちょうにのる','과거지사가 되다, 역사 속으로 사라지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過去帳に載る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '内憂外患','ないゆうがいかん','내우외환, 내부와 외부의 근심거리','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='内憂外患');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '文武両道','ぶんぶりょうどう','문무양도, 학문과 무예를 함께 닦음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='文武両道');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '和魂洋才','わこんようさい','화혼양재, 일본 정신에 서양 기술을 결합함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='和魂洋才');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '試練を乗り越える','しれんをのりこえる','시련을 극복하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='試練を乗り越える');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '虚心坦懐','きょしんたんかい','허심탄회, 아무 선입견 없이 솔직하고 공평한 마음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虚心坦懐');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '和衷協同','わちゅうきょうどう','화충협동, 마음을 합쳐 협력함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='和衷協同');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '深謀遠慮','しんぼうえんりょ','심모원려, 깊은 계략과 먼 미래를 내다보는 사려','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='深謀遠慮');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '山紫水明','さんしすいめい','산자수명, 경치가 매우 아름다움','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='山紫水明');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '花鳥風月','かちょうふうげつ','화조풍월, 자연의 아름다운 경치','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='花鳥風月');

-- ============================================================
-- ことわざ (30件)
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '猿も木から落ちる','さるもきからおちる','원숭이도 나무에서 떨어진다, 아무리 능숙한 사람도 실수한다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='猿も木から落ちる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '泣き面に蜂','なきつらにはち','설상가상, 울고 있는 얼굴에 벌이 쏨','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='泣き面に蜂');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '弘法にも筆の誤り','こうぼうにもふでのあやまり','원숭이도 나무에서 떨어진다(달리 표현), 달인도 실수한다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弘法にも筆の誤り');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '河童の川流れ','かっぱのかわながれ','수달도 물에 빠진다, 아무리 능숙해도 실수한다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='河童の川流れ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '人の噂も七十五日','ひとのうわさもしちじゅうごにち','사람의 소문도 칠십오 일, 소문은 곧 사그라진다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人の噂も七十五日');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '棚から牡丹餅','たなからぼたもち','뜻밖의 횡재(동의어 표현)','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='棚から牡丹餅');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '瓢箪から駒','ひょうたんからこま','박에서 말이 나오다, 뜻밖에 실현되다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='瓢箪から駒');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '捕らぬ狸の皮算用','とらぬたぬきのかわざんよう','아직 잡지도 못한 너구리 가죽 셈, 김칫국부터 마시다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='捕らぬ狸の皮算用');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '負け犬の遠吠え','まけいぬのとおぼえ','패배자의 허세, 실패한 자의 헛소리','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='負け犬の遠吠え');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鬼の目にも涙','おにのめにもなみだ','도깨비 눈에도 눈물, 냉혹한 사람도 가끔 인정을 보인다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鬼の目にも涙');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鬼に金棒','おににかなぼう','도깨비에게 금봉, 강한 자에게 더 큰 힘이 더해짐','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鬼に金棒');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '骨折り損のくたびれ儲け','ほねおりぞんのくたびれもうけ','헛고생, 힘만 들고 보람 없음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='骨折り損のくたびれ儲け');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '知らぬが仏','しらぬがほとけ','모르는 게 약, 모르면 괴롭지 않다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='知らぬが仏');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '渡る世間に鬼はない','わたるせけんにおにはない','세상에 나쁜 사람만 있는 것은 아니다, 의외로 친절한 사람이 많다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='渡る世間に鬼はない');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '袖振り合うも他生の縁','そでふりあうもたしょうのえん','길에서 스친 것도 전생의 인연','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='袖振り合うも他生の縁');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '縁は異なもの','えんはいなもの','인연은 묘한 것, 만남은 기묘하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縁は異なもの');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '光陰矢のごとし','こういんやのごとし','광음살같이, 세월은 화살처럼 빨리 지난다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='光陰矢のごとし');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一寸先は闇','いっすんさきはやみ','한 치 앞은 어둠, 미래는 알 수 없다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一寸先は闇');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過ぎたるは猶及ばざるが如し','すぎたるはなおおよばざるがごとし','지나침은 미치지 못함과 같다, 과유불급','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過ぎたるは猶及ばざるが如し');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '井の中の蛙大海を知らず','いのなかのかわずたいかいをしらず','우물 안 개구리, 견문이 좁은 사람','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='井の中の蛙大海を知らず');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '雨降って地固まる','あめふってじかたまる','비가 내리면 땅이 굳어진다, 어려움 후에 더 단단해진다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雨降って地固まる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '禍を転じて福となす','わざわいをてんじてふくとなす','화를 바꾸어 복으로 만들다, 전화위복','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='禍を転じて福となす');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '喉元過ぎれば熱さを忘れる','のどもとすぎればあつさをわすれる','목을 넘기면 뜨거움을 잊는다, 어려움이 지나면 금방 잊는다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喉元過ぎれば熱さを忘れる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頭隠して尻隠さず','あたまかくしてしりかくさず','머리는 숨기고 꼬리는 숨기지 못한다, 일부만 숨기고 전부 숨긴다 착각','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頭隠して尻隠さず');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '同病相憐れむ','どうびょうあいあわれむ','같은 병자끼리 서로 불쌍히 여긴다, 동병상련','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='同病相憐れむ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '藪から棒','やぶからぼう','덤불에서 갑자기 막대기, 뜬금없이 갑작스럽다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='藪から棒');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '七つの子','ななつのこ','칠 개의 새끼, 까마귀를 노래한 동요 관련 표현(예: 애정)','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='七つの子');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '仏の顔も三度','ほとけのかおもさんど','부처님 얼굴도 세 번, 아무리 관대해도 한계가 있다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仏の顔も三度');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '転ばぬ先の杖','ころばぬさきのつえ','넘어지기 전에 지팡이, 미리 대비하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転ばぬ先の杖');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '蓼食う虫も好き好き','たでくうむしもすきずき','쑥을 먹는 벌레도 취향이 있다, 사람마다 취향이 다르다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蓼食う虫も好き好き');
