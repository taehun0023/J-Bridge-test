-- ============================================
-- JLPT Grammar Content Seed Data
-- N5(30) + N4(30) + N3(25) + N2(25) + N1(20) = 130 grammar points
-- ============================================

DELETE FROM jlpt_grammar;

-- ============================================
-- N5 Grammar Points (30)
-- ============================================

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜です/ます',
  '~입니다/~합니다',
  '丁寧語を表す。聞き手に対して丁寧に述べる表現。日本語の基本的な敬語表現。',
  'N5',
  '名詞 + です / 動詞ます形',
  '명사 + です / 동사 ます형 (예: 食べます, 行きます) / い형용사 → ~いです / な형용사 → ~です',
  'formal',
  '[{"ja":"私はエンジニアです。","ko":"저는 엔지니어입니다.","highlight":"です"},{"ja":"毎日コードレビューをします。","ko":"매일 코드 리뷰를 합니다.","highlight":"します"}]'::jsonb,
  ARRAY['〜だ', '〜である', '〜でございます'],
  '한국어의 「합니다/입니다」에 해당하지만, 일본어에서는 い형용사에도 です를 붙인다 (暑いです). 한국어에는 없는 형태이므로 주의.',
  'IT현장: 비즈니스 메일이나 회의에서 기본적으로 です/ます체를 사용. 「納期は来週の金曜日です」「テストを実施します」',
  1
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ない',
  '~하지 않다',
  '否定を表す。動作や状態を否定する表現。',
  'N5',
  '動詞ない形 / い形容詞 → 〜くない / な形容詞 → 〜ではない',
  '동사 ない형 (예: 食べない, 行かない) / い형용사 → ~くない (예: 高くない) / な형용사 → ~ではない (예: 静かではない)',
  'contrast',
  '[{"ja":"今日は雨が降らない。","ko":"오늘은 비가 오지 않는다.","highlight":"降らない"},{"ja":"このバグはまだ修正していない。","ko":"이 버그는 아직 수정하지 않았다.","highlight":"修正していない"}]'::jsonb,
  ARRAY['〜ません', '〜なかった', '〜ず'],
  '동사의 ない형 변환 시 그룹별 규칙 혼동 주의. 특히 1그룹 동사의 あ단 변환을 자주 틀린다 (예: 書く→書かない, ×書きない).',
  'IT현장: 「この機能はまだ実装していない」「テストが通らない場合は原因を調査してください」',
  2
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜たい',
  '~하고 싶다',
  '願望を表す。話し手自身の希望・欲求を表す表現。',
  'N5',
  '動詞ます形(ますを取る) + たい',
  '동사 ます형에서 ます를 제거하고 + たい (예: 食べます → 食べたい, 行きます → 行きたい)',
  'desire',
  '[{"ja":"日本に行きたいです。","ko":"일본에 가고 싶습니다.","highlight":"行きたい"},{"ja":"新しいフレームワークを学びたいです。","ko":"새로운 프레임워크를 배우고 싶습니다.","highlight":"学びたい"}]'::jsonb,
  ARRAY['〜たがる', '〜てほしい', '〜がる'],
  '「〜たい」는 1인칭(나)에만 사용. 3인칭의 희망은 「〜たがっている」를 사용. 또한 조사 を→が 변환에 주의 (水を飲みたい / 水が飲みたい 둘 다 가능).',
  'IT현장: 「このプロジェクトに参加したいです」「Pythonのスキルを伸ばしたいと思っています」',
  3
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜てください',
  '~해 주세요',
  '依頼を表す。相手に丁寧にお願いする表現。',
  'N5',
  'て形 + ください',
  '동사 て형 + ください (예: 食べてください, 書いてください, 見てください)',
  'manner',
  '[{"ja":"ここに名前を書いてください。","ko":"여기에 이름을 써 주세요.","highlight":"書いてください"},{"ja":"プルリクエストを確認してください。","ko":"풀 리퀘스트를 확인해 주세요.","highlight":"確認してください"}]'::jsonb,
  ARRAY['〜ていただけますか', '〜てくれませんか', '〜ないでください'],
  '「〜てください」는 정중한 부탁이지만, 상사에게는 「〜ていただけますか」가 더 적절. 한국어 「~해 주세요」보다 사용 범위가 넓다.',
  'IT현장: 「このコードをレビューしてください」「デプロイ前にテストを実行してください」',
  4
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ている',
  '~하고 있다',
  '進行・状態を表す。動作の進行中、結果の状態、習慣などを表す表現。',
  'N5',
  'て形 + いる',
  '동사 て형 + いる (예: 食べている, 読んでいる, 住んでいる). 구어에서는 い가 생략되어 「〜てる」로 쓰이기도 함.',
  'time',
  '[{"ja":"今、本を読んでいます。","ko":"지금 책을 읽고 있습니다.","highlight":"読んでいます"},{"ja":"現在、新しい機能を開発しています。","ko":"현재 새로운 기능을 개발하고 있습니다.","highlight":"開発しています"}]'::jsonb,
  ARRAY['〜てある', '〜ておく', '〜ところだ'],
  '「〜ている」는 진행(食べている=먹고 있다)과 상태(結婚している=결혼해 있다) 두 가지 의미. 한국어에서는 「~하고 있다」와 「~해 있다」로 구분하지만, 일본어에서는 같은 형태.',
  'IT현장: 「今テストを実行しています」「このモジュールは別チームが担当しています」 - 진행 상황 보고에 필수 표현.',
  5
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜た',
  '~했다',
  '過去を表す。動作や出来事が過去に起こったことを表す。',
  'N5',
  '動詞た形',
  '동사 た형 (예: 食べた, 行った, 読んだ). 그룹별 변환 규칙을 따른다. 1그룹: う/つ/る→った, む/ぶ/ぬ→んだ, く→いた, ぐ→いだ, す→した',
  'time',
  '[{"ja":"昨日、映画を見た。","ko":"어제 영화를 봤다.","highlight":"見た"},{"ja":"先週のスプリントでバグを5つ修正した。","ko":"지난주 스프린트에서 버그를 5개 수정했다.","highlight":"修正した"}]'::jsonb,
  ARRAY['〜ました', '〜たことがある', '〜たばかり'],
  'た형 변환은 て형과 같은 규칙. 「行った」(いった)와 혼동하지 않도록 주의. 불규칙동사: する→した, くる→きた.',
  'IT현장: 「デプロイが完了した」「昨日のミーティングで決まった仕様を共有します」 - 완료 보고에 사용.',
  6
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜から',
  '~때문에/~니까',
  '理由を表す。原因や理由を述べる表現。',
  'N5',
  '普通形 / 丁寧形 + から',
  '동사/형용사 보통형 + から (예: 暑いから, 行くから) / 정중형도 가능 (예: 暑いですから). 명사/な형용사 + だから',
  'reason',
  '[{"ja":"暑いから、エアコンをつけた。","ko":"더우니까 에어컨을 켰다.","highlight":"暑いから"},{"ja":"納期が近いから、残業します。","ko":"납기가 가까우니까 야근합니다.","highlight":"近いから"}]'::jsonb,
  ARRAY['〜ので', '〜ため', '〜し'],
  '「から」는 주관적 이유, 「ので」는 객관적 이유. 한국어의 「~니까」와 「~때문에」를 구분하듯이 사용. 비즈니스에서는 「ので」가 더 정중.',
  'IT현장: 캐주얼한 이유 설명에 사용. 「テストが通らないから、マージできません」. 정중한 상황에서는 「〜ので」를 추천.',
  7
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜けど/が',
  '~지만',
  '逆接を表す。前の文と後ろの文が対立する関係を表す。',
  'N5',
  '普通形 + けど / 丁寧形 + が',
  '동사/형용사 보통형 + けど (구어) / 정중형 + が (문어, 정중). 명사/な형용사 + だけど / ですが',
  'contrast',
  '[{"ja":"高いけど、おいしいです。","ko":"비싸지만 맛있습니다.","highlight":"高いけど"},{"ja":"実装は終わりましたが、テストがまだです。","ko":"구현은 끝났지만 테스트가 아직입니다.","highlight":"終わりましたが"}]'::jsonb,
  ARRAY['〜のに', '〜ても', '〜にもかかわらず'],
  '「けど」는 구어체, 「が」는 문어체/정중체. 한국어 「~지만」과 대응하지만, 전치(前置き)로도 사용됨 (예: すみませんが = 실례지만).',
  'IT현장: 「機能は完成しましたが、パフォーマンスの改善が必要です」 - 보고 시 역접 표현으로 자주 사용.',
  8
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜と思う',
  '~라고 생각하다',
  '考えを表す。話し手の意見や考えを述べる表現。',
  'N5',
  '普通形 + と思う',
  '동사/형용사 보통형 + と思う (예: 行くと思う, 高いと思う). な형용사 → ~だと思う, 명사 → ~だと思う',
  'conjecture',
  '[{"ja":"明日は晴れると思います。","ko":"내일은 맑을 거라고 생각합니다.","highlight":"晴れると思います"},{"ja":"この設計で問題ないと思います。","ko":"이 설계로 문제없다고 생각합니다.","highlight":"問題ないと思います"}]'::jsonb,
  ARRAY['〜と考える', '〜と思っている', '〜ではないかと思う'],
  '「〜と思う」(지금 생각하다)와 「〜と思っている」(계속 그렇게 생각하고 있다)의 차이 주의. 또한 「思います」 앞에는 보통형이 온다 (×高いですと思います → ○高いと思います).',
  'IT현장: 의견을 말할 때 필수 표현. 「この方法が最適だと思います」「来週までに完了できると思います」',
  9
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ことができる',
  '~할 수 있다',
  '能力を表す。能力や可能性を表す表現。',
  'N5',
  '動詞辞書形 + ことができる',
  '동사 사전형 + ことができる (예: 食べることができる, 話すことができる). 보다 구어적인 표현으로 가능형도 있다 (예: 食べられる).',
  'ability',
  '[{"ja":"日本語を話すことができます。","ko":"일본어를 말할 수 있습니다.","highlight":"話すことができます"},{"ja":"Pythonでスクリプトを書くことができます。","ko":"Python으로 스크립트를 작성할 수 있습니다.","highlight":"書くことができます"}]'::jsonb,
  ARRAY['〜られる', '〜える', '〜かねる'],
  '「〜ことができる」는 격식체, 가능형(食べられる)은 구어체. 「ら抜き言葉」(食べれる)는 문법적으로 비표준이므로 비즈니스에서는 피할 것.',
  'IT현장: 스킬을 어필할 때 사용. 「JavaとPythonを使うことができます」「このAPIで自動化することができます」',
  10
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜前に/後で',
  '~전에/~후에',
  '時間の前後を表す。ある動作の前や後のタイミングを表す。',
  'N5',
  '動詞辞書形 + 前に / 動詞た形 + 後で',
  '동사 사전형 + 前に (예: 食べる前に) / 동사 た형 + 後で (예: 食べた後で). 명사 + の前に/の後で',
  'time',
  '[{"ja":"寝る前に歯を磨きます。","ko":"자기 전에 이를 닦습니다.","highlight":"寝る前に"},{"ja":"コードを書いた後で、テストを実行します。","ko":"코드를 작성한 후에 테스트를 실행합니다.","highlight":"書いた後で"}]'::jsonb,
  ARRAY['〜てから', '〜たら', '〜うちに'],
  '「前に」 앞에는 사전형, 「後で」 앞에는 た형이 온다. 한국어와 달리 「前に」 앞에는 시제가 변하지 않는다 (×食べた前に → ○食べる前に).',
  'IT현장: 작업 순서 설명에 필수. 「デプロイする前にテストを確認してください」「ミーティングの後で議事録を共有します」',
  11
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜時',
  '~할 때',
  '時間を表す。ある動作や状態が行われる時点を表す。',
  'N5',
  '動詞普通形 + 時 / い形容詞 + 時 / な形容詞 + な + 時 / 名詞 + の + 時',
  '동사 보통형 + 時 (예: 行く時, 行った時) / い형용사 + 時 (예: 暑い時) / な형용사 + な時 (예: 暇な時) / 명사 + の時 (예: 子供の時)',
  'time',
  '[{"ja":"困った時は、先生に聞きます。","ko":"곤란할 때는 선생님에게 물어봅니다.","highlight":"困った時"},{"ja":"エラーが出た時は、ログを確認してください。","ko":"에러가 났을 때는 로그를 확인해 주세요.","highlight":"出た時"}]'::jsonb,
  ARRAY['〜場合', '〜際', '〜たら'],
  '「行く時」(갈 때)와 「行った時」(갔을 때)의 시제 차이 주의. 「〜時」 앞의 시제는 주절 시제와 독립적으로 결정된다.',
  'IT현장: 조건부 설명에 사용. 「ビルドに失敗した時は、このドキュメントを参照してください」',
  12
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ましょう',
  '~합시다',
  '勧誘を表す。相手に一緒に何かをすることを提案する表現。',
  'N5',
  '動詞ます形(ますを取る) + ましょう',
  '동사 ます형에서 ます를 제거하고 + ましょう (예: 食べましょう, 行きましょう, しましょう)',
  'manner',
  '[{"ja":"一緒にお昼を食べましょう。","ko":"같이 점심을 먹읍시다.","highlight":"食べましょう"},{"ja":"まずタスクを整理しましょう。","ko":"먼저 태스크를 정리합시다.","highlight":"整理しましょう"}]'::jsonb,
  ARRAY['〜ませんか', '〜ましょうか', '〜よう'],
  '「〜ましょう」는 권유, 「〜ましょうか」는 제안/도움 제공의 의미 차이 주의. 한국어 「~합시다」와 거의 1:1 대응.',
  'IT현장: 회의에서 자주 사용. 「スクラムミーティングを始めましょう」「この問題について話し合いましょう」',
  13
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜でしょう',
  '~겠지요/~일 것이다',
  '推量を表す。話し手の推測や確認を表す表現。',
  'N5',
  '普通形 + でしょう',
  '동사/형용사 보통형 + でしょう (예: 行くでしょう, 高いでしょう). 명사/な형용사 + でしょう (だ는 붙이지 않음)',
  'conjecture',
  '[{"ja":"明日は天気がいいでしょう。","ko":"내일은 날씨가 좋겠지요.","highlight":"いいでしょう"},{"ja":"このタスクは来週までに終わるでしょう。","ko":"이 태스크는 다음 주까지 끝나겠지요.","highlight":"終わるでしょう"}]'::jsonb,
  ARRAY['〜だろう', '〜かもしれない', '〜と思う'],
  '「でしょう」는 정중한 추측, 「だろう」는 캐주얼한 추측. 의문문에서는 확인의 의미 (知っているでしょう？= 알고 있지요?). 한국어 「~겠지요」와 유사.',
  'IT현장: 예측이나 확인에 사용. 「テストは問題なく通るでしょう」「この改善でパフォーマンスは上がるでしょう」',
  14
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜つもり',
  '~할 생각이다',
  '意志を表す。話し手の意志や予定を表す表現。',
  'N5',
  '動詞辞書形 + つもり / 動詞ない形 + つもり',
  '동사 사전형 + つもり (예: 行くつもり) / 동사 ない형 + つもり (예: 行かないつもり). 과거: 〜たつもり (한 셈이다)',
  'desire',
  '[{"ja":"来年、日本に留学するつもりです。","ko":"내년에 일본에 유학할 생각입니다.","highlight":"留学するつもり"},{"ja":"今週中にこの機能を実装するつもりです。","ko":"이번 주 안에 이 기능을 구현할 생각입니다.","highlight":"実装するつもり"}]'::jsonb,
  ARRAY['〜予定だ', '〜ようと思う', '〜たいと思う'],
  '「〜つもり」는 이미 결정된 의지, 「〜ようと思う」는 아직 결정 중인 의지. 「〜たつもり」는 실제와 다를 때도 사용 (勉強したつもり = 공부한 셈이다/했다고 생각한다).',
  'IT현장: 계획 공유에 사용. 「明日のミーティングで提案するつもりです」「このアプローチで進めるつもりです」',
  15
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜すぎる',
  '너무 ~하다',
  '程度が過度であることを表す。動作や状態が度を超えていることを示す。',
  'N5',
  '動詞ます形(ますを取る) + すぎる / い形容詞(いを取る) + すぎる / な形容詞 + すぎる',
  '동사 ます형에서 ます를 제거하고 + すぎる (예: 食べすぎる, 飲みすぎる) / い형용사에서 い를 제거 + すぎる (예: 高すぎる) / な형용사 + すぎる (예: 静かすぎる)',
  'degree',
  '[{"ja":"昨日、食べすぎてお腹が痛い。","ko":"어제 너무 많이 먹어서 배가 아프다.","highlight":"食べすぎて"},{"ja":"このコードは複雑すぎて読めません。","ko":"이 코드는 너무 복잡해서 읽을 수 없습니다.","highlight":"複雑すぎて"}]'::jsonb,
  ARRAY['〜すぎ', '〜あまり', '〜ほど'],
  '「すぎる」는 부정적 뉘앙스가 많다. い형용사의 い를 반드시 제거해야 한다 (×高いすぎる → ○高すぎる). 「いい」는 「よすぎる」로 변환.',
  'IT현장: 「このメソッドは長すぎるので分割しましょう」「処理時間がかかりすぎています」',
  16
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜やすい/にくい',
  '~하기 쉽다/~하기 어렵다',
  '容易さ・困難さを表す。動作のしやすさやしにくさを表す表現。',
  'N5',
  '動詞ます形(ますを取る) + やすい/にくい',
  '동사 ます형에서 ます를 제거하고 + やすい (예: 読みやすい) / + にくい (예: 読みにくい). い형용사처럼 활용 (やすかった, にくくない 등).',
  'degree',
  '[{"ja":"この本は読みやすいです。","ko":"이 책은 읽기 쉽습니다.","highlight":"読みやすい"},{"ja":"このUIは使いにくいので改善が必要です。","ko":"이 UI는 사용하기 어려워서 개선이 필요합니다.","highlight":"使いにくい"}]'::jsonb,
  ARRAY['〜がたい', '〜づらい', '〜ことができる'],
  '「やすい」는 객관적으로 쉬움, 「にくい」는 객관적으로 어려움을 나타냄. 「づらい」는 심리적/신체적 어려움. 「にくい」와 「づらい」를 혼동하지 말 것.',
  'IT현장: 「このAPIは使いやすいです」「エラーメッセージがわかりにくいので修正してください」',
  17
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ほうがいい',
  '~하는 게 좋다',
  '助言を表す。相手にアドバイスや提案をする表現。',
  'N5',
  '動詞た形 + ほうがいい / 動詞ない形 + ほうがいい',
  '동사 た형 + ほうがいい (예: 行ったほうがいい = 가는 게 좋다) / 동사 ない형 + ほうがいい (예: 行かないほうがいい = 가지 않는 게 좋다)',
  'manner',
  '[{"ja":"早く寝たほうがいいですよ。","ko":"일찍 자는 게 좋아요.","highlight":"寝たほうがいい"},{"ja":"本番環境に直接デプロイしないほうがいいです。","ko":"운영 환경에 직접 배포하지 않는 게 좋습니다.","highlight":"しないほうがいい"}]'::jsonb,
  ARRAY['〜べきだ', '〜たらどうですか', '〜といい'],
  '긍정 조언은 た형 (行ったほうがいい), 부정 조언은 ない형 (行かないほうがいい). 사전형으로 쓰면 부자연스러움 (×行くほうがいい → ○行ったほうがいい).',
  'IT현장: 「バックアップを取ったほうがいいですよ」「このライブラリは使わないほうがいいです」',
  18
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜と(条件)',
  '~하면',
  '条件を表す。一般的な事実や習慣的な条件を表す表現。',
  'N5',
  '動詞辞書形 + と / い形容詞 + と / な形容詞 + だと / 名詞 + だと',
  '동사 사전형 + と (예: 押すと = 누르면) / い형용사 + と (예: 寒いと) / な형용사 + だと / 명사 + だと. 항상 같은 결과가 나오는 조건에 사용.',
  'condition',
  '[{"ja":"このボタンを押すと、画面が変わります。","ko":"이 버튼을 누르면 화면이 바뀝니다.","highlight":"押すと"},{"ja":"ログインすると、ダッシュボードが表示されます。","ko":"로그인하면 대시보드가 표시됩니다.","highlight":"ログインすると"}]'::jsonb,
  ARRAY['〜たら', '〜ば', '〜なら'],
  '「と」 뒤에는 의지 표현(〜してください, 〜しましょう)이 올 수 없다. 자연적/기계적 결과에 적합. 한국어 「~하면」과 유사하지만 사용 범위가 더 제한적.',
  'IT현장: 시스템 동작 설명에 사용. 「このリンクをクリックすると、詳細ページに遷移します」「エラーが発生すると、ログに記録されます」',
  19
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜なら',
  '~라면',
  '条件を表す。相手の発言や状況を受けて条件を述べる表現。',
  'N5',
  '普通形 + なら / 名詞 + なら / な形容詞 + なら',
  '동사 보통형 + なら (예: 行くなら) / 명사 + なら (예: 日本なら) / な형용사 + なら (예: 暇なら). 상대의 발언/상황을 전제로 조건을 제시.',
  'condition',
  '[{"ja":"日本に行くなら、京都がおすすめです。","ko":"일본에 간다면 교토를 추천합니다.","highlight":"行くなら"},{"ja":"Pythonを使うなら、このライブラリがおすすめです。","ko":"Python을 사용한다면 이 라이브러리를 추천합니다.","highlight":"使うなら"}]'::jsonb,
  ARRAY['〜たら', '〜ば', '〜と'],
  '「なら」는 상대의 말을 받아 조건을 제시할 때 사용. 「たら」는 시간 순서, 「ば」는 일반 조건과 차이. 「なら」 뒤에는 조언/제안이 자주 온다.',
  'IT현장: 제안/추천에 사용. 「フロントエンドなら、Reactがいいと思います」「パフォーマンスを重視するなら、Goを検討してください」',
  20
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ば',
  '~하면/~한다면',
  '仮定条件を表す。仮定の条件を述べる表現。',
  'N5',
  '動詞ば形 / い形容詞(いを取る) + ければ / な形容詞 + であれば / 名詞 + であれば',
  '동사 ば형: 1그룹 う단→え단+ば (예: 書く→書けば), 2그룹 る→れば (예: 食べれば), 불규칙 する→すれば, くる→くれば / い형용사: い→ければ (예: 高ければ)',
  'condition',
  '[{"ja":"天気がよければ、公園に行きます。","ko":"날씨가 좋으면 공원에 갑니다.","highlight":"よければ"},{"ja":"テストが通れば、マージしてください。","ko":"테스트가 통과하면 머지해 주세요.","highlight":"通れば"}]'::jsonb,
  ARRAY['〜たら', '〜と', '〜なら'],
  '「ば」는 일반적/논리적 조건에 사용. 「〜ば〜ほど」(~하면 ~할수록)의 형태도 중요. 상태동사에는 사용 가능하지만, 의지동사 + ば + 의지 표현은 부자연스러움.',
  'IT현장: 조건 제시에 사용. 「この設定を変更すれば、問題は解決するはずです」「もっとテストを書けば、品質が上がります」',
  21
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜たら',
  '~하면/~했더니',
  '条件・発見を表す。条件や予想外の発見を表す表現。',
  'N5',
  '動詞た形 + ら / い形容詞(いを取る) + かったら / な形容詞 + だったら / 名詞 + だったら',
  '동사 た형 + ら (예: 行ったら, 食べたら) / い형용사: い→かったら (예: 高かったら) / な형용사/명사 + だったら (예: 静かだったら, 学生だったら)',
  'condition',
  '[{"ja":"家に帰ったら、電話してください。","ko":"집에 돌아가면 전화해 주세요.","highlight":"帰ったら"},{"ja":"ビルドしたら、エラーが出ました。","ko":"빌드했더니 에러가 나왔습니다.","highlight":"ビルドしたら"}]'::jsonb,
  ARRAY['〜ば', '〜と', '〜なら'],
  '「たら」는 가장 범용적인 조건 표현. 의지 표현도 뒤에 올 수 있다. 과거형(〜たら〜た)은 「~했더니」의 발견 의미. 한국어 「~하면」과 가장 가깝다.',
  'IT현장: 「デプロイしたら、動作確認をしてください」「調べたら、原因がわかりました」',
  22
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜方',
  '~하는 방법',
  '方法を表す。物事のやり方・方法を表す表現。',
  'N5',
  '動詞ます形(ますを取る) + 方(かた)',
  '동사 ます형에서 ます를 제거하고 + 方(かた) (예: 読み方 = 읽는 방법, 作り方 = 만드는 방법, 使い方 = 사용법)',
  'manner',
  '[{"ja":"この漢字の読み方を教えてください。","ko":"이 한자의 읽는 방법을 알려 주세요.","highlight":"読み方"},{"ja":"このツールの使い方がわかりません。","ko":"이 도구의 사용법을 모르겠습니다.","highlight":"使い方"}]'::jsonb,
  ARRAY['〜方法', '〜やり方', '〜手順'],
  '「方」는 「かた」로 읽는다. 명사로 취급되어 「の」「が」「を」등 조사가 붙을 수 있다. 「仕方」(しかた = 방법)는 특별한 복합어.',
  'IT현장: 「Gitの使い方を説明します」「このAPIの呼び出し方を確認してください」',
  23
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜てはいけない',
  '~해서는 안 된다',
  '禁止を表す。ある行為を禁止する表現。',
  'N5',
  'て形 + はいけない',
  '동사 て형 + はいけない (예: 入ってはいけない, 触ってはいけない). 정중형: 〜てはいけません. 구어: 〜ちゃいけない/〜ちゃだめ.',
  'obligation',
  '[{"ja":"ここで写真を撮ってはいけません。","ko":"여기서 사진을 찍어서는 안 됩니다.","highlight":"撮ってはいけません"},{"ja":"本番環境のデータを直接変更してはいけません。","ko":"운영 환경의 데이터를 직접 변경해서는 안 됩니다.","highlight":"変更してはいけません"}]'::jsonb,
  ARRAY['〜てもいい', '〜ないでください', '〜べきではない'],
  '「〜てはいけない」(금지)와 「〜なくてもいい」(불필요)를 혼동하지 말 것. 구어에서는 「〜ちゃだめ」가 더 자연스럽다. 격식적으로는 「〜てはなりません」도 사용.',
  'IT현장: 규칙 설명에 사용. 「mainブランチに直接プッシュしてはいけません」「パスワードをハードコーディングしてはいけません」',
  24
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜なくてもいい',
  '~하지 않아도 된다',
  '不必要を表す。ある行為をする必要がないことを表す表現。',
  'N5',
  '動詞ない形(ないを取る) + なくてもいい',
  '동사 ない형에서 ない를 제거하고 + なくてもいい (예: 行かなくてもいい, 食べなくてもいい). 정중형: 〜なくてもいいです.',
  'permission',
  '[{"ja":"明日は来なくてもいいですよ。","ko":"내일은 오지 않아도 됩니다.","highlight":"来なくてもいい"},{"ja":"全部のテストを手動で実行しなくてもいいです。","ko":"모든 테스트를 수동으로 실행하지 않아도 됩니다.","highlight":"実行しなくてもいい"}]'::jsonb,
  ARRAY['〜てもいい', '〜てはいけない', '〜必要はない'],
  '「〜なくてもいい」는 불필요를 나타냄. 「〜なければならない」(의무)의 반대. 한국어 「~하지 않아도 된다」와 정확히 대응. 격식적으로는 「〜必要はありません」도 사용.',
  'IT현장: 불필요 설명에 사용. 「この部分はテストしなくてもいいです」「毎回ビルドし直さなくてもいいですよ」',
  25
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜てあげる/もらう/くれる',
  '~해 주다/~해 받다/~해 주다(상대가)',
  '授受を表す。行為の授受関係を表す表現。',
  'N5',
  'て形 + あげる/もらう/くれる',
  '동사 て형 + あげる (내가 남에게 해줌) / もらう (남이 나에게 해줌 - 받는 쪽 시점) / くれる (남이 나에게 해줌 - 주는 쪽 시점)',
  'manner',
  '[{"ja":"友達に日本語を教えてあげました。","ko":"친구에게 일본어를 가르쳐 주었습니다.","highlight":"教えてあげました"},{"ja":"先輩にコードをレビューしてもらいました。","ko":"선배에게 코드 리뷰를 받았습니다.","highlight":"レビューしてもらいました"}]'::jsonb,
  ARRAY['〜ていただく', '〜てくださる', '〜てさしあげる'],
  '「あげる」는 자신이 해주는 것, 「もらう」는 받는 쪽 관점, 「くれる」는 주는 쪽 관점. 한국어에는 이 3가지 구분이 없으므로 특히 주의 필요.',
  'IT현장: 협업 표현에 사용. 「デザインチームにモックアップを作ってもらいました」「後輩にデプロイ手順を教えてあげました」',
  26
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ようと思う',
  '~하려고 생각하다',
  '意志を表す。これからしようという意志を表す表現。',
  'N5',
  '動詞意向形 + と思う',
  '동사 의향형 + と思う (예: 行こうと思う, 食べようと思う). 의향형: 1그룹 う단→おう단 (예: 書く→書こう), 2그룹 る→よう (예: 食べよう), する→しよう, くる→こよう',
  'desire',
  '[{"ja":"来月から運動しようと思います。","ko":"다음 달부터 운동하려고 생각합니다.","highlight":"運動しようと思います"},{"ja":"新しいプログラミング言語を勉強しようと思っています。","ko":"새로운 프로그래밍 언어를 공부하려고 생각하고 있습니다.","highlight":"勉強しようと思っています"}]'::jsonb,
  ARRAY['〜つもりだ', '〜たいと思う', '〜予定だ'],
  '「〜ようと思う」는 아직 확정되지 않은 의지, 「〜つもりだ」는 확정된 의지. 「〜ようと思っている」는 이전부터 계속 생각해 왔다는 의미.',
  'IT현장: 계획 공유에 사용. 「このアーキテクチャを採用しようと思います」「テスト自動化を進めようと思っています」',
  27
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜に行く',
  '~하러 가다',
  '目的を表す。ある目的のために移動することを表す表現。',
  'N5',
  '動詞ます形(ますを取る) + に行く/来る',
  '동사 ます형에서 ます를 제거하고 + に行く/に来る (예: 食べに行く = 먹으러 가다, 見に来る = 보러 오다). 명사 + に行く (예: 買い物に行く)',
  'manner',
  '[{"ja":"映画を見に行きましょう。","ko":"영화를 보러 갑시다.","highlight":"見に行きましょう"},{"ja":"クライアント先にヒアリングしに行きます。","ko":"클라이언트에게 히어링하러 갑니다.","highlight":"ヒアリングしに行きます"}]'::jsonb,
  ARRAY['〜ために行く', '〜てくる', '〜ていく'],
  '이동 동사(行く/来る)와 결합하여 목적을 나타냄. 「〜に行く」의 に는 목적을 나타내는 조사. 한국어 「~하러 가다」와 정확히 대응.',
  'IT현장: 외출/이동 목적 표현에 사용. 「お客様のところに打ち合わせに行きます」「サーバールームに確認しに行ってきます」',
  28
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜始める/終わる',
  '~하기 시작하다/~하기 끝나다',
  '開始・終了を表す。動作の開始や終了を表す複合動詞。',
  'N5',
  '動詞ます形(ますを取る) + 始める/終わる',
  '동사 ます형에서 ます를 제거하고 + 始める (예: 読み始める = 읽기 시작하다) / + 終わる (예: 読み終わる = 다 읽다)',
  'time',
  '[{"ja":"雨が降り始めました。","ko":"비가 내리기 시작했습니다.","highlight":"降り始めました"},{"ja":"テストの実行が終わりました。","ko":"테스트 실행이 끝났습니다.","highlight":"終わりました"}]'::jsonb,
  ARRAY['〜出す', '〜かける', '〜続ける'],
  '「始める」는 의도적/자연적 시작 모두 가능. 「出す」는 갑작스러운 시작 (泣き出す = 울기 시작하다). 「終わる」는 자동사, 「終える」는 타동사.',
  'IT현장: 진행 상황 보고에 사용. 「ビルドが走り始めました」「データの移行が終わりました」',
  29
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ので',
  '~이므로/~이기 때문에',
  '理由を表す。客観的な理由や原因を丁寧に述べる表現。',
  'N5',
  '普通形 + ので / な形容詞 + な + ので / 名詞 + な + ので',
  '동사/い형용사 보통형 + ので (예: 行くので, 高いので) / な형용사 + なので (예: 静かなので) / 명사 + なので (예: 学生なので). 정중형 + ので도 가능.',
  'reason',
  '[{"ja":"体調が悪いので、今日は休みます。","ko":"컨디션이 안 좋으므로 오늘은 쉬겠습니다.","highlight":"悪いので"},{"ja":"テストが失敗したので、原因を調査します。","ko":"테스트가 실패했으므로 원인을 조사합니다.","highlight":"失敗したので"}]'::jsonb,
  ARRAY['〜から', '〜ため', '〜し'],
  '「ので」는 객관적/정중한 이유, 「から」는 주관적/캐주얼한 이유. 비즈니스에서는 「ので」가 더 적절. な형용사/명사 뒤에는 「なので」(だので는 틀림).',
  'IT현장: 정중한 이유 설명에 필수. 「仕様が変更されたので、実装を修正します」「依存関係があるので、先にこちらのタスクを完了させます」',
  30
);

-- ============================================
-- N4 Grammar Points (30)
-- ============================================

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜たり〜たり',
  '~하거나 ~하거나',
  '動作の列挙を表す。いくつかの動作を代表的に挙げる表現。',
  'N4',
  '動詞た形 + り + 動詞た形 + り + する',
  '동사 た형 + り를 반복하고 마지막에 する를 붙인다 (예: 食べたり飲んだりする). 형용사도 가능 (예: 高かったり安かったりする)',
  'listing',
  '[{"ja":"休みの日は、本を読んだり映画を見たりします。","ko":"쉬는 날은 책을 읽거나 영화를 보거나 합니다.","highlight":"読んだり見たり"},{"ja":"テストしたりデバッグしたりして一日が終わった。","ko":"테스트하거나 디버깅하거나 하면서 하루가 끝났다.","highlight":"テストしたりデバッグしたり"}]'::jsonb,
  ARRAY['〜や〜など', '〜とか〜とか', '〜し〜し'],
  '마지막에 「する」를 빠뜨리는 실수가 많다. 또한 최소 2개의 동작을 나열해야 하며, 나열된 것 외에도 다른 동작이 있다는 뉘앙스.',
  'IT현장: 업무 내용 나열에 사용. 「コーディングしたりレビューしたりする毎日です」「ミーティングに出たりドキュメントを書いたりしました」',
  1
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ながら',
  '~하면서',
  '同時動作を表す。二つの動作を同時に行うことを表す。',
  'N4',
  '動詞ます形(ますを取る) + ながら',
  '동사 ます형에서 ます를 제거하고 + ながら (예: 食べながら, 聞きながら). 뒤에 오는 동작이 주된 동작.',
  'time',
  '[{"ja":"音楽を聞きながら勉強する。","ko":"음악을 들으면서 공부한다.","highlight":"聞きながら"},{"ja":"ドキュメントを見ながらコーディングしています。","ko":"문서를 보면서 코딩하고 있습니다.","highlight":"見ながら"}]'::jsonb,
  ARRAY['〜つつ', '〜ている間に', '〜うちに'],
  '주동작은 뒤에, 부동작은 앞에 온다. 한국어 「~하면서」와 거의 같지만, 역접의 「〜ながら(も)」(~이면서도)와 혼동 주의.',
  'IT현장: 「画面を共有しながら説明します」「テスト結果を確認しながら修正を進めます」',
  2
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜のに',
  '~인데도',
  '逆接を表す。期待に反する結果や不満を表す表現。',
  'N4',
  '普通形 + のに / な形容詞 + な + のに / 名詞 + な + のに',
  '동사/い형용사 보통형 + のに (예: 行くのに, 高いのに) / な형용사 + なのに / 명사 + なのに',
  'contrast',
  '[{"ja":"薬を飲んだのに、熱が下がらない。","ko":"약을 먹었는데도 열이 내리지 않는다.","highlight":"飲んだのに"},{"ja":"何度もテストしたのに、バグが見つかった。","ko":"여러 번 테스트했는데도 버그가 발견됐다.","highlight":"テストしたのに"}]'::jsonb,
  ARRAY['〜けど', '〜にもかかわらず', '〜ても'],
  '「のに」는 불만이나 의외의 감정이 포함됨. 「けど」는 단순 역접. 「のに」 뒤에 명령이나 의뢰 표현은 올 수 없다 (×雨なのに、出かけてください).',
  'IT현장: 「ドキュメント通りにやったのに、動かない」「締め切りを過ぎているのに、まだ返事がない」 - 불만 표현 시 사용.',
  3
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ようにする',
  '~하도록 하다',
  '努力・習慣を表す。ある行動を心がけることを表す表現。',
  'N4',
  '動詞辞書形 + ようにする / 動詞ない形 + ようにする',
  '동사 사전형 + ようにする (예: 食べるようにする) / 동사 ない형 + ようにする (예: 食べないようにする). 의식적 노력을 나타냄.',
  'change',
  '[{"ja":"毎日運動するようにしています。","ko":"매일 운동하도록 하고 있습니다.","highlight":"運動するようにして"},{"ja":"コードにはコメントを書くようにしてください。","ko":"코드에는 코멘트를 쓰도록 해 주세요.","highlight":"書くようにして"}]'::jsonb,
  ARRAY['〜ようになる', '〜ことにする', '〜ことにしている'],
  '「〜ようにする」(노력해서 ~하도록 하다)와 「〜ようになる」(~하게 되다)의 차이 주의. 「する」는 의식적 노력, 「なる」는 자연스러운 변화.',
  'IT현장: 습관이나 규칙 설명에 사용. 「PRを出す前にセルフレビューするようにしてください」「命名規則を守るようにしています」',
  4
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ことがある',
  '~한 적이 있다',
  '経験を表す。過去の経験があることを表す表現。',
  'N4',
  '動詞た形 + ことがある',
  '동사 た형 + ことがある (예: 行ったことがある, 食べたことがある). 부정: 動詞た形 + ことがない',
  'time',
  '[{"ja":"北海道に行ったことがあります。","ko":"홋카이도에 간 적이 있습니다.","highlight":"行ったことがあります"},{"ja":"Rustでプログラムを書いたことがあります。","ko":"Rust로 프로그램을 작성한 적이 있습니다.","highlight":"書いたことがあります"}]'::jsonb,
  ARRAY['〜たことがない', '〜ことがある(時々)', '〜経験がある'],
  '과거 경험의 「〜たことがある」와 때때로의 「〜ことがある」(辞書形+ことがある = 가끔 ~한다)를 구분해야 한다.',
  'IT현장: 경력 소개에 필수. 「アジャイル開発をしたことがあります」「大規模プロジェクトに参加したことがあります」',
  5
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜し〜し',
  '~하고 ~하고',
  '理由の列挙を表す。複数の理由や特徴を並べて述べる表現。',
  'N4',
  '普通形 + し',
  '동사/형용사 보통형 + し (예: 安いし, おいしいし, 近いし). 정중형도 가능 (예: 安いですし). 이유를 나열할 때 사용.',
  'listing',
  '[{"ja":"この店は安いし、おいしいし、よく行きます。","ko":"이 가게는 싸고 맛있어서 자주 갑니다.","highlight":"安いし、おいしいし"},{"ja":"Reactは情報も多いし、コミュニティも大きいし、おすすめです。","ko":"React는 정보도 많고 커뮤니티도 크고, 추천합니다.","highlight":"多いし、大きいし"}]'::jsonb,
  ARRAY['〜たり〜たり', '〜から', '〜ので'],
  '「〜し」는 이유를 나열할 때 사용하며, 긍정적/부정적 이유 모두 가능. 한국어의 「~고, ~고」와 유사하지만, 이유의 뉘앙스가 더 강하다.',
  'IT현장: 기술 선택의 이유 설명에 유용. 「ドキュメントも充実しているし、パフォーマンスもいいし、このフレームワークを選びました」',
  6
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜そうだ(伝聞)',
  '~라고 한다/~다고 한다',
  '伝聞を表す。他者から聞いた情報を伝える表現。',
  'N4',
  '普通形 + そうだ',
  '동사/형용사 보통형 + そうだ (예: 行くそうだ, 高いそうだ). 명사/な형용사 + だそうだ. ※양태의 「そうだ」(ます형+そうだ)와 구별 필요.',
  'conjecture',
  '[{"ja":"明日は雪が降るそうです。","ko":"내일은 눈이 온다고 합니다.","highlight":"降るそうです"},{"ja":"来月から新しいプロジェクトが始まるそうです。","ko":"다음 달부터 새로운 프로젝트가 시작된다고 합니다.","highlight":"始まるそうです"}]'::jsonb,
  ARRAY['〜ということだ', '〜って', '〜らしい'],
  '전문(伝聞)의 「そうだ」(보통형+そうだ)와 양태(様態)의 「そうだ」(ます형+そうだ)를 혼동하기 쉽다. 전문: 雨が降るそうだ(비가 온다고 한다). 양태: 雨が降りそうだ(비가 올 것 같다).',
  'IT현장: 전달 사항 보고에 사용. 「クライアントの要件が変わったそうです」「来週リリースするそうです」',
  7
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜らしい',
  '~인 것 같다/~답다',
  '推量を表す。根拠に基づく推測を表す表現。',
  'N4',
  '普通形 + らしい / 名詞 + らしい',
  '동사/형용사 보통형 + らしい (예: 行くらしい, 高いらしい). 명사 + らしい (예: 学生らしい = 학생다운). 명사에 붙으면 「~답다」의 의미.',
  'conjecture',
  '[{"ja":"田中さんは来月結婚するらしい。","ko":"타나카 씨는 다음 달 결혼한다고 한다.","highlight":"結婚するらしい"},{"ja":"次のバージョンでUIが大きく変わるらしいです。","ko":"다음 버전에서 UI가 크게 바뀐다고 합니다.","highlight":"変わるらしい"}]'::jsonb,
  ARRAY['〜そうだ(伝聞)', '〜みたいだ', '〜ようだ'],
  '추량의 「〜らしい」(~인 것 같다)와 전형의 「〜らしい」(~답다)를 구분해야 한다. 추량: 雨が降るらしい(비가 올 것 같다). 전형: 男らしい(남자답다).',
  'IT현장: 간접 정보 전달에 사용. 「このライブラリは非推奨になるらしいです」「新しいAPIがリリースされるらしい」',
  8
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜みたいだ',
  '~같다/~인 것 같다',
  '推量を表す。見た目や状況から判断した推測を表す口語的な表現。',
  'N4',
  '普通形 + みたいだ / 名詞 + みたいだ',
  '동사/형용사 보통형 + みたいだ (예: 行くみたいだ, 高いみたいだ). 명사 + みたいだ (예: 子供みたいだ = 아이 같다). 구어적 표현.',
  'conjecture',
  '[{"ja":"彼は疲れているみたいだ。","ko":"그는 피곤한 것 같다.","highlight":"疲れているみたいだ"},{"ja":"サーバーがダウンしたみたいです。","ko":"서버가 다운된 것 같습니다.","highlight":"ダウンしたみたいです"}]'::jsonb,
  ARRAY['〜ようだ', '〜らしい', '〜っぽい'],
  '「みたいだ」는 구어체, 「ようだ」는 문어체. 비즈니스 문서에서는 「ようだ」를 사용하는 것이 적절. 또한 비유의 「みたい」(~처럼)와 추량의 「みたい」(~인 것 같다)를 구분.',
  'IT현장: 구두 보고에서 자주 사용. 「メモリリークがあるみたいです」「テスト環境に問題があるみたいです」',
  9
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ておく',
  '~해 두다',
  '準備を表す。事前に準備しておくことや、そのまま放置することを表す。',
  'N4',
  'て形 + おく',
  '동사 て형 + おく (예: 買っておく, 調べておく). 구어에서는 「〜とく」로 축약 (예: 買っとく, 調べとく).',
  'manner',
  '[{"ja":"旅行の前にホテルを予約しておいた。","ko":"여행 전에 호텔을 예약해 두었다.","highlight":"予約しておいた"},{"ja":"ミーティング前に資料を準備しておきます。","ko":"미팅 전에 자료를 준비해 두겠습니다.","highlight":"準備しておきます"}]'::jsonb,
  ARRAY['〜てある', '〜ている', '〜ておいて'],
  '「〜ておく」는 사전 준비, 「〜てある」는 결과 상태를 나타냄. 한국어 「~해 두다」와 거의 같지만, 방치의 의미도 있다 (窓を開けておく = 창문을 열어 두다).',
  'IT현장: 사전 준비 지시에 필수. 「デプロイ前にバックアップを取っておいてください」「テストデータを用意しておきます」',
  10
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜てある',
  '~해 놓다/~되어 있다',
  '結果の状態を表す。意図的に行った動作の結果が残っている状態を表す。',
  'N4',
  '他動詞て形 + ある',
  '타동사 て형 + ある (예: 書いてある, 置いてある). 주어는 동작의 대상이 됨 (名前が書いてある). 자동사에는 사용 불가.',
  'manner',
  '[{"ja":"壁にポスターが貼ってある。","ko":"벽에 포스터가 붙여져 있다.","highlight":"貼ってある"},{"ja":"この件についてはドキュメントに書いてあります。","ko":"이 건에 대해서는 문서에 적혀 있습니다.","highlight":"書いてあります"}]'::jsonb,
  ARRAY['〜ておく', '〜ている', '〜てある'],
  '「〜てある」는 타동사만 사용 가능. 「〜ている」는 자동사/타동사 모두 가능. 「ドアが開けてある」(누군가 열어 놓은 상태)와 「ドアが開いている」(열려 있는 상태)의 차이.',
  'IT현장: 상태 확인에 사용. 「設定ファイルに書いてあります」「テストケースはすでに作ってあります」',
  11
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ところだ',
  '~하는 중이다/~한 참이다',
  '時点を表す。動作の直前・最中・直後のタイミングを表す。',
  'N4',
  '動詞辞書形 + ところだ / 動詞ている + ところだ / 動詞た形 + ところだ',
  '동사 사전형 + ところだ (막 ~하려는 참) / 동사 ている + ところだ (~하고 있는 중) / 동사 た형 + ところだ (막 ~한 참)',
  'time',
  '[{"ja":"今から出かけるところです。","ko":"지금 나가려는 참입니다.","highlight":"出かけるところ"},{"ja":"ちょうどコードレビューをしているところです。","ko":"마침 코드 리뷰를 하고 있는 중입니다.","highlight":"しているところ"}]'::jsonb,
  ARRAY['〜ている', '〜たばかり', '〜ようとする'],
  '「〜るところだ」(직전), 「〜ているところだ」(진행 중), 「〜たところだ」(직후)의 세 가지 시점을 정확히 구분해야 한다.',
  'IT현장: 진행 상황 보고에 필수. 「今テストを実行しているところです」「ちょうどデプロイが終わったところです」',
  12
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ようだ',
  '~인 것 같다',
  '推量を表す。観察や情報に基づく推測を表す文語的表現。',
  'N4',
  '普通形 + ようだ / 名詞 + の + ようだ / な形容詞 + な + ようだ',
  '동사/い형용사 보통형 + ようだ (예: 行くようだ, 高いようだ). な형용사 + なようだ. 명사 + のようだ. 문어체 표현.',
  'conjecture',
  '[{"ja":"彼女は具合が悪いようだ。","ko":"그녀는 몸이 안 좋은 것 같다.","highlight":"悪いようだ"},{"ja":"今回のリリースは予定通り進んでいるようです。","ko":"이번 릴리스는 예정대로 진행되고 있는 것 같습니다.","highlight":"進んでいるようです"}]'::jsonb,
  ARRAY['〜みたいだ', '〜らしい', '〜そうだ(様態)'],
  '「ようだ」는 문어/정중, 「みたいだ」는 구어. 비유: 「雪のように白い」(눈처럼 하얗다). 추량: 「雨が降るようだ」(비가 올 것 같다). 문맥으로 구분.',
  'IT현장: 정중한 보고에 사용. 「パフォーマンスが低下しているようです」「この問題はネットワークに起因するようです」',
  13
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜かもしれない',
  '~일지도 모른다',
  '不確実な推量を表す。確信が低い推測を表す表現。',
  'N4',
  '普通形 + かもしれない',
  '동사/형용사 보통형 + かもしれない (예: 行くかもしれない, 高いかもしれない). 명사/な형용사 + かもしれない (だ는 붙이지 않음).',
  'conjecture',
  '[{"ja":"今日は雨が降るかもしれない。","ko":"오늘은 비가 올지도 모른다.","highlight":"降るかもしれない"},{"ja":"この修正で他の機能に影響が出るかもしれません。","ko":"이 수정으로 다른 기능에 영향이 나올지도 모릅니다.","highlight":"出るかもしれません"}]'::jsonb,
  ARRAY['〜でしょう', '〜だろう', '〜おそれがある'],
  '확신도: 「〜に違いない」 > 「〜はずだ」 > 「〜だろう」 > 「〜かもしれない」. 가장 불확실한 추측에 사용. 한국어 「~일지도 모른다」와 정확히 대응.',
  'IT현장: 리스크 언급에 사용. 「データが消えるかもしれないので、バックアップを取ってください」「仕様変更があるかもしれません」',
  14
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜はずだ',
  '~일 것이다/~할 터이다',
  '当然の推量を表す。論理的に当然そうであるべきだという確信を表す。',
  'N4',
  '普通形 + はずだ / な形容詞 + な + はずだ / 名詞 + の + はずだ',
  '동사/い형용사 보통형 + はずだ (예: 来るはずだ, 高いはずだ). な형용사 + なはずだ. 명사 + のはずだ. 부정: 〜はずがない.',
  'conjecture',
  '[{"ja":"彼はもう着いたはずです。","ko":"그는 이미 도착했을 것입니다.","highlight":"着いたはず"},{"ja":"テストは全部通るはずです。","ko":"테스트는 전부 통과할 것입니다.","highlight":"通るはず"}]'::jsonb,
  ARRAY['〜に違いない', '〜べきだ', '〜はずがない'],
  '「〜はずだ」는 논리적 근거에 기반한 확신, 「〜だろう」는 단순 추측. 「〜はずがない」는 강한 부정 (〜일 리가 없다). 결과가 예상과 다를 때 「〜はずなのに」로 사용.',
  'IT현장: 기대값 표현에 사용. 「この修正でバグは解消されるはずです」「設定は正しいはずなのに、エラーが出ます」',
  15
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜(ら)れる(受身)',
  '~되다/~당하다',
  '受身を表す。動作を受ける側の視点から述べる表現。',
  'N4',
  '動詞受身形',
  '1그룹: あ단 + れる (예: 書く→書かれる) / 2그룹: る→られる (예: 食べる→食べられる) / 불규칙: する→される, くる→こられる',
  'formal',
  '[{"ja":"先生に褒められました。","ko":"선생님에게 칭찬받았습니다.","highlight":"褒められました"},{"ja":"お客様にシステムの不具合を指摘されました。","ko":"고객에게 시스템 결함을 지적당했습니다.","highlight":"指摘されました"}]'::jsonb,
  ARRAY['〜(さ)せる', '〜(さ)せられる', '〜てもらう'],
  '직접수동(私は先生に褒められた)과 간접수동/피해수동(雨に降られた = 비를 맞았다)을 구분해야 한다. 한국어에는 피해수동이 없어 혼란스러울 수 있다.',
  'IT현장: 「コードレビューで多くの指摘をされました」「サーバーが不正アクセスされました」',
  16
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜(さ)せる(使役)',
  '~시키다/~하게 하다',
  '使役を表す。他者にある動作をさせることを表す表現。',
  'N4',
  '動詞使役形',
  '1그룹: あ단 + せる (예: 書く→書かせる) / 2그룹: る→させる (예: 食べる→食べさせる) / 불규칙: する→させる, くる→こさせる',
  'obligation',
  '[{"ja":"子供に野菜を食べさせる。","ko":"아이에게 채소를 먹게 한다.","highlight":"食べさせる"},{"ja":"新人にテストコードを書かせています。","ko":"신입에게 테스트 코드를 쓰게 하고 있습니다.","highlight":"書かせています"}]'::jsonb,
  ARRAY['〜(ら)れる', '〜させられる', '〜てもらう'],
  '사역형은 강제(食べさせる)와 허가(行かせる = 가게 해주다) 두 가지 의미가 있다. 문맥으로 판단해야 한다. 2그룹 동사의 させる와 수동의 られる를 혼동하지 말 것.',
  'IT현장: 업무 배정에 사용. 「後輩にドキュメントを作成させました」「インターンにテストを実行させています」',
  17
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜させられる',
  '~하게 되다/~시킴을 당하다',
  '使役受身を表す。他者に強制されて仕方なくある行為をすることを表す。',
  'N4',
  '動詞使役受身形',
  '1그룹: あ단 + される (예: 書く→書かされる/書かせられる) / 2그룹: る→させられる (예: 食べる→食べさせられる) / 불규칙: する→させられる, くる→こさせられる',
  'obligation',
  '[{"ja":"嫌いな野菜を食べさせられた。","ko":"싫어하는 채소를 억지로 먹게 되었다.","highlight":"食べさせられた"},{"ja":"残業させられることが多いです。","ko":"야근을 시킴당하는 경우가 많습니다.","highlight":"残業させられる"}]'::jsonb,
  ARRAY['〜(さ)せる', '〜(ら)れる', '〜ざるを得ない'],
  '사역수동은 불만/피해의 뉘앙스가 강하다. 1그룹의 축약형(書かされる)과 정식형(書かせられる) 모두 가능하나, 축약형이 더 자연스럽다.',
  'IT현장: 불만 표현에 사용. 「不要なドキュメントを書かされた」「週末も作業させられました」',
  18
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ように',
  '~하도록/~하게',
  '目標を表す。ある状態の実現を目指して行動することを表す。',
  'N4',
  '動詞辞書形 + ように / 動詞ない形 + ように',
  '동사 사전형 + ように (예: 聞こえるように = 들리도록) / 동사 ない형 + ように (예: 忘れないように = 잊지 않도록). 주로 무의지동사/가능형과 함께 사용.',
  'manner',
  '[{"ja":"忘れないようにメモしました。","ko":"잊지 않도록 메모했습니다.","highlight":"忘れないように"},{"ja":"誰でも理解できるようにドキュメントを書いてください。","ko":"누구나 이해할 수 있도록 문서를 작성해 주세요.","highlight":"理解できるように"}]'::jsonb,
  ARRAY['〜ために', '〜ようにする', '〜ようになる'],
  '「ように」는 무의지동사/가능형과 함께, 「ために」는 의지동사와 함께 사용. ×合格するように勉強する → ○合格するために勉強する / ○合格できるように勉強する.',
  'IT현장: 목표 설명에 사용. 「バグが再発しないように対策を講じます」「新人でもわかるようにREADMEを整備しました」',
  19
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ことにする',
  '~하기로 하다',
  '決定を表す。自分の意志で何かを決定することを表す。',
  'N4',
  '動詞辞書形 + ことにする / 動詞ない形 + ことにする',
  '동사 사전형 + ことにする (예: 行くことにする = 가기로 하다) / 동사 ない형 + ことにする (예: 行かないことにする = 가지 않기로 하다)',
  'change',
  '[{"ja":"毎朝6時に起きることにしました。","ko":"매일 아침 6시에 일어나기로 했습니다.","highlight":"起きることにしました"},{"ja":"このフレームワークを採用することにしました。","ko":"이 프레임워크를 채택하기로 했습니다.","highlight":"採用することにしました"}]'::jsonb,
  ARRAY['〜ことになる', '〜ようにする', '〜つもりだ'],
  '「ことにする」는 자발적 결정, 「ことになる」는 외부 요인에 의한 결정. 한국어 「~하기로 하다」와 「~하게 되다」의 차이와 동일.',
  'IT현장: 결정 보고에 사용. 「Docker環境に移行することにしました」「このバグは次のスプリントで修正することにします」',
  20
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ようになる',
  '~하게 되다',
  '変化を表す。状態や能力が変化したことを表す表現。',
  'N4',
  '動詞辞書形 + ようになる / 動詞ない形 + ようになる',
  '동사 사전형 + ようになる (예: 話せるようになる = 말할 수 있게 되다) / 동사 ない형 + ようになる (예: 食べないようになる = 먹지 않게 되다)',
  'change',
  '[{"ja":"日本語が少し話せるようになりました。","ko":"일본어를 조금 말할 수 있게 되었습니다.","highlight":"話せるようになりました"},{"ja":"Kubernetesを運用できるようになりました。","ko":"Kubernetes를 운용할 수 있게 되었습니다.","highlight":"運用できるようになりました"}]'::jsonb,
  ARRAY['〜ようにする', '〜ことになる', '〜てくる'],
  '「ようになる」는 자연스러운 변화(능력 습득), 「ようにする」는 의식적 노력. 가능형과 자주 결합 (できるようになる). 한국어 「~하게 되다」와 정확히 대응.',
  'IT현장: 스킬 성장 보고에 사용. 「AWSを一人で構築できるようになりました」「CI/CDパイプラインを設計できるようになった」',
  21
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜てしまう',
  '~해 버리다',
  '完了・残念を表す。動作の完了や後悔・残念な気持ちを表す表現。',
  'N4',
  'て形 + しまう',
  '동사 て형 + しまう (예: 食べてしまう, 忘れてしまう). 구어에서는 「〜ちゃう/〜じゃう」로 축약 (예: 食べちゃう, 飲んじゃう).',
  'change',
  '[{"ja":"財布をなくしてしまいました。","ko":"지갑을 잃어 버렸습니다.","highlight":"なくしてしまいました"},{"ja":"間違えてファイルを削除してしまいました。","ko":"실수로 파일을 삭제해 버렸습니다.","highlight":"削除してしまいました"}]'::jsonb,
  ARRAY['〜ちゃう/じゃう', '〜てしまった', '〜きる'],
  '완료(全部食べてしまった = 다 먹어 버렸다)와 후회(忘れてしまった = 잊어 버렸다)의 두 가지 용법을 구분. 구어 축약형은 비즈니스에서 부적절.',
  'IT현장: 실수 보고에 사용. 「本番DBを誤って更新してしまいました」「コミットメッセージを間違えてプッシュしてしまいました」',
  22
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ために',
  '~하기 위해/~때문에',
  '目的・原因を表す。目的や原因を述べる表現。',
  'N4',
  '動詞辞書形 + ために(目的) / 動詞た形 + ために(原因) / 名詞 + のために',
  '동사 사전형 + ために (목적: 합격하기 위해) / 동사 た형 + ために (원인: 사고가 났기 때문에) / 명사 + のために (예: 健康のために)',
  'reason',
  '[{"ja":"試験に合格するために勉強しています。","ko":"시험에 합격하기 위해 공부하고 있습니다.","highlight":"合格するために"},{"ja":"パフォーマンスを向上させるために、インデックスを追加しました。","ko":"성능을 향상시키기 위해 인덱스를 추가했습니다.","highlight":"向上させるために"}]'::jsonb,
  ARRAY['〜ように', '〜のに', '〜には'],
  '목적(사전형 + ために)과 원인(た형 + ために)을 구분해야 한다. 목적의 「ために」는 의지동사와 함께 사용. 무의지동사에는 「ように」를 사용.',
  'IT현장: 목적 설명에 사용. 「セキュリティを強化するためにWAFを導入しました」「コード品質を保つためにlintを設定しています」',
  23
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜だけ',
  '~만/~뿐',
  '限定を表す。範囲や量を限定する表現。',
  'N4',
  '動詞普通形 + だけ / い形容詞 + だけ / な形容詞 + な + だけ / 名詞 + だけ',
  '동사 보통형 + だけ (예: できるだけ = 할 수 있는 만큼) / 명사 + だけ (예: これだけ = 이것만). 「だけで」「だけの」등으로도 활용.',
  'degree',
  '[{"ja":"必要な分だけ買います。","ko":"필요한 만큼만 삽니다.","highlight":"必要な分だけ"},{"ja":"この機能だけ先にリリースしましょう。","ko":"이 기능만 먼저 릴리스합시다.","highlight":"この機能だけ"}]'::jsonb,
  ARRAY['〜しか〜ない', '〜ばかり', '〜のみ'],
  '「だけ」는 한정(이것만), 「しか〜ない」는 한정+불만(이것밖에 없다). 「できるだけ」(가능한 한)는 관용표현으로 중요.',
  'IT현장: 범위 제한에 사용. 「必要な部分だけ修正してください」「テスト環境だけにデプロイしてください」',
  24
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜しか〜ない',
  '~밖에 ~없다',
  '限定(否定)を表す。それ以外にないという限定を否定形で表す。',
  'N4',
  '名詞 + しか + 否定形 / 動詞辞書形 + しかない',
  '명사 + しか + 부정형 (예: 水しかない = 물밖에 없다) / 동사 사전형 + しかない (예: 行くしかない = 갈 수밖에 없다). 반드시 부정형과 함께 사용.',
  'emphasis',
  '[{"ja":"お金が100円しかありません。","ko":"돈이 100엔밖에 없습니다.","highlight":"100円しか"},{"ja":"この方法でやるしかありません。","ko":"이 방법으로 할 수밖에 없습니다.","highlight":"やるしかありません"}]'::jsonb,
  ARRAY['〜だけ', '〜ばかり', '〜のみ'],
  '「しか」는 반드시 부정형(ない/ません)과 함께 사용. 「だけ」와 달리 불만이나 불충분의 뉘앙스가 있다. 「〜するしかない」는 「할 수밖에 없다」의 의미.',
  'IT현장: 제한 상황 표현에 사용. 「時間が2日しかありません」「手動でやるしかないです」',
  25
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ほど',
  '~정도/~만큼',
  '程度を表す。程度や比較の基準を表す表現。',
  'N4',
  '動詞辞書形 + ほど / 名詞 + ほど / い形容詞 + ほど',
  '동사 사전형 + ほど (예: 泣くほど = 울 정도로) / 명사 + ほど (예: 1時間ほど = 1시간 정도) / 비교: 〜ほど〜ない (예: 東京ほど大きくない)',
  'degree',
  '[{"ja":"死ぬほど疲れた。","ko":"죽을 만큼 피곤했다.","highlight":"死ぬほど"},{"ja":"このプロジェクトは思ったほど難しくなかったです。","ko":"이 프로젝트는 생각한 만큼 어렵지 않았습니다.","highlight":"思ったほど"}]'::jsonb,
  ARRAY['〜くらい/ぐらい', '〜だけ', '〜ば〜ほど'],
  '「ほど」는 ①정도(1時間ほど), ②비교(東京ほど大きくない = 도쿄만큼 크지 않다), ③비례(見れば見るほど = 보면 볼수록)의 세 가지 용법이 있다.',
  'IT현장: 정도 표현에 사용. 「想定したほどパフォーマンスが出ていません」「驚くほど簡単に実装できました」',
  26
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ばかり',
  '~뿐/~만',
  '限定・偏りを表す。ある事柄ばかりに偏っていることを表す。',
  'N4',
  '動詞て形 + ばかりいる / 名詞 + ばかり / 動詞辞書形 + ばかり',
  '동사 て형 + ばかりいる (예: 食べてばかりいる = 먹기만 한다) / 명사 + ばかり (예: 肉ばかり = 고기만). 불만의 뉘앙스를 포함하는 경우가 많다.',
  'emphasis',
  '[{"ja":"最近、仕事ばかりしている。","ko":"최근에 일만 하고 있다.","highlight":"仕事ばかり"},{"ja":"バグ修正ばかりで、新機能開発が進みません。","ko":"버그 수정만 해서 신규 기능 개발이 진행되지 않습니다.","highlight":"バグ修正ばかり"}]'::jsonb,
  ARRAY['〜だけ', '〜しか〜ない', '〜ばかりだ'],
  '「ばかり」는 편중/불만의 뉘앙스가 강하다. 「だけ」는 중립적 한정. 「〜たばかり」(방금 ~한 참)와 혼동 주의. 문맥으로 구분해야 한다.',
  'IT현장: 불만/편중 표현에 사용. 「ミーティングばかりでコーディングの時間がない」「レガシーコードの修正ばかりしています」',
  27
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ことにしている',
  '~하기로 하고 있다',
  '習慣を表す。自分で決めた習慣を続けていることを表す。',
  'N4',
  '動詞辞書形 + ことにしている / 動詞ない形 + ことにしている',
  '동사 사전형 + ことにしている (예: 毎日走ることにしている = 매일 달리기로 하고 있다) / 동사 ない형 + ことにしている (예: 夜食を食べないことにしている)',
  'time',
  '[{"ja":"毎朝ジョギングすることにしています。","ko":"매일 아침 조깅하기로 하고 있습니다.","highlight":"ジョギングすることにしています"},{"ja":"毎日コードを30分以上書くことにしています。","ko":"매일 코드를 30분 이상 쓰기로 하고 있습니다.","highlight":"書くことにしています"}]'::jsonb,
  ARRAY['〜ことにする', '〜ようにしている', '〜習慣がある'],
  '「ことにしている」는 자발적으로 정한 습관, 「ようにしている」는 의식적으로 노력하는 습관. 미묘한 차이이지만, 전자는 결정, 후자는 노력의 뉘앙스.',
  'IT현장: 습관 공유에 사용. 「コミット前にテストを実行することにしています」「毎週技術ブログを読むことにしています」',
  28
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ようにしている',
  '~하도록 하고 있다',
  '心がけを表す。意識的にある行動を心がけていることを表す。',
  'N4',
  '動詞辞書形 + ようにしている / 動詞ない形 + ようにしている',
  '동사 사전형 + ようにしている (예: 野菜を食べるようにしている) / 동사 ない형 + ようにしている (예: 遅刻しないようにしている). 의식적 노력/습관.',
  'manner',
  '[{"ja":"健康のために野菜を食べるようにしています。","ko":"건강을 위해 야채를 먹도록 하고 있습니다.","highlight":"食べるようにしています"},{"ja":"変数名はわかりやすくするようにしています。","ko":"변수명은 알기 쉽게 하도록 하고 있습니다.","highlight":"わかりやすくするようにしています"}]'::jsonb,
  ARRAY['〜ことにしている', '〜ようにする', '〜ように'],
  '「ようにしている」는 의식적 노력(완벽하지는 않지만 노력 중), 「ことにしている」는 확고한 결정(규칙처럼). 현재 지속 중인 습관이나 노력을 나타냄.',
  'IT현장: 개인 습관 공유에 사용. 「コードレビューでは丁寧にコメントするようにしています」「バグが出たらすぐログを確認するようにしています」',
  29
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜てくる/いく',
  '~해 오다/~해 가다',
  '方向・変化を表す。動作の方向や時間的な変化の方向を表す。',
  'N4',
  'て形 + くる / て形 + いく',
  '동사 て형 + くる (예: 持ってくる = 가져오다, 増えてくる = 늘어오다) / 동사 て형 + いく (예: 持っていく = 가져가다, 減っていく = 줄어가다)',
  'change',
  '[{"ja":"だんだん暖かくなってきました。","ko":"점점 따뜻해져 왔습니다.","highlight":"なってきました"},{"ja":"ユーザー数がこれからも増えていくでしょう。","ko":"유저 수가 앞으로도 늘어 갈 것입니다.","highlight":"増えていく"}]'::jsonb,
  ARRAY['〜ていく', '〜てくる', '〜始める'],
  '「〜てくる」는 과거→현재 방향의 변화, 「〜ていく」는 현재→미래 방향의 변화. 물리적 이동(持ってくる)과 시간적 변화(増えてきた) 두 가지 용법이 있다.',
  'IT현장: 변화 보고에 사용. 「アクセス数が増えてきました」「メモリ使用量が減っていきます」',
  30
);

-- ============================================
-- N3 Grammar Points (25)
-- ============================================

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜てもいい',
  '~해도 된다',
  '許可を表す。相手に許可を求めたり、許可を与えたりする表現。',
  'N3',
  'て形 + もいい',
  '동사 て형 + もいい / い형용사 ~くて + もいい / な형용사 ~で + もいい',
  'permission',
  '[{"ja":"ここに座ってもいいですか。","ko":"여기 앉아도 되나요?","highlight":"座ってもいい"},{"ja":"この修正をプッシュしてもいいですか？","ko":"이 수정을 푸시해도 되나요?","highlight":"プッシュしてもいい"}]'::jsonb,
  ARRAY['〜てはいけない', '〜なくてもいい'],
  '「〜てもいい」는 허가, 「〜てもいいですか」는 허가를 구하는 질문. 「〜てはいけない」(금지)와 혼동 주의.',
  'IT현장: 「このブランチにマージしてもいいですか？」「テスト環境で試してもいいですよ」',
  1
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜なければならない',
  '~해야 한다',
  '義務を表す。しなければならない義務や必要性を表す表現。',
  'N3',
  '動詞ない形(ないを取る) + なければならない',
  '동사 ない형에서 ない를 제거하고 + なければならない (예: 行かなければならない). 구어: 〜なきゃ, 〜なくちゃ.',
  'obligation',
  '[{"ja":"明日までにレポートを出さなければならない。","ko":"내일까지 레포트를 내야 한다.","highlight":"出さなければならない"},{"ja":"デプロイ前にテストを全部通さなければなりません。","ko":"배포 전에 테스트를 전부 통과시켜야 합니다.","highlight":"通さなければなりません"}]'::jsonb,
  ARRAY['〜なくてはいけない', '〜ないといけない', '〜べきだ'],
  '여러 표현이 같은 의미: 「〜なければならない」 = 「〜なくてはいけない」 = 「〜ないといけない」. 구어에서는 축약형 「〜なきゃ」를 많이 사용.',
  'IT현장: 의무 사항 전달에 필수. 「セキュリティパッチを適用しなければなりません」「コーディング規約に従わなければなりません」',
  2
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ようにする',
  '~하도록 하다',
  '努力・習慣化を表す。意識的にある行動を心がけることを表す。',
  'N3',
  '動詞辞書形 + ようにする / 動詞ない形 + ようにする',
  '동사 사전형 + ようにする (예: 早く寝るようにする) / 동사 ない형 + ようにする (예: 遅刻しないようにする). N4에서 배운 것의 심화.',
  'change',
  '[{"ja":"健康のために野菜を食べるようにしている。","ko":"건강을 위해 야채를 먹도록 하고 있다.","highlight":"食べるようにしている"},{"ja":"コードの可読性を上げるように心がけています。","ko":"코드의 가독성을 높이도록 노력하고 있습니다.","highlight":"上げるように"}]'::jsonb,
  ARRAY['〜ようになる', '〜ことにする', '〜ことにしている'],
  'N3에서는 「〜ようにする」와 「〜ようになる」의 차이를 명확히 구분해야 함. 또한 「〜ことにする」(결정)와의 뉘앙스 차이도 중요.',
  'IT현장: 개선 습관 설명에 사용. 「毎日コミットするようにしています」「バグを見つけたらすぐ報告するようにしてください」',
  3
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ことにする',
  '~하기로 하다',
  '決定を表す。自分の意志で決定することを表す表現。',
  'N3',
  '動詞辞書形 + ことにする / 動詞ない形 + ことにする',
  '동사 사전형 + ことにする (예: 行くことにする) / 동사 ない형 + ことにする (예: 行かないことにする). 습관: 〜ことにしている.',
  'change',
  '[{"ja":"来月から毎朝ジョギングすることにした。","ko":"다음 달부터 매일 아침 조깅하기로 했다.","highlight":"ジョギングすることにした"},{"ja":"この機能はv2で実装することにしました。","ko":"이 기능은 v2에서 구현하기로 했습니다.","highlight":"実装することにしました"}]'::jsonb,
  ARRAY['〜ことになる', '〜ようにする', '〜つもりだ'],
  '「〜ことにする」는 자발적 결정, 「〜ことになる」는 외부 요인에 의한 결정. 한국어 「~하기로 하다」(자발)와 「~하게 되다」(수동)의 차이와 유사.',
  'IT현장: 결정 사항 공유에 사용. 「Reactを使うことにしました」「リリース日を来週に延期することにしました」',
  4
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ために',
  '~하기 위해',
  '目的を表す。ある目的のために行動することを表す表現。',
  'N3',
  '動詞辞書形 + ために / 名詞 + のために',
  '동사 사전형 + ために (예: 合格するために) / 명사 + のために (예: 健康のために). ※원인의 「ために」(〜たために)도 있음.',
  'reason',
  '[{"ja":"日本で働くために日本語を勉強しています。","ko":"일본에서 일하기 위해 일본어를 공부하고 있습니다.","highlight":"働くために"},{"ja":"パフォーマンスを改善するために、キャッシュを導入しました。","ko":"성능을 개선하기 위해 캐시를 도입했습니다.","highlight":"改善するために"}]'::jsonb,
  ARRAY['〜ように', '〜のに', '〜には'],
  '목적의 「ために」(사전형)와 원인의 「ために」(た형)를 구분해야 한다. 또한 「〜ように」와의 차이: 의지동사 → ために, 무의지동사 → ように.',
  'IT현장: 목적 설명에 필수. 「セキュリティを強化するために二要素認証を導入しました」「効率を上げるためにCI/CDを構築しました」',
  5
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜たばかり',
  '막 ~한 참이다',
  '直後を表す。動作が完了した直後であることを表す。',
  'N3',
  '動詞た形 + ばかり',
  '동사 た형 + ばかり (예: 食べたばかり, 来たばかり). 「〜たばかりなのに」(막 ~했는데도)로도 자주 사용.',
  'time',
  '[{"ja":"さっきご飯を食べたばかりです。","ko":"방금 밥을 먹은 참입니다.","highlight":"食べたばかり"},{"ja":"この機能はリリースしたばかりなので、まだフィードバックがありません。","ko":"이 기능은 막 릴리스한 참이라 아직 피드백이 없습니다.","highlight":"リリースしたばかり"}]'::jsonb,
  ARRAY['〜たところだ', '〜ばかりだ', '〜てから'],
  '「〜たばかり」는 주관적인 「얼마 안 됐다」, 「〜たところだ」는 객관적인 「방금 전」. 「〜たばかり」는 시간이 좀 지났어도 사용 가능 (来たばかりだ = 온 지 얼마 안 됐다).',
  'IT현장: 최근 완료 보고에 사용. 「入社したばかりなので、まだ環境に慣れていません」「デプロイしたばかりです」',
  6
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜そうだ(様態)',
  '~할 것 같다/~해 보이다',
  '様態を表す。見た目の印象や予測を表す表現。',
  'N3',
  '動詞ます形(ますを取る) + そうだ / い形容詞(いを取る) + そうだ / な形容詞 + そうだ',
  '동사 ます형에서 ます 제거 + そうだ (예: 降りそうだ) / い형용사에서 い 제거 + そうだ (예: おいしそうだ) / な형용사 + そうだ (예: 元気そうだ). 예외: いい→よさそうだ, ない→なさそうだ.',
  'conjecture',
  '[{"ja":"このケーキはおいしそうだ。","ko":"이 케이크는 맛있어 보인다.","highlight":"おいしそうだ"},{"ja":"このタスクは今日中に終わりそうです。","ko":"이 태스크는 오늘 안에 끝날 것 같습니다.","highlight":"終わりそうです"}]'::jsonb,
  ARRAY['〜そうだ(伝聞)', '〜ようだ', '〜みたいだ'],
  '양태(様態)의 「そうだ」(ます형접속)와 전문(伝聞)의 「そうだ」(보통형접속)를 반드시 구별. 예외형도 중요: いい→よさそう, ない→なさそう.',
  'IT현장: 예측에 사용. 「この実装だとバグが出そうです」「テストが通りそうです」「サーバーが落ちそうです」',
  7
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜てしまう',
  '~해 버리다',
  '完了・残念を表す。動作の完了や、残念・後悔の気持ちを表す。',
  'N3',
  'て形 + しまう',
  '동사 て형 + しまう (예: 食べてしまう, 忘れてしまう). 구어: 〜ちゃう/〜じゃう (예: 食べちゃう, 飲んじゃう).',
  'change',
  '[{"ja":"大事な書類をなくしてしまった。","ko":"중요한 서류를 잃어 버렸다.","highlight":"なくしてしまった"},{"ja":"本番環境のデータを消してしまいました。","ko":"운영 환경의 데이터를 지워 버렸습니다.","highlight":"消してしまいました"}]'::jsonb,
  ARRAY['〜てしまった', '〜ちゃう/じゃう', '〜きる'],
  '완료의 「〜てしまう」(전부 ~해 버리다)와 후회의 「〜てしまう」(~하고 말다)를 구분. 구어 축약형 「〜ちゃう」는 비즈니스에서 사용 자제.',
  'IT현장: 실수 보고에 사용. 「間違えてmainブランチにプッシュしてしまいました」「ファイルを上書きしてしまいました」',
  8
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ようになる',
  '~하게 되다',
  '変化を表す。能力や状態が変化したことを表す表現。',
  'N3',
  '動詞辞書形 + ようになる / 動詞ない形 + ようになる',
  '동사 사전형 + ようになる (예: 話せるようになる = 말할 수 있게 되다) / 동사 ない형 + ようになる (예: 食べないようになる = 먹지 않게 되다).',
  'change',
  '[{"ja":"日本語が話せるようになった。","ko":"일본어를 말할 수 있게 되었다.","highlight":"話せるようになった"},{"ja":"Dockerを使えるようになりました。","ko":"Docker를 사용할 수 있게 되었습니다.","highlight":"使えるようになりました"}]'::jsonb,
  ARRAY['〜ようにする', '〜ことになる', '〜てくる'],
  '「〜ようになる」는 자연스러운 변화(능력 습득 등), 「〜ようにする」는 의식적 노력. 한국어 「~하게 되다」와 정확히 대응.',
  'IT현장: 스킬 성장 보고에 사용. 「AWSを一人で運用できるようになりました」「テスト自動化ができるようになった」',
  9
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜はずだ',
  '~일 것이다/~할 터이다',
  '確信を表す。論理的根拠に基づく確信を表す。N4での学習の深化。',
  'N3',
  '普通形 + はずだ / な形容詞 + な + はずだ / 名詞 + の + はずだ',
  '동사/い형용사 보통형 + はずだ (예: できるはずだ). な형용사 + なはずだ. 명사 + のはずだ. 부정: 〜はずがない (〜일 리가 없다), 〜ないはずだ (〜하지 않을 것이다).',
  'conjecture',
  '[{"ja":"説明書通りにやれば、誰でもできるはずです。","ko":"설명서대로 하면 누구나 할 수 있을 것입니다.","highlight":"できるはず"},{"ja":"この修正でバグは再現しないはずです。","ko":"이 수정으로 버그는 재현되지 않을 것입니다.","highlight":"再現しないはず"}]'::jsonb,
  ARRAY['〜に違いない', '〜はずがない', '〜べきだ'],
  '「〜はずだ」(확신) vs 「〜はずがない」(강한 부정) vs 「〜ないはずだ」(약한 부정)의 미묘한 차이를 이해해야 함. N3에서는 복합 표현도 다룸.',
  'IT현장: 디버깅 시 자주 사용. 「このロジックなら正しく動くはずです」「設定を変えていないので、影響はないはずです」',
  10
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜わけだ',
  '~인 셈이다/~인 것이다',
  '当然の帰結を表す。論理的に考えてそうなるのは当然だという意味を表す。',
  'N3',
  '普通形 + わけだ / な形容詞 + な + わけだ / 名詞 + な/の + わけだ',
  '동사/い형용사 보통형 + わけだ (예: 高いわけだ = 비싼 셈이다) / な형용사 + なわけだ / 명사 + なわけだ. 부정: 〜わけではない (반드시 ~인 것은 아니다).',
  'reason',
  '[{"ja":"毎日3時間勉強しているのだから、上手になるわけだ。","ko":"매일 3시간 공부하고 있으니까 잘하게 되는 셈이다.","highlight":"上手になるわけだ"},{"ja":"テストを書いていないのだから、バグが出るわけです。","ko":"테스트를 작성하지 않았으니까 버그가 나오는 것입니다.","highlight":"出るわけです"}]'::jsonb,
  ARRAY['〜はずだ', '〜わけではない', '〜わけがない'],
  '「わけだ」(당연한 귀결), 「わけではない」(반드시 ~은 아니다), 「わけがない」(~일 리가 없다)의 세 가지 표현을 정확히 구분해야 한다.',
  'IT현장: 논리적 설명에 사용. 「キャッシュを使っているので、速いわけです」「コード量が多いわけだから、レビューに時間がかかるわけです」',
  11
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜というのは',
  '~라는 것은',
  '定義・説明を表す。言葉や概念の意味を説明する表現。',
  'N3',
  '名詞/文 + というのは',
  '명사 + というのは (예: DevOpsというのは = DevOps라는 것은) / 문장 + というのは. 뒤에 설명이나 정의가 온다. 구어에서는 「〜って」로 축약.',
  'formal',
  '[{"ja":"「リファクタリング」というのは、コードの内部構造を改善することです。","ko":"「리팩토링」이라는 것은 코드의 내부 구조를 개선하는 것입니다.","highlight":"というのは"},{"ja":"アジャイルというのは、柔軟な開発手法のことです。","ko":"애자일이라는 것은 유연한 개발 방법론을 말합니다.","highlight":"というのは"}]'::jsonb,
  ARRAY['〜とは', '〜ということだ', '〜って'],
  '「というのは」는 정의/설명을 할 때 사용. 「ということは」(그렇다면)와 혼동 주의. 구어에서는 「って」로 축약 (リファクタリングって = 리팩토링이란).',
  'IT현장: 용어 설명에 사용. 「CIというのは、継続的インテグレーションのことです」「マイクロサービスというのは、小さなサービスの集合体です」',
  12
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜からこそ',
  '~이기 때문에야말로',
  '強調された理由を表す。まさにその理由だからこそという強調表現。',
  'N3',
  '普通形 + からこそ / な形容詞 + だからこそ / 名詞 + だからこそ',
  '동사/い형용사 보통형 + からこそ (예: 努力したからこそ) / な형용사 + だからこそ / 명사 + だからこそ. 이유를 강조할 때 사용.',
  'emphasis',
  '[{"ja":"好きだからこそ、厳しいことも言います。","ko":"좋아하기 때문에야말로 엄격한 말도 합니다.","highlight":"好きだからこそ"},{"ja":"重要なプロジェクトだからこそ、テストを徹底します。","ko":"중요한 프로젝트이기 때문에야말로 테스트를 철저히 합니다.","highlight":"重要なプロジェクトだからこそ"}]'::jsonb,
  ARRAY['〜から', '〜こそ', '〜ばこそ'],
  '「からこそ」는 이유를 강하게 강조. 긍정적 문맥에서 자주 사용 (努力したからこそ成功した). 부정적 문맥에서는 어색할 수 있다.',
  'IT현장: 이유 강조에 사용. 「品質が大事だからこそ、コードレビューを厳しくしています」「チームだからこそ、コミュニケーションが重要です」',
  13
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜さえ〜ば',
  '~만 ~하면',
  '最低条件を表す。その条件さえ満たせば十分だという意味を表す。',
  'N3',
  '名詞 + さえ + 動詞ば形 / 動詞ます形 + さえすれば',
  '명사 + さえ + 동사 ば형 (예: 薬さえ飲めば = 약만 먹으면) / 동사 ます형 + さえすれば (예: 勉強しさえすれば = 공부만 하면)',
  'condition',
  '[{"ja":"お金さえあれば、何でも買える。","ko":"돈만 있으면 무엇이든 살 수 있다.","highlight":"お金さえあれば"},{"ja":"テストさえ通れば、マージできます。","ko":"테스트만 통과하면 머지할 수 있습니다.","highlight":"テストさえ通れば"}]'::jsonb,
  ARRAY['〜ば', '〜さえ', '〜だけ〜ば'],
  '「さえ」는 최소한의 조건을 나타냄. 「さえ〜ば」는 「그것만 있으면 충분하다」의 뉘앙스. 명사에 붙는 「さえ」와 동사에 붙는 「さえ」의 위치에 주의.',
  'IT현장: 최소 조건 설명에 사용. 「APIキーさえあれば、すぐ使えます」「設定ファイルさえ修正すれば、動くはずです」',
  14
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜こそ',
  '~야말로',
  '強調を表す。特にそれを強調する表現。',
  'N3',
  '名詞 + こそ / て形 + こそ',
  '명사 + こそ (예: これこそ = 이것이야말로, 今年こそ = 올해야말로) / て형 + こそ (예: 努力してこそ). 강조하고 싶은 말 뒤에 붙인다.',
  'emphasis',
  '[{"ja":"今年こそ、JLPT N1に合格したい。","ko":"올해야말로 JLPT N1에 합격하고 싶다.","highlight":"今年こそ"},{"ja":"チームワークこそが成功の鍵です。","ko":"팀워크야말로 성공의 열쇠입니다.","highlight":"チームワークこそ"}]'::jsonb,
  ARRAY['〜からこそ', '〜てこそ', '〜ばこそ'],
  '「こそ」는 강조 조사. 「こちらこそ」(저야말로)는 인사에서 자주 사용하는 관용표현. 「〜てこそ」(~해야 비로소)와 「〜ばこそ」(~이기에)도 중요.',
  'IT현장: 강조에 사용. 「テストこそが品質保証の基本です」「実践してこそ、スキルが身につきます」',
  15
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜に対して',
  '~에 대해서',
  '対象を表す。ある対象に向けた動作や態度を表す。',
  'N3',
  '名詞 + に対して / 名詞 + に対する + 名詞',
  '명사 + に対して (예: 顧客に対して = 고객에 대해서) / 명사 수식: 名詞 + に対する + 名詞 (예: 顧客に対するサービス). 대조의 의미도 있다.',
  'formal',
  '[{"ja":"お客様に対して丁寧に対応してください。","ko":"고객에 대해서 정중하게 대응해 주세요.","highlight":"お客様に対して"},{"ja":"このバグに対する修正パッチを作成しました。","ko":"이 버그에 대한 수정 패치를 작성했습니다.","highlight":"バグに対する"}]'::jsonb,
  ARRAY['〜について', '〜に関して', '〜に向けて'],
  '「に対して」는 ①대상(顧客に対して), ②대조(男性に対して女性は = 남성에 비해 여성은)의 두 가지 용법이 있다. 「について」(~에 대해)와 미묘한 차이가 있다.',
  'IT현장: 대상 명시에 사용. 「ユーザーからの問い合わせに対して、24時間以内に回答します」「このIssueに対するPRを作成してください」',
  16
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜にとって',
  '~에게 있어서',
  '立場を表す。ある人の立場から見た評価や判断を表す。',
  'N3',
  '名詞 + にとって',
  '명사(사람/집단) + にとって (예: 私にとって = 나에게 있어서, 会社にとって = 회사에 있어서). 뒤에 평가/판단이 온다.',
  'manner',
  '[{"ja":"私にとって、日本語の勉強は楽しいです。","ko":"나에게 있어서 일본어 공부는 즐겁습니다.","highlight":"私にとって"},{"ja":"このツールはチームにとって非常に便利です。","ko":"이 도구는 팀에게 있어서 매우 편리합니다.","highlight":"チームにとって"}]'::jsonb,
  ARRAY['〜に対して', '〜から見ると', '〜にしてみれば'],
  '「にとって」는 객관적 입장 표현, 「にしてみれば」는 감정적 공감이 담긴 표현. 뒤에는 평가/판단을 나타내는 형용사나 명사가 온다.',
  'IT현장: 관점 제시에 사용. 「エンドユーザーにとって使いやすいUIを設計しましょう」「初心者にとって、このドキュメントは難しすぎます」',
  17
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜について',
  '~에 대해서',
  '話題を表す。話題やテーマを提示する表現。',
  'N3',
  '名詞 + について / 名詞 + についての + 名詞',
  '명사 + について (예: プロジェクトについて = 프로젝트에 대해서) / 명사 수식: 名詞 + についての + 名詞 (예: セキュリティについてのレポート).',
  'formal',
  '[{"ja":"日本の文化について調べました。","ko":"일본 문화에 대해서 조사했습니다.","highlight":"文化について"},{"ja":"次のリリースについて説明します。","ko":"다음 릴리스에 대해서 설명합니다.","highlight":"リリースについて"}]'::jsonb,
  ARRAY['〜に関して', '〜に対して', '〜のことで'],
  '「について」는 화제 제시(~에 대해서), 「に関して」는 보다 격식적(~에 관해서), 「に対して」는 대상(~에 대해서). 미묘한 차이를 문맥으로 구분.',
  'IT현장: 화제 도입에 필수. 「アーキテクチャについて議論しましょう」「パフォーマンスの問題についてレポートを作成しました」',
  18
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜によって',
  '~에 의해/~에 따라',
  '手段・原因・場合を表す。手段、原因、場合による違いを表す多義的な表現。',
  'N3',
  '名詞 + によって / 名詞 + による + 名詞',
  '명사 + によって (예: 人によって = 사람에 따라, 地震によって = 지진에 의해). 수식: 名詞 + による + 名詞 (예: 地震による被害).',
  'manner',
  '[{"ja":"国によって文化が違います。","ko":"나라에 따라 문화가 다릅니다.","highlight":"国によって"},{"ja":"この問題はネットワーク障害によるものです。","ko":"이 문제는 네트워크 장애에 의한 것입니다.","highlight":"障害による"}]'::jsonb,
  ARRAY['〜に応じて', '〜次第で', '〜をもとに'],
  '「によって」는 ①수단(実験によって確認する), ②원인(地震によって), ③차이(人によって), ④수동의 행위자(先生によって)등 다의어. 문맥으로 판단.',
  'IT현장: 원인/수단 설명에 사용. 「環境によって設定が異なります」「自動テストによって品質を保証します」',
  19
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜として',
  '~로서',
  '資格・立場を表す。ある資格や立場で行動することを表す。',
  'N3',
  '名詞 + として',
  '명사 + として (예: エンジニアとして = 엔지니어로서, 代表として = 대표로서). 뒤에 행동이나 의견이 온다.',
  'formal',
  '[{"ja":"留学生として日本に来ました。","ko":"유학생으로서 일본에 왔습니다.","highlight":"留学生として"},{"ja":"リーダーとして、チームをまとめる責任があります。","ko":"리더로서 팀을 정리하는 책임이 있습니다.","highlight":"リーダーとして"}]'::jsonb,
  ARRAY['〜としては', '〜としても', '〜にとって'],
  '「として」(자격/입장), 「としては」(~로서는, 의견 전제), 「としても」(~로서도)를 구분. 한국어 「~로서」와 정확히 대응.',
  'IT현장: 역할 명시에 사용. 「テックリードとして設計レビューを担当しています」「新人エンジニアとしてまず環境構築を学びましょう」',
  20
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜おかげで',
  '~덕분에',
  '感謝の原因を表す。良い結果の原因を表す表現。',
  'N3',
  '普通形 + おかげで / 名詞 + の + おかげで',
  '동사/형용사 보통형 + おかげで (예: 教えてくれたおかげで) / 명사 + のおかげで (예: 先生のおかげで). 긍정적 결과의 원인.',
  'reason',
  '[{"ja":"先生のおかげで合格できました。","ko":"선생님 덕분에 합격할 수 있었습니다.","highlight":"先生のおかげで"},{"ja":"CI/CDを導入したおかげで、デプロイが楽になりました。","ko":"CI/CD를 도입한 덕분에 배포가 편해졌습니다.","highlight":"導入したおかげで"}]'::jsonb,
  ARRAY['〜せいで', '〜ために', '〜のおかげだ'],
  '「おかげで」는 긍정적 결과(감사), 「せいで」는 부정적 결과(원망). 반어적으로 「おかげで」를 부정에 사용하기도 한다 (あなたのおかげで失敗した = 너 덕분에 실패했다 - 비꼼).',
  'IT현장: 감사 표현에 사용. 「チームのおかげで、プロジェクトが成功しました」「自動テストのおかげで、バグを早期に発見できました」',
  21
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜せいで',
  '~탓에/~때문에',
  '否定的な原因を表す。悪い結果の原因を表す表現。',
  'N3',
  '普通形 + せいで / 名詞 + の + せいで',
  '동사/형용사 보통형 + せいで (예: 雨が降ったせいで) / 명사 + のせいで (예: 台風のせいで). 부정적 결과의 원인.',
  'reason',
  '[{"ja":"台風のせいで、電車が止まった。","ko":"태풍 탓에 전철이 멈추었다.","highlight":"台風のせいで"},{"ja":"設定ミスのせいで、本番環境がダウンしました。","ko":"설정 실수 탓에 운영 환경이 다운되었습니다.","highlight":"設定ミスのせいで"}]'::jsonb,
  ARRAY['〜おかげで', '〜ために', '〜から'],
  '「せいで」는 반드시 부정적 결과에 사용. 긍정적 결과에 사용하면 비꼬는 의미가 된다. 자기 책임을 회피할 때 사용하면 비호감을 줄 수 있으므로 주의.',
  'IT현장: 원인 분석에 사용. 「メモリリークのせいで、サーバーが落ちました」「ライブラリのバグのせいで開発が遅れました」',
  22
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ものだ',
  '~하는 것이다/~했었다',
  '一般論・感嘆・回想を表す。一般的な事実、感嘆、過去の回想を表す多義的表現。',
  'N3',
  '動詞辞書形 + ものだ / 動詞た形 + ものだ',
  '동사 사전형 + ものだ (일반론: 人は失敗するものだ = 사람은 실패하는 것이다) / 동사 た형 + ものだ (회상: よく遊んだものだ = 잘 놀았었다). 감탄에도 사용.',
  'formal',
  '[{"ja":"時間が経つのは早いものですね。","ko":"시간이 지나는 것은 빠르군요.","highlight":"早いものですね"},{"ja":"入社したばかりの頃は、毎日残業したものです。","ko":"입사한 지 얼마 안 됐을 때는 매일 야근했었습니다.","highlight":"残業したものです"}]'::jsonb,
  ARRAY['〜ことだ', '〜べきだ', '〜ものだから'],
  '「ものだ」는 ①일반론(~하는 것이다), ②감탄(~하구나), ③회상(~했었다)의 세 가지 용법이 있다. 문맥으로 구분해야 한다.',
  'IT현장: 일반론에 사용. 「バグは必ず出るものです」「技術は日々進化するものだ」',
  23
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ことだ',
  '~하는 것이 좋다',
  '忠告を表す。忠告やアドバイスを表す表現。',
  'N3',
  '動詞辞書形 + ことだ / 動詞ない形 + ことだ',
  '동사 사전형 + ことだ (예: 早く寝ることだ = 일찍 자는 것이 좋다) / 동사 ない형 + ことだ (예: 無理しないことだ = 무리하지 않는 것이 좋다). 충고/조언.',
  'manner',
  '[{"ja":"健康のためには、よく寝ることです。","ko":"건강을 위해서는 잘 자는 것입니다.","highlight":"寝ることです"},{"ja":"スキルアップしたいなら、毎日コードを書くことです。","ko":"스킬업하고 싶다면 매일 코드를 쓰는 것입니다.","highlight":"書くことです"}]'::jsonb,
  ARRAY['〜ほうがいい', '〜べきだ', '〜ものだ'],
  '「ことだ」는 일반적 충고(~하는 것이다), 「ほうがいい」는 개인적 조언(~하는 게 좋다), 「べきだ」는 당위(~해야 한다). 「ことだ」는 약간 설교적 톤이 있다.',
  'IT현장: 조언에 사용. 「まずは公式ドキュメントを読むことです」「わからないことは早めに質問することです」',
  24
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜べきだ',
  '~해야 한다',
  '当然を表す。道理上当然そうすべきだという判断を表す。',
  'N3',
  '動詞辞書形 + べきだ / する → すべきだ/するべきだ',
  '동사 사전형 + べきだ (예: 行くべきだ = 가야 한다). 「する」는 「すべき」「するべき」모두 가능. 부정: 〜べきではない (하지 말아야 한다).',
  'obligation',
  '[{"ja":"約束は守るべきです。","ko":"약속은 지켜야 합니다.","highlight":"守るべき"},{"ja":"リリース前にセキュリティチェックをすべきです。","ko":"릴리스 전에 보안 체크를 해야 합니다.","highlight":"すべき"}]'::jsonb,
  ARRAY['〜なければならない', '〜ことだ', '〜ものだ'],
  '「べきだ」는 도덕적/논리적 당위성, 「なければならない」는 의무/규칙. 「べきではない」는 「하지 말아야 한다」로 「してはいけない」보다 부드러운 표현.',
  'IT현장: 코드 리뷰에서 자주 사용. 「エラーハンドリングを追加すべきです」「この処理はリファクタリングすべきです」',
  25
);

-- ============================================
-- N2 Grammar Points (25)
-- ============================================

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜にもかかわらず',
  '~에도 불구하고',
  '逆接を表す。前の状況にもかかわらず、予想に反する結果になることを表す硬い表現。',
  'N2',
  '普通形 + にもかかわらず / 名詞 + にもかかわらず / な形容詞 + である + にもかかわらず',
  '동사/い형용사 보통형 + にもかかわらず (예: 努力したにもかかわらず). 명사 + にもかかわらず. な형용사 + であるにもかかわらず. 격식체 표현.',
  'contrast',
  '[{"ja":"注意したにもかかわらず、同じミスを繰り返した。","ko":"주의했음에도 불구하고 같은 실수를 반복했다.","highlight":"注意したにもかかわらず"},{"ja":"テストを十分に行ったにもかかわらず、本番で不具合が発生した。","ko":"테스트를 충분히 했음에도 불구하고 운영에서 장애가 발생했다.","highlight":"行ったにもかかわらず"}]'::jsonb,
  ARRAY['〜のに', '〜けれども', '〜ても'],
  '「にもかかわらず」는 격식체이므로 비즈니스 문서에 적합. 구어에서는 「のに」를 더 많이 사용. 접속 형태(보통형, だ 탈락 등)에 주의.',
  'IT현장: 장애 보고서에 사용. 「入念にテストしたにもかかわらず、不具合が見つかりました」「ドキュメントに記載があるにもかかわらず、対応されていませんでした」',
  1
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜わけにはいかない',
  '~할 수는 없다',
  '不可能・義務を表す。社会的・道徳的理由でできないことを表す。',
  'N2',
  '動詞辞書形 + わけにはいかない / 動詞ない形 + わけにはいかない',
  '동사 사전형 + わけにはいかない (예: 休むわけにはいかない = 쉴 수는 없다). 동사 ない형 + わけにはいかない (예: 行かないわけにはいかない = 안 갈 수는 없다 = 가야 한다).',
  'obligation',
  '[{"ja":"体調が悪くても、仕事を休むわけにはいかない。","ko":"컨디션이 안 좋아도 일을 쉴 수는 없다.","highlight":"休むわけにはいかない"},{"ja":"納期が迫っているので、遅刻するわけにはいかない。","ko":"납기가 다가오고 있으므로 지각할 수는 없다.","highlight":"遅刻するわけにはいかない"}]'::jsonb,
  ARRAY['〜ざるを得ない', '〜ないわけにはいかない', '〜しかない'],
  '「〜わけにはいかない」는 사회적/도덕적 이유로 불가, 「〜ことができない」는 능력적 불가. 이중부정: 「〜ないわけにはいかない」 = ~하지 않을 수 없다 = ~해야 한다.',
  'IT현장: 책임감 표현에 사용. 「バグを放置するわけにはいかない」「セキュリティの問題を無視するわけにはいきません」',
  2
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ばかりだ',
  '~뿐이다/계속 ~하다',
  '一方向の変化を表す。状況が一方向に進んでいくことを表す。',
  'N2',
  '動詞辞書形 + ばかりだ',
  '동사 사전형 + ばかりだ (예: 増えるばかりだ = 계속 늘기만 한다). 주로 부정적인 방향의 변화에 사용.',
  'degree',
  '[{"ja":"物価は上がるばかりで、生活が苦しい。","ko":"물가는 오르기만 해서 생활이 힘들다.","highlight":"上がるばかり"},{"ja":"技術負債が増えるばかりで、リファクタリングが追いつかない。","ko":"기술 부채가 늘어나기만 해서 리팩토링이 따라가지 못한다.","highlight":"増えるばかり"}]'::jsonb,
  ARRAY['〜一方だ', '〜ばかり', '〜だけだ'],
  '「〜るばかりだ」(점점 ~하기만 하다)와 「〜たばかりだ」(막 ~한 참이다)를 혼동하지 않도록 주의. 사전형 vs た형으로 의미가 완전히 다름.',
  'IT현장: 문제 상황 보고에 사용. 「バグの報告が増えるばかりです」「コードの複雑さが増すばかりで、保守が難しくなっています」',
  3
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ばかりか〜も',
  '~뿐만 아니라 ~도',
  '追加を表す。ある事柄に加えて、さらに別の事柄もあることを表す。',
  'N2',
  '普通形 + ばかりか / 名詞 + ばかりか',
  '동사/형용사 보통형 + ばかりか (예: 高いばかりか). 명사 + ばかりか. 뒤에 「〜も」「〜さえ」가 호응.',
  'emphasis',
  '[{"ja":"彼は英語ばかりか、フランス語も話せる。","ko":"그는 영어뿐만 아니라 프랑스어도 할 수 있다.","highlight":"英語ばかりか"},{"ja":"このツールは無料であるばかりか、機能も充実している。","ko":"이 도구는 무료일 뿐만 아니라 기능도 충실하다.","highlight":"無料であるばかりか"}]'::jsonb,
  ARRAY['〜だけでなく〜も', '〜のみならず', '〜に加えて'],
  '「ばかりか」 뒤에는 반드시 「も」「さえ」등이 와야 한다. 비슷한 표현: 「〜だけでなく〜も」(보다 일반적), 「〜のみならず」(보다 격식적).',
  'IT현장: 장점 강조에 사용. 「Reactは学びやすいばかりか、エコシステムも充実しています」「このバグは機能に影響するばかりか、セキュリティリスクにもなります」',
  4
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜とともに',
  '~와 함께/~함과 동시에',
  '同時を表す。ある変化に伴って別の変化が起こることを表す。',
  'N2',
  '動詞辞書形 + とともに / 名詞 + とともに',
  '동사 사전형 + とともに (예: 成長するとともに). 명사 + とともに (예: 時代とともに). 「と一緒に」보다 격식적.',
  'time',
  '[{"ja":"年齢とともに体力が落ちてきた。","ko":"나이와 함께 체력이 떨어져 왔다.","highlight":"年齢とともに"},{"ja":"技術の進歩とともに、開発手法も変化しています。","ko":"기술의 진보와 함께 개발 방법도 변화하고 있습니다.","highlight":"進歩とともに"}]'::jsonb,
  ARRAY['〜に伴って', '〜につれて', '〜と同時に'],
  '「とともに」는 ①동반(~와 함께), ②동시변화(~함과 동시에) 두 가지 의미. 문맥으로 판단. 「につれて」「に伴って」와 비교 학습이 효과적.',
  'IT현장: 변화 설명에 사용. 「ユーザー数の増加とともに、サーバーの負荷も増えています」「プロジェクトの進行とともに要件が明確になってきました」',
  5
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜がたい',
  '~하기 어렵다',
  '困難を表す。心理的にそうすることが難しいことを表す硬い表現。',
  'N2',
  '動詞ます形(ますを取る) + がたい',
  '동사 ます형에서 ます를 제거하고 + がたい (예: 信じがたい, 理解しがたい, 受け入れがたい). 주로 감정/심리 동사에 사용.',
  'degree',
  '[{"ja":"彼の行動は理解しがたい。","ko":"그의 행동은 이해하기 어렵다.","highlight":"理解しがたい"},{"ja":"この仕様変更は受け入れがたいものがあります。","ko":"이 사양 변경은 받아들이기 어려운 면이 있습니다.","highlight":"受け入れがたい"}]'::jsonb,
  ARRAY['〜にくい', '〜づらい', '〜かねる'],
  '「〜がたい」(심리적 어려움, 격식), 「〜にくい」(물리적/일반적 어려움), 「〜づらい」(신체적/심리적 불편). 사용 동사가 제한적 (信じがたい ○, 食べがたい ×).',
  'IT현장: 정중한 거절/비판에 사용. 「この設計は賛同しがたい部分があります」「信じがたいバグが発見されました」',
  6
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜なり〜なり',
  '~든지 ~든지',
  '選択を表す。複数の選択肢を例示する表現。',
  'N2',
  '動詞辞書形 + なり + 動詞辞書形 + なり / 名詞 + なり + 名詞 + なり',
  '동사 사전형 + なり를 반복 (예: 食べるなり飲むなり) / 명사 + なり를 반복 (예: 電話なりメールなり). 「어떤 것이든 하나를 선택하라」는 뉘앙스.',
  'listing',
  '[{"ja":"わからなければ、先生に聞くなり本で調べるなりしてください。","ko":"모르겠으면 선생님에게 묻든지 책에서 찾든지 해 주세요.","highlight":"聞くなり調べるなり"},{"ja":"SlackなりメールなりでPMに連絡してください。","ko":"Slack이든 메일이든 PM에게 연락해 주세요.","highlight":"Slackなりメールなり"}]'::jsonb,
  ARRAY['〜とか〜とか', '〜か〜か', '〜にしろ〜にしろ'],
  '「〜なり〜なり」는 선택지를 제시하며 하나를 선택하라는 뉘앙스. 약간 명령적/제안적 톤이 있어 윗사람에게는 부적절할 수 있다.',
  'IT현장: 대안 제시에 사용. 「検索するなりドキュメントを読むなりして解決してください」「JiraなりGitHubなりでチケットを作ってください」',
  7
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜べき',
  '~해야 한다/~해야 할',
  '当然を表す。道理として当然そうすべきだという判断を表す。',
  'N2',
  '動詞辞書形 + べき(だ) / するべき → すべき',
  '동사 사전형 + べき (예: 行くべき, 考えるべき). 「する」는 「すべき」「するべき」 모두 가능. 부정: 〜べきではない.',
  'obligation',
  '[{"ja":"約束は守るべきだ。","ko":"약속은 지켜야 한다.","highlight":"守るべき"},{"ja":"セキュリティの脆弱性は早急に対応すべきです。","ko":"보안 취약점은 조속히 대응해야 합니다.","highlight":"対応すべき"}]'::jsonb,
  ARRAY['〜なければならない', '〜ものだ', '〜べきではない'],
  '「〜べき」는 도덕적/논리적 당위, 「〜なければならない」는 의무/규칙. 「〜べきではない」는 「하지 말아야 한다」(「してはいけない」보다 부드러움).',
  'IT현장: 코드 리뷰에서 자주 사용. 「変数名はもっと分かりやすくすべきです」「この処理にはエラーハンドリングを追加すべきです」',
  8
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ものの',
  '~지만/~이긴 하지만',
  '逆接を表す。前の事実を認めつつ、後ろで対立する内容を述べる硬い表現。',
  'N2',
  '普通形 + ものの / な形容詞 + である + ものの / 名詞 + である + ものの',
  '동사/い형용사 보통형 + ものの (예: 買ったものの, 高いものの). な형용사 + であるものの. 명사 + であるものの. 문어적 표현.',
  'contrast',
  '[{"ja":"薬を飲んだものの、あまり効果がなかった。","ko":"약을 먹긴 했지만 별로 효과가 없었다.","highlight":"飲んだものの"},{"ja":"新しいフレームワークを導入したものの、学習コストが高い。","ko":"새로운 프레임워크를 도입하긴 했지만 학습 비용이 높다.","highlight":"導入したものの"}]'::jsonb,
  ARRAY['〜けれども', '〜のに', '〜とはいえ'],
  '「ものの」는 문어체로 보고서에 적합. 「けれども」보다 격식적. 뒤에 명령/의뢰 표현은 오기 어렵다.',
  'IT현장: 보고서/문서에 사용. 「リリースしたものの、いくつかの問題が報告されています」「設計は完了したものの、実装にはまだ時間がかかります」',
  9
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜に基づいて',
  '~에 기반하여',
  '基準を表す。ある事柄を根拠・基準として行動することを表す。',
  'N2',
  '名詞 + に基づいて / 名詞 + に基づく + 名詞',
  '명사 + に基づいて (예: データに基づいて) / 명사 수식: 名詞 + に基づく + 名詞 (예: データに基づく分析). 「に基づき」는 보다 격식적.',
  'manner',
  '[{"ja":"法律に基づいて判断する。","ko":"법률에 기반하여 판단한다.","highlight":"法律に基づいて"},{"ja":"要件定義に基づいて設計を行います。","ko":"요건 정의에 기반하여 설계를 수행합니다.","highlight":"要件定義に基づいて"}]'::jsonb,
  ARRAY['〜をもとに', '〜に沿って', '〜に従って'],
  '「に基づいて」(근거/기준), 「をもとに」(참고/재료), 「に沿って」(방침을 따라), 「に従って」(지시를 따라)의 미묘한 차이를 이해해야 함.',
  'IT현장: 문서화/보고에 필수. 「設計書に基づいて実装を進めてください」「テスト計画に基づいてテストを実施します」',
  10
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜というより',
  '~라기보다',
  '訂正を表す。前の表現を訂正して、より正確な表現に言い換える。',
  'N2',
  '普通形 + というより / 名詞 + というより / な形容詞 + というより',
  '동사/형용사 보통형 + というより (예: 難しいというより) / 명사 + というより (예: バグというより). 보다 정확한 표현으로 수정할 때 사용.',
  'contrast',
  '[{"ja":"彼は天才というより、努力家だ。","ko":"그는 천재라기보다 노력가이다.","highlight":"天才というより"},{"ja":"これはバグというより、仕様の問題です。","ko":"이것은 버그라기보다 사양의 문제입니다.","highlight":"バグというより"}]'::jsonb,
  ARRAY['〜というか', '〜どちらかというと', '〜むしろ'],
  '「というより」 뒤에 보다 적절한 표현이 온다. 「というか」는 구어적 수정 표현. 「むしろ」(차라리)와 함께 사용하면 강조됨.',
  'IT현장: 정확한 표현으로 수정할 때 사용. 「バグというより、設計上の問題です」「遅いというより、タイムアウトしています」',
  11
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜一方で',
  '~하는 한편',
  '対比を表す。一つの側面と別の側面を対比して述べる表現。',
  'N2',
  '普通形 + 一方(で) / 名詞 + の一方(で) / な形容詞 + な/である + 一方(で)',
  '동사 보통형 + 一方で (예: 増える一方で = 늘어나는 한편) / 명사 + の一方で. 두 가지 측면을 대비시킬 때 사용.',
  'contrast',
  '[{"ja":"都市部の人口は増える一方で、地方は減少している。","ko":"도시부의 인구는 늘어나는 한편 지방은 감소하고 있다.","highlight":"増える一方で"},{"ja":"フロントエンドを改善する一方で、バックエンドの最適化も必要です。","ko":"프론트엔드를 개선하는 한편 백엔드 최적화도 필요합니다.","highlight":"改善する一方で"}]'::jsonb,
  ARRAY['〜反面', '〜に対して', '〜とともに'],
  '「一方で」는 대비, 「一方だ」(〜る一方だ)는 한 방향으로만 진행. 이 두 가지를 혼동하지 말 것. 「反面」은 같은 주어의 양면, 「一方で」는 다른 대상 간 대비도 가능.',
  'IT현장: 양면 분석에 사용. 「生産性は上がった一方で、コードの品質が下がっています」「機能を追加する一方で、技術負債も増えています」',
  12
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜に伴い',
  '~에 따라/~에 수반하여',
  '随伴を表す。ある変化に伴って別の変化が起こることを表す硬い表現。',
  'N2',
  '名詞 + に伴い / 動詞辞書形 + のに伴い',
  '명사 + に伴い/に伴って (예: 成長に伴い = 성장에 따라) / 동사 사전형 + のに伴い. 격식적 표현. 수식: 名詞 + に伴う + 名詞.',
  'change',
  '[{"ja":"経済の発展に伴い、環境問題も深刻になった。","ko":"경제 발전에 따라 환경 문제도 심각해졌다.","highlight":"発展に伴い"},{"ja":"ユーザー数の増加に伴い、サーバーを増強しました。","ko":"유저 수 증가에 따라 서버를 증강했습니다.","highlight":"増加に伴い"}]'::jsonb,
  ARRAY['〜とともに', '〜につれて', '〜に従って'],
  '「に伴い」(수반), 「とともに」(함께), 「につれて」(~함에 따라), 「に従って」(~에 따라)는 모두 동시 변화를 나타내지만 격식도와 뉘앙스가 다르다.',
  'IT현장: 변화 보고에 사용. 「トラフィック増加に伴い、インフラを拡張しました」「組織の拡大に伴い、開発プロセスを見直しました」',
  13
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜を通じて',
  '~을 통해서',
  '手段・期間を表す。手段や媒介、期間全体を通じてを表す。',
  'N2',
  '名詞 + を通じて / 名詞 + を通して',
  '명사 + を通じて/を通して (예: インターネットを通じて = 인터넷을 통해서, 一年を通じて = 1년 내내). 「通じて」와 「通して」는 거의 같은 의미.',
  'manner',
  '[{"ja":"インターネットを通じて世界中の情報を得られる。","ko":"인터넷을 통해서 전 세계의 정보를 얻을 수 있다.","highlight":"インターネットを通じて"},{"ja":"コードレビューを通じて、チーム全体のスキルが向上しました。","ko":"코드 리뷰를 통해서 팀 전체의 스킬이 향상되었습니다.","highlight":"コードレビューを通じて"}]'::jsonb,
  ARRAY['〜によって', '〜をもって', '〜を介して'],
  '「を通じて」는 ①수단/매개(~을 통해서), ②기간(一年を通じて = 1년 내내)의 두 가지 용법. 「を通して」와 거의 호환 가능.',
  'IT현장: 수단 설명에 사용. 「Slackを通じて連絡します」「ペアプログラミングを通じて知識共有を促進しています」',
  14
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜をはじめ',
  '~을 비롯하여',
  '代表例を表す。代表的な例を挙げてから、他にも多数あることを示す。',
  'N2',
  '名詞 + をはじめ(として)',
  '명사 + をはじめ/をはじめとして (예: 東京をはじめ = 도쿄를 비롯하여). 대표적인 예를 먼저 제시하고, 그 외에도 많다는 의미.',
  'listing',
  '[{"ja":"東京をはじめ、大阪や名古屋でもイベントを開催します。","ko":"도쿄를 비롯하여 오사카나 나고야에서도 이벤트를 개최합니다.","highlight":"東京をはじめ"},{"ja":"Reactをはじめ、Vue、Angularなど多くのフレームワークがあります。","ko":"React를 비롯하여 Vue, Angular 등 많은 프레임워크가 있습니다.","highlight":"Reactをはじめ"}]'::jsonb,
  ARRAY['〜など', '〜を中心に', '〜のみならず'],
  '「をはじめ」 뒤에는 다른 예시가 온다. 대표적인 것을 먼저 언급하는 표현. 「をはじめとする」로 명사 수식도 가능.',
  'IT현장: 기술 나열에 사용. 「AWSをはじめ、GCP、Azureなどのクラウドサービスに対応しています」「JavaScriptをはじめとするフロントエンド技術を習得しました」',
  15
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜に限り',
  '~에 한해서',
  '限定を表す。特定の条件や対象に限って許可・適用されることを表す。',
  'N2',
  '名詞 + に限り / 名詞 + に限って',
  '명사 + に限り (예: 本日に限り = 오늘에 한해서) / 명사 + に限って (예: うちの子に限って = 우리 아이에 한해서). 격식적 한정 표현.',
  'condition',
  '[{"ja":"会員に限り、20%割引いたします。","ko":"회원에 한해서 20% 할인합니다.","highlight":"会員に限り"},{"ja":"管理者に限り、この操作が可能です。","ko":"관리자에 한해서 이 조작이 가능합니다.","highlight":"管理者に限り"}]'::jsonb,
  ARRAY['〜だけ', '〜のみ', '〜に限って'],
  '「に限り」는 격식적 한정, 「だけ」는 일반적 한정. 「に限って」는 ①한정(~에 한해서), ②반어(~에 한해서 그럴 리가 = 하필)의 두 가지 의미가 있어 주의.',
  'IT현장: 권한 설정에 사용. 「adminロールに限り、ユーザー管理が可能です」「社内ネットワークに限り、アクセスを許可しています」',
  16
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜に応じて',
  '~에 따라서/~에 맞추어',
  '対応を表す。状況や条件に応じて変化・対応することを表す。',
  'N2',
  '名詞 + に応じて / 名詞 + に応じた + 名詞',
  '명사 + に応じて (예: 需要に応じて = 수요에 따라서) / 수식: 名詞 + に応じた + 名詞 (예: レベルに応じた教材). 상황에 맞추어 변화하는 것.',
  'condition',
  '[{"ja":"レベルに応じて問題の難易度が変わります。","ko":"레벨에 따라서 문제의 난이도가 바뀝니다.","highlight":"レベルに応じて"},{"ja":"トラフィックに応じて自動的にスケーリングします。","ko":"트래픽에 따라서 자동으로 스케일링합니다.","highlight":"トラフィックに応じて"}]'::jsonb,
  ARRAY['〜によって', '〜次第で', '〜に合わせて'],
  '「に応じて」(상황에 맞추어 대응), 「によって」(원인/수단), 「次第で」(~에 달려 있다)의 뉘앙스 차이를 이해해야 한다.',
  'IT현장: 동적 대응에 사용. 「ユーザーの権限に応じて表示内容を変えています」「負荷に応じてリソースを調整します」',
  17
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜向けに',
  '~용으로/~대상으로',
  '対象を表す。特定の対象者やターゲットに向けたものであることを表す。',
  'N2',
  '名詞 + 向けに / 名詞 + 向けの + 名詞 / 名詞 + 向け',
  '명사 + 向けに (예: 初心者向けに = 초보자용으로) / 수식: 名詞 + 向けの + 名詞 (예: 初心者向けの教材 = 초보자용 교재).',
  'manner',
  '[{"ja":"子供向けの本を買いました。","ko":"아이들용 책을 샀습니다.","highlight":"子供向けの"},{"ja":"初心者向けにチュートリアルを作成しました。","ko":"초보자용으로 튜토리얼을 작성했습니다.","highlight":"初心者向けに"}]'::jsonb,
  ARRAY['〜用の', '〜のための', '〜を対象に'],
  '「向け」는 대상/타겟, 「用」은 용도. 「子供向け」(아이 대상)와 「子供用」(아이용)은 비슷하지만 「向け」가 더 마케팅적 뉘앙스.',
  'IT현장: 대상 명시에 사용. 「エンタープライズ向けにAPIを提供しています」「モバイル向けのUIを設計しました」',
  18
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜からして',
  '~부터가/~로 보아',
  '判断の根拠・始点を表す。最初の段階から既にそうであること、または判断の根拠を表す。',
  'N2',
  '名詞 + からして',
  '명사 + からして (예: 名前からして = 이름부터가, 見た目からして = 외관으로 보아). ①시작점 강조, ②판단 근거의 두 가지 용법.',
  'emphasis',
  '[{"ja":"彼は態度からして真面目だ。","ko":"그는 태도로 보아 성실하다.","highlight":"態度からして"},{"ja":"このコードは変数名からして問題がある。","ko":"이 코드는 변수명부터가 문제가 있다.","highlight":"変数名からして"}]'::jsonb,
  ARRAY['〜から言うと', '〜をはじめ', '〜からすると'],
  '「からして」는 ①~부터가(시작점이 이미 문제), ②~로 보아(판단 근거). 부정적 문맥에서 ①이 더 자주 사용된다. 「からすると」는 판단 기준.',
  'IT현장: 문제 지적에 사용. 「設計からしてやり直す必要があります」「テストケースの数からして不十分です」',
  19
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜からといって',
  '~라고 해서',
  '理由の否定を表す。ある理由があるからといって、必ずしもそうとは限らないことを表す。',
  'N2',
  '普通形 + からといって / 名詞 + だからといって',
  '동사/형용사 보통형 + からといって (예: 安いからといって) / 명사 + だからといって (예: 学生だからといって). 뒤에 부정적 결론이 온다.',
  'contrast',
  '[{"ja":"安いからといって、品質が悪いわけではない。","ko":"싸다고 해서 품질이 나쁜 것은 아니다.","highlight":"安いからといって"},{"ja":"テストが通ったからといって、バグがないとは限りません。","ko":"테스트가 통과했다고 해서 버그가 없다고는 할 수 없습니다.","highlight":"通ったからといって"}]'::jsonb,
  ARRAY['〜とはいえ', '〜にしても', '〜としても'],
  '「からといって」 뒤에는 「〜わけではない」「〜とは限らない」등 부정 표현이 자주 온다. 한국어 「~라고 해서」와 정확히 대응.',
  'IT현장: 반론에 사용. 「新しい技術だからといって、必ずしも良いとは限りません」「テストカバレッジが高いからといって、品質が保証されるわけではありません」',
  20
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜というものだ',
  '~라는 것이다',
  '本質を表す。物事の本質や道理を述べる表現。',
  'N2',
  '普通形 + というものだ / 名詞 + というものだ',
  '동사/형용사 보통형 + というものだ (예: 甘いというものだ) / 명사 + というものだ (예: 常識というものだ). 화자의 강한 판단을 나타냄.',
  'emphasis',
  '[{"ja":"努力すれば報われるというものだ。","ko":"노력하면 보상받는다는 것이다.","highlight":"報われるというものだ"},{"ja":"チームで働く以上、報連相は基本というものです。","ko":"팀으로 일하는 이상 보고연락상담은 기본이라는 것입니다.","highlight":"基本というものです"}]'::jsonb,
  ARRAY['〜ものだ', '〜というものではない', '〜というわけだ'],
  '「というものだ」(~라는 것이다 - 본질 주장)와 「というものではない」(~라는 것은 아니다 - 부정)를 함께 학습. 강한 주관이 담긴 표현.',
  'IT현장: 원칙 주장에 사용. 「コードの品質を保つことが、プロというものです」「納期を守るのはビジネスの基本というものだ」',
  21
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ことなく',
  '~하는 일 없이',
  '否定的付帯を表す。ある動作をしないまま別の動作をすることを表す硬い表現。',
  'N2',
  '動詞辞書形 + ことなく',
  '동사 사전형 + ことなく (예: 休むことなく = 쉬는 일 없이, 諦めることなく = 포기하는 일 없이). 「〜ないで」의 격식적 표현.',
  'formal',
  '[{"ja":"彼は一日も休むことなく練習を続けた。","ko":"그는 하루도 쉬는 일 없이 연습을 계속했다.","highlight":"休むことなく"},{"ja":"エラーが発生することなく、処理が完了しました。","ko":"에러가 발생하는 일 없이 처리가 완료되었습니다.","highlight":"発生することなく"}]'::jsonb,
  ARRAY['〜ないで', '〜ずに', '〜なしに'],
  '「ことなく」는 문어적/격식적 표현으로 보고서에 적합. 「ないで」(구어), 「ずに」(문어), 「ことなく」(가장 격식적)의 순서.',
  'IT현장: 보고서에 사용. 「ダウンタイムが発生することなく、移行が完了しました」「問題が起きることなく、リリースが成功しました」',
  22
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜次第',
  '~하는 대로/~에 달려 있다',
  '即時・依存を表す。動作完了後すぐ、または結果が何かに依存することを表す。',
  'N2',
  '動詞ます形(ますを取る) + 次第 / 名詞 + 次第',
  '동사 ます형에서 ます를 제거 + 次第 (예: 届き次第 = 도착하는 대로) / 명사 + 次第 (예: 結果次第 = 결과에 달려 있다). 두 가지 용법이 있다.',
  'condition',
  '[{"ja":"届き次第、ご連絡いたします。","ko":"도착하는 대로 연락드리겠습니다.","highlight":"届き次第"},{"ja":"予算次第で、機能の範囲が変わります。","ko":"예산에 달려서 기능의 범위가 바뀝니다.","highlight":"予算次第で"}]'::jsonb,
  ARRAY['〜たらすぐ', '〜によって', '〜に応じて'],
  '「動詞ます形 + 次第」(~하는 대로 즉시)와 「名詞 + 次第」(~에 달려 있다)의 두 가지 용법을 구분해야 한다. 격식적 표현으로 비즈니스에 적합.',
  'IT현장: 즉시 대응 표현에 사용. 「確認でき次第、返信いたします」「スケジュールはクライアントの判断次第です」',
  23
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜に反して',
  '~에 반하여',
  '反対を表す。期待や予想に反する結果を表す。',
  'N2',
  '名詞 + に反して / 名詞 + に反する + 名詞',
  '명사 + に反して (예: 予想に反して = 예상에 반하여) / 수식: 名詞 + に反する + 名詞 (예: 期待に反する結果). 예상과 다른 결과를 나타냄.',
  'contrast',
  '[{"ja":"予想に反して、売り上げが伸びた。","ko":"예상에 반하여 매출이 늘었다.","highlight":"予想に反して"},{"ja":"期待に反して、パフォーマンスが改善しませんでした。","ko":"기대에 반하여 성능이 개선되지 않았습니다.","highlight":"期待に反して"}]'::jsonb,
  ARRAY['〜にもかかわらず', '〜に対して', '〜とは裏腹に'],
  '「に反して」는 예상/기대와 반대의 결과. 긍정적/부정적 결과 모두 가능. 「にもかかわらず」와 비슷하지만, 「에 반하여」라는 직접적 대비가 특징.',
  'IT현장: 결과 보고에 사용. 「想定に反して、処理速度が低下しました」「初期の予測に反して、ユーザー数が急増しました」',
  24
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜上で',
  '~하는 데 있어서/~한 후에',
  '条件・段階を表す。何かをする上での条件や、何かをした後での意味を表す。',
  'N2',
  '動詞辞書形 + 上で / 動詞た形 + 上で / 名詞 + の上で',
  '동사 사전형 + 上で (예: 使う上で = 사용하는 데 있어서) / 동사 た형 + 上で (예: 確認した上で = 확인한 후에) / 명사 + の上で (예: 仕事の上で).',
  'condition',
  '[{"ja":"契約する上で、注意すべき点があります。","ko":"계약하는 데 있어서 주의해야 할 점이 있습니다.","highlight":"契約する上で"},{"ja":"テスト結果を確認した上で、リリースを判断します。","ko":"테스트 결과를 확인한 후에 릴리스를 판단합니다.","highlight":"確認した上で"}]'::jsonb,
  ARRAY['〜において', '〜にあたって', '〜た後で'],
  '사전형 + 上で (조건: ~하는 데 있어서)와 た형 + 上で (순서: ~한 후에)의 두 가지 용법을 구분. 격식적 표현으로 비즈니스 문서에 적합.',
  'IT현장: 조건/순서에 사용. 「開発する上で、セキュリティを最優先にしてください」「仕様を確認した上で、見積もりを出します」',
  25
);

-- ============================================
-- N1 Grammar Points (20)
-- ============================================

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜をもって',
  '~을/를 가지고/~로써',
  '手段・期限を表す。手段や期限を表す硬い表現。',
  'N1',
  '名詞 + をもって',
  '명사 + をもって (예: 本日をもって = 오늘부로, 誠意をもって = 성의를 가지고). 기한: 「〜をもって終了する」, 수단: 「〜をもって対応する」.',
  'manner',
  '[{"ja":"本日をもって、このサービスは終了いたします。","ko":"오늘부로 이 서비스는 종료합니다.","highlight":"本日をもって"},{"ja":"今回のリリースをもって、レガシーシステムのサポートを終了します。","ko":"이번 릴리스를 기점으로 레거시 시스템 지원을 종료합니다.","highlight":"リリースをもって"}]'::jsonb,
  ARRAY['〜によって', '〜で', '〜を通じて'],
  '「をもって」는 격식적 표현으로 공식 문서에서 사용. 기한(本日をもって)과 수단(誠意をもって)의 두 가지 용법을 구분해야 함.',
  'IT현장: 공식 안내에 사용. 「本バージョンをもってサポートを終了いたします」「書面をもって通知いたします」',
  1
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜たりとも〜ない',
  '단 ~조차도 ~않다',
  '強い否定を表す。わずかな量でも許さないという強い否定を表す。',
  'N1',
  '数量詞 + たりとも + 否定形',
  '수량사 + たりとも + 부정형 (예: 一日たりとも忘れない, 一円たりとも無駄にしない). 「一〜たりとも」의 형태가 일반적.',
  'emphasis',
  '[{"ja":"一日たりとも練習を休まなかった。","ko":"단 하루도 연습을 쉬지 않았다.","highlight":"一日たりとも"},{"ja":"一行たりともコードを無駄にしたくない。","ko":"단 한 줄의 코드도 낭비하고 싶지 않다.","highlight":"一行たりとも"}]'::jsonb,
  ARRAY['〜すら〜ない', '〜も〜ない', '〜だに〜ない'],
  '「たりとも」는 반드시 부정형과 함께 사용. 수량사(一日, 一人, 一円 등)와 결합하며, 강한 의지를 나타냄. 매우 격식적인 표현.',
  'IT현장: 품질에 대한 강한 의지 표현. 「一件たりともバグを見逃さない」「一秒たりともダウンタイムを許容しない」',
  2
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜んがために',
  '~하기 위해서',
  '強い目的を表す。強い意志を持って目的を達成しようとすることを表す文語表現。',
  'N1',
  '動詞ない形(ないを取る) + んがために / する → せんがために',
  '동사 ない형에서 ない를 제거 + んがために (예: 勝たんがために). 「する」는 「せんがために」. 매우 격식적인 문어체.',
  'reason',
  '[{"ja":"夢を実現せんがために、毎日努力している。","ko":"꿈을 실현하기 위해 매일 노력하고 있다.","highlight":"実現せんがために"},{"ja":"品質を向上せんがために、厳格なコードレビュー体制を導入した。","ko":"품질을 향상시키기 위해 엄격한 코드 리뷰 체제를 도입했다.","highlight":"向上せんがために"}]'::jsonb,
  ARRAY['〜ために', '〜ようとして', '〜べく'],
  '매우 격식적이고 문어적인 표현. 일상회화에서는 거의 사용하지 않음. 「ために」의 강조 표현으로, 강한 의지가 담겨 있음.',
  'IT현장: 격식적 문서나 프레젠테이션에서 사용. 「生産性を高めんがために、自動化ツールを開発しました」 - 실제 업무에서는 「〜ために」로 충분.',
  3
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜を余儀なくされる',
  '~하지 않을 수 없게 되다',
  'やむを得ない状況を表す。外部の力によって仕方なくそうせざるを得なくなることを表す。',
  'N1',
  '名詞 + を余儀なくされる / 名詞 + を余儀なくさせる',
  '명사 + を余儀なくされる (수동: ~을 강요받다) / 명사 + を余儀なくさせる (능동: ~을 강요하다). 주로 수동형으로 사용.',
  'obligation',
  '[{"ja":"台風で旅行の中止を余儀なくされた。","ko":"태풍으로 여행 취소를 할 수밖에 없었다.","highlight":"中止を余儀なくされた"},{"ja":"セキュリティ問題により、緊急メンテナンスを余儀なくされました。","ko":"보안 문제로 인해 긴급 유지보수를 하지 않을 수 없게 되었습니다.","highlight":"メンテナンスを余儀なくされました"}]'::jsonb,
  ARRAY['〜ざるを得ない', '〜ないわけにはいかない', '〜せざるを得ない'],
  '주어가 사람이면 「〜を余儀なくされる」(강요받다), 원인이 주어이면 「〜を余儀なくさせる」(강요하다). 격식적인 뉴스/보고서 표현.',
  'IT현장: 장애 보고에 사용. 「サーバー障害により、サービスの一時停止を余儀なくされました」「仕様変更により、設計のやり直しを余儀なくされた」',
  4
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ともなると',
  '~정도가 되면',
  '程度を表す。ある程度・立場に達すると、当然そうなるという意味を表す。',
  'N1',
  '名詞 + ともなると / 動詞辞書形 + ともなると',
  '명사 + ともなると (예: 社長ともなると = 사장 정도가 되면). 동사 사전형 + ともなると. 높은 수준이나 중요한 입장을 나타냄.',
  'condition',
  '[{"ja":"部長ともなると、責任も大きくなる。","ko":"부장 정도가 되면 책임도 커진다.","highlight":"部長ともなると"},{"ja":"大規模プロジェクトともなると、アーキテクチャの設計が重要になる。","ko":"대규모 프로젝트 정도가 되면 아키텍처 설계가 중요해진다.","highlight":"大規模プロジェクトともなると"}]'::jsonb,
  ARRAY['〜ともなれば', '〜にもなると', '〜くらいになると'],
  '「ともなると」는 특정 수준/입장에 도달했을 때의 당연한 결과를 나타냄. 「ともなれば」과 거의 같은 의미. 일반적인 상황보다는 특별한 수준에 사용.',
  'IT현장: 경험/직급에 따른 기대 표현. 「シニアエンジニアともなると、後輩の指導も求められます」「本番環境ともなると、テストの重要性が増します」',
  5
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜以上は',
  '~한 이상은',
  '条件を表す。ある事実がある以上、当然の帰結として行動すべきだという意味を表す。',
  'N1',
  '動詞た形 + 以上(は) / 動詞辞書形 + 以上(は) / 名詞 + である以上(は)',
  '동사 た형/사전형 + 以上(は) (예: 約束した以上は, やる以上は). 명사 + である以上は. 「は」는 생략 가능.',
  'condition',
  '[{"ja":"引き受けた以上は、最後までやり遂げる。","ko":"맡은 이상은 끝까지 해낸다.","highlight":"引き受けた以上は"},{"ja":"エンジニアである以上は、常に技術を学び続けるべきだ。","ko":"엔지니어인 이상은 항상 기술을 계속 배워야 한다.","highlight":"エンジニアである以上は"}]'::jsonb,
  ARRAY['〜からには', '〜上は', '〜限りは'],
  '「以上は」와 「からには」는 거의 같은 의미로 호환 가능. 뒤에는 의지/당위/결의를 나타내는 표현이 온다. 「以上」단독은 N2 수준.',
  'IT현장: 책임감/결의 표현에 사용. 「リリースすると決めた以上は、品質を確保しなければならない」「チームリーダーである以上は、メンバーの成長にも責任がある」',
  6
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜とあって',
  '~이라서/~때문에',
  '理由を表す。特別な状況・理由があるので当然の結果になることを表す。',
  'N1',
  '普通形 + とあって / 名詞 + とあって',
  '동사/형용사 보통형 + とあって (예: 人気があるとあって). 명사 + とあって (예: 連休とあって). 특별한 사정이 이유가 됨을 나타냄.',
  'reason',
  '[{"ja":"連休とあって、どこも混んでいる。","ko":"연휴라서 어디든 붐비고 있다.","highlight":"連休とあって"},{"ja":"大型アップデートとあって、多くのユーザーが注目している。","ko":"대형 업데이트라서 많은 유저가 주목하고 있다.","highlight":"大型アップデートとあって"}]'::jsonb,
  ARRAY['〜だけあって', '〜ことから', '〜ので'],
  '「とあって」는 특별한 상황이 이유임을 강조. 뒤에는 당연한 결과가 온다. 일반적인 이유에는 사용하지 않고, 특별한 상황에만 사용.',
  'IT현장: 특별한 상황 설명에 사용. 「年度末とあって、多くのプロジェクトが締め切りを迎えています」「新技術の発表とあって、カンファレンスは満席でした」',
  7
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜にしてみれば',
  '~의 입장에서 보면',
  '立場を表す。ある人の立場から見た場合の考えや感じ方を表す。',
  'N1',
  '名詞 + にしてみれば / 名詞 + にしてみたら',
  '명사(사람) + にしてみれば (예: 彼にしてみれば). 「にしてみたら」도 같은 의미. 상대의 입장에서 생각할 때 사용.',
  'manner',
  '[{"ja":"親にしてみれば、子供の将来が心配だろう。","ko":"부모의 입장에서 보면 아이의 장래가 걱정될 것이다.","highlight":"親にしてみれば"},{"ja":"クライアントにしてみれば、納期遅延は大きな問題でしょう。","ko":"클라이언트의 입장에서 보면 납기 지연은 큰 문제이겠지요.","highlight":"クライアントにしてみれば"}]'::jsonb,
  ARRAY['〜にとって', '〜から見ると', '〜の立場からすると'],
  '「にしてみれば」는 상대의 심정/입장을 추측할 때 사용. 「にとって」보다 감정적 공감이 담겨 있음. 뒤에는 추측 표현(だろう, でしょう)이 자주 온다.',
  'IT현장: 고객/팀원 입장 고려에 사용. 「PMにしてみれば、スケジュール管理が最優先でしょう」「新人にしてみれば、この環境はまだ慣れないでしょう」',
  8
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ゆえに',
  '~때문에/~이므로',
  '理由(文語)を表す。原因・理由を表す文語的で硬い表現。',
  'N1',
  '名詞 + (が)ゆえに / 普通形 + がゆえに / な形容詞 + である + がゆえに',
  '명사 + (が)ゆえに (예: 若さゆえに, 無知がゆえに). 동사/형용사 보통형 + がゆえに. 매우 격식적인 문어체 표현.',
  'reason',
  '[{"ja":"若さゆえに、失敗することもある。","ko":"젊기 때문에 실패하는 것도 있다.","highlight":"若さゆえに"},{"ja":"技術力が高いがゆえに、難しいタスクが集中する。","ko":"기술력이 높기 때문에 어려운 태스크가 집중된다.","highlight":"高いがゆえに"}]'::jsonb,
  ARRAY['〜から', '〜ので', '〜ために'],
  '「ゆえに」는 매우 격식적인 문어체. 일상 회화에서는 거의 사용하지 않음. 「ゆえの」(~때문의)로 명사 수식도 가능 (若さゆえの過ち).',
  'IT현장: 격식적 보고서에 사용. 「複雑さゆえに、保守コストが増大しています」「レガシーシステムであるがゆえに、改修が困難です」',
  9
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ないまでも',
  '~까지는 아니더라도',
  '程度の譲歩を表す。最高の水準には達しなくても、ある程度は期待することを表す。',
  'N1',
  '動詞ない形 + までも',
  '동사 ない형 + までも (예: 完璧でないまでも, 全部でないまでも). 「〜ないまでも、せめて〜」의 형태가 일반적.',
  'degree',
  '[{"ja":"満点とはいかないまでも、合格点は取りたい。","ko":"만점까지는 아니더라도 합격점은 받고 싶다.","highlight":"いかないまでも"},{"ja":"完璧でないまでも、基本的なテストは通るようにしてください。","ko":"완벽하지는 않더라도 기본적인 테스트는 통과하도록 해 주세요.","highlight":"完璧でないまでも"}]'::jsonb,
  ARRAY['〜とまではいかなくても', '〜とは言わないが', '〜せめて'],
  '「ないまでも」 뒤에는 최소한의 기대/요구가 온다. 「せめて」(최소한)와 함께 사용되는 경우가 많다. 양보하면서도 기대를 표현하는 표현.',
  'IT현장: 현실적 목표 설정에 사용. 「全自動化とはいかないまでも、主要なテストは自動化しましょう」「完全なリファクタリングでないまでも、最低限の改善はすべきです」',
  10
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜なり',
  '~하자마자',
  '即時を表す。ある動作の直後にすぐ別の動作が起こることを表す。',
  'N1',
  '動詞辞書形 + なり',
  '동사 사전형 + なり (예: 帰るなり = 돌아오자마자, 見るなり = 보자마자). 주어는 3인칭이 자연스럽다. 과거형으로 사용하는 경우가 많다.',
  'time',
  '[{"ja":"彼は家に帰るなり、寝てしまった。","ko":"그는 집에 돌아오자마자 자 버렸다.","highlight":"帰るなり"},{"ja":"エラーログを見るなり、原因がわかりました。","ko":"에러 로그를 보자마자 원인을 알았습니다.","highlight":"見るなり"}]'::jsonb,
  ARRAY['〜たとたん', '〜や否や', '〜が早いか'],
  '「なり」는 예상 외의 즉각적 행동에 사용. 1인칭 주어에는 부자연스러움. 「〜たとたん」(~한 순간)보다 더 즉각적인 뉘앙스.',
  'IT현장: 즉각적 반응 묘사에 사용. 「障害アラートが鳴るなり、チーム全員が対応に入りました」「レポートを見るなり、問題点を指摘しました」',
  11
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜がてら',
  '~하는 김에',
  '機会利用を表す。ある動作のついでに別の動作もすることを表す。',
  'N1',
  '動詞ます形(ますを取る) + がてら / 名詞 + がてら',
  '동사 ます형에서 ます를 제거 + がてら (예: 散歩しがてら = 산책하는 김에) / 명사 + がてら (예: 散歩がてら = 산책 김에). 이동을 수반하는 동작에 주로 사용.',
  'time',
  '[{"ja":"散歩がてら、コンビニに寄った。","ko":"산책하는 김에 편의점에 들렀다.","highlight":"散歩がてら"},{"ja":"出張がてら、現地のデータセンターを視察しました。","ko":"출장하는 김에 현지 데이터센터를 시찰했습니다.","highlight":"出張がてら"}]'::jsonb,
  ARRAY['〜ついでに', '〜かたがた', '〜かたわら'],
  '「がてら」는 이동을 수반하는 동작에 주로 사용. 「ついでに」(~하는 김에)보다 격식적. 「かたがた」(~겸)와 비슷하지만 「がてら」가 더 캐주얼.',
  'IT현장: 겸사겸사 표현에 사용. 「打ち合わせがてら、オフィスの環境も確認してきました」「ランチがてら、技術的な相談をしました」',
  12
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜かたわら',
  '~하는 한편으로',
  '並行を表す。主たる活動をしながら、もう一つの活動も並行して行うことを表す。',
  'N1',
  '動詞辞書形 + かたわら / 名詞 + の + かたわら',
  '동사 사전형 + かたわら (예: 働くかたわら = 일하는 한편으로) / 명사 + のかたわら (예: 仕事のかたわら). 주된 활동과 부수적 활동의 병행.',
  'time',
  '[{"ja":"会社で働くかたわら、大学院に通っている。","ko":"회사에서 일하는 한편으로 대학원에 다니고 있다.","highlight":"働くかたわら"},{"ja":"開発業務のかたわら、技術ブログの執筆も行っています。","ko":"개발 업무 한편으로 기술 블로그 집필도 하고 있습니다.","highlight":"開発業務のかたわら"}]'::jsonb,
  ARRAY['〜ながら', '〜一方で', '〜つつ'],
  '「かたわら」는 장기적 병행 활동에 사용. 「ながら」(동시 동작)보다 기간이 길고, 주된 활동과 부수적 활동의 관계가 명확.',
  'IT현장: 병행 활동에 사용. 「プロジェクト管理のかたわら、コーディングも担当しています」「本業のかたわら、OSS活動にも貢献しています」',
  13
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜いかんによらず',
  '~여하에 관계없이',
  '無関係を表す。ある事柄の結果や状況に関係なく、同じ対応をすることを表す。',
  'N1',
  '名詞 + のいかんによらず / 名詞 + のいかんにかかわらず',
  '명사 + のいかんによらず/のいかんにかかわらず (예: 結果のいかんによらず = 결과 여하에 관계없이). 매우 격식적인 문어 표현.',
  'condition',
  '[{"ja":"理由のいかんによらず、遅刻は認められない。","ko":"이유 여하에 관계없이 지각은 인정되지 않는다.","highlight":"理由のいかんによらず"},{"ja":"結果のいかんにかかわらず、全力で取り組みます。","ko":"결과 여하에 관계없이 전력으로 임하겠습니다.","highlight":"結果のいかんにかかわらず"}]'::jsonb,
  ARRAY['〜にかかわらず', '〜を問わず', '〜によらず'],
  '「いかん」는 「如何(いかん)」으로 「어떠한」의 의미. 매우 격식적이어서 공식 문서/규정에 사용. 일상회화에서는 「〜に関係なく」로 대체.',
  'IT현장: 규정/방침 설명에 사용. 「障害の規模のいかんによらず、報告は必須です」「理由のいかんにかかわらず、本番環境への直接アクセスは禁止です」',
  14
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜をものともせず',
  '~을 아랑곳하지 않고',
  '困難の克服を表す。困難や障害を気にせず行動することを表す。',
  'N1',
  '名詞 + をものともせず(に)',
  '명사 + をものともせず(に) (예: 困難をものともせず = 곤란을 아랑곳하지 않고). 역경을 극복하는 의지적 행동에 사용. 칭찬의 뉘앙스가 있다.',
  'emphasis',
  '[{"ja":"彼女は病気をものともせず、大会に出場した。","ko":"그녀는 병을 아랑곳하지 않고 대회에 출전했다.","highlight":"病気をものともせず"},{"ja":"厳しい納期をものともせず、チームは最高の成果を出しました。","ko":"엄격한 납기를 아랑곳하지 않고 팀은 최고의 성과를 냈습니다.","highlight":"厳しい納期をものともせず"}]'::jsonb,
  ARRAY['〜にもかかわらず', '〜を顧みず', '〜も構わず'],
  '「をものともせず」는 역경 극복의 긍정적 표현. 자기 자신에게 사용하면 자화자찬이 되므로 주의. 주로 3인칭에게 사용.',
  'IT현장: 성과 칭찬에 사용. 「多くの技術的課題をものともせず、プロジェクトを完遂しました」「短い開発期間をものともせず、高品質なプロダクトを完成させました」',
  15
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ならでは',
  '~만의/~이 아니면',
  '独自性を表す。そこでしかない特別な価値や特徴を表す。',
  'N1',
  '名詞 + ならでは(の)',
  '명사 + ならでは (예: 日本ならでは = 일본만의) / 수식: 名詞 + ならではの + 名詞 (예: 日本ならではの文化). 독특한 가치를 강조.',
  'emphasis',
  '[{"ja":"これは京都ならではの風景です。","ko":"이것은 교토만의 풍경입니다.","highlight":"京都ならでは"},{"ja":"小さなチームならではのスピード感で開発を進めています。","ko":"작은 팀만의 스피드감으로 개발을 진행하고 있습니다.","highlight":"チームならではの"}]'::jsonb,
  ARRAY['〜だけの', '〜特有の', '〜にしかない'],
  '「ならでは」는 긍정적 평가에 사용. 부정적 특징에는 부적절. 「ならではの」로 명사를 수식하는 형태가 일반적.',
  'IT현장: 강점 어필에 사용. 「スタートアップならではの柔軟な開発体制です」「日本企業ならではの品質管理を実践しています」',
  16
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜あっての',
  '~이 있기에',
  '前提条件を表す。それがあるからこそ成立するという不可欠な条件を表す。',
  'N1',
  '名詞 + あっての + 名詞',
  '명사 + あっての + 명사 (예: 健康あっての人生 = 건강이 있기에 인생). 전제 조건이 없으면 뒤의 것도 성립하지 않음을 나타냄.',
  'condition',
  '[{"ja":"健康あっての仕事です。","ko":"건강이 있기에 일입니다.","highlight":"健康あっての"},{"ja":"お客様あってのビジネスですから、品質は妥協できません。","ko":"고객이 있기에 비즈니스이므로 품질은 타협할 수 없습니다.","highlight":"お客様あっての"}]'::jsonb,
  ARRAY['〜があってこそ', '〜なしには', '〜なくしては'],
  '「あっての」는 불가결한 전제 조건을 나타냄. 감사나 겸손의 뉘앙스가 있다. 「あってこそ」(~이 있어야 비로소)와 비슷한 의미.',
  'IT현장: 감사/원칙 표현에 사용. 「チームメンバーあってのプロジェクトです」「ユーザーあってのサービスですから、UXを最優先にしましょう」',
  17
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜をよそに',
  '~을 무시하고',
  '無視を表す。周囲の状況や期待を無視して行動することを表す。',
  'N1',
  '名詞 + をよそに',
  '명사 + をよそに (예: 心配をよそに = 걱정을 무시하고, 批判をよそに = 비판을 무시하고). 부정적 뉘앙스가 있는 경우가 많다.',
  'contrast',
  '[{"ja":"親の心配をよそに、彼は一人で海外に行った。","ko":"부모님의 걱정을 무시하고 그는 혼자 해외에 갔다.","highlight":"心配をよそに"},{"ja":"周囲の反対をよそに、新しいアーキテクチャへの移行を決定しました。","ko":"주위의 반대를 무시하고 새로운 아키텍처로의 이전을 결정했습니다.","highlight":"反対をよそに"}]'::jsonb,
  ARRAY['〜を無視して', '〜にかまわず', '〜も構わず'],
  '「をよそに」는 주위의 감정이나 상황을 무시하는 뉘앙스. 긍정적/부정적 모두 가능하지만, 비판적 문맥에서 더 자주 사용.',
  'IT현장: 결정 묘사에 사용. 「技術部門の懸念をよそに、経営陣はリリースを強行しました」「反対意見をよそに、新しいツールの導入が決まりました」',
  18
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜ずにはいられない',
  '~하지 않을 수 없다',
  '抑えられない気持ちを表す。自然と湧き上がる感情や衝動を抑えられないことを表す。',
  'N1',
  '動詞ない形(ないを取る) + ずにはいられない / する → せずにはいられない',
  '동사 ない형에서 ない를 제거 + ずにはいられない (예: 笑わずにはいられない = 웃지 않을 수 없다). 「する」는 「せずにはいられない」. 감정적 충동.',
  'emphasis',
  '[{"ja":"その話を聞いて、笑わずにはいられなかった。","ko":"그 이야기를 듣고 웃지 않을 수 없었다.","highlight":"笑わずにはいられなかった"},{"ja":"この美しいコードを見ると、感動せずにはいられません。","ko":"이 아름다운 코드를 보면 감동하지 않을 수 없습니다.","highlight":"感動せずにはいられません"}]'::jsonb,
  ARRAY['〜ないではいられない', '〜ざるを得ない', '〜てたまらない'],
  '「ずにはいられない」는 감정적 충동(웃음, 감동 등), 「ざるを得ない」는 외부 상황에 의한 어쩔 수 없음. 이 차이를 정확히 구분해야 한다.',
  'IT현장: 감정 표현에 사용. 「このバグの原因を知ると、驚かずにはいられません」「チームの努力を見ると、感謝せずにはいられません」',
  19
);

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, related_patterns, common_mistakes, usage_notes, sort_order)
VALUES (
  '〜にほかならない',
  '~에 다름 아니다',
  '断定を表す。まさにそれ以外の何物でもないという強い断定を表す。',
  'N1',
  '名詞 + にほかならない / 普通形 + からにほかならない',
  '명사 + にほかならない (예: 努力の結果にほかならない = 노력의 결과에 다름 아니다) / 〜からにほかならない (이유 강조: ~이기 때문에 다름 아니다).',
  'emphasis',
  '[{"ja":"彼の成功は努力の結果にほかならない。","ko":"그의 성공은 노력의 결과에 다름 아니다.","highlight":"結果にほかならない"},{"ja":"このプロジェクトの成功は、チーム全員の協力のおかげにほかなりません。","ko":"이 프로젝트의 성공은 팀 전원의 협력 덕분에 다름 아닙니다.","highlight":"おかげにほかなりません"}]'::jsonb,
  ARRAY['〜に違いない', '〜こそ', '〜というものだ'],
  '「にほかならない」는 강한 단정/확신. 「に違いない」(틀림없다)보다 더 확신이 강하고 격식적. 격식적 글이나 프레젠테이션에서 사용.',
  'IT현장: 원인 단정에 사용. 「この障害の原因は設定ミスにほかなりません」「品質が高いのは、厳格なレビュープロセスがあるからにほかなりません」',
  20
);
