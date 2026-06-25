-- encoding: UTF-8
-- N2 語彙シード batch 7 (120語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: 感情・性格・人間関係・思考・コミュニケーション + 複合動詞/自他動詞
-- 除外済み(既存リスト): 懸念, 戸惑う, 慌てる, 悩む, 恐れる, 恐ろしい, 恥ずかしい, 悔しい,
--   情けない, 憎らしい, 羨ましい, 頼もしい, 惜しい, 煩わしい, 素直, 穏やか, 丁寧, 曖昧,
--   思い込み, 思い込む, 思わず, 共感する, 振る舞い, 振る舞う, 振り返る, 打ち込む,
--   乗り越える, 取り組み, 取り組む, 揺らぐ, 揺れる, 追い込む, 築く, 妨げる,
--   妥協する, 断る, 従う, 招く, 一致する, 互いに, 配慮, 納得, 余裕, 気持ち等
-- 読み確認: 標準辞書(大辞泉・新明解)準拠

-- ============================================================
-- 感情・心理 (Emotions / Psychology) — 명사 22語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不安', 'ふあん', '불안', 'N2', '명사', '将来への不安を感じる。', '미래에 대한 불안을 느끼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不安' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不満', 'ふまん', '불만', 'N2', '명사', '職場への不満が募る。', '직장에 대한 불만이 쌓이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不満' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '後悔', 'こうかい', '후회', 'N2', '명사', 'あの時の選択を後悔している。', '그때의 선택을 후회하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='後悔' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感動', 'かんどう', '감동', 'N2', '명사', '映画を見て感動した。', '영화를 보고 감동했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感動' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感謝', 'かんしゃ', '감사', 'N2', '명사', '心から感謝の気持ちを伝えた。', '마음으로부터 감사의 마음을 전했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感謝' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感情', 'かんじょう', '감정', 'N2', '명사', '感情をうまくコントロールする。', '감정을 잘 조절하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感情' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '喜び', 'よろこび', '기쁨', 'N2', '명사', '成功の喜びを分かち合う。', '성공의 기쁨을 나누다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喜び' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悲しみ', 'かなしみ', '슬픔', 'N2', '명사', '別れの悲しみを乗り越える。', '이별의 슬픔을 극복하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悲しみ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '苦しみ', 'くるしみ', '괴로움', 'N2', '명사', '苦しみを誰にも言えなかった。', '괴로움을 아무에게도 말할 수 없었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='苦しみ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '怒り', 'いかり', '분노', 'N2', '명사', '怒りを抑えることができなかった。', '분노를 억누를 수 없었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='怒り' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '焦り', 'あせり', '초조함, 조급함', 'N2', '명사', '締め切りが近づき焦りを感じた。', '마감이 다가와 초조함을 느꼈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焦り' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '驚き', 'おどろき', '놀람', 'N2', '명사', '思いがけない驚きを受けた。', '뜻밖의 놀라움을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='驚き' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恥', 'はじ', '수치, 부끄러움', 'N2', '명사', '恥をかかせないように気をつける。', '수치를 당하지 않도록 주의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恥' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '孤独', 'こどく', '고독', 'N2', '명사', '都会で孤独を感じることがある。', '도시에서 고독을 느낄 때가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='孤独' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '緊張', 'きんちょう', '긴장', 'N2', '명사', '発表前に緊張が高まる。', '발표 전에 긴장이 고조되다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緊張' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '安堵', 'あんど', '안도', 'N2', '명사', '無事と知って安堵した。', '무사하다는 것을 알고 안도했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安堵' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '憧れ', 'あこがれ', '동경', 'N2', '명사', '子どもの頃からの憧れを実現した。', '어릴 때부터의 동경을 실현했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憧れ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '嫉妬', 'しっと', '질투', 'N2', '명사', '友人の成功に嫉妬してしまった。', '친구의 성공에 질투해 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嫉妬' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '葛藤', 'かっとう', '갈등', 'N2', '명사', '内心で葛藤を抱えている。', '마음속으로 갈등을 안고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='葛藤' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '劣等感', 'れっとうかん', '열등감', 'N2', '명사', '成績への劣等感をなくしたい。', '성적에 대한 열등감을 없애고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='劣等感' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '優越感', 'ゆうえつかん', '우월감', 'N2', '명사', '過度な優越感は人を遠ざける。', '지나친 우월감은 사람을 멀리하게 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優越感' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '罪悪感', 'ざいあくかん', '죄책감', 'N2', '명사', '断ったことへの罪悪感が残る。', '거절한 것에 대한 죄책감이 남는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='罪悪感' AND jlpt_level='N2');

-- ============================================================
-- 性格・人柄 (Character / Personality) — 명사·な형용사 18語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '几帳面', 'きちょうめん', '꼼꼼함, 빈틈없음', 'N2', 'な형용사', '彼は几帳面な性格で仕事が丁寧だ。', '그는 꼼꼼한 성격으로 일이 정확하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='几帳面' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大雑把', 'おおざっぱ', '대충대충함, 성기다', 'N2', 'な형용사', '大雑把な計画では失敗しやすい。', '대충 짠 계획으로는 실패하기 쉽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大雑把' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気さく', 'きさく', '털털함, 허물없음', 'N2', 'な형용사', '気さくな人柄で誰とでも仲良くなる。', '털털한 성격으로 누구와도 잘 어울린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気さく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '真面目', 'まじめ', '성실함, 진지함', 'N2', 'な형용사', '真面目に仕事に取り組む姿勢が大切だ。', '성실하게 일에 임하는 자세가 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='真面目' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '誠実', 'せいじつ', '성실, 진실됨', 'N2', 'な형용사', '誠実な態度で交渉に臨む。', '성실한 태도로 협상에 임하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誠実' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '謙虚', 'けんきょ', '겸손', 'N2', 'な형용사', '謙虚な姿勢が成長につながる。', '겸손한 자세가 성장으로 이어진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謙虚' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '頑固', 'がんこ', '완고함, 고집스러움', 'N2', 'な형용사', '頑固な父はなかなか意見を変えない。', '완고한 아버지는 좀처럼 의견을 바꾸지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頑固' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '強引', 'ごういん', '강압적, 억지스러움', 'N2', 'な형용사', '強引なやり方では信頼を失う。', '강압적인 방식으로는 신뢰를 잃는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='強引' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慎み深い', 'つつしみぶかい', '조심성 깊다, 언행이 신중하다', 'N2', 'い형용사', '慎み深い言動が周囲の信頼を集める。', '신중한 언행이 주위의 신뢰를 모은다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慎み深い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大胆', 'だいたん', '대담함', 'N2', 'な형용사', '大胆な発想が新しい価値を生む。', '대담한 발상이 새로운 가치를 낳는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大胆' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '臆病', 'おくびょう', '겁쟁이, 소심함', 'N2', 'な형용사', '臆病な性格を直したい。', '소심한 성격을 고치고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='臆病' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気前', 'きまえ', '씀씀이, 인심', 'N2', '명사', '気前よく奢ってくれる先輩だ。', '인심 좋게 사줘서 고마운 선배다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気前' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '根気', 'こんき', '끈기, 인내심', 'N2', '명사', '根気のいる作業を続けた。', '끈기가 필요한 작업을 계속했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根気' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '意地', 'いじ', '고집, 오기', 'N2', '명사', '意地を張って謝らない。', '고집을 부려 사과하지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='意地' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '器用', 'きよう', '손재주가 있음, 능숙함', 'N2', 'な형용사', '器用な人は何でも上手くこなす。', '손재주 있는 사람은 무엇이든 잘 해낸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='器用' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不器用', 'ぶきよう', '손재주가 없음, 서툼', 'N2', 'な형용사', '不器用だが努力家だ。', '서툴지만 노력가다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不器用' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '向上心', 'こうじょうしん', '향상심', 'N2', '명사', '向上心が高い社員を評価する。', '향상심이 높은 직원을 평가하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='向上心' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '責任感', 'せきにんかん', '책임감', 'N2', '명사', '強い責任感を持って仕事をする。', '강한 책임감을 가지고 일하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='責任感' AND jlpt_level='N2');

-- ============================================================
-- 人間関係 (Human Relations) — 명사 18語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '信頼', 'しんらい', '신뢰', 'N2', '명사', '長い年月をかけて信頼を築く。', '오랜 세월을 들여 신뢰를 쌓다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='信頼' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絆', 'きずな', '유대, 인연', 'N2', '명사', '困難を乗り越えて絆が深まった。', '어려움을 극복하며 유대가 깊어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絆' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '摩擦', 'まさつ', '마찰, 불화', 'N2', '명사', '意見の違いから摩擦が生じた。', '의견 차이로 마찰이 생겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='摩擦' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '対立', 'たいりつ', '대립', 'N2', '명사', '両者の対立が激しくなった。', '양자의 대립이 격해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='対立' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '和解', 'わかい', '화해', 'N2', '명사', '長い対立の末に和解した。', '긴 대립 끝에 화해했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='和解' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '誤解', 'ごかい', '오해', 'N2', '명사', '誤解が解けてほっとした。', '오해가 풀려 안도했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誤解' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '遠慮', 'えんりょ', '사양, 조심함', 'N2', '명사', '遠慮なく意見を言ってください。', '사양 말고 의견을 말해 주세요.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遠慮' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '妥協', 'だきょう', '타협', 'N2', '명사', 'お互いに妥協点を探る。', '서로 타협점을 찾다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='妥協' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '連帯', 'れんたい', '연대', 'N2', '명사', '困難な状況で連帯感が生まれた。', '어려운 상황에서 연대감이 생겨났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='連帯' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '敵意', 'てきい', '적의, 적대감', 'N2', '명사', '敵意のある視線を向けられた。', '적의가 담긴 시선을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='敵意' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '親しみ', 'したしみ', '친근감', 'N2', '명사', '初めて会った人にも親しみを感じた。', '처음 만난 사람에게도 친근감을 느꼈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='親しみ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思いやり', 'おもいやり', '배려, 동정심', 'N2', '명사', '思いやりのある言葉をかける。', '배려 있는 말을 건네다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思いやり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気遣い', 'きづかい', '배려, 신경 씀', 'N2', '명사', '細かな気遣いができる人だ。', '세심한 배려를 할 수 있는 사람이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気遣い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '打ち解け', 'うちとけ', '마음을 터놓음', 'N2', '명사', '彼とはすぐに打ち解けることができた。', '그와는 곧 마음을 터놓을 수 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち解け' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仲裁', 'ちゅうさい', '중재', 'N2', '명사', '喧嘩の仲裁に入った。', '싸움의 중재에 나섰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仲裁' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '軋轢', 'あつれき', '불화, 알력', 'N2', '명사', '部門間の軋轢が深刻化している。', '부서 간 불화가 심각해지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軋轢' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見栄', 'みえ', '허영, 체면', 'N2', '명사', '見栄を張ることをやめた。', '허영을 부리는 것을 그만뒀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見栄' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '建て前', 'たてまえ', '건건, 겉으로 내세우는 원칙', 'N2', '명사', '建て前と本音のギャップに悩む。', '겉으로 내세우는 것과 본심의 차이에 고민하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='建て前' AND jlpt_level='N2');

-- ============================================================
-- 思考・認識 (Thinking / Perception) — 명사·な형용사 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '推測', 'すいそく', '추측', 'N2', '명사', '状況から推測するしかない。', '상황으로 추측할 수밖에 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='推測' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '判断力', 'はんだんりょく', '판단력', 'N2', '명사', '危機の時こそ判断力が問われる。', '위기 때일수록 판단력이 요구된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='判断力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '先入観', 'せんにゅうかん', '선입관', 'N2', '명사', '先入観を捨てて物事を見る。', '선입관을 버리고 사물을 보다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='先入観' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '固定観念', 'こていかんねん', '고정관념', 'N2', '명사', '固定観念にとらわれず発想する。', '고정관념에 얽매이지 않고 발상하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='固定観念' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '直感', 'ちょっかん', '직감', 'N2', '명사', '直感を信じて行動する。', '직감을 믿고 행동하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='直感' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '洞察', 'どうさつ', '통찰', 'N2', '명사', '深い洞察力を持つ人だ。', '깊은 통찰력을 가진 사람이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='洞察' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '執着', 'しゅうちゃく', '집착', 'N2', '명사', '過去への執着を手放す。', '과거에 대한 집착을 내려놓다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='執着' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い違い', 'おもいちがい', '착각, 오해', 'N2', '명사', '思い違いをしていたことに気づいた。', '착각하고 있었다는 것을 깨달았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い違い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '自覚', 'じかく', '자각', 'N2', '명사', '問題の深刻さを自覚する。', '문제의 심각함을 자각하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自覚' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '反省', 'はんせい', '반성', 'N2', '명사', '過ちを反省して前に進む。', '잘못을 반성하고 앞으로 나아가다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反省' AND jlpt_level='N2');

-- ============================================================
-- コミュニケーション (Communication) — 명사·동사 12語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '説得', 'せっとく', '설득', 'N2', '명사', '粘り強い説得が功を奏した。', '끈질긴 설득이 효과를 거뒀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='説得' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '主張', 'しゅちょう', '주장', 'N2', '명사', '自分の主張をはっきり伝える。', '자신의 주장을 분명히 전달하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主張' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '提案', 'ていあん', '제안', 'N2', '명사', '建設的な提案を歓迎する。', '건설적인 제안을 환영하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='提案' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '相談', 'そうだん', '상담, 의논', 'N2', '명사', '困ったことがあれば気軽に相談してください。', '어려운 일이 있으면 편하게 상담해 주세요.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相談' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '口調', 'くちょう', '말투', 'N2', '명사', '穏やかな口調で話す。', '온화한 말투로 이야기하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='口調' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '言い訳', 'いいわけ', '변명', 'N2', '명사', '言い訳ばかりしないで反省しなさい。', '변명만 하지 말고 반성해라.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い訳' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '本音', 'ほんね', '본심, 속마음', 'N2', '명사', '本音を言える相手がいると楽だ。', '속마음을 말할 수 있는 상대가 있으면 편하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='本音' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '言葉遣い', 'ことばづかい', '말씨, 언어 사용', 'N2', '명사', '丁寧な言葉遣いを意識する。', '정중한 말씨를 의식하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言葉遣い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '冗談', 'じょうだん', '농담', 'N2', '명사', '冗談が通じない相手には注意が必要だ。', '농담이 통하지 않는 상대에게는 주의가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冗談' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '謝罪', 'しゃざい', '사죄, 사과', 'N2', '명사', '誠意を持って謝罪する。', '성의를 가지고 사죄하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='謝罪' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '打ち明ける', 'うちあける', '털어놓다, 고백하다', 'N2', '동사', '秘密を親友に打ち明けた。', '비밀을 절친에게 털어놓았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち明ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '言い聞かせる', 'いいきかせる', '타이르다, 납득시키다', 'N2', '동사', '自分に言い聞かせて落ち着いた。', '자신에게 타일러 침착해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い聞かせる' AND jlpt_level='N2');

-- ============================================================
-- 複合動詞 — 他動詞 (Transitive Compound Verbs) 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い切る', 'おもいきる', '결단하다, 마음먹다', 'N2', '동사', '思い切って転職することにした。', '결단을 내려 이직하기로 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い切る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気にかける', 'きにかける', '마음에 두다, 걱정하다', 'N2', '동사', '彼のことをいつも気にかけている。', '그를 언제나 마음에 두고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気にかける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受け止める', 'うけとめる', '받아들이다, 받아내다', 'N2', '동사', '批判を真剣に受け止める。', '비판을 진지하게 받아들이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受け止める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引き受ける', 'ひきうける', '맡다, 수락하다', 'N2', '동사', '難しい仕事を引き受けた。', '어려운 일을 맡았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き受ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '呼び掛ける', 'よびかける', '호소하다, 부르다', 'N2', '동사', '市民に協力を呼び掛けた。', '시민에게 협력을 호소했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='呼び掛ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い描く', 'おもいえがく', '마음속에 그리다, 상상하다', 'N2', '동사', '将来の姿を思い描く。', '미래의 모습을 마음속에 그리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い描く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '言い張る', 'いいはる', '고집하다, 우기다', 'N2', '동사', '自分が正しいと言い張る。', '자신이 옳다고 우기다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い張る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '腹立てる', 'はらたてる', '화내다, 성내다', 'N2', '동사', 'ちょっとしたことで腹立てるな。', '사소한 일로 화내지 마라.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腹立てる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '巻き込む', 'まきこむ', '끌어들이다, 휘말리게 하다', 'N2', '동사', '他人を問題に巻き込まないように注意する。', '타인을 문제에 끌어들이지 않도록 주의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='巻き込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引き止める', 'ひきとめる', '붙잡다, 만류하다', 'N2', '동사', '辞めようとする部下を引き止めた。', '그만두려는 부하를 만류했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き止める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い知る', 'おもいしる', '통감하다, 절실히 깨닫다', 'N2', '동사', '失敗して自分の限界を思い知った。', '실패하여 자신의 한계를 절실히 깨달았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い知る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '言い出す', 'いいだす', '말을 꺼내다, 말하기 시작하다', 'N2', '동사', 'なかなか言い出せずにいた。', '좀처럼 말을 꺼내지 못하고 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '切り出す', 'きりだす', '꺼내다, (어려운 이야기를) 꺼내다', 'N2', '동사', '大事な話をどう切り出すか悩んだ。', '중요한 이야기를 어떻게 꺼낼지 고민했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='切り出す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気を遣う', 'きをつかう', '신경 쓰다, 배려하다', 'N2', '동사', '周りに気を遣いすぎて疲れた。', '주변에 너무 신경 써서 지쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気を遣う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '汲み取る', 'くみとる', '헤아리다, 파악하다', 'N2', '동사', '相手の気持ちを汲み取って行動する。', '상대방의 마음을 헤아려 행동하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汲み取る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '割り切る', 'わりきる', '딱 잘라 결론짓다, 명확히 구분하다', 'N2', '동사', '仕事とプライベートを割り切る。', '일과 개인 생활을 딱 잘라 구분하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='割り切る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見下す', 'みくだす', '깔보다, 얕보다', 'N2', '동사', '人を見下す態度は良くない。', '사람을 깔보는 태도는 좋지 않다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見下す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見習う', 'みならう', '본받다, 배우다', 'N2', '동사', '先輩の仕事ぶりを見習いたい。', '선배의 업무 방식을 본받고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見習う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思いとどまる', 'おもいとどまる', '단념하다, 마음을 돌이키다', 'N2', '동사', '衝動的な行動を思いとどまった。', '충동적인 행동을 단념했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思いとどまる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '打ち解ける', 'うちとける', '마음을 터놓다, 허물없이 지내다', 'N2', '동사', '時間が経つにつれて打ち解けた。', '시간이 지나면서 마음을 터놓게 됐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち解ける' AND jlpt_level='N2');

-- ============================================================
-- 複合動詞 — 自動詞 (Intransitive Compound Verbs) 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '落ち込む', 'おちこむ', '의기소침해지다, 침울해지다', 'N2', '동사', '失敗して深く落ち込んだ。', '실패해서 깊이 침울해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='落ち込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '舞い上がる', 'まいあがる', '들뜨다, 흥분하다', 'N2', '동사', '合格の知らせに舞い上がった。', '합격 소식에 들떠버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='舞い上がる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '傷つく', 'きずつく', '상처받다, 다치다', 'N2', '동사', '心ない言葉に傷ついた。', '마음 없는 말에 상처받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傷つく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '苦しむ', 'くるしむ', '괴로워하다, 고통받다', 'N2', '동사', '長い間人間関係に苦しんだ。', '오랜 기간 인간관계로 괴로워했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='苦しむ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気づく', 'きづく', '알아차리다, 깨닫다', 'N2', '동사', '誤りにすぐ気づくことができた。', '잘못을 바로 알아차릴 수 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気づく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '照れる', 'てれる', '쑥스럽다, 부끄럽다', 'N2', '동사', '褒められて照れてしまった。', '칭찬을 받아 쑥스러워졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='照れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '焦る', 'あせる', '초조해하다, 서두르다', 'N2', '동사', '時間がなくて焦った。', '시간이 없어 초조해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焦る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恐れる', 'おそれる', '두려워하다, 염려하다', 'N2', '동사', '失敗を恐れず挑戦する。', '실패를 두려워하지 않고 도전하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恐れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '親しむ', 'したしむ', '친하게 지내다, 친숙해지다', 'N2', '동사', '自然に親しむ生活を送る。', '자연과 친숙한 생활을 보내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='親しむ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '甘える', 'あまえる', '응석 부리다, 의지하다', 'N2', '동사', '親に甘えてばかりではいけない。', '부모에게 의지하기만 해서는 안 된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='甘える' AND jlpt_level='N2');

-- ============================================================
-- 感情・性格関連 い形容詞 (Emotion/Character い-adj) 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'くやしい', 'くやしい', '분하다, 억울하다', 'N2', 'い형용사', '負けてくやしくて涙が出た。', '져서 분해서 눈물이 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='くやしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物悲しい', 'ものがなしい', '어딘지 모르게 슬프다', 'N2', 'い형용사', '秋の風景が物悲しく感じられる。', '가을 풍경이 어딘지 모르게 슬프게 느껴진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物悲しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '心細い', 'こころぼそい', '불안하다, 외롭다', 'N2', 'い형용사', '一人でいると心細い。', '혼자 있으면 불안하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='心細い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うとましい', 'うとましい', '꺼림칙하다, 싫다', 'N2', 'い형용사', 'うとましい雰囲気を感じた。', '꺼림칙한 분위기를 느꼈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うとましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もどかしい', 'もどかしい', '답답하다, 안타깝다', 'N2', 'い형용사', 'うまく伝わらなくてもどかしい。', '잘 전달되지 않아 답답하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もどかしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'やましい', 'やましい', '찔리다, 양심에 걸리다', 'N2', 'い형용사', 'やましいところは何もない。', '양심에 걸리는 것은 아무것도 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悩ましい', 'なやましい', '고민스럽다, 괴롭다', 'N2', 'い형용사', '悩ましい問題に頭を抱えた。', '고민스러운 문제에 머리를 싸매었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悩ましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぎこちない', 'ぎこちない', '어색하다, 어설프다', 'N2', 'い형용사', '久しぶりに会って会話がぎこちなかった。', '오랜만에 만나서 대화가 어색했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぎこちない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気まずい', 'きまずい', '어색하다, 거북하다', 'N2', 'い형용사', '喧嘩の後は気まずい雰囲気だった。', '싸운 후에 어색한 분위기였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気まずい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '情深い', 'なさけぶかい', '인정이 많다', 'N2', 'い형용사', '情深い人に助けられた。', '인정이 많은 사람에게 도움을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='情深い' AND jlpt_level='N2');
