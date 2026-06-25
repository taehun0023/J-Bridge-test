-- ============================================================
-- JLPT N1 する動詞 (漢字2字+する) 150개
-- 대상: jlpt_vocabulary (part_of_speech = '동사')
-- 범위: 학술·비즈니스·사회 동작 동사 (한자2자+する 형태)
-- 중복가드: word가 어느 레벨에도 존재하면 스킵
-- 생성일: 2026-06-23
-- 검수: reading(히라가나)·meaning_ko 자가검수 완료
-- ============================================================

-- 1
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '阻害する','そがいする','저해하다, 방해하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='阻害する');
-- 2
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '誘発する','ゆうはつする','유발하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誘発する');
-- 3
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '踏襲する','とうしゅうする','답습하다, 그대로 따르다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='踏襲する');
-- 4
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '払拭する','ふっしょくする','불식하다, 씻어내다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='払拭する');
-- 5
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '網羅する','もうらする','망라하다, 빠짐없이 포함하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='網羅する');
-- 6
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '凝縮する','ぎょうしゅくする','응축하다, 압축하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凝縮する');
-- 7
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '錯覚する','さっかくする','착각하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='錯覚する');
-- 8
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '誇張する','こちょうする','과장하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誇張する');
-- 9
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '黙認する','もくにんする','묵인하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='黙認する');
-- 10
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '容認する','ようにんする','용인하다, 허용하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='容認する');
-- 11
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '策定する','さくていする','책정하다, 입안하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='策定する');
-- 12
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '施行する','しこうする','시행하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='施行する');
-- 13
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '執行する','しっこうする','집행하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='執行する');
-- 14
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '履行する','りこうする','이행하다, 실행하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='履行する');
-- 15
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '遂行する','すいこうする','수행하다, 완수하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遂行する');
-- 16
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '推進する','すいしんする','추진하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='推進する');
-- 17
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '先導する','せんどうする','선도하다, 앞장서서 이끌다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='先導する');
-- 18
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '貢献する','こうけんする','공헌하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='貢献する');
-- 19
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '寄与する','きよする','기여하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寄与する');
-- 20
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '還元する','かんげんする','환원하다, 되돌리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='還元する');
-- 21
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '波及する','はきゅうする','파급하다, 영향이 미치다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='波及する');
-- 22
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '伝播する','でんぱする','전파하다, 퍼지다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伝播する');
-- 23
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '拡散する','かくさんする','확산하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拡散する');
-- 24
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '拡充する','かくじゅうする','확충하다, 확대 충실히 하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拡充する');
-- 25
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '拡張する','かくちょうする','확장하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拡張する');
-- 26
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '縮小する','しゅくしょうする','축소하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縮小する');
-- 27
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '削減する','さくげんする','삭감하다, 줄이다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='削減する');
-- 28
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '低減する','ていげんする','저감하다, 감소시키다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='低減する');
-- 29
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '軽減する','けいげんする','경감하다, 줄이다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軽減する');
-- 30
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '増大する','ぞうだいする','증대하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='増大する');
-- 31
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '増進する','ぞうしんする','증진하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='増進する');
-- 32
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '向上する','こうじょうする','향상하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='向上する');
-- 33
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '改善する','かいぜんする','개선하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改善する');
-- 34
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '改革する','かいかくする','개혁하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改革する');
-- 35
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '改正する','かいせいする','개정하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改正する');
-- 36
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '修正する','しゅうせいする','수정하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='修正する');
-- 37
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '修訂する','しゅうていする','수정하다, 개정하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='修訂する');
-- 38
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '廃止する','はいしする','폐지하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃止する');
-- 39
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '廃棄する','はいきする','폐기하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃棄する');
-- 40
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '撤回する','てっかいする','철회하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='撤回する');
-- 41
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '撤退する','てったいする','철수하다, 철퇴하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='撤退する');
-- 42
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '採択する','さいたくする','채택하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='採択する');
-- 43
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '採用する','さいようする','채용하다, 채택하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='採用する');
-- 44
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '登用する','とうようする','등용하다, 발탁하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='登用する');
-- 45
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '抜擢する','ばってきする','발탁하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜擢する');
-- 46
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '配置する','はいちする','배치하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='配置する');
-- 47
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '配分する','はいぶんする','배분하다, 나누어 주다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='配分する');
-- 48
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '分配する','ぶんぱいする','분배하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分配する');
-- 49
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '分散する','ぶんさんする','분산하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分散する');
-- 50
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '集約する','しゅうやくする','집약하다, 모아 요약하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='集約する');
-- 51
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '統合する','とうごうする','통합하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='統合する');
-- 52
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '合併する','がっぺいする','합병하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合併する');
-- 53
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '分離する','ぶんりする','분리하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分離する');
-- 54
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '独立する','どくりつする','독립하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='独立する');
-- 55
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '依存する','いぞんする','의존하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='依存する');
-- 56
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '連携する','れんけいする','연계하다, 협력하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='連携する');
-- 57
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '協調する','きょうちょうする','협조하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='協調する');
-- 58
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '協力する','きょうりょくする','협력하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='協力する');
-- 59
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '競合する','きょうごうする','경합하다, 경쟁하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='競合する');
-- 60
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '対抗する','たいこうする','대항하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='対抗する');
-- 61
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '対立する','たいりつする','대립하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='対立する');
-- 62
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '対峙する','たいじする','대치하다, 맞서다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='対峙する');
-- 63
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '調停する','ちょうていする','조정하다, 중재하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='調停する');
-- 64
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '仲裁する','ちゅうさいする','중재하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仲裁する');
-- 65
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '交渉する','こうしょうする','교섭하다, 협상하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='交渉する');
-- 66
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '折衝する','せっしょうする','절충하다, 담판하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='折衝する');
-- 67
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '妥結する','だけつする','타결하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='妥結する');
-- 68
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '合意する','ごういする','합의하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合意する');
-- 69
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '締結する','ていけつする','체결하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='締結する');
-- 70
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '締約する','ていやくする','조약을 맺다, 계약하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='締約する');
-- 71
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '批准する','ひじゅんする','비준하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='批准する');
-- 72
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '批判する','ひはんする','비판하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='批判する');
-- 73
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '批評する','ひひょうする','비평하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='批評する');
-- 74
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '論評する','ろんぴょうする','논평하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論評する');
-- 75
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '検証する','けんしょうする','검증하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='検証する');
-- 76
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '検討する','けんとうする','검토하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='検討する');
-- 77
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '審査する','しんさする','심사하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='審査する');
-- 78
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '審議する','しんぎする','심의하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='審議する');
-- 79
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '可決する','かけつする','가결하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='可決する');
-- 80
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '否決する','ひけつする','부결하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='否決する');
-- 81
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '承認する','しょうにんする','승인하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='承認する');
-- 82
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '承諾する','しょうだくする','승낙하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='承諾する');
-- 83
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '拒否する','きょひする','거부하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拒否する');
-- 84
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '拒絶する','きょぜつする','거절하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拒絶する');
-- 85
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '要請する','ようせいする','요청하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='要請する');
-- 86
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '勧告する','かんこくする','권고하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='勧告する');
-- 87
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '指摘する','してきする','지적하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='指摘する');
-- 88
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '指示する','しじする','지시하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='指示する');
-- 89
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '命令する','めいれいする','명령하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='命令する');
-- 90
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '規制する','きせいする','규제하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規制する');
-- 91
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '制限する','せいげんする','제한하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='制限する');
-- 92
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '制裁する','せいさいする','제재하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='制裁する');
-- 93
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '規律する','きりつする','규율하다, 통제하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規律する');
-- 94
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '違反する','いはんする','위반하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='違反する');
-- 95
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '逸失する','いっしつする','일실하다, 잃어버리다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逸失する');
-- 96
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '摘発する','てきはつする','적발하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='摘発する');
-- 97
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '告発する','こくはつする','고발하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='告発する');
-- 98
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '告訴する','こくそする','고소하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='告訴する');
-- 99
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '提訴する','ていそする','제소하다, 소송을 제기하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='提訴する');
-- 100
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '起訴する','きそする','기소하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='起訴する');
-- 101
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '判決する','はんけつする','판결하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='判決する');
-- 102
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '訴追する','そついする','소추하다, 기소하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訴追する');
-- 103
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '逮捕する','たいほする','체포하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逮捕する');
-- 104
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '拘束する','こうそくする','구속하다, 억류하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拘束する');
-- 105
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '釈放する','しゃくほうする','석방하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='釈放する');
-- 106
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '収監する','しゅうかんする','수감하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収監する');
-- 107
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '服役する','ふくえきする','복역하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='服役する');
-- 108
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '懲戒する','ちょうかいする','징계하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懲戒する');
-- 109
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '処分する','しょぶんする','처분하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='処分する');
-- 110
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '処罰する','しょばつする','처벌하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='処罰する');
-- 111
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '訓告する','くんこくする','훈고하다, 훈계하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訓告する');
-- 112
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '警告する','けいこくする','경고하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='警告する');
-- 113
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '宣告する','せんこくする','선고하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宣告する');
-- 114
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '宣言する','せんげんする','선언하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宣言する');
-- 115
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '公表する','こうひょうする','공표하다, 발표하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公表する');
-- 116
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '公開する','こうかいする','공개하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公開する');
-- 117
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '開示する','かいじする','개시하다, 공개하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='開示する');
-- 118
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '開陳する','かいちんする','개진하다, 의견을 밝히다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='開陳する');
-- 119
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '秘匿する','ひとくする','비밀로 하다, 은닉하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='秘匿する');
-- 120
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '隠蔽する','いんぺいする','은폐하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='隠蔽する');
-- 121
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '偽装する','ぎそうする','위장하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='偽装する');
-- 122
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '詐称する','さしょうする','사칭하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='詐称する');
-- 123
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '横領する','おうりょうする','횡령하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='横領する');
-- 124
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '着服する','ちゃくふくする','착복하다, 횡령하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='着服する');
-- 125
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '収賄する','しゅうわいする','수뢰하다, 뇌물을 받다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収賄する');
-- 126
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '贈賄する','ぞうわいする','증뢰하다, 뇌물을 주다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='贈賄する');
-- 127
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '汚職する','おしょくする','직권을 남용하다, 부패하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汚職する');
-- 128
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '粉飾する','ふんしょくする','분식하다, 꾸미다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粉飾する');
-- 129
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '搾取する','さくしゅする','착취하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='搾取する');
-- 130
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '剥奪する','はくだつする','박탈하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='剥奪する');
-- 131
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '没収する','ぼっしゅうする','몰수하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='没収する');
-- 132
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '接収する','せっしゅうする','접수하다, 몰수하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='接収する');
-- 133
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '徴収する','ちょうしゅうする','징수하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='徴収する');
-- 134
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '課税する','かぜいする','과세하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='課税する');
-- 135
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '免税する','めんぜいする','면세하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='免税する');
-- 136
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '補助する','ほじょする','보조하다, 지원하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='補助する');
-- 137
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '補償する','ほしょうする','보상하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='補償する');
-- 138
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '補給する','ほきゅうする','보급하다, 공급하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='補給する');
-- 139
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '供給する','きょうきゅうする','공급하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='供給する');
-- 140
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '調達する','ちょうたつする','조달하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='調達する');
-- 141
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '確保する','かくほする','확보하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='確保する');
-- 142
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '確立する','かくりつする','확립하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='確立する');
-- 143
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '構築する','こうちくする','구축하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='構築する');
-- 144
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '整備する','せいびする','정비하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='整備する');
-- 145
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '整合する','せいごうする','정합하다, 맞추다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='整合する');
-- 146
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '調整する','ちょうせいする','조정하다, 조율하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='調整する');
-- 147
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '最適する','さいてきする','최적화하다, 적합하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='最適する');
-- 148
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '適用する','てきようする','적용하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='適用する');
-- 149
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '援用する','えんようする','원용하다, 인용하여 이용하다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='援用する');
-- 150
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech) SELECT '転用する','てんようする','전용하다, 다른 용도로 쓰다','N1','동사' WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転用する');
