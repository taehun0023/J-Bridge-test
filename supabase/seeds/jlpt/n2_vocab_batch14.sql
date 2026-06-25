-- encoding: UTF-8
-- N2 語彙シード batch 14 (130語)
-- テーマ: 和語動詞・複合動詞・自他動詞 (動詞集中)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- 中複確認済み: 既存1007語との重複除外
-- 読み確認基準: 標準国語辞典準拠 (連濁・複合動詞の読み特に注意)
-- DB適用禁止: 内容確認後に別途適用すること

-- ============================================================
-- 和語動詞 — 単純動詞 (Simple Yamato Verbs) — 45語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '預ける', 'あずける', '맡기다, 預ける', 'N2', '동사', '銀行にお金を預ける。', '은행에 돈을 맡기다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='預ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '預かる', 'あずかる', '맡다, 보관하다', 'N2', '동사', '荷物を預かってほしい。', '짐을 맡아주었으면 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='預かる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抱く', 'いだく', '품다, 안다, (생각을) 품다', 'N2', '동사', '夢を抱いて上京した。', '꿈을 품고 상경했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抱く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '浮かぶ', 'うかぶ', '떠오르다', 'N2', '동사', 'いいアイデアが浮かんだ。', '좋은 아이디어가 떠올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浮かぶ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '浮かべる', 'うかべる', '떠올리다, 띄우다', 'N2', '동사', '笑みを浮かべながら話す。', '미소를 띠며 이야기하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浮かべる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '疑う', 'うたがう', '의심하다', 'N2', '동사', '彼の言葉を疑う理由がない。', '그의 말을 의심할 이유가 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疑う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恵む', 'めぐむ', '베풀다, 은혜를 주다', 'N2', '동사', '困っている人に恵む。', '어려운 사람에게 베풀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恵む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抑える', 'おさえる', '억누르다, 억제하다', 'N2', '동사', '感情を抑えて話す。', '감정을 억누르며 이야기하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抑える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '収まる', 'おさまる', '가라앉다, 수습되다', 'N2', '동사', '騒ぎがようやく収まった。', '소동이 겨우 가라앉았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '収める', 'おさめる', '거두다, 마무리하다', 'N2', '동사', '成果を収める。', '성과를 거두다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '脅かす', 'おびやかす', '위협하다, 협박하다', 'N2', '동사', '安全を脅かす行為だ。', '안전을 위협하는 행위이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脅かす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '及ぼす', 'およぼす', '미치다, 영향을 주다', 'N2', '동사', '健康に悪影響を及ぼす。', '건강에 나쁜 영향을 미치다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='及ぼす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '及ぶ', 'およぶ', '미치다, 이르다', 'N2', '동사', '被害は全国に及んだ。', '피해는 전국에 미쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='及ぶ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '陥る', 'おちいる', '빠지다, 陥る', 'N2', '동사', 'パニックに陥る。', '패닉에 빠지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陥る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '納める', 'おさめる', '납부하다, 납품하다', 'N2', '동사', '税金を納める。', '세금을 납부하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='納める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '傾ける', 'かたむける', '기울이다', 'N2', '동사', '耳を傾けて話を聞く。', '귀를 기울여 이야기를 듣다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傾ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絡む', 'からむ', '얽히다, 시비 걸다', 'N2', '동사', '複数の問題が絡む事案だ。', '여러 문제가 얽힌 사안이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絡む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絡める', 'からめる', '엮다, 연관시키다', 'N2', '동사', '複数の課題を絡めて考える。', '여러 과제를 엮어서 생각하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絡める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '刻む', 'きざむ', '새기다, 잘게 썰다', 'N2', '동사', '記念に名前を刻む。', '기념으로 이름을 새기다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刻む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '崩れる', 'くずれる', '무너지다, 흐트러지다', 'N2', '동사', '計画が崩れてしまった。', '계획이 무너져 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='崩れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '崩す', 'くずす', '무너뜨리다, 흩뜨리다', 'N2', '동사', '体調を崩した。', '몸 상태가 나빠졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='崩す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暮れる', 'くれる', '저물다, 해가 지다', 'N2', '동사', '日が暮れる前に帰ろう。', '해가 지기 전에 돌아가자.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暮れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '加わる', 'くわわる', '더해지다, 참가하다', 'N2', '동사', '新しいメンバーが加わった。', '새 멤버가 합류했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='加わる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '加える', 'くわえる', '더하다, 가하다', 'N2', '동사', '塩を少し加える。', '소금을 조금 더하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='加える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '隔てる', 'へだてる', '격리하다, 사이를 두다', 'N2', '동사', '海を隔てた国だ。', '바다를 사이에 둔 나라이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='隔てる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '隔たる', 'へだたる', '멀어지다, 간격이 생기다', 'N2', '동사', '意見が大きく隔たっている。', '의견이 크게 벌어져 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='隔たる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '高まる', 'たかまる', '높아지다, 고조되다', 'N2', '동사', '期待が高まっている。', '기대가 높아지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '高める', 'たかめる', '높이다, 향상시키다', 'N2', '동사', 'スキルを高める努力をする。', '스킬을 높이기 위해 노력하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '貯める', 'ためる', '모으다, 저축하다', 'N2', '동사', 'お金を貯めて旅行に行く。', '돈을 모아 여행을 가다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='貯める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '貯まる', 'たまる', '모이다, 쌓이다', 'N2', '동사', 'お金がだいぶ貯まった。', '돈이 꽤 모였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='貯まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '縮む', 'ちぢむ', '줄어들다, 오그라들다', 'N2', '동사', '洗濯して服が縮んだ。', '세탁해서 옷이 줄었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縮む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '縮める', 'ちぢめる', '줄이다, 단축하다', 'N2', '동사', '距離を縮める努力をする。', '거리를 줄이는 노력을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縮める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '費える', 'ついえる', '소비되다, 없어지다', 'N2', '동사', '体力が費えた。', '체력이 다 소비되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='費える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '伝わる', 'つたわる', '전해지다, 전달되다', 'N2', '동사', '気持ちが相手に伝わった。', '마음이 상대방에게 전해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伝わる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '伝える', 'つたえる', '전하다, 전달하다', 'N2', '동사', '大事な情報を正確に伝える。', '중요한 정보를 정확히 전달하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='伝える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '整う', 'ととのう', '정돈되다, 갖춰지다', 'N2', '동사', '準備が整った。', '준비가 갖춰졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='整う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凍る', 'こおる', '얼다', 'N2', '동사', '池が凍っている。', '연못이 얼어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凍る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '固まる', 'かたまる', '굳다, 굳어지다', 'N2', '동사', '決意が固まった。', '결의가 굳어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='固まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '固める', 'かためる', '굳히다, 다지다', 'N2', '동사', '守りを固める。', '수비를 다지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='固める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '深まる', 'ふかまる', '깊어지다', 'N2', '동사', '理解が深まった。', '이해가 깊어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='深まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '深める', 'ふかめる', '깊게 하다, 심화시키다', 'N2', '동사', '交流を深める。', '교류를 심화하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='深める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '広まる', 'ひろまる', '퍼지다, 보급되다', 'N2', '동사', '新しい文化が広まった。', '새로운 문화가 퍼졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='広まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '広める', 'ひろめる', '퍼뜨리다, 보급시키다', 'N2', '동사', '知識を広める活動をする。', '지식을 퍼뜨리는 활동을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='広める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乱れる', 'みだれる', '흐트러지다, 어지럽다', 'N2', '동사', '生活リズムが乱れる。', '생활 리듬이 흐트러지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乱れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乱す', 'みだす', '어지럽히다, 혼란시키다', 'N2', '동사', '秩序を乱す行為は困る。', '질서를 어지럽히는 행위는 곤란하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乱す' AND jlpt_level='N2');

-- ============================================================
-- 自他動詞ペア 추가 (Additional Transitive/Intransitive Pairs) — 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '起こる', 'おこる', '일어나다, 발생하다', 'N2', '동사', '事故が起こった。', '사고가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='起こる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '起こす', 'おこす', '일으키다, 깨우다', 'N2', '동사', '朝、子どもを起こす。', '아침에 아이를 깨우다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='起こす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '続く', 'つづく', '계속되다, 이어지다', 'N2', '동사', '雨が三日間続いた。', '비가 3일간 계속되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='続く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '続ける', 'つづける', '계속하다', 'N2', '동사', '毎日練習を続ける。', '매일 연습을 계속하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='続ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '変わる', 'かわる', '바뀌다, 달라지다', 'N2', '동사', '天気がすぐ変わる。', '날씨가 금방 바뀐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変わる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '変える', 'かえる', '바꾸다, 변경하다', 'N2', '동사', '考え方を変える必要がある。', '사고방식을 바꿀 필요가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '増える', 'ふえる', '늘다, 증가하다', 'N2', '동사', '観光客が増えている。', '관광객이 늘고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='増える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '増やす', 'ふやす', '늘리다, 증가시키다', 'N2', '동사', '収入を増やしたい。', '수입을 늘리고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='増やす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '減る', 'へる', '줄다, 감소하다', 'N2', '동사', '人口が減っている。', '인구가 줄고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='減る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '減らす', 'へらす', '줄이다, 감소시키다', 'N2', '동사', '無駄を減らす工夫をする。', '낭비를 줄이는 궁리를 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='減らす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '開く', 'ひらく', '열리다, 열다', 'N2', '동사', '会議を開く。', '회의를 열다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='開く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '開ける', 'あける', '열다, 비우다', 'N2', '동사', '窓を開けて換気する。', '창문을 열어 환기하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='開ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '開く', 'あく', '열리다', 'N2', '동사', 'ドアが自動で開く。', '문이 자동으로 열린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='開く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '閉まる', 'しまる', '닫히다', 'N2', '동사', 'もうすぐ店が閉まる。', '곧 가게가 닫힌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='閉まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '閉める', 'しめる', '닫다', 'N2', '동사', '出かける前に窓を閉める。', '외출 전에 창문을 닫다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='閉める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抜ける', 'ぬける', '빠지다, 벗어나다', 'N2', '동사', '渋滞を抜けた。', '정체를 벗어났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抜く', 'ぬく', '뽑다, 빼다', 'N2', '동사', '雑草を抜く。', '잡초를 뽑다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '破れる', 'やぶれる', '찢어지다, 지다', 'N2', '동사', '試合に破れた。', '시합에서 졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='破れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '破る', 'やぶる', '깨다, 어기다, 찢다', 'N2', '동사', '記録を破った。', '기록을 깼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='破る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '負ける', 'まける', '지다, 패배하다', 'N2', '동사', '誘惑に負けてしまった。', '유혹에 져 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='負ける' AND jlpt_level='N2');

-- ============================================================
-- 複合動詞 (Compound Verbs) — 45語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受け入れる', 'うけいれる', '받아들이다, 수용하다', 'N2', '동사', '新しい意見を受け入れる。', '새로운 의견을 받아들이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受け入れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受け継ぐ', 'うけつぐ', '계승하다, 이어받다', 'N2', '동사', '伝統を受け継ぐ。', '전통을 이어받다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受け継ぐ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受け取る', 'うけとる', '받다, 수취하다', 'N2', '동사', '荷物を受け取る。', '짐을 받다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受け取る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '打ち消す', 'うちけす', '부정하다, 打ち消す', 'N2', '동사', '噂を打ち消すために発表した。', '소문을 부정하기 위해 발표했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち消す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '打ち合わせる', 'うちあわせる', '미리 상의하다, 打ち合わせる', 'N2', '동사', '事前に内容を打ち合わせる。', '사전에 내용을 상의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち合わせる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '売り込む', 'うりこむ', '팔아 넣다, 적극적으로 팔다', 'N2', '동사', '自分を積極的に売り込む。', '자신을 적극적으로 어필하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='売り込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '売り出す', 'うりだす', '판매를 시작하다, 팔아 내놓다', 'N2', '동사', '新商品を売り出す。', '신상품을 판매하기 시작하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='売り出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '押し付ける', 'おしつける', '강요하다, 押し付ける', 'N2', '동사', '価値観を押し付けるのはよくない。', '가치관을 강요하는 것은 좋지 않다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='押し付ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '押さえる', 'おさえる', '누르다, 확보하다', 'N2', '동사', '要点を押さえて話す。', '요점을 파악하고 이야기하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='押さえる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '書き込む', 'かきこむ', '기입하다, 써넣다', 'N2', '동사', 'フォームに情報を書き込む。', '양식에 정보를 기입하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='書き込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '書き直す', 'かきなおす', '다시 쓰다, 고쳐 쓰다', 'N2', '동사', 'レポートを書き直した。', '보고서를 다시 썼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='書き直す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '駆け込む', 'かけこむ', '달려 들어가다, 막판에 밀어넣다', 'N2', '동사', '電車に駆け込む。', '전철에 뛰어들어가다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='駆け込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '駆け寄る', 'かけよる', '달려오다, 달려가다', 'N2', '동사', '子どもが駆け寄ってきた。', '아이가 달려왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='駆け寄る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '貸し出す', 'かしだす', '대출하다, 빌려주다', 'N2', '동사', '図書館で本を貸し出す。', '도서관에서 책을 대출하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='貸し出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '借り入れる', 'かりいれる', '빌리다, 차입하다', 'N2', '동사', '資金を借り入れる。', '자금을 차입하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='借り入れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '聞き取る', 'ききとる', '듣고 파악하다, 청취하다', 'N2', '동사', '電話で相手の声を聞き取る。', '전화로 상대방 목소리를 청취하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='聞き取る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '聞き流す', 'ききながす', '흘려듣다, 무시하다', 'N2', '동사', '批判を聞き流した。', '비판을 흘려들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='聞き流す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '切り替える', 'きりかえる', '전환하다, 바꾸다', 'N2', '동사', '気持ちを切り替えて取り組む。', '기분을 전환하여 임하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り替える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '切り離す', 'きりはなす', '분리하다, 따로 떼다', 'N2', '동사', '感情と仕事を切り離す。', '감정과 일을 분리하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り離す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '組み合わせる', 'くみあわせる', '조합하다', 'N2', '동사', '色を組み合わせてデザインする。', '색을 조합하여 디자인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='組み合わせる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '組み立てる', 'くみたてる', '조립하다', 'N2', '동사', '家具を組み立てる。', '가구를 조립하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='組み立てる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '繰り返す', 'くりかえす', '반복하다', 'N2', '동사', '同じ失敗を繰り返さないようにする。', '같은 실수를 반복하지 않도록 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='繰り返す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '繰り越す', 'くりこす', '이월하다, 넘기다', 'N2', '동사', '未使用の予算を来年に繰り越す。', '미사용 예산을 내년으로 이월하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='繰り越す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '差し出す', 'さしだす', '내밀다, 제출하다', 'N2', '동사', '名刺を差し出す。', '명함을 내밀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差し出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '差し替える', 'さしかえる', '교체하다, 바꿔 끼우다', 'N2', '동사', 'データを差し替える。', '데이터를 교체하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差し替える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕上がる', 'しあがる', '완성되다, 仕上がる', 'N2', '동사', '製品がきれいに仕上がった。', '제품이 깔끔하게 완성되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕上がる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕入れる', 'しいれる', '매입하다, 仕入れる', 'N2', '동사', '新鮮な食材を仕入れる。', '신선한 식재료를 매입하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕入れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '締め切る', 'しめきる', '마감하다', 'N2', '동사', '応募を来週末で締め切る。', '응모를 다음 주 말에 마감하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='締め切る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '立ち上がる', 'たちあがる', '일어서다, 기동하다', 'N2', '동사', '困難から立ち上がる。', '어려움에서 일어서다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立ち上がる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '立ち止まる', 'たちどまる', '멈추다, 立ち止まる', 'N2', '동사', '角で立ち止まって考えた。', '모퉁이에서 멈춰 생각했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立ち止まる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '立ち向かう', 'たちむかう', '맞서다, 대항하다', 'N2', '동사', '困難に立ち向かう勇気がある。', '어려움에 맞설 용기가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立ち向かう' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '付き合う', 'つきあう', '사귀다, 교제하다', 'N2', '동사', '長年の友人と付き合う。', '오랜 친구와 교제하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='付き合う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取り上げる', 'とりあげる', '다루다, 거론하다', 'N2', '동사', 'ニュースで取り上げられた。', '뉴스에서 다루어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り上げる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取り戻す', 'とりもどす', '되찾다, 회복하다', 'N2', '동사', '自信を取り戻す。', '자신감을 되찾다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り戻す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取り除く', 'とりのぞく', '제거하다, 없애다', 'N2', '동사', '障害を取り除く。', '장애물을 제거하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り除く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取り出す', 'とりだす', '꺼내다', 'N2', '동사', 'バッグから財布を取り出す。', '가방에서 지갑을 꺼내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乗り合わせる', 'のりあわせる', '같이 타다, 합승하다', 'N2', '동사', '同じ電車に乗り合わせた。', '같은 전철에 우연히 같이 탔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗り合わせる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乗り込む', 'のりこむ', '타고 들어가다, 쳐들어가다', 'N2', '동사', '会議室に乗り込んで交渉した。', '회의실에 쳐들어가 협상했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗り込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '働きかける', 'はたらきかける', '작용하다, 촉구하다', 'N2', '동사', '政府に対して働きかける。', '정부에 대해 촉구하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='働きかける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引き起こす', 'ひきおこす', '일으키다, 유발하다', 'N2', '동사', '問題を引き起こした。', '문제를 일으켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き起こす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引き継ぐ', 'ひきつぐ', '이어받다, 인계하다', 'N2', '동사', '前任者から業務を引き継ぐ。', '전임자에게 업무를 인계받다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き継ぐ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引き出す', 'ひきだす', '끌어내다, 인출하다', 'N2', '동사', '能力を引き出す。', '능력을 끌어내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見つめる', 'みつめる', '응시하다, 바라보다', 'N2', '동사', '将来を見つめる。', '미래를 바라보다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見つめる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '申し出る', 'もうしでる', '신청하다, 제안하다', 'N2', '동사', '自ら申し出て助けた。', '스스로 나서서 도왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申し出る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '持ち込む', 'もちこむ', '持ち込む, 가지고 들어오다', 'N2', '동사', '私物を職場に持ち込む。', '개인 물건을 직장에 가지고 들어오다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持ち込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '持ち上げる', 'もちあげる', '들어 올리다, 치켜세우다', 'N2', '동사', '重い荷物を持ち上げる。', '무거운 짐을 들어 올리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持ち上げる' AND jlpt_level='N2');

-- ============================================================
-- 複合動詞 追加 (Further Compound Verbs) — 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '言い合う', 'いいあう', '서로 말하다, 말다툼하다', 'N2', '동사', '二人が言い合いになった。', '두 사람이 말다툼을 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い合う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '言い換える', 'いいかえる', '다시 말하다, 바꿔 말하다', 'N2', '동사', '分かりやすく言い換える。', '알기 쉽게 바꿔 말하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い換える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い当たる', 'おもいあたる', '짐작이 가다, 생각나다', 'N2', '동사', '心当たりがあると言えば、思い当たる節がある。', '짚이는 게 있다고 하면 생각나는 바가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い当たる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い浮かぶ', 'おもいうかぶ', '떠오르다, 생각나다', 'N2', '동사', 'ふと昔の記憶が思い浮かんだ。', '문득 옛날 기억이 떠올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い浮かぶ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い出す', 'おもいだす', '생각해 내다, 떠올리다', 'N2', '동사', '昔のことを思い出した。', '옛날 일을 떠올렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '追い払う', 'おいはらう', '쫓아내다, 몰아내다', 'N2', '동사', '悪い虫を追い払う。', '해충을 쫓아내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='追い払う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '追い越す', 'おいこす', '추월하다, 앞지르다', 'N2', '동사', '前の車を追い越す。', '앞 차를 추월하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='追い越す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '呼び起こす', 'よびおこす', '불러일으키다, 환기시키다', 'N2', '동사', '記憶を呼び起こす。', '기억을 불러일으키다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呼び起こす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '走り出す', 'はしりだす', '달리기 시작하다', 'N2', '동사', '急に走り出した。', '갑자기 달리기 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='走り出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '飛び込む', 'とびこむ', '뛰어들다, 뛰어들어가다', 'N2', '동사', '池に飛び込んだ。', '연못에 뛰어들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飛び込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '飛び出す', 'とびだす', '뛰어나오다, 튀어나오다', 'N2', '동사', '車道に飛び出すのは危険だ。', '차도로 뛰어나오는 것은 위험하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='飛び出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '立ち直る', 'たちなおる', '재기하다, 立ち直る', 'N2', '동사', '失敗から立ち直るのに時間がかかった。', '실패에서 재기하는 데 시간이 걸렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立ち直る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '問い合わせる', 'といあわせる', '문의하다', 'N2', '동사', '詳細はお問い合わせください。', '자세한 사항은 문의해 주십시오.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='問い合わせる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '問い直す', 'といなおす', '다시 묻다, 재고하다', 'N2', '동사', '自分のあり方を問い直す。', '자신의 존재 방식을 재고하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='問い直す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見極める', 'みきわめる', '見極める, 판별하다', 'N2', '동사', '真偽を見極める。', '진위를 판별하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見極める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見渡す', 'みわたす', '둘러보다, 一望하다', 'N2', '동사', '丘の上から町を見渡す。', '언덕 위에서 마을을 둘러보다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見渡す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '持ち出す', 'もちだす', '가지고 나가다, 꺼내다', 'N2', '동사', '話題を持ち出す。', '화제를 꺼내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持ち出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '呼び戻す', 'よびもどす', '불러 돌아오게 하다, 상기시키다', 'N2', '동사', '昔の感覚を呼び戻す。', '옛날의 감각을 되살리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呼び戻す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生み出す', 'うみだす', '만들어내다, 창출하다', 'N2', '동사', '新しい価値を生み出す。', '새로운 가치를 창출하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生み出す' AND jlpt_level='N2');
