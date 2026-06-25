-- encoding: UTF-8
-- N2 文法シード batch 3 (25パターン)
-- 対象テーブル: jlpt_grammar
-- 作成日: 2026-06-25
-- テーマ: 接続・条件・逆接・譲歩 (条件/逆接/譲歩系)
-- 除外済み(既存90件): 사전25 + batch1(40) + batch2(25) すべて重複排除済み
-- カテゴリ許容値(15個): permission, obligation, desire, ability, condition,
--   reason, contrast, conjecture, change, degree, time, manner, listing,
--   emphasis, formal

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜としても', '〜이라고 해도, 설령 〜라도 (양보)', 'たとえ〜であっても・〜という条件を仮定しても（譲歩の仮定）', 'N2', '動詞普通形＋としても／名詞＋だとしても／ナ形容詞だ＋としても', 'condition', '[{"ja":"たとえ失敗したとしても、挑戦したことに意味がある。","ko":"설령 실패했다 해도 도전한 것에 의미가 있다.","highlight":"としても"},{"ja":"それが本当だとしても、私には関係ない。","ko":"그것이 사실이라 해도 나와는 상관없다.","highlight":"だとしても"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜としても' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ようものなら', '만약 〜라도 하면 큰일이다 (부정적 결과 경고)', 'もし〜したならば、大変なことになる（強い警告・脅し）', 'N2', '動詞辞書形＋ようものなら', 'condition', '[{"ja":"そんなことを上司に言おうものなら、即クビになるだろう。","ko":"그런 말을 상사에게 했다가는 당장 잘릴 것이다.","highlight":"ようものなら"},{"ja":"もう一度同じミスをしようものなら、今度こそ許さない。","ko":"만약 한 번 더 같은 실수를 했다가는 이번만큼은 용서하지 않겠다.","highlight":"ようものなら"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ようものなら' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜たとしても', '설령 〜라 하더라도 (가정적 양보)', 'たとえ〜であっても（「としても」より仮定の意味を強調）', 'N2', '動詞た形＋としても', 'condition', '[{"ja":"どんなに頑張ったとしても、限界というものがある。","ko":"아무리 노력했다 하더라도 한계라는 것이 있다.","highlight":"たとしても"},{"ja":"仮に全員が反対したとしても、この計画は実行する。","ko":"가령 전원이 반대했다 하더라도 이 계획은 실행한다.","highlight":"たとしても"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜たとしても' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜にしても〜にしても', '〜이든 〜이든 (어느 경우든 마찬가지)', '〜でも〜でも、どちらにせよ（同様の結論を導く）', 'N2', '動詞辞書形／名詞＋にしても＋動詞辞書形／名詞＋にしても', 'condition', '[{"ja":"行くにしても行かないにしても、早めに決めてください。","ko":"가든 안 가든 빨리 결정해 주세요.","highlight":"にしても〜にしても"},{"ja":"賛成するにしても反対するにしても、理由を述べること。","ko":"찬성하든 반대하든 이유를 말할 것.","highlight":"にしても〜にしても"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜にしても〜にしても' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜であれ〜であれ', '〜이든 〜이든 간에 (어느 쪽이든)', '〜でも〜でも、いずれの場合でも（「にせよ〜にせよ」より改まった表現）', 'N2', '名詞＋であれ＋名詞＋であれ／動詞仮定形＋であれ', 'condition', '[{"ja":"男であれ女であれ、平等に扱われるべきだ。","ko":"남성이든 여성이든 평등하게 대우받아야 한다.","highlight":"であれ〜であれ"},{"ja":"成功であれ失敗であれ、その経験から学ぶことが重要だ。","ko":"성공이든 실패든 그 경험에서 배우는 것이 중요하다.","highlight":"であれ〜であれ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜であれ〜であれ' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜さえ〜ば', '〜만 〜하면 (충분조건)', '〜だけで十分・〜という条件さえ満たせばよい（最低限の条件）', 'N2', '名詞＋さえ＋動詞ば形／イ形容詞くさえあれば', 'condition', '[{"ja":"健康さえあれば、他には何もいらない。","ko":"건강만 있으면 다른 것은 아무것도 필요 없다.","highlight":"さえあれば"},{"ja":"やる気さえあれば、年齢は関係ない。","ko":"의욕만 있으면 나이는 상관없다.","highlight":"さえあれば"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜さえ〜ば' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜さえ〜たら', '〜만 〜했더라면 (가정)', '〜という条件だけで十分・もしそうだったなら（過去の仮定）', 'N2', '名詞＋さえ＋動詞たら形', 'condition', '[{"ja":"もう少し時間さえあったら、もっとうまくできたのに。","ko":"조금만 더 시간이 있었더라면 더 잘할 수 있었을 텐데.","highlight":"さえあったら"},{"ja":"君さえそこにいてくれたら、安心できるのに。","ko":"네가 거기만 있어 준다면 안심할 수 있을 텐데.","highlight":"さえいてくれたら"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜さえ〜たら' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜からには', '〜이상은, 〜한 바에는 (책임·결의)', '〜したのだから・〜という事実がある以上（結果への責任・覚悟）', 'N2', '動詞辞書形／た形＋からには', 'obligation', '[{"ja":"この仕事を引き受けたからには、絶対に成功させる。","ko":"이 일을 맡은 이상 반드시 성공시키겠다.","highlight":"からには"},{"ja":"チームに入ったからには、ルールを守らなければならない。","ko":"팀에 들어간 이상 규칙을 지켜야 한다.","highlight":"からには"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜からには' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ながらも', '〜이면서도, 〜하면서도 (역접·양보)', '〜なのに・〜であるにもかかわらず（逆接・譲歩。やや書き言葉的）', 'N2', '動詞ます形＋ながらも／ナ形容詞語幹＋ながらも／イ形容詞辞書形＋ながらも', 'contrast', '[{"ja":"小さいながらも、夢のあるお店だった。","ko":"작으면서도 꿈이 있는 가게였다.","highlight":"ながらも"},{"ja":"失敗を認めながらも、彼は謝ろうとしなかった。","ko":"실패를 인정하면서도 그는 사과하려 하지 않았다.","highlight":"ながらも"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ながらも' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜にしても', '〜라고 해도, 〜이라 하더라도 (양보)', '〜であっても・〜の場合を認めても（譲歩して、それでも〜だ）', 'N2', '動詞普通形＋にしても／名詞＋にしても', 'contrast', '[{"ja":"冗談にしても、それは言いすぎだ。","ko":"농담이라 해도 그건 너무한 말이다.","highlight":"にしても"},{"ja":"忙しいにしても、連絡くらいできるはずだ。","ko":"바쁘다 하더라도 연락 정도는 할 수 있을 것이다.","highlight":"にしても"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜にしても' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜であっても', '〜이라 할지라도, 〜이더라도 (강한 양보)', 'たとえ〜であっても（強調的な譲歩。「でも」より改まった表現）', 'N2', '動詞普通形＋であっても／名詞＋であっても', 'contrast', '[{"ja":"どんな困難があっても、諦めない。","ko":"어떤 어려움이 있더라도 포기하지 않겠다.","highlight":"あっても"},{"ja":"小さな会社であっても、理念がしっかりしていれば信頼される。","ko":"작은 회사이더라도 이념이 확실하면 신뢰받는다.","highlight":"であっても"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜であっても' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ものを', '〜인데, 〜하면 좋을 것을 (아쉬움·원망)', '〜のに・〜すればよかったのに（残念・恨みの気持ち）', 'N2', '動詞た形／辞書形＋ものを', 'contrast', '[{"ja":"早く言えばよかったものを、何故黙っていたのか。","ko":"일찍 말했으면 좋았을 것을 왜 말하지 않고 있었나.","highlight":"ものを"},{"ja":"助けを求めればよかったものを、一人で抱え込んでしまった。","ko":"도움을 요청하면 됐을 것을 혼자 끌어안아 버렸다.","highlight":"ものを"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ものを' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜てでも', '〜하더라도, 무슨 수를 써서라도 (강한 의지)', '〜という手段を使ってでも、何としても（強い意志・決意）', 'N2', '動詞て形＋でも', 'emphasis', '[{"ja":"借金をしてでも、夢を叶えたい。","ko":"빚을 져서라도 꿈을 이루고 싶다.","highlight":"してでも"},{"ja":"徹夜してでも、この仕事を今日中に終わらせる。","ko":"밤새워서라도 이 일을 오늘 안에 끝내겠다.","highlight":"してでも"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜てでも' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜たところで', '〜해봤자, 〜한다 해도 소용없다 (역접·허무감)', '〜しても意味がない・〜しても期待した結果は得られない（逆接の帰結）', 'N2', '動詞た形＋ところで', 'contrast', '[{"ja":"今更謝ったところで、何も変わらない。","ko":"이제 와서 사과해봤자 아무것도 변하지 않는다.","highlight":"たところで"},{"ja":"彼に相談したところで、解決策は出てこないだろう。","ko":"그에게 상담해봤자 해결책은 나오지 않을 것이다.","highlight":"たところで"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜たところで' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ば〜ほど', '〜하면 할수록', '〜すればするほど、その程度が増す（比例的な変化）', 'N2', '動詞ば形＋動詞辞書形＋ほど／イ形容詞ければ＋イ形容詞辞書形＋ほど', 'degree', '[{"ja":"練習すればするほど、上手になる。","ko":"연습하면 할수록 실력이 늘어난다.","highlight":"すればするほど"},{"ja":"考えれば考えるほど、答えがわからなくなった。","ko":"생각하면 할수록 답을 모르겠어졌다.","highlight":"れば〜ほど"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ば〜ほど' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜にしろ〜にしろ', '〜이든 〜이든 (어느 쪽이든 마찬가지)', '〜でも〜でも、いずれにしても（「にせよ〜にせよ」と同義でやや口語的）', 'N2', '動詞普通形／名詞＋にしろ＋動詞普通形／名詞＋にしろ', 'condition', '[{"ja":"賛成するにしろ反対するにしろ、きちんと説明してほしい。","ko":"찬성이든 반대든 제대로 설명해 주기 바란다.","highlight":"にしろ〜にしろ"},{"ja":"行くにしろ行かないにしろ、連絡ぐらいしなさい。","ko":"가든 안 가든 연락은 해야지.","highlight":"にしろ〜にしろ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜にしろ〜にしろ' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜かといえば／かというと', '〜하냐고 하면 (반드시 그런 건 아님)', '〜かと聞かれれば・〜という点に関して言えば（話者の意外な意見・部分否定）', 'N2', '疑問詞＋かといえば／かというと', 'contrast', '[{"ja":"彼が好きかといえば、そういうわけでもない。","ko":"그를 좋아하냐면 꼭 그런 것도 아니다.","highlight":"かといえば"},{"ja":"あの映画が面白かったかというと、そうでもなかった。","ko":"저 영화가 재미있었냐면 그렇지도 않았다.","highlight":"かというと"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜かといえば／かというと' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ばかりでなく', '〜뿐만 아니라 (구어체)', '〜だけでなく・それ以上に（付加・追加の意味。「のみならず」の口語的表現）', 'N2', '動詞普通形＋ばかりでなく／名詞＋ばかりでなく', 'listing', '[{"ja":"彼女は歌が上手なばかりでなく、ダンスも得意だ。","ko":"그녀는 노래를 잘할 뿐만 아니라 댄스도 잘한다.","highlight":"ばかりでなく"},{"ja":"この店は味がいいばかりでなく、値段も手頃だ。","ko":"이 가게는 맛이 좋을 뿐만 아니라 가격도 적당하다.","highlight":"ばかりでなく"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ばかりでなく' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ようと（も）', '설령 〜하더라도 (의지·양보)', '〜しようとしても・たとえ〜しても（「ても」の意志的な表現。강한 양보）', 'N2', '動詞意志形＋と（も）', 'condition', '[{"ja":"どんなに反対されようとも、この道を進む。","ko":"아무리 반대를 당하더라도 이 길을 걷겠다.","highlight":"されようとも"},{"ja":"何があろうと、君の味方だ。","ko":"무슨 일이 있더라도 네 편이야.","highlight":"あろうと"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ようと（も）' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜とすれば／としたら', '〜이라고 한다면, 가정하면', '〜という場合を仮定すると・もし〜なら（仮定の条件を設定する）', 'N2', '動詞普通形＋とすれば／名詞＋だとすれば', 'condition', '[{"ja":"この計画が失敗したとすれば、次の手を考えなければならない。","ko":"이 계획이 실패했다고 한다면 다음 수를 생각해야 한다.","highlight":"とすれば"},{"ja":"予算が半分だったとしたら、どうしますか。","ko":"예산이 절반이었다면 어떻게 하겠습니까.","highlight":"としたら"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜とすれば／としたら' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜とあっては', '〜라면, 〜인 상황에서는 (그 상황이 이유)', '〜という状況・条件では（その特別な状況に対応した行動・判断）', 'N2', '動詞普通形＋とあっては／名詞＋とあっては', 'condition', '[{"ja":"社長直々のお願いとあっては、断れない。","ko":"사장님이 직접 하시는 부탁이라면 거절할 수 없다.","highlight":"とあっては"},{"ja":"子どもの命がかかっているとあっては、親は必死になる。","ko":"아이의 목숨이 걸린 상황이라면 부모는 필사적이 된다.","highlight":"とあっては"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜とあっては' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜もさることながら', '〜은 물론이고 (더 나아가)', '〜はもちろんだが、それ以上に（追加強調。前の事項を認めつつ後ろをより強調）', 'N2', '名詞＋もさることながら', 'listing', '[{"ja":"味もさることながら、この店は雰囲気が特に素晴らしい。","ko":"맛은 물론이고 이 가게는 분위기가 특히 훌륭하다.","highlight":"もさることながら"},{"ja":"技術もさることながら、人柄の良さが評価された。","ko":"기술은 물론이고 인품의 좋음이 평가받았다.","highlight":"もさることながら"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜もさることながら' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜かねない', '〜할지도 모른다, 〜할 우려가 있다 (부정적 가능성)', '〜する可能性がある・〜しないとは言えない（マイナスのことが起こりうる）', 'N2', '動詞ます形＋かねない', 'conjecture', '[{"ja":"このまま放っておけば、大きな問題になりかねない。","ko":"이대로 방치하면 큰 문제가 될 수도 있다.","highlight":"になりかねない"},{"ja":"無理な残業が続けば、健康を損ないかねない。","ko":"무리한 야근이 계속되면 건강을 해칠 수도 있다.","highlight":"かねない"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜かねない' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜かねる', '〜하기 어렵다, 〜하기 곤란하다 (정중한 거절)', '〜することが難しい・できない（丁寧な断り・困難の表明）', 'N2', '動詞ます形＋かねる', 'ability', '[{"ja":"その件につきましては、お答えしかねます。","ko":"그 건에 관해서는 답변 드리기 어렵습니다.","highlight":"しかねます"},{"ja":"一人では判断しかねるので、上司に相談します。","ko":"혼자서는 판단하기 어려우니 상사에게 상담하겠습니다.","highlight":"しかねる"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜かねる' AND jlpt_level = 'N2');

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(), '〜ものがある', '〜한 면이 있다, 〜이라고 할 만한 점이 있다', '〜という特質・感情が確かにある（話者の強い感想・評価）', 'N2', '動詞辞書形＋ものがある／イ形容詞辞書形＋ものがある', 'emphasis', '[{"ja":"彼の演奏には、人を感動させるものがある。","ko":"그의 연주에는 사람을 감동시키는 무언가가 있다.","highlight":"ものがある"},{"ja":"この風景には、見るたびに切なくなるものがある。","ko":"이 풍경에는 볼 때마다 애잔해지는 무언가가 있다.","highlight":"ものがある"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ものがある' AND jlpt_level = 'N2');
