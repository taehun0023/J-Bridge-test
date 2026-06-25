-- ============================================================
-- JLPT N1 음독 명사 (읽기 까다로운 2자 한자어·유의어·상위어) 150개
-- 분야: 행정·법무·외교·경영·노동·학술·심리·사회시사
-- 생성일: 2026-06-23
-- 중복가드: WHERE NOT EXISTS (word 기준)
-- 주의:
--   · 기존 v_nouns.sql / v2_nouns2.sql / v2_suru.sql 수록어 제외
--   · 특수독음 자가검수 완료
--     (措置:そち / 遂行:すいこう / 把握:はあく / 招集:しょうしゅう /
--      折衷:せっちゅう / 暫定:ざんてい / 便宜:べんぎ / 遵守:じゅんしゅ /
--      相殺:そうさい / 建前:たてまえ / 本音:ほんね / 稟議:りんぎ /
--      瑕疵:かし / 忖度:そんたく / 斟酌:しんしゃく / 逡巡:しゅんじゅん /
--      躊躇:ちゅうちょ / 矜持:きょうじ / 敷衍:ふえん / 帰趨:きすう /
--      歪曲:わいきょく / 捏造:ねつぞう / 改竄:かいざん)
--   · ' は '' にエスケープ済み
-- ============================================================

-- ─── [행정·정책 실무 20개] ───────────────────────────────────────
-- 1
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '措置','そち','조치','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='措置');
-- 2
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '遂行','すいこう','수행, 이행','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遂行');
-- 3
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '把握','はあく','파악','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='把握');
-- 4
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '招集','しょうしゅう','소집(의회·회의 등을 공식 소집)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='招集');
-- 5
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '折衷','せっちゅう','절충','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='折衷');
-- 6
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '暫定','ざんてい','잠정(임시로 정함)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暫定');
-- 7
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '便宜','べんぎ','편의, 편리를 도모함','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='便宜');
-- 8
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '遵守','じゅんしゅ','준수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遵守');
-- 9
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '相殺','そうさい','상쇄(서로 지워 없앰, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相殺');
-- 10
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '建前','たてまえ','건전(공식 입장·겉모습), 명목','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='建前');
-- 11
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '本音','ほんね','속마음, 진심','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='本音');
-- 12
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '承認','しょうにん','승인','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='承認');
-- 13
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '裁可','さいか','재가(상급자의 최종 허가)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='裁可');
-- 14
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '却下','きゃっか','각하(신청 등을 물리침)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='却下');
-- 15
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '棄却','ききゃく','기각(법원이 청구를 물리침)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='棄却');
-- 16
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '留保','りゅうほ','유보(보류, 조건부 동의)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='留保');
-- 17
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '猶予','ゆうよ','유예(기한을 미룸)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='猶予');
-- 18
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '延滞','えんたい','연체, 지체','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='延滞');
-- 19
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '督促','とくそく','독촉','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='督促');
-- 20
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '喚起','かんき','환기(주의 등을 불러일으킴)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喚起');

-- ─── [외교·국제관계 15개] ────────────────────────────────────────
-- 21
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '折衝','せっしょう','외교 협상, 절충 교섭','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='折衝');
-- 22
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '交渉','こうしょう','교섭, 협상','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='交渉');
-- 23
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '妥結','だけつ','타결','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='妥結');
-- 24
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '決裂','けつれつ','결렬','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='決裂');
-- 25
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '決議','けつぎ','결의','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='決議');
-- 26
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '議決','ぎけつ','의결','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='議決');
-- 27
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '棄権','きけん','기권','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='棄権');
-- 28
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '署名','しょめい','서명','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='署名');
-- 29
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '調印','ちょういん','조인(조약에 서명)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='調印');
-- 30
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '発効','はっこう','발효(조약·법률이 효력 발생)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発効');
-- 31
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '失効','しっこう','실효(효력을 잃음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='失効');
-- 32
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '撤退','てったい','철퇴, 철수','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='撤退');
-- 33
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '派遣','はけん','파견','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='派遣');
-- 34
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '駐留','ちゅうりゅう','주류(군대 등이 주둔)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='駐留');
-- 35
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '報復','ほうふく','보복','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='報復');

-- ─── [경영·조직·비즈니스 15개] ───────────────────────────────────
-- 36
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '稟議','りんぎ','품의(결재 올림, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='稟議');
-- 37
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '決裁','けっさい','결재(상급자 승인)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='決裁');
-- 38
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '査定','さてい','사정(평가·심사)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='査定');
-- 39
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '見積','みつもり','견적','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見積');
-- 40
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '発注','はっちゅう','발주','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発注');
-- 41
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '受注','じゅちゅう','수주','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受注');
-- 42
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '納期','のうき','납기','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='納期');
-- 43
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '検収','けんしゅう','검수(납품 검사·인수)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='検収');
-- 44
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '瑕疵','かし','하자(결함, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='瑕疵');
-- 45
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '補償','ほしょう','보상','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='補償');
-- 46
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '損害','そんがい','손해','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='損害');
-- 47
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '給与','きゅうよ','급여','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='給与');
-- 48
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '賞与','しょうよ','상여금, 보너스','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='賞与');
-- 49
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '報酬','ほうしゅう','보수, 사례금','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='報酬');
-- 50
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '損失','そんしつ','손실(損害의 유의어, 금전 중심)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='損失');

-- ─── [사회·노동 관련 15개] ────────────────────────────────────────
-- 51
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '雇用','こよう','고용','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雇用');
-- 52
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '解雇','かいこ','해고','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解雇');
-- 53
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '休業','きゅうぎょう','휴업','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='休業');
-- 54
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '転籍','てんせき','전적(소속 회사 이적)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転籍');
-- 55
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '出向','しゅっこう','출향(계열사 파견 근무)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出向');
-- 56
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '就労','しゅうろう','취로, 취업 활동','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='就労');
-- 57
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '労務','ろうむ','노무','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='労務');
-- 58
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '労使','ろうし','노사(노동자와 사용자)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='労使');
-- 59
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '争議','そうぎ','쟁의(노사 분쟁)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='争議');
-- 60
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '罷業','ひぎょう','파업(동맹 파업, 격식어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='罷業');
-- 61
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '不服','ふふく','불복, 불만','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不服');
-- 62
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '異議','いぎ','이의','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='異議');
-- 63
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '告知','こくち','고지, 통보','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='告知');
-- 64
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '通達','つうたつ','통달(관청이 하급기관에 지시)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通達');
-- 65
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '申立','もうしたて','신청, 신고(법률)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申立');

-- ─── [학술·논리·연구 15개] ────────────────────────────────────────
-- 66
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '論証','ろんしょう','논증','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論証');
-- 67
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '例証','れいしょう','예증(예를 들어 증명)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='例証');
-- 68
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '反証','はんしょう','반증','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反証');
-- 69
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '傍証','ぼうしょう','방증(간접 증거)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傍証');
-- 70
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '査読','さどく','동료 심사(peer review)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='査読');
-- 71
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '言及','げんきゅう','언급','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言及');
-- 72
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '援用','えんよう','원용(다른 규정·사례를 끌어다 씀)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='援用');
-- 73
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '敷衍','ふえん','부연(부연 설명, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='敷衍');
-- 74
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '概括','がいかつ','개괄','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='概括');
-- 75
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '総括','そうかつ','총괄','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='総括');
-- 76
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '帰趨','きすう','귀추(결말의 방향, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰趨');
-- 77
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '趨勢','すうせい','추세','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='趨勢');
-- 78
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '変遷','へんせん','변천','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変遷');
-- 79
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '沿革','えんかく','연혁','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='沿革');
-- 80
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '精査','せいさ','정사(면밀히 조사함)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精査');

-- ─── [심리·인간관계·격식어 15개] ─────────────────────────────────
-- 81
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '忖度','そんたく','손탁(상대의 의중을 미리 헤아림, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='忖度');
-- 82
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '配慮','はいりょ','배려','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='配慮');
-- 83
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '斟酌','しんしゃく','심작(사정을 참작함, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='斟酌');
-- 84
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '忌避','きひ','기피','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='忌避');
-- 85
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '忌憚','きたん','기탄(꺼림, 「忌憚なく」의 형태로 사용)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='忌憚');
-- 86
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '逡巡','しゅんじゅん','준순(머뭇거림, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逡巡');
-- 87
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '躊躇','ちゅうちょ','주저(머뭇거림, 逡巡의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='躊躇');
-- 88
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '固執','こしつ','고집','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='固執');
-- 89
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '執着','しゅうちゃく','집착(固執의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='執着');
-- 90
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '嫌悪','けんお','혐오','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嫌悪');
-- 91
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '羞恥','しゅうち','수치(부끄러움)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='羞恥');
-- 92
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '屈辱','くつじょく','굴욕','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='屈辱');
-- 93
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '矜持','きょうじ','긍지(자부심, 특수독음)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='矜持');
-- 94
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '自負','じふ','자부(자신을 높게 평가함)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自負');
-- 95
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '虚偽','きょぎ','허위','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虚偽');

-- ─── [유의어·상위어 그룹 15개] ────────────────────────────────────
-- 96
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '制約','せいやく','제약(규제·제한의 총칭, 상위어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='制約');
-- 97
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '拘束','こうそく','구속(강제적 제한, 制約의 하위어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拘束');
-- 98
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '束縛','そくばく','속박(자유를 빼앗음, 拘束의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='束縛');
-- 99
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '強制','きょうせい','강제(拘束·束縛의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='強制');
-- 100
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '統制','とうせい','통제(조직적 제어, 상위어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='統制');
-- 101
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '掌握','しょうあく','장악(완전히 쥐고 통제, 把握의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='掌握');
-- 102
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '支配','しはい','지배(統制·掌握의 상위어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='支配');
-- 103
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '監督','かんとく','감독(유의어: 管理·統括)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='監督');
-- 104
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '監視','かんし','감시(監督의 유의어, 더 강한 주시)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='監視');
-- 105
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '究明','きゅうめい','구명(원인 등을 규명)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='究明');
-- 106
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '解明','かいめい','해명(의미·사실을 밝힘, 究明의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解明');
-- 107
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '糾明','きゅうめい','규명(죄·잘못을 엄밀히 밝힘)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='糾明');
-- 108
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '責務','せきむ','책무(義務의 유의어, 도덕적 의무 강조)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='責務');
-- 109
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '帰責','きせき','귀책(책임 귀속)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰責');
-- 110
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過失','かしつ','과실(고의 없는 실수, 故意의 대응어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過失');

-- ─── [경제·금융 심화 15개] ────────────────────────────────────────
-- 111
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '担保','たんぽ','담보','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='担保');
-- 112
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '抵当','ていとう','저당(담보의 하위어, 부동산 한정)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抵当');
-- 113
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '債務','さいむ','채무','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='債務');
-- 114
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '債権','さいけん','채권(법률상 청구권, 債券과 구별)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='債権');
-- 115
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '弁済','べんさい','변제(채무 이행, 격식어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁済');
-- 116
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '返済','へんさい','상환(弁済의 유의어, 일상어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='返済');
-- 117
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '償還','しょうかん','상환(격식어, 채권·국채 등)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='償還');
-- 118
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '清算','せいさん','청산(채무 정리 또는 거래 마무리)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清算');
-- 119
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '精算','せいさん','정산(비용 세밀히 계산, 清算의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精算');
-- 120
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '収支','しゅうし','수지(수입과 지출)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収支');
-- 121
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '歳入','さいにゅう','세입(국가 수입)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歳入');
-- 122
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '歳出','さいしゅつ','세출(국가 지출, 歳入의 대응어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歳出');
-- 123
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '繰越','くりこし','이월(예산·잔액 다음 기로 이전)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='繰越');
-- 124
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '剰余','じょうよ','잉여(남음, 剰余金)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='剰余');
-- 125
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '欠損','けっそん','결손(부족분, 손실)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='欠損');

-- ─── [사회현상·시사어 25개] ───────────────────────────────────────
-- 126
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '少子化','しょうしか','저출산, 소자화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='少子化');
-- 127
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '高齢化','こうれいか','고령화','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高齢化');
-- 128
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過疎','かそ','과소(인구 과소)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過疎');
-- 129
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '過密','かみつ','과밀(인구 과밀)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過密');
-- 130
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '貧困','ひんこん','빈곤','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='貧困');
-- 131
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '窮乏','きゅうぼう','궁핍(貧困의 유의어, 더 심한 상태)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='窮乏');
-- 132
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '偏重','へんちょう','편중(한쪽에 치우쳐 중시함)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='偏重');
-- 133
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '傾斜','けいしゃ','경사(쏠림, 치우침)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傾斜');
-- 134
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '歪曲','わいきょく','왜곡(わいきょく, 특수독음 주의)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歪曲');
-- 135
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '捏造','ねつぞう','날조(ねつ, 捏の読み注意)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='捏造');
-- 136
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '改竄','かいざん','개찬(문서 변조, 竄の読み注意)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改竄');
-- 137
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '隠蔽','いんぺい','은폐','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='隠蔽');
-- 138
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '暴露','ばくろ','폭로(隠蔽의 반의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暴露');
-- 139
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '看過','かんか','간과','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='看過');
-- 140
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '遺漏','いろう','유루(빠뜨림, 누락)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遺漏');
-- 141
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '故意','こい','고의(過失의 대응어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='故意');
-- 142
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '失念','しつねん','망각(깜빡 잊음, 격식어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='失念');
-- 143
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '錯誤','さくご','착오','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='錯誤');
-- 144
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '誤謬','ごびゅう','오류(격식어, 錯誤의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誤謬');
-- 145
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '陳腐','ちんぷ','진부(식상함)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陳腐');
-- 146
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '陳述','ちんじゅつ','진술','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陳述');
-- 147
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '弁明','べんめい','변명(사실 해명, 格式語)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁明');
-- 148
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '釈明','しゃくめい','석명(이유를 밝혀 해명)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='釈明');
-- 149
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '弁解','べんかい','변해(구실 댐, 弁明의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁解');
-- 150
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech)
SELECT '申弁','しんべん','신변(자신의 행위를 해명, 弁明의 유의어)','N1','명사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申弁');
