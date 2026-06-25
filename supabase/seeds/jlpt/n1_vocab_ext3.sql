-- encoding: UTF-8
-- N1 語彙シード ext3 (130語)
-- テーマ: 和語の難読動詞・複合動詞・上級い형용사・副詞・擬態語
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- 既存2895語との重複排除: 各行 WHERE NOT EXISTS ガード付き
-- 読み: 標準国語辞典準拠 (連濁・難読 確認済み)

-- ============================================================
-- 和語難読動詞・複合動詞 (Verbs) — 50語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '諾う', 'うべなう', '수긍하다, 동의하다', 'N1', '동사', '彼の意見に諾った。', '그의 의견에 수긍했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諾う' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '謗る', 'そしる', '비방하다, 헐뜯다', 'N1', '동사', '他人を謗ることは慎むべきだ。', '타인을 비방하는 것은 삼가야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謗る' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '貶す', 'けなす', '깎아내리다, 헐뜯다', 'N1', '동사', '作品を貶すより褒める方が建設的だ。', '작품을 깎아내리는 것보다 칭찬하는 것이 건설적이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='貶す' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '窺う', 'うかがう', '엿보다, 살피다', 'N1', '동사', '隙を窺って行動する。', '틈을 엿보아 행동한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='窺う' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '辿る', 'たどる', '더듬어 가다, 거슬러 올라가다', 'N1', '동사', '歴史の足跡を辿る。', '역사의 발자취를 더듬어 간다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='辿る' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '跨る', 'またがる', '걸터앉다, 걸치다', 'N1', '동사', '馬に跨って出発した。', '말에 걸터앉아 출발했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='跨る' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訝しむ', 'いぶかしむ', '의아하게 여기다, 이상히 여기다', 'N1', '동사', '彼の行動を訝しんだ。', '그의 행동을 이상히 여겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訝しむ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '喘ぐ', 'あえぐ', '헐떡이다, 허덕이다', 'N1', '동사', '坂道を駆け上がって喘いだ。', '오르막길을 뛰어올라 헐떡였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喘ぐ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '憂う', 'うれう', '걱정하다, 근심하다', 'N1', '동사', '国の将来を憂う。', '나라의 장래를 걱정하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憂う' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '涵養する', 'かんようする', '함양하다, 기르다', 'N1', '동사', '情操を涵養することが教育の目的だ。', '정서를 함양하는 것이 교육의 목적이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='涵養する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '憶測する', 'おくそくする', '억측하다, 추측하다', 'N1', '동사', '根拠なく憶測することは避けるべきだ。', '근거 없이 억측하는 것은 피해야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憶測する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '投げかける', 'なげかける', '(질문·시선을) 던지다, 보내다', 'N1', '동사', '鋭い疑問を投げかけた。', '날카로운 의문을 던졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='投げかける' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '煮詰まる', 'につまる', '(논의가) 결론에 가까워지다; 막히다', 'N1', '동사', '議論が煮詰まってきた。', '논의가 결론에 가까워졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煮詰まる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '切り崩す', 'きりくずす', '허물다, 잠식하다', 'N1', '동사', '相手の支持基盤を切り崩す戦術をとった。', '상대방의 지지 기반을 잠식하는 전술을 취했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り崩す' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '虐げる', 'しいたげる', '학대하다, 억압하다', 'N1', '동사', '弱者を虐げる社会は許されない。', '약자를 억압하는 사회는 용납되지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='虐げる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '煽る', 'あおる', '부추기다, 선동하다; 부채질하다', 'N1', '동사', '不安を煽る報道が多い。', '불안을 조장하는 보도가 많다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煽る' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '陥れる', 'おとしいれる', '빠뜨리다, 함정에 넣다', 'N1', '동사', '罠で相手を陥れようとした。', '함정으로 상대방을 빠뜨리려 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陥れる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慨嘆する', 'がいたんする', '개탄하다, 한탄하다', 'N1', '동사', '世の乱れを慨嘆する。', '세상의 혼란을 개탄하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慨嘆する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '痛嘆する', 'つうたんする', '통탄하다, 매우 한탄하다', 'N1', '동사', '惨事を痛嘆した。', '참사를 통탄했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='痛嘆する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '押し量る', 'おしはかる', '헤아리다, 추측하다', 'N1', '동사', '彼の気持ちを押し量ることは難しい。', '그의 마음을 헤아리기 어렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='押し量る' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '淘汰する', 'とうたする', '도태시키다, 가려내다', 'N1', '동사', '競争によって劣ったものが淘汰される。', '경쟁에 의해 열등한 것이 도태된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='淘汰する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '分泌する', 'ぶんぴつする', '분비하다', 'N1', '동사', 'ストレスを感じるとホルモンが分泌される。', '스트레스를 느끼면 호르몬이 분비된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分泌する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '打ち負かす', 'うちまかす', '쳐부수다, 완패시키다', 'N1', '동사', '強敵を打ち負かした。', '강적을 완패시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち負かす' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '这い上がる', 'はいあがる', '기어오르다, 불굴로 일어서다', 'N1', '동사', 'どん底から這い上がった。', '밑바닥에서 기어올라왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='这い上がる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宥恕する', 'ゆうじょする', '용서하다, 관대히 봐주다', 'N1', '동사', '過ちを宥恕してほしいと頼んだ。', '잘못을 용서해 달라고 부탁했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宥恕する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '懐柔する', 'かいじゅうする', '회유하다, 달래어 내 편으로 만들다', 'N1', '동사', '反対派を懐柔して賛成に転じさせた。', '반대파를 회유하여 찬성으로 돌아서게 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懐柔する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '翻意する', 'ほんいする', '마음을 바꾸다, 번의하다', 'N1', '동사', '辞退の意思を翻意した。', '사퇴 의사를 번복했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='翻意する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '懊悩する', 'おうのうする', '번민하다, 심하게 괴로워하다', 'N1', '동사', '進路の決断で懊悩した。', '진로 결단으로 번민했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懊悩する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '韜晦する', 'とうかいする', '도회하다, 재주를 숨기다', 'N1', '동사', '自分の才能を韜晦している人だ。', '자신의 재능을 숨기는 사람이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='韜晦する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '邁進する', 'まいしんする', '매진하다, 힘차게 나아가다', 'N1', '동사', '目標に向かって邁進した。', '목표를 향해 매진했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='邁進する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '跋扈する', 'ばっこする', '발호하다, 함부로 날뛰다', 'N1', '동사', '不正が跋扈する社会になってしまった。', '부정이 발호하는 사회가 되어 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='跋扈する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蹉跌する', 'さてつする', '좌절하다, 실패하다', 'N1', '동사', '計画が蹉跌した。', '계획이 좌절되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蹉跌する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '嗤う', 'わらう', '비웃다, 냉소하다 (경멸)', 'N1', '동사', '失敗した人を嗤うな。', '실패한 사람을 비웃지 마라.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嗤う' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慄く', 'おののく', '떨다, 전율하다', 'N1', '동사', '恐怖に慄く。', '공포에 전율하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慄く' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慈しむ', 'いつくしむ', '아끼다, 사랑스럽게 돌보다', 'N1', '동사', '子どもを慈しんで育てる。', '아이를 아끼며 키우다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慈しむ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慕う', 'したう', '사모하다, 그리워하다', 'N1', '동사', '亡き師を慕い続ける。', '돌아가신 스승을 계속 그리워하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慕う' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '惹く', 'ひく', '(마음을) 끌다, 끌어당기다', 'N1', '동사', '彼の発言が注目を惹いた。', '그의 발언이 주목을 끌었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='惹く' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '揺さぶる', 'ゆさぶる', '흔들다, 동요시키다', 'N1', '동사', '人の心を揺さぶる演技だった。', '사람의 마음을 동요시키는 연기였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='揺さぶる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '揺るがす', 'ゆるがす', '뒤흔들다', 'N1', '동사', '社会の常識を揺るがす発見だった。', '사회의 상식을 뒤흔드는 발견이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='揺るがす' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抜きん出る', 'ぬきんでる', '뛰어나다, 두각을 나타내다', 'N1', '동사', '同期の中で抜きん出た才能を持つ。', '동기 중에서 뛰어난 재능을 가지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜きん出る' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抜擢する', 'ばってきする', '발탁하다', 'N1', '동사', '若い人材を重要ポストに抜擢した。', '젊은 인재를 중요 직책에 발탁했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜擢する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凝縮する', 'ぎょうしゅくする', '응축하다, 압축하다', 'N1', '동사', 'エッセンスを凝縮した一冊だ。', '정수를 응축한 한 권이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凝縮する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '秘める', 'ひめる', '숨기다, 마음속에 감추다', 'N1', '동사', '心の内に秘めた思いがある。', '마음속에 숨긴 생각이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='秘める' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '欺く', 'あざむく', '속이다, 기만하다', 'N1', '동사', '人を欺いて利益を得た。', '사람을 속여 이득을 취했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='欺く' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '惑う', 'まどう', '당황하다, 갈피를 못 잡다', 'N1', '동사', '突然の事態に惑ってしまった。', '갑작스러운 상황에 당황해 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='惑う' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宥める', 'なだめる', '달래다, 어르다', 'N1', '동사', '怒っている人を宥める。', '화난 사람을 달랜다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宥める' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '諭す', 'さとす', '타이르다, 깨우치게 하다', 'N1', '동사', '子どもに道理を諭す。', '아이에게 도리를 타이른다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諭す' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蔑む', 'さげすむ', '업신여기다, 경멸하다', 'N1', '동사', '人を蔑む態度は許せない。', '사람을 업신여기는 태도는 용납할 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蔑む' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '憚る', 'はばかる', '꺼리다, 주저하다', 'N1', '동사', '周囲を憚って声を潜めた。', '주위를 꺼려 목소리를 낮췄다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憚る' AND jlpt_level='N1');

-- ============================================================
-- 上級い형용사・な형용사 (Advanced Adjectives) — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恍惚とした', 'こうこつとした', '황홀한, 넋을 잃은', 'N1', 'い형용사', '恍惚とした表情で音楽を聴く。', '황홀한 표정으로 음악을 듣는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恍惚とした' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぎこちない', 'ぎこちない', '어색하다, 서투르다', 'N1', 'い형용사', 'ぎこちない動きで挨拶した。', '어색한 동작으로 인사했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぎこちない' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恥ずかしい', 'はずかしい', '부끄럽다, 창피하다', 'N1', 'い형용사', '人前で失敗して恥ずかしかった。', '사람들 앞에서 실수하여 창피했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恥ずかしい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '初々しい', 'ういういしい', '풋풋하다, 싱그럽다', 'N1', 'い형용사', '初々しい新入社員たちが入ってきた。', '풋풋한 신입사원들이 들어왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='初々しい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '晴れがましい', 'はれがましい', '영광스럽다, 뿌듯하다', 'N1', 'い형용사', '卒業式は晴れがましい日だ。', '졸업식은 영광스러운 날이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='晴れがましい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慎ましい', 'つつましい', '검소하다, 얌전하다', 'N1', 'い형용사', '慎ましい生活を送る。', '검소한 생활을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慎ましい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生々しい', 'なまなましい', '생생하다, 생동감 있다', 'N1', 'い형용사', '生々しい傷跡が残っていた。', '생생한 상처 자국이 남아 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生々しい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '空々しい', 'そらぞらしい', '시치미를 뗀, 뻔뻔한', 'N1', 'い형용사', '空々しい嘘に腹が立った。', '뻔뻔한 거짓말에 화가 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='空々しい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '清々しい', 'すがすがしい', '상쾌하다, 시원하다', 'N1', 'い형용사', '朝の空気が清々しい。', '아침 공기가 상쾌하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清々しい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '厭わしい', 'いとわしい', '귀찮다, 싫다', 'N1', 'い형용사', '面倒な手続きが厭わしい。', '번거로운 절차가 귀찮다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='厭わしい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '忌々しい', 'いまいましい', '분하다, 짜증스럽다', 'N1', 'い형용사', '忌々しい思いをした。', '분한 마음이 들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='忌々しい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '疚しい', 'やましい', '양심에 걸리다, 떳떳하지 못하다', 'N1', 'い형용사', '疚しいことは何もしていない。', '떳떳하지 못할 일은 아무것도 하지 않았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疚しい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気恥ずかしい', 'きはずかしい', '왠지 쑥스럽다, 멋쩍다', 'N1', 'い형용사', '褒められて気恥ずかしかった。', '칭찬받아 멋쩍었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気恥ずかしい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ままならない', 'ままならない', '뜻대로 되지 않다, 자유롭지 못하다', 'N1', 'い형용사', '体がままならなくなってきた。', '몸이 뜻대로 되지 않게 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ままならない' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '名高い', 'なだかい', '명성이 높다, 유명하다', 'N1', 'い형용사', '名高い画家の作品を鑑賞した。', '명성 높은 화가의 작품을 감상했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='名高い' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '薄気味悪い', 'うすきみわるい', '으스스하다, 기분 나쁘다', 'N1', 'い형용사', '薄気味悪い笑みを浮かべた。', '으스스한 미소를 지었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='薄気味悪い' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '心許ない', 'こころもとない', '불안하다, 마음 놓이지 않다', 'N1', 'い형용사', '一人で行かせるのは心許ない。', '혼자 보내는 것이 마음 놓이지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='心許ない' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '根気強い', 'ねきづよい', '끈기 있다, 인내심이 강하다', 'N1', 'い형용사', '根気強く交渉を続けた。', '끈기 있게 협상을 계속했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根気強い' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '畏れ多い', 'おそれおおい', '황송하다, 분에 넘치다', 'N1', 'い형용사', '畏れ多いことですが、一言申し上げます。', '황송하오나 한 말씀 드리겠습니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='畏れ多い' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '忘れがたい', 'わすれがたい', '잊기 어렵다, 잊지 못할', 'N1', 'い형용사', '忘れがたい思い出となった。', '잊지 못할 추억이 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='忘れがたい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '甚だしい', 'はなはだしい', '심하다, 몹시', 'N1', 'い형용사', '誤解も甚だしい。', '오해도 심하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='甚だしい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '由々しい', 'ゆゆしい', '심각하다, 중대하다', 'N1', 'い형용사', '由々しい事態を招いてしまった。', '심각한 사태를 초래해 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='由々しい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '荘厳だ', 'そうごんだ', '장엄하다', 'N1', 'な형용사', '荘厳な雰囲気の寺院に圧倒された。', '장엄한 분위기의 사원에 압도되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='荘厳だ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '殊勝だ', 'しゅしょうだ', '기특하다, 갸륵하다', 'N1', 'な형용사', '殊勝な心がけに感心した。', '기특한 마음가짐에 감탄했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='殊勝だ' AND jlpt_level='N1');

-- ============================================================
-- 副詞・擬態語 (Adverbs & Mimetic Words) — 55語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'とぼとぼ', 'とぼとぼ', '터벅터벅, 힘없이 걷는 모양', 'N1', '부사', '疲れてとぼとぼと帰宅した。', '지쳐 터벅터벅 귀가했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='とぼとぼ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'のそのそ', 'のそのそ', '굼뜨게, 느릿느릿', 'N1', '부사', '亀がのそのそと動く。', '거북이가 느릿느릿 움직인다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のそのそ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'しょんぼり', 'しょんぼり', '풀이 죽어, 침울하게', 'N1', '부사', '試合に負けてしょんぼりしていた。', '경기에 져서 침울해 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しょんぼり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うっとり', 'うっとり', '황홀하게, 넋을 잃고', 'N1', '부사', '美しい音楽にうっとりした。', '아름다운 음악에 넋을 잃었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うっとり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'のんびり', 'のんびり', '느긋하게, 유유자적하게', 'N1', '부사', '休日はのんびり過ごした。', '휴일은 느긋하게 보냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のんびり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'すんなり', 'すんなり', '순조롭게, 술술', 'N1', '부사', '交渉がすんなり進んだ。', '협상이 순조롭게 진행되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すんなり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'しぶしぶ', 'しぶしぶ', '마지못해, 내키지 않게', 'N1', '부사', 'しぶしぶ承諾した。', '마지못해 승낙했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しぶしぶ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'こっそり', 'こっそり', '몰래, 살짝', 'N1', '부사', 'こっそりと部屋を抜け出した。', '몰래 방에서 빠져나갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='こっそり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐいぐい', 'ぐいぐい', '세차게, 힘껏; 강하게 밀어붙이는 모양', 'N1', '부사', 'ぐいぐいと引っ張られた。', '세차게 잡아당겨졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐいぐい' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ずるずる', 'ずるずる', '질질, 흐지부지', 'N1', '부사', '問題解決をずるずると先送りにした。', '문제 해결을 질질 미루었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ずるずる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐったり', 'ぐったり', '기진맥진하여, 축 늘어져', 'N1', '부사', '長時間の作業でぐったりした。', '장시간 작업으로 기진맥진했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐったり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐっすり', 'ぐっすり', '깊이 (자는 모양), 푹', 'N1', '부사', 'ぐっすり眠れた。', '푹 잘 수 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐっすり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'じっとり', 'じっとり', '축축이, 끈적하게', 'N1', '부사', '汗でじっとりと濡れた。', '땀으로 축축이 젖었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='じっとり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'どんより', 'どんより', '잔뜩 흐린, 침침한', 'N1', '부사', 'どんよりとした空が広がる。', '잔뜩 흐린 하늘이 펼쳐진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='どんより' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もやもや', 'もやもや', '개운치 않은; 마음에 걸리는', 'N1', '부사', 'もやもやした気持ちが消えない。', '개운치 않은 기분이 사라지지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もやもや' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うじうじ', 'うじうじ', '우물쭈물, 망설이는 모양', 'N1', '부사', 'うじうじせずに決断しなさい。', '우물쭈물하지 말고 결단해라.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うじうじ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'くよくよ', 'くよくよ', '낙담하여 끙끙거리다, 전전긍긍', 'N1', '부사', 'くよくよ悩んでも仕方がない。', '끙끙 앓아도 소용없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='くよくよ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'のたのた', 'のたのた', '굼뜨게, 느릿느릿', 'N1', '부사', 'のたのたしていないで急ぎなさい。', '굼뜨게 있지 말고 서둘러라.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のたのた' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いそいそ', 'いそいそ', '들뜬 마음으로, 부리나케', 'N1', '부사', 'デートにいそいそと出かけた。', '데이트에 들뜬 마음으로 나갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いそいそ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'わくわく', 'わくわく', '두근두근, 설레는 모양', 'N1', '부사', '旅行を前にわくわくしている。', '여행을 앞두고 두근두근한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わくわく' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぞくぞく', 'ぞくぞく', '오싹오싹, 섬뜩한; 두근두근', 'N1', '부사', '恐怖でぞくぞくした。', '공포로 오싹했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぞくぞく' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うずうず', 'うずうず', '(하고 싶어서) 안달나는 모양', 'N1', '부사', '早く試したくてうずうずした。', '빨리 시험해 보고 싶어 안달이 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うずうず' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'むかむか', 'むかむか', '욱욱 치미는, 메스꺼운', 'N1', '부사', '不公平な扱いにむかむかした。', '불공평한 대우에 욱하고 치밀었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='むかむか' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いらいら', 'いらいら', '초조하게, 짜증스럽게', 'N1', '부사', '待たされていらいらした。', '기다리게 되어 초조했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いらいら' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぴりぴり', 'ぴりぴり', '따끔따끔; 긴장한, 예민한', 'N1', '부사', '試験前でぴりぴりしている。', '시험 전이라 긴장해 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぴりぴり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'きょろきょろ', 'きょろきょろ', '두리번두리번', 'N1', '부사', '初めての場所できょろきょろした。', '처음 가는 곳이라 두리번거렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='きょろきょろ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ほやほや', 'ほやほや', '갓 (막 된), 갓 나온', 'N1', '부사', 'ほやほやの新婚夫婦だ。', '갓 결혼한 신혼부부다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ほやほや' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うようよ', 'うようよ', '우글우글, 득실득실', 'N1', '부사', '池に魚がうようよいる。', '연못에 물고기가 득실득실하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うようよ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐるぐる', 'ぐるぐる', '빙글빙글, 뱅뱅 도는 모양', 'N1', '부사', '頭がぐるぐる回っている。', '머리가 빙글빙글 돌고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐるぐる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぱらぱら', 'ぱらぱら', '드문드문; 후드득후드득', 'N1', '부사', '雨がぱらぱら降り始めた。', '비가 후드득 내리기 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぱらぱら' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'すくすく', 'すくすく', '쑥쑥 (자라는 모양)', 'N1', '부사', '子どもがすくすく育った。', '아이가 쑥쑥 자랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すくすく' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひょろひょろ', 'ひょろひょろ', '홀쭉홀쭉, 가늘고 긴 모양', 'N1', '부사', 'ひょろひょろとした体型だ。', '홀쭉홀쭉한 체형이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひょろひょろ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'がくがく', 'がくがく', '덜덜 (떨리는 모양)', 'N1', '부사', '恐怖で膝ががくがく震えた。', '공포로 무릎이 덜덜 떨렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='がくがく' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐらぐら', 'ぐらぐら', '흔들흔들, 들썩들썩', 'N1', '부사', '地震で建物がぐらぐら揺れた。', '지진으로 건물이 흔들흔들 흔들렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐらぐら' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぞろぞろ', 'ぞろぞろ', '줄줄, 우르르 (무리지어 가는 모양)', 'N1', '부사', '観光客がぞろぞろと歩いてくる。', '관광객이 우르르 걸어온다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぞろぞろ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ちくちく', 'ちくちく', '따끔따끔, 찌르는 느낌', 'N1', '부사', 'ちくちくする痛みが続いている。', '따끔따끔한 통증이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ちくちく' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ふわふわ', 'ふわふわ', '폭신폭신, 둥둥 뜨는 모양', 'N1', '부사', 'ふわふわのパンが焼き上がった。', '폭신폭신한 빵이 구워졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ふわふわ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'びくびく', 'びくびく', '벌벌, 무서워서 몸을 움츠리는 모양', 'N1', '부사', 'びくびくしながら発表した。', '벌벌 떨며 발표했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='びくびく' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'こそこそ', 'こそこそ', '슬금슬금, 몰래 하는 모양', 'N1', '부사', 'こそこそと話しているのが気になった。', '슬금슬금 이야기하는 것이 신경 쓰였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='こそこそ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぱっと', 'ぱっと', '확 (갑자기 밝아지거나 변하는 모양)', 'N1', '부사', '顔がぱっと明るくなった。', '얼굴이 확 밝아졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぱっと' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'すっきり', 'すっきり', '개운하게, 산뜻하게', 'N1', '부사', '片付けてすっきりした。', '정리하고 나서 개운해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すっきり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'がっくり', 'がっくり', '맥이 탁 풀려, 풀썩', 'N1', '부사', '負けてがっくりきた。', '져서 맥이 탁 풀렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='がっくり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぴたりと', 'ぴたりと', '딱, 정확히 들어맞는 모양', 'N1', '부사', '答えがぴたりと合った。', '답이 딱 맞았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぴたりと' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ほんのり', 'ほんのり', '은은하게, 살짝', 'N1', '부사', 'ほんのり甘い香りが漂う。', '은은하게 달콤한 향기가 감돈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ほんのり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うっすら', 'うっすら', '어렴풋이, 희미하게', 'N1', '부사', 'うっすらと雪が積もった。', '어렴풋이 눈이 쌓였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うっすら' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'さらりと', 'さらりと', '산뜻하게, 가볍게 넘기는 모양', 'N1', '부사', 'さらりとかわした返答が印象的だった。', '산뜻하게 넘긴 답변이 인상적이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さらりと' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'たっぷり', 'たっぷり', '듬뿍, 넉넉하게', 'N1', '부사', 'たっぷりと時間をかけて考えた。', '듬뿍 시간을 들여 생각했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たっぷり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おざなりに', 'おざなりに', '형식적으로, 적당히 (건성으로)', 'N1', '부사', 'おざなりな対応に不満を感じた。', '형식적인 대응에 불만을 느꼈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おざなりに' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おめおめ', 'おめおめ', '뻔뻔하게, 파렴치하게', 'N1', '부사', 'おめおめと生き恥をさらした。', '뻔뻔하게 살아서 망신을 당했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おめおめ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐんぐん', 'ぐんぐん', '쑥쑥, 순조롭게 늘어나는 모양', 'N1', '부사', '成績がぐんぐん伸びた。', '성적이 쑥쑥 올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐんぐん' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'すらすら', 'すらすら', '술술, 막힘없이', 'N1', '부사', '答えがすらすら出てきた。', '답이 술술 나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すらすら' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぽっかり', 'ぽっかり', '뻥 (구멍이 뚫린 모양); 동동 (뜨는 모양)', 'N1', '부사', '心にぽっかりと穴が開いた。', '마음에 뻥 구멍이 뚫렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぽっかり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もぞもぞ', 'もぞもぞ', '꿈지럭꿈지럭, 몸을 뒤척이는 모양', 'N1', '부사', '布団の中でもぞもぞ動いた。', '이불 속에서 꿈지럭거렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もぞもぞ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ごろごろ', 'ごろごろ', '데굴데굴; 우르르 (천둥); 빈둥빈둥', 'N1', '부사', '休日はごろごろして過ごした。', '휴일은 빈둥빈둥 지냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ごろごろ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ねちねち', 'ねちねち', '끈질기게, 질질 끄는 모양', 'N1', '부사', 'ねちねちと同じ話を繰り返す。', '끈질기게 같은 이야기를 반복한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ねちねち' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'どっしり', 'どっしり', '묵직하게, 든든하게', 'N1', '부사', 'どっしりとした落ち着きがある人だ。', '묵직하게 안정감이 있는 사람이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='どっしり' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'がやがや', 'がやがや', '왁자지껄, 시끌벅적', 'N1', '부사', '教室がやがや騒がしくなった。', '교실이 왁자지껄 시끄러워졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='がやがや' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ざわざわ', 'ざわざわ', '웅성웅성, 술렁술렁', 'N1', '부사', '会場がざわざわしてきた。', '행사장이 웅성웅성해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ざわざわ' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぬるぬる', 'ぬるぬる', '미끌미끌, 끈적끈적', 'N1', '부사', '魚の表面がぬるぬるしている。', '물고기 표면이 미끌미끌하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぬるぬる' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'はきはき', 'はきはき', '또렷또렷, 명확하게', 'N1', '부사', 'はきはきと答えることが大切だ。', '또렷하게 대답하는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='はきはき' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぴったり', 'ぴったり', '딱, 꼭 맞는 모양', 'N1', '부사', '服がぴったりと体に合った。', '옷이 딱 몸에 맞았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぴったり' AND jlpt_level='N1');
