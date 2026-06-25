-- encoding: UTF-8
-- N2 文法シード batch 4 (25パターン)
-- テーマ: 程度・強調・限定・範囲
-- 対象テーブル: jlpt_grammar
-- 作成日: 2026-06-25
-- 除外済み(既存90件): n2_grammar_pats.txt の全90パターン + batch1(40件) + batch2(25件)
-- ※ 程度・強調・限定 既出: にすぎない, だらけ, にわたって, どころか,
--    どころではない, にほかならない, ないまでも, てしかたがない, てならない
-- カテゴリ許容値(15個): permission, obligation, desire, ability, condition,
--   reason, contrast, conjecture, change, degree, time, manner, listing,
--   emphasis, formal

-- 1. 〜ほど〜ない
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ほど〜ない', '〜만큼 〜하지 않다 (정도 비교·최상급 표현)', '〜ほど〜ではない・AはBほどではない（比較で程度が及ばないことを表す）', 'N2', '名詞＋ほど＋否定形／動詞辞書形＋ほど＋否定形', 'degree', '[{"ja":"今年の夏は、去年ほど暑くない。","ko":"올해 여름은 작년만큼 덥지 않다.","highlight":"ほど〜ない"},{"ja":"思ったほど難しくなかった。","ko":"생각한 것만큼 어렵지 않았다.","highlight":"ほど〜なかった"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ほど〜ない' AND jlpt_level = 'N2');

-- 2. 〜ほど（程度の比例・強調）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ほど（程度）', '〜할수록, 〜하면 할수록 (비례 강조)', '〜すればするほど、比例して程度が増す（程度の比例・強調）', 'N2', '動詞辞書形＋ほど＋同動詞辞書形', 'degree', '[{"ja":"日本語は勉強すればするほど、面白くなる。","ko":"일어는 공부하면 할수록 재미있어진다.","highlight":"すればするほど"},{"ja":"練習すればするほど、上手になっていく。","ko":"연습하면 할수록 실력이 늘어간다.","highlight":"すればするほど"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ほど（程度）' AND jlpt_level = 'N2');

-- 3. 〜くらい／〜ぐらい（程度）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜くらい／〜ぐらい（程度）', '〜정도, 〜쯤 (정도를 나타냄)', '①おおよその程度 ②最低限の程度（〜でさえも）③程度の強調', 'N2', '動詞辞書形／た形＋くらい／名詞＋くらい', 'degree', '[{"ja":"この問題くらい、小学生でも解けるよ。","ko":"이 정도 문제는 초등학생도 풀 수 있어.","highlight":"くらい"},{"ja":"せめて電話くらいはしてほしかった。","ko":"적어도 전화 정도는 해줬으면 좋았을 텐데.","highlight":"くらい"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜くらい／〜ぐらい（程度）' AND jlpt_level = 'N2');

-- 4. 〜こそ（強調）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜こそ（強調）', '바로 〜이야말로 (강조)', '〜が特に・まさに〜だ（対象を強く取り立てて強調する）', 'N2', '名詞＋こそ／動詞て形＋こそ', 'emphasis', '[{"ja":"今年こそ、絶対に合格してみせる。","ko":"올해야말로 반드시 합격해 보이겠다.","highlight":"こそ"},{"ja":"失敗してこそ、本当の実力がつく。","ko":"실패해야 비로소 진정한 실력이 붙는다.","highlight":"てこそ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜こそ（強調）' AND jlpt_level = 'N2');

-- 5. 〜さえ〜ば
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜さえ〜ば', '〜만 〜하면 (최소 조건)', '〜だけで十分・〜という最低限の条件を満たせば（最小限の条件）', 'N2', '名詞＋さえ＋動詞ば形／動詞ます形＋さえ＋すれば', 'condition', '[{"ja":"お金さえあれば、何でも買えると思っていた。","ko":"돈만 있으면 무엇이든 살 수 있다고 생각했다.","highlight":"さえあれば"},{"ja":"健康でさえあれば、それで十分だ。","ko":"건강하기만 하면 그것으로 충분하다.","highlight":"でさえあれば"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜さえ〜ば' AND jlpt_level = 'N2');

-- 6. 〜さえ（強調）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜さえ（強調）', '〜조차, 심지어 〜도 (예상 밖 강조)', '〜でさえも・〜という極端な例も含めて（予想外のことを強調）', 'N2', '名詞＋さえ／動詞て形＋さえ', 'emphasis', '[{"ja":"子どもさえ知っている簡単な知識だ。","ko":"어린아이조차 아는 간단한 지식이다.","highlight":"さえ"},{"ja":"彼は忙しすぎて、食事さえ満足にとれていない。","ko":"그는 너무 바빠서 식사조차 제대로 못 하고 있다.","highlight":"さえ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜さえ（強調）' AND jlpt_level = 'N2');

-- 7. 〜だけ（限定）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜だけ（限定）', '〜만, 〜뿐 (한정)', '〜のみ・それだけに絞る（範囲・対象を限定する）', 'N2', '動詞辞書形／た形＋だけ／名詞＋だけ', 'degree', '[{"ja":"今日は疲れたので、シャワーだけ浴びて寝た。","ko":"오늘은 피곤해서 샤워만 하고 잤다.","highlight":"だけ"},{"ja":"できる限り、早めに連絡してください。","ko":"가능한 한 빨리 연락해 주세요.","highlight":"限り"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜だけ（限定）' AND jlpt_level = 'N2');

-- 8. 〜だけに（理由強調）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜だけに', '〜인 만큼, 〜이기 때문에 더욱 (이유·당연한 결과 강조)', '〜だから当然・〜という理由があるからこそ、そういう結果になる（理由の強調）', 'N2', '動詞普通形＋だけに／ナ形容詞な＋だけに／名詞＋だけに', 'emphasis', '[{"ja":"プロだけに、その仕事は完璧だった。","ko":"프로인 만큼 그 작업은 완벽했다.","highlight":"だけに"},{"ja":"長年の努力があっただけに、合格したときの喜びは格別だった。","ko":"오랜 노력이 있었던 만큼 합격했을 때의 기쁨은 각별했다.","highlight":"だけに"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜だけに' AND jlpt_level = 'N2');

-- 9. 〜だけでなく
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜だけでなく', '〜뿐만 아니라 (구어체)', '〜のみならず（口語的・日常的な表現）', 'N2', '動詞普通形／名詞＋だけでなく', 'listing', '[{"ja":"彼は英語だけでなく、中国語も話せる。","ko":"그는 영어뿐만 아니라 중국어도 할 수 있다.","highlight":"だけでなく"},{"ja":"この問題は個人だけでなく、社会全体の課題だ。","ko":"이 문제는 개인뿐만 아니라 사회 전체의 과제이다.","highlight":"だけでなく"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜だけでなく' AND jlpt_level = 'N2');

-- 10. 〜に限って
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜に限って', '〜에 한해서, 하필 〜만 (예외적 강조·아이러니)', '①〜だけに限定する ②〜という特定のものに限ってそうなる（皮肉・驚き）', 'N2', '名詞＋に限って', 'emphasis', '[{"ja":"うちの子に限って、そんなことはしないと思う。","ko":"우리 애만큼은 그런 짓은 하지 않는다고 생각한다.","highlight":"に限って"},{"ja":"急いでいるときに限って、バスが来ない。","ko":"서두를 때에 한해서 버스가 오지 않는다.","highlight":"に限って"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に限って' AND jlpt_level = 'N2');

-- 11. 〜に限らず
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜に限らず', '〜에 한하지 않고, 〜뿐만 아니라', '〜だけでなく・〜以外も含めて（範囲を広げる）', 'N2', '名詞＋に限らず', 'listing', '[{"ja":"女性に限らず、男性も育児休暇を取れます。","ko":"여성뿐만 아니라 남성도 육아휴가를 사용할 수 있습니다.","highlight":"に限らず"},{"ja":"日本に限らず、世界中で同じ問題が起きている。","ko":"일본에 한하지 않고 전 세계에서 같은 문제가 일어나고 있다.","highlight":"に限らず"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に限らず' AND jlpt_level = 'N2');

-- 12. 〜のみ
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜のみ', '〜만, 〜뿐 (격식체 한정)', '〜だけ（改まった場面での限定表現）', 'N2', '名詞＋のみ／動詞辞書形＋のみ', 'formal', '[{"ja":"関係者のみ入場できます。","ko":"관계자만 입장하실 수 있습니다.","highlight":"のみ"},{"ja":"前払いのみ受け付けております。","ko":"선불만 받고 있습니다.","highlight":"のみ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜のみ' AND jlpt_level = 'N2');

-- 13. 〜すら
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜すら', '〜조차, 심지어 〜도 (극단적 예시·강조)', '〜でさえも（否定的な文脈で驚きや落胆を強調する）', 'N2', '名詞＋すら／動詞て形＋すら', 'emphasis', '[{"ja":"彼は自分の名前すら書けないほど焦っていた。","ko":"그는 자기 이름조차 못 쓸 정도로 당황했다.","highlight":"すら"},{"ja":"忙しすぎて、休憩すらとれない日が続いた。","ko":"너무 바빠서 쉬는 시간조차 없는 날이 이어졌다.","highlight":"すら"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜すら' AND jlpt_level = 'N2');

-- 14. 〜まで（強調）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜まで（強調）', '〜까지도, 심지어 〜도 (극단적 예시로 강조)', '〜でさえも・〜という予想外のことも含めて（驚きや意外性を強調）', 'N2', '名詞＋まで／動詞辞書形＋まで', 'emphasis', '[{"ja":"親友まで、私のことを疑っていた。","ko":"절친한 친구까지도 나를 의심하고 있었다.","highlight":"まで"},{"ja":"彼のことは、上司まで知っていた。","ko":"그에 대한 일은 상사까지 알고 있었다.","highlight":"まで"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜まで（強調）' AND jlpt_level = 'N2');

-- 15. 〜さ（程度名詞化）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜さ（程度）', '〜의 정도, 〜함 (형용사를 정도 명사로)', '形容詞語幹＋さ で、その程度・性質を名詞として表す', 'N2', 'イ形容詞語幹＋さ／ナ形容詞語幹＋さ', 'degree', '[{"ja":"この山の高さは3776メートルだ。","ko":"이 산의 높이는 3776미터이다.","highlight":"高さ"},{"ja":"彼女の優しさに、いつも助けられている。","ko":"그녀의 다정함에 항상 도움을 받고 있다.","highlight":"優しさ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜さ（程度）' AND jlpt_level = 'N2');

-- 16. 〜ばかり（限定）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ばかり（限定）', '〜만, 〜뿐 (한정·과도한 정도)', '〜だけ・それ以外には何もない（偏りや程度の過剰を表す）', 'N2', '名詞＋ばかり／動詞て形＋ばかり', 'degree', '[{"ja":"彼はゲームばかりして、勉強しない。","ko":"그는 게임만 하고 공부를 하지 않는다.","highlight":"ばかり"},{"ja":"甘いものばかり食べていると、体に悪い。","ko":"단 것만 먹으면 몸에 나쁘다.","highlight":"ばかり"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ばかり（限定）' AND jlpt_level = 'N2');

-- 17. 〜ほかない
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ほかない', '〜할 수밖에 없다, 다른 도리가 없다', '〜するしか選択肢がない（「しかない」とほぼ同義だが、やや文語的）', 'N2', '動詞辞書形＋ほかない／動詞辞書形＋ほかはない', 'obligation', '[{"ja":"状況から見て、計画を変更するほかない。","ko":"상황을 봐서 계획을 변경할 수밖에 없다.","highlight":"ほかない"},{"ja":"もう選択肢がなくなった。あとは頑張るほかない。","ko":"이제 선택지가 없어졌다. 이제는 열심히 할 수밖에 없다.","highlight":"ほかない"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ほかない' AND jlpt_level = 'N2');

-- 18. 〜に至るまで
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜に至るまで', '〜에 이르기까지 (범위의 끝까지)', '〜というところ・段階にまで達する範囲（範囲の上限・下限を示す）', 'N2', '名詞＋に至るまで', 'degree', '[{"ja":"部長から新入社員に至るまで、全員が参加した。","ko":"부장부터 신입 사원에 이르기까지 전원이 참가했다.","highlight":"に至るまで"},{"ja":"細かい部品に至るまで、丁寧にチェックした。","ko":"세세한 부품에 이르기까지 꼼꼼하게 점검했다.","highlight":"に至るまで"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に至るまで' AND jlpt_level = 'N2');

-- 19. 〜というものではない
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜というものではない', '꼭 〜라고는 할 수 없다, 무조건 〜인 것은 아니다', '必ずしも〜とは限らない（一般論を部分的に否定する）', 'N2', '動詞辞書形＋というものではない／名詞＋というものではない', 'contrast', '[{"ja":"成功すれば何でもいいというものではない。","ko":"성공하면 뭐든 좋다는 것은 아니다.","highlight":"というものではない"},{"ja":"高ければ高いほどいいというものでもない。","ko":"비쌀수록 좋다는 것도 아니다.","highlight":"というものでもない"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜というものではない' AND jlpt_level = 'N2');

-- 20. 〜ようがない
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ようがない', '〜할 방법이 없다, 도저히 〜할 수가 없다', '〜する方法・手段がまったくない（不可能を強調）', 'N2', '動詞ます形＋ようがない', 'ability', '[{"ja":"彼の連絡先がわからないので、連絡のしようがない。","ko":"그의 연락처를 모르니 연락할 방법이 없다.","highlight":"ようがない"},{"ja":"複雑すぎて、説明のしようがない。","ko":"너무 복잡해서 설명할 방법이 없다.","highlight":"ようがない"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ようがない' AND jlpt_level = 'N2');

-- 21. 〜ずにはおかない
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ずにはおかない', '반드시 〜하게 만든다, 저절로 〜하게 된다 (강제적 작용)', '必ず〜させる・自然にそういう気持ちや行動を引き起こさずにはいない', 'N2', '動詞ない形（ない→ず）＋にはおかない', 'emphasis', '[{"ja":"あの映画は見る人を感動させずにはおかない。","ko":"저 영화는 보는 사람을 감동시키지 않고는 못 배기게 만든다.","highlight":"ずにはおかない"},{"ja":"彼女の演技は観客を笑わせずにはおかなかった。","ko":"그녀의 연기는 관객을 웃기지 않고는 못 배기게 했다.","highlight":"ずにはおかなかった"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ずにはおかない' AND jlpt_level = 'N2');

-- 22. 〜を限りに
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜を限りに', '〜을 마지막으로, 〜부로 (기한·마지막 시점)', '〜の時点を最後として・〜以降はしない（終わりの時点を示す）', 'N2', '名詞＋を限りに', 'time', '[{"ja":"今日を限りに、タバコをやめます。","ko":"오늘부로 담배를 끊겠습니다.","highlight":"を限りに"},{"ja":"この公演を限りに、彼女は引退した。","ko":"이 공연을 마지막으로 그녀는 은퇴했다.","highlight":"を限りに"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜を限りに' AND jlpt_level = 'N2');

-- 23. 〜ながらも
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ながらも', '〜하면서도, 〜이면서도 (역접)', '〜という状態・事実はあるが、それにもかかわらず（逆接の「つつも」と同義）', 'N2', '動詞ます形＋ながらも／ナ形容詞語幹＋ながらも／名詞＋ながらも', 'contrast', '[{"ja":"小さいながらも、この店は有名なレストランだ。","ko":"작지만 이 가게는 유명한 레스토랑이다.","highlight":"ながらも"},{"ja":"知っていながらも、知らないふりをしていた。","ko":"알고 있으면서도 모르는 척하고 있었다.","highlight":"ながらも"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ながらも' AND jlpt_level = 'N2');

-- 24. 〜以外にない
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜以外にない', '〜밖에 없다, 〜이외에는 없다 (유일한 선택)', '〜しか方法がない・〜だけだ（唯一の手段・存在）', 'N2', '名詞＋以外にない／動詞辞書形こと＋以外にない', 'degree', '[{"ja":"この問題を解決する方法は、話し合い以外にない。","ko":"이 문제를 해결할 방법은 대화 이외에는 없다.","highlight":"以外にない"},{"ja":"頼める人は、彼以外にいない。","ko":"부탁할 수 있는 사람은 그 이외에 없다.","highlight":"以外に"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜以外にない' AND jlpt_level = 'N2');

-- 25. 〜かぎり（最大限）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜かぎり（最大限）', '〜할 수 있는 한, 최대한 〜', '〜できる最大限まで・できるだけ（能力・時間の限界まで）', 'N2', '動詞辞書形＋かぎり／できる＋かぎり', 'degree', '[{"ja":"力のかぎり戦って、最後まで諦めなかった。","ko":"힘이 닿는 한 싸워서 끝까지 포기하지 않았다.","highlight":"かぎり"},{"ja":"できるかぎり早めにご連絡ください。","ko":"가능한 한 빨리 연락해 주세요.","highlight":"できるかぎり"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜かぎり（最大限）' AND jlpt_level = 'N2');
