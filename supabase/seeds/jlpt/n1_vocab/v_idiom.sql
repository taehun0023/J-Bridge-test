-- ============================================================
-- JLPT N1 四字熟語・慣用句・ことわざ・オノマトペ 150件
-- part_of_speech: 四字熟語/慣用句/ことわざ → '표현'  オノマトペ → '부사'
-- 重複ガード: WHERE NOT EXISTS で既存レコードをスキップ
-- ============================================================

-- ============================================================
-- 四字熟語 (60件)
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '臨機応変','りんきおうへん','임기응변, 상황에 따라 유연하게 대처함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='臨機応変');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '単刀直入','たんとうちょくにゅう','단도직입, 단칼에 바로 들어감','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='単刀直入');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自業自得','じごうじとく','자업자득, 스스로 저지른 일의 결과를 스스로 받음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自業自得');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '言語道断','ごんごどうだん','언어도단, 말도 안 되는 일','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言語道断');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一刀両断','いっとうりょうだん','일도양단, 단호하게 결말을 냄','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一刀両断');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '試行錯誤','しこうさくご','시행착오','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='試行錯誤');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '我田引水','がでんいんすい','아전인수, 자기에게 유리하게만 끌어들임','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='我田引水');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一目瞭然','いちもくりょうぜん','일목요연, 한눈에 분명함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一目瞭然');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '以心伝心','いしんでんしん','이심전심, 마음과 마음이 통함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='以心伝心');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '起死回生','きしかいせい','기사회생, 죽을 뻔하다 살아남, 절망적 상황에서 역전','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='起死回生');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '五里霧中','ごりむちゅう','오리무중, 방향을 전혀 알 수 없는 상태','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='五里霧中');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '温故知新','おんこちしん','온고지신, 옛것을 익혀 새것을 앎','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='温故知新');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一石二鳥','いっせきにちょう','일석이조','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一石二鳥');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '七転八起','しちてんはっき','칠전팔기, 여러 번 넘어져도 다시 일어남','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='七転八起');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '因果応報','いんがおうほう','인과응보, 선악의 행위는 반드시 그에 맞는 결과가 옴','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='因果応報');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自画自賛','じがじさん','자화자찬, 자기 일을 스스로 칭찬함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自画自賛');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '針小棒大','しんしょうぼうだい','침소봉대, 작은 일을 크게 부풀려 말함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='針小棒大');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '付和雷同','ふわらいどう','부화뇌동, 줏대 없이 남을 따라 행동함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='付和雷同');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '馬耳東風','ばじとうふう','마이동풍, 남의 말을 듣지 않고 흘려버림','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='馬耳東風');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '朝令暮改','ちょうれいぼかい','조령모개, 명령을 아침에 내렸다가 저녁에 바꿈','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='朝令暮改');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一期一会','いちごいちえ','일기일회, 일생에 한 번뿐인 만남','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一期一会');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '弱肉強食','じゃくにくきょうしょく','약육강식','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弱肉強食');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一進一退','いっしんいったい','일진일퇴, 좋아졌다 나빠졌다 반복함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一進一退');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '無我夢中','むがむちゅう','무아지경, 자신을 잊고 한 가지에 몰두함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='無我夢中');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '半信半疑','はんしんはんぎ','반신반의','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='半信半疑');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一喜一憂','いっきいちゆう','일희일비, 기쁨과 근심이 번갈아 옴','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一喜一憂');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大器晩成','たいきばんせい','대기만성, 큰 인물은 늦게 이루어짐','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大器晩成');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '厚顔無恥','こうがんむち','후안무치, 뻔뻔하고 부끄러움을 모름','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厚顔無恥');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '玉石混交','ぎょくせきこんこう','옥석혼교, 좋은 것과 나쁜 것이 뒤섞임','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='玉石混交');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '本末転倒','ほんまつてんとう','본말전도, 중요한 것과 그렇지 않은 것이 뒤바뀜','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='本末転倒');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '換骨奪胎','かんこつだったい','환골탈태, 원형을 바꾸어 새롭게 만듦','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='換骨奪胎');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '首尾一貫','しゅびいっかん','수미일관, 처음부터 끝까지 방침이 한결같음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='首尾一貫');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '前代未聞','ぜんだいみもん','전대미문, 지금까지 들은 적이 없는 일','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='前代未聞');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '空前絶後','くうぜんぜつご','공전절후, 전례 없고 앞으로도 없을 일','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='空前絶後');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一網打尽','いちもうだじん','일망타진, 한꺼번에 모두 잡음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一網打尽');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '千載一遇','せんざいいちぐう','천재일우, 천 년에 한 번 올까 말까 한 기회','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='千載一遇');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '四苦八苦','しくはっく','사고팔고, 몹시 애를 씀, 고생함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='四苦八苦');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '意気投合','いきとうごう','의기투합, 서로 마음이 맞아 하나가 됨','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意気投合');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '意気消沈','いきしょうちん','의기소침','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意気消沈');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '意気揚揚','いきようよう','의기양양','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意気揚揚');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一触即発','いっしょくそくはつ','일촉즉발, 건드리기만 해도 폭발할 위험한 상황','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一触即発');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '十人十色','じゅうにんといろ','십인십색, 사람마다 생각이나 취향이 다름','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='十人十色');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '二律背反','にりつはいはん','이율배반, 두 명제가 서로 모순되어 양립 불가','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='二律背反');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '三者三様','さんしゃさんよう','삼자삼양, 세 사람이 각각 다른 방식을 취함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='三者三様');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '曖昧模糊','あいまいもこ','애매모호, 불분명하고 흐릿한 상태','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='曖昧模糊');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自縄自縛','じじょうじばく','자승자박, 자신의 언행으로 자신을 옭아맴','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自縄自縛');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '得意満面','とくいまんめん','득의만면, 뜻대로 되어 만족한 표정이 가득함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='得意満面');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '満場一致','まんじょういっち','만장일치','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='満場一致');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '異口同音','いくどうおん','이구동성, 여러 사람이 같은 말을 함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='異口同音');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '有名無実','ゆうめいむじつ','유명무실, 이름뿐이고 실질이 없음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='有名無実');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '名実共に','めいじつともに','명실공히, 이름과 실질이 모두 갖춰짐','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='名実共に');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '取捨選択','しゅしゃせんたく','취사선택, 필요한 것은 취하고 불필요한 것은 버림','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取捨選択');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一長一短','いっちょういったん','일장일단, 좋은 점도 있고 나쁜 점도 있음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一長一短');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '紆余曲折','うよきょくせつ','우여곡절, 여러 가지 사정으로 복잡하게 꼬임','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='紆余曲折');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '百聞不如一見','ひゃくぶんはいっけんにしかず','백문불여일견, 백 번 듣는 것이 한 번 보는 것만 못함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='百聞不如一見');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '適材適所','てきざいてきしょ','적재적소, 알맞은 인재를 알맞은 자리에 씀','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='適材適所');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '二人三脚','ににんさんきゃく','이인삼각, 두 사람이 협력하여 일을 진행함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='二人三脚');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '急転直下','きゅうてんちょっか','급전직하, 상황이 급격히 바뀌어 결론으로 치달음','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急転直下');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一世風靡','いっせいふうび','일세풍미, 한 시대를 풍미함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一世風靡');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '粉骨砕身','ふんこつさいしん','분골쇄신, 몸이 가루가 되도록 힘을 다함','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粉骨砕身');

-- ============================================================
-- 慣用句 (50件)
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '油を売る','あぶらをうる','빈둥거리다, 일을 게을리 하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='油を売る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腹を割る','はらをわる','속마음을 털어놓다, 솔직하게 이야기하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腹を割る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '念を押す','ねんをおす','다짐을 받다, 거듭 확인하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='念を押す');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '釘を刺す','くぎをさす','단단히 못을 박다, 엄하게 타이르다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='釘を刺す');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '顔が広い','かおがひろい','얼굴이 넓다, 아는 사람이 많다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顔が広い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '骨が折れる','ほねがおれる','힘이 들다, 고생이 많다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='骨が折れる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手を焼く','てをやく','애를 먹다, 다루기 어렵다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手を焼く');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '足を引っ張る','あしをひっぱる','발목을 잡다, 방해하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='足を引っ張る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目をつぶる','めをつぶる','눈을 감다, 모른 척하다, 눈감아 주다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目をつぶる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '耳を傾ける','みみをかたむける','귀를 기울이다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='耳を傾ける');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '口を割る','くちをわる','입을 열다, 자백하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口を割る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頭を抱える','あたまをかかえる','머리를 감싸 쥐다, 몹시 고민하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頭を抱える');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '水を向ける','みずをむける','상대가 말하도록 유도하다, 말을 꺼내도록 유인하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水を向ける');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '水に流す','みずにながす','없던 일로 하다, 과거를 묻어버리다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水に流す');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '火に油を注ぐ','ひにあぶらをそそぐ','불에 기름을 붓다, 사태를 더 악화시키다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='火に油を注ぐ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '胸を打つ','むねをうつ','가슴을 울리다, 감동을 주다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='胸を打つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '肩を並べる','かたをならべる','어깨를 나란히 하다, 동등한 위치에 서다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肩を並べる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '肩の荷が下りる','かたのにがおりる','어깨의 짐이 내려지다, 책임에서 해방되어 홀가분해지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肩の荷が下りる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '顔色をうかがう','かおいろをうかがう','눈치를 보다, 상대의 기색을 살피다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顔色をうかがう');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目から鱗が落ちる','めからうろこがおちる','눈에서 비늘이 떨어지다, 깨달음을 얻다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目から鱗が落ちる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鼻につく','はなにつく','냄새가 코를 찌르다, 역겹다, 거만함이 비위에 거슬리다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鼻につく');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鼻が高い','はながたかい','콧대가 높다, 자랑스럽다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鼻が高い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '舌を巻く','したをまく','혀를 내두르다, 놀라서 탄복하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='舌を巻く');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腰を据える','こしをすえる','단단히 자리를 잡다, 본격적으로 임하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腰を据える');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腰が低い','こしがひくい','허리가 낮다, 겸손하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腰が低い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腰が引ける','こしがひける','소극적이 되다, 뒤로 물러서다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腰が引ける');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気が置けない','きがおけない','마음을 놓을 수 있다, 격의 없이 편한','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気が置けない');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気が利く','きがきく','재치 있다, 눈치가 빠르다, 세심하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気が利く');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気が長い','きがながい','느긋하다, 참을성이 있다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気が長い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気が短い','きがみじかい','성급하다, 참을성이 없다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気が短い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '胸がいっぱいになる','むねがいっぱいになる','가슴이 벅차오르다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='胸がいっぱいになる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腹に据えかねる','はらにすえかねる','분노를 참을 수 없다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腹に据えかねる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '二の足を踏む','にのあしをふむ','망설이다, 주저하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='二の足を踏む');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '水を差す','みずをさす','찬물을 끼얹다, 방해하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水を差す');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '歯が立たない','はがたたない','상대가 되지 않다, 손도 쓸 수 없다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歯が立たない');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手に余る','てにあまる','감당할 수 없다, 손에 넘치다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手に余る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手を尽くす','てをつくす','온갖 수단을 다하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手を尽くす');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '口が堅い','くちがかたい','입이 무겁다, 비밀을 잘 지킨다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口が堅い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '口が軽い','くちがかるい','입이 가볍다, 비밀을 잘 못 지킨다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口が軽い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目が肥える','めがこえる','안목이 높다, 보는 눈이 있다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目が肥える');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目をかける','めをかける','눈여겨보다, 특별히 아끼다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目をかける');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '耳が痛い','みみがいたい','귀가 아프다, 듣기 거북한 말이 뼈에 사무치다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='耳が痛い');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '耳にタコができる','みみにたこができる','귀에 굳은살이 박이다, 같은 말을 너무 많이 들어 질리다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='耳にタコができる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一肌脱ぐ','ひとはだぬぐ','한 번 힘써 돕다, 적극적으로 협력하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一肌脱ぐ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '息をのむ','いきをのむ','숨을 삼키다, 긴장하거나 놀라다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='息をのむ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '顔が立つ','かおがたつ','체면이 서다, 명예가 지켜지다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顔が立つ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '顔をつぶす','かおをつぶす','체면을 구기다, 망신을 주다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顔をつぶす');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '肝が据わる','きもがすわる','담력이 생기다, 배짱이 두둑하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肝が据わる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '肝を冷やす','きもをひやす','간을 식히다, 몹시 놀라 식은땀을 흘리다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肝を冷やす');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頭が上がらない','あたまがあがらない','머리를 들 수 없다, 꼼짝 못하다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頭が上がらない');

-- ============================================================
-- ことわざ (25件)
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '七転び八起き','ななころびやおき','칠전팔기, 몇 번 쓰러져도 다시 일어남','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='七転び八起き');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '石の上にも三年','いしのうえにもさんねん','석 위에도 삼 년, 인내하면 결실을 맺는다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='石の上にも三年');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '急がば回れ','いそがばまわれ','서두르면 돌아가라, 급할수록 돌아가라','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急がば回れ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '灯台下暗し','とうだいもとくらし','등대 밑이 어둡다, 가까운 것을 모른다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='灯台下暗し');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '覆水盆に返らず','ふくすいぼんにかえらず','엎질러진 물은 다시 담을 수 없다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='覆水盆に返らず');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '虎穴に入らずんば虎子を得ず','こけつにいらずんばこじをえず','호랑이 굴에 들어가지 않으면 호랑이 새끼를 얻을 수 없다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虎穴に入らずんば虎子を得ず');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '案ずるより産むが易し','あんずるよりうむがやすし','걱정하는 것보다 해보는 게 낫다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='案ずるより産むが易し');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '二兎を追う者は一兎をも得ず','にとをおうものはいっとをもえず','두 마리 토끼를 쫓는 자는 한 마리도 잡지 못한다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='二兎を追う者は一兎をも得ず');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '長い目で見る','ながいめでみる','긴 눈으로 보다, 장기적인 시각으로 바라보다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='長い目で見る');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '出る杭は打たれる','でるくいはうたれる','튀어나온 말뚝은 얻어맞는다, 나서는 사람은 제재를 받는다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出る杭は打たれる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '棚からぼた餅','たなからぼたもち','뜻밖의 행운','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='棚からぼた餅');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '塵も積もれば山となる','ちりもつもればやまとなる','티끌 모아 태산','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='塵も積もれば山となる');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '失敗は成功のもと','しっぱいはせいこうのもと','실패는 성공의 어머니','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='失敗は成功のもと');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '類は友を呼ぶ','るいはともをよぶ','유유상종, 같은 종류끼리 모인다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='類は友を呼ぶ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '情けは人のためならず','なさけはひとのためならず','친절은 남을 위한 것이 아니라 결국 자신에게 돌아온다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='情けは人のためならず');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '口は禍の元','くちはわざわいのもと','입은 재앙의 근원','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口は禍の元');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '好事魔多し','こうじまおおし','좋은 일에는 방해가 많다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='好事魔多し');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '待てば海路の日和あり','まてばかいろのひよりあり','기다리면 좋은 때가 온다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='待てば海路の日和あり');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '身から出た錆','みからでたさび','스스로 초래한 화, 자업자득','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='身から出た錆');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '蛙の子は蛙','かえるのこはかえる','개구리 새끼는 개구리, 부전자전','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蛙の子は蛙');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '立つ鳥跡を濁さず','たつとりあとをにごさず','떠나는 새는 뒷자리를 더럽히지 않는다, 뒷마무리를 깔끔히','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立つ鳥跡を濁さず');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '能ある鷹は爪を隠す','のうあるたかはつめをかくす','능력 있는 매는 발톱을 감춘다, 실력자는 함부로 드러내지 않는다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='能ある鷹は爪を隠す');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '三人寄れば文殊の知恵','さんにんよればもんじゅのちえ','세 사람이 모이면 문수보살의 지혜, 세 명이 모이면 좋은 지혜가 나온다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='三人寄れば文殊の知恵');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '郷に入っては郷に従え','ごうにいってはごうにしたがえ','로마에 가면 로마법을 따르라','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='郷に入っては郷に従え');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '時は金なり','ときはかねなり','시간은 금이다','N1','표현'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='時は金なり');

-- ============================================================
-- オノマトペ (15件) — part_of_speech='부사'
-- ============================================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひしひし','ひしひし','뼈저리게, 절절히 (감정이 몸에 스며드는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひしひし');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'まざまざ','まざまざ','뚜렷이, 생생하게 (눈앞에 보듯이 선명한 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まざまざ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'つくづく','つくづく','곰곰이, 절실히 (깊이 느끼거나 생각하는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='つくづく');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ありありと','ありありと','역력히, 생생하게 (과거의 기억 등이 눈앞에 떠오르는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ありありと');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひたすら','ひたすら','오로지, 한결같이 (한 가지에만 집중하는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひたすら');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'じわじわ','じわじわ','서서히, 천천히 스며들듯 (점점 퍼지거나 증가하는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='じわじわ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ぼんやり','ぼんやり','멍하니, 흐릿하게 (의식이 희미하거나 윤곽이 불분명한 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぼんやり');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'こんこん','こんこん','콜록콜록 (기침 소리), 깊이 잠든 모양','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='こんこん');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'しみじみ','しみじみ','찬찬히, 진심으로 (감회가 깊이 스며드는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しみじみ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'うろうろ','うろうろ','어슬렁어슬렁, 우왕좌왕 (목적 없이 돌아다니는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うろうろ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もたもた','もたもた','꾸물꾸물, 느릿느릿 (행동이 굼뜬 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もたもた');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'てきぱき','てきぱき','척척, 일사불란하게 (빠르고 능률적으로 일하는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='てきぱき');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ぼろぼろ','ぼろぼろ','너덜너덜, 줄줄 (낡아서 삭거나 눈물이 흐르는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぼろぼろ');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'くっきり','くっきり','뚜렷이, 선명하게 (윤곽이 또렷한 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='くっきり');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ふらふら','ふらふら','비틀비틀, 휘청휘청 (몸이 흔들리거나 정처 없이 헤매는 모양)','N1','부사'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ふらふら');
