-- encoding: UTF-8
-- N2 語彙シード batch 2 (100語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- 除外済み(既存374語): batch1 + n2_vocab_words.txt 全語
-- 品詞: 名詞40語・動詞30語・い形容詞10語・な形容詞10語・副詞10語
-- 読み確認: 標準辞書準拠

-- ============================================================
-- 名詞 (Nouns) — 40語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手続き', 'てつづき', '절차, 수속', 'N2', '명사', '入学の手続きを済ませた。', '입학 수속을 마쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手続き' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見積もり', 'みつもり', '견적, 예산 산출', 'N2', '명사', '工事の見積もりを取った。', '공사 견적을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見積もり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '下請け', 'したうけ', '하청', 'N2', '명사', '下請け業者に発注した。', '하청 업체에 발주했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='下請け' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '締め切り', 'しめきり', '마감', 'N2', '명사', '締め切りまで時間がない。', '마감까지 시간이 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='締め切り' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見落とし', 'みおとし', '간과, 놓침', 'N2', '명사', '確認不足で見落としが出た。', '확인 부족으로 간과가 생겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見落とし' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取り組み', 'とりくみ', '대처, 노력, 활동', 'N2', '명사', '環境問題への取り組みが進んでいる。', '환경 문제에 대한 대처가 진행되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取り組み' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い込み', 'おもいこみ', '고정관념, 선입견', 'N2', '명사', '思い込みが邪魔をすることがある。', '고정관념이 방해가 되는 경우가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い込み' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '振る舞い', 'ふるまい', '행동, 태도, 처신', 'N2', '명사', '彼の振る舞いは紳士的だ。', '그의 행동은 신사적이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='振る舞い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕上がり', 'しあがり', '완성도, 마무리', 'N2', '명사', '仕上がりが予想以上によかった。', '완성도가 예상 이상으로 좋았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕上がり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見直し', 'みなおし', '재검토, 재고', 'N2', '명사', '計画の見直しが必要だ。', '계획의 재검토가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見直し' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '追加', 'ついか', '추가', 'N2', '명사', '注文に追加したい商品がある。', '주문에 추가하고 싶은 상품이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='追加' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '削減', 'さくげん', '삭감, 절감', 'N2', '명사', 'コスト削減が急務だ。', '비용 절감이 시급하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='削減' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '節約', 'せつやく', '절약', 'N2', '명사', '電気の節約を心がける。', '전기 절약을 신경 쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節約' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '管理', 'かんり', '관리', 'N2', '명사', 'データの管理が重要だ。', '데이터 관리가 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='管理' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '運営', 'うんえい', '운영', 'N2', '명사', 'サービスの運営を担う。', '서비스 운영을 담당하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='運営' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '企画', 'きかく', '기획', 'N2', '명사', '新しい企画を提案した。', '새로운 기획을 제안했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='企画' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '担当', 'たんとう', '담당', 'N2', '명사', '営業担当者に連絡する。', '영업 담당자에게 연락하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='担当' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '窓口', 'まどぐち', '창구', 'N2', '명사', '受付の窓口で手続きをする。', '접수 창구에서 절차를 밟다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='窓口' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '申し込み', 'もうしこみ', '신청', 'N2', '명사', 'セミナーへの申し込みを済ませた。', '세미나 신청을 마쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申し込み' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '期限', 'きげん', '기한, 마감일', 'N2', '명사', '提出期限を守ってください。', '제출 기한을 지켜 주십시오.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='期限' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '負債', 'ふさい', '부채, 빚', 'N2', '명사', '負債を抱えた企業が増えている。', '부채를 안은 기업이 늘고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='負債' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '収益', 'しゅうえき', '수익', 'N2', '명사', '収益を上げる方法を考える。', '수익을 올리는 방법을 생각하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収益' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '損失', 'そんしつ', '손실', 'N2', '명사', '大きな損失を被った。', '큰 손실을 입었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='損失' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廃棄', 'はいき', '폐기', 'N2', '명사', '古い書類を廃棄する。', '낡은 서류를 폐기하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃棄' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '回収', 'かいしゅう', '회수', 'N2', '명사', '不良品の回収を急いだ。', '불량품 회수를 서둘렀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='回収' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手配', 'てはい', '수배, 준비, 마련', 'N2', '명사', '宿泊の手配をした。', '숙박 예약을 마련했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手配' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '経緯', 'けいい', '경위, 사정', 'N2', '명사', '事故の経緯を説明する。', '사고의 경위를 설명하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='経緯' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '名称', 'めいしょう', '명칭', 'N2', '명사', '正式名称を確認する。', '공식 명칭을 확인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='名称' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '概要', 'がいよう', '개요', 'N2', '명사', 'プロジェクトの概要を説明した。', '프로젝트의 개요를 설명했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='概要' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '概念', 'がいねん', '개념', 'N2', '명사', '新しい概念を理解する。', '새로운 개념을 이해하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='概念' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発端', 'ほったん', '발단, 시작', 'N2', '명사', 'トラブルの発端は小さなミスだった。', '트러블의 발단은 작은 실수였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発端' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '余波', 'よは', '여파', 'N2', '명사', '不況の余波が続いている。', '불황의 여파가 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='余波' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '前例', 'ぜんれい', '전례', 'N2', '명사', '前例のない事態が発生した。', '전례 없는 사태가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='前例' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '根本', 'こんぽん', '근본', 'N2', '명사', '問題の根本を探る。', '문제의 근본을 탐구하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根本' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '拠点', 'きょてん', '거점', 'N2', '명사', '東京を拠点に活動する。', '도쿄를 거점으로 활동하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拠点' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '節度', 'せつど', '절도, 분수, 적당한 정도', 'N2', '명사', '節度ある行動を心がける。', '절도 있는 행동을 신경 쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '辛抱', 'しんぼう', '인내, 참음', 'N2', '명사', '辛抱強く待つことが大切だ。', '끈기 있게 기다리는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='辛抱' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見込み', 'みこみ', '전망, 가능성', 'N2', '명사', '回復の見込みがある。', '회복의 가망성이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見込み' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '余裕', 'よゆう', '여유', 'N2', '명사', '気持ちに余裕を持つ。', '마음에 여유를 갖다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='余裕' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '偏り', 'かたより', '편향, 치우침', 'N2', '명사', '意見に偏りがある。', '의견에 편향이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='偏り' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実績', 'じっせき', '실적, 실천 성과', 'N2', '명사', '豊富な実績を持つ会社だ。', '풍부한 실적을 가진 회사이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実績' AND jlpt_level='N2');

-- ============================================================
-- 동사 (Verbs) — 30語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '滞る', 'とどこおる', '정체되다, 지체되다', 'N2', '동사', '工事が滞って困っている。', '공사가 지체되어 곤란하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='滞る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '妥協する', 'だきょうする', '타협하다', 'N2', '동사', '品質では妥協しない。', '품질에서는 타협하지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='妥協する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見落とす', 'みおとす', '간과하다, 놓치다', 'N2', '동사', '重要な点を見落としていた。', '중요한 점을 간과하고 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見落とす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '振る舞う', 'ふるまう', '행동하다, 처신하다', 'N2', '동사', '大人らしく振る舞う。', '어른답게 행동하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='振る舞う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕上げる', 'しあげる', '완성하다, 마무리하다', 'N2', '동사', 'レポートを仕上げた。', '보고서를 완성했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕上げる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '申し込む', 'もうしこむ', '신청하다', 'N2', '동사', 'コースに申し込んだ。', '코스에 신청했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申し込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見直す', 'みなおす', '재검토하다, 다시 보다', 'N2', '동사', '計画を見直す必要がある。', '계획을 재검토할 필요가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見直す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思い込む', 'おもいこむ', '단정 짓다, 확신하다', 'N2', '동사', '自分が正しいと思い込んでいた。', '자신이 옳다고 단정 짓고 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思い込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '打ち込む', 'うちこむ', '몰두하다, 열중하다', 'N2', '동사', '研究に打ち込む毎日だ。', '연구에 몰두하는 나날이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '追い込む', 'おいこむ', '몰아넣다, 압박하다', 'N2', '동사', '自分を追い込んで練習する。', '자신을 몰아붙이며 연습하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='追い込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '振り返る', 'ふりかえる', '돌아보다, 회고하다', 'N2', '동사', '一年を振り返って反省する。', '1년을 돌아보며 반성하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='振り返る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '割り当てる', 'わりあてる', '할당하다, 배분하다', 'N2', '동사', '仕事を各自に割り当てた。', '일을 각자에게 할당했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='割り当てる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '与える', 'あたえる', '주다, 부여하다', 'N2', '동사', '子どもに良い環境を与える。', '아이에게 좋은 환경을 주다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='与える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恵まれる', 'めぐまれる', '혜택을 받다, 축복받다', 'N2', '동사', '才能に恵まれた人だ。', '재능에 축복받은 사람이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恵まれる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '溢れる', 'あふれる', '넘치다', 'N2', '동사', '感謝の気持ちが溢れてきた。', '감사하는 마음이 넘쳐왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='溢れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '満たす', 'みたす', '채우다, 충족시키다', 'N2', '동사', '条件を満たしてください。', '조건을 충족시켜 주십시오.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='満たす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生じる', 'しょうじる', '생기다, 발생하다', 'N2', '동사', '問題が生じた場合は連絡する。', '문제가 생긴 경우에는 연락하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生じる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '含める', 'ふくめる', '포함시키다', 'N2', '동사', '税込みで含めた価格だ。', '세금 포함해서 넣은 가격이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='含める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '占める', 'しめる', '차지하다', 'N2', '동사', '費用の大半を占める。', '비용의 대부분을 차지하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='占める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '浸透する', 'しんとうする', '침투하다, 보급되다', 'N2', '동사', '新文化が若者に浸透した。', '새 문화가 젊은이들에게 보급되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浸透する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '覆す', 'くつがえす', '뒤집다, 번복하다', 'N2', '동사', '定説を覆す発見があった。', '정설을 뒤집는 발견이 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='覆す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '補う', 'おぎなう', '보충하다, 보완하다', 'N2', '동사', '不足分を補う方法を探す。', '부족분을 보충할 방법을 찾다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='補う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '怒る', 'おこる', '화내다', 'N2', '동사', '理不尽なことに怒る。', '부당한 일에 화내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='怒る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悩む', 'なやむ', '고민하다', 'N2', '동사', '将来のことで悩んでいる。', '장래에 대해 고민하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悩む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恐れる', 'おそれる', '두려워하다', 'N2', '동사', '失敗を恐れてはいけない。', '실패를 두려워해서는 안 된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恐れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '驚く', 'おどろく', '놀라다', 'N2', '동사', '突然の知らせに驚いた。', '갑작스러운 소식에 놀랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='驚く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '共感する', 'きょうかんする', '공감하다', 'N2', '동사', '彼の意見に共感した。', '그의 의견에 공감했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='共感する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '当てはまる', 'あてはまる', '해당하다, 들어맞다', 'N2', '동사', 'この条件に当てはまる人を探す。', '이 조건에 해당하는 사람을 찾다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='当てはまる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '矛盾する', 'むじゅんする', '모순되다', 'N2', '동사', '二つの説明が矛盾している。', '두 설명이 모순되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='矛盾する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '証明する', 'しょうめいする', '증명하다', 'N2', '동사', '仮説を実験で証明する。', '가설을 실험으로 증명하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='証明する' AND jlpt_level='N2');

-- ============================================================
-- い형용사 (い-Adjectives) — 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '著しい', 'いちじるしい', '현저하다, 두드러지다', 'N2', 'い형용사', '著しい成長を遂げた。', '현저한 성장을 이루었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='著しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '目覚ましい', 'めざましい', '눈부시다, 놀랍다', 'N2', 'い형용사', '目覚ましい活躍をした選手だ。', '눈부신 활약을 한 선수이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目覚ましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '画期的', 'かっきてき', '획기적', 'N2', 'い형용사', '画期的な発明が世界を変えた。', '획기적인 발명이 세계를 바꿨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='画期的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '顕著', 'けんちょ', '현저함, 두드러짐', 'N2', 'い형용사', '効果が顕著に現れた。', '효과가 현저하게 나타났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顕著' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乏しい', 'とぼしい', '부족하다, 빈곤하다', 'N2', 'い형용사', '資金が乏しい状況だ。', '자금이 부족한 상황이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乏しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '膨大', 'ぼうだい', '방대함', 'N2', 'い형용사', '膨大なデータを分析した。', '방대한 데이터를 분석했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='膨大' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '空しい', 'むなしい', '허무하다, 공허하다', 'N2', 'い형용사', '努力が空しく終わった。', '노력이 허무하게 끝났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='空しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '心強い', 'こころづよい', '든든하다, 믿음직하다', 'N2', 'い형용사', '仲間がいると心強い。', '동료가 있으면 든든하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='心強い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手堅い', 'てがたい', '착실하다, 견실하다', 'N2', 'い형용사', '手堅い経営で安定している。', '착실한 경영으로 안정되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手堅い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物足りない', 'ものたりない', '부족하다, 아쉽다', 'N2', 'い형용사', '量が少なくて物足りない。', '양이 적어서 아쉽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物足りない' AND jlpt_level='N2');

-- ============================================================
-- な형용사 (な-Adjectives) — 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '深刻', 'しんこく', '심각함', 'N2', 'な형용사', '深刻な問題が浮上した。', '심각한 문제가 떠올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='深刻' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '消極的', 'しょうきょくてき', '소극적', 'N2', 'な형용사', '消極的な姿勢を改める。', '소극적인 자세를 고치다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='消極的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '積極的', 'せっきょくてき', '적극적', 'N2', 'な형용사', '積極的に発言するよう努める。', '적극적으로 발언하도록 노력하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='積極的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '独自', 'どくじ', '독자적', 'N2', 'な형용사', '独自の方法で解決した。', '독자적인 방법으로 해결했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='独自' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '多様', 'たよう', '다양함', 'N2', 'な형용사', '多様な意見を取り入れる。', '다양한 의견을 받아들이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='多様' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '豊富', 'ほうふ', '풍부함', 'N2', 'な형용사', '経験が豊富なスタッフが揃っている。', '경험이 풍부한 스태프가 갖춰져 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='豊富' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '具体的', 'ぐたいてき', '구체적', 'N2', 'な형용사', '具体的な計画を立てる。', '구체적인 계획을 세우다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='具体的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '効果的', 'こうかてき', '효과적', 'N2', 'な형용사', '効果的な学習法を探す。', '효과적인 학습법을 찾다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='効果的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '潔い', 'いさぎよい', '깨끗하다, 미련이 없다', 'N2', 'な형용사', '潔い撤退が評価された。', '깨끗한 철수가 평가받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='潔い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '紛らわしい', 'まぎらわしい', '헷갈리기 쉽다, 혼동하기 쉽다', 'N2', 'な형용사', '似た漢字は紛らわしい。', '비슷한 한자는 혼동하기 쉽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='紛らわしい' AND jlpt_level='N2');

-- ============================================================
-- 副詞 (Adverbs) — 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あらかじめ', 'あらかじめ', '미리, 사전에', 'N2', '부사', 'あらかじめ連絡しておく。', '미리 연락해 두다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あらかじめ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'やむを得ず', 'やむをえず', '어쩔 수 없이', 'N2', '부사', 'やむを得ず欠席することになった。', '어쩔 수 없이 결석하게 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やむを得ず' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'かえって', 'かえって', '오히려, 도리어', 'N2', '부사', '助けようとしてかえって迷惑をかけた。', '도우려다 오히려 폐를 끼쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かえって' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'たちまち', 'たちまち', '금세, 순식간에', 'N2', '부사', 'たちまち話題になった。', '금세 화제가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たちまち' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'せいぜい', 'せいぜい', '기껏해야, 고작', 'N2', '부사', 'せいぜい三日で終わるだろう。', '기껏해야 3일이면 끝날 것이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='せいぜい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'さすが', 'さすが', '과연, 역시', 'N2', '부사', 'さすがプロの仕事だ。', '과연 프로의 솜씨이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さすが' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'せめて', 'せめて', '적어도, 최소한', 'N2', '부사', 'せめて挨拶くらいしてほしい。', '적어도 인사 정도는 해줬으면 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='せめて' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ますます', 'ますます', '점점, 갈수록', 'N2', '부사', '気温がますます上がっている。', '기온이 점점 올라가고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ますます' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'わざわざ', 'わざわざ', '일부러, 굳이', 'N2', '부사', 'わざわざ来てくれてありがとう。', '일부러 와주어서 감사합니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わざわざ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'しばしば', 'しばしば', '종종, 자주', 'N2', '부사', 'しばしば同じミスを繰り返す。', '종종 같은 실수를 반복하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しばしば' AND jlpt_level='N2');
