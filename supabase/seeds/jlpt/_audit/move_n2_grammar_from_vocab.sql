-- N2 어휘에 잘못 분류된 문법패턴 7개를 N2 문법으로 이동 (2026-06-27)
-- 어휘(part_of_speech='표현') → 문법 신규 생성 + user_mastered_items 재매핑(보존) + 어휘 삭제
-- seq는 N2 문법 max(196) 뒤로 append(197~203). category는 CHECK 허용 15값 준수.

-- 1) 문법 신규 7행
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, example_sentences, category, seq) VALUES
('b2000001-0000-4000-8000-000000000197', '〜とは限らない', '반드시 ~인 것은 아니다, ~라고는 할 수 없다', '必ずしも〜だとは言えない', 'N2', '普通形＋とは限らない', '[{"ja":"高い物が必ずしもいいとは限らない。","ko":"비싼 물건이 반드시 좋다고는 할 수 없다."}]', 'conjecture', 197),
('b2000001-0000-4000-8000-000000000198', '〜において', '~에서, ~에 있어서 (장소·상황·분야)', '〜で（場所・場面・分野を表す改まった言い方）', 'N2', '名詞＋において', '[{"ja":"会議は大会議室において行われる。","ko":"회의는 대회의실에서 열린다."}]', 'formal', 198),
('b2000001-0000-4000-8000-000000000199', '〜に関して', '~에 관해서, ~에 대해서', '〜について（改まった言い方）', 'N2', '名詞＋に関して', '[{"ja":"その件に関して詳しく説明します。","ko":"그 건에 관해서 자세히 설명하겠습니다."}]', 'formal', 199),
('b2000001-0000-4000-8000-000000000200', '〜に過ぎない', '~에 지나지 않는다, ~에 불과하다', 'ただ〜だけだ、それ以上ではない', 'N2', '名詞／動詞普通形＋に過ぎない', '[{"ja":"それは言い訳に過ぎない。","ko":"그것은 변명에 지나지 않는다."}]', 'degree', 200),
('b2000001-0000-4000-8000-000000000201', '〜に沿って', '~에 따라, ~을 따라', '〜に従って、〜のとおりに', 'N2', '名詞＋に沿って', '[{"ja":"計画に沿って進める。","ko":"계획에 따라 진행한다."}]', 'manner', 201),
('b2000001-0000-4000-8000-000000000202', '〜に伴って', '~에 따라, ~와 함께 (변화)', '〜とともに、〜の変化につれて', 'N2', '名詞／動詞辞書形の＋に伴って', '[{"ja":"経済の発展に伴って、生活も豊かになった。","ko":"경제 발전에 따라 생활도 풍요로워졌다."}]', 'change', 202),
('b2000001-0000-4000-8000-000000000203', '〜に他ならない', '다름 아닌 ~이다, 바로 ~이다', 'まさに〜だ、〜以外のものではない', 'N2', '名詞＋に他ならない', '[{"ja":"成功は努力の結果に他ならない。","ko":"성공은 다름 아닌 노력의 결과다."}]', 'emphasis', 203);

-- 2) user_mastered_items 재매핑 (jlpt_vocabulary 옛id → jlpt_grammar 새id, 암기상태 보존)
UPDATE user_mastered_items SET item_type='jlpt_grammar', item_id='b2000001-0000-4000-8000-000000000197' WHERE item_type='jlpt_vocabulary' AND item_id='f94a20c9-e78e-4f56-b6b8-ab776f38e64d'; -- とは限らない
UPDATE user_mastered_items SET item_type='jlpt_grammar', item_id='b2000001-0000-4000-8000-000000000198' WHERE item_type='jlpt_vocabulary' AND item_id='9a6e0895-99ff-446a-b9f9-f5337611f304'; -- において
UPDATE user_mastered_items SET item_type='jlpt_grammar', item_id='b2000001-0000-4000-8000-000000000199' WHERE item_type='jlpt_vocabulary' AND item_id='45e0d1ca-2842-46fa-be4c-d34a60642931'; -- に関して
UPDATE user_mastered_items SET item_type='jlpt_grammar', item_id='b2000001-0000-4000-8000-000000000200' WHERE item_type='jlpt_vocabulary' AND item_id='af47fa48-76c0-4498-8eb1-de486c974b57'; -- に過ぎない
UPDATE user_mastered_items SET item_type='jlpt_grammar', item_id='b2000001-0000-4000-8000-000000000201' WHERE item_type='jlpt_vocabulary' AND item_id='e8bbb907-1d79-45e3-8dfe-ce00bd3c4df6'; -- に沿って
UPDATE user_mastered_items SET item_type='jlpt_grammar', item_id='b2000001-0000-4000-8000-000000000202' WHERE item_type='jlpt_vocabulary' AND item_id='a625cdf8-d7bb-4cd7-aedc-a5f42dd82320'; -- に伴って
UPDATE user_mastered_items SET item_type='jlpt_grammar', item_id='b2000001-0000-4000-8000-000000000203' WHERE item_type='jlpt_vocabulary' AND item_id='1ab46855-a8f8-4df0-b73c-5f1d4d6fe7f7'; -- に他ならない

-- 3) 어휘 7행 삭제
DELETE FROM jlpt_vocabulary WHERE id IN (
  'f94a20c9-e78e-4f56-b6b8-ab776f38e64d',
  '9a6e0895-99ff-446a-b9f9-f5337611f304',
  '45e0d1ca-2842-46fa-be4c-d34a60642931',
  'af47fa48-76c0-4498-8eb1-de486c974b57',
  'e8bbb907-1d79-45e3-8dfe-ce00bd3c4df6',
  'a625cdf8-d7bb-4cd7-aedc-a5f42dd82320',
  '1ab46855-a8f8-4df0-b73c-5f1d4d6fe7f7'
);
