-- ============================================================
-- JLPT N1 명사 150개 (추상·학술·시사 어휘 중심)
-- 생성일: 2026-06-23
-- 중복가드: WHERE NOT EXISTS (word 기준)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '概念','がいねん','개념','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='概念');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '矛盾','むじゅん','모순','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='矛盾');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '葛藤','かっとう','갈등','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='葛藤');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '是正','ぜせい','시정','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='是正');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '撤廃','てっぱい','철폐','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='撤廃');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '趣旨','しゅし','취지','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='趣旨');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '形骸','けいがい','형해, 껍데기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='形骸');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '範疇','はんちゅう','범주','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='範疇');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '詭弁','きべん','궤변','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='詭弁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '偏在','へんざい','편재(한쪽에 치우쳐 존재함)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='偏在');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '遍在','へんざい','편재(어디에나 존재함)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遍在');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '媒介','ばいかい','매개','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='媒介');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '凋落','ちょうらく','쇠락','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凋落');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '恣意','しい','자의, 제멋대로','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恣意');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '拘泥','こうでい','구애, 고집','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拘泥');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '払底','ふってい','고갈, 동이 남','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='払底');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '軋轢','あつれき','알력, 불화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軋轢');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '齟齬','そご','어긋남, 괴리','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='齟齬');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '払拭','ふっしょく','불식','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='払拭');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '踏襲','とうしゅう','답습','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='踏襲');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '帰結','きけつ','귀결','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰結');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '示唆','しさ','시사','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='示唆');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '弊害','へいがい','폐해','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弊害');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '懸念','けねん','우려, 염려','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懸念');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '先駆','せんく','선구','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='先駆');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '端的','たんてき','단적','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='端的');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '論旨','ろんし','논지','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論旨');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '論拠','ろんきょ','논거','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論拠');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '命題','めいだい','명제','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='命題');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '前提','ぜんてい','전제','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='前提');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '反駁','はんばく','반박','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反駁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '論駁','ろんばく','논박','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論駁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '逆説','ぎゃくせつ','역설(패러독스)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逆説');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '帰納','きのう','귀납','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰納');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '演繹','えんえき','연역','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演繹');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '抽象','ちゅうしょう','추상','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抽象');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '捨象','しゃしょう','捨象(사상, 불필요한 부분 제거)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='捨象');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '類推','るいすい','유추','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='類推');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '考察','こうさつ','고찰','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='考察');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '検証','けんしょう','검증','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='検証');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '実証','じっしょう','실증','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実証');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '仮説','かせつ','가설','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仮説');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '通説','つうせつ','통설','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通説');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '定説','ていせつ','정설','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='定説');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '異説','いせつ','이설, 이견','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='異説');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '学説','がくせつ','학설','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='学説');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '見地','けんち','견지, 관점','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見地');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '観点','かんてん','관점','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='観点');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '視座','しざ','시좌, 시각의 기반','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='視座');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '文脈','ぶんみゃく','문맥, 맥락','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='文脈');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '文言','もんごん','문언, 문구','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='文言');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '骨子','こっし','골자, 요지','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='骨子');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '要諦','ようたい','요체, 핵심','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='要諦');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '真摯','しんし','진지함, 성실함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='真摯');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '誠意','せいい','성의','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誠意');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '所信','しょしん','소신','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='所信');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '方針','ほうしん','방침','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='方針');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '指針','ししん','지침','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='指針');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '規範','きはん','규범','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規範');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '慣行','かんこう','관행','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慣行');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '慣習','かんしゅう','관습','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慣習');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '因習','いんしゅう','인습','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='因習');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '慣例','かんれい','관례','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慣例');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '先例','せんれい','선례','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='先例');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '前例','ぜんれい','전례','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='前例');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '悪例','あくれい','악례','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悪例');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '弊風','へいふう','폐습, 나쁜 풍조','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弊風');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '陋習','ろうしゅう','누습, 나쁜 습관','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陋習');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '刷新','さっしん','쇄신','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刷新');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '変革','へんかく','변혁','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変革');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '改革','かいかく','개혁','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改革');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '抜本','ばっぽん','발본(근본적 개선)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜本');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '漸進','ぜんしん','점진','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漸進');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '急進','きゅうしん','급진','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急進');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '保守','ほしゅ','보수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='保守');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '革新','かくしん','혁신','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='革新');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '体制','たいせい','체제','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体制');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '権威','けんい','권위','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='権威');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '覇権','はけん','패권','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='覇権');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '主権','しゅけん','주권','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主権');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '統治','とうち','통치','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='統治');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '専制','せんせい','전제(독재)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='専制');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '独裁','どくさい','독재','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='独裁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '民主','みんしゅ','민주','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='民主');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '選挙','せんきょ','선거','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='選挙');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '審議','しんぎ','심의','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='審議');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '採決','さいけつ','채결, 표결','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='採決');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '勧告','かんこく','권고','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='勧告');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '制裁','せいさい','제재','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='制裁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '抑止','よくし','억지, 억제','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抑止');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '抑圧','よくあつ','억압','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抑圧');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '弾圧','だんあつ','탄압','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弾圧');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '圧力','あつりょく','압력','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='圧力');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '摩擦','まさつ','마찰','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='摩擦');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '対立','たいりつ','대립','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='対立');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '緊張','きんちょう','긴장','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緊張');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '緩和','かんわ','완화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緩和');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '協調','きょうちょう','협조, 협력','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='協調');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '連携','れんけい','연계, 연대','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='連携');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '提携','ていけい','제휴','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='提携');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '相互','そうご','상호','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相互');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '依存','いぞん','의존','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='依存');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自律','じりつ','자율','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自律');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自立','じりつ','자립','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自立');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自治','じち','자치','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自治');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '分権','ぶんけん','분권','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分権');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '集権','しゅうけん','집권(권력 집중)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='集権');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '官僚','かんりょう','관료','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='官僚');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '腐敗','ふはい','부패','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腐敗');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '汚職','おしょく','부정부패, 직권 남용','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汚職');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '粛清','しゅくせい','숙청','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粛清');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '批准','ひじゅん','비준','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='批准');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '条約','じょうやく','조약','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='条約');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '協定','きょうてい','협정','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='協定');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '合意','ごうい','합의','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合意');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '仲裁','ちゅうさい','중재','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仲裁');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '調停','ちょうてい','조정','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='調停');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '斡旋','あっせん','알선','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='斡旋');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '仲介','ちゅうかい','중개','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仲介');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '介在','かいざい','개재, 사이에 끼어 있음','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='介在');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '依拠','いきょ','의거, 근거','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='依拠');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '根拠','こんきょ','근거','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根拠');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '所轄','しょかつ','소관, 관할','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='所轄');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '管轄','かんかつ','관할','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='管轄');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '権限','けんげん','권한','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='権限');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '裁量','さいりょう','재량','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='裁量');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '委任','いにん','위임','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='委任');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '権益','けんえき','권익','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='権益');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '利権','りけん','이권','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='利権');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '既得','きとく','기득(권)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='既得');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '優遇','ゆうぐう','우대','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優遇');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '冷遇','れいぐう','냉대','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冷遇');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '格差','かくさ','격차','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='格差');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '乖離','かいり','괴리','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乖離');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '偏向','へんこう','편향','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='偏向');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '偏見','へんけん','편견','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='偏見');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '差別','さべつ','차별','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差別');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '排除','はいじょ','배제','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='排除');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '包摂','ほうせつ','포섭, 포함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='包摂');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '同化','どうか','동화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='同化');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '融合','ゆうごう','융합','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='融合');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '統合','とうごう','통합','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='統合');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '分断','ぶんだん','분단, 단절','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分断');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '断絶','だんぜつ','단절','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='断絶');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '孤立','こりつ','고립','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='孤立');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '疎外','そがい','소외','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疎外');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '帰属','きぞく','귀속','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰属');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '帰順','きじゅん','귀순','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰順');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '投降','とうこう','투항','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='投降');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '降伏','こうふく','항복','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='降伏');
