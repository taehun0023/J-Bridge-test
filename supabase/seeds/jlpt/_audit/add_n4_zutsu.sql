-- 본방 어휘테이블에만 있던 N4 문법 〜ずつ를 로컬 jlpt_grammar에 신규 추가(레벨 맨 뒤 append). encoding: UTF-8
\set ON_ERROR_STOP on
INSERT INTO jlpt_grammar
  (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order, created_at, seq)
SELECT
  gen_random_uuid(),
  '〜ずつ',
  '~씩',
  '数量や程度を均等に割り当てること、または一定量の繰り返しを表す。「それぞれ同じ量」「少しずつ」のように使う。',
  'N4',
  '数量詞 + ずつ',
  '수량사(수사+조수사)나 「少し」 같은 정도 표현에 붙여 ''~씩''(균등 분배·점진적 변화)을 나타낸다. 예: 一つずつ、少しずつ、3人ずつ。',
  'degree',
  '[{"ja": "バグを一つずつ修正していった。", "ko": "버그를 하나씩 수정해 나갔다.", "highlight": "一つずつ"}, {"ja": "新機能のコードを少しずつレビューしています。", "ko": "새 기능 코드를 조금씩 리뷰하고 있습니다.", "highlight": "少しずつ"}]'::jsonb,
  ARRAY['〜おきに','〜ごとに'],
  '「ずつ」를 「づつ」로 잘못 쓰는 경우가 있다(현대 표기는 「ずつ」가 표준). 또 수량 표현 없이 단독으로 쓰지 않는다.',
  'IT현장: 작업을 분할해 진행할 때 자주 쓴다. 「タスクを一人ずつ割り当てる」「テストを段階的に少しずつ進める」',
  (SELECT COALESCE(max(seq),0)+1 FROM jlpt_grammar WHERE jlpt_level='N4'),
  now(),
  (SELECT COALESCE(max(seq),0)+1 FROM jlpt_grammar WHERE jlpt_level='N4');
\echo '== 추가결과 확인 =='
SELECT pattern, jlpt_level, category, seq FROM jlpt_grammar WHERE pattern='〜ずつ';
\echo '== N4 문법 개수/maxseq =='
SELECT count(*) cnt, max(seq) maxseq FROM jlpt_grammar WHERE jlpt_level='N4';
