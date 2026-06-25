-- encoding: UTF-8
-- N2 語彙シード batch 1 (100語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- 除外済み(既存298語): いずれ, いよいよ, おそれがある, etc. (指示リスト参照)
-- 読み確認: 標準辞書準拠 (煩わしい→わずらわしい / 速やか→すみやか / 率いる→ひきいる 等)

-- ============================================================
-- 名詞 (Nouns) — 40語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手間', 'てま', '수고, 품', 'N2', '명사', '料理に手間がかかる。', '요리에 수고가 많이 든다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手間' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '名残', 'なごり', '여운, 흔적', 'N2', '명사', '夏の名残を感じる。', '여름의 여운을 느낀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='名残' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見舞い', 'みまい', '문병, 위문', 'N2', '명사', '友人の見舞いに病院へ行った。', '친구의 문병을 위해 병원에 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見舞い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '節目', 'ふしめ', '매듭, 전환점', 'N2', '명사', '人生の節目を迎える。', '인생의 전환점을 맞이하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節目' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕草', 'しぐさ', '몸짓, 동작', 'N2', '명사', '彼女の仕草がかわいい。', '그녀의 몸짓이 귀엽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕草' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手掛かり', 'てがかり', '단서, 실마리', 'N2', '명사', '犯人の手掛かりをつかむ。', '범인의 단서를 잡다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手掛かり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手順', 'てじゅん', '순서, 절차', 'N2', '명사', '作業の手順を確認する。', '작업 순서를 확인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手順' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見通し', 'みとおし', '전망, 예측', 'N2', '명사', '景気の見通しは明るい。', '경기 전망이 밝다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見通し' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '成り行き', 'なりゆき', '경위, 추이, 성행', 'N2', '명사', '事態の成り行きを見守る。', '사태의 추이를 지켜보다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='成り行き' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕掛け', 'しかけ', '장치, 구조, 트릭', 'N2', '명사', '巧みな仕掛けに驚いた。', '교묘한 장치에 놀랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕掛け' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手本', 'てほん', '모범, 본보기', 'N2', '명사', '先輩を手本にして学ぶ。', '선배를 모범으로 삼아 배우다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手本' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '弱点', 'じゃくてん', '약점', 'N2', '명사', '自分の弱点を克服する。', '자신의 약점을 극복하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弱点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '利点', 'りてん', '이점, 장점', 'N2', '명사', 'この方法の利点は速さだ。', '이 방법의 이점은 빠름이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='利点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '欠点', 'けってん', '결점, 단점', 'N2', '명사', '計画の欠点を指摘された。', '계획의 결점을 지적받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='欠点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '論点', 'ろんてん', '논점', 'N2', '명사', '議論の論点が明確でない。', '토론의 논점이 명확하지 않다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '争点', 'そうてん', '쟁점', 'N2', '명사', '選挙の主な争点は税制だ。', '선거의 주요 쟁점은 세제이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='争点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '転換', 'てんかん', '전환', 'N2', '명사', '政策の転換を図る。', '정책 전환을 꾀하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転換' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見方', 'みかた', '견해, 시각', 'N2', '명사', '問題の見方が人によって異なる。', '문제를 보는 시각이 사람에 따라 다르다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見方' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '立場', 'たちば', '입장', 'N2', '명사', '相手の立場を考える。', '상대방의 입장을 생각하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立場' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '趣旨', 'しゅし', '취지', 'N2', '명사', '会議の趣旨を説明する。', '회의의 취지를 설명하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='趣旨' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '余裕', 'よゆう', '여유', 'N2', '명사', '時間に余裕がある。', '시간에 여유가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='余裕' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '余地', 'よち', '여지', 'N2', '명사', '改善の余地がある。', '개선의 여지가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='余地' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '余暇', 'よか', '여가', 'N2', '명사', '余暇を有意義に過ごす。', '여가를 유익하게 보내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='余暇' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '配慮', 'はいりょ', '배려', 'N2', '명사', '相手への配慮を忘れない。', '상대방에 대한 배려를 잊지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='配慮' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '懸念', 'けねん', '우려, 걱정', 'N2', '명사', '安全性への懸念が高まる。', '안전성에 대한 우려가 높아지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懸念' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '途中', 'とちゅう', '도중', 'N2', '명사', '仕事の途中で電話が鳴った。', '일 도중에 전화가 울렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='途中' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '直前', 'ちょくぜん', '직전', 'N2', '명사', '試験の直前に緊張した。', '시험 직전에 긴장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='直前' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '直後', 'ちょくご', '직후', 'N2', '명사', '地震の直後に避難した。', '지진 직후에 대피했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='直後' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '当初', 'とうしょ', '당초, 처음', 'N2', '명사', '当初の計画とは異なる結果になった。', '당초 계획과는 다른 결과가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='当初' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実情', 'じつじょう', '실정, 실제 상황', 'N2', '명사', '現場の実情を把握する。', '현장의 실정을 파악하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実情' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実感', 'じっかん', '실감', 'N2', '명사', '成功した実感がわかない。', '성공한 실감이 나지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実感' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '限界', 'げんかい', '한계', 'N2', '명사', '体力の限界を感じる。', '체력의 한계를 느끼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='限界' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '区別', 'くべつ', '구별', 'N2', '명사', '善悪の区別をつける。', '선악의 구별을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='区別' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '差別', 'さべつ', '차별', 'N2', '명사', '人種差別に反対する。', '인종 차별에 반대하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差別' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '均衡', 'きんこう', '균형', 'N2', '명사', '需給の均衡を保つ。', '수급 균형을 유지하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='均衡' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '調和', 'ちょうわ', '조화', 'N2', '명사', '自然と調和した建築。', '자연과 조화를 이룬 건축.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='調和' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '協議', 'きょうぎ', '협의', 'N2', '명사', '両国は協議を重ねた。', '양국은 협의를 거듭했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='協議' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '議論', 'ぎろん', '논의, 토론', 'N2', '명사', '活発な議論が交わされた。', '활발한 논의가 이루어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='議論' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '批判', 'ひはん', '비판', 'N2', '명사', '政府の政策に批判が集まる。', '정부 정책에 비판이 집중되다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='批判' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '解釈', 'かいしゃく', '해석', 'N2', '명사', '法律の解釈が分かれる。', '법률 해석이 갈리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解釈' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '納得', 'なっとく', '납득, 수긍', 'N2', '명사', '彼の説明に納得できない。', '그의 설명에 납득할 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='納得' AND jlpt_level='N2');

-- ============================================================
-- 동사 (Verbs) — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '欠かす', 'かかす', '빠뜨리다, 거르다', 'N2', '동사', '毎日の運動を欠かさない。', '매일 운동을 거르지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='欠かす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '設ける', 'もうける', '설치하다, 마련하다', 'N2', '동사', '相談窓口を設ける。', '상담 창구를 마련하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='設ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '断る', 'ことわる', '거절하다', 'N2', '동사', '誘いを丁寧に断る。', '권유를 정중히 거절하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='断る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '従う', 'したがう', '따르다, 복종하다', 'N2', '동사', '規則に従って行動する。', '규칙에 따라 행동하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='従う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '率いる', 'ひきいる', '이끌다, 거느리다', 'N2', '동사', 'チームを率いて優勝した。', '팀을 이끌고 우승했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='率いる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '促す', 'うながす', '촉구하다, 재촉하다', 'N2', '동사', '早急な対応を促す。', '신속한 대응을 촉구하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='促す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '遂げる', 'とげる', '이루다, 달성하다', 'N2', '동사', '長年の夢を遂げた。', '오랜 꿈을 이루었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遂げる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '免れる', 'まぬがれる', '면하다, 피하다', 'N2', '동사', '責任を免れることはできない。', '책임을 면할 수는 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='免れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逃れる', 'のがれる', '도망치다, 벗어나다', 'N2', '동사', '危険から逃れる方法を考える。', '위험에서 벗어날 방법을 생각하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逃れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '備える', 'そなえる', '갖추다, 대비하다', 'N2', '동사', '災害に備えて準備する。', '재해에 대비하여 준비하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='備える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '整える', 'ととのえる', '정돈하다, 갖추다', 'N2', '동사', '環境を整えて集中する。', '환경을 정돈하고 집중하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='整える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慌てる', 'あわてる', '당황하다, 허둥지둥하다', 'N2', '동사', '突然の出来事に慌てた。', '갑작스러운 사건에 당황했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慌てる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '戸惑う', 'とまどう', '당혹하다, 어찌할 바를 모르다', 'N2', '동사', '急な変更に戸惑う。', '갑작스러운 변경에 당혹해하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='戸惑う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '揺れる', 'ゆれる', '흔들리다', 'N2', '동사', '地震で建物が揺れた。', '지진으로 건물이 흔들렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='揺れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '揺らぐ', 'ゆらぐ', '흔들리다, 동요하다', 'N2', '동사', '決意が揺らいでしまった。', '결의가 흔들려 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='揺らぐ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '築く', 'きずく', '쌓다, 구축하다', 'N2', '동사', '信頼関係を築く。', '신뢰 관계를 구축하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='築く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '招く', 'まねく', '초대하다, 초래하다', 'N2', '동사', '誤解を招く発言をしてしまった。', '오해를 초래하는 발언을 해버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='招く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '一致する', 'いっちする', '일치하다', 'N2', '동사', '意見が一致した。', '의견이 일치했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一致する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生かす', 'いかす', '살리다, 활용하다', 'N2', '동사', '経験を生かして働く。', '경험을 살려 일하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生かす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '兼ねる', 'かねる', '겸하다; ~하기 어렵다', 'N2', '동사', '食堂を兼ねた会議室を使う。', '식당을 겸한 회의실을 사용하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='兼ねる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '費やす', 'ついやす', '쏟다, 소비하다', 'N2', '동사', '多くの時間を研究に費やした。', '많은 시간을 연구에 쏟았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='費やす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '怠る', 'おこたる', '게으름 피우다, 소홀히 하다', 'N2', '동사', '準備を怠ると失敗する。', '준비를 소홀히 하면 실패한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='怠る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '傾く', 'かたむく', '기울다, 기울어지다', 'N2', '동사', '会社の経営が傾いている。', '회사 경영이 기울고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傾く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '潤う', 'うるおう', '윤택해지다, 혜택을 받다', 'N2', '동사', '雨で大地が潤う。', '비로 대지가 윤택해지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='潤う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乗り越える', 'のりこえる', '극복하다, 넘어서다', 'N2', '동사', '困難を乗り越えて成長する。', '어려움을 극복하고 성장하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗り越える' AND jlpt_level='N2');

-- ============================================================
-- い형용사 (い-Adjectives) — 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '激しい', 'はげしい', '격렬하다, 심하다', 'N2', 'い형용사', '激しい雨が降っている。', '격렬한 비가 내리고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='激しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鋭い', 'するどい', '날카롭다, 예리하다', 'N2', 'い형용사', '鋭い質問に答えられなかった。', '예리한 질문에 답하지 못했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鋭い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鈍い', 'にぶい', '둔하다, 무디다', 'N2', 'い형용사', '反応が鈍い人は損をする。', '반응이 둔한 사람은 손해를 본다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鈍い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '惜しい', 'おしい', '아깝다, 아쉽다', 'N2', 'い형용사', 'あと少しで勝てたのに、惜しい。', '조금만 더 있었으면 이길 수 있었는데, 아깝다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='惜しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '煩わしい', 'わずらわしい', '성가시다, 귀찮다', 'N2', 'い형용사', '手続きが煩わしくて困る。', '절차가 성가셔서 곤란하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煩わしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '憎らしい', 'にくらしい', '밉살스럽다', 'N2', 'い형용사', '憎らしいほど上手くやった。', '밉살스러울 만큼 잘 해냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憎らしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '羨ましい', 'うらやましい', '부럽다', 'N2', 'い형용사', '彼の才能が羨ましい。', '그의 재능이 부럽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='羨ましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '頼もしい', 'たのもしい', '믿음직하다', 'N2', 'い형용사', '頼もしい後輩が育った。', '믿음직한 후배가 성장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頼もしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恐ろしい', 'おそろしい', '무섭다, 두렵다', 'N2', 'い형용사', '恐ろしい夢を見た。', '무서운 꿈을 꿨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恐ろしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '危うい', 'あやうい', '위태롭다, 위험하다', 'N2', 'い형용사', '危うく事故になるところだった。', '위태롭게 사고가 날 뻔했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='危うい' AND jlpt_level='N2');

-- ============================================================
-- な형용사 (な-Adjectives) — 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '素直', 'すなお', '솔직함, 고분고분함', 'N2', 'な형용사', '素直な子どもに育ってほしい。', '솔직한 아이로 자라길 바란다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='素直' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '穏やか', 'おだやか', '온화함, 잔잔함', 'N2', 'な형용사', '穏やかな性格の人だ。', '온화한 성격의 사람이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='穏やか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鮮やか', 'あざやか', '선명함, 생생함', 'N2', 'な형용사', '鮮やかな色の花が咲いた。', '선명한 색의 꽃이 피었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鮮やか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '速やか', 'すみやか', '신속함, 빠름', 'N2', 'な형용사', '速やかに対応してください。', '신속하게 대응해 주십시오.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='速やか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '豊か', 'ゆたか', '풍요로움, 풍부함', 'N2', 'な형용사', '自然豊かな環境で育った。', '자연 풍요로운 환경에서 자랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='豊か' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '確か', 'たしか', '확실함, 틀림없음', 'N2', 'な형용사', '確かな証拠が必要だ。', '확실한 증거가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='確か' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '曖昧', 'あいまい', '애매함, 모호함', 'N2', 'な형용사', '曖昧な返事では困る。', '애매한 대답으로는 곤란하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='曖昧' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '厄介', 'やっかい', '귀찮음, 까다로움', 'N2', 'な형용사', '厄介な問題が発生した。', '까다로운 문제가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厄介' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '丁寧', 'ていねい', '정중함, 꼼꼼함', 'N2', 'な형용사', '丁寧な言葉遣いを心がける。', '정중한 말씨를 쓰도록 신경 쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='丁寧' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '円滑', 'えんかつ', '원활함, 순조로움', 'N2', 'な형용사', '業務を円滑に進める。', '업무를 원활하게 진행하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='円滑' AND jlpt_level='N2');

-- ============================================================
-- 副詞・その他 (Adverbs & Others) — 15語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '改めて', 'あらためて', '다시, 새삼스럽게', 'N2', '부사', '改めてお礼を申し上げます。', '다시 한번 감사 말씀을 드립니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改めて' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '概して', 'がいして', '대체로, 일반적으로', 'N2', '부사', '概して女性の方が長生きする。', '대체로 여성 쪽이 장수한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='概して' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '主に', 'おもに', '주로', 'N2', '부사', '主に電車で通勤している。', '주로 전철로 통근하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主に' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '互いに', 'たがいに', '서로', 'N2', '부사', '互いに助け合うことが大切だ。', '서로 돕는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='互いに' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '相変わらず', 'あいかわらず', '여전히, 변함없이', 'N2', '부사', '相変わらず元気そうですね。', '여전히 건강해 보이네요.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相変わらず' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '今更', 'いまさら', '이제 와서, 새삼스럽게', 'N2', '부사', '今更後悔しても遅い。', '이제 와서 후회해도 늦다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='今更' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '今後', 'こんご', '앞으로, 금후', 'N2', '부사', '今後ともよろしくお願いします。', '앞으로도 잘 부탁드립니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='今後' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'むやみに', 'むやみに', '함부로, 무턱대고', 'N2', '부사', 'むやみに個人情報を教えないこと。', '함부로 개인정보를 알려주지 말 것.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='むやみに' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いっそ', 'いっそ', '차라리, 아예', 'N2', '부사', 'いっそのこと辞めてしまおうか。', '차라리 그만두어 버릴까.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いっそ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おそらく', 'おそらく', '아마, 십중팔구', 'N2', '부사', 'おそらく彼は来ないだろう。', '아마 그는 오지 않을 것이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おそらく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'かつて', 'かつて', '일찍이, 예전에', 'N2', '부사', 'かつてここに城があった。', '일찍이 여기에 성이 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かつて' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あいにく', 'あいにく', '공교롭게도, 하필이면', 'N2', '부사', 'あいにく今日は予定があります。', '공교롭게도 오늘은 일정이 있습니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あいにく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もっぱら', 'もっぱら', '오로지, 전적으로', 'N2', '부사', 'もっぱら読書に時間を使う。', '오로지 독서에 시간을 쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もっぱら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いわば', 'いわば', '말하자면, 이른바', 'N2', '부사', 'これはいわば最後のチャンスだ。', '이것은 말하자면 마지막 기회이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いわば' AND jlpt_level='N2');
