-- k_a.sql
-- 常用漢字 중 기존 목록에 없는 글자 (획수 1~9획 위주)
-- 생성일: 2026-06-21
-- 중복가드: NOT EXISTS 조건 필수

-- ============================================================
-- 2획
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '乃','ナイ','の','이에 내','N1','[{"word":"乃至","reading":"ないし","meaning":"내지, 또는"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='乃');

-- ============================================================
-- 3획
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '士','シ','','선비 사','N1','[{"word":"士気","reading":"しき","meaning":"사기"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='士');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '弓','キュウ','ゆみ','활 궁','N1','[{"word":"弓道","reading":"きゅうどう","meaning":"궁도"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='弓');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '才','サイ','','재주 재','N1','[{"word":"才能","reading":"さいのう","meaning":"재능"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='才');

-- ============================================================
-- 4획
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '仁','ジン・ニン','','어질 인','N1','[{"word":"仁義","reading":"じんぎ","meaning":"인의"},{"word":"仁者","reading":"じんしゃ","meaning":"인자한 사람"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='仁');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '夫','フ・フウ','おっと','지아비 부','N1','[{"word":"夫婦","reading":"ふうふ","meaning":"부부"},{"word":"夫人","reading":"ふじん","meaning":"부인"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='夫');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '戸','コ','と','지게 호, 집 호','N1','[{"word":"戸籍","reading":"こせき","meaning":"호적"},{"word":"戸口","reading":"こぐち","meaning":"문어귀"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='戸');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '片','ヘン','かた','조각 편','N1','[{"word":"片道","reading":"かたみち","meaning":"편도"},{"word":"断片","reading":"だんぺん","meaning":"단편"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='片');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '牛','ギュウ','うし','소 우','N1','[{"word":"牛肉","reading":"ぎゅうにく","meaning":"쇠고기"},{"word":"牛乳","reading":"ぎゅうにゅう","meaning":"우유"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='牛');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '王','オウ','','임금 왕','N1','[{"word":"王様","reading":"おうさま","meaning":"왕"},{"word":"国王","reading":"こくおう","meaning":"국왕"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='王');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '毛','モウ','け','털 모','N1','[{"word":"毛髪","reading":"もうはつ","meaning":"모발"},{"word":"羊毛","reading":"ようもう","meaning":"양모"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='毛');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '反','ハン・ホン','そ.る・そ.らす','돌이킬 반','N1','[{"word":"反対","reading":"はんたい","meaning":"반대"},{"word":"反省","reading":"はんせい","meaning":"반성"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='反');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '穴','ケツ','あな','구멍 혈','N1','[{"word":"穴場","reading":"あなば","meaning":"숨은 명소"},{"word":"落とし穴","reading":"おとしあな","meaning":"함정"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='穴');

-- ============================================================
-- 5획
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '矢','シ','や','화살 시','N1','[{"word":"矢印","reading":"やじるし","meaning":"화살표"},{"word":"弓矢","reading":"ゆみや","meaning":"활과 화살"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='矢');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '他','タ','ほか','다를 타','N1','[{"word":"他人","reading":"たにん","meaning":"타인"},{"word":"他者","reading":"たしゃ","meaning":"타자"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='他');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '令','レイ','','하여금 령/영','N1','[{"word":"命令","reading":"めいれい","meaning":"명령"},{"word":"令状","reading":"れいじょう","meaning":"영장"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='令');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '刊','カン','','새길 간, 간행할 간','N1','[{"word":"週刊","reading":"しゅうかん","meaning":"주간"},{"word":"刊行","reading":"かんこう","meaning":"간행"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='刊');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '加','カ','くわ.える・くわ.わる','더할 가','N1','[{"word":"加速","reading":"かそく","meaning":"가속"},{"word":"加入","reading":"かにゅう","meaning":"가입"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='加');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '包','ホウ','つつ.む','쌀 포','N1','[{"word":"包装","reading":"ほうそう","meaning":"포장"},{"word":"包括","reading":"ほうかつ","meaning":"포괄"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='包');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '占','セン','し.める・うらな.う','차지할 점, 점칠 점','N1','[{"word":"占領","reading":"せんりょう","meaning":"점령"},{"word":"占有","reading":"せんゆう","meaning":"점유"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='占');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '史','シ','','역사 사','N1','[{"word":"歴史","reading":"れきし","meaning":"역사"},{"word":"史料","reading":"しりょう","meaning":"사료"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='史');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '司','シ','つかさど.る','맡을 사','N1','[{"word":"司令","reading":"しれい","meaning":"사령"},{"word":"司会","reading":"しかい","meaning":"사회"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='司');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '失','シツ','うしな.う','잃을 실','N1','[{"word":"失敗","reading":"しっぱい","meaning":"실패"},{"word":"失望","reading":"しつぼう","meaning":"실망"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='失');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '市','シ','いち','시장 시, 도시 시','N1','[{"word":"市場","reading":"しじょう","meaning":"시장"},{"word":"都市","reading":"とし","meaning":"도시"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='市');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '平','ヘイ・ビョウ','たい.ら・ひら','평평할 평','N1','[{"word":"平和","reading":"へいわ","meaning":"평화"},{"word":"平均","reading":"へいきん","meaning":"평균"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='平');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '幼','ヨウ','おさな.い','어릴 유','N1','[{"word":"幼児","reading":"ようじ","meaning":"유아"},{"word":"幼稚","reading":"ようち","meaning":"유치"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='幼');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '未','ミ','ま.だ','아닐 미','N1','[{"word":"未来","reading":"みらい","meaning":"미래"},{"word":"未定","reading":"みてい","meaning":"미정"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='未');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '皮','ヒ','かわ','가죽 피','N1','[{"word":"皮膚","reading":"ひふ","meaning":"피부"},{"word":"皮肉","reading":"ひにく","meaning":"피육, 비꼼"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='皮');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '礼','レイ・ライ','','예절 례/예','N1','[{"word":"礼儀","reading":"れいぎ","meaning":"예의"},{"word":"礼拝","reading":"れいはい","meaning":"예배"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='礼');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '由','ユ・ユウ・ユイ','よし','말미암을 유','N1','[{"word":"理由","reading":"りゆう","meaning":"이유"},{"word":"由来","reading":"ゆらい","meaning":"유래"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='由');

-- ============================================================
-- 6획
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '仮','カ','かり','거짓 가, 임시 가','N1','[{"word":"仮定","reading":"かてい","meaning":"가정"},{"word":"仮説","reading":"かせつ","meaning":"가설"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='仮');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '両','リョウ','','두 량/양','N1','[{"word":"両方","reading":"りょうほう","meaning":"양쪽"},{"word":"両者","reading":"りょうしゃ","meaning":"양자"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='両');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '列','レツ','','벌일 열/렬','N1','[{"word":"列車","reading":"れっしゃ","meaning":"열차"},{"word":"行列","reading":"ぎょうれつ","meaning":"행렬"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='列');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '団','ダン・トン','','둥글 단, 모일 단','N1','[{"word":"集団","reading":"しゅうだん","meaning":"집단"},{"word":"団体","reading":"だんたい","meaning":"단체"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='団');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '在','ザイ','あ.る','있을 재','N1','[{"word":"在宅","reading":"ざいたく","meaning":"재택"},{"word":"存在","reading":"そんざい","meaning":"존재"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='在');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '好','コウ','す.き・この.む','좋을 호','N1','[{"word":"好評","reading":"こうひょう","meaning":"호평"},{"word":"好奇心","reading":"こうきしん","meaning":"호기심"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='好');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '寺','ジ','てら','절 사','N1','[{"word":"寺院","reading":"じいん","meaning":"사원"},{"word":"寺社","reading":"じしゃ","meaning":"사찰과 신사"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='寺');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '式','シキ','','법 식, 의식 식','N1','[{"word":"形式","reading":"けいしき","meaning":"형식"},{"word":"式典","reading":"しきてん","meaning":"식전"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='式');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '存','ソン・ゾン','','있을 존','N1','[{"word":"存在","reading":"そんざい","meaning":"존재"},{"word":"依存","reading":"いそん","meaning":"의존"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='存');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '次','ジ・シ','つぎ・つ.ぐ','버금 차, 다음 차','N1','[{"word":"次第","reading":"しだい","meaning":"차제, 순서"},{"word":"次回","reading":"じかい","meaning":"다음 회"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='次');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '羽','ウ','はね・は','깃 우','N1','[{"word":"羽毛","reading":"うもう","meaning":"우모, 솜털"},{"word":"羽根","reading":"はね","meaning":"날개"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='羽');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '争','ソウ','あらそ.う','다툴 쟁','N1','[{"word":"競争","reading":"きょうそう","meaning":"경쟁"},{"word":"争点","reading":"そうてん","meaning":"쟁점"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='争');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '舌','ゼツ','した','혀 설','N1','[{"word":"舌打ち","reading":"したうち","meaning":"혀를 참"},{"word":"毒舌","reading":"どくぜつ","meaning":"독설"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='舌');

-- ============================================================
-- 7획
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '兵','ヘイ・ヒョウ','','군사 병','N1','[{"word":"兵士","reading":"へいし","meaning":"병사"},{"word":"兵器","reading":"へいき","meaning":"병기"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='兵');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '努','ド','つと.める','힘쓸 노/로','N1','[{"word":"努力","reading":"どりょく","meaning":"노력"},{"word":"努める","reading":"つとめる","meaning":"힘쓰다"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='努');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '却','キャク','かえ.って','물리칠 각','N1','[{"word":"却下","reading":"きゃっか","meaning":"각하"},{"word":"返却","reading":"へんきゃく","meaning":"반환"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='却');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '君','クン','きみ','임금 군, 그대 군','N1','[{"word":"君主","reading":"くんしゅ","meaning":"군주"},{"word":"諸君","reading":"しょくん","meaning":"제군"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='君');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '和','ワ','やわ.らぐ・なご.む','화할 화','N1','[{"word":"平和","reading":"へいわ","meaning":"평화"},{"word":"和解","reading":"わかい","meaning":"화해"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='和');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '谷','コク','たに','골 곡','N1','[{"word":"谷間","reading":"たにま","meaning":"골짜기"},{"word":"峡谷","reading":"きょうこく","meaning":"협곡"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='谷');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '貝','バイ','かい','조개 패','N1','[{"word":"貝殻","reading":"かいがら","meaning":"조개껍데기"},{"word":"巻き貝","reading":"まきがい","meaning":"소라"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='貝');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '角','カク','かど・つの','뿔 각, 모퉁이 각','N1','[{"word":"角度","reading":"かくど","meaning":"각도"},{"word":"三角","reading":"さんかく","meaning":"삼각"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='角');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '里','リ','さと','마을 리/이','N1','[{"word":"郷里","reading":"きょうり","meaning":"고향"},{"word":"里帰り","reading":"さとがえり","meaning":"친정 방문"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='里');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '村','ソン','むら','마을 촌','N1','[{"word":"農村","reading":"のうそん","meaning":"농촌"},{"word":"村落","reading":"そんらく","meaning":"촌락"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='村');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '束','ソク','たば・たば.ねる','묶을 속, 묶음 속','N1','[{"word":"約束","reading":"やくそく","meaning":"약속"},{"word":"束縛","reading":"そくばく","meaning":"속박"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='束');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '麦','バク','むぎ','보리 맥','N1','[{"word":"小麦","reading":"こむぎ","meaning":"밀"},{"word":"麦茶","reading":"むぎちゃ","meaning":"보리차"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='麦');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '呂','リョ・ロ','','음률 려/여','N1','[{"word":"風呂","reading":"ふろ","meaning":"목욕탕"},{"word":"呂律","reading":"ろれつ","meaning":"말소리 가락"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='呂');

-- ============================================================
-- 8획
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '具','グ','そな.える','갖출 구','N1','[{"word":"道具","reading":"どうぐ","meaning":"도구"},{"word":"具体","reading":"ぐたい","meaning":"구체"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='具');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '制','セイ','','마를 제, 제도 제','N1','[{"word":"制度","reading":"せいど","meaning":"제도"},{"word":"規制","reading":"きせい","meaning":"규제"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='制');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '刷','サツ','す.る','인쇄할 쇄','N1','[{"word":"印刷","reading":"いんさつ","meaning":"인쇄"},{"word":"刷新","reading":"さっしん","meaning":"쇄신"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='刷');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '協','キョウ','','화할 협, 협력할 협','N1','[{"word":"協力","reading":"きょうりょく","meaning":"협력"},{"word":"協定","reading":"きょうてい","meaning":"협정"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='協');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '受','ジュ','う.ける・う.かる','받을 수','N1','[{"word":"受験","reading":"じゅけん","meaning":"수험"},{"word":"受信","reading":"じゅしん","meaning":"수신"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='受');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '固','コ','かた.める・かた.まる','굳을 고','N1','[{"word":"固定","reading":"こてい","meaning":"고정"},{"word":"固有","reading":"こゆう","meaning":"고유"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='固');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '夜','ヤ','よる・よ','밤 야','N1','[{"word":"夜間","reading":"やかん","meaning":"야간"},{"word":"深夜","reading":"しんや","meaning":"심야"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='夜');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '委','イ','ゆだ.ねる','맡길 위','N1','[{"word":"委員","reading":"いいん","meaning":"위원"},{"word":"委任","reading":"いにん","meaning":"위임"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='委');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '実','ジツ','み・みの.る','열매 실, 실제 실','N1','[{"word":"実際","reading":"じっさい","meaning":"실제"},{"word":"事実","reading":"じじつ","meaning":"사실"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='実');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '宙','チュウ','','하늘 주','N1','[{"word":"宇宙","reading":"うちゅう","meaning":"우주"},{"word":"宙返り","reading":"ちゅうがえり","meaning":"공중제비"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='宙');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '定','テイ・ジョウ','さだ.める・さだ.まる','정할 정','N1','[{"word":"規定","reading":"きてい","meaning":"규정"},{"word":"安定","reading":"あんてい","meaning":"안정"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='定');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '岸','ガン','きし','언덕 안','N1','[{"word":"海岸","reading":"かいがん","meaning":"해안"},{"word":"岸壁","reading":"がんぺき","meaning":"안벽"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='岸');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '径','ケイ','みち','지름길 경','N1','[{"word":"直径","reading":"ちょっけい","meaning":"직경"},{"word":"半径","reading":"はんけい","meaning":"반경"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='径');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '忠','チュウ','','충성 충','N1','[{"word":"忠実","reading":"ちゅうじつ","meaning":"충실"},{"word":"忠誠","reading":"ちゅうせい","meaning":"충성"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='忠');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '念','ネン','','생각 념/염','N1','[{"word":"概念","reading":"がいねん","meaning":"개념"},{"word":"念頭","reading":"ねんとう","meaning":"염두"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='念');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '放','ホウ','はな.す・はな.つ','놓을 방','N1','[{"word":"放送","reading":"ほうそう","meaning":"방송"},{"word":"解放","reading":"かいほう","meaning":"해방"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='放');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '拓','タク','ひら.く','열 척','N1','[{"word":"開拓","reading":"かいたく","meaning":"개척"},{"word":"干拓","reading":"かんたく","meaning":"간척"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='拓');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '易','エキ・イ','やさ.しい','바꿀 역, 쉬울 이','N1','[{"word":"貿易","reading":"ぼうえき","meaning":"무역"},{"word":"容易","reading":"ようい","meaning":"용이"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='易');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '明','メイ・ミョウ','あか.るい・あ.ける','밝을 명','N1','[{"word":"明確","reading":"めいかく","meaning":"명확"},{"word":"説明","reading":"せつめい","meaning":"설명"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='明');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '果','カ','は.たす・くだ.もの','열매 과','N1','[{"word":"結果","reading":"けっか","meaning":"결과"},{"word":"成果","reading":"せいか","meaning":"성과"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='果');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '枚','マイ','','낱 매','N1','[{"word":"枚数","reading":"まいすう","meaning":"매수, 장수"},{"word":"一枚","reading":"いちまい","meaning":"한 장"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='枚');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '欧','オウ','','유럽 구','N1','[{"word":"欧州","reading":"おうしゅう","meaning":"유럽"},{"word":"欧米","reading":"おうべい","meaning":"구미"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='欧');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '河','カ','かわ','강 하','N1','[{"word":"河川","reading":"かせん","meaning":"하천"},{"word":"銀河","reading":"ぎんが","meaning":"은하"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='河');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '妻','サイ','つま','아내 처','N1','[{"word":"妻子","reading":"さいし","meaning":"처자"},{"word":"夫妻","reading":"ふさい","meaning":"부처, 부부"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='妻');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '肩','ケン','かた','어깨 견','N1','[{"word":"肩書き","reading":"かたがき","meaning":"직함"},{"word":"双肩","reading":"そうけん","meaning":"양 어깨"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='肩');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '肥','ヒ','こ.える・こえ','살찔 비','N1','[{"word":"肥料","reading":"ひりょう","meaning":"비료"},{"word":"肥満","reading":"ひまん","meaning":"비만"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='肥');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '虎','コ','とら','범 호','N1','[{"word":"虎視眈々","reading":"こしたんたん","meaning":"호시탐탐"},{"word":"白虎","reading":"びゃっこ","meaning":"백호"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='虎');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '直','チョク・ジキ','なお.す・ただ.ちに','곧을 직','N1','[{"word":"直接","reading":"ちょくせつ","meaning":"직접"},{"word":"直線","reading":"ちょくせん","meaning":"직선"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='直');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '苦','ク','くる.しい・にが.い','쓸 고, 괴로울 고','N1','[{"word":"苦労","reading":"くろう","meaning":"고로"},{"word":"苦手","reading":"にがて","meaning":"약점"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='苦');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '牧','ボク','まき','칠 목, 목장 목','N1','[{"word":"牧場","reading":"ぼくじょう","meaning":"목장"},{"word":"牧草","reading":"ぼくそう","meaning":"목초"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='牧');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '京','キョウ・ケイ','','서울 경','N1','[{"word":"上京","reading":"じょうきょう","meaning":"상경"},{"word":"東京","reading":"とうきょう","meaning":"도쿄"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='京');

-- ============================================================
-- 9획
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '咲','','さ.く','꽃 필 소','N1','[{"word":"咲き誇る","reading":"さきほこる","meaning":"만발하다"},{"word":"笑顔が咲く","reading":"えがおがさく","meaning":"웃음꽃이 피다"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='咲');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '城','ジョウ','しろ','성 성','N1','[{"word":"城郭","reading":"じょうかく","meaning":"성곽"},{"word":"城下町","reading":"じょうかまち","meaning":"성하마을"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='城');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '室','シツ','むろ','방 실','N1','[{"word":"室内","reading":"しつない","meaning":"실내"},{"word":"教室","reading":"きょうしつ","meaning":"교실"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='室');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '封','フウ・ホウ','','봉할 봉','N1','[{"word":"封筒","reading":"ふうとう","meaning":"봉투"},{"word":"封鎖","reading":"ふうさ","meaning":"봉쇄"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='封');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '専','セン','もっぱ.ら','오로지 전','N1','[{"word":"専門","reading":"せんもん","meaning":"전문"},{"word":"専用","reading":"せんよう","meaning":"전용"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='専');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '段','ダン','','층계 단, 단계 단','N1','[{"word":"段階","reading":"だんかい","meaning":"단계"},{"word":"手段","reading":"しゅだん","meaning":"수단"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='段');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '省','ショウ・セイ','はぶ.く・かえり.みる','살필 성, 덜 생','N1','[{"word":"反省","reading":"はんせい","meaning":"반성"},{"word":"省略","reading":"しょうりゃく","meaning":"생략"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='省');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '突','トツ','つ.く','갑자기 돌, 찌를 돌','N1','[{"word":"突然","reading":"とつぜん","meaning":"갑자기"},{"word":"衝突","reading":"しょうとつ","meaning":"충돌"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='突');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '草','ソウ','くさ','풀 초','N1','[{"word":"草原","reading":"そうげん","meaning":"초원"},{"word":"雑草","reading":"ざっそう","meaning":"잡초"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='草');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '軍','グン','','군사 군','N1','[{"word":"軍隊","reading":"ぐんたい","meaning":"군대"},{"word":"軍事","reading":"ぐんじ","meaning":"군사"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='軍');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words)
SELECT '飛','ヒ','と.ぶ・と.ばす','날 비','N1','[{"word":"飛行","reading":"ひこう","meaning":"비행"},{"word":"飛躍","reading":"ひやく","meaning":"비약"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='飛');
