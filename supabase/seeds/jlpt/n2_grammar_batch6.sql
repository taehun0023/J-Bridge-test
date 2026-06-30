-- encoding: UTF-8
-- N2 文法シード batch 6 (25パターン)
-- 対象テーブル: jlpt_grammar
-- 作成日: 2026-06-25
-- テーマ: 原因理由・目的・時間・列挙・付加
-- 除外済み(既存90件): あまり(に), ことから, ばかりか〜も, に加えて, をもとに(して),
--   を契機に(して), を中心に(して), を問わず, に関して(は), 次第で(は),
--   つつ(も), て以来, をきっかけに, にわたって, のみならず, 末に, うちに,
--   最中に, たところ, ものの 等（batch1〜5にて登録済み）
-- カテゴリ許容値(15個): permission, obligation, desire, ability, condition,
--   reason, contrast, conjecture, change, degree, time, manner, listing,
--   emphasis, formal

INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)

-- 1. 〜ばかりに
SELECT gen_random_uuid(), '〜ばかりに', '〜하는 바람에, 단지 〜이기 때문에 (부정적 결과)', '〜という理由だけで、好ましくない結果になった（後悔・嘆きのニュアンス）', 'N2', '動詞た形／イ形容詞辞書形＋ばかりに／ナ形容詞な＋ばかりに', 'reason', '[{"ja":"一言余計なことを言ったばかりに、友達を怒らせてしまった。","ko":"쓸데없는 말을 한 마디 한 바람에 친구를 화나게 했다.","highlight":"ばかりに"},{"ja":"寝坊したばかりに、大事な試験を受けられなかった。","ko":"늦잠을 잔 바람에 중요한 시험을 볼 수 없었다.","highlight":"ばかりに"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ばかりに' AND jlpt_level = 'N2')

UNION ALL

-- 2. 〜べく
SELECT gen_random_uuid(), '〜べく', '〜하기 위해, 〜하려고 (격식·문어)', '〜するために・〜しようとして（改まった目的表現）', 'N2', '動詞辞書形＋べく（する→すべく）', 'formal', '[{"ja":"夢を実現すべく、毎日努力を重ねている。","ko":"꿈을 실현하기 위해 매일 노력을 거듭하고 있다.","highlight":"べく"},{"ja":"問題を解決すべく、専門家チームが派遣された。","ko":"문제를 해결하기 위해 전문가 팀이 파견됐다.","highlight":"すべく"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜べく' AND jlpt_level = 'N2')

UNION ALL

-- 3. 〜が早いか
SELECT gen_random_uuid(), '〜が早いか', '〜하자마자 (즉각적 후속 동작)', '〜するとほぼ同時に次の動作が起きる（非常に素早い動作の連続）', 'N2', '動詞辞書形＋が早いか', 'time', '[{"ja":"チャイムが鳴るが早いか、子供たちが教室を飛び出した。","ko":"종이 울리자마자 아이들이 교실 밖으로 뛰쳐나갔다.","highlight":"が早いか"},{"ja":"彼はドアを開けるが早いか、「助けて！」と叫んだ。","ko":"그는 문을 열자마자 \"도와줘!\"라고 외쳤다.","highlight":"が早いか"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜が早いか' AND jlpt_level = 'N2')

UNION ALL

-- 4. 〜たとたん（に）
SELECT gen_random_uuid(), '〜たとたん（に）', '〜했더니 바로, 〜한 순간 (예상치 못한 즉각 변화)', '〜したまさにその瞬間に、予期しないことが起きた', 'N2', '動詞た形＋とたん（に）', 'time', '[{"ja":"外に出たとたんに、雨が降り出した。","ko":"밖에 나가자마자 비가 내리기 시작했다.","highlight":"とたんに"},{"ja":"彼の名前を聞いたとたん、彼女の顔色が変わった。","ko":"그의 이름을 듣는 순간 그녀의 안색이 바뀌었다.","highlight":"とたん"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜たとたん（に）' AND jlpt_level = 'N2')

UNION ALL

-- 5. 〜やいなや
SELECT gen_random_uuid(), '〜やいなや', '〜하자마자 (극히 짧은 시간 차, 문어)', '〜するとすぐに・〜した瞬間に（文語的・素早い動作の連続）', 'N2', '動詞辞書形＋やいなや', 'time', '[{"ja":"彼は会議室に入るやいなや、怒鳴り始めた。","ko":"그는 회의실에 들어가자마자 소리를 지르기 시작했다.","highlight":"やいなや"},{"ja":"ゴールするやいなや、観客が総立ちになった。","ko":"골을 넣자마자 관중이 모두 일어섰다.","highlight":"やいなや"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜やいなや' AND jlpt_level = 'N2')

UNION ALL

-- 6. 〜かたわら
SELECT gen_random_uuid(), '〜かたわら', '〜하는 한편으로, 〜하면서 동시에 (병행 활동)', '〜しながら同時に別のこともしている（二つの活動を並行して行う）', 'N2', '動詞辞書形＋かたわら／名詞＋のかたわら', 'manner', '[{"ja":"彼は会社員として働くかたわら、小説を書いている。","ko":"그는 회사원으로 일하면서 동시에 소설을 쓰고 있다.","highlight":"かたわら"},{"ja":"育児のかたわら、オンラインでプログラミングを学んでいる。","ko":"육아를 하는 한편으로 온라인으로 프로그래밍을 배우고 있다.","highlight":"のかたわら"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜かたわら' AND jlpt_level = 'N2')

UNION ALL

-- 7. 〜ながら（も）
SELECT gen_random_uuid(), '〜ながら（も）', '〜하면서도, 〜임에도 불구하고 (역접·상태의 공존)', '〜という状態であるが、それと矛盾することが同時に成り立つ（逆接）', 'N2', '動詞ます形＋ながら（も）／イ形容詞辞書形＋ながら（も）／ナ形容詞語幹＋ながら（も）', 'contrast', '[{"ja":"小さいながらも、その会社は世界中に顧客を持っている。","ko":"작으면서도 그 회사는 전 세계에 고객을 두고 있다.","highlight":"ながらも"},{"ja":"失敗と知りながらも、彼は挑戦し続けた。","ko":"실패인 줄 알면서도 그는 계속 도전했다.","highlight":"ながらも"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ながら（も）' AND jlpt_level = 'N2')

UNION ALL

-- 8. 〜てからでないと
SELECT gen_random_uuid(), '〜てからでないと', '〜하고 나서야 비로소, 〜하지 않으면 (순서 조건)', '〜した後でなければ、次のことができない（手順・順序の条件）', 'N2', '動詞て形＋からでないと／動詞て形＋からでなければ', 'condition', '[{"ja":"契約書を確認してからでないと、サインはできません。","ko":"계약서를 확인하고 나서야 서명할 수 있습니다.","highlight":"てからでないと"},{"ja":"上司に報告してからでなければ、勝手に進めることはできない。","ko":"상사에게 보고하고 나서야 독단적으로 진행할 수 없다.","highlight":"てからでなければ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜てからでないと' AND jlpt_level = 'N2')

UNION ALL

-- 9. 〜ために（は）
SELECT gen_random_uuid(), '〜ために（は）', '〜하기 위해(서)는 (목적·목표 달성 조건)', '〜という目的を達成するために必要な条件を述べる（目的用法）', 'N2', '動詞辞書形＋ために（は）／名詞の＋ために（は）', 'reason', '[{"ja":"健康のためには、規則正しい生活が大切だ。","ko":"건강을 위해서는 규칙적인 생활이 중요하다.","highlight":"ためには"},{"ja":"夢をかなえるためには、どんな努力も惜しまない。","ko":"꿈을 이루기 위해서는 어떤 노력도 아끼지 않겠다.","highlight":"ためには"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ために（は）' AND jlpt_level = 'N2')

UNION ALL

-- 10. 〜ことなしに
SELECT gen_random_uuid(), '〜ことなしに', '〜하지 않고서는, 〜하는 일 없이', '〜しないで・〜することをせずに（そうした行為なしに別のことをする）', 'N2', '動詞辞書形＋ことなしに', 'condition', '[{"ja":"努力することなしに、成功を得ることはできない。","ko":"노력하지 않고서는 성공을 얻을 수 없다.","highlight":"ことなしに"},{"ja":"彼は一度も振り返ることなしに、去っていった。","ko":"그는 한 번도 돌아보는 일 없이 떠나갔다.","highlight":"ことなしに"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ことなしに' AND jlpt_level = 'N2')

UNION ALL

-- 11. 〜ことによって
SELECT gen_random_uuid(), '〜ことによって', '〜함으로써 (수단·원인이 결과를 낳음)', '〜するという手段・原因によって、ある結果が生じる', 'N2', '動詞辞書形＋ことによって', 'reason', '[{"ja":"毎日練習することによって、技術が向上する。","ko":"매일 연습함으로써 기술이 향상된다.","highlight":"ことによって"},{"ja":"コミュニケーションを取ることによって、誤解を防ぐことができる。","ko":"의사소통을 함으로써 오해를 방지할 수 있다.","highlight":"ことによって"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ことによって' AND jlpt_level = 'N2')

UNION ALL

-- 12. 〜をめぐって
SELECT gen_random_uuid(), '〜をめぐって', '〜을 둘러싸고, 〜에 관해 (논쟁·논의 대상)', '〜を中心的な話題・争点として（意見や対立が生じる）', 'N2', '名詞＋をめぐって／名詞＋をめぐる＋名詞', 'manner', '[{"ja":"その計画をめぐって、賛否両論の意見が出た。","ko":"그 계획을 둘러싸고 찬반 양론 의견이 나왔다.","highlight":"をめぐって"},{"ja":"領土問題をめぐる議論が続いている。","ko":"영토 문제를 둘러싼 논의가 계속되고 있다.","highlight":"をめぐる"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜をめぐって' AND jlpt_level = 'N2')

UNION ALL

-- 13. 〜はもちろん
SELECT gen_random_uuid(), '〜はもちろん', '〜은 물론이고, 〜은 말할 것도 없고', '〜は当然として、それ以外のものも含む（当然のことに加えて付け加える）', 'N2', '名詞＋はもちろん（のこと）', 'listing', '[{"ja":"彼女は日本語はもちろん、英語も中国語も話せる。","ko":"그녀는 일본어는 물론이고 영어도 중국어도 말할 수 있다.","highlight":"はもちろん"},{"ja":"体力はもちろん、精神力も鍛えなければならない。","ko":"체력은 물론이고 정신력도 단련해야 한다.","highlight":"はもちろん"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜はもちろん' AND jlpt_level = 'N2')

UNION ALL

-- 14. 〜のみか
SELECT gen_random_uuid(), '〜のみか', '〜뿐만 아니라 (격식·문어, 의외성 강조)', '〜だけでなく（改まった書き言葉。「のみならず」より驚きや意外性が強い）', 'N2', '動詞辞書形／名詞＋のみか', 'listing', '[{"ja":"彼は仕事をしないのみか、邪魔ばかりしている。","ko":"그는 일을 안 할 뿐만 아니라 방해만 하고 있다.","highlight":"のみか"},{"ja":"その薬は病気を治すのみか、免疫力まで高めてくれる。","ko":"그 약은 병을 고칠 뿐만 아니라 면역력까지 높여준다.","highlight":"のみか"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜のみか' AND jlpt_level = 'N2')

UNION ALL

-- 15. 〜たうえで
SELECT gen_random_uuid(), '〜たうえで', '〜한 다음에, 〜하고 나서 (충분한 준비·확인 후 행동)', '〜した後で・〜を済ませてから（十分な準備・確認を経てから次の行動をする）', 'N2', '動詞た形＋うえで', 'time', '[{"ja":"内容をよく確認したうえで、サインしてください。","ko":"내용을 충분히 확인한 다음에 서명해 주세요.","highlight":"たうえで"},{"ja":"十分話し合ったうえで、結論を出しましょう。","ko":"충분히 논의한 후에 결론을 내립시다.","highlight":"たうえで"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜たうえで' AND jlpt_level = 'N2')

UNION ALL

-- 16. 〜さえ〜ば
SELECT gen_random_uuid(), '〜さえ〜ば', '〜만 〜하면 (유일한 조건)', '〜という最低限の条件さえ満たせば、それで十分だ（条件の絞り込み）', 'N2', '名詞＋さえ＋動詞ば形／名詞＋さえあれば', 'condition', '[{"ja":"お金さえあれば、どこでも旅行できるのに。","ko":"돈만 있으면 어디든 여행할 수 있는데.","highlight":"さえあれば"},{"ja":"健康でさえあれば、何でもできる。","ko":"건강하기만 하면 무엇이든 할 수 있다.","highlight":"さえあれば"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜さえ〜ば' AND jlpt_level = 'N2')

UNION ALL

-- 17. 〜てこそ
SELECT gen_random_uuid(), '〜てこそ', '〜해야 비로소, 〜함으로써 진정으로', '〜して初めて・〜することで真の価値や結果が生まれる（強調）', 'N2', '動詞て形＋こそ', 'emphasis', '[{"ja":"失敗してこそ、本当の成長がある。","ko":"실패해야 비로소 진정한 성장이 있다.","highlight":"てこそ"},{"ja":"苦労してこそ、成功の喜びがわかる。","ko":"고생해야 비로소 성공의 기쁨을 알 수 있다.","highlight":"してこそ"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜てこそ' AND jlpt_level = 'N2')

UNION ALL

-- 18. 〜てまで
SELECT gen_random_uuid(), '〜てまで', '〜까지 해가면서, 극단적으로 〜해서까지', '〜という手段を使ってまでも（そこまでする必要はないという含意）', 'N2', '動詞て形＋まで', 'degree', '[{"ja":"人に嘘をついてまで、成功したくない。","ko":"남에게 거짓말까지 해가면서 성공하고 싶지 않다.","highlight":"てまで"},{"ja":"体を壊してまで働く必要はない。","ko":"몸을 망가뜨려가면서까지 일할 필요는 없다.","highlight":"てまで"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜てまで' AND jlpt_level = 'N2')

UNION ALL

-- 19. 〜たところで
SELECT gen_random_uuid(), '〜たところで', '〜한들, 〜해봤자 (해도 의미 없음)', '〜しても、その結果は良くない・無駄だという意味（逆接・徒労感）', 'N2', '動詞た形＋ところで', 'contrast', '[{"ja":"今さら後悔したところで、もう遅い。","ko":"이제 와서 후회한들 이미 늦었다.","highlight":"たところで"},{"ja":"一人で抗議したところで、会社の方針は変わらないだろう。","ko":"혼자 항의한들 회사 방침은 바뀌지 않을 것이다.","highlight":"たところで"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜たところで' AND jlpt_level = 'N2')

UNION ALL

-- 20. 〜ものだから
SELECT gen_random_uuid(), '〜ものだから', '〜이기 때문에, 〜인 까닭에 (변명·이유 강조)', '〜だから（言い訳・理由の説明。話者の視点からの弁解的な原因）', 'N2', '動詞辞書形／た形＋ものだから／名詞な＋ものだから', 'reason', '[{"ja":"電車が遅れたものだから、遅刻してしまいました。","ko":"전철이 지연됐기 때문에 지각하고 말았습니다.","highlight":"ものだから"},{"ja":"急に呼ばれたものだから、準備もできていなかった。","ko":"갑자기 불려서 준비도 못 했었다.","highlight":"ものだから"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ものだから' AND jlpt_level = 'N2')

UNION ALL

-- 21. 〜ところを
SELECT gen_random_uuid(), '〜ところを', '〜하는 중에, 〜하고 있는데 (장면 포착·폐를 끼치는 상황)', '〜している場面で（邪魔をする・目撃する・感謝・謝罪などで使う）', 'N2', '動詞ている形／辞書形＋ところを', 'time', '[{"ja":"お忙しいところをお邪魔して、申し訳ございません。","ko":"바쁘신 중에 방해해서 죄송합니다.","highlight":"ところを"},{"ja":"帰ろうとしていたところを、上司に呼び止められた。","ko":"돌아가려던 참에 상사에게 불려 세워졌다.","highlight":"ところを"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ところを' AND jlpt_level = 'N2')

UNION ALL

-- 22. 〜ままに
SELECT gen_random_uuid(), '〜ままに', '〜하는 대로, 〜에 따라서 (지시·느낌에 순응)', '〜の通りに・〜に従って行動する（指示・感情・成り行きに任せる）', 'N2', '動詞辞書形＋ままに／名詞＋のままに', 'manner', '[{"ja":"心の感じるままに、詩を書いた。","ko":"마음이 느끼는 대로 시를 썼다.","highlight":"ままに"},{"ja":"先生に言われるままに、手順を踏んで進めた。","ko":"선생님이 말씀하신 대로 순서를 밟아 진행했다.","highlight":"ままに"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ままに' AND jlpt_level = 'N2')

UNION ALL

-- 23. 〜を通して
SELECT gen_random_uuid(), '〜を通して', '〜을 통해서 (수단·매개·전체 기간)', '〜を媒介・手段にして / 〜の期間中ずっと（「を通じて」とほぼ同義だが若干口語的）', 'N2', '名詞＋を通して', 'manner', '[{"ja":"スポーツを通して、チームワークの大切さを学んだ。","ko":"스포츠를 통해서 팀워크의 소중함을 배웠다.","highlight":"を通して"},{"ja":"1年を通して、この地域は温暖な気候が続く。","ko":"일 년 내내 이 지역은 온난한 기후가 이어진다.","highlight":"を通して"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜を通して' AND jlpt_level = 'N2')

UNION ALL

-- 24. 〜にすれば／にしてみれば
SELECT gen_random_uuid(), '〜にすれば／にしてみれば', '〜로서는, 〜의 입장에서 보면', '〜の立場・視点から考えると（その人の立場に立った評価・気持ち）', 'N2', '名詞＋にすれば／名詞＋にしてみれば', 'manner', '[{"ja":"子供にすれば、長い授業は退屈に感じられるだろう。","ko":"아이 입장에서 보면 긴 수업은 지루하게 느껴질 것이다.","highlight":"にすれば"},{"ja":"本人にしてみれば、一生懸命やったつもりなのかもしれない。","ko":"본인 입장에서는 열심히 했다고 생각하는 것일지도 모른다.","highlight":"にしてみれば"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜にすれば／にしてみれば' AND jlpt_level = 'N2')

UNION ALL

-- 25. 〜ていては
SELECT gen_random_uuid(), '〜ていては', '〜하고 있어서는, 〜한 상태로는 (부정적 결과 예고)', '〜している状態が続くと、望ましくない結果になる（忠告・批判）', 'N2', '動詞ている形＋は', 'condition', '[{"ja":"そんなに毎日残業していては、体を壊してしまうよ。","ko":"그렇게 매일 야근을 하고 있어서는 몸이 망가지고 말 거야.","highlight":"ていては"},{"ja":"準備もしないで試験を受けていては、いつまでも合格できない。","ko":"준비도 안 하고 시험을 보고 있어서는 언제까지도 합격할 수 없다.","highlight":"ていては"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ていては' AND jlpt_level = 'N2');
