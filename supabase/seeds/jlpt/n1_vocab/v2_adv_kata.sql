-- ============================================================
-- JLPT N1 부사·접속표현·복합어 + 시사 가타카나 외래어 150개
-- part_of_speech: '부사' / '접속사' / '명사' / '복합어'
-- 중복가드(WHERE NOT EXISTS) 포함
-- ============================================================

-- ─── 부사 (50) ───

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もはや','もはや','이미, 이제는','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もはや');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かねて','かねて','이전부터, 미리','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かねて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あらかじめ','あらかじめ','미리, 사전에','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あらかじめ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'おのずと','おのずと','저절로, 자연히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おのずと');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'とっさに','とっさに','순간적으로, 갑자기','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とっさに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひいては','ひいては','나아가서는, 더 나아가','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひいては');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もっぱら','もっぱら','오로지, 전적으로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もっぱら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ことごとく','ことごとく','모조리, 빠짐없이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ことごとく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かえって','かえって','오히려, 도리어','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かえって');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いかに','いかに','얼마나, 어떻게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いかに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'むしろ','むしろ','오히려, 차라리','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='むしろ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かつて','かつて','일찍이, 예전에','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かつて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひとまず','ひとまず','우선, 일단','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひとまず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'よもや','よもや','설마, 아무리 해도','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='よもや');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あながち','あながち','반드시 (부정문 수반), 꼭 그렇지도','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あながち');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かなり','かなり','꽤, 상당히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かなり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'さながら','さながら','마치, 흡사, 그대로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さながら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'そもそも','そもそも','애초에, 원래, 도대체','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そもそも');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'つとめて','つとめて','가급적, 되도록','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='つとめて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なにしろ','なにしろ','어쨌든, 무엇보다도','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なにしろ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひたすら','ひたすら','오직, 한결같이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひたすら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'わざと','わざと','일부러, 고의로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わざと');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あくまで','あくまで','어디까지나, 끝까지','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あくまで');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いわば','いわば','말하자면, 이를테면','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いわば');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'おおむね','おおむね','대체로, 대개','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おおむね');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ことに','ことに','특히, 더욱이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ことに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'しきりに','しきりに','자꾸, 연신, 끊임없이','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しきりに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'すこぶる','すこぶる','매우, 극히','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すこぶる');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'たちまち','たちまち','순식간에, 금방','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たちまち');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ただちに','ただちに','즉시, 곧바로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ただちに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'てきぱき','てきぱき','척척, 거침없이, 신속하게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='てきぱき');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'とりわけ','とりわけ','특히, 그 중에서도','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とりわけ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なおさら','なおさら','더욱, 한층 더','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なおさら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'にわかに','にわかに','갑자기, 갑작스럽게','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='にわかに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'のきなみ','のきなみ','일제히, 모조리','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のきなみ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'はたして','はたして','과연, 정말로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='はたして');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ふいに','ふいに','느닷없이, 불쑥','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ふいに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'まさしく','まさしく','틀림없이, 바로, 정말로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まさしく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'まして','まして','하물며, 더구나','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まして');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ままならない','ままならない','뜻대로 되지 않다, 마음대로 안 되다','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ままならない');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'やがて','やがて','곧, 머지않아','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やがて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ようやく','ようやく','겨우, 간신히, 드디어','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ようやく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'わりに','わりに','의외로, 비교적','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わりに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いっそ','いっそ','차라리, 아예','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いっそ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'おそらく','おそらく','아마, 십중팔구','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おそらく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かろうじて','かろうじて','간신히, 가까스로','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かろうじて');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ついに','ついに','마침내, 결국','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ついに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'てっきり','てっきり','틀림없이, 당연히 (기대했는데)','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='てっきり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'とかく','とかく','이래저래, 자칫하면','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とかく');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'まれに','まれに','드물게, 간혹','N1','부사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まれに');

-- ─── 접속표현·접속사 (25) ───

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ゆえに','ゆえに','그러므로, 따라서 (문어)','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ゆえに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'したがって','したがって','따라서, 그러므로','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='したがって');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ならびに','ならびに','및, 그리고 (병렬·문어)','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ならびに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もしくは','もしくは','또는, 혹은','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もしくは');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かつ','かつ','또한, 동시에 (문어)','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かつ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'すなわち','すなわち','즉, 다시 말해','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すなわち');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ただし','ただし','단, 다만, 단서','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ただし');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'なお','なお','또한, 덧붙여','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なお');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かたわら','かたわら','한편, 곁에서, ~하면서','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かたわら');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'それゆえ','それゆえ','그렇기 때문에, 그래서','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='それゆえ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'とはいえ','とはいえ','그렇다고는 해도, 그래도','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とはいえ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'にもかかわらず','にもかかわらず','~에도 불구하고','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='にもかかわらず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'のみならず','のみならず','~뿐만 아니라','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のみならず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひるがえって','ひるがえって','반면에, 돌이켜 보면','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひるがえって');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'もとより','もとより','원래, 물론, 처음부터','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もとより');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'よって','よって','따라서, 이에 의하여','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='よって');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'あるいは','あるいは','혹은, 또는, 어쩌면','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あるいは');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'いずれにせよ','いずれにせよ','어쨌든, 어느 쪽이든 간에','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いずれにせよ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'かかわらず','かかわらず','~에 상관없이, ~을 불문하고','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かかわらず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'したうえで','したうえで','~한 다음에, ~하고 나서','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='したうえで');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'そのうえ','そのうえ','게다가, 그 위에','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そのうえ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'それどころか','それどころか','그뿐만 아니라, 오히려','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='それどころか');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'とりもなおさず','とりもなおさず','다름 아닌, 바로 그것이','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とりもなおさず');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ひとえに','ひとえに','오로지, 전적으로 (~덕분·~때문)','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひとえに');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'むろん','むろん','물론, 두말할 것도 없이','N1','접속사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='むろん');

-- ─── 복합어 (25) ───

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '申し合わせ','もうしあわせ','협의, 합의, 내규','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申し合わせ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '見直し','みなおし','재검토, 개정','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見直し');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '取り組み','とりくみ','노력, 대처, 씨름','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り組み');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '打ち合わせ','うちあわせ','사전 협의, 미팅','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち合わせ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '引き継ぎ','ひきつぎ','인수인계, 업무 승계','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き継ぎ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '見積もり','みつもり','견적, 추산','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見積もり');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '問い合わせ','といあわせ','문의, 조회','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='問い合わせ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '申し出','もうしで','신청, 제의, 자진하여 말함','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申し出');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '切り捨て','きりすて','삭제, 버림, 반올림 내림','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り捨て');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '使い捨て','つかいすて','일회용, 사용 후 버림','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='使い捨て');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '受け入れ','うけいれ','수용, 받아들임','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受け入れ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '言い回し','いいまわし','표현 방식, 말투','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い回し');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '割り当て','わりあて','배분, 할당','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='割り当て');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '差し引き','さしひき','공제, 차감','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差し引き');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '抜き取り','ぬきとり','발취, 샘플링, 추출','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜き取り');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '組み合わせ','くみあわせ','조합, 결합','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='組み合わせ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '成り立ち','なりたち','성립 과정, 구조, 유래','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='成り立ち');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '使い分け','つかいわけ','구분 사용, 용도에 따라 나누어 씀','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='使い分け');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '行き違い','いきちがい','엇갈림, 오해, 착오','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='行き違い');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '持ち合わせ','もちあわせ','마침 갖고 있음, 수중에 있음','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持ち合わせ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '歯止め','はどめ','제동, 제어, 억제책','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歯止め');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '裏付け','うらづけ','뒷받침, 증거, 근거','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='裏付け');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '立ち位置','たちいち','입장, 위치, 서있는 위치','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立ち位置');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '上乗せ','うわのせ','추가, 가산, 웃돈','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上乗せ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '締め切り','しめきり','마감, 마감일','N1','복합어' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='締め切り');

-- ─── 시사 가타카나 외래어 (50) ───

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'イニシアチブ','イニシアチブ','이니셔티브, 주도권','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='イニシアチブ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'パラダイム','パラダイム','패러다임, 사고 틀','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='パラダイム');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'コンセンサス','コンセンサス','합의, 컨센서스','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コンセンサス');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'インフラ','インフラ','인프라, 기반 시설','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='インフラ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ジレンマ','ジレンマ','딜레마, 진퇴양난','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ジレンマ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ノウハウ','ノウハウ','노하우, 전문 지식','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ノウハウ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'モチベーション','モチベーション','동기 부여, 의욕','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='モチベーション');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'シナリオ','シナリオ','시나리오, 각본','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='シナリオ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'アジェンダ','アジェンダ','의제, 안건 목록','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アジェンダ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ステークホルダー','ステークホルダー','이해관계자','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ステークホルダー');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'リテラシー','リテラシー','리터러시, 활용 능력','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='リテラシー');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'アウトソーシング','アウトソーシング','아웃소싱, 외주','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アウトソーシング');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'コンプライアンス','コンプライアンス','컴플라이언스, 법령 준수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コンプライアンス');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ガバナンス','ガバナンス','거버넌스, 지배 구조','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ガバナンス');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'グローバリゼーション','グローバリゼーション','세계화, 글로벌화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='グローバリゼーション');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'サステナビリティ','サステナビリティ','지속 가능성','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='サステナビリティ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'イノベーション','イノベーション','이노베이션, 혁신','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='イノベーション');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'リスクマネジメント','リスクマネジメント','리스크 관리','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='リスクマネジメント');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ロードマップ','ロードマップ','로드맵, 실행 계획','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ロードマップ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ベンチマーク','ベンチマーク','벤치마크, 기준 지표','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ベンチマーク');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'プラットフォーム','プラットフォーム','플랫폼, 기반 환경','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='プラットフォーム');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'インセンティブ','インセンティブ','인센티브, 유인책','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='インセンティブ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'シナジー','シナジー','시너지, 상승 효과','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='シナジー');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ポテンシャル','ポテンシャル','잠재력, 가능성','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ポテンシャル');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'フレームワーク','フレームワーク','프레임워크, 틀, 기반 구조','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='フレームワーク');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'トレードオフ','トレードオフ','트레이드오프, 상충 관계','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='トレードオフ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'スキーム','スキーム','계획, 구조, 제도','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='スキーム');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'デファクト','デファクト','사실상의 (표준), 데팩토','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='デファクト');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'マイルストーン','マイルストーン','마일스톤, 중간 목표','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='マイルストーン');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ネゴシエーション','ネゴシエーション','협상, 교섭','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ネゴシエーション');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'エビデンス','エビデンス','증거, 근거, 에비던스','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='エビデンス');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'タスクフォース','タスクフォース','태스크포스, 특별 팀','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='タスクフォース');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'バイアス','バイアス','편향, 선입견','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='バイアス');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'クライテリア','クライテリア','기준, 판단 근거 (criteria)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='クライテリア');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'マニフェスト','マニフェスト','공약, 선언문','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='マニフェスト');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'セーフティネット','セーフティネット','안전망, 사회 보호망','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='セーフティネット');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'デジタルデバイド','デジタルデバイド','디지털 격차','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='デジタルデバイド');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ソリューション','ソリューション','솔루션, 해결책','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ソリューション');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ロジスティクス','ロジスティクス','물류, 병참','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ロジスティクス');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'キャパシティ','キャパシティ','수용 능력, 역량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='キャパシティ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'アカウンタビリティ','アカウンタビリティ','책임성, 설명 책임','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アカウンタビリティ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'トランスペアレンシー','トランスペアレンシー','투명성','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='トランスペアレンシー');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'エコシステム','エコシステム','생태계, 비즈니스 생태계','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='エコシステム');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ニュアンス','ニュアンス','뉘앙스, 미묘한 차이','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ニュアンス');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'コアコンピタンス','コアコンピタンス','핵심 역량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コアコンピタンス');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'ボトルネック','ボトルネック','병목, 병목 현상','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ボトルネック');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'バッファ','バッファ','완충, 여유 시간, 버퍼','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='バッファ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'コモディティ','コモディティ','일반 상품, 범용화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コモディティ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'スタートアップ','スタートアップ','스타트업, 신생 기업','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='スタートアップ');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT 'デュアルユース','デュアルユース','이중 용도 (군민 양용)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='デュアルユース');
