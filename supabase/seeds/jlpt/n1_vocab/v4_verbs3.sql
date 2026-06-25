-- ============================================================
-- JLPT N1 동사 어휘 150개 (감각·인지·발화·이동·변화 동사)
-- 대상: jlpt_vocabulary (part_of_speech = '동사')
-- 범위: 감각/인지 동사(察する·見抜く·見極める·勘づく 류),
--       발화 동사(告げる·呟く·言い切る·諭す 류),
--       이동/변화 동사(押し寄せる·立ち去る·遠ざかる·見送る 류),
--       기타 고급 N1 동사 (기존 v_verbs/v3_verbs2/v2_suru 미수록)
-- 중복가드: word가 어느 레벨에도 존재하면 스킵
-- 생성일: 2026-06-23
-- 검수: reading(히라가나)·meaning_ko 자가검수 완료
-- ============================================================

-- ===== 감각·인지 동사 (1~40) =====

-- 1
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '察する','さっする','헤아리다, 짐작하다, 이해하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='察する');
-- 2
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見抜く','みぬく','꿰뚫어 보다, 간파하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見抜く');
-- 3
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '勘づく','かんづく','눈치채다, 감지하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='勘づく');
-- 4
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '感知する','かんちする','감지하다, 인식하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感知する');
-- 5
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '知覚する','ちかくする','지각하다, 감각으로 알아차리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='知覚する');
-- 6
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '感じ取る','かんじとる','느껴서 알아채다, 감지하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感じ取る');
-- 7
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見て取る','みてとる','(보고) 알아채다, 판단하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見て取る');
-- 8
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見定める','みさだめる','확실히 판단하다, 가늠하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見定める');
-- 9
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見分ける','みわける','구별하다, 가려내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見分ける');
-- 10
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見破る','みやぶる','간파하다, 꿰뚫어 알다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見破る');
-- 11
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '悟る','さとる','깨닫다, 터득하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悟る');
-- 12
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '看取る','みとる','알아채다, 읽어내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='看取る');
-- 13
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '感じ入る','かんじいる','깊이 감동받다, 감탄하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感じ入る');
-- 14
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '嗅ぎ取る','かぎとる','냄새로 알아채다, 감지하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嗅ぎ取る');
-- 15
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '聞き取る','ききとる','듣고 알아채다, 청취하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='聞き取る');
-- 16
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '読み取る','よみとる','읽어서 파악하다, 해독하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='読み取る');
-- 17
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '汲み取る','くみとる','(뜻을) 헤아리다, 파악하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汲み取る');
-- 18
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '読み解く','よみとく','읽어서 풀다, 해석하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='読み解く');
-- 19
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見通す','みとおす','내다보다, 꿰뚫어 보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見通す');
-- 20
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '思い巡らす','おもいめぐらす','이리저리 생각하다, 곰곰이 생각하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い巡らす');
-- 21
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '推し量る','おしはかる','추측하다, 헤아리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='推し量る');
-- 22
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見込む','みこむ','예상하다, 기대하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見込む');
-- 23
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '想定する','そうていする','상정하다, 가정하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='想定する');
-- 24
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '推察する','すいさつする','추찰하다, 짐작하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='推察する');
-- 25
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '洞察する','どうさつする','통찰하다, 깊이 꿰뚫어 보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='洞察する');
-- 26
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '認識する','にんしきする','인식하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='認識する');
-- 27
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '把握する','はあくする','파악하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='把握する');
-- 28
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '弁別する','べんべつする','변별하다, 구별하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁別する');
-- 29
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '識別する','しきべつする','식별하다, 구별하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='識別する');
-- 30
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '察知する','さっちする','눈치채다, 사전에 알아채다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='察知する');
-- 31
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '体感する','たいかんする','몸으로 느끼다, 체감하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体感する');
-- 32
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '体験する','たいけんする','체험하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体験する');
-- 33
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '直感する','ちょっかんする','직감하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='直感する');
-- 34
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '直観する','ちょっかんする','직관하다, 직관으로 파악하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='直観する');
-- 35
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '痛感する','つうかんする','통감하다, 절실히 느끼다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='痛感する');
-- 36
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '実感する','じっかんする','실감하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実感する');
-- 37
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '共感する','きょうかんする','공감하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='共感する');
-- 38
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '感銘する','かんめいする','감명받다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感銘する');
-- 39
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '感嘆する','かんたんする','감탄하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感嘆する');
-- 40
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '嘆じる','たんじる','감탄하다, 한탄하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嘆じる');

-- ===== 발화·전달 동사 (41~80) =====

-- 41
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '告げる','つげる','알리다, 고하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='告げる');
-- 42
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '呟く','つぶやく','중얼거리다, 혼잣말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呟く');
-- 43
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '言い切る','いいきる','단언하다, 딱 잘라 말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い切る');
-- 44
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '諭す','さとす','타이르다, 깨우쳐 주다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諭す');
-- 45
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '訴える','うったえる','호소하다, 호소하여 주장하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訴える');
-- 46
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '唱える','となえる','주장하다, 외치다, 읊다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='唱える');
-- 47
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '呼びかける','よびかける','호소하다, 호소하며 부르다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呼びかける');
-- 48
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '宣言する','せんげんする','선언하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宣言する');
-- 49
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '宣告する','せんこくする','선고하다, 선포하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宣告する');
-- 50
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '布告する','ふこくする','포고하다, 공포하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='布告する');
-- 51
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '公言する','こうげんする','공언하다, 공공연히 말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公言する');
-- 52
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '明言する','めいげんする','명언하다, 명확히 말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='明言する');
-- 53
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '断言する','だんげんする','단언하다, 단정하여 말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='断言する');
-- 54
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '主張する','しゅちょうする','주장하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主張する');
-- 55
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '反論する','はんろんする','반론하다, 반박하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反論する');
-- 56
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '論駁する','ろんばくする','논박하다, 논리적으로 반박하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論駁する');
-- 57
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '弁論する','べんろんする','변론하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁論する');
-- 58
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '弁明する','べんめいする','변명하다, 해명하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁明する');
-- 59
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '釈明する','しゃくめいする','해명하다, 사정을 밝히다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='釈明する');
-- 60
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '弁護する','べんごする','변호하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁護する');
-- 61
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '言及する','げんきゅうする','언급하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言及する');
-- 62
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '触れる','ふれる','언급하다; 닿다, 접하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='触れる');
-- 63
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '口添えする','くちぞえする','추천해 주다, 한마디 거들어 주다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口添えする');
-- 64
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '吹聴する','ふいちょうする','떠벌리다, 떠들며 퍼뜨리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='吹聴する');
-- 65
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '囁く','ささやく','속삭이다, 귀엣말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='囁く');
-- 66
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '叫ぶ','さけぶ','외치다, 소리치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='叫ぶ');
-- 67
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '喚く','わめく','고함치다, 떠들다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喚く');
-- 68
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '罵る','ののしる','욕하다, 꾸짖다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='罵る');
-- 69
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '叱責する','しっせきする','질책하다, 꾸짖다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='叱責する');
-- 70
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '戒める','いましめる','경계하다, 훈계하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='戒める');
-- 71
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '諌める','いさめる','간언하다, 간하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諌める');
-- 72
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '勧める','すすめる','권하다, 권고하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='勧める');
-- 73
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '促す','うながす','재촉하다, 촉구하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='促す');
-- 74
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '懇願する','こんがんする','간곡히 부탁하다, 탄원하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懇願する');
-- 75
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '嘆願する','たんがんする','탄원하다, 간청하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嘆願する');
-- 76
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '哀願する','あいがんする','애원하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='哀願する');
-- 77
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '懇請する','こんせいする','간청하다, 간곡히 청하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懇請する');
-- 78
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '依頼する','いらいする','의뢰하다, 부탁하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='依頼する');
-- 79
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '交渉する','こうしょうする','교섭하다, 협상하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='交渉する');
-- 80
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '折衝する','せっしょうする','절충하다, 협상하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='折衝する');

-- ===== 이동·변화 동사 (81~120) =====

-- 81
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '押し寄せる','おしよせる','밀려오다, 몰려들다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='押し寄せる');
-- 82
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '立ち去る','たちさる','그 자리를 떠나다, 떠나가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立ち去る');
-- 83
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '遠ざかる','とおざかる','멀어지다, 거리가 생기다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遠ざかる');
-- 84
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見送る','みおくる','배웅하다; (기회를) 보내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見送る');
-- 85
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '立ち戻る','たちもどる','되돌아오다, 돌아가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立ち戻る');
-- 86
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '立ち寄る','たちよる','들르다, 잠깐 방문하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立ち寄る');
-- 87
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '乗り込む','のりこむ','타고 들어가다, 진입하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗り込む');
-- 88
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '駆け込む','かけこむ','뛰어 들어가다, 달려가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='駆け込む');
-- 89
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '飛び込む','とびこむ','뛰어들다, 달려들다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飛び込む');
-- 90
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '飛び出す','とびだす','뛰쳐나가다, 튀어나오다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飛び出す');
-- 91
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '繰り出す','くりだす','나아가다, 출동하다; 잇따라 내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='繰り出す');
-- 92
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '引き払う','ひきはらう','철수하다, 완전히 떠나다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き払う');
-- 93
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '押しかける','おしかける','몰려가다, 불쑥 찾아가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='押しかける');
-- 94
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '溢れ出る','あふれでる','넘쳐나오다, 흘러넘치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='溢れ出る');
-- 95
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '流れ込む','ながれこむ','흘러들어오다, 유입되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='流れ込む');
-- 96
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '湧き出る','わきでる','솟아나오다, 용출하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='湧き出る');
-- 97
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '湧き上がる','わきあがる','솟아오르다, 용솟음치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='湧き上がる');
-- 98
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '沈み込む','しずみこむ','깊이 가라앉다, 침잠하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='沈み込む');
-- 99
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '落ち込む','おちこむ','빠지다, 침울해지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='落ち込む');
-- 100
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '陥る','おちいる','빠지다, 처하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陥る');
-- 101
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '転落する','てんらくする','전락하다, 추락하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転落する');
-- 102
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '急落する','きゅうらくする','급락하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急落する');
-- 103
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '急騰する','きゅうとうする','급등하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急騰する');
-- 104
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '高騰する','こうとうする','고등하다, 급등하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高騰する');
-- 105
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '暴落する','ぼうらくする','폭락하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暴落する');
-- 106
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '変容する','へんようする','변용하다, 모습이 바뀌다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変容する');
-- 107
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '変貌する','へんぼうする','변모하다, 모습이 크게 바뀌다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変貌する');
-- 108
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '変遷する','へんせんする','변천하다, 변해 가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変遷する');
-- 109
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '推移する','すいいする','추이하다, 변화해 가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='推移する');
-- 110
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '移行する','いこうする','이행하다, 이전하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='移行する');
-- 111
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '移転する','いてんする','이전하다, 옮기다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='移転する');
-- 112
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '転換する','てんかんする','전환하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転換する');
-- 113
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '転化する','てんかする','전화하다, 변화하여 다른 것이 되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転化する');
-- 114
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '転じる','てんじる','전환되다, 바뀌다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転じる');
-- 115
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '様変わりする','さまがわりする','모습이 크게 바뀌다, 면모를 일신하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='様変わりする');
-- 116
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '一変する','いっぺんする','일변하다, 완전히 바뀌다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一変する');
-- 117
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '激変する','げきへんする','격변하다, 급격히 변화하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='激変する');
-- 118
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '急変する','きゅうへんする','급변하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急変する');
-- 119
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '化ける','ばける','변신하다, 둔갑하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='化ける');
-- 120
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '生まれ変わる','うまれかわる','다시 태어나다, 환생하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生まれ変わる');

-- ===== 기타 고급 N1 동사 (121~150) =====

-- 121
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見合わせる','みあわせる','마주 보다; 보류하다, 보고 결정하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見合わせる');
-- 122
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '飛び回る','とびまわる','날아다니다, 뛰어다니다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飛び回る');
-- 123
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '走り回る','はしりまわる','뛰어다니다, 분주히 돌아다니다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='走り回る');
-- 124
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見越す','みこす','예측하다, 내다보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見越す');
-- 125
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見渡す','みわたす','두루 바라보다, 내다보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見渡す');
-- 126
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '成り下がる','なりさがる','전락하다, 격이 낮아지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='成り下がる');
-- 127
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '渦巻く','うずまく','소용돌이치다, 소용돌이처럼 돌다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='渦巻く');
-- 128
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '向き合わせる','むきあわせる','마주 보게 하다, 대면시키다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='向き合わせる');
-- 129
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '突きつける','つきつける','들이밀다, 제시하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='突きつける');
-- 130
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち出す','うちだす','내놓다, 내세우다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち出す');
-- 131
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち破る','うちやぶる','깨뜨리다, 타파하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち破る');
-- 132
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '蠢く','うごめく','꿈틀거리다, 꾸물거리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蠢く');
-- 133
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち勝つ','うちかつ','이겨내다, 극복하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち勝つ');
-- 134
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '乗り出す','のりだす','진출하다, 나서다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗り出す');
-- 135
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '繰り広げる','くりひろげる','펼치다, 전개하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='繰り広げる');
-- 136
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '巻き起こる','まきおこる','일어나다, 소용돌이치며 일다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='巻き起こる');
-- 137
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '巻き込まれる','まきこまれる','말려들다, 휘말리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='巻き込まれる');
-- 138
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '巻き込む','まきこむ','끌어들이다, 말아넣다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='巻き込む');
-- 139
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '押し流す','おしながす','밀어 흘려보내다, 휩쓸다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='押し流す');
-- 140
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '飲み込む','のみこむ','삼키다; 이해하다, 납득하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飲み込む');
-- 141
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '吸い込まれる','すいこまれる','빨려 들어가다, 흡수되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='吸い込まれる');
-- 142
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '吸い寄せる','すいよせる','끌어당기다, 흡인하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='吸い寄せる');
-- 143
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '引き寄せる','ひきよせる','끌어당기다, 가까이 끌다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き寄せる');
-- 144
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '駆け抜ける','かけぬける','달려 지나가다, 빠져나가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='駆け抜ける');
-- 145
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '切り抜ける','きりぬける','헤쳐나가다, 위기를 모면하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り抜ける');
-- 146
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '乗り切る','のりきる','극복하다, 견뎌내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗り切る');
-- 147
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '這い上がる','はいあがる','기어오르다, 역경을 딛고 일어서다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='這い上がる');
-- 148
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '浮かび上がる','うかびあがる','떠오르다, 부각되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浮かび上がる');
-- 149
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '生い茂る','おいしげる','무성하게 자라다, 무성히 우거지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生い茂る');
-- 150
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '押し広げる','おしひろげる','밀어서 넓히다, 확장하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='押し広げる');
