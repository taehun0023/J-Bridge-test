-- v6_clean.sql  N1 어휘 50개 (동사·명사·부사·な형용사·표현 혼합)
-- 중복가드: WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='...')

-- 명사 (22개)
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '逸脱','いつだつ','일탈, 규범에서 벗어남','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逸脱');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '邁進','まいしん','매진, 힘차게 앞으로 나아감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='邁進');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '虚偽','きょぎ','허위, 거짓','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虚偽');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '頓挫','とんざ','좌절, 중도에 막힘','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頓挫');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '辟易','へきえき','질림, 상대에게 손을 들다','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='辟易');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '概括','がいかつ','개괄, 요약','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='概括');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '浮き彫り','うきぼり','부각, 두드러지게 드러남','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浮き彫り');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '名残','なごり','여운, 이별의 아쉬움','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='名残');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '端緒','たんしょ','단서, 실마리','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='端緒');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '帰趨','きすう','귀추, 결말이 향하는 방향','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰趨');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '布石','ふせき','포석, 미래를 위한 사전 준비','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='布石');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '形骸化','けいがいか','형해화, 유명무실해짐','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='形骸化');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '波紋','はもん','파문, 사회적 반향','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='波紋');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '渦中','かちゅう','소용돌이 속, 사건의 중심','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='渦中');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '機微','きび','기미, 미묘한 사정이나 분위기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='機微');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '底流','ていりゅう','저류, 밑바닥에 흐르는 경향','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='底流');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '禍根','かこん','화근, 재앙의 근원','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='禍根');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '活路','かつろ','활로, 살아날 길','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='活路');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '醍醐味','だいごみ','진수, 진정한 묘미','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='醍醐味');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '所以','ゆえん','이유, 까닭','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='所以');

-- 동사 (10개)
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '凌ぐ','しのぐ','견디다, 능가하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凌ぐ');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '縛る','しばる','묶다, 구속하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縛る');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '凝らす','こらす','집중하다, 궁리하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凝らす');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '呻く','うめく','신음하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呻く');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '嗤う','わらう','비웃다, 조소하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嗤う');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '窘める','たしなめる','나무라다, 타이르다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='窘める');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '貶める','おとしめる','깎아내리다, 업신여기다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='貶める');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '滾る','たぎる','끓어오르다, 격렬히 솟구치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滾る');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '諌める','いさめる','간하다, 잘못을 충고하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諌める');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '蔑ろにする','ないがしろにする','경시하다, 무시하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蔑ろにする');

-- い형용사 (5개)
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '煩わしい','わずらわしい','성가시다, 귀찮다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煩わしい');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '嘆かわしい','なげかわしい','한탄스럽다, 개탄스럽다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嘆かわしい');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '芳しくない','かんばしくない','좋지 않다, 바람직하지 않다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='芳しくない');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '忌まわしい','いまわしい','불길하다, 꺼림칙하다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='忌まわしい');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '甚だしい','はなはだしい','심하다, 정도가 매우 지나치다','N1','い형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='甚だしい');

-- な형용사 (6개, 어간형 등록 — word에 「な」 없음)
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '陳腐','ちんぷ','진부함, 낡고 평범함','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陳腐');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '肝心','かんじん','가장 중요함, 핵심','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='肝心');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '妥当','だとう','타당함','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='妥当');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '顕著','けんちょ','현저함, 두드러짐','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顕著');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '恣意的','しいてき','자의적, 멋대로임','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恣意的');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '峻厳','しゅんげん','준엄함, 매우 엄격함','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='峻厳');

-- 부사 (5개)
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT 'あいにく','あいにく','공교롭게도, 때마침 나쁘게도','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あいにく');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT 'あからさまに','あからさまに','노골적으로, 명백히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あからさまに');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT 'おのずから','おのずから','자연히, 저절로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おのずから');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT 'さながら','さながら','마치 ~처럼, 흡사','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さながら');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT 'むしろ','むしろ','오히려, 차라리','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='むしろ');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '尚更','なおさら','더욱더, 한층 더','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='尚更');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '一概に','いちがいに','일률적으로, 한마디로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一概に');

-- 표현 (2개)
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '拍車をかける','はくしゃをかける','박차를 가하다','N1','표현' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拍車をかける');
INSERT INTO jlpt_vocabulary (word,reading,meaning_ko,jlpt_level,part_of_speech) SELECT '腑に落ちる','ふにおちる','납득이 가다, 이해가 되다','N1','표현' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腑に落ちる');
