-- ============================================================
-- JLPT N1 동사 어휘 150개 (복합동사·자타동사쌍·고급 和語동사)
-- 대상: jlpt_vocabulary (part_of_speech = '동사')
-- 범위: 복합동사(取り繕う·差し控える·見計らう 등),
--       자타동사쌍(溶ける/溶かす, 乱れる/乱す 등),
--       고급 和語동사(募る·捗る·携わる·赴く·憚る·拘る 류)
-- 중복가드: word가 어느 레벨에도 존재하면 스킵
-- 생성일: 2026-06-23
-- 검수: reading(히라가나)·meaning_ko 자가검수 완료
-- ============================================================

-- ===== 복합동사 (1~50) =====

-- 1
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見計らう','みはからう','적당한 때를 가늠하다, 형편을 봐서 하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見計らう');
-- 2
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '取り繕う','とりつくろう','(겉을) 꾸미다, 임시방편으로 수습하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り繕う');
-- 3
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '差し控える','さしひかえる','삼가다, 자제하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差し控える');
-- 4
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '立て込む','たてこむ','(일이) 밀리다, 복잡하게 얽히다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立て込む');
-- 5
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '切り出す','きりだす','꺼내다, (어려운 말을) 꺼내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り出す');
-- 6
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '食い違う','くいちがう','어긋나다, 엇갈리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食い違う');
-- 7
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '折り合う','おりあう','타협하다, 절충하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='折り合う');
-- 8
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見せかける','みせかける','~인 척하다, 위장하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見せかける');
-- 9
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '取り沙汰する','とりざたする','소문내다, 세상에 떠들다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り沙汰する');
-- 10
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '取り持つ','とりもつ','중재하다, 이어주다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り持つ');
-- 11
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '取り計らう','とりはからう','도맡아 처리하다, 알아서 처리하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り計らう');
-- 12
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '差し向ける','さしむける','파견하다, 보내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差し向ける');
-- 13
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '差し障る','さしさわる','지장이 생기다, 방해가 되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差し障る');
-- 14
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち明ける','うちあける','털어놓다, 고백하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち明ける');
-- 15
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち消す','うちけす','부정하다, 지우다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち消す');
-- 16
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち解ける','うちとける','마음을 열다, 허물없이 지내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち解ける');
-- 17
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち込む','うちこむ','몰두하다, 열중하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち込む');
-- 18
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '言い張る','いいはる','주장하다, 고집하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い張る');
-- 19
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '言い含める','いいふくめる','단단히 이르다, 타일러 납득시키다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い含める');
-- 20
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '言い逃れる','いいのがれる','발뺌하다, 핑계를 대고 빠져나가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い逃れる');
-- 21
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '言い訳する','いいわけする','변명하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い訳する');
-- 22
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '突っぱねる','つっぱねる','딱 잘라 거절하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='突っぱねる');
-- 23
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '突き動かす','つきうごかす','충동하다, 움직이게 하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='突き動かす');
-- 24
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '思い知らせる','おもいしらせる','뼈저리게 깨닫게 하다, 따끔하게 가르치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い知らせる');
-- 25
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '思い知る','おもいしる','뼈저리게 깨닫다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い知る');
-- 26
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '思い切る','おもいきる','단념하다, 결단을 내리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い切る');
-- 27
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '思い込む','おもいこむ','단단히 믿다, 굳게 생각하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い込む');
-- 28
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見受ける','みうける','(자주) 보이다, ~인 것 같다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見受ける');
-- 29
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '引き合わせる','ひきあわせる','소개하다, 대조하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き合わせる');
-- 30
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '引き留める','ひきとめる','붙잡아 두다, 만류하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き留める');
-- 31
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '引き受ける','ひきうける','떠맡다, 인수하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き受ける');
-- 32
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '持ち越す','もちこす','다음으로 넘기다, 미루다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持ち越す');
-- 33
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '持ち込む','もちこむ','갖고 들어오다, 끌어들이다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持ち込む');
-- 34
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '申し出る','もうしでる','신청하다, 자진해서 말하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申し出る');
-- 35
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '申し入れる','もうしいれる','제의하다, 신청하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申し入れる');
-- 36
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '問いただす','といただす','추궁하다, 따져 묻다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='問いただす');
-- 37
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '問いかける','といかける','질문을 건네다, 묻다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='問いかける');
-- 38
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '切り替える','きりかえる','전환하다, 바꾸다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り替える');
-- 39
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '切り詰める','きりつめる','절약하다, 줄이다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り詰める');
-- 40
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '切り捨てる','きりすてる','버리다, 도외시하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り捨てる');
-- 41
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '割り込む','わりこむ','끼어들다, 새치기하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='割り込む');
-- 42
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '割り当てる','わりあてる','할당하다, 배당하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='割り当てる');
-- 43
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '追い込む','おいこむ','몰아넣다, 궁지에 빠뜨리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='追い込む');
-- 44
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '追い払う','おいはらう','쫓아버리다, 몰아내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='追い払う');
-- 45
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '追い詰める','おいつめる','막다른 곳으로 몰다, 궁지에 몰아넣다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='追い詰める');
-- 46
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '追い求める','おいもとめる','추구하다, 계속 찾다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='追い求める');
-- 47
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち立てる','うちたてる','수립하다, 세우다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち立てる');
-- 48
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '打ち合わせる','うちあわせる','협의하다, 사전에 조율하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち合わせる');
-- 49
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '向き合う','むきあう','마주하다, 서로 마주보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='向き合う');
-- 50
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '焚き付ける','たきつける','부추기다, 선동하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焚き付ける');

-- ===== 자타동사쌍 (51~85) =====

-- 51
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '溶ける','とける','녹다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='溶ける');
-- 52
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '溶かす','とかす','녹이다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='溶かす');
-- 53
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '冷める','さめる','식다, 열의가 식다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冷める');
-- 54
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '冷ます','さます','식히다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冷ます');
-- 55
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '濁る','にごる','탁해지다, 흐려지다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='濁る');
-- 56
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '濁す','にごす','흐리게 하다, 얼버무리다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='濁す');
-- 57
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '乱れる','みだれる','흐트러지다, 어지러워지다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乱れる');
-- 58
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '乱す','みだす','어지럽히다, 흐트러뜨리다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乱す');
-- 59
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '崩れる','くずれる','무너지다, 흐트러지다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='崩れる');
-- 60
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '崩す','くずす','무너뜨리다, 허물다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='崩す');
-- 61
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '縮む','ちぢむ','줄어들다, 위축되다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縮む');
-- 62
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '縮める','ちぢめる','줄이다, 단축하다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縮める');
-- 63
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '伸びる','のびる','늘어나다, 성장하다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伸びる');
-- 64
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '伸ばす','のばす','늘리다, 연장하다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伸ばす');
-- 65
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '傾く','かたむく','기울다, 기울어지다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傾く');
-- 66
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '傾ける','かたむける','기울이다, 경도하다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傾ける');
-- 67
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '高まる','たかまる','높아지다, 고조되다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高まる');
-- 68
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '高める','たかめる','높이다, 고양하다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高める');
-- 69
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '深まる','ふかまる','깊어지다, 심화되다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='深まる');
-- 70
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '深める','ふかめる','깊게 하다, 심화하다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='深める');
-- 71
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '強まる','つよまる','강해지다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='強まる');
-- 72
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '強める','つよめる','강하게 하다, 강화하다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='強める');
-- 73
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '弱まる','よわまる','약해지다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弱まる');
-- 74
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '弱める','よわめる','약하게 하다, 약화하다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弱める');
-- 75
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '広まる','ひろまる','넓어지다, 퍼지다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='広まる');
-- 76
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '広める','ひろめる','넓히다, 보급시키다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='広める');
-- 77
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '固まる','かたまる','굳어지다, 확고해지다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='固まる');
-- 78
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '固める','かためる','굳히다, 확고히 하다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='固める');
-- 79
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '改まる','あらたまる','새로워지다, 격식을 차리다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改まる');
-- 80
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '改める','あらためる','고치다, 바꾸다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改める');
-- 81
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '費やす','ついやす','소비하다, 허비하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='費やす');
-- 82
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '費える','ついえる','(재산·체력이) 소모되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='費える');
-- 83
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '澄む','すむ','맑아지다, 맑게 개다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='澄む');
-- 84
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '澄ます','すます','맑게 하다; 딴청 피우다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='澄ます');
-- 85
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '逸れる','それる','빗나가다, 벗어나다 (자동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逸れる');

-- ===== 고급 和語동사·その他 (86~150) =====

-- 86
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '逸らす','そらす','빗나가게 하다, (시선을) 돌리다 (타동사)','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逸らす');
-- 87
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '募る','つのる','(감정이) 고조되다; 모집하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='募る');
-- 88
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '捗る','はかどる','(일이) 잘 진척되다, 순조롭게 나아가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='捗る');
-- 89
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '携わる','たずさわる','관계하다, 종사하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='携わる');
-- 90
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '赴く','おもむく','향하다, 나아가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='赴く');
-- 91
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '憚る','はばかる','꺼리다, 주저하다, 삼가다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憚る');
-- 92
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '拘る','こだわる','고집하다, 집착하다, 구애받다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拘る');
-- 93
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '漂う','ただよう','떠돌다, 떠다니다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漂う');
-- 94
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '蔓延る','はびこる','만연하다, (잡초처럼) 번지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蔓延る');
-- 95
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '蔓延する','まんえんする','만연하다, 퍼지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蔓延する');
-- 96
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '滲み出る','にじみでる','스며 나오다, 배어나오다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滲み出る');
-- 97
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '滲み込む','にじみこむ','스며들다, 배어들다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滲み込む');
-- 98
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '凝らす','こらす','집중하다, 고심하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凝らす');
-- 99
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '凝る','こる','열중하다; (근육이) 뭉치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凝る');
-- 100
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '抱える','かかえる','떠안다, 안고 있다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抱える');
-- 101
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '抱く','いだく','품다, 안다; (감정을) 품다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抱く');
-- 102
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '宿す','やどす','깃들이다, 품다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宿す');
-- 103
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '宿る','やどる','깃들다, 머물다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宿る');
-- 104
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '仰ぐ','あおぐ','우러러보다; 청하다, 의뢰하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仰ぐ');
-- 105
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '省みる','かえりみる','뒤돌아보다, 반성하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='省みる');
-- 106
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '顧みる','かえりみる','돌아보다, 돌보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顧みる');
-- 107
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '凌ぐ','しのぐ','견뎌내다, 극복하다; 능가하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凌ぐ');
-- 108
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '悩む','なやむ','고민하다, 번민하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悩む');
-- 109
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '煩う','わずらう','괴로워하다, 번민하다; 앓다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煩う');
-- 110
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '煩わせる','わずらわせる','번거롭게 하다, 폐를 끼치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煩わせる');
-- 111
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '唆す','そそのかす','꼬드기다, 부추기다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='唆す');
-- 112
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '冒す','おかす','범하다, 무릅쓰다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冒す');
-- 113
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '侵す','おかす','침범하다, 침해하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='侵す');
-- 114
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '犯す','おかす','저지르다, 위반하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='犯す');
-- 115
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '尽くす','つくす','다하다, 최선을 다하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='尽くす');
-- 116
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '尽きる','つきる','다 떨어지다, 소진되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='尽きる');
-- 117
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '惑う','まどう','당황하다, 갈피를 못 잡다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='惑う');
-- 118
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '惑わす','まどわす','혼란시키다, 유혹하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='惑わす');
-- 119
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '紛らわす','まぎらわす','(마음을) 달래다, 딴 데로 돌리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='紛らわす');
-- 120
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '赦す','ゆるす','용서하다, 허락하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='赦す');
-- 121
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '諦める','あきらめる','포기하다, 단념하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諦める');
-- 122
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '踏ん張る','ふんばる','버티다, 힘껏 버티다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='踏ん張る');
-- 123
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '粘る','ねばる','끈질기게 버티다, 인내하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粘る');
-- 124
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '達観する','たっかんする','달관하다, 사물을 초연히 바라보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='達観する');
-- 125
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '奮起する','ふんきする','분발하다, 분기하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奮起する');
-- 126
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '奮闘する','ふんとうする','분투하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奮闘する');
-- 127
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '挫折する','ざせつする','좌절하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='挫折する');
-- 128
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '屈する','くっする','굴복하다, 굴하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='屈する');
-- 129
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '抜きん出る','ぬきんでる','두드러지다, 탁월하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜きん出る');
-- 130
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '秀でる','ひいでる','뛰어나다, 탁월하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='秀でる');
-- 131
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '際立つ','きわだつ','두드러지다, 눈에 띄다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='際立つ');
-- 132
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '際立てる','きわだてる','두드러지게 하다, 부각시키다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='際立てる');
-- 133
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '成り済ます','なりすます','~인 척하다, 사칭하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='成り済ます');
-- 134
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '持て余す','もてあます','다루기 힘들다, 감당 못 하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持て余す');
-- 135
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '持て成す','もてなす','대접하다, 환대하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持て成す');
-- 136
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '腑に落ちる','ふにおちる','납득이 되다, 이해가 되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腑に落ちる');
-- 137
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '気兼ねする','きがねする','신경 쓰다, 눈치 보다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気兼ねする');
-- 138
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '気後れする','きおくれする','기가 죽다, 위축되다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気後れする');
-- 139
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '思い上がる','おもいあがる','자만하다, 우쭐거리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い上がる');
-- 140
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '驕る','おごる','교만하다, 우쭐해지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='驕る');
-- 141
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '謙る','へりくだる','겸손하다, 자신을 낮추다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謙る');
-- 142
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '慎む','つつしむ','삼가다, 자중하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慎む');
-- 143
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '葛藤する','かっとうする','갈등하다, 번민하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='葛藤する');
-- 144
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '諦観する','ていかんする','체념하고 관조하다, 달관하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諦観する');
-- 145
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '成し得る','なしうる','해낼 수 있다, 실현 가능하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='成し得る');
-- 146
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '抗する','こうする','대항하다, 저항하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抗する');
-- 147
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '讒言する','ざんげんする','참소하다, 남을 헐뜯어 고하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='讒言する');
-- 148
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '誑かす','たらかす','꾀어내다, 속이다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誑かす');
-- 149
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '見計る','みはかる','적절한 시기를 재다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見計る');
-- 150
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '葛藤を抱える','かっとうをかかえる','갈등을 안고 있다, 내적 갈등을 지니다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='葛藤を抱える');
