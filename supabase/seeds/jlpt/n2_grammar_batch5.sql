-- encoding: UTF-8
-- N2 文法シード batch 5 (25パターン)
-- テーマ: 推量・様態・伝聞・判断
-- 対象テーブル: jlpt_grammar
-- 作成日: 2026-06-25
-- 除外済み(既存90件): batch1(40件) + batch2(25件) + 事前25件 すべて重複排除済み
--   特にテーマ重複で除外: 〜に違いない, 〜に決まっている, 〜わけがない, 〜恐れがある,
--   〜ことから, 〜からすると／からすれば, 〜かのようだ／かのように, 〜ことだから,
--   〜というより, 〜わけだ
-- カテゴリ許容値(15個): permission, obligation, desire, ability, condition,
--   reason, contrast, conjecture, change, degree, time, manner, listing,
--   emphasis, formal

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)

-- 1. 〜らしい (推量)
SELECT gen_random_uuid(), '〜らしい（推量）', '〜인 것 같다, 〜인 듯하다 (객관적 근거에 기반한 추량)', '見聞きした情報・客観的な根拠をもとに推量する（「ようだ」よりやや伝聞・間接的）', 'N2', '動詞普通形／ナ形容詞語幹／イ形容詞普通形／名詞＋らしい', 'conjecture', '[{"ja":"外が騒がしい。事故があったらしい。","ko":"밖이 시끄럽다. 사고가 있었던 것 같다.","highlight":"らしい"},{"ja":"彼女は最近元気がないらしく、誰とも話さない。","ko":"그녀는 요즘 기운이 없는 것 같아서 아무와도 이야기하지 않는다.","highlight":"らしく"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜らしい（推量）' AND jlpt_level = 'N2')

UNION ALL

-- 2. 〜ようだ（様態・推量）
SELECT gen_random_uuid(), '〜ようだ（様態・推量）', '〜인 것 같다, 〜처럼 보인다 (직접적 관찰·경험에 기반한 추량)', '直接見た・感じた状況をもとに推量する（主観的・直接的）', 'N2', '動詞普通形＋ようだ／ナ形容詞な＋ようだ／イ形容詞普通形＋ようだ／名詞の＋ようだ', 'conjecture', '[{"ja":"空が暗くなってきた。雨が降るようだ。","ko":"하늘이 어두워졌다. 비가 올 것 같다.","highlight":"ようだ"},{"ja":"彼の顔色からすると、具合が悪いようだ。","ko":"그의 안색으로 보면 몸이 안 좋은 것 같다.","highlight":"ようだ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ようだ（様態・推量）' AND jlpt_level = 'N2')

UNION ALL

-- 3. 〜そうだ（様態）
SELECT gen_random_uuid(), '〜そうだ（様態）', '〜할 것 같다, 〜인 것처럼 보인다 (외관·직접적 인상)', '見た目・様子から受ける印象を表す（実際にはまだそうなっていない）', 'N2', 'イ形容詞語幹／ナ形容詞語幹／動詞ます形＋そうだ（例外: いい→よさそう, ない→なさそう）', 'manner', '[{"ja":"この料理はとても美味しそうだ。","ko":"이 요리는 정말 맛있을 것 같다.","highlight":"美味しそうだ"},{"ja":"彼は今にも泣き出しそうな顔をしていた。","ko":"그는 당장이라도 울 것 같은 얼굴을 하고 있었다.","highlight":"そうな"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜そうだ（様態）' AND jlpt_level = 'N2')

UNION ALL

-- 4. 〜そうだ（伝聞）
SELECT gen_random_uuid(), '〜そうだ（伝聞）', '〜라고 한다 (전문·타인에게 들은 정보)', '他の人や情報源から聞いたことを伝える（「らしい」より直接的な引用ニュアンス）', 'N2', '動詞普通形／イ形容詞普通形／ナ形容詞語幹＋だ＋そうだ／名詞＋だそうだ', 'manner', '[{"ja":"天気予報によると、明日は大雪だそうだ。","ko":"일기 예보에 따르면 내일은 폭설이라고 한다.","highlight":"だそうだ"},{"ja":"隣の田中さんは来月海外に転勤するそうです。","ko":"이웃 다나카 씨는 다음 달 해외로 발령이 난다고 합니다.","highlight":"そうです"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜そうだ（伝聞）' AND jlpt_level = 'N2')

UNION ALL

-- 5. 〜まい
SELECT gen_random_uuid(), '〜まい', '〜하지 않을 것이다, 절대 〜하지 않겠다 (부정의 추량·강한 의지)', '①〜しないだろう（否定の推量）②〜しないつもりだ（否定の意志・やや書き言葉的）', 'N2', '動詞辞書形＋まい（一段動詞はます形も可。例外: する→すまい／しまい, くる→くるまい）', 'conjecture', '[{"ja":"あの頑固な彼が謝るまい。","ko":"저 고집 센 그가 사과하지 않을 것이다.","highlight":"まい"},{"ja":"二度とあんな失敗はするまいと心に誓った。","ko":"두 번 다시 그런 실수는 하지 않겠다고 마음에 맹세했다.","highlight":"するまい"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜まい' AND jlpt_level = 'N2')

UNION ALL

-- 6. 〜っぽい
SELECT gen_random_uuid(), '〜っぽい', '〜처럼 보인다, 〜스럽다 (경향이나 인상)', '〜の傾向がある・〜のように見える（やや口語的、マイナスイメージを伴うことが多い）', 'N2', '名詞／動詞ます形／イ形容詞語幹＋っぽい', 'manner', '[{"ja":"彼の話し方は子どもっぽくて、周りに馬鹿にされる。","ko":"그의 말투는 애 같아서 주위에서 무시당한다.","highlight":"っぽくて"},{"ja":"この映画は嘘っぽくて、あまり好きじゃない。","ko":"이 영화는 가짜 같아서 별로 좋아하지 않는다.","highlight":"嘘っぽくて"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜っぽい' AND jlpt_level = 'N2')

UNION ALL

-- 7. 〜げ
SELECT gen_random_uuid(), '〜げ', '〜인 듯한, 〜해 보이는 (외관상의 느낌·기색)', '〜のような様子・そういう気配がある（形容詞や名詞に付いて様態を表す）', 'N2', 'イ形容詞語幹／ナ形容詞語幹／名詞（一部）＋げ（な・に・だ）', 'manner', '[{"ja":"彼は何か言いたげな表情で私を見つめた。","ko":"그는 무언가 말하고 싶은 듯한 표정으로 나를 바라봤다.","highlight":"言いたげな"},{"ja":"試験の結果を聞いた彼女は、悲しげに下を向いた。","ko":"시험 결과를 들은 그녀는 슬픈 듯 아래를 내려다봤다.","highlight":"悲しげに"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜げ' AND jlpt_level = 'N2')

UNION ALL

-- 8. 〜だろうに
SELECT gen_random_uuid(), '〜だろうに', '〜일 텐데, 〜했을 텐데 (반사실·아쉬움·비난)', '〜のはずなのに（残念・批判・反実仮想のニュアンスで、現実とのギャップを嘆く）', 'N2', '動詞普通形／イ形容詞普通形／ナ形容詞語幹＋だろうに／名詞＋だろうに', 'conjecture', '[{"ja":"もっと早く言ってくれれば、助けられただろうに。","ko":"좀 더 일찍 말해줬더라면 도울 수 있었을 텐데.","highlight":"だろうに"},{"ja":"休めばよかっただろうに、無理をして悪化させた。","ko":"쉬었으면 좋았을 텐데 무리해서 악화시켰다.","highlight":"だろうに"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜だろうに' AND jlpt_level = 'N2')

UNION ALL

-- 9. 〜とか
SELECT gen_random_uuid(), '〜とか', '〜라고 한다 (불확실한 전문·간접 정보)', '〜と聞いた・〜らしい（不確かな伝聞、やや口語的）', 'N2', '動詞普通形／イ形容詞普通形／ナ形容詞語幹＋だ＋とか／名詞＋だとか', 'manner', '[{"ja":"来週、会社が合併するとか。","ko":"다음 주에 회사가 합병된다고 하더라.","highlight":"とか"},{"ja":"新しいカフェがオープンしたとかで、行列ができている。","ko":"새 카페가 오픈했다나 해서 줄이 길게 서 있다.","highlight":"とかで"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜とか' AND jlpt_level = 'N2')

UNION ALL

-- 10. 〜によると／によれば
SELECT gen_random_uuid(), '〜によると／によれば', '〜에 따르면, 〜에 의하면 (정보원 제시)', '〜を情報源として・〜から聞いたところでは（情報の出所を示す）', 'N2', '名詞＋によると／名詞＋によれば', 'manner', '[{"ja":"天気予報によると、今週末は晴れるらしい。","ko":"일기 예보에 따르면 이번 주말은 맑을 것 같다.","highlight":"によると"},{"ja":"友人によれば、その店は行列ができるほど人気だそうだ。","ko":"친구에 의하면 그 가게는 줄이 생길 정도로 인기라고 한다.","highlight":"によれば"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜によると／によれば' AND jlpt_level = 'N2')

UNION ALL

-- 11. 〜はずだ
SELECT gen_random_uuid(), '〜はずだ', '〜일 것이다, 당연히 〜다 (논리적 근거에 기반한 강한 기대·확신)', '〜するのが当然だ・〜するはずと思っていた（根拠に基づく推量・期待）', 'N2', '動詞辞書形／た形／ない形＋はずだ／名詞の＋はずだ／ナ形容詞な＋はずだ', 'conjecture', '[{"ja":"鍵は机の引き出しに入れたはずだ。どこへ行ったんだろう。","ko":"열쇠는 책상 서랍에 넣었을 텐데. 어디 간 걸까.","highlight":"はずだ"},{"ja":"彼女は英語が得意なはずだ。留学経験があるから。","ko":"그녀는 영어를 잘할 것이다. 유학 경험이 있으니까.","highlight":"はずだ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜はずだ' AND jlpt_level = 'N2')

UNION ALL

-- 12. 〜はずがない
SELECT gen_random_uuid(), '〜はずがない', '〜일 리가 없다 (논리적 근거에 기반한 강한 부정)', '〜するのは論理的にありえない（「わけがない」と近いがやや書き言葉的）', 'N2', '動詞辞書形／た形／ない形＋はずがない／名詞の＋はずがない／ナ形容詞な＋はずがない', 'conjecture', '[{"ja":"彼がそんな非常識なことをするはずがない。","ko":"그가 그런 몰상식한 일을 할 리가 없다.","highlight":"はずがない"},{"ja":"昨日会ったばかりなのに、もう忘れたはずがない。","ko":"어제 막 만났는데 벌써 잊었을 리가 없다.","highlight":"はずがない"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜はずがない' AND jlpt_level = 'N2')

UNION ALL

-- 13. 〜かねない
SELECT gen_random_uuid(), '〜かねない', '〜할 수도 있다, 〜할 가능성이 없지 않다 (부정적 사태의 우려)', '〜する可能性がある（悪い事態が起こりかねない、という懸念を示す）', 'N2', '動詞ます形＋かねない', 'conjecture', '[{"ja":"このまま放置すれば、大きな問題になりかねない。","ko":"이대로 방치하면 큰 문제가 될 수도 있다.","highlight":"かねない"},{"ja":"無理なスケジュールを続ければ、体を壊しかねない。","ko":"무리한 스케줄을 계속하면 몸을 망가뜨릴 수도 있다.","highlight":"かねない"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜かねない' AND jlpt_level = 'N2')

UNION ALL

-- 14. 〜かねる
SELECT gen_random_uuid(), '〜かねる', '〜하기 어렵다, 〜하지 못하다 (사정상 불가능·거절의 완곡어)', '〜することが難しい・〜することはできない（丁寧な断り・困難を表す）', 'N2', '動詞ます形＋かねる', 'ability', '[{"ja":"その件につきましては、私では判断しかねます。","ko":"그 건에 대해서는 제가 판단하기 어렵습니다.","highlight":"しかねます"},{"ja":"ご要望にはお応えしかねる場合もございます。","ko":"요청에 응하기 어려운 경우도 있습니다.","highlight":"しかねる"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜かねる' AND jlpt_level = 'N2')

UNION ALL

-- 15. 〜といわれている
SELECT gen_random_uuid(), '〜といわれている', '〜라고 알려져 있다, 〜라고 한다 (일반적으로 전해지는 사실)', '一般的に〜と言われている・世間に広く知られている（社会的・文化的通念）', 'N2', '動詞普通形／イ形容詞普通形／ナ形容詞語幹＋だ＋といわれている／名詞＋だといわれている', 'manner', '[{"ja":"緑茶は健康に良いといわれている。","ko":"녹차는 건강에 좋다고 알려져 있다.","highlight":"といわれている"},{"ja":"この地域は古くから水が美味しいといわれている。","ko":"이 지역은 예로부터 물이 맛있기로 알려져 있다.","highlight":"といわれている"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜といわれている' AND jlpt_level = 'N2')

UNION ALL

-- 16. 〜とすれば／とすると
SELECT gen_random_uuid(), '〜とすれば／とすると', '〜라고 한다면, 〜라고 가정하면 (가정에 기반한 판단)', '〜という仮定のもとで考えると・〜だと仮定すれば（推論の前提となる仮定）', 'N2', '動詞普通形／イ形容詞普通形／ナ形容詞語幹＋だ＋とすれば・とすると／名詞＋だとすれば・だとすると', 'condition', '[{"ja":"彼が本当に知らなかったとすれば、誰が教えたのだろう。","ko":"그가 정말로 몰랐다면 누가 가르쳐준 것일까.","highlight":"とすれば"},{"ja":"この計画が成功するとすると、資金がどれくらい必要か。","ko":"이 계획이 성공한다고 하면 자금이 얼마나 필요할까.","highlight":"とすると"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜とすれば／とすると' AND jlpt_level = 'N2')

UNION ALL

-- 17. 〜ということだ（伝聞・要約）
SELECT gen_random_uuid(), '〜ということだ（伝聞・要約）', '〜라는 것이다, 즉 〜다 (전문 또는 내용 요약)', '①〜と聞いた（伝聞）②つまり〜だ（話の要点をまとめる）', 'N2', '動詞普通形／イ形容詞普通形／ナ形容詞語幹＋だ＋ということだ／名詞＋だということだ', 'manner', '[{"ja":"報告によると、今年の業績は好調だということだ。","ko":"보고에 따르면 올해 실적은 호조라고 한다.","highlight":"ということだ"},{"ja":"要するに、予算が足りないということだ。","ko":"요컨대 예산이 부족하다는 것이다.","highlight":"ということだ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ということだ（伝聞・要約）' AND jlpt_level = 'N2')

UNION ALL

-- 18. 〜ではないか（確認・推量）
SELECT gen_random_uuid(), '〜ではないか（確認・推量）', '〜이지 않습니까, 〜이 아닌가 (추량·재확인·제안)', '①〜だろう（推量）②〜したらどうか（提案）③〜ではないか（確認の問いかけ）', 'N2', '動詞普通形／イ形容詞普通形／ナ形容詞語幹＋ではないか／名詞＋ではないか', 'conjecture', '[{"ja":"この問題の原因は、コミュニケーション不足ではないか。","ko":"이 문제의 원인은 소통 부족이 아닐까.","highlight":"ではないか"},{"ja":"もう少し休んだほうがいいのではないか。","ko":"좀 더 쉬는 편이 좋지 않을까.","highlight":"ではないか"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ではないか（確認・推量）' AND jlpt_level = 'N2')

UNION ALL

-- 19. 〜て当然だ
SELECT gen_random_uuid(), '〜て当然だ', '〜하는 것이 당연하다, 〜함은 마땅하다', '〜するのは当たり前だ（論理的・社会的に当然とみなされる）', 'N2', '動詞て形＋当然だ／イ形容詞くて＋当然だ／ナ形容詞で＋当然だ', 'emphasis', '[{"ja":"10年も経験があるのだから、この程度の仕事ができて当然だ。","ko":"10년이나 경험이 있으니 이 정도 일을 할 수 있는 것이 당연하다.","highlight":"て当然だ"},{"ja":"これほど努力したのだから、成功して当然だ。","ko":"이토록 노력했으니 성공하는 것이 당연하다.","highlight":"当然だ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜て当然だ' AND jlpt_level = 'N2')

UNION ALL

-- 20. 〜ようもない
SELECT gen_random_uuid(), '〜ようもない', '〜할 방법도 없다, 어떻게 할 도리도 없다 (완전한 불가능)', '〜する方法がまったくない・手の施しようがない（不可能を強調）', 'N2', '動詞ます形＋ようもない', 'ability', '[{"ja":"証拠もなく、反論のしようもなかった。","ko":"증거도 없어서 반론할 방법도 없었다.","highlight":"しようもなかった"},{"ja":"こんなひどい状態では、直しようもない。","ko":"이렇게 심각한 상태로는 고칠 방법도 없다.","highlight":"ようもない"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ようもない' AND jlpt_level = 'N2')

UNION ALL

-- 21. 〜に見える
SELECT gen_random_uuid(), '〜に見える', '〜처럼 보인다, 〜으로 보이다 (외관상의 판단)', '外見・様子から〜のように判断される（視覚的な印象・外見判断）', 'N2', '名詞に＋見える／ナ形容詞に＋見える', 'conjecture', '[{"ja":"彼女は実際より若く見える。","ko":"그녀는 실제보다 젊어 보인다.","highlight":"に見える"},{"ja":"遠くから見ると、小さな島のように見えた。","ko":"멀리서 보면 작은 섬처럼 보였다.","highlight":"に見えた"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に見える' AND jlpt_level = 'N2')

UNION ALL

-- 22. 〜と思われる
SELECT gen_random_uuid(), '〜と思われる', '〜라고 생각된다, 〜인 것으로 판단된다 (객관적·공식적 추량)', '〜と判断される（客観的・公式的な推量表現。書き言葉で多用）', 'N2', '動詞普通形／イ形容詞普通形／ナ形容詞語幹＋だ＋と思われる／名詞＋だと思われる', 'conjecture', '[{"ja":"この結果は、実験条件の違いによるものと思われる。","ko":"이 결과는 실험 조건의 차이에 의한 것으로 판단된다.","highlight":"と思われる"},{"ja":"原因は過労と思われますが、詳細は調査中です。","ko":"원인은 과로로 생각되지만 상세 내용은 조사 중입니다.","highlight":"と思われます"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜と思われる' AND jlpt_level = 'N2')

UNION ALL

-- 23. 〜とみられる
SELECT gen_random_uuid(), '〜とみられる', '〜로 보인다, 〜인 것으로 여겨진다 (보도·공식 장면의 추량)', '〜と判断される（ニュースや報告書など、客観的に述べる場面で使う）', 'N2', '動詞普通形／名詞＋とみられる', 'conjecture', '[{"ja":"この火災は放火とみられており、警察が捜査している。","ko":"이 화재는 방화로 보이며 경찰이 수사하고 있다.","highlight":"とみられており"},{"ja":"被害総額は数千万円にのぼるとみられる。","ko":"피해 총액은 수천만 엔에 달하는 것으로 여겨진다.","highlight":"とみられる"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜とみられる' AND jlpt_level = 'N2')

UNION ALL

-- 24. 〜にほぼ間違いない
SELECT gen_random_uuid(), '〜にほぼ間違いない', '거의 틀림없이 〜이다, 〜임이 거의 확실하다', 'ほぼ確実に〜だと言える（「に違いない」より若干確信度が低い）', 'N2', '動詞普通形／名詞＋にほぼ間違いない', 'conjecture', '[{"ja":"彼がリーダーに選ばれるのはほぼ間違いない。","ko":"그가 리더로 선발되는 것은 거의 틀림없다.","highlight":"ほぼ間違いない"},{"ja":"今年の梅雨は例年より遅くなるにほぼ間違いない。","ko":"올해 장마는 예년보다 늦어지는 것이 거의 확실하다.","highlight":"にほぼ間違いない"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜にほぼ間違いない' AND jlpt_level = 'N2')

UNION ALL

-- 25. 〜ように見える
SELECT gen_random_uuid(), '〜ように見える', '〜처럼 보인다, 〜인 것처럼 보이다 (비유적 외관·인상)', '〜のように感じられる・見た目で〜という印象を受ける（比喩的・全体的な印象）', 'N2', '動詞辞書形／た形＋ように見える／ナ形容詞な＋ように見える／名詞の＋ように見える', 'conjecture', '[{"ja":"彼は平気なように見えるが、内心は傷ついているかもしれない。","ko":"그는 아무렇지도 않은 것처럼 보이지만 내심 상처받았을지도 모른다.","highlight":"ように見える"},{"ja":"あの雲は、動物のように見えませんか。","ko":"저 구름은 동물처럼 보이지 않나요?","highlight":"ように見えません"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ように見える' AND jlpt_level = 'N2');
