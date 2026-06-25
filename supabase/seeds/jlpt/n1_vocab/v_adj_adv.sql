-- ============================================================
-- JLPT N1 형용사(い·な) · 부사 · 연체사 150개
-- part_of_speech: 'い형용사' / 'な형용사' / '부사' / '연체사'
-- 기존 vocabulary.sql + n1_expansion_batch1~6 중복 제거됨
-- ============================================================

-- ─── い형용사 50 ───
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '疎ましい','うとましい','밉살스럽다, 싫다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疎ましい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '聡い','さとい','영리하다, 눈치 빠르다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='聡い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '物悲しい','ものがなしい','왠지 슬프다, 애수가 있다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物悲しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気まぐれ','きまぐれ','변덕스러움, 변덕','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気まぐれ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '薄情','はくじょう','냉정함, 박정함, 인정 없음','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='薄情');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ぎこちない','ぎこちない','어색하다, 서투르다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぎこちない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'わずらわしい','わずらわしい','번잡하다, 귀찮다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わずらわしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '手痛い','ていたい','혹독하다, 뼈아프다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手痛い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '意地悪い','いじわるい','심술궂다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意地悪い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '後ろめたい','うしろめたい','양심에 걸리다, 미안하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='後ろめたい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '切ない','せつない','마음이 아프다, 애절하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切ない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '疚しい','やましい','마음에 걸리다, 떳떳하지 않다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疚しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頼もしい','たのもしい','믿음직하다, 듬직하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頼もしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いたましい','いたましい','안타깝다, 가슴 아프다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いたましい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'おびただしい','おびただしい','엄청나다, 막대하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おびただしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '恨めしい','うらめしい','원망스럽다, 야속하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恨めしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '恐ろしい','おそろしい','두렵다, 무섭다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恐ろしい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'おめでたい','おめでたい','경사스럽다, 축하할 만하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おめでたい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '滑稽','こっけい','우스꽝스럽다, 익살스럽다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滑稽');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '小賢しい','こざかしい','얄팍하게 약삭빠르다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='小賢しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鬱陶しい','うっとうしい','음울하다, 답답하다, 귀찮다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鬱陶しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '生温い','なまぬるい','미지근하다, 어설프다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生温い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '険しい','けわしい','험하다, 가파르다, 험악하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='険しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '尊い','とうとい','존귀하다, 소중하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='尊い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '芳しい','かんばしい','향기롭다; (부정형으로) 신통치 않다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='芳しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '滞りない','とどこおりない','순조롭다, 차질 없다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滞りない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '生々しい','なまなましい','생생하다, 생동감이 있다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生々しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '他愛ない','たあいない','천진하다, 하잘것없다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='他愛ない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'だらしない','だらしない','단정하지 못하다, 칠칠맞다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='だらしない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '荒々しい','あらあらしい','거칠다, 난폭하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='荒々しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '酷い','ひどい','심하다, 혹독하다, 잔인하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='酷い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鈍い','にぶい','둔하다, 무디다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鈍い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '脆い','もろい','약하다, 무르다, 무너지기 쉽다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脆い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '厳つい','いかつい','근엄하다, 위압적이다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厳つい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '好い加減','いいかげん','적당하다, 엉터리다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='好い加減');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '怠い','だるい','나른하다, 피곤하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='怠い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '辛い','つらい','괴롭다, 힘들다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='辛い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '凄まじい','すさまじい','대단하다, 굉장하다, 엄청나다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凄まじい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '惨い','むごい','잔인하다, 끔찍하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='惨い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '快活','かいかつ','쾌활하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='快活');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '高飛車','たかびしゃ','거만하다, 고압적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高飛車');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '如才ない','じょさいない','빈틈없다, 눈치 빠르다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='如才ない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気さく','きさく','소탈하다, 털털하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気さく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'しぶとい','しぶとい','질기다, 끈질기다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しぶとい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '猛々しい','たけだけしい','사납다, 기세가 대단하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='猛々しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '険悪','けんあく','험악하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='険悪');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '等しい','ひとしい','같다, 동등하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='等しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '初々しい','ういういしい','풋풋하다, 순진하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='初々しい');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '粗い','あらい','거칠다, 성글다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粗い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気忙しい','きぜわしい','분주하다, 안절부절못하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気忙しい');

-- ─── な형용사 52 ───
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '露骨な','ろこつ','노골적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='露骨な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頑固な','がんこ','완고하다, 고집스럽다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頑固な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '奔放な','ほんぽう','방종하다, 자유분방하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奔放な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '軽率な','けいそつ','경솔하다, 경망스럽다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軽率な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '無謀な','むぼう','무모하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='無謀な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大胆な','だいたん','대담하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大胆な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '執拗な','しつよう','집요하다, 끈질기다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='執拗な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '唐突な','とうとつ','갑작스럽다, 뜬금없다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='唐突な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '皮肉な','ひにく','비꼬는, 아이러니한','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='皮肉な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '的確な','てきかく','정확하다, 적확하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='的確な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '厄介な','やっかい','성가시다, 귀찮다, 곤란하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厄介な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '斬新な','ざんしん','참신하다, 신선하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='斬新な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '微妙な','びみょう','미묘하다, 애매하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='微妙な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '格別な','かくべつ','각별하다, 특별하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='格別な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '粗末な','そまつ','조잡하다, 허름하다, 소홀하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粗末な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '旺盛な','おうせい','왕성하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='旺盛な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '強固な','きょうこ','강고하다, 확고하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='強固な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '優位な','ゆうい','우위에 있다, 유리하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優位な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不条理な','ふじょうり','불합리하다, 부조리하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不条理な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '密接な','みっせつ','밀접하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='密接な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '明瞭な','めいりょう','명료하다, 명확하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='明瞭な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '精巧な','せいこう','정교하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精巧な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '横暴な','おうぼう','횡포스럽다, 포악하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='横暴な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '独善的な','どくぜんてき','독선적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='独善的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '懸命な','けんめい','열심히 하는, 필사적인','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懸命な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不毛な','ふもう','불모의, 결실 없는','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不毛な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '逆説的な','ぎゃくせつてき','역설적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逆説的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '孤高な','ここう','고고하다, 고독하게 높다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='孤高な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不穏な','ふおん','불온하다, 불안하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不穏な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '簡潔な','かんけつ','간결하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='簡潔な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '的を射た','まとをいた','핵심을 찌르는, 적절한','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='的を射た');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '精力的な','せいりょくてき','정력적이다, 활발하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精力的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '従順な','じゅうじゅん','순종하다, 유순하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='従順な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '無秩序な','むちつじょ','무질서하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='無秩序な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '根深い','ねぶかい','뿌리 깊다, 근본이 깊다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根深い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '潔癖な','けっぺき','결벽하다, 청렴하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='潔癖な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '鮮明な','せんめい','선명하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鮮明な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '厳格な','げんかく','엄격하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厳格な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '猛烈な','もうれつ','맹렬하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='猛烈な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '特異な','とくい','특이하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='特異な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '高潔な','こうけつ','고결하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高潔な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '滑らかな','なめらか','매끄럽다, 유창하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滑らかな');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '粘り強い','ねばりづよい','끈기 있다, 집요하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粘り強い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '意欲的な','いよくてき','의욕적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意欲的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '寡黙な','かもく','과묵하다, 말수가 적다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寡黙な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大局的な','たいきょくてき','대국적이다, 전체를 보는','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大局的な');

-- ─── 부사 45 ───
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '殊更','ことさら','일부러, 특히 강조하여','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='殊更');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '軒並み','のきなみ','줄줄이, 하나같이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軒並み');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'さながら','さながら','마치 ~같이, 그대로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さながら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'おおむね','おおむね','대체로, 대개','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おおむね');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '折しも','おりしも','마침, 때마침','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='折しも');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'とかく','とかく','이러저러, 자칫','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とかく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あいにく','あいにく','공교롭게도, 안타깝게도','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あいにく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひときわ','ひときわ','유달리, 특별히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひときわ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いよいよ','いよいよ','드디어, 점점 더','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いよいよ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もはや','もはや','이미, 이제 더 이상','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もはや');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かえって','かえって','오히려, 도리어','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かえって');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なおさら','なおさら','더욱더, 한층 더','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なおさら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひいては','ひいては','나아가서, 더 나아가','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひいては');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'そもそも','そもそも','애초에, 본래','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そもそも');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なにしろ','なにしろ','아무튼, 어쨌든','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なにしろ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'むしろ','むしろ','오히려, 차라리','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='むしろ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひとまず','ひとまず','우선, 일단','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひとまず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'おのずから','おのずから','저절로, 자연스럽게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おのずから');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もとより','もとより','본래, 처음부터; 물론','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もとより');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひたむきに','ひたむきに','오로지, 열심히, 한결같이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひたむきに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大抵','たいてい','대개, 대부분, 보통','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大抵');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '幾分','いくぶん','다소, 조금','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幾分');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '改めて','あらためて','다시, 새로이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改めて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '相次いで','あいついで','잇따라, 연이어','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相次いで');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '端的に','たんてきに','단적으로, 직접적으로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='端的に');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '率直に','そっちょくに','솔직하게, 직접적으로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='率直に');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '精々','せいぜい','기껏해야, 精一杯','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精々');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大げさに','おおげさに','과장되게, 야단스럽게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大げさに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '往々にして','おうおうにして','왕왕, 종종','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='往々にして');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '次第に','しだいに','점차, 차차','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='次第に');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かたくなに','かたくなに','완고하게, 고집스럽게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かたくなに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'まんまと','まんまと','교묘하게, 완전히 (속다)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まんまと');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かねてから','かねてから','오래전부터, 예전부터','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かねてから');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '今もって','いまもって','지금까지도, 아직도','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='今もって');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もとから','もとから','처음부터, 원래부터','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もとから');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頭から','あたまから','처음부터, 무조건, 무턱대고','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頭から');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あくまでも','あくまでも','어디까지나, 끝까지','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あくまでも');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '少なからず','すくなからず','적지 않게, 상당히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='少なからず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いかんせん','いかんせん','어찌할 도리가 없이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いかんせん');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '一段と','いちだんと','한층, 더욱','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一段と');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'しかしながら','しかしながら','그러나, 하지만 (격식체)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しかしながら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '専ら','もっぱら','오로지, 주로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='専ら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'すこぶる','すこぶる','대단히, 몹시','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すこぶる');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'たちまち','たちまち','금세, 순식간에','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たちまち');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あらかた','あらかた','대충, 거의 다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あらかた');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'たとえ','たとえ','설령, 가령 (~라도)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たとえ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なかんずく','なかんずく','그 중에서도, 특히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なかんずく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'とりもなおさず','とりもなおさず','다름 아닌, 바로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とりもなおさず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あながち','あながち','반드시 (〜ない의 형태로) 꼭 그렇지도 않다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あながち');

-- ─── 연체사 5 ───
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あらゆる','あらゆる','모든, 온갖','N1','연체사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あらゆる');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いわゆる','いわゆる','이른바, 소위','N1','연체사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いわゆる');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いかなる','いかなる','어떠한, 어떤','N1','연체사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いかなる');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'さる','さる','어떤, 특정한 (사람·것)','N1','연체사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さる');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'とある','とある','어떤, 어느 (막연한 지칭)','N1','연체사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とある');
