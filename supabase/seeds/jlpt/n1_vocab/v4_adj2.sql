-- ============================================================
-- JLPT N1 い형용사·な형용사·부사 150개 (v4_adj2)
-- part_of_speech: 'い형용사' / 'な형용사' / '부사'
-- 중복가드(WHERE NOT EXISTS) 포함
-- ============================================================

-- ─── い형용사 50 ───

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '快い','こころよい','상쾌하다, 기분 좋다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='快い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '清々しい','すがすがしい','청량하다, 상쾌하고 맑다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清々しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目覚ましい','めざましい','눈부시다, 놀랍다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目覚ましい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '華々しい','はなばなしい','화려하다, 눈부시게 화사하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='華々しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '名残惜しい','なごりおしい','섭섭하다, 아쉽다, 미련이 남다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='名残惜しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '痛ましい','いたましい','가슴 아프다, 처참하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='痛ましい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手厚い','てあつい','융숭하다, 정성스럽다, 각별하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手厚い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'たくましい','たくましい','억세다, 씩씩하다, 강인하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たくましい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '物寂しい','ものさびしい','왠지 쓸쓸하다, 고적하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物寂しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'せわしない','せわしない','분주하다, 바쁘다, 여유가 없다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='せわしない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '床しい','ゆかしい','그윽하다, 품위 있다, 마음이 끌리다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='床しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '奥深い','おくふかい','깊이가 있다, 심오하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奥深い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手強い','てごわい','만만치 않다, 다루기 어렵다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手強い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '見苦しい','みぐるしい','보기 흉하다, 볼썽사납다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見苦しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '聞き苦しい','ききぐるしい','듣기 거북하다, 귀에 거슬리다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='聞き苦しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '煩わしい','わずらわしい','번잡스럽다, 귀찮다, 성가시다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煩わしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '嘆かわしい','なげかわしい','한탄스럽다, 개탄스럽다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嘆かわしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '疎い','うとい','어둡다(사정에), 소홀하다, 낯설다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疎い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '際どい','きわどい','아슬아슬하다, 위험하다, 아찔하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='際どい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '厭わしい','いとわしい','싫다, 불쾌하다, 역겹다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厭わしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腹立たしい','はらだたしい','화가 나다, 짜증스럽다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腹立たしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '空々しい','そらぞらしい','시치미 떼는, 뻔뻔하다, 딴청 부리다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='空々しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目まぐるしい','めまぐるしい','눈이 어지럽다, 눈부시게 빠르다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目まぐるしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '物々しい','ものものしい','삼엄하다, 물샐 틈 없다, 위용 있다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物々しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '根気強い','こんきづよい','끈기 있다, 참을성이 강하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根気強い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '疑わしい','うたがわしい','의심스럽다, 믿기 어렵다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疑わしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '嘘くさい','うそくさい','거짓말 같다, 믿기지 않다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嘘くさい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '晴れがましい','はれがましい','화려하다, 자랑스럽다, 당당하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='晴れがましい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '勇ましい','いさましい','용감하다, 씩씩하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='勇ましい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '憎らしい','にくらしい','미울 정도로 잘하다, 얄밉다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憎らしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手ぬるい','てぬるい','느슨하다, 솜방망이다, 온건하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手ぬるい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '喜ばしい','よろこばしい','기쁘다, 경사스럽다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喜ばしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '目障り','めざわり','눈에 거슬림, 보기 거북함','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目障り');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '情けない','なさけない','한심하다, 서글프다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='情けない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気まずい','きまずい','어색하다, 서먹서먹하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気まずい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '世知辛い','せちがらい','세상살이가 팍팍하다, 각박하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='世知辛い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '際立った','きわだった','두드러진, 돋보이는','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='際立った');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '誇らしい','ほこらしい','자랑스럽다, 뿌듯하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誇らしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'しなやかな','しなやかな','유연하다, 탄력 있다, 부드럽다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しなやかな');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '馬鹿らしい','ばからしい','어리석다, 쓸데없다, 바보 같다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='馬鹿らしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気がかり','きがかり','걱정, 마음에 걸림','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気がかり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手荒い','てあらい','난폭하다, 거칠다, 무자비하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手荒い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '煙たい','けむたい','거북하다, 어렵다, 연기가 자욱하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煙たい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '小うるさい','こうるさい','성가시다, 잔소리가 많다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='小うるさい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気恥ずかしい','きはずかしい','부끄럽다, 멋쩍다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気恥ずかしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '著しい','いちじるしい','현저하다, 두드러지다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='著しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '甚だしい','はなはだしい','매우 심하다, 대단하다, 극심하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='甚だしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '卑しい','いやしい','천하다, 비천하다, 인색하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卑しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '儚い','はかない','덧없다, 무상하다, 허망하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='儚い');

-- ─── な형용사 50 ───

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '円熟した','えんじゅくした','원숙하다, 완숙하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='円熟した');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '老練な','ろうれんな','노련하다, 경험이 풍부하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='老練な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '巧妙な','こうみょうな','교묘하다, 솜씨 있다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='巧妙な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '稚拙な','ちせつな','치졸하다, 유치하고 서투르다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='稚拙な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '克明な','こくめいな','상세하다, 꼼꼼하다, 치밀하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='克明な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '克己的な','こっきてきな','극기적이다, 자기를 억제하는','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='克己的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '卑劣な','ひれつな','비열하다, 치졸하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卑劣な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '俊敏な','しゅんびんな','민첩하다, 재빠르다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='俊敏な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '矮小な','わいしょうな','왜소하다, 소규모의','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='矮小な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '雄大な','ゆうだいな','웅장하다, 장대하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雄大な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '哀愁漂う','あいしゅうただよう','애수가 감돈다, 쓸쓸한 분위기다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='哀愁漂う');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不可侵な','ふかしんな','침범할 수 없는, 불가침의','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不可侵な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '尚早な','しょうそうな','시기상조이다, 너무 이르다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='尚早な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '怠慢な','たいまんな','태만하다, 나태하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='怠慢な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '傲慢な','ごうまんな','오만하다, 거만하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傲慢な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '迅速な','じんそくな','신속하다, 빠르다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='迅速な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '緻密な','ちみつな','치밀하다, 정교하다, 세밀하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緻密な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '奇抜な','きばつな','기발하다, 특이하다, 엉뚱하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奇抜な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '荘厳な','そうごんな','장엄하다, 엄숙하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='荘厳な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '閑静な','かんせいな','조용하다, 한적하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='閑静な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '多岐な','たきな','다방면의, 다양하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='多岐な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '煩雑な','はんざつな','번잡하다, 복잡하고 번거롭다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煩雑な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '安直な','あんちょくな','안이하다, 손쉽다, 값이 싸다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安直な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大雑把な','おおざっぱな','대충이다, 거칠다, 세밀하지 않다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大雑把な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '寛大な','かんだいな','관대하다, 너그럽다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寛大な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過酷な','かこくな','가혹하다, 혹독하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過酷な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '悠長な','ゆうちょうな','느긋하다, 여유 있다, 태평하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悠長な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '卓越した','たくえつした','탁월하다, 뛰어나다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卓越した');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '拙速な','せっそくな','졸속이다, 서투르고 빠르다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拙速な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不遜な','ふそんな','오만하다, 건방지다, 무례하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不遜な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '謙虚な','けんきょな','겸허하다, 겸손하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謙虚な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '軽薄な','けいはくな','경박하다, 가볍고 천박하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軽薄な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '厳粛な','げんしゅくな','엄숙하다, 엄중하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厳粛な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '稀有な','けうな','드물다, 희귀하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='稀有な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '抜本的な','ばっぽんてきな','근본적이다, 발본적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜本的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '欺瞞的な','ぎまんてきな','기만적이다, 속임수적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='欺瞞的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '峻厳な','しゅんげんな','준엄하다, 엄격하고 위엄 있다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='峻厳な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '内在的な','ないざいてきな','내재적이다, 내부에 존재하는','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='内在的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '包括的な','ほうかつてきな','포괄적이다, 망라하는','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='包括的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '消極的な','しょうきょくてきな','소극적이다, 수동적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='消極的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '積極的な','せっきょくてきな','적극적이다, 능동적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='積極的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '曖昧な','あいまいな','애매하다, 모호하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='曖昧な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '率先的な','そっせんてきな','솔선하는, 앞장서는','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='率先的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '柔軟な','じゅうなんな','유연하다, 융통성 있다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='柔軟な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '冷淡な','れいたんな','냉담하다, 관심이 없다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冷淡な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過渡的な','かとてきな','과도기적이다, 전환 단계의','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過渡的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '繊細な','せんさいな','섬세하다, 세심하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='繊細な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '多大な','ただいな','막대하다, 매우 크다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='多大な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '緩慢な','かんまんな','완만하다, 느릿느릿하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緩慢な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '顕著な','けんちょな','현저하다, 두드러지다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顕著な');

-- ─── 부사 50 ───

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一挙に','いっきょに','단번에, 일거에','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一挙に');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '徐々に','じょじょに','서서히, 천천히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='徐々に');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '順次','じゅんじ','순차적으로, 차례로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='順次');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '逐一','ちくいち','하나하나, 일일이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逐一');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '随時','ずいじ','수시로, 때때로, 필요할 때마다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='随時');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '総じて','そうじて','전반적으로, 대체로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='総じて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '依然として','いぜんとして','여전히, 의연하게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='依然として');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '概して','がいして','대체로, 일반적으로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='概して');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '否が応でも','いやがおうでも','싫든 좋든, 어쩔 수 없이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='否が応でも');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '粛々と','しゅくしゅくと','숙연하게, 조용히 착실히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粛々と');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '刻々と','こくこくと','시각시각, 시시각각으로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刻々と');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '取り立てて','とりたてて','특별히, 굳이 (부정문에서)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り立てて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '散々','さんざん','실컷, 무지하게, 아주 심하게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='散々');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '難なく','なんなく','거뜬히, 어려움 없이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='難なく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '滔々と','とうとうと','도도하게, 거침없이 (말·물결)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滔々と');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'おしなべて','おしなべて','대체로, 고르게, 한결같이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おしなべて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'まことに','まことに','정말로, 참으로, 진심으로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まことに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'めっきり','めっきり','부쩍, 확연히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='めっきり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'うかうか','うかうか','멍하니, 방심하여, 엉겁결에','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うかうか');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひそかに','ひそかに','몰래, 은밀하게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひそかに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'まさに','まさに','바로, 정확히, 딱','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まさに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なるべく','なるべく','가능한 한, 되도록','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なるべく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'さっさと','さっさと','빨리빨리, 쓱쓱','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さっさと');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'じわじわ','じわじわ','서서히, 조금씩','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='じわじわ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ぐっと','ぐっと','꾹, 확 (힘·감정)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐっと');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'やむを得ず','やむをえず','부득이, 어쩔 수 없이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やむを得ず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かつかつ','かつかつ','간신히, 빠듯하게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かつかつ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いたって','いたって','지극히, 매우, 대단히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いたって');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '折に触れて','おりにふれて','기회 있을 때마다, 때때로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='折に触れて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひしひし','ひしひし','절절히, 절감하여','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひしひし');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'がらりと','がらりと','확 바뀌어, 갑자기 변하여','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='がらりと');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なおかつ','なおかつ','그럼에도 여전히, 게다가','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なおかつ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もたもた','もたもた','꾸물꾸물, 굼뜨게, 우물우물','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もたもた');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'くっきり','くっきり','뚜렷이, 선명하게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='くっきり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'すっかり','すっかり','완전히, 모두, 깡그리','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すっかり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'てんで','てんで','전혀, 완전히 (부정 강조)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='てんで');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひとり','ひとり','혼자서만, 오로지 (~のみならず와 세트로)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひとり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'にこりともしない','にこりともしない','미소 하나 짓지 않다, 무표정하다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='にこりともしない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ぐずぐず','ぐずぐず','꾸물꾸물, 뭉그적뭉그적','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐずぐず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ぼそぼそ','ぼそぼそ','작게 중얼중얼, 퍼석퍼석하게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぼそぼそ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ちらほら','ちらほら','드문드문, 군데군데','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ちらほら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'きっぱり','きっぱり','단호하게, 딱 잘라서','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='きっぱり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'やたらに','やたらに','무턱대고, 마구잡이로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やたらに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いわんや','いわんや','하물며, 더구나 (~いわんや～をや)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いわんや');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なんとも','なんとも','뭐라 말할 수 없이, 어쩔 수 없다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なんとも');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あろうことか','あろうことか','어처구니없게도, 하필이면','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あろうことか');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'そぐわない','そぐわない','어울리지 않다, 맞지 않다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そぐわない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ほのかに','ほのかに','은은하게, 희미하게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ほのかに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'わなわな','わなわな','부들부들, 바들바들 (공포·분노로 떨다)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わなわな');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'うんざり','うんざり','진저리 나다, 질리다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うんざり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'へとへと','へとへと','녹초가 되다, 지쳐 쓰러지다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='へとへと');
