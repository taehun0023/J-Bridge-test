-- encoding: UTF-8
-- N2 語彙シード batch 13 (131語)
-- テーマ: 抽象概念・性質・状態・評価・程度 (명사・な형용사 중심)
-- 作成日: 2026-06-25
-- 중복제거: n2_vocab_words.txt 기존 1007語와 완전 대조 완료, 신규 단어만 수록
-- 読み確認: 標準辞書準拠
-- DB 적용: 별도 psql -f UTF-8 명령으로 실행

-- ============================================================
-- 抽象名詞・概念 (Abstract Nouns / Concepts) — 52語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '本質', 'ほんしつ', '본질', 'N2', '명사', '問題の本質を見極める。', '문제의 본질을 파악하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='本質' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '特性', 'とくせい', '특성', 'N2', '명사', '素材の特性を活かした設計だ。', '소재의 특성을 살린 설계이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='特性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '特質', 'とくしつ', '특질, 특징적 성질', 'N2', '명사', '日本語の特質を理解する。', '일본어의 특질을 이해하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='特質' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '性質', 'せいしつ', '성질, 성격', 'N2', '명사', '物質の性質を調べる実験だ。', '물질의 성질을 조사하는 실험이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='性質' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '本来', 'ほんらい', '본래, 원래', 'N2', '명사', '本来の目的に立ち返る。', '본래의 목적으로 돌아가다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='本来' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '様相', 'ようそう', '양상, 모습', 'N2', '명사', '事態は新たな様相を呈した。', '사태는 새로운 양상을 띠었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='様相' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実体', 'じったい', '실체', 'N2', '명사', '噂の実体を確かめる。', '소문의 실체를 확인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実体' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '核心', 'かくしん', '핵심', 'N2', '명사', '議論の核心に触れる。', '논의의 핵심에 닿다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='核心' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '要点', 'ようてん', '요점', 'N2', '명사', '話の要点をまとめる。', '이야기의 요점을 정리하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='要点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '要素', 'ようそ', '요소', 'N2', '명사', '成功に必要な要素を挙げる。', '성공에 필요한 요소를 열거하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='要素' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '側面', 'そくめん', '측면, 면', 'N2', '명사', '問題の別の側面を考える。', '문제의 다른 측면을 생각하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='側面' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '方向性', 'ほうこうせい', '방향성', 'N2', '명사', 'プロジェクトの方向性を決める。', '프로젝트의 방향성을 결정하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='方向性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '可能性', 'かのうせい', '가능성', 'N2', '명사', '成功の可能性は高い。', '성공 가능성은 높다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='可能性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '必然性', 'ひつぜんせい', '필연성', 'N2', '명사', '変化の必然性を説く。', '변화의 필연성을 설명하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='必然性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '重要性', 'じゅうようせい', '중요성', 'N2', '명사', '教育の重要性を訴える。', '교육의 중요성을 호소하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='重要性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '有効性', 'ゆうこうせい', '유효성', 'N2', '명사', '治療法の有効性を検証する。', '치료법의 유효성을 검증하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='有効性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '一貫性', 'いっかんせい', '일관성', 'N2', '명사', '政策に一貫性がない。', '정책에 일관성이 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一貫性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '妥当性', 'だとうせい', '타당성', 'N2', '명사', '評価の妥当性を問う。', '평가의 타당성을 묻다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='妥当性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '客観性', 'きゃっかんせい', '객관성', 'N2', '명사', '報告書の客観性を保つ。', '보고서의 객관성을 유지하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='客観性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '透明性', 'とうめいせい', '투명성', 'N2', '명사', '行政の透明性を高める。', '행정의 투명성을 높이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='透明性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '信憑性', 'しんぴょうせい', '신빙성', 'N2', '명사', '情報の信憑性を確かめる。', '정보의 신빙성을 확인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='信憑性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公正', 'こうせい', '공정함', 'N2', '명사', '公正な審査が求められる。', '공정한 심사가 요구된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公正' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公益', 'こうえき', '공익', 'N2', '명사', '公益のために働く。', '공익을 위해 일하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公益' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '倫理', 'りんり', '윤리', 'N2', '명사', '医療倫理に関わる問題だ。', '의료 윤리에 관한 문제이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='倫理' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '道徳', 'どうとく', '도덕', 'N2', '명사', '道徳的な判断が必要だ。', '도덕적인 판단이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='道徳' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '使命感', 'しめいかん', '사명감', 'N2', '명사', '強い使命感を持って仕事に臨む。', '강한 사명감을 가지고 일에 임하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='使命感' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '危機感', 'ききかん', '위기감', 'N2', '명사', '危機感を持って対応する。', '위기감을 가지고 대응하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='危機感' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '達成感', 'たっせいかん', '성취감', 'N2', '명사', '目標を達成した後の達成感は格別だ。', '목표를 달성한 후의 성취감은 각별하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='達成感' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '充実感', 'じゅうじつかん', '충실감, 보람', 'N2', '명사', '仕事に充実感を感じる。', '일에 보람을 느끼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='充実感' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '程度', 'ていど', '정도', 'N2', '명사', 'ある程度の余裕が必要だ。', '어느 정도의 여유가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='程度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '現状', 'げんじょう', '현상, 현재 상태', 'N2', '명사', '現状を打破するための施策が必要だ。', '현상을 타파하기 위한 시책이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='現状' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '傾き', 'かたむき', '기울기, 편향', 'N2', '명사', '経営の傾きが気になる。', '경영의 기울기가 걱정된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傾き' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '境界', 'きょうかい', '경계', 'N2', '명사', '現実と夢の境界が曖昧になる。', '현실과 꿈의 경계가 모호해지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='境界' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '局面', 'きょくめん', '국면, 상황', 'N2', '명사', '交渉は新たな局面を迎えた。', '협상은 새로운 국면을 맞이했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='局面' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '制約', 'せいやく', '제약, 제한', 'N2', '명사', '予算の制約の中で工夫する。', '예산 제약 속에서 궁리하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='制約' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '影響力', 'えいきょうりょく', '영향력', 'N2', '명사', '社会的な影響力を持つ人物だ。', '사회적인 영향력을 가진 인물이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='影響力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '説得力', 'せっとくりょく', '설득력', 'N2', '명사', '説得力のある説明が求められる。', '설득력 있는 설명이 요구된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='説得力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '創造性', 'そうぞうせい', '창조성', 'N2', '명사', '創造性を育む教育が重要だ。', '창조성을 기르는 교육이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='創造性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '独自性', 'どくじせい', '독자성', 'N2', '명사', '商品の独自性をアピールする。', '상품의 독자성을 어필하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='独自性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '多面性', 'ためんせい', '다면성', 'N2', '명사', '人間の多面性を理解する。', '인간의 다면성을 이해하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='多面性' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '共通点', 'きょうつうてん', '공통점', 'N2', '명사', '二つの案の共通点を探る。', '두 안의 공통점을 찾다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='共通点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '相違点', 'そういてん', '상이점, 차이점', 'N2', '명사', '二つの案の相違点を整理する。', '두 안의 차이점을 정리하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相違点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '類似点', 'るいじてん', '유사점', 'N2', '명사', '二つの事件に類似点がある。', '두 사건에 유사점이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='類似点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '優先度', 'ゆうせんど', '우선도, 우선 순위', 'N2', '명사', '優先度の高い課題から取り組む。', '우선도가 높은 과제부터 착수하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優先度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '完成度', 'かんせいど', '완성도', 'N2', '명사', '作品の完成度を高める。', '작품의 완성도를 높이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='完成度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '品格', 'ひんかく', '품격', 'N2', '명사', '品格のある振る舞いをする。', '품격 있는 행동을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='品格' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '品質', 'ひんしつ', '품질', 'N2', '명사', '品質の向上に取り組む。', '품질 향상에 힘쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='品質' AND jlpt_level='N2');

-- ============================================================
-- な형용사 (な-Adjectives: 性質・状態・評価) — 52語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '明白', 'めいはく', '명백함', 'N2', 'な형용사', '事実は明白だ。', '사실은 명백하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='明白' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '明瞭', 'めいりょう', '명료함, 명확함', 'N2', 'な형용사', '説明が明瞭でわかりやすい。', '설명이 명료하여 이해하기 쉽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='明瞭' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '率直', 'そっちょく', '솔직함', 'N2', 'な형용사', '率直な意見を聞かせてください。', '솔직한 의견을 들려주세요.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='率直' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '緻密', 'ちみつ', '치밀함', 'N2', 'な형용사', '緻密な計算に基づいた計画だ。', '치밀한 계산에 기반한 계획이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緻密' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '綿密', 'めんみつ', '면밀함', 'N2', 'な형용사', '綿密な調査を行った。', '면밀한 조사를 실시했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='綿密' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '精巧', 'せいこう', '정교함', 'N2', 'な형용사', '精巧な機械の仕組みに感心した。', '정교한 기계의 구조에 감탄했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精巧' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '卓越', 'たくえつ', '탁월함', 'N2', 'な형용사', '卓越した技術を持つ職人だ。', '탁월한 기술을 가진 장인이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卓越' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '優秀', 'ゆうしゅう', '우수함', 'N2', 'な형용사', '優秀な成績で卒業した。', '우수한 성적으로 졸업했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優秀' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '優良', 'ゆうりょう', '우량함, 우수함', 'N2', 'な형용사', '優良な企業として評価された。', '우량 기업으로 평가받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優良' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '良好', 'りょうこう', '양호함', 'N2', 'な형용사', '健康状態は良好だ。', '건강 상태는 양호하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='良好' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '健康的', 'けんこうてき', '건강함', 'N2', 'な형용사', '健康的な食生活を心がける。', '건강한 식생활을 유의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='健康的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '論理的', 'ろんりてき', '논리적임', 'N2', 'な형용사', '論理的に考える訓練をする。', '논리적으로 생각하는 훈련을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論理的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '客観的', 'きゃっかんてき', '객관적임', 'N2', 'な형용사', '客観的な視点で評価する。', '객관적인 시점으로 평가하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='客観的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '主観的', 'しゅかんてき', '주관적임', 'N2', 'な형용사', '主観的な意見に偏りがちだ。', '주관적인 의견으로 치우치기 쉽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主観的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抽象的', 'ちゅうしょうてき', '추상적임', 'N2', 'な형용사', '抽象的な説明ではなく具体例が欲しい。', '추상적인 설명이 아니라 구체적인 예가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抽象的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '典型的', 'てんけいてき', '전형적임', 'N2', 'な형용사', '典型的な失敗パターンだ。', '전형적인 실패 패턴이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='典型的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '多彩', 'たさい', '다채로움', 'N2', 'な형용사', '多彩なプログラムを用意した。', '다채로운 프로그램을 준비했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='多彩' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '明快', 'めいかい', '명쾌함', 'N2', 'な형용사', '明快な答えが得られた。', '명쾌한 답을 얻었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='明快' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '冷静', 'れいせい', '냉정함, 침착함', 'N2', 'な형용사', '冷静に状況を判断する。', '냉정하게 상황을 판단하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冷静' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '真剣', 'しんけん', '진지함', 'N2', 'な형용사', '真剣に取り組む姿勢が大切だ。', '진지하게 임하는 자세가 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='真剣' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不当', 'ふとう', '부당함', 'N2', 'な형용사', '不当な扱いを受けた。', '부당한 처우를 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不当' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '一方的', 'いっぽうてき', '일방적임', 'N2', 'な형용사', '一方的な主張は受け入れられない。', '일방적인 주장은 받아들여지지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一方的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '相互的', 'そうごてき', '상호적임', 'N2', 'な형용사', '相互的な理解が必要だ。', '상호적인 이해가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相互的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '本格的', 'ほんかくてき', '본격적임', 'N2', 'な형용사', '本格的な調査が始まった。', '본격적인 조사가 시작되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='本格的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '本質的', 'ほんしつてき', '본질적임', 'N2', 'な형용사', '本質的な問題に向き合う。', '본질적인 문제에 마주하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='本質的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '潜在的', 'せんざいてき', '잠재적임', 'N2', 'な형용사', '潜在的なリスクを評価する。', '잠재적인 리스크를 평가하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='潜在的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実践的', 'じっせんてき', '실천적임', 'N2', 'な형용사', '実践的なスキルを身につける。', '실천적인 스킬을 익히다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実践的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '革新的', 'かくしんてき', '혁신적임', 'N2', 'な형용사', '革新的なアイデアが注目される。', '혁신적인 아이디어가 주목받는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='革新的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '保守的', 'ほしゅてき', '보수적임', 'N2', 'な형용사', '保守的な立場から反対意見が出た。', '보수적인 입장에서 반대 의견이 나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='保守的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '創造的', 'そうぞうてき', '창조적임', 'N2', 'な형용사', '創造的な発想を大切にする。', '창조적인 발상을 소중히 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='創造的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '能動的', 'のうどうてき', '능동적임', 'N2', 'な형용사', '能動的に課題を発見する姿勢が大切だ。', '능동적으로 과제를 발견하는 자세가 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='能動的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '総合的', 'そうごうてき', '종합적임', 'N2', 'な형용사', '総合的な観点から判断する。', '종합적인 관점에서 판단하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='総合的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受動的', 'じゅどうてき', '수동적임', 'N2', 'な형용사', '受動的な姿勢では成長しない。', '수동적인 자세로는 성장하지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受動的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '意図的', 'いとてき', '의도적임', 'N2', 'な형용사', '意図的な誤解を生じさせる表現だ。', '의도적으로 오해를 불러일으키는 표현이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意図的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感情的', 'かんじょうてき', '감정적임', 'N2', 'な형용사', '感情的にならず冷静に話し合う。', '감정적이 되지 않고 냉정하게 이야기를 나누다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感情的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '理性的', 'りせいてき', '이성적임', 'N2', 'な형용사', '理性的な判断が求められる場面だ。', '이성적인 판단이 요구되는 상황이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='理性的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感覚的', 'かんかくてき', '감각적임', 'N2', 'な형용사', '感覚的なデザインに惹かれる。', '감각적인 디자인에 끌리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感覚的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '直接的', 'ちょくせつてき', '직접적임', 'N2', 'な형용사', '直接的な表現で伝える。', '직접적인 표현으로 전달하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='直接的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '間接的', 'かんせつてき', '간접적임', 'N2', 'な형용사', '間接的なアプローチが有効な場合もある。', '간접적인 접근이 유효한 경우도 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='間接的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '形式的', 'けいしきてき', '형식적임', 'N2', 'な형용사', '形式的な謝罪では納得できない。', '형식적인 사과로는 납득할 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='形式的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '内面的', 'ないめんてき', '내면적임', 'N2', 'な형용사', '内面的な成長が大切だ。', '내면적인 성장이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='内面的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '外面的', 'がいめんてき', '외면적임, 외형적임', 'N2', 'な형용사', '外面的な変化より内面が重要だ。', '외면적인 변화보다 내면이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='外面的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '全般的', 'ぜんぱんてき', '전반적임', 'N2', 'な형용사', '全般的な見直しが必要だ。', '전반적인 재검토가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='全般的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '相対的', 'そうたいてき', '상대적임', 'N2', 'な형용사', '相対的な評価では不公平になる。', '상대적인 평가로는 불공평해진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相対的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絶対的', 'ぜったいてき', '절대적임', 'N2', 'な형용사', '絶対的な基準を設けるのは難しい。', '절대적인 기준을 마련하기는 어렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絶対的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '部分的', 'ぶぶんてき', '부분적임', 'N2', 'な형용사', '部分的な修正で対応する。', '부분적인 수정으로 대응하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='部分的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暫定的', 'ざんていてき', '잠정적임', 'N2', 'な형용사', '暫定的な措置として実施する。', '잠정적인 조치로서 실시하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暫定的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '独断的', 'どくだんてき', '독단적임', 'N2', 'な형용사', '独断的な決定は組織を乱す。', '독단적인 결정은 조직을 혼란스럽게 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='独断的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '協調的', 'きょうちょうてき', '협조적임', 'N2', 'な형용사', '協調的な姿勢で交渉に臨む。', '협조적인 자세로 협상에 임하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='協調的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '建設的', 'けんせつてき', '건설적임', 'N2', 'な형용사', '建設的な批判を歓迎する。', '건설적인 비판을 환영하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='建設的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '破壊的', 'はかいてき', '파괴적임', 'N2', 'な형용사', '破壊的なイノベーションが市場を変えた。', '파괴적인 혁신이 시장을 바꿨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='破壊的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '批判的', 'ひはんてき', '비판적임', 'N2', 'な형용사', '批判的な目で情報を吟味する。', '비판적인 눈으로 정보를 검토하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='批判的' AND jlpt_level='N2');

-- ============================================================
-- 程度副詞 (Degree Adverbs) — 2語 (기존 미수록분만)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '相当', 'そうとう', '상당히, 꽤', 'N2', '부사', 'この仕事は相当難しい。', '이 일은 상당히 어렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相当' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '甚だ', 'はなはだ', '매우, 대단히', 'N2', '부사', '甚だ遺憾に思う。', '매우 유감스럽게 생각한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='甚だ' AND jlpt_level='N2');

-- ============================================================
-- い형용사 (い-Adjectives: 評価・状態) — 7語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '根深い', 'ねぶかい', '뿌리 깊다, 뿌리 깊이 자리하다', 'N2', 'い형용사', '差別意識は根深い問題だ。', '차별 의식은 뿌리 깊은 문제이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根深い' AND jlpt_level='N2');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '頑強い', 'がんじょうい', '튼튼하다, 강인하다', 'N2', 'い형용사', '頑強い意志で困難を乗り越えた。', '강인한 의지로 어려움을 극복했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頑強い' AND jlpt_level='N2');

-- ============================================================
-- 状態・評価名詞 追加 (Additional State / Evaluation Nouns) — 14語
-- ============================================================

-- ============================================================
-- 追加語彙 (Additional Vocabulary to reach 131 words) — 28語
-- ============================================================

-- ============================================================
-- 補足語彙 (Supplementary — reaching 131 words) — 28語
-- N2 순수 어휘 (문법패턴 없음), 기존 1007語 미포함 확인
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '品位', 'ひんい', '품위', 'N2', '명사', '品位のある言動を心がける。', '품위 있는 언행을 유의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='品位' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '風格', 'ふうかく', '풍격, 풍채', 'N2', '명사', '長年の経験が風格を生み出す。', '오랜 경험이 풍격을 만들어 낸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='風格' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '情緒', 'じょうちょ', '정서, 정취', 'N2', '명사', '日本の情緒を感じる街並みだ。', '일본의 정서를 느낄 수 있는 거리이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='情緒' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '雰囲気', 'ふんいき', '분위기', 'N2', '명사', '会議室の雰囲気が重苦しい。', '회의실 분위기가 무겁다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雰囲気' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ニュアンス', 'にゅあんす', '뉘앙스', 'N2', '명사', '言葉のニュアンスを正確に伝える。', '말의 뉘앙스를 정확하게 전달하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ニュアンス' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '示唆', 'しさ', '시사, 암시', 'N2', '명사', '研究結果は重要な示唆を与えた。', '연구 결과는 중요한 시사를 주었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='示唆' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '兆候', 'ちょうこう', '징후', 'N2', '명사', '不況の兆候が現れ始めた。', '불황의 징후가 나타나기 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='兆候' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '前兆', 'ぜんちょう', '전조', 'N2', '명사', '大地震の前兆を感じた。', '대지진의 전조를 느꼈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='前兆' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '模倣', 'もほう', '모방', 'N2', '명사', '他社の模倣では競争力が生まれない。', '타사 모방으로는 경쟁력이 생기지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='模倣' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '類型', 'るいけい', '유형', 'N2', '명사', '問題を類型に分けて分析する。', '문제를 유형으로 나누어 분석하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='類型' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '原型', 'げんけい', '원형', 'N2', '명사', '現代語の原型をたどる研究だ。', '현대어의 원형을 추적하는 연구이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='原型' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '根底', 'こんてい', '근저, 밑바탕', 'N2', '명사', '問題の根底にある原因を探る。', '문제의 밑바탕에 있는 원인을 탐색하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根底' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '素養', 'そよう', '소양, 교양', 'N2', '명사', '幅広い素養を身につける。', '폭넓은 소양을 갖추다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='素養' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '器量', 'きりょう', '기량, 능력', 'N2', '명사', 'リーダーとしての器量を問われる。', '리더로서의 기량이 시험받다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='器量' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '度量', 'どりょう', '도량', 'N2', '명사', '失敗を許す度量がある。', '실패를 용납하는 도량이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='度量' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '特異', 'とくい', '특이함', 'N2', 'な형용사', '特異な才能を持つ芸術家だ。', '특이한 재능을 가진 예술가이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='特異' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '異質', 'いしつ', '이질적임', 'N2', 'な형용사', '異質な文化が混在している。', '이질적인 문화가 혼재하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='異質' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '均質', 'きんしつ', '균질함', 'N2', 'な형용사', '均質な品質を保つことが難しい。', '균질한 품질을 유지하는 것이 어렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='均質' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '奇妙', 'きみょう', '기묘함', 'N2', 'な형용사', '奇妙な出来事が続いている。', '기묘한 사건이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奇妙' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '奇抜', 'きばつ', '기발함', 'N2', 'な형용사', '奇抜なアイデアが注目された。', '기발한 아이디어가 주목을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奇抜' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '克明', 'こくめい', '극명함, 세밀함', 'N2', 'な형용사', '克明な記録が残されている。', '극명한 기록이 남아 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='克明' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '詳細', 'しょうさい', '상세함', 'N2', 'な형용사', '詳細な報告書を提出する。', '상세한 보고서를 제출하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='詳細' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '精緻', 'せいち', '정치함, 정밀하고 세밀함', 'N2', 'な형용사', '精緻な作業を要する技術だ。', '정치한 작업이 필요한 기술이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精緻' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大まか', 'おおまか', '대충함, 대략적임', 'N2', 'な형용사', '大まかな計画でも構わない。', '대략적인 계획이라도 괜찮다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大まか' AND jlpt_level='N2');
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '分かりやすい', 'わかりやすい', '이해하기 쉽다, 알기 쉽다', 'N2', 'い형용사', '分かりやすい説明を心がける。', '알기 쉬운 설명을 유의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分かりやすい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '頼りない', 'たよりない', '믿음직하지 못하다, 의지가 되지 않는다', 'N2', 'い형용사', '頼りない返事しかもらえなかった。', '믿음직하지 못한 대답만 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頼りない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おおよそ', 'おおよそ', '대략, 대체로', 'N2', '부사', 'おおよその費用を見積もる。', '대략적인 비용을 견적하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おおよそ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '成り立ち', 'なりたち', '성립, 유래', 'N2', '명사', '言葉の成り立ちを調べる。', '단어의 유래를 조사하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='成り立ち' AND jlpt_level='N2');