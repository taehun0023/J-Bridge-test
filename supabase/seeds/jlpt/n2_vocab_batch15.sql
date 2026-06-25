-- encoding: UTF-8
-- N2 語彙シード batch 15 (130語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: い형용사・副詞・擬態語擬音語・接続副詞 집중
-- 除外済み(既存1007語 + batch1〜7 700語): 激しい/鋭い/鈍い/惜しい/煩わしい/憎らしい/羨ましい/頼もしい
--   恐ろしい/危うい/著しい/目覚ましい/空しい(むなしい)/心強い/物足りない/紛らわしい/潔い
--   うとましい/ぎこちない/くやしい/もどかしい/やましい/悩ましい/物悲しい/心細い/気まずい
--   勇ましい/恥ずかしい/情けない(情深い)/慌ただしい/素晴らしい/好ましい/騒がしい
--   相変わらず/むしろ/それにしても 等
-- 読み確認: 標準辞書準拠 (すがすがしい・ふてぶてしい・おびただしい 等)
-- 擬態語・擬音語 part_of_speech='부사' で統一
-- 接続副詞 part_of_speech='접속부사' で統一

-- ============================================================
-- い형용사 (い-Adjectives) — 45語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ずるい', 'ずるい', '교활하다, 얄밉다', 'N2', 'い형용사', 'ずるい手を使って勝った。', '교활한 수를 써서 이겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ずるい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひどい', 'ひどい', '심하다, 가혹하다', 'N2', 'い형용사', 'ひどい扱いを受けた。', '심한 취급을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひどい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おかしい', 'おかしい', '이상하다, 우습다', 'N2', 'い형용사', '彼の行動がおかしい。', '그의 행동이 이상하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おかしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'くだらない', 'くだらない', '시시하다, 하찮다', 'N2', 'い형용사', 'くだらない話はやめてくれ。', '시시한 이야기는 그만해.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='くだらない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '険しい', 'けわしい', '험하다, 가파르다', 'N2', 'い형용사', '険しい山道を登った。', '가파른 산길을 올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='険しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'なつかしい', 'なつかしい', '그립다, 반갑다', 'N2', 'い형용사', '故郷の景色がなつかしい。', '고향 풍경이 그립다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なつかしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もったいない', 'もったいない', '아깝다, 낭비다', 'N2', 'い형용사', '食べ物を捨てるのはもったいない。', '음식을 버리는 것은 아깝다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もったいない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ほろ苦い', 'ほろにがい', '씁쓸하다', 'N2', 'い형용사', '失恋のほろ苦い思い出がある。', '실연의 씁쓸한 추억이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ほろ苦い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おとなしい', 'おとなしい', '얌전하다, 순하다', 'N2', 'い형용사', 'おとなしい性格の子どもだ。', '얌전한 성격의 아이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おとなしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'まぶしい', 'まぶしい', '눈부시다', 'N2', 'い형용사', '朝日がまぶしくて目が開けられない。', '아침 햇살이 눈부셔 눈을 뜰 수가 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まぶしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'すばしっこい', 'すばしっこい', '재빠르다, 민첩하다', 'N2', 'い형용사', 'すばしっこい動きで相手をかわした。', '재빠른 움직임으로 상대를 피했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すばしっこい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ものすごい', 'ものすごい', '굉장하다, 엄청나다', 'N2', 'い형용사', 'ものすごい速さで走り抜けた。', '굉장한 속도로 달려 지나갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ものすごい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'しつこい', 'しつこい', '집요하다, 끈질기다', 'N2', 'い형용사', 'しつこい営業電話に困った。', '집요한 영업 전화에 곤혹스러웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しつこい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'めんどくさい', 'めんどくさい', '귀찮다, 성가시다', 'N2', 'い형용사', 'めんどくさい手続きが多い。', '귀찮은 절차가 많다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='めんどくさい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'こわい', 'こわい', '무섭다, 두렵다', 'N2', 'い형용사', '暗い夜道がこわい。', '어두운 밤길이 무섭다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='こわい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'さびしい', 'さびしい', '외롭다, 쓸쓸하다', 'N2', 'い형용사', '一人でいるとさびしい。', '혼자 있으면 외롭다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さびしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'つらい', 'つらい', '힘들다, 고통스럽다', 'N2', 'い형용사', 'つらい時期を乗り越えた。', '힘든 시기를 극복했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='つらい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'なさけない', 'なさけない', '한심하다, 가엾다', 'N2', 'い형용사', 'なさけない結果に終わった。', '한심한 결과로 끝났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なさけない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぬるい', 'ぬるい', '미지근하다', 'N2', 'い형용사', 'ぬるいお茶は飲みにくい。', '미지근한 차는 마시기 불편하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぬるい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'まずい', 'まずい', '맛없다; 곤란하다', 'N2', 'い형용사', 'まずい料理に困った。', '맛없는 요리에 곤혹스러웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まずい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うれしい', 'うれしい', '기쁘다, 반갑다', 'N2', 'い형용사', '合格の知らせにうれしくなった。', '합격 소식에 기뻐졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うれしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'かゆい', 'かゆい', '가렵다', 'N2', 'い형용사', '虫に刺されてかゆい。', '벌레에 물려서 가렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かゆい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'くさい', 'くさい', '냄새가 나다, 구리다', 'N2', 'い형용사', '魚がくさくなってしまった。', '생선이 냄새가 나버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='くさい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ありがたい', 'ありがたい', '고맙다, 감사하다', 'N2', 'い형용사', '助けてもらえてありがたい。', '도움을 받아서 고맙다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ありがたい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いとしい', 'いとしい', '사랑스럽다, 귀엽다', 'N2', 'い형용사', '子どもの笑顔がいとしい。', '아이의 웃음이 사랑스럽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いとしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おそい', 'おそい', '느리다, 늦다', 'N2', 'い형용사', '歩くのがおそい人に合わせた。', '걷는 것이 느린 사람에게 맞춰줬다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おそい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'たくましい', 'たくましい', '씩씩하다, 억세다', 'N2', 'い형용사', 'たくましい体で山を登った。', '억센 몸으로 산을 올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たくましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あさましい', 'あさましい', '천박하다, 비열하다', 'N2', 'い형용사', 'あさましい行為に呆れた。', '비열한 행위에 어이가 없었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あさましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'はかない', 'はかない', '허무하다, 덧없다', 'N2', 'い형용사', 'はかない命を大切にする。', '덧없는 생명을 소중히 여기다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='はかない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あやしい', 'あやしい', '수상하다, 의심스럽다', 'N2', 'い형용사', 'あやしい人物が近づいてきた。', '수상한 인물이 다가왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あやしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'すがすがしい', 'すがすがしい', '상쾌하다, 청량하다', 'N2', 'い형용사', '朝の空気がすがすがしい。', '아침 공기가 상쾌하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すがすがしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ふさわしい', 'ふさわしい', '어울리다, 적합하다', 'N2', 'い형용사', '場にふさわしい服装を選んだ。', '자리에 어울리는 복장을 골랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ふさわしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'やわらかい', 'やわらかい', '부드럽다, 연하다', 'N2', 'い형용사', 'やわらかいパンが好きだ。', '부드러운 빵을 좋아한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やわらかい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'かたくるしい', 'かたくるしい', '딱딱하다, 격식 차리다', 'N2', 'い형용사', 'かたくるしい挨拶は不要です。', '딱딱한 인사는 필요 없습니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かたくるしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ずうずうしい', 'ずうずうしい', '뻔뻔하다, 철면피다', 'N2', 'い형용사', 'ずうずうしい態度に呆れた。', '뻔뻔한 태도에 어이가 없었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ずうずうしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'だらしない', 'だらしない', '단정치 못하다, 흐리멍덩하다', 'N2', 'い형용사', 'だらしない生活を改める。', '단정치 못한 생활을 고친다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='だらしない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ふてぶてしい', 'ふてぶてしい', '뻔뻔스럽다, 배짱 있다', 'N2', 'い형용사', 'ふてぶてしい態度で臨んだ。', '뻔뻔스러운 태도로 임했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ふてぶてしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おびただしい', 'おびただしい', '엄청나다, 막대하다', 'N2', 'い형용사', 'おびただしい数の虫が集まった。', '엄청난 수의 벌레가 모였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おびただしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'こころよい', 'こころよい', '상쾌하다, 흔쾌하다', 'N2', 'い형용사', 'こころよい返事をもらった。', '흔쾌한 답변을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='こころよい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いやしい', 'いやしい', '천박하다, 욕심많다', 'N2', 'い형용사', 'いやしい根性は直さないといけない。', '천박한 근성은 고쳐야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いやしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'せわしい', 'せわしい', '분주하다, 바쁘다', 'N2', 'い형용사', 'せわしい毎日が続いている。', '분주한 나날이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='せわしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'めずらしい', 'めずらしい', '드물다, 희귀하다', 'N2', 'い형용사', 'めずらしい花を見つけた。', '희귀한 꽃을 발견했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='めずらしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'こまかい', 'こまかい', '세밀하다, 상세하다', 'N2', 'い형용사', 'こまかいところまで注意する。', '세밀한 부분까지 주의한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='こまかい' AND jlpt_level='N2');

-- ============================================================
-- 擬態語・擬音語 (Mimetic/Onomatopoeic words) — 45語
-- part_of_speech='부사' で統一
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐっすり', 'ぐっすり', '푹 (자다)', 'N2', '부사', 'ぐっすり眠れた。', '푹 잘 수 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐっすり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぴったり', 'ぴったり', '딱 맞게, 꼭', 'N2', '부사', 'サイズがぴったり合った。', '사이즈가 딱 맞았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぴったり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'はっきり', 'はっきり', '뚜렷하게, 분명히', 'N2', '부사', '気持ちをはっきり伝えた。', '마음을 분명히 전했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='はっきり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'のんびり', 'のんびり', '느긋하게, 여유롭게', 'N2', '부사', '休日はのんびり過ごした。', '휴일에는 느긋하게 지냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='のんびり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うっかり', 'うっかり', '깜박하고, 무심코', 'N2', '부사', 'うっかり財布を忘れてしまった。', '깜박하고 지갑을 잊어버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うっかり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'こっそり', 'こっそり', '몰래, 슬그머니', 'N2', '부사', 'こっそり部屋を抜け出した。', '몰래 방을 빠져나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='こっそり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぼんやり', 'ぼんやり', '멍하니, 흐릿하게', 'N2', '부사', 'ぼんやり窓の外を見ていた。', '멍하니 창밖을 바라보고 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぼんやり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'どんどん', 'どんどん', '점점, 착착', 'N2', '부사', '仕事がどんどん増えていく。', '일이 점점 늘어간다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='どんどん' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'だんだん', 'だんだん', '점점, 차차', 'N2', '부사', 'だんだん暖かくなってきた。', '점점 따뜻해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='だんだん' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぞくぞく', 'ぞくぞく', '오싹오싹, 짜릿하게', 'N2', '부사', 'ホラー映画を見てぞくぞくした。', '공포 영화를 보고 오싹했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぞくぞく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いらいら', 'いらいら', '초조하게, 짜증스럽게', 'N2', '부사', '待たされていらいらした。', '기다리다 짜증났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いらいら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'わくわく', 'わくわく', '두근두근, 설레게', 'N2', '부사', '旅行の前日はわくわくする。', '여행 전날은 두근거린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わくわく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'どきどき', 'どきどき', '두근두근 (긴장)', 'N2', '부사', '発表の前にどきどきした。', '발표 전에 두근거렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='どきどき' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うろうろ', 'うろうろ', '어슬렁어슬렁, 두리번두리번', 'N2', '부사', '道に迷ってうろうろした。', '길을 잃어 두리번거렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うろうろ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ふらふら', 'ふらふら', '비틀비틀, 휘청휘청', 'N2', '부사', '疲れてふらふら歩いた。', '피곤해서 비틀비틀 걸었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ふらふら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'きらきら', 'きらきら', '반짝반짝', 'N2', '부사', '星がきらきら輝いている。', '별이 반짝반짝 빛나고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='きらきら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぼろぼろ', 'ぼろぼろ', '너덜너덜한, 낡아빠진', 'N2', '부사', '長年使った靴がぼろぼろになった。', '오래 사용한 신발이 너덜너덜해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぼろぼろ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぽかぽか', 'ぽかぽか', '따끈따끈하게', 'N2', '부사', '日当たりの良い部屋がぽかぽかする。', '햇볕이 잘 드는 방이 따뜻하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぽかぽか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひらひら', 'ひらひら', '팔랑팔랑, 나풀나풀', 'N2', '부사', '花びらがひらひら落ちてきた。', '꽃잎이 나풀나풀 떨어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひらひら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'さらさら', 'さらさら', '술술, 매끄럽게', 'N2', '부사', '髪がさらさらしている。', '머리카락이 매끄럽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さらさら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'べたべた', 'べたべた', '끈적끈적하게', 'N2', '부사', '汗でべたべたして気持ち悪い。', '땀으로 끈적끈적해서 불쾌하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='べたべた' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ねばねば', 'ねばねば', '질척질척, 끈적끈적', 'N2', '부사', '納豆はねばねばしている。', '낫토는 끈적끈적하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ねばねば' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'がらがら', 'がらがら', '텅텅 빈; 덜컹덜컹', 'N2', '부사', '電車の中ががらがらだった。', '전철 안이 텅텅 비어 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='がらがら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぎゅうぎゅう', 'ぎゅうぎゅう', '꽉꽉, 빽빽하게', 'N2', '부사', '電車にぎゅうぎゅう詰めに乗った。', '전철에 꽉 끼어 탔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぎゅうぎゅう' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ずきずき', 'ずきずき', '욱신욱신', 'N2', '부사', '歯がずきずき痛む。', '이가 욱신욱신 아프다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ずきずき' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ちかちか', 'ちかちか', '눈이 따끔따끔; 깜박깜박', 'N2', '부사', '画面を見続けて目がちかちかする。', '화면을 계속 보다가 눈이 따끔거린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ちかちか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もやもや', 'もやもや', '답답하게, 뿌옇게', 'N2', '부사', '気持ちがもやもやして落ち着かない。', '마음이 답답해서 진정이 안 된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もやもや' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ほっと', 'ほっと', '안도하여, 후', 'N2', '부사', '試験が終わってほっとした。', '시험이 끝나서 안도했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ほっと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'がっかり', 'がっかり', '실망하여, 낙담하여', 'N2', '부사', '試験に落ちてがっかりした。', '시험에 떨어져서 실망했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='がっかり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'がんがん', 'がんがん', '쿵쿵, 지끈지끈', 'N2', '부사', '頭ががんがんする。', '머리가 지끈지끈하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='がんがん' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐるぐる', 'ぐるぐる', '빙글빙글, 뱅뱅', 'N2', '부사', '頭がぐるぐる回る感じがした。', '머리가 빙글빙글 도는 느낌이 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐるぐる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'そわそわ', 'そわそわ', '안절부절못하게', 'N2', '부사', '大事な日の前はそわそわする。', '중요한 날 전에는 안절부절못한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そわそわ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ふわふわ', 'ふわふわ', '폭신폭신, 둥둥', 'N2', '부사', 'ふわふわのパンが焼き上がった。', '폭신폭신한 빵이 구워졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ふわふわ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぱっと', 'ぱっと', '번쩍, 환하게', 'N2', '부사', '花火がぱっと空に広がった。', '불꽃이 번쩍 하늘에 퍼졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぱっと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'すっきり', 'すっきり', '개운하게, 깔끔하게', 'N2', '부사', '部屋を片付けてすっきりした。', '방을 정리하고 개운해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='すっきり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐずぐず', 'ぐずぐず', '꾸물꾸물, 질질', 'N2', '부사', 'ぐずぐずしないで早くしなさい。', '꾸물거리지 말고 빨리 해.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐずぐず' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぽつぽつ', 'ぽつぽつ', '뚝뚝, 드문드문', 'N2', '부사', '雨がぽつぽつ降り始めた。', '비가 뚝뚝 내리기 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぽつぽつ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'しとしと', 'しとしと', '보슬보슬 (비가 내리는)', 'N2', '부사', '雨がしとしと降り続けた。', '비가 보슬보슬 계속 내렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しとしと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ざあざあ', 'ざあざあ', '쏴쏴 (세찬 비)', 'N2', '부사', '雨がざあざあ降っている。', '비가 쏴쏴 쏟아지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ざあざあ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もくもく', 'もくもく', '묵묵히; 뭉게뭉게', 'N2', '부사', '煙がもくもく上がっている。', '연기가 뭉게뭉게 피어오르고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もくもく' AND jlpt_level='N2');

-- ============================================================
-- 副詞 (Adverbs — non-mimetic) — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'せっかく', 'せっかく', '모처럼, 애써', 'N2', '부사', 'せっかく来たのだから楽しもう。', '모처럼 왔으니 즐기자.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='せっかく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'めったに', 'めったに', '좀처럼, 거의 ~않다', 'N2', '부사', 'めったにないチャンスを逃した。', '좀처럼 없는 기회를 놓쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='めったに' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'よほど', 'よほど', '상당히, 꽤나', 'N2', '부사', 'よほど疲れていたのか、すぐ寝た。', '꽤나 피곤했던지 바로 잠들었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='よほど' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'たとえ', 'たとえ', '비록, 설령', 'N2', '부사', 'たとえ失敗しても諦めない。', '비록 실패해도 포기하지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='たとえ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'かなり', 'かなり', '상당히, 꽤', 'N2', '부사', 'かなり難しい問題だった。', '상당히 어려운 문제였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='かなり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あまりにも', 'あまりにも', '너무나도', 'N2', '부사', 'あまりにも暑くて外に出られない。', '너무나도 더워서 밖에 나갈 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あまりにも' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'なかなか', 'なかなか', '좀처럼; 꽤', 'N2', '부사', 'なかなか答えが見つからない。', '좀처럼 답이 나오지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='なかなか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'まるで', 'まるで', '마치, 전혀', 'N2', '부사', 'まるで夢のような出来事だった。', '마치 꿈같은 사건이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まるで' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もはや', 'もはや', '이미, 더 이상', 'N2', '부사', 'もはや手遅れだった。', '이미 너무 늦었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もはや' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いかに', 'いかに', '얼마나, 어떻게', 'N2', '부사', 'いかに努力したかを伝えた。', '얼마나 노력했는지를 전했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いかに' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もともと', 'もともと', '원래, 본래', 'N2', '부사', 'もともとこの土地は農地だった。', '원래 이 땅은 농지였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もともと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あくまで', 'あくまで', '어디까지나, 끝까지', 'N2', '부사', 'あくまで自分の意見を貫いた。', '어디까지나 자신의 의견을 관철했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あくまで' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひとまず', 'ひとまず', '일단, 우선', 'N2', '부사', 'ひとまず報告しておきます。', '일단 보고해 두겠습니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひとまず' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'つくづく', 'つくづく', '절실히, 깊이', 'N2', '부사', 'つくづく後悔した。', '절실히 후회했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='つくづく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひたすら', 'ひたすら', '오로지, 한결같이', 'N2', '부사', 'ひたすら練習を続けた。', '오로지 연습을 계속했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひたすら' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あえて', 'あえて', '굳이, 일부러', 'N2', '부사', 'あえて難しい道を選んだ。', '굳이 어려운 길을 선택했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あえて' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひいては', 'ひいては', '나아가, 더 나아가서는', 'N2', '부사', '個人の努力がひいては社会を変える。', '개인의 노력이 나아가 사회를 바꾼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひいては' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'まさに', 'まさに', '바로, 정말로', 'N2', '부사', 'これはまさに奇跡だ。', '이것은 바로 기적이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='まさに' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'やはり', 'やはり', '역시, 아무래도', 'N2', '부사', 'やはり彼が正しかった。', '역시 그가 옳았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やはり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'やっぱり', 'やっぱり', '역시 (やはり 구어형)', 'N2', '부사', 'やっぱり日本語は難しい。', '역시 일본어는 어렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やっぱり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'わりと', 'わりと', '비교적, 꽤', 'N2', '부사', 'わりと簡単に解けた。', '비교적 쉽게 풀었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='わりと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひょっとして', 'ひょっとして', '혹시, 어쩌면', 'N2', '부사', 'ひょっとして知っていますか。', '혹시 알고 있습니까?'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひょっとして' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'さっぱり', 'さっぱり', '전혀 (~모르다); 개운하게', 'N2', '부사', 'さっぱりわからない。', '전혀 모르겠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さっぱり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'しきりに', 'しきりに', '연신, 자꾸만', 'N2', '부사', '彼はしきりに謝った。', '그는 연신 사과했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しきりに' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ひとりでに', 'ひとりでに', '저절로, 자연히', 'N2', '부사', 'ドアがひとりでに開いた。', '문이 저절로 열렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ひとりでに' AND jlpt_level='N2');

-- ============================================================
-- 接続副詞 (Conjunctive Adverbs) — 15語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'したがって', 'したがって', '따라서', 'N2', '접속부사', '計画が変更された。したがって会議も中止だ。', '계획이 변경되었다. 따라서 회의도 중지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='したがって' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'それゆえ', 'それゆえ', '그러므로, 그 때문에', 'N2', '접속부사', '努力した。それゆえ結果が出た。', '노력했다. 그러므로 결과가 나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='それゆえ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ゆえに', 'ゆえに', '그 까닭에, 따라서', 'N2', '접속부사', '経験がない。ゆえに慎重に進める。', '경험이 없다. 그 까닭에 신중히 진행한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ゆえに' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'そのうえ', 'そのうえ', '게다가, 더욱이', 'N2', '접속부사', '雨が降った。そのうえ風も強かった。', '비가 왔다. 게다가 바람도 강했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そのうえ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'そのかわり', 'そのかわり', '그 대신', 'N2', '접속부사', '今日は休む。そのかわり明日は頑張る。', '오늘은 쉰다. 그 대신 내일은 열심히 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そのかわり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ところが', 'ところが', '그런데, 그러나', 'N2', '접속부사', '準備した。ところが当日に問題が起きた。', '준비했다. 그런데 당일에 문제가 생겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ところが' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ところで', 'ところで', '그런데 (화제전환)', 'N2', '접속부사', '仕事は終わった。ところで明日の予定は？', '일은 끝났다. 그런데 내일 일정은?'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ところで' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'そもそも', 'そもそも', '애당초, 원래부터', 'N2', '접속부사', 'そもそもこの計画には無理がある。', '애당초 이 계획에는 무리가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そもそも' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'つまり', 'つまり', '즉, 요컨대', 'N2', '접속부사', 'つまり、あなたは来ないということですか。', '즉, 당신은 오지 않는다는 것입니까?'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='つまり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ただ', 'ただ', '단, 다만', 'N2', '접속부사', 'やってみよう。ただ、時間が足りないかもしれない。', '해보자. 단, 시간이 부족할지도 모른다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ただ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'それどころか', 'それどころか', '그것은커녕', 'N2', '접속부사', '改善されると思ったが、それどころか悪化した。', '개선될 거라 생각했지만, 그것은커녕 악화됐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='それどころか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いずれにしても', 'いずれにしても', '어쨌든, 하여간', 'N2', '접속부사', 'いずれにしても、決断が必要だ。', '어쨌든 결단이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いずれにしても' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'それとも', 'それとも', '아니면, 혹은', 'N2', '접속부사', '電車で行きますか、それとも車ですか。', '전철로 갑니까, 아니면 차로 갑니까?'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='それとも' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'あるいは', 'あるいは', '혹은, 또는', 'N2', '접속부사', '電話またはあるいはメールでご連絡ください。', '전화 또는 이메일로 연락해 주십시오.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='あるいは' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'しかも', 'しかも', '게다가, 더욱이', 'N2', '접속부사', '安くて、しかもおいしい料理だ。', '저렴하고, 게다가 맛있는 요리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='しかも' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'にぎやか', 'にぎやか', '활기차다, 번화하다', 'N2', 'な형용사', 'にぎやかな商店街を歩いた。', '활기찬 상점가를 걸었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='にぎやか' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ちゃんと', 'ちゃんと', '제대로, 확실히', 'N2', '부사', 'ちゃんと宿題を終わらせた。', '제대로 숙제를 끝냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ちゃんと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'きちんと', 'きちんと', '단정하게, 꼼꼼히', 'N2', '부사', 'きちんと整理してから提出する。', '꼼꼼히 정리하고 나서 제출한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='きちんと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'じっと', 'じっと', '가만히, 꼼짝없이', 'N2', '부사', 'じっと我慢して待った。', '가만히 참고 기다렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='じっと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぐったり', 'ぐったり', '녹초가 되어, 축 늘어져', 'N2', '부사', '走り続けてぐったりした。', '계속 달려서 녹초가 됐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぐったり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ずっと', 'ずっと', '쭉, 계속, 훨씬', 'N2', '부사', 'ずっと待っていたのに来なかった。', '쭉 기다렸는데 오지 않았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ずっと' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'そっと', 'そっと', '살며시, 살살', 'N2', '부사', 'そっとドアを閉めた。', '살며시 문을 닫았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='そっと' AND jlpt_level='N2');
