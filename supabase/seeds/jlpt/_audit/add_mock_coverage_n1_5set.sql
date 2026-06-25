-- add_mock_coverage_n1_5set.sql
-- N1 모의 5세트 言語知識 225문항 커버리지 보완 (2026-06-26)
-- 어휘: 0건 MISSING (전부 jlpt_vocabulary 에 존재)
-- 문법: 8건 MISSING → jlpt_grammar INSERT

-- 1. 〜をしも (강조·문어, emphasis)
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT
  gen_random_uuid(),
  '〜をしも',
  '〜조차도, 〜마저도 (문어·강조)',
  '〜さえも（文語的強調）',
  'N1',
  '名詞 + をしも',
  '文語的な強調表現。「〜でさえも」の意。現代語では「をさえ」に相当。',
  'emphasis',
  '[{"ja": "鬼をしも泣かしむほどの悲話だった。", "ko": "귀신조차 울게 할 만한 비화였다."}]'::jsonb,
  0
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜をしも');

-- 2. 〜に先んじて (時間, time)
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT
  gen_random_uuid(),
  '〜に先んじて',
  '〜보다 먼저, 〜에 앞서',
  '〜より先に行動する',
  'N1',
  '名詞 + に先んじて',
  '他者の行動より先に何かをする場合に使う。「〜に先立って」より競争・優位のニュアンスが強い。',
  'time',
  '[{"ja": "他社に先んじて、わが社はAI技術の実用化に取り組んできた。", "ko": "다른 회사보다 먼저, 우리 회사는 AI 기술의 실용화에 힘써왔다."}]'::jsonb,
  0
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に先んじて');

-- 3. 〜とは裏腹に (対比, contrast)
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT
  gen_random_uuid(),
  '〜とは裏腹に',
  '〜와는 반대로, 〜와 정반대로',
  '〜と正反対に・〜に反して',
  'N1',
  '名詞・文 + とは裏腹に',
  '外見や予想と実際が正反対であることを表す。「外見とは裏腹に」「期待とは裏腹に」の形が多い。',
  'contrast',
  '[{"ja": "外見の強面とは裏腹に、彼は非常に優しい性格だ。", "ko": "험상궂은 외모와는 달리, 그는 매우 온화한 성격이다."}]'::jsonb,
  0
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜とは裏腹に');

-- 4. 〜はいうまでもなく (強調, emphasis)
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT
  gen_random_uuid(),
  '〜はいうまでもなく',
  '〜은/는 말할 것도 없이',
  '〜は当然のこととして、さらに〜',
  'N1',
  '名詞 + はいうまでもなく（、〜も）',
  '「〜は当然だ」という前提のもと、さらに別の事柄を付け加える表現。「いうまでもない」単独でも使う。',
  'emphasis',
  '[{"ja": "健康が大切なのはいうまでもなく、日々の生活習慣が重要だ。", "ko": "건강이 중요한 것은 말할 것도 없고, 일상 생활 습관이 중요하다."}]'::jsonb,
  0
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜はいうまでもなく');

-- 5. 〜めく / 〜めいた (様態, manner)
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT
  gen_random_uuid(),
  '〜めく / 〜めいた',
  '〜스럽다, 〜다운 느낌이 나다',
  '〜らしい様子・雰囲気を帯びる',
  'N1',
  '名詞 + めく / 名詞 + めいた + 名詞',
  '「春めく」「謎めいた」のように、ある物事がそれらしい雰囲気を持つことを表す。連体修飾では「めいた」を使う。',
  'manner',
  '[{"ja": "桜の花が咲き始め、街全体が春めいた季節になってきた。", "ko": "벚꽃이 피기 시작하며, 거리 전체가 봄다운 계절이 되었다."}]'::jsonb,
  0
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜めく / 〜めいた');

-- 6. 〜ないものでもない (推量, conjecture)
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT
  gen_random_uuid(),
  '〜ないものでもない',
  '〜할 수 없는 것도 아니다, 가능성이 전혀 없지는 않다',
  '不可能ではない・〜する可能性がゼロではない（婉曲）',
  'N1',
  '動詞ない形 + ものでもない',
  '「絶対無理ではないが、かなり難しい」という婉曲な可能性を表す。「〜ないこともない」より控えめ。',
  'conjecture',
  '[{"ja": "条件次第では、協力できないものでもない。", "ko": "조건에 따라서는 협력할 수 없는 것도 아니다."}]'::jsonb,
  0
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ないものでもない');

-- 7. 〜ないではすまない (義務, obligation)
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT
  gen_random_uuid(),
  '〜ないではすまない',
  '〜하지 않고는 끝나지 않는다, 반드시 〜해야 한다',
  '〜せずには済まない・必ず〜しなければならない',
  'N1',
  '動詞ない形 + ではすまない',
  '「〜ずにはすまない」のて形バリアント。道義上・社会的に〜せざるを得ない状況を表す。',
  'obligation',
  '[{"ja": "公的資金を不正に使用したとなれば、当然説明責任を果たさないではすまない。", "ko": "공적 자금을 부정으로 사용했다면, 당연히 책임을 지지 않고는 끝나지 않는다."}]'::jsonb,
  0
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ないではすまない');

-- 8. 〜ところへ (時間, time)
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT
  gen_random_uuid(),
  '〜ところへ',
  '〜하고 있는 상황에 (마침 다른 일이 일어나다)',
  '〜している最中に別のことが起きる',
  'N1',
  '動詞ている形 + ところへ',
  'ある状況が続いているまさにその時に、別の出来事が加わることを表す。「〜ところに」とほぼ同義だが、「ところへ」は人・物の到来・変化のニュアンスが強い。',
  'time',
  '[{"ja": "会議が白熱しているきわどいところへ、部長が突然倒れるという事態が起きた。", "ko": "회의가 열기를 띠고 있는 아슬아슬한 순간에, 부장이 갑자기 쓰러지는 사태가 발생했다."}]'::jsonb,
  0
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ところへ');