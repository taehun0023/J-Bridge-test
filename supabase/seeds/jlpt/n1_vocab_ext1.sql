-- encoding: UTF-8
-- N1 語彙シード ext1 (111語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: 文学的・抽象・硬い書き言葉(名詞・な形容詞中心)

-- ============================================================
-- 名詞 (Nouns) — 53語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慟哭', 'どうこく', '통곡, 비통한 울음', 'N1', '명사', '母の訃報を聞いた彼は慟哭した。', '어머니의 부고를 들은 그는 통곡했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慟哭' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '懐古', 'かいこ', '회고, 옛날을 그리워함', 'N1', '명사', '老詩人は懐古の情にひたった。', '노시인은 회고의 감정에 잠겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懐古' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慨嘆', 'がいたん', '개탄, 한탄', 'N1', '명사', '世の乱れを慨嘆する声が上がった。', '세상의 어지러움을 개탄하는 목소리가 높아졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慨嘆' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '嗚咽', 'おえつ', '오열, 흐느낌', 'N1', '명사', '彼女は嗚咽を漏らしながら語った。', '그녀는 오열하면서 이야기했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嗚咽' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悲愴', 'ひそう', '비창, 비통함', 'N1', '명사', '彼の声には悲愴な響きがあった。', '그의 목소리에는 비창한 울림이 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悲愴' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '述懐', 'じゅっかい', '술회, 옛일을 회상함', 'N1', '명사', '老将軍は過去の戦いを述懐した。', '노장군은 과거의 싸움을 술회했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='述懐' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '苦衷', 'くちゅう', '고충, 괴로운 속사정', 'N1', '명사', '彼の苦衷を察してやってほしい。', '그의 고충을 헤아려 주었으면 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='苦衷' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '諦念', 'ていねん', '체념, 단념', 'N1', '명사', '長い闘病の末、諦念の境地に達した。', '오랜 투병 끝에 체념의 경지에 이르렀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諦念' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '無常', 'むじょう', '무상, 허무함', 'N1', '명사', '世の無常を感じさせる出来事が続いた。', '세상의 무상함을 느끼게 하는 사건이 계속됐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='無常' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '幽玄', 'ゆうげん', '유현, 심오한 아름다움', 'N1', '명사', '能には日本特有の幽玄の美がある。', '노(能)에는 일본 특유의 유현의 미가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幽玄' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '侘寂', 'わびさび', '와비사비, 쓸쓸한 아름다움', 'N1', '명사', '侘寂の精神は日本美学の根幹をなす。', '와비사비 정신은 일본 미학의 근간을 이룬다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='侘寂' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '風雅', 'ふうが', '풍아, 우아한 취미', 'N1', '명사', '茶道には風雅な精神が宿っている。', '다도에는 풍아한 정신이 깃들어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='風雅' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '雅致', 'がち', '아취, 우아한 운치', 'N1', '명사', 'この庭園には深い雅致がある。', '이 정원에는 깊은 아취가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雅致' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '詩情', 'しじょう', '시정, 시적 정취', 'N1', '명사', '春の野原は豊かな詩情をたたえている。', '봄 들판은 풍부한 시정을 간직하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='詩情' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気韻', 'きいん', '기운, 풍격과 운치', 'N1', '명사', '古い水墨画には独特の気韻が漂う。', '오래된 수묵화에는 독특한 기운이 감돈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気韻' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '風趣', 'ふうしゅ', '풍취, 운치', 'N1', '명사', '山里の秋には格別の風趣がある。', '산골 마을의 가을에는 각별한 풍취가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='風趣' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '余情', 'よじょう', '여정, 여운', 'N1', '명사', 'その詩は読み終えても深い余情が残る。', '그 시는 다 읽고 나서도 깊은 여운이 남는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='余情' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '閑寂', 'かんじゃく', '한적함, 고요함', 'N1', '명사', '山中の寺は閑寂に包まれていた。', '산속의 절은 한적함에 싸여 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='閑寂' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '寂寞', 'せきばく', '적막, 쓸쓸함', 'N1', '명사', '廃墟には深い寂寞が漂っていた。', '폐허에는 깊은 적막이 감돌고 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寂寞' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '孤愁', 'こしゅう', '고수, 외로운 슬픔', 'N1', '명사', '旅の夜に孤愁を感じた。', '여행의 밤에 외로운 슬픔을 느꼈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='孤愁' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '清澄', 'せいちょう', '맑고 투명함', 'N1', '명사', '高原の空気は清澄そのものだった。', '고원의 공기는 맑음 그 자체였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清澄' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '霽れ', 'はれ', '개임, 날이 갬', 'N1', '명사', '長雨の後の霽れは格別だ。', '장마 후의 맑음은 각별하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='霽れ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '薄暮', 'はくぼ', '박모, 해질 무렵', 'N1', '명사', '薄暮の海岸を一人歩いた。', '해질 무렵의 해안을 혼자 걸었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='薄暮' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '黎明', 'れいめい', '여명, 새벽빛', 'N1', '명사', '文明の黎明期は遥か昔に遡る。', '문명의 여명기는 아득한 옛날로 거슬러 올라간다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='黎明' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暁', 'あかつき', '여명, 새벽; 이루어질 때', 'N1', '명사', '夢を実現できた暁には、感謝を伝えたい。', '꿈을 실현한 그날에는 감사를 전하고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暁' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宵', 'よい', '초저녁, 밤 초', 'N1', '명사', '宵の口からしんしんと雪が降り始めた。', '초저녁부터 소복소복 눈이 내리기 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宵' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蒼穹', 'そうきゅう', '창공, 드넓은 하늘', 'N1', '명사', '蒼穹に向かって鷹が舞い上がった。', '창공을 향해 매가 날아올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蒼穹' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '碧空', 'へきくう', '벽공, 파란 하늘', 'N1', '명사', '秋の碧空は澄み渡っていた。', '가을의 파란 하늘은 맑고 투명했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='碧空' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大河', 'たいが', '대하, 큰 강', 'N1', '명사', '歴史は大河のごとく悠然と流れる。', '역사는 대하처럼 유유히 흐른다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大河' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '幽境', 'ゆうきょう', '유경, 그윽한 경지', 'N1', '명사', '深山に分け入ると幽境に出た。', '깊은 산속으로 들어가자 그윽한 경지가 나타났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幽境' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '深淵', 'しんえん', '심연, 깊은 못; 심오한 세계', 'N1', '명사', '彼の哲学は存在の深淵に迫るものだ。', '그의 철학은 존재의 심연에 육박하는 것이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='深淵' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '霊峰', 'れいほう', '영봉, 신성한 산', 'N1', '명사', '霊峰富士は古来より信仰の対象であった。', '영봉 후지산은 예로부터 신앙의 대상이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='霊峰' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '流転', 'るてん', '유전, 끊임없이 변함', 'N1', '명사', '世は流転し、かつての栄光は過ぎ去った。', '세상은 유전하고 과거의 영광은 사라졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='流転' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輪廻転生', 'りんねてんしょう', '윤회전생', 'N1', '명사', '輪廻転生の思想は仏教の根本概念の一つだ。', '윤회전생의 사상은 불교의 근본 개념 중 하나다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輪廻転生' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '涅槃', 'ねはん', '열반', 'N1', '명사', '釈迦は菩提樹の下で涅槃に達したと伝えられる。', '석가는 보리수 아래에서 열반에 이르렀다고 전해진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='涅槃' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悟道', 'ごどう', '오도, 깨달음의 길', 'N1', '명사', '禅僧は悟道を求めて座禅を組んだ。', '선승은 오도를 구하며 좌선을 틀었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悟道' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '求道', 'きゅうどう', '구도, 진리를 탐구함', 'N1', '명사', '彼の人生は真理への求道の連続だった。', '그의 인생은 진리를 향한 구도의 연속이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='求道' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '浄土', 'じょうど', '정토, 극락', 'N1', '명사', '浄土への往生を願って念仏を唱えた。', '정토에 왕생하기를 바라며 염불을 외웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浄土' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '神髄', 'しんずい', '신수, 본질, 정수', 'N1', '명사', '武道の神髄は礼に始まり礼に終わる。', '무도의 신수는 예로 시작하여 예로 끝난다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='神髄' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '根源', 'こんげん', '근원', 'N1', '명사', '悪の根源を探ることが哲学の使命だ。', '악의 근원을 탐구하는 것이 철학의 사명이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根源' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '超克', 'ちょうこく', '초극, 극복하고 초월함', 'N1', '명사', '苦難の超克こそが人間を成長させる。', '고난의 초극이야말로 인간을 성장시킨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='超克' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '知性', 'ちせい', '지성', 'N1', '명사', '知性と感性のバランスが重要だ。', '지성과 감성의 균형이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='知性' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '理性', 'りせい', '이성', 'N1', '명사', '理性の声に従って行動することが大切だ。', '이성의 소리에 따라 행동하는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='理性' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悟性', 'ごせい', '오성, 지적 인식 능력', 'N1', '명사', '悟性によって現象の背後にある本質を把握する。', '오성에 의해 현상 배후에 있는 본질을 파악한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悟性' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '直覚', 'ちょっかく', '직각, 직접적 인식', 'N1', '명사', '芸術家は直覚によって真実をとらえる。', '예술가는 직각으로 진실을 포착한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='直覚' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '叡覚', 'えいかく', '예각, 뛰어난 깨달음', 'N1', '명사', '師の叡覚は弟子たちを導いた。', '스승의 뛰어난 깨달음이 제자들을 이끌었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='叡覚' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '徳望', 'とくぼう', '덕망', 'N1', '명사', '徳望ある指導者が国を導いた。', '덕망 있는 지도자가 나라를 이끌었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='徳望' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仁愛', 'じんあい', '인애, 어짊과 사랑', 'N1', '명사', '仁愛の精神が社会の礎となる。', '인애의 정신이 사회의 礎가 된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仁愛' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廉恥', 'れんち', '염치', 'N1', '명사', '廉恥を知らぬ者は社会に害をなす。', '염치를 모르는 자는 사회에 해를 끼친다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廉恥' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '節操', 'せっそう', '절조, 지조', 'N1', '명사', '節操を守り通した彼は尊敬を集めた。', '절조를 지켜온 그는 존경을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節操' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '骨格', 'こっかく', '골격, 뼈대; 근본 틀', 'N1', '명사', '国家の骨格を成す法律を整備する。', '국가의 골격을 이루는 법률을 정비한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='骨格' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気脈', 'きみゃく', '기맥, 통하는 맥락', 'N1', '명사', '二人は気脈を通じて行動した。', '두 사람은 기맥을 통하여 행동했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気脈' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '衆目', 'しゅうもく', '중목, 많은 사람들의 눈', 'N1', '명사', '彼の才能は衆目の認めるところとなった。', '그의 재능은 많은 사람들이 인정하는 바가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='衆目' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '奥義', 'おうぎ', '오의, 깊은 비의', 'N1', '명사', '師匠から武術の奥義を授かった。', '스승으로부터 무술의 오의를 전수받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奥義' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '秘伝', 'ひでん', '비전, 비밀 전수', 'N1', '명사', '一子相伝の秘伝が今も伝わっている。', '대대로 이어지는 비전이 지금도 전해진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='秘伝' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '玄妙', 'げんみょう', '현묘, 심오하고 미묘함', 'N1', '명사', '老子の哲学には玄妙な深みがある。', '노자의 철학에는 현묘한 깊이가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='玄妙' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '佳境', 'かきょう', '가경, 가장 흥미로운 장면', 'N1', '명사', '物語はいよいよ佳境に入ってきた。', '이야기는 드디어 가장 흥미로운 장면으로 들어왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='佳境' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '白眉', 'はくび', '백미, 가장 뛰어난 것', 'N1', '명사', 'この作品は作家の全業績中の白眉といえる。', '이 작품은 작가의 전체 업적 중 백미라고 할 수 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='白眉' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '真諦', 'しんたい', '진체, 진실한 이치', 'N1', '명사', '芸術の真諦は美の追求にある。', '예술의 진실한 이치는 미의 추구에 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='真諦' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '叡知', 'えいち', '예지, 뛰어난 지혜', 'N1', '명사', '先人の叡知を学ぶことが大切だ。', '선인의 예지를 배우는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='叡知' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '機略', 'きりゃく', '기략, 임기응변의 책략', 'N1', '명사', '将軍は機略縦横に敵を翻弄した。', '장군은 기략을 종횡무진 펼쳐 적을 농락했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='機略' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '遺風', 'いふう', '유풍, 남겨진 풍습·기풍', 'N1', '명사', '先師の遺風を守り続けることが弟子の務めだ。', '선사의 유풍을 계속 지키는 것이 제자의 의무다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遺風' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '余薫', 'よくん', '여훈, 남아있는 향기·영향', 'N1', '명사', '亡き師の余薫が今も弟子たちを導いている。', '돌아가신 스승의 여훈이 지금도 제자들을 이끌고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='余薫' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '沈黙', 'ちんもく', '침묵', 'N1', '명사', '長い沈黙の後、彼は語り始めた。', '긴 침묵 끝에 그는 이야기를 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='沈黙' AND jlpt_level='N1');

-- ============================================================
-- な形容詞 (Na-adjectives) — 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凜然', 'りんぜん', '늠연한, 늠름하고 위엄 있는', 'N1', 'な형용사', '彼は凜然たる態度で敵と対峙した。', '그는 늠연한 태도로 적과 대치했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凜然' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '泰然', 'たいぜん', '태연한', 'N1', 'な형용사', 'どんな試練にも泰然自若として臨んだ。', '어떤 시련에도 태연자약하게 임했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='泰然' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悠然', 'ゆうぜん', '유연한, 여유롭고 침착한', 'N1', 'な형용사', '老人は悠然として将棋を指していた。', '노인은 여유롭게 장기를 두고 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悠然' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '純朴', 'じゅんぼく', '순박한', 'N1', 'な형용사', '山里の人々は純朴で親切だった。', '산골 마을 사람들은 순박하고 친절했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='純朴' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '沈勇', 'ちんゆう', '침용, 침착하고 용감함', 'N1', 'な형용사', '沈勇なる指揮官が部隊を導いた。', '침착하고 용감한 지휘관이 부대를 이끌었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='沈勇' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '闊達', 'かったつ', '활달한, 호탕한', 'N1', 'な형용사', '彼は闊達な性格で誰からも好かれた。', '그는 활달한 성격으로 모두에게 사랑받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='闊達' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '磊落', 'らいらく', '뇌락한, 호방하고 솔직한', 'N1', 'な형용사', '磊落な人柄が多くの人を引きつけた。', '호방한 인품이 많은 사람을 끌어들였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='磊落' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '温雅', 'おんが', '온아한, 온화하고 우아한', 'N1', 'な형용사', '温雅な物腰が周囲を和ませた。', '온화하고 우아한 몸가짐이 주위를 부드럽게 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='温雅' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '剛直', 'ごうちょく', '강직한', 'N1', 'な형용사', '剛直な性格ゆえに上司と衝突した。', '강직한 성격 때문에 상사와 충돌했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='剛直' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廉潔', 'れんけつ', '청렴결백한', 'N1', 'な형용사', '廉潔な官吏は民衆の信頼を集めた。', '청렴결백한 관리는 민중의 신뢰를 모았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廉潔' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '奥深', 'おくふか', '깊고 오묘한', 'N1', 'な형용사', '日本文化は奥深い魅力を持っている。', '일본 문화는 깊고 오묘한 매력을 가지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奥深' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '森厳', 'しんげん', '삼엄한, 엄숙하고 장엄한', 'N1', 'な형용사', '古刹の境内は森厳たる雰囲気に包まれていた。', '고찰의 경내는 삼엄한 분위기에 싸여 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='森厳' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '潔白', 'けっぱく', '결백한', 'N1', 'な형용사', '自らの潔白を証明しようと必死だった。', '자신의 결백을 증명하려고 필사적이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='潔白' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '高邁', 'こうまい', '고매한, 뜻이 높고 고상한', 'N1', 'な형용사', '高邁な理想を掲げて政治の道に入った。', '고매한 이상을 내걸고 정치의 길에 들어섰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高邁' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '典雅', 'てんが', '전아한, 기품 있고 우아한', 'N1', 'な형용사', '典雅な文体が古典の魅力を高めている。', '전아한 문체가 고전의 매력을 높이고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='典雅' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '荘重', 'そうちょう', '장중한, 웅장하고 무거운', 'N1', 'な형용사', '交響曲は荘重な第一楽章から始まった。', '교향곡은 장중한 제1악장으로 시작되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='荘重' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蒼然', 'そうぜん', '창연한, 푸르스름하고 오래된 느낌', 'N1', 'な형용사', '蒼然たる古木が参道に立ち並んでいた。', '창연한 고목이 참배길에 줄지어 서 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蒼然' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '曠大', 'こうだい', '광대한, 드넓고 광활한', 'N1', 'な형용사', '曠大な平原が地平線まで続いていた。', '광대한 평원이 지평선까지 이어져 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='曠大' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悲壮', 'ひそう', '비장한', 'N1', 'な형용사', '悲壮な決意を胸に最後の戦いに臨んだ。', '비장한 결의를 가슴에 품고 마지막 싸움에 임했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悲壮' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '鬼気', 'きき', '귀기, 섬뜩한 기운', 'N1', 'な형용사', '鬼気迫る演技に観客は息をのんだ。', '귀기가 서린 연기에 관객은 숨을 죽였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='鬼気' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凛烈', 'りんれつ', '늠렬한, 서늘하고 엄숙한', 'N1', 'な형용사', '凛烈な朝の空気が心身を引き締めた。', '늠렬한 아침 공기가 심신을 긴장시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凛烈' AND jlpt_level='N1');

-- ============================================================
-- い形容詞 (I-adjectives) — 13語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '艶めかしい', 'なまめかしい', '요염한, 매혹적인', 'N1', 'い형용사', '舞妓の艶めかしい舞いに見とれた。', '마이코의 요염한 춤에 넋을 잃었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='艶めかしい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もの悲しい', 'ものがなしい', '어쩐지 슬픈, 서글픈', 'N1', 'い형용사', '秋の夕暮れはもの悲しい気持ちにさせる。', '가을 저녁은 어쩐지 슬픈 마음이 들게 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もの悲しい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いとしい', 'いとしい', '사랑스러운, 애틋한', 'N1', 'い형용사', '子を思うおそのいとしい気持ちは変わらない。', '자식을 생각하는 애틋한 마음은 변하지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いとしい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'はかない', 'はかない', '덧없는, 허무한', 'N1', 'い형용사', '桜の花のはかない美しさに心を打たれた。', '벚꽃의 덧없는 아름다움에 마음이 움직였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='はかない' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'まがまがしい', 'まがまがしい', '불길한, 사악한', 'N1', 'い형용사', 'まがまがしい予感が頭をよぎった。', '불길한 예감이 머리를 스쳐 지나갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まがまがしい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おどろおどろしい', 'おどろおどろしい', '으스스한, 무섭고 기괴한', 'N1', 'い형용사', 'おどろおどろしい雰囲気の屋敷に迷い込んだ。', '으스스한 분위기의 저택에 길을 잃고 들어갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おどろおどろしい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あどけない', 'あどけない', '천진난만한', 'N1', 'い형용사', 'あどけない笑顔が見る者の心を和ませた。', '천진난만한 미소가 보는 이의 마음을 부드럽게 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あどけない' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '心細い', 'こころぼそい', '불안한, 의지할 곳 없어 외로운', 'N1', 'い형용사', '見知らぬ土地で一人、心細い夜を過ごした。', '낯선 땅에서 혼자 불안한 밤을 보냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='心細い' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凄絶', 'せいぜつ', '처절한, 참혹하고 처절한', 'N1', 'い형용사', '凄絶な最期を遂げた武将の伝説が残る。', '처절한 최후를 맞은 무장의 전설이 남아있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凄絶' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '清冽', 'せいれつ', '청렬한, 맑고 차가운', 'N1', 'い형용사', '清冽な山の湧き水が渇きを癒した。', '맑고 차가운 산의 솟구치는 물이 갈증을 풀었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清冽' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '重厚', 'じゅうこう', '중후한', 'N1', 'い형용사', '重厚な文体が作品に深みを与えている。', '중후한 문체가 작품에 깊이를 더해주고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='重厚' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蒼古', 'そうこ', '창고한, 오래되고 예스러운', 'N1', 'い형용사', '蒼古たる社殿が森の奥にひっそりと立っていた。', '창고한 사전이 숲속 깊은 곳에 조용히 서 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蒼古' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '麗しい', 'うるわしい', '아름다운, 훌륭한', 'N1', 'い형용사', '麗しい友情が二人を生涯結びつけた。', '아름다운 우정이 두 사람을 평생 이어주었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='麗しい' AND jlpt_level='N1');

-- ============================================================
-- 動詞 (Verbs) — 11語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '嘆ずる', 'たんずる', '탄식하다', 'N1', '동사', '世の乱れを嘆ずる声が絶えない。', '세상의 어지러움을 탄식하는 목소리가 끊이지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嘆ずる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '哀惜する', 'あいせきする', '애석해하다, 슬프게 아쉬워하다', 'N1', '동사', '若くして世を去った友人を哀惜した。', '젊은 나이에 세상을 떠난 친구를 애석해했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='哀惜する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '享受する', 'きょうじゅする', '향수하다, 누리다', 'N1', '동사', '自然の恵みを享受しながら生きる。', '자연의 혜택을 누리며 살다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='享受する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '邁進する', 'まいしんする', '매진하다', 'N1', '동사', '目標に向かって邁進する姿が尊い。', '목표를 향해 매진하는 모습이 존귀하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='邁進する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '渾身する', 'こんしんする', '혼신을 다하다', 'N1', '동사', '渾身の力を込めて最後の一打を放った。', '혼신의 힘을 담아 마지막 한 타를 날렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='渾身する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '陶冶する', 'とうやする', '도야하다, 인격을 도야하다', 'N1', '동사', '古典を学ぶことで人格を陶冶する。', '고전을 배움으로써 인격을 도야한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陶冶する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '薫陶する', 'くんとうする', '훈도하다, 가르치고 감화하다', 'N1', '동사', '師に薫陶された弟子が各地で活躍している。', '스승에게 훈도된 제자들이 각지에서 활약하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='薫陶する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '昇華する', 'しょうかする', '승화하다', 'N1', '동사', '悲しみを芸術に昇華させた。', '슬픔을 예술로 승화시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='昇華する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '瞑想する', 'めいそうする', '명상하다', 'N1', '동사', '毎朝、瞑想することで心の平静を保つ。', '매일 아침 명상함으로써 마음의 평정을 유지한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='瞑想する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '惻隠する', 'そくいんする', '측은히 여기다', 'N1', '동사', '苦しむ人々に惻隠の情を抱いた。', '고통받는 사람들에게 측은한 마음을 품었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='惻隠する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '崇める', 'あがめる', '숭배하다, 우러러 받들다', 'N1', '동사', '古来より山を神として崇めてきた。', '예로부터 산을 신으로 숭배해왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='崇める' AND jlpt_level='N1');

-- ============================================================
-- 副詞 (Adverbs) — 5語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '粛然と', 'しゅくぜんと', '숙연하게', 'N1', '부사', '師の訃報を聞き、一同は粛然とした。', '스승의 부고를 듣고 모두가 숙연해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粛然と' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悠々と', 'ゆうゆうと', '유유히', 'N1', '부사', '大鷹が悠々と大空を舞っていた。', '큰 매가 유유히 대공을 날고 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悠々と' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蕭然と', 'しょうぜんと', '소연하게, 쓸쓸하게', 'N1', '부사', '廃村は蕭然として人の気配がなかった。', '폐촌은 쓸쓸하게 사람의 기척이 없었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蕭然と' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '渾然と', 'こんぜんと', '혼연히, 완전히 하나로 융합하여', 'N1', '부사', '東西の文化が渾然と溶け合った作品だ。', '동서 문화가 혼연히 융합된 작품이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='渾然と' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凛として', 'りんとして', '늠름하게, 의젓하게', 'N1', '부사', '彼女は凛として困難に立ち向かった。', '그녀는 늠름하게 어려움에 맞섰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凛として' AND jlpt_level='N1');
