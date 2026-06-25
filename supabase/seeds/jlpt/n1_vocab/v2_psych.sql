-- ============================================================
-- JLPT N1 심리·감정·인간관계·성격 명사 + な형용사 150개
-- 생성일: 2026-06-23
-- 테마: 심리/감정 명사(60), 성격/태도 명사(30), 인간관계 명사(30),
--       성격·감정 な형용사(30)
-- 중복가드: WHERE NOT EXISTS (word 기준)
-- ※ v_nouns.sql / v_adj_adv.sql 기존 단어 제외:
--   葛藤·軋轢·対立·疎外·孤立·断絶·懸念·緊張·摩擦·真摯·誠意
--   偏見·差別·協調·依存·自律·格差·乖離·疎遠(명사형)
--   露骨な·大胆な·頑固な·高潔な·厳格な·謙虚(adj)·傲慢(adj)
--   寛容(adj)·繊細(adj)·軽率(adj)·横暴な·卑屈(adj)등 v_adj_adv重複 제외
-- ============================================================

-- ─── 심리·감정 명사 (60) ───
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '焦燥','しょうそう','초조, 안달','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焦燥');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '憂鬱','ゆううつ','우울, 울적함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憂鬱');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '恍惚','こうこつ','황홀, 넋을 잃음','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恍惚');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '羞恥','しゅうち','수치, 부끄러움','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='羞恥');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '憤慨','ふんがい','분개, 몹시 화가 남','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憤慨');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '嫌悪','けんお','혐오','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嫌悪');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '羨望','せんぼう','선망, 부러움','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='羨望');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '嫉妬','しっと','질투, 시기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嫉妬');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '恨み','うらみ','원한, 원망','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恨み');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '悔恨','かいこん','회한, 깊은 후회','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悔恨');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '後悔','こうかい','후회','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='後悔');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '懺悔','ざんげ','참회, 고백','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懺悔');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自責','じせき','자책','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自責');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自尊心','じそんしん','자존심','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自尊心');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '劣等感','れっとうかん','열등감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='劣等感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '優越感','ゆうえつかん','우월감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優越感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '孤独感','こどくかん','고독감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='孤独感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '虚脱感','きょだつかん','허탈감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虚脱感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '充実感','じゅうじつかん','충실감, 성취감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='充実感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '達成感','たっせいかん','달성감, 성취감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='達成感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '喪失感','そうしつかん','상실감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喪失感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '無力感','むりょくかん','무력감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='無力感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不安感','ふあんかん','불안감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不安感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '恐怖','きょうふ','공포','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恐怖');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '戦慄','せんりつ','전율, 몸서리','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='戦慄');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '感慨','かんがい','감개, 깊은 감동','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感慨');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '感銘','かんめい','감명','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感銘');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '感傷','かんしょう','감상, 센티멘털','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感傷');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '郷愁','きょうしゅう','향수(鄕愁), 노스탤지어','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='郷愁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '哀愁','あいしゅう','애수, 슬픈 정서','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='哀愁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '悲哀','ひあい','비애, 슬픔','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悲哀');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '苦悩','くのう','고뇌, 고통','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='苦悩');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '煩悩','ぼんのう','번뇌','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煩悩');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '苦渋','くじゅう','고충, 고뇌에 찬 괴로움','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='苦渋');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '焦り','あせり','조급함, 안달','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焦り');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '動揺','どうよう','동요, 흔들림','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='動揺');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '狼狽','ろうばい','당황, 허둥댐','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='狼狽');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '平静','へいせい','평정, 침착함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='平静');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '冷静','れいせい','냉정, 침착','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冷静');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '沈着','ちんちゃく','침착','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='沈着');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '興奮','こうふん','흥분','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='興奮');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '陶酔','とうすい','도취','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陶酔');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '歓喜','かんき','환희, 기쁨','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歓喜');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '悲嘆','ひたん','비탄, 슬픔과 탄식','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悲嘆');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '絶望','ぜつぼう','절망','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絶望');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '憧れ','あこがれ','동경, 갈망','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憧れ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '執着','しゅうちゃく','집착','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='執着');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '欲望','よくぼう','욕망','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='欲望');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '心労','しんろう','심로, 마음의 고생','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='心労');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気疲れ','きづかれ','정신적 피로, 신경 쓰다 지침','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気疲れ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '共感','きょうかん','공감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='共感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '反感','はんかん','반감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '同情','どうじょう','동정','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='同情');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '憐憫','れんびん','연민','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憐憫');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '愛着','あいちゃく','애착','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='愛着');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '愛憎','あいぞう','애증','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='愛憎');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '感謝','かんしゃ','감사','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感謝');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自卑','じひ','자기 비하','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自卑');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '感情移入','かんじょういにゅう','감정이입','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感情移入');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '心機','しんき','심기, 마음의 기분·태세','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='心機');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '感化','かんか','감화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感化');

-- ─── 성격·태도 명사 (30) ───
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '寛容','かんよう','관용, 너그러움','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寛容');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '横柄','おうへい','거만함, 건방짐','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='横柄');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '謙虚','けんきょ','겸허, 겸손','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謙虚');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '傲慢','ごうまん','오만','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傲慢');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '繊細','せんさい','섬세함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='繊細');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '慎重','しんちょう','신중함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慎重');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '誠実','せいじつ','성실함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誠実');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不誠実','ふせいじつ','불성실함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不誠実');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '几帳面','きちょうめん','꼼꼼함, 빈틈없음','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='几帳面');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大雑把','おおざっぱ','대충, 대범함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大雑把');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '意固地','いこじ','고집스러움, 완고함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意固地');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '頑固','がんこ','완고, 고집','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頑固');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '柔軟性','じゅうなんせい','유연성','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='柔軟性');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '融通','ゆうずう','융통, 임기응변','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='融通');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '度量','どりょう','도량, 아량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='度量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '器量','きりょう','기량, 그릇','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='器量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気質','きしつ','기질, 성질','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気質');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '性分','しょうぶん','천성, 타고난 성격','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='性分');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '強情','ごうじょう','강정, 고집불통','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='強情');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '卑屈','ひくつ','비굴함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卑屈');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '高慢','こうまん','고만, 오만함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高慢');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '物腰','ものごし','태도, 몸가짐, 거동','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物腰');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '風格','ふうかく','풍격, 품격','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='風格');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '品格','ひんかく','품격','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='品格');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '人格','じんかく','인격','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人格');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '品性','ひんせい','품성','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='品性');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '徳','とく','덕(德)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='徳');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '矜持','きょうじ','긍지, 자부심','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='矜持');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自負心','じふしん','자부심','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自負心');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '謙遜','けんそん','겸손','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謙遜');

-- ─── 인간관계 명사 (30) ───
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '信頼','しんらい','신뢰','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='信頼');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '疎遠','そえん','소원함, 소홀해진 사이','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疎遠');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '和解','わかい','화해','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='和解');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '絆','きずな','유대, 연결고리','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絆');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '縁','えん','인연, 연분','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '人脈','じんみゃく','인맥','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人脈');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '馴れ合い','なれあい','결탁, 지나친 타협','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='馴れ合い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '確執','かくしつ','확집, 뿌리 깊은 불화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='確執');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '反目','はんもく','반목, 사이가 나쁨','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反目');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '敵意','てきい','적의, 적대감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='敵意');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '敵対','てきたい','적대','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='敵対');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '敬意','けいい','경의, 존경','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='敬意');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '尊重','そんちょう','존중','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='尊重');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '軽蔑','けいべつ','경멸','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軽蔑');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '侮辱','ぶじょく','모욕','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='侮辱');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '裏切り','うらぎり','배신','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='裏切り');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不信感','ふしんかん','불신감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不信感');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '思いやり','おもいやり','배려, 공감','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思いやり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気遣い','きづかい','배려, 마음 씀','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気遣い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '遠慮','えんりょ','사양, 삼감, 조심','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遠慮');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '気兼ね','きがね','꺼림, 남을 의식함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気兼ね');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '対峙','たいじ','대치, 맞서 있음','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='対峙');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '和睦','わぼく','화목','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='和睦');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不仲','ふなか','사이가 나쁨','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不仲');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '縁故','えんこ','연고, 연줄','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縁故');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '軋み','きしみ','삐걱거림, 갈등의 기미','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軋み');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '協力','きょうりょく','협력','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='協力');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '依頼心','いらいしん','의존심, 남에게 의지하는 마음','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='依頼心');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '没交渉','もっこうしょう','교섭이 없음, 무관계','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='没交渉');

-- ─── 성격·감정 な형용사 (30) ───
-- ※ v_adj_adv.sql 기존 제외: 露骨な·大胆な·頑固な·高潔な·厳格な·横暴な
--   従順な·不条理な·旺盛な·強固な·優位な·精巧な·潔癖な·鮮明な·猛烈な
--   特異な·意欲的な·精力的な·大局的な·寡黙な·懸命な·独善的な·不毛な
--   逆説的な·逆説的な·明瞭な·微妙な·斬新な·厄介な·的確な·皮肉な
--   唐突な·執拗な·無謀な·奔放な·軽率な·格別な·密接な·強固な
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '顕著な','けんちょ','현저하다, 두드러지다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顕著な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '緻密な','ちみつ','치밀하다, 정밀하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緻密な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '寛大な','かんだい','관대하다, 너그럽다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寛大な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '円滑な','えんかつ','원활하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='円滑な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '柔軟な','じゅうなん','유연하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='柔軟な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '率直な','そっちょく','솔직하다, 직접적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='率直な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '真摯な','しんし','진지하다, 성실하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='真摯な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '誠実な','せいじつ','성실하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誠実な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '謙虚な','けんきょ','겸허하다, 겸손하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謙虚な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '傲慢な','ごうまん','오만하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傲慢な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '寛容な','かんよう','관대하다, 너그럽다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寛容な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '繊細な','せんさい','섬세하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='繊細な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '卑屈な','ひくつ','비굴하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卑屈な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '横柄な','おうへい','거만하다, 건방지다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='横柄な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '几帳面な','きちょうめん','꼼꼼하다, 빈틈이 없다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='几帳面な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '大雑把な','おおざっぱ','대충이다, 허술하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大雑把な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '素直な','すなお','솔직하다, 순순하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='素直な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '慎重な','しんちょう','신중하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慎重な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '冷静な','れいせい','냉정하다, 침착하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冷静な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '感情的な','かんじょうてき','감정적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感情的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '理性的な','りせいてき','이성적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='理性的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '内向的な','ないこうてき','내향적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='内向的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '外向的な','がいこうてき','외향적이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='外向的な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '卑劣な','ひれつ','비열하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卑劣な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '高尚な','こうしょう','고상하다, 품위 있다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高尚な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '粗野な','そや','거칠다, 세련되지 못하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粗野な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '謙遜な','けんそん','겸손하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謙遜な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '真剣な','しんけん','진지하다, 진심이다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='真剣な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '純粋な','じゅんすい','순수하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='純粋な');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '敏感な','びんかん','민감하다','N1','な형용사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='敏感な');
