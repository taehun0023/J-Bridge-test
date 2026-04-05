# JLPT Listening 카테고리 감사 리포트

**감사일**: 2026-04-05
**대상 문제 수**: 180
**DB 조회 기준**: quiz_questions.question_category='listening' OR quiz_id IN (d0000001, d0000002, d0000003, d0000004, d0000005)

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 8건    | 4.4% |
| Medium  | 131건    | 72.8% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 139 / 180 (77.2%)
**A2-exempt (필터링됨)**: 177건

## High 우선순위 이슈

### Q-4c1d690e-366d-4344-b6d0-caa5b9fa3201
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 있음(1건)
- 위반 항목: [L1, CLAIM]
- question_text: "次の会話を聴いて、質問に答えてください。  店員：いらっしゃいませ。 客：りんごを 5つ ください。 店員：すみません、きょうは 3つしか ありません。 客：じゃ、3つ ください。  質問：おきゃくさんは りんごを いくつ かいますか？"
- options:
  1. "5つ" (2자)
  2. [정답] "3つ" (2자)
  3. "2つ" (2자)
  4. "1つ" (2자)
- 자동감지 근거:
  - **L1** (Info): TTS speaker markers: ["店員：", "客："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-73cfcec3-3d7a-4e84-9082-767b9f006e82
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [B5, L1, CLAIM]
- question_text: "次の会話を聴いて、質問に答えてください。  A：フロントエンドのフレームワーク、ReactとVue.jsのどちらにしましょうか。 B：チームの経験を考えると、Reactのほうが慣れている人が多いですね。 A：ただ、今回は比較的小規模なプロジェクトなので、Vue.jsのほうがシンプルに作れるかもしれません。 B：確かに。学習コストも低いですし、Vue.jsでいきましょうか。  質問：最終的にどのフレームワークに決まりましたか？"
- options:
  1. "React" (5자)
  2. [정답] "Vue.js" (6자)
  3. "Angular" (7자)
  4. "未定" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.50x (max=7, min=2)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-7870339f-dae4-4577-9fa8-4b1f771809ab
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N3
- 클레임: 있음(1건)
- 위반 항목: [B5, B5, L1, CLAIM]
- question_text: "次の会話を聞いて、質問に答えてください。  佐藤：キムさん、昼ご飯、一緒にどうですか？ キム：いいですね。どこに行きましょうか？ 佐藤：新しくできたラーメン屋はどうですか？ キム：あ、でも私は昨日もラーメンを食べたので、 　　　今日は違うものがいいです。 佐藤：じゃあ、隣の定食屋にしましょう。日替わり定食がおいしいですよ。 キム：それにしましょう。  二人はどこで昼ご飯を食べますか？"
- options:
  1. "ラーメン屋" (5자)
  2. "社員食堂" (4자)
  3. [정답] "定食屋" (3자)
  4. "コンビニ" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **B5** (Medium): correct is shortest (3 vs avg 4.0)
  - **L1** (Info): TTS speaker markers: ["佐藤：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-e7092105-67e4-4324-b117-19126d57d198
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 있음(1건)
- 위반 항목: [B5, B5, L1, CLAIM]
- question_text: "次の会話を聴いて、質問に答えてください。  リン：友達には使わないほうがいいですか。 先生：そうですね。友達に敬語を使うと、よそよそしくなって距離を感じさせてしまいます。では、実際に練習してみましょう。ペアになってください。  質問：先生が「距離を感じさせてしまう」と言ったのはどういう意味ですか。"
- options:
  1. "物理的な距離が遠くなるという意味" (16자)
  2. [정답] "友達に敬語を使うとよそよそしくなるという意味" (22자)
  3. "友達と会いにくくなるという意味" (15자)
  4. "敬語は難しいという意味" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=22, min=11)
  - **B5** (Medium): correct is longest (22 vs avg 16.0)
  - **L1** (Info): TTS speaker markers: ["リン：", "先生："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-b2b1a537-14e1-436c-a623-77a0d08e20e3
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [B5, B5, L1, CLAIM]
- question_text: "次の会話を聞いて、質問に答えてください。  メンター：キムさん、日本のIT現場で一番大事なのは何だと思いますか？ キム：技術力でしょうか？ メンター：もちろん技術力も大事ですが、それ以上に「報連相」が重要視されます。 キム：報告・連絡・相談ですよね。 メンター：そうです。特に問題が発生したときに、一人で抱え込まずに早めに相談することが大切です。日本では「悪い知らせほど早く」という考え方があります。 キム：韓国でも同じような考え方がありますが、日本ではより頻繁に報告するんですね。  質問：先輩が最も強調していることはどれですか。"
- options:
  1. "技術力を高めること" (9자)
  2. "問題を一人で解決すること" (12자)
  3. [정답] "問題が起きたら早めに相談すること" (16자)
  4. "韓国と日本の違いを理解すること" (15자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.78x (max=16, min=9)
  - **B5** (Medium): correct is longest (16 vs avg 13.0)
  - **L1** (Info): TTS speaker markers: ["メンター：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-0b0e160e-37cf-4771-bbb1-1f8106e03b49
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [B5, B5, L1, CLAIM]
- question_text: "次の会話を聴いて、質問に答えてください。  A：AIコーディングアシスタントの導入を検討しているんだけど、どう思う？ B：コードの補完やバグの検出には役立つと思う。ただ、生成されたコードをそのまま使うのはリスクがあるよ。 A：確かに。レビューは必須だね。 B：うん。あくまでツールとして活用して、最終的な判断は人間がすべきだと思う。  質問：二人目の人の意見として正しいものは？"
- options:
  1. "AIを導入すべきではない" (12자)
  2. [정답] "ツールとして活用し最終判断は人間がすべきだ" (21자)
  3. "AIに全てを任せるべきだ" (12자)
  4. "コードレビューは必要ない" (12자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.75x (max=21, min=12)
  - **B5** (Medium): correct is longest (21 vs avg 14.3)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-30d599cf-211b-425c-b66e-b8362c254322
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 있음(1건)
- 위반 항목: [B5, B5, L1, CLAIM]
- question_text: "次の会話を聴いて、質問に答えてください。  A：新しい仕事はどう？ B：仕事は楽しいんだけど、毎日残業が多くて…。 A：大変だね。何時ごろ帰るの？ B：だいたい9時か10時。もう少し早く帰りたいな。  質問：後輩の悩みは何ですか？"
- options:
  1. "仕事が難しい" (6자)
  2. [정답] "残業が多くて早く帰りたい" (12자)
  3. "給料が低い" (5자)
  4. "同僚との関係がよくない" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.40x (max=12, min=5)
  - **B5** (Medium): correct is longest (12 vs avg 8.5)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-b4cc6603-8425-432f-9aa1-1fed5f2b7eee
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 있음(1건)
- 위반 항목: [L1, CLAIM]
- question_text: "次の会話を聴いて、質問に答えてください。  佐藤：いいですね。一度見にいってもいいですか。 店員：もちろんです。今週の土曜日はいかがですか。  質問：佐藤さんが「一度見にいってもいいですか」と言った意図は何ですか。"
- options:
  1. "物件を買いたいから" (9자)
  2. "すぐ契約したいから" (9자)
  3. [정답] "実際に部屋を見たいから" (11자)
  4. "他の不動産屋に行きたいから" (13자)
- 자동감지 근거:
  - **L1** (Info): TTS speaker markers: ["佐藤：", "店員："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
  - **CLAIM** (High): 1 claim(s) filed
---

## Medium 우선순위 이슈

### Q-e59f1505-c0ac-44b3-b8be-e4d60cba39c7
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：あたまが いたいです。 B：だいじょうぶですか。くすりを のんだほうが いいですよ。 A：くすりが ありません。 B：じゃ、わたしの くすりを あげましょう。  質問：Bさんは なにを してあげますか？"
- options:
  1. "病院に連れて行く" (8자)
  2. [정답] "薬をあげる" (5자)
  3. "水をあげる" (5자)
  4. "休ませる" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=8, min=4)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-52937a1a-2b81-447b-9f6a-50fd6b454380
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：おひるごはん、なにを たべますか。 B：ラーメンが いいです。 A：わたしは カレーに します。 B：あ、わたしも カレーに しましょう。  質問：ふたりは なにを たべますか？"
- options:
  1. "ラーメン" (4자)
  2. [정답] "カレー" (3자)
  3. "別々のもの" (5자)
  4. "うどん" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **B5** (Medium): correct is shortest (3 vs avg 3.8)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-acde055e-5f57-49f8-a86b-1ba921a68317
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：どうしましたか。かおが あかいですよ。 B：ちょっと ねつが あるみたいです。 A：はやく うちに かえった ほうが いいですよ。 B：そうですね。せんせいに いって かえります。  質問：Bさんは これから なにを しますか？"
- options:
  1. "病院に行く" (5자)
  2. [정답] "先生に話して帰る" (8자)
  3. "勉強を続ける" (6자)
  4. "薬を飲む" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=8, min=4)
  - **B5** (Medium): correct is longest (8 vs avg 5.8)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-4004acf3-8b53-4295-aad7-b9f7d24b2829
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：やすみの ひは なにを していますか。 B：えいがを みたり、ほんを よんだりしています。 A：どんな えいがが すきですか。 B：アクションえいがが すきです。  質問：Bさんが すきな えいがは なんですか？"
- options:
  1. "ホラー映画" (5자)
  2. [정답] "アクション映画" (7자)
  3. "ロマンス映画" (6자)
  4. "コメディ映画" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (7 vs avg 6.0)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-ae306205-395e-4fd2-9be0-6b700f93f816
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：きょうだいは いますか。 B：はい、あねが ひとり います。 A：おねえさんは なにを していますか。 B：びょういんで はたらいています。  質問：Bさんの おねえさんの しごとは なんですか？"
- options:
  1. "先生" (2자)
  2. [정답] "病院勤務" (4자)
  3. "会社員" (3자)
  4. "学生" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **B5** (Medium): correct is longest (4 vs avg 2.8)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-94e5aab0-867f-43f7-b264-90279dec2c27
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：なつやすみは なにを しますか。 B：くにに かえります。 A：いいですね。なんにち ぐらい かえりますか。 B：2しゅうかん ぐらいです。  質問：Bさんは なつやすみに なにを しますか？"
- options:
  1. "旅行に行く" (5자)
  2. [정답] "国に帰る" (4자)
  3. "アルバイトする" (7자)
  4. "日本にいる" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.75x (max=7, min=4)
  - **B5** (Medium): correct is shortest (4 vs avg 5.3)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-c1f20347-8cad-4790-950d-0660e4e9466f
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  面接官：アルバイトの経験はありますか。 応募者：はい、韓国でカフェで1年間働いていました。 面接官：日本語はどのくらいできますか。 応募者：日常会話なら大丈夫です。 面接官：勤務時間は週3日、夕方5時から9時までですが、よろしいですか。 応募者：はい、大丈夫です。  質問：このアルバイトの勤務時間は？"
- options:
  1. "午前9時〜午後1時" (9자)
  2. [정답] "午後5時〜9時" (7자)
  3. "午後1時〜5時" (7자)
  4. "午後3時〜7時" (7자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (7 vs avg 7.5)
  - **L1** (Info): TTS speaker markers: ["面接官：", "応募者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-386fcb9d-7d47-42f4-b96d-5d241030e229
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  受付：どうなさいましたか。 患者：3日前から頭が痛くて、熱もあります。 受付：今の体温は何度ですか。 患者：今朝測ったら38度2分でした。 受付：保険証をお持ちですか。 患者：はい、ここにあります。  質問：患者さんの体温は何度ですか？"
- options:
  1. "37.5度" (5자)
  2. [정답] "38.2度" (5자)
  3. "39度" (3자)
  4. "36.8度" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **B5** (Medium): correct is longest (5 vs avg 4.5)
  - **L1** (Info): TTS speaker markers: ["受付：", "患者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-1022a73a-9378-4ee4-bab0-5778cee70fa1
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：来月引っ越すんだ。 B：どこに引っ越すの？ A：会社の近くのマンション。駅から歩いて3分だよ。 B：いいね。家賃は高い？ A：今のアパートより少し高いけど、通勤が楽になるから。  質問：Aさんが引っ越す理由は何ですか？"
- options:
  1. "家賃が安くなるから" (9자)
  2. [정답] "通勤が楽になるから" (9자)
  3. "部屋が広いから" (7자)
  4. "周辺環境がいいから" (9자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (9 vs avg 8.5)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-fea70e58-1b87-4bcb-a6ab-9bb7b99d861d
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  田中：三日前から頭が痛くて、熱もあるんです。 医者：熱を測りましょう。三十八度二分ですね。のどを見せてください。 医者：のどが赤いですね。風邪だと思います。  質問：医者は田中さんの病気を何だと言いましたか。"
- options:
  1. [정답] "風邪" (2자)
  2. "インフル" (4자)
  3. "アレルギー" (5자)
  4. "偏頭痛" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=5, min=2)
  - **B5** (Medium): correct is shortest (2 vs avg 3.5)
  - **L1** (Info): TTS speaker markers: ["田中：", "医者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-75374280-c7aa-4799-98f4-f7feb5778c94
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  店員：全部で三百二十円です。 田中：千円でお願いします。 店員：六百八十円のおつりです。レジ袋はいりますか。 田中：いいえ、大丈夫です。  質問：おつりはいくらですか。"
- options:
  1. "320円" (4자)
  2. "780円" (4자)
  3. [정답] "680円" (4자)
  4. "1000円" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.3)
  - **L1** (Info): TTS speaker markers: ["店員：", "田中："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-eb635ee6-5850-4bb5-bf5f-235f3df0dc19
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  店員：お飲み物はいかがですか。 高橋：水をください。  質問：店員が「お飲み物はいかがですか」と聞いた意図は何ですか。"
- options:
  1. "飲み物がおいしいか確認するため" (15자)
  2. [정답] "飲み物の注文を取るため" (11자)
  3. "飲み物がないことを知らせるため" (15자)
  4. "飲み物を勧めるため" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=15, min=9)
  - **L1** (Info): TTS speaker markers: ["店員：", "高橋："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-327c2849-e432-4b7c-98d5-5c6b96fd9712
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  山田：十時はどうですか。 鈴木：十時はちょっと早いな。十一時はどう？  質問：鈴木さんが「十時はちょっと早いな」と言ったのはなぜですか。"
- options:
  1. "10時には約束があるから" (12자)
  2. "公園が10時に開かないから" (13자)
  3. [정답] "10時は早すぎると感じて時間を変えたかったから" (23자)
  4. "土曜日に行きたくないから" (12자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.92x (max=23, min=12)
  - **B5** (Medium): correct is longest (23 vs avg 15.0)
  - **L1** (Info): TTS speaker markers: ["山田：", "鈴木："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-ae6c6b56-9fd6-416c-b17f-38e693ab4583
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  店員：この物件はいかがですか。駅から歩いて七分で、家賃は五万八千円です。 佐藤：いいですね。部屋の広さはどのくらいですか。 店員：ワンルームで、二十平米です。バス・トイレ別です。  質問：紹介された物件について正しいものはどれですか。"
- options:
  1. "駅から10分、家賃6万円" (12자)
  2. "駅から7分、家賃6万円" (11자)
  3. "駅から5分、家賃5万8千円" (13자)
  4. [정답] "駅から7分、家賃5万8千円" (13자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (13 vs avg 12.3)
  - **L1** (Info): TTS speaker markers: ["店員：", "佐藤："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-279098a0-0f44-473c-ac2f-3081c0537e86
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  高橋：この荷物を韓国に送りたいんですが。 局員：中身は何ですか。 高橋：お菓子と本です。 局員：航空便ですと、三日から五日ぐらいで届きます。料金は二千五百円です。  質問：高橋さんは何を送りますか。"
- options:
  1. "服と本" (3자)
  2. "お菓子と服" (5자)
  3. [정답] "お菓子と本" (5자)
  4. "本とプレゼント" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.33x (max=7, min=3)
  - **L1** (Info): TTS speaker markers: ["高橋：", "局員："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-194e2a41-a846-4ea3-a5f3-33225fbb2a92
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  局員：航空便ですと、三日から五日ぐらいで届きます。料金は二千五百円です。 高橋：じゃあ、航空便でお願いします。 局員：こちらの伝票に送り先の住所とお名前を書いてください。  質問：航空便の料金と届くまでの日数はどれですか。"
- options:
  1. "1,500円、1〜2日" (11자)
  2. [정답] "2,500円、3〜5日" (11자)
  3. "2,500円、7〜10日" (12자)
  4. "3,500円、3〜5日" (11자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (11 vs avg 11.3)
  - **L1** (Info): TTS speaker markers: ["局員：", "高橋："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-0bc90d4e-652a-4f55-9deb-093cbf23d8bc
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  佐藤：先週、大阪から引っ越してきたので、転入届を出したいのですが。 窓口：転入届ですね。前の住所の役所で転出届は出されましたか。 佐藤：はい、転出証明書を持っています。  質問：佐藤さんは何をしに来ましたか。"
- options:
  1. [정답] "転入届を出しに" (7자)
  2. "転出届を出しに" (7자)
  3. "パスポートを作りに" (9자)
  4. "印鑑登録をしに" (7자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (7 vs avg 7.5)
  - **L1** (Info): TTS speaker markers: ["佐藤：", "窓口："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-03e95527-abd2-4a42-a7ed-f215f8118f57
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  高橋：実は、上の階の方の足音がかなり気になっていまして。特に夜の十時過ぎに大きな音がするんです。 管理人：それはお困りでしょうね。いつ頃からですか。 高橋：先月から新しい方が越してきてからです。  質問：高橋さんは何に困っていますか。"
- options:
  1. "隣の部屋の音楽の音" (9자)
  2. "下の階の匂い" (6자)
  3. [정답] "上の階の足音の騒音" (9자)
  4. "駐車場の問題" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (9 vs avg 7.5)
  - **L1** (Info): TTS speaker markers: ["高橋：", "管理人："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-5dc19130-2ca8-4756-8122-c46566b2bd20
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：きょう、テストの けっかが でました。 B：どうでしたか。 A：90てんでした！ B：すごいですね！おめでとうございます。 A：ありがとうございます。とても うれしいです。  質問：Aさんは いま どんな きもちですか？"
- options:
  1. "悲しい" (3자)
  2. [정답] "うれしい" (4자)
  3. "怒っている" (5자)
  4. "心配だ" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-1d7ded1b-6f63-4ef1-a6f7-d1d13a87b2a7
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  先生：「おっしゃる」は相手の動作に使う尊敬語で、「申す」は自分の動作に使う謙譲語です。 キム：なるほど。日常生活ではどのくらい使いますか。 先生：お店の店員さんとか、病院で話すときによく使いますよ。  質問：「おっしゃる」はどのような場面で使いますか。"
- options:
  1. "自分が言うとき" (7자)
  2. "友達に言うとき" (7자)
  3. [정답] "相手が言ったことを表すとき" (13자)
  4. "独り言を言うとき" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.86x (max=13, min=7)
  - **B5** (Medium): correct is longest (13 vs avg 8.8)
  - **L1** (Info): TTS speaker markers: ["先生：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-eaf926d2-35a4-4a9e-88f7-18019da5ce28
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  高橋：直接言ったほうがいいでしょうか。 管理人：最初は管理事務所から全体のお知らせという形が良いかと思います。それでも改善されない場合は、個別に対応いたします。  質問：管理人はまず何をすると言いましたか。"
- options:
  1. "上の階の住民に直接注意する" (13자)
  2. [정답] "掲示板で全体に注意喚起する" (13자)
  3. "警察にすぐ届ける" (8자)
  4. "何も対応しない" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.86x (max=13, min=7)
  - **B5** (Medium): correct is longest (13 vs avg 10.3)
  - **L1** (Info): TTS speaker markers: ["高橋：", "管理人："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-e1057c4c-b93b-4852-97ee-4a300148f139
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  山田：料理教室に興味がありまして。来月開講する講座はありますか。 受付：来月ですと、「はじめての和食」と「家庭でできるイタリアン」の二講座がございます。 山田：「はじめての和食」について詳しく教えていただけますか。  質問：山田さんが詳しく聞きたい講座はどれですか。"
- options:
  1. [정답] "はじめての和食" (7자)
  2. "家庭でできるイタリアン" (11자)
  3. "二講座とも" (5자)
  4. "お菓子教室" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.20x (max=11, min=5)
  - **L1** (Info): TTS speaker markers: ["山田：", "受付："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-81b4da83-ffcf-43a0-869d-02210ea1168d
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  医師：全体的に大きな問題はありませんが、コレステロール値がやや高めです。前回と比べると少し上がっています。 田中：何か生活で気をつけることはありますか。 医師：まず、食生活の見直しが大切です。揚げ物や脂っこい食事を控えて、野菜を多く摂るようにしてください。  質問：田中さんの検査結果でどこに問題がありましたか。"
- options:
  1. "血圧が少し高い" (7자)
  2. "血糖値が高い状態" (8자)
  3. [정답] "コレステロールが高い" (10자)
  4. "特に問題はない" (7자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (10 vs avg 8.0)
  - **L1** (Info): TTS speaker markers: ["医師：", "田中："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-9a191cb2-c3d8-451f-a1aa-e327dc385282
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  会長：本日の議題は、来月の運動会についてです。日程の確認ですが、十月十二日の土曜日で変更はありませんね。 副会長：はい、雨天の場合は翌日の十三日に延期ということで、学校側とも確認済みです。  質問：運動会が雨で中止になったらどうなりますか。"
- options:
  1. "そのまま中止になる" (9자)
  2. "来週に延期される" (8자)
  3. "屋内で開催される" (8자)
  4. [정답] "翌日に延期される" (8자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (8 vs avg 8.3)
  - **L1** (Info): TTS speaker markers: ["会長：", "副会長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-9c259c01-69f9-420a-8719-c433f35ca40c
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  理事長：本日の議題は、大規模修繕工事の実施計画についてです。 副理事長：築二十年を迎えまして、外壁の塗装や防水工事が必要な時期となっております。  質問：臨時総会の議題は何ですか。"
- options:
  1. "管理費の値上げ" (7자)
  2. [정답] "大規模修繕工事の実施計画" (12자)
  3. "駐車場の拡張工事" (8자)
  4. "エレベーターの交換" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.71x (max=12, min=7)
  - **B5** (Medium): correct is longest (12 vs avg 9.0)
  - **L1** (Info): TTS speaker markers: ["理事長：", "副理事長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-22e5c261-823e-4fdb-990d-61f99826558c
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：にちようびは なにを しますか。 B：ごぜんは せんたくを します。ごごは かいものに いきます。 A：よるは？ B：テレビを みます。  質問：Bさんは ごごに なにを しますか？"
- options:
  1. "洗濯" (2자)
  2. [정답] "買い物" (3자)
  3. "テレビを見る" (6자)
  4. "料理" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.00x (max=6, min=2)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-e88d64c0-ab7a-4382-abeb-67cd52269feb
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  受付：毎週水曜日の午前十時から十二時まで、全八回のコースです。定員は十五名で、受講料は材料費込みで一万二千円になります。 山田：持ち物は何か必要ですか。 受付：エプロンと三角巾をご持参ください。調理器具と食材はこちらでご用意いたします。  質問：受講者が持参するものは何ですか。"
- options:
  1. "調理器具と食材" (7자)
  2. [정답] "エプロンと三角巾" (8자)
  3. "教科書とノート" (7자)
  4. "包丁とまな板" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (8 vs avg 7.0)
  - **L1** (Info): TTS speaker markers: ["受付：", "山田："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-9dc0be4e-056d-4685-baca-e32f67093c7e
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  理事長：見積もりを三社から取りまして、平均すると約三千万円になります。修繕積立金の残高は現在二千五百万円ですので、不足分は一時金として各戸にご負担いただく必要がございます。 副理事長：全三十戸ですので、一戸あたり約十七万円のご負担となります。  質問：修繕工事の不足分は一戸あたりいくらですか。"
- options:
  1. "約10万円" (5자)
  2. [정답] "約17万円" (5자)
  3. "約25万円" (5자)
  4. "約100万円" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (5 vs avg 5.3)
  - **L1** (Info): TTS speaker markers: ["理事長：", "副理事長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-6e55d184-83fe-4bc9-9344-5b1c93858ade
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  佐藤：昨年はアレルギー対応が不十分だという声がありました。今年は各出店にアレルギー表示を義務付けてはどうでしょうか。 副会長：賛成です。食品表示のテンプレートを作って配布するのがいいと思います。  質問：佐藤さんが提案したことは何ですか。"
- options:
  1. "食品の販売を中止しよう" (11자)
  2. "販売する食品の数を減らそう" (13자)
  3. [정답] "各出店にアレルギー表示を義務付けよう" (18자)
  4. "アレルギーのある子は参加を控えよう" (17자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5** (Medium): correct is longest (18 vs avg 14.8)
  - **L1** (Info): TTS speaker markers: ["佐藤：", "副会長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-a5ed3eba-573e-4f6c-98ad-4d30cb7bb4a2
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：すみません、ゆうびんきょくは どこですか。 B：まっすぐ いって、つぎの かどを みぎに まがってください。ひだりがわに あります。 A：ありがとうございます。  質問：ゆうびんきょくは どちらに まがりますか？"
- options:
  1. "左" (1자)
  2. [정답] "右" (1자)
  3. "まっすぐ" (4자)
  4. "後ろ" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 4.00x (max=4, min=1)
  - **B5** (Medium): correct is shortest (1 vs avg 2.0)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-b4f33708-975d-4a2c-9854-59bac6ae91ab
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：きょうは さむいですね。 B：そうですね。コートを きたほうが いいですよ。 A：はい。ぼうしも かぶります。 B：いいですね。  質問：Aさんは なにを きますか？"
- options:
  1. "コートだけ" (5자)
  2. "帽子だけ" (4자)
  3. [정답] "コートと帽子" (6자)
  4. "マフラーだけ" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (6 vs avg 5.3)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-cf9b1b32-00ad-4f30-952d-18dc0bf70295
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：どようび、パーティーに きませんか。 B：すみません、どようびは ちょっと…。 A：そうですか。ざんねんですね。 B：ほんとうに すみません。  質問：Bさんは パーティーに いきますか？"
- options:
  1. "行く" (2자)
  2. [정답] "行かない" (4자)
  3. "遅れて行く" (5자)
  4. "まだわからない" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.50x (max=7, min=2)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-985bad13-7144-44ea-ae81-3b0a689bdded
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  せんせい：あしたは テストが あります。きょうかしょの 1ページから 20ページまでです。 がくせい：せんせい、ノートも ひつようですか。 せんせい：いいえ、えんぴつと けしゴムだけ もってきてください。  質問：テストに なにを もっていきますか？"
- options:
  1. "教科書とノート" (7자)
  2. [정답] "鉛筆と消しゴム" (7자)
  3. "ノートと鉛筆" (6자)
  4. "何も必要ない" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (7 vs avg 6.5)
  - **L1** (Info): TTS speaker markers: ["せんせい：", "がくせい："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-b2203b05-8dee-4575-af12-3808c7782567
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：田中さんの誕生日プレゼント、何がいいかな。 B：田中さん、コーヒーが好きだから、マグカップはどう？ A：マグカップは去年あげたよ。 B：じゃ、コーヒー豆のセットは？ A：それ、いいね！  質問：二人は何をプレゼントすることにしましたか？"
- options:
  1. "マグカップ" (5자)
  2. [정답] "コーヒー豆セット" (8자)
  3. "ケーキ詰め合わせ" (8자)
  4. "専門書のセット" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.60x (max=8, min=5)
  - **B5** (Medium): correct is longest (8 vs avg 7.0)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-e7a31334-84cc-4610-8253-5c389a4e34e0
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：最近、日本語の勉強が大変で…。漢字が全然覚えられないんです。 B：毎日少しずつ書くのがいいですよ。 A：どのくらい勉強すればいいですか。 B：1日10個ぐらいから始めてみたら？ A：なるほど。やってみます。  質問：Bさんのアドバイスは何ですか？"
- options:
  1. "漢字の勉強をあきらめる" (11자)
  2. [정답] "毎日10個ずつ書いて覚える" (13자)
  3. "塾に週2回通う" (7자)
  4. "アプリで毎日勉強する" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.86x (max=13, min=7)
  - **B5** (Medium): correct is longest (13 vs avg 10.3)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-528cda72-f8e2-49dc-8f8c-bf50969b2977
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  客：この靴、サイズはありますか。26センチがほしいんですが。 店員：すみません、26は売り切れです。25.5か26.5ならあります。 客：じゃ、26.5を試してみます。 店員：はい、こちらをどうぞ。  質問：お客さんは何センチの靴を試しますか？"
- options:
  1. "25.5cm" (6자)
  2. "26cm" (4자)
  3. [정답] "26.5cm" (6자)
  4. "27cm" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (6 vs avg 5.0)
  - **L1** (Info): TTS speaker markers: ["客：", "店員："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-279b9a14-3062-4e7e-91cb-6503deef0e37
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：先週貸してもらった本、とてもおもしろかったです。ありがとうございました。 B：よかった。気に入ってもらえてうれしいよ。 A：でも、すみません、少し汚してしまいました。 B：大丈夫、気にしないで。  質問：Aさんが謝っている理由は何ですか？"
- options:
  1. "本をなくしたから" (8자)
  2. [정답] "本を少し汚してしまったから" (13자)
  3. "本を返していないから" (10자)
  4. "本がつまらなかったから" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.63x (max=13, min=8)
  - **B5** (Medium): correct is longest (13 vs avg 10.5)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-2dee4e68-f9b9-4d6a-9b2e-ba60e99e7be7
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：桜がきれいですね。 B：本当ですね。今週末、花見をしませんか。 A：いいですね。どこでしましょうか。 B：上野公園はどうですか。有名ですよ。 A：いいですね。お弁当を作っていきましょう。  質問：二人はどこで花見をしますか？"
- options:
  1. "新宿公園" (4자)
  2. [정답] "上野公園" (4자)
  3. "代々木公園" (5자)
  4. "日比谷公園" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.5)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-1966d10d-7b16-40e7-8459-712505c826fb
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：日本に来て半年たったね。どう？ B：最初は大変だったけど、今は慣れたよ。 A：日本語も上手になったね。 B：ありがとう。でも敬語がまだ難しい。会社で使うとき、いつも緊張するんだ。  質問：Bさんが今も難しいと感じていることは何ですか？"
- options:
  1. "日常会話" (4자)
  2. [정답] "敬語の使い方" (6자)
  3. "漢字の読み" (5자)
  4. "発音の練習" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (6 vs avg 5.0)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-0e0b13ef-0b13-469a-a799-3451b65a7611
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  担当者：このマンションは駅から徒歩5分で、築3年の物件です。 客：家賃はいくらですか。 担当者：月8万5千円です。管理費が5千円かかります。 客：合計で月9万円ということですね。 担当者：はい、そうです。  質問：月々の支払い合計はいくらですか？"
- options:
  1. "8万5千円" (5자)
  2. [정답] "9万円" (3자)
  3. "9万5千円" (5자)
  4. "10万円" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **B5** (Medium): correct is shortest (3 vs avg 4.3)
  - **L1** (Info): TTS speaker markers: ["担当者：", "客："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-33753a32-980b-4a70-908d-ecdeb62d4d32
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  部長：このプレゼン資料、よくできてるけど、グラフがちょっと見にくいかな。 社員：そうですか。色を変えたほうがいいですか。 部長：うん、もう少しコントラストをつけてくれると助かる。あと、フォントも大きくしたほうがいいかもしれないね。  質問：部長が直してほしいことは何ですか？"
- options:
  1. "プレゼンテーションの内容" (12자)
  2. [정답] "色のコントラストと文字の大きさ" (15자)
  3. "データの正確性と根拠" (10자)
  4. "全体のページ数" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.14x (max=15, min=7)
  - **B5** (Medium): correct is longest (15 vs avg 11.0)
  - **L1** (Info): TTS speaker markers: ["部長：", "社員："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-501122a1-bc51-4408-bae5-8d4ba08f3d66
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：すみません、社内システムにログインできないんですが。 B：今、サーバーの障害が発生していまして、復旧作業中です。 A：いつ頃直りますか。 B：あと1時間ぐらいで復旧する予定です。復旧したらメールでお知らせします。  質問：システムはどのくらいで復旧しますか？"
- options:
  1. "30分" (3자)
  2. [정답] "1時間" (3자)
  3. "3時間" (3자)
  4. "わからない" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **B5** (Medium): correct is shortest (3 vs avg 3.5)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-e701df74-3d7a-43ae-9e13-d5ca1f30bd10
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  後輩：先輩、プログラミングを独学で勉強しているんですが、なかなか上達しなくて。 先輩：教科書だけじゃなくて、実際にプロジェクトを作ってみるといいよ。自分でアプリを一つ作ると、理解が深まるから。 後輩：どんなアプリがいいですか。 先輩：まずはToDoアプリみたいな簡単なものから始めたらいいと思う。  質問：先輩のアドバイスは何ですか？"
- options:
  1. "教科書をもっと読む" (9자)
  2. [정답] "実際にアプリを作ってみる" (12자)
  3. "プログラミング塾に通う" (11자)
  4. "資格試験を受ける" (8자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (12 vs avg 10.0)
  - **L1** (Info): TTS speaker markers: ["後輩：", "先輩："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-3555e206-1f76-4f04-9f1e-2f17d5a3b030
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：実は転職を考えていて。今の会社は安定しているけど、新しいことに挑戦したいんだ。 B：気持ちはわかるけど、今のスキルをもう少し磨いてからのほうがいいんじゃない？ A：そうかな。確かに、まだ2年目だし。 B：3年ぐらい経験を積んでから転職したほうが、条件もよくなると思うよ。  質問：Bさんが勧めていることは何ですか？"
- options:
  1. "今すぐ転職する" (7자)
  2. [정답] "経験を積んでから転職する" (12자)
  3. "転職をあきらめる" (8자)
  4. "副業を始める" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=12, min=6)
  - **B5** (Medium): correct is longest (12 vs avg 8.3)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-f937b9d6-8d57-482e-8272-3737a77273d2
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：日本の会議って、発言する人が少ないよね。 B：確かに。韓国だとみんな積極的に意見を言うけど。 A：日本では会議の前に根回しして、会議では確認するだけという文化があるみたいだよ。 B：なるほど。だから会議自体はスムーズなんだね。  質問：日本の会議の特徴は何ですか？"
- options:
  1. "全員が積極的に発言する" (11자)
  2. [정답] "事前に根回しをして進める" (12자)
  3. "会議がとても長い" (8자)
  4. "上司だけが発言する" (9자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (12 vs avg 10.0)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-76d20543-b15c-491b-a637-10421102dfc0
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：社員旅行の行き先、アンケートの結果が出ました。 B：どこが一番人気でしたか。 A：1位が北海道で35票、2位が沖縄で28票、3位が京都で17票でした。 B：じゃ、北海道に決まりですね。  質問：社員旅行の行き先はどこに決まりましたか？"
- options:
  1. "沖縄" (2자)
  2. [정답] "北海道" (3자)
  3. "京都" (2자)
  4. "まだ未定" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-d0abc1a1-57a0-4730-a960-369d644febbb
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  先輩：コードレビューしたけど、全体的によく書けてるよ。一つだけ気になったのは、変数名がちょっとわかりにくいところがあるかな。 後輩：どの部分ですか。 先輩：「tmp」とか「data」みたいな名前じゃなくて、具体的な名前にしたほうが読みやすいよ。 後輩：なるほど、気をつけます。  質問：先輩が指摘したことは何ですか？"
- options:
  1. "コードにバグがある" (9자)
  2. [정답] "変数名を具体的にすべきだ" (12자)
  3. "コメントが不足している" (11자)
  4. "インデントが間違っている" (12자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (12 vs avg 11.0)
  - **L1** (Info): TTS speaker markers: ["先輩：", "後輩："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-c63badee-6d33-4cc4-9bd2-dfdac6a00a04
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：最近AIの発展がすごいよね。プログラマーの仕事もなくなるって言う人がいるけど。 B：全部なくなることはないと思うよ。AIを使いこなせるエンジニアは、逆に需要が増えるんじゃないかな。 A：確かに。AIと協力して開発する能力が大事になりそうだね。  質問：Bさんが考える将来有望なスキルは何ですか？"
- options:
  1. "手作業コーディング能力" (11자)
  2. [정답] "AIを扱い活用する能力" (11자)
  3. "AIを避ける能力" (8자)
  4. "管理職の能力" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.83x (max=11, min=6)
  - **B5** (Medium): correct is longest (11 vs avg 9.0)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-fc5fe8c9-6c8f-4415-960b-c8df76eda588
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  PM：今回のプロジェクトでは、マイクロサービスアーキテクチャを採用したいと考えています。 開発者：モノリシックと比べて、デプロイが独立してできるのは魅力ですね。ただ、サービス間通信の複雑さが懸念です。 PM：その点はAPIゲートウェイで管理する予定です。  質問：マイクロサービスの懸念点として挙げられたのは何ですか？"
- options:
  1. "コストが高い" (6자)
  2. [정답] "サービス間通信の複雑さ" (11자)
  3. "開発速度が遅い" (7자)
  4. "人員が不足している" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.83x (max=11, min=6)
  - **B5** (Medium): correct is longest (11 vs avg 8.3)
  - **L1** (Info): TTS speaker markers: ["PM：", "開発者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-a6bcda76-f40c-4fd6-80c5-02408b9f8cd2
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  人事：当社の評価制度についてご説明します。評価は半期ごとに行われ、上司評価、同僚評価、自己評価の三つの視点から総合的に判断されます。 社員：360度評価ということですね。 人事：はい。結果はフィードバック面談で本人にお伝えします。  質問：評価はどのくらいの頻度で行われますか？"
- options:
  1. "毎月" (2자)
  2. [정답] "半期ごと" (4자)
  3. "年1回" (3자)
  4. "四半期ごと" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=5, min=2)
  - **L1** (Info): TTS speaker markers: ["人事："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-2926138e-9e0e-45f0-a946-5e8f0f3aeee2
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  部長：うちの部署、残業が多すぎるという声がある。何か対策を考えてほしい。 課長：まず、毎週水曜日をノー残業デーにするのはどうでしょうか。 部長：いいね。ただ、それだけだと他の日に残業が集中する可能性がある。 課長：では、業務の棚卸しをして、不要な会議を減らすことも並行して進めましょう。  質問：課長が提案した対策は何ですか？"
- options:
  1. "人員を増やす" (6자)
  2. [정답] "ノー残業デーと会議削減" (11자)
  3. "給与を上げる" (6자)
  4. "リモートワークを始める" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.83x (max=11, min=6)
  - **B5** (Medium): correct is longest (11 vs avg 8.5)
  - **L1** (Info): TTS speaker markers: ["部長：", "課長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-f5cc93bf-6b9b-4114-8088-a2f2bb6e4b0e
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  上司：今後のキャリアプランについて聞かせてください。 部下：技術を深めたい気持ちもありますが、チームをまとめる役割にも興味があります。 上司：両方のスキルを持つテックリードという選択肢もあるよ。技術力を維持しながらチームを率いるポジションだ。 部下：それは理想的ですね。ぜひ目指したいです。  質問：部下が目指すことにしたポジションは何ですか？"
- options:
  1. "プロジェクトマネージャー" (12자)
  2. [정답] "テックリード" (6자)
  3. "シニア開発者" (6자)
  4. "CTO" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 4.00x (max=12, min=3)
  - **L1** (Info): TTS speaker markers: ["上司：", "部下："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-aaa7d3f4-13a1-4bc4-83d1-bfdec04ff149
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, B6, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  QA：今回のリリースで重大なバグが3件見つかりました。テストカバレッジが不十分だったのが原因です。 PM：テスト工程にもっと時間を確保すべきだったね。 QA：今後はCI/CDパイプラインに自動テストを組み込んで、品質を担保したいと思います。 PM：ぜひ進めてください。  質問：QAが提案した改善策は何ですか？"
- options:
  1. "QA人員を増やす" (8자)
  2. [정답] "CI/CDに自動テスト導入" (13자)
  3. "手動テストを強化する" (10자)
  4. "リリース周期を遅らせる" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.63x (max=13, min=8)
  - **B5** (Medium): correct is longest (13 vs avg 10.5)
  - **B6** (Medium): slash in option: "CI/CDに自動テスト導入"
  - **L1** (Info): TTS speaker markers: ["QA：", "PM："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-6dccf824-89ad-443c-80cc-63dec66c3324
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  面接官：前職ではどのような業務を担当されていましたか。 応募者：バックエンドの開発を中心に、データベース設計やAPIの実装を行っていました。チームは5人で、私がサブリーダーを務めていました。 面接官：使用していた技術スタックを教えてください。 応募者：Java、Spring Boot、PostgreSQL、Dockerです。  質問：応募者の前職での役割は何でしたか？"
- options:
  1. "リーダー" (4자)
  2. [정답] "サブリーダー" (6자)
  3. "一般メンバー" (6자)
  4. "プロジェクトマネージャー" (12자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.00x (max=12, min=4)
  - **L1** (Info): TTS speaker markers: ["面接官：", "応募者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-1d9f07e9-44dc-449f-aae5-b26638db07bc
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  部長：新しい開発ツールの導入について提案書を見ました。年間ライセンス費が120万円ですか。 課長：はい。ただ、導入することで月平均30時間の工数削減が見込めます。 部長：費用対効果は十分ありそうだね。来期の予算に組み込もう。  質問：ツール導入の年間コストはいくらですか？"
- options:
  1. "60万円" (4자)
  2. [정답] "120万円" (5자)
  3. "240万円" (5자)
  4. "300万円" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.8)
  - **L1** (Info): TTS speaker markers: ["部長：", "課長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-dcb04cb9-c284-4709-9a9e-7ea669863f46
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  営業：クライアントから追加機能の要望が来ています。 PM：スコープ外の要件ですね。対応するとスケジュールに影響が出ます。 営業：クライアントとしては、重要な機能らしいんですが。 PM：では、次のフェーズで対応する形で提案しましょう。今のリリースには間に合いません。  質問：PMの対応方針は何ですか？"
- options:
  1. "今すぐ追加する" (7자)
  2. [정답] "次フェーズで対応する" (10자)
  3. "きっぱり断る" (6자)
  4. "他のチームに任せる" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=10, min=6)
  - **B5** (Medium): correct is longest (10 vs avg 8.0)
  - **L1** (Info): TTS speaker markers: ["営業：", "PM："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-b7eb4051-cf26-4804-be0a-0c52e45ddf43
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  オペレーター：本番環境で障害が発生しました。アプリケーションサーバーのCPU使用率が95%を超えています。 エンジニア：原因を調査します。ログを見ると、特定のAPIに大量のリクエストが集中しているようです。 オペレーター：暫定対応として、サーバーの台数を増やしますか。 エンジニア：はい、スケールアウトで対応しつつ、根本原因を調査しましょう。  質問：暫定対応として何をしますか？"
- options:
  1. "サーバーを再起動する" (10자)
  2. [정답] "サーバー台数を増やす" (10자)
  3. "APIをブロックする" (10자)
  4. "ユーザーに案内する" (9자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (10 vs avg 9.8)
  - **L1** (Info): TTS speaker markers: ["オペレーター：", "エンジニア："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-e6818eb9-a396-41bb-be34-3cd3d2c511f1
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  上司：最近の調子はどう？何か困っていることはない？ 部下：正直、今のタスク量が少し多いと感じています。 上司：そうか。じゃ、一部を他のメンバーに分担してもらおう。あと、優先度の低いタスクは後回しにしていいよ。 部下：ありがとうございます。助かります。  質問：上司が提案した解決策は何ですか？"
- options:
  1. "残業を許可する" (7자)
  2. [정답] "業務分担と優先度の整理" (11자)
  3. "納期を延長する" (7자)
  4. "プロジェクトから外れる" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.57x (max=11, min=7)
  - **B5** (Medium): correct is longest (11 vs avg 9.0)
  - **L1** (Info): TTS speaker markers: ["上司：", "部下："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-65943ffc-9a55-4ee7-8b78-c7b228d19bce
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  営業：SLA（サービスレベルアグリーメント）についてご説明します。可用性99.9%を保証し、月間ダウンタイムは最大43分以内とします。 クライアント：障害発生時の対応時間はどのくらいですか。 営業：重大障害の場合、30分以内に初動対応を開始します。  質問：保証される可用性は何パーセントですか？"
- options:
  1. "99%" (3자)
  2. [정답] "99.9%" (5자)
  3. "99.99%" (6자)
  4. "100%" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=6, min=3)
  - **L1** (Info): TTS speaker markers: ["営業：", "クライアント："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-94d96fe6-7c7f-4177-9517-60fcd7f9c8ed
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  社員：お時間いただきありがとうございます。実は、来月末で退職させていただきたいと考えています。 上司：急だね。理由を聞いてもいいかな。 社員：以前からWeb系の開発に興味があり、そちらの分野に挑戦したいと思いまして。 上司：引き留めはしないけど、残りの期間でしっかり引き継ぎをお願いするよ。  質問：社員が退職する理由は何ですか？"
- options:
  1. "給与が低いから" (7자)
  2. [정답] "Web系に挑戦したいから" (12자)
  3. "人間関係がよくないから" (11자)
  4. "健康上の理由" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=12, min=6)
  - **B5** (Medium): correct is longest (12 vs avg 9.0)
  - **L1** (Info): TTS speaker markers: ["社員：", "上司："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-4108254b-50cd-406b-8382-35af6878f02b
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  取締役：海外展開について、東南アジア市場への参入を提案します。特にベトナムとインドネシアは、IT人材の供給が豊富で、かつ成長市場です。 社長：リスクは何が考えられますか。 取締役：法規制の違いや文化の相違、為替リスクが主なものです。現地パートナーとの提携が鍵になるでしょう。  質問：海外展開のリスクとして挙げられていないものは？"
- options:
  1. "法規制の違い" (6자)
  2. [정답] "人材不足" (4자)
  3. "為替リスク" (5자)
  4. "文化の相違" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 5.0)
  - **L1** (Info): TTS speaker markers: ["取締役：", "社長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-28562dbd-a1cc-4344-8fa8-86f15e390171
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  CFO：A社の買収について、デューデリジェンスの結果が出ました。財務状況は健全ですが、技術的負債がかなり蓄積しています。 CEO：買収後のシステム統合にどのくらいのコストが見込まれますか。 CFO：概算で5億円程度です。ただし、A社のAI技術は当社にない強みであり、長期的には投資回収が十分見込めます。  質問：A社の課題は何ですか？"
- options:
  1. "財務状況が悪い" (7자)
  2. [정답] "技術的負債が蓄積している" (12자)
  3. "AI技術が不足している" (11자)
  4. "人材が流出している" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.71x (max=12, min=7)
  - **B5** (Medium): correct is longest (12 vs avg 9.8)
  - **L1** (Info): TTS speaker markers: ["CFO：", "CEO："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-b01f981e-7dfa-4297-b17a-52c61ae19fd3
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  研究者A：AIの学習データにバイアスが含まれていると、出力結果にもバイアスが反映されてしまいます。 研究者B：いわゆるアルゴリズミックバイアスの問題ですね。採用選考AIが特定の属性を不当に排除した事例もありました。 研究者A：だからこそ、データの多様性を確保し、定期的な公平性監査が不可欠なのです。  質問：アルゴリズミックバイアスを防ぐために必要なことは何ですか？"
- options:
  1. "AI開発を中断する" (9자)
  2. [정답] "データの多様性と公平性監査" (13자)
  3. "学習データを減らす" (9자)
  4. "AIの判断を公開しない" (11자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (13 vs avg 10.5)
  - **L1** (Info): TTS speaker markers: ["研究者A：", "研究者B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-5480c4c2-e28f-4e83-9997-57716b08431b
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  弁護士：オープンソースライセンスについてご注意ください。GPL系のライブラリを使用した場合、ソースコードの公開義務が生じる可能性があります。 開発者：MIT ライセンスなら問題ないですか。 弁護士：MITは比較的制約が少ないですが、著作権表示の義務はあります。ライセンスの種類を確認してから利用することをお勧めします。  質問：GPLライセンスの特徴は何ですか？"
- options:
  1. "制約が全くない" (7자)
  2. [정답] "ソースコード公開義務の発生" (13자)
  3. "商業利用ができない" (9자)
  4. "無料で使用できない" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.86x (max=13, min=7)
  - **B5** (Medium): correct is longest (13 vs avg 9.5)
  - **L1** (Info): TTS speaker markers: ["弁護士：", "開発者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-bde12a57-1e20-4bb8-a598-c3bd41d672db
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  教授：従来の講義型教育から、プロジェクトベースの学習への転換が求められています。 学生：具体的にはどのような違いがありますか。 教授：知識の暗記ではなく、実際の課題を解決するプロセスを通じて学ぶことです。失敗も重要な学習機会として捉えます。チームでの協働能力も自然と身につきます。  質問：プロジェクトベース学習で重視されていることは何ですか？"
- options:
  1. "知識の暗記" (5자)
  2. [정답] "課題解決を通じた学習" (10자)
  3. "試験点数の向上" (7자)
  4. "教授の講義の聴講" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=10, min=5)
  - **B5** (Medium): correct is longest (10 vs avg 7.5)
  - **L1** (Info): TTS speaker markers: ["教授：", "学生："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-b4a679c7-2603-4a00-89df-935cc6ad12aa
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  監査役：内部統制の観点から、開発環境と本番環境へのアクセス権限は厳密に分離すべきです。 CTO：現在は開発者が本番環境に直接アクセスできる状態です。 監査役：それは重大なリスクです。最低限、本番デプロイは承認フローを経るようにしてください。職務分掌の原則に基づいた権限管理を徹底すべきです。  質問：監査役が指摘した問題は何ですか？"
- options:
  1. "開発環境が遅い" (7자)
  2. [정답] "開発者の本番環境への直接アクセス" (16자)
  3. "バックアップがない" (9자)
  4. "監査ログがない" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.29x (max=16, min=7)
  - **B5** (Medium): correct is longest (16 vs avg 9.8)
  - **L1** (Info): TTS speaker markers: ["監査役：", "CTO："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-9e0fe7fb-2c10-4014-be07-6bb5f77424e8
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  マネージャー：多国籍チームのマネジメントで一番大切なのは、暗黙の前提を言語化することです。日本では「空気を読む」文化がありますが、異文化間ではそれが通用しません。 社員：具体的にはどうすればいいですか。 マネージャー：決定事項は必ず文書化し、期待値を明確に伝えること。そして、質問しやすい雰囲気を作ることです。  質問：異文化マネジメントで最も重要なことは何ですか？"
- options:
  1. "空気を読むこと" (7자)
  2. [정답] "暗黙の前提を言語化すること" (13자)
  3. "厳格なルールを作ること" (11자)
  4. "全てを上司が決めること" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.86x (max=13, min=7)
  - **B5** (Medium): correct is longest (13 vs avg 10.5)
  - **L1** (Info): TTS speaker markers: ["マネージャー：", "社員："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-3f0ca7cf-5b36-44b8-8a58-465cb8c2876e
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  政策立案者：レギュラトリーサンドボックス制度を導入し、新技術の実証実験を規制の例外として認めることを検討しています。 企業代表：規制の枠外で実験できるのは大きなメリットです。ただし、消費者保護の観点も忘れてはなりません。 政策立案者：もちろんです。実験の範囲と期間を限定し、影響を監視しながら進めます。  質問：レギュラトリーサンドボックスの目的は何ですか？"
- options:
  1. "全ての規制を廃止する" (10자)
  2. [정답] "新技術の実証実験を例外的に許可" (15자)
  3. "企業に補助金を支給する" (11자)
  4. "消費者を保護しない" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=15, min=9)
  - **B5** (Medium): correct is longest (15 vs avg 11.3)
  - **L1** (Info): TTS speaker markers: ["政策立案者：", "企業代表："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-21f2f494-595c-4311-bac9-b08d3e4cbb43
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  学者A：デジタル技術は民主主義を強化する可能性がある一方で、監視社会を助長するリスクもあります。 学者B：台湾のvTaiwanのように、市民参加型のデジタルプラットフォームは良い事例ですね。 学者A：しかし、デジタルリテラシーの格差が新たな民主主義の不平等を生む可能性も指摘されています。  質問：デジタル技術と民主主義の関係で懸念されていることは何ですか？"
- options:
  1. "インターネットの速度が遅い" (13자)
  2. [정답] "デジタルリテラシー格差が不平等を生む" (18자)
  3. "投票率が低くなる" (8자)
  4. "政治家が不要になる" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.25x (max=18, min=8)
  - **B5** (Medium): correct is longest (18 vs avg 12.0)
  - **L1** (Info): TTS speaker markers: ["学者A：", "学者B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-cfc271b3-6dae-4522-9cc5-589d8bf70d26
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  人事部長：同一労働同一賃金の原則が強化され、正社員と非正規社員の不合理な待遇差が禁止されています。 社員：具体的にどのような差が問題になりますか。 人事部長：基本給だけでなく、手当や福利厚生の差も対象です。職務内容が同じであれば、雇用形態に関わらず同等の待遇を保障する必要があります。  質問：同一労働同一賃金の対象は何ですか？"
- options:
  1. "基本給のみ" (5자)
  2. [정답] "基本給と手当と福利厚生" (11자)
  3. "賞与のみ" (4자)
  4. "正社員のみ対象" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.75x (max=11, min=4)
  - **B5** (Medium): correct is longest (11 vs avg 6.8)
  - **L1** (Info): TTS speaker markers: ["人事部長：", "社員："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-1f0bc759-654c-41e4-a996-da0b13f0d076
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  エンジニア：ユーザーデータの収集範囲について倫理的に問題がないか確認したいのですが。 CPO：収集目的を明確にし、最小限のデータだけを取得する「データミニマイゼーション」の原則を守ってください。 エンジニア：同意の取得方法も確認すべきですね。 CPO：はい。オプトインの仕組みを確実に実装してください。  質問：CPOが指示した原則は何ですか？"
- options:
  1. "できるだけ多くのデータを収集する" (16자)
  2. [정답] "データミニマイゼーションの徹底" (15자)
  3. "データ収集をしない" (9자)
  4. "匿名化すればよい" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=16, min=8)
  - **L1** (Info): TTS speaker markers: ["エンジニア：", "CPO："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-341db752-83fd-4e7d-8d65-f93f765f65aa
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  未来学者：2030年代には、企業に所属しない「DAO（分散型自律組織）」のような新しい働き方が一般化する可能性があります。 記者：従来の雇用関係はなくなるのでしょうか。 未来学者：完全になくなることはないでしょうが、プロジェクト単位で集まり、完了後に解散するような柔軟な組織形態が増えると予想されます。重要なのは、個人がポータブルなスキルと評判を持つことです。  質問：未来学者が個人に必要だと考えていることは何ですか？"
- options:
  1. "大企業に所属すること" (10자)
  2. [정답] "ポータブルなスキルと評判を持つこと" (17자)
  3. "一つの専門分野だけを深く掘り下げること" (19자)
  4. "組織に順応すること" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.11x (max=19, min=9)
  - **L1** (Info): TTS speaker markers: ["記者：", "未来学者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-37dade52-c6db-43e8-848e-ec193f993af0
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  アナウンサー：きょうの東京の天気は晴れです。気温は二十五度です。明日は曇りで、午後から雨が降るでしょう。傘を持って出かけてください。  質問：明日の天気はどうですか。"
- options:
  1. "晴れ" (2자)
  2. [정답] "曇りのち雨" (5자)
  3. "一日中雨" (4자)
  4. "晴れて暑い" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=5, min=2)
  - **B5** (Medium): correct is longest (5 vs avg 4.0)
  - **L1** (Info): TTS speaker markers: ["アナウンサー："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-49814f0d-c03d-4a7f-95cf-0c40bb73d82a
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  アナウンス：午前十時から正午まで、中央広場で和太鼓の演奏が行われます。午後一時からは、盆踊り大会を開催いたします。花火大会は午後七時半から約三十分間行います。  質問：盆踊り大会は何時からですか。"
- options:
  1. "午前10時から" (7자)
  2. "正午から" (4자)
  3. [정답] "午後1時から" (6자)
  4. "午後7時30分から" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.25x (max=9, min=4)
  - **L1** (Info): TTS speaker markers: ["アナウンス："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-a3d4e12b-cb74-4154-99c5-ad3557b8d989
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  アナウンス：ただいま、この地域に大雨警報が発令されました。河川の水位が上昇しておりますので、川の近くにお住まいの方は十分にご注意ください。自動車での避難は道路が混雑する原因となりますので、できるだけ徒歩でお願いいたします。  質問：この放送から推測できることとして正しいものはどれですか。"
- options:
  1. "地震が発生する危険がある" (12자)
  2. "台風が接近している" (9자)
  3. "避難する必要がない" (9자)
  4. [정답] "洪水の危険があり川の近くの住民は注意が必要だ" (22자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.44x (max=22, min=9)
  - **B5** (Medium): correct is longest (22 vs avg 13.0)
  - **L1** (Info): TTS speaker markers: ["アナウンス："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-0887eb6c-b564-4f9c-a98f-8ebb02f3e63a
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  講師：交通事故件数は前年より減少していますが、自転車に関する事故は逆に増加しています。特に、スマートフォンを見ながらの運転や、イヤホンをつけたままの走行が原因となるケースが目立ちます。  質問：自転車事故が増えている原因として挙げられているものはどれですか。"
- options:
  1. "飲酒運転と速度超過" (9자)
  2. "信号無視と逆走" (7자)
  3. [정답] "スマホ使用とイヤホン着用" (12자)
  4. "夜間無灯走行と傘の使用" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.71x (max=12, min=7)
  - **B5** (Medium): correct is longest (12 vs avg 9.8)
  - **L1** (Info): TTS speaker markers: ["講師："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-479b723a-e44e-47c7-a804-0cb46b9e3fe8
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  講師：自転車も車両の一種ですので、交通ルールを守る義務があります。具体的には、信号を守ること、一時停止の標識では必ず止まること、夜間は必ずライトを点灯すること、そして歩道ではなく車道の左側を走行することが基本です。  質問：この講演から推測できる問題として正しいものはどれですか。"
- options:
  1. "自動車事故が増加している" (12자)
  2. [정답] "自転車利用者のルール無視の実態" (15자)
  3. "歩行者事故が最も多い" (10자)
  4. "交通ルールが最近変更された" (13자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (15 vs avg 12.5)
  - **L1** (Info): TTS speaker markers: ["講師："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-5802875d-a1c4-4c3b-a7b4-1b80f1e78bfb
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  市長：当市は少子高齢化という構造的課題に直面しておりますが、これを危機ではなく変革の好機と捉え、持続可能なまちづくりを推進してまいります。第一に、子育て支援の抜本的強化です。第二に、高齢者福祉の充実です。第三に、防災・減災対策の強化です。  質問：市長が挙げた三つの重点施策に含まれないものはどれですか。"
- options:
  1. "子育て支援の強化" (8자)
  2. "高齢者福祉の充実" (8자)
  3. [정답] "産業振興" (4자)
  4. "防災・減災対策の強化" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=10, min=4)
  - **B5** (Medium): correct is shortest (4 vs avg 7.5)
  - **L1** (Info): TTS speaker markers: ["市長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-170d3b47-6cbf-4882-8846-970098937f24
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  教授：共生という言葉が示すように、これは一方的な同化ではなく、相互理解と尊重に基づく関係の構築を意味します。 パネリストA：外国人住民の方々が最も困っているのは、やはり言葉の壁です。  質問：パネリストAが外国人住民の最大の課題として挙げたものは何ですか。"
- options:
  1. "就職問題" (4자)
  2. "住居問題" (4자)
  3. "文化の違い" (5자)
  4. [정답] "言葉の壁" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.3)
  - **L1** (Info): TTS speaker markers: ["教授：", "パネリストA："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-6a50bdcc-01f3-4d3e-9e70-6dcb1d7ae374
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  田中：当町の人口はこの二十年で三割減少しました。特に若年層の流出が深刻で、高校を卒業すると大半が都市部に出てしまいます。商店街もシャッター通りと化し、かつての賑わいは見る影もありません。  質問：田中さんが述べた地域の問題は何ですか。"
- options:
  1. [정답] "人口減少と若年層流出による衰退" (15자)
  2. "人口過密と交通渋滞" (9자)
  3. "外国人観光客の増加による混雑" (14자)
  4. "自然災害の被害復旧" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=15, min=9)
  - **B5** (Medium): correct is longest (15 vs avg 11.8)
  - **L1** (Info): TTS speaker markers: ["田中："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-e6257db0-3830-42f5-b44e-0e5254a98e08
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  教授A：最大の課題は、画一的な教育から個別最適化された学びへの転換が進んでいないことです。 教授B：私はむしろ、教育の本質的な目的が見失われていることを懸念しています。知識の暗記偏重から脱却できず、批判的思考力や創造性を育む教育が不十分です。  質問：教授Bが懸念している問題は何ですか。"
- options:
  1. "画一的教育から個別最適化への転換不足" (18자)
  2. "学校施設の老朽化" (8자)
  3. [정답] "暗記偏重から脱却できず批判的思考力と創造性教育が不足していること" (32자)
  4. "教員数の不足" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 5.33x (max=32, min=6)
  - **B5** (Medium): correct is longest (32 vs avg 16.0)
  - **L1** (Info): TTS speaker markers: ["教授A：", "教授B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-d9bbcb55-14e1-4bb7-b87c-f06f3a3d01c9
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  代表：第一の事業は、里山再生プロジェクトです。荒廃していた市内五か所の里山において、地域住民とボランティアの協力のもと、間伐作業や植樹活動を実施しました。延べ参加人数は千二百名に達し、約三千本の苗木を植えることができました。  質問：里山再生プロジェクトの成果として正しいものはどれですか。"
- options:
  1. [정답] "延べ1,200名が参加し約3,000本の苗木を植えた" (26자)
  2. "延べ500名が参加し1,000本の苗木を植えた" (23자)
  3. "延べ3,000名が参加し約1,200本の苗木を植えた" (26자)
  4. "延べ2,000名が参加し約5,000本の苗木を植えた" (26자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (26 vs avg 25.3)
  - **L1** (Info): TTS speaker markers: ["代表："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-a50aaae7-a75b-4337-8ef8-25e6bc69cf2c
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  佐藤：当地域にはまだ十分に活用されていない観光資源が数多くあります。温泉や伝統工芸、豊かな自然環境を組み合わせた体験型の滞在プログラムを開発することで、交流人口の拡大を図れるのではないでしょうか。  質問：佐藤さんが提案した地域活性化の方策は何ですか。"
- options:
  1. "大規模ショッピングモールの誘致" (15자)
  2. "工場建設の誘致" (7자)
  3. [정답] "温泉・伝統工芸・自然環境を組み合わせた体験型滞在プログラムの開発" (32자)
  4. "高速道路の建設" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 4.57x (max=32, min=7)
  - **B5** (Medium): correct is longest (32 vs avg 15.3)
  - **L1** (Info): TTS speaker markers: ["佐藤："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-7649b096-f3d3-4808-b371-66569adc0850
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  保護者代表：現場の声として申し上げますと、教員の多忙化が子どもたちの教育の質に直接影響しています。教員が一人一人の子どもと向き合う時間が不足しています。部活動の指導や事務作業の負担を軽減しなければ、いくら理想を掲げても実現は困難です。  質問：保護者代表が最も伝えたかったことは何ですか。"
- options:
  1. "部活動を廃止すべきだ" (10자)
  2. "教員をもっと採用すべきだ" (12자)
  3. [정답] "教員の業務負担を減らさなければ教育改革は実現不可能だ" (26자)
  4. "保護者がもっと参加すべきだ" (13자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.60x (max=26, min=10)
  - **B5** (Medium): correct is longest (26 vs avg 15.3)
  - **L1** (Info): TTS speaker markers: ["保護者代表："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-73bffea5-bd86-4a63-89d4-ad2f1f52cf18
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  教授：制度的な整備に加えて、地域レベルでの草の根の交流こそが、真の共生社会を実現する鍵ではないでしょうか。お互いの文化を知り、日常的な接点を増やしていくことが、偏見や差別を克服する最も有効な手段だと確信しています。  質問：教授が真の共生社会実現の鍵だと考えているものは何ですか。"
- options:
  1. "法律と制度の整備" (8자)
  2. "外国人住民の日本語能力の向上" (14자)
  3. [정답] "草の根の交流と日常的接点の拡大" (15자)
  4. "外国人住民数の制限" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.88x (max=15, min=8)
  - **B5** (Medium): correct is longest (15 vs avg 11.5)
  - **L1** (Info): TTS speaker markers: ["教授："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-6eb7b1b0-3aa6-4f05-9f55-a0ee64d58d71
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  特別講演のお知らせ 題目：「IT業界で活躍するために」 講師：佐藤太郎氏（元Google日本法人） 日時：5月20日（土）14:00〜16:00 場所：5階 大会議室 参加費：無料（要事前登録）  質問：この講演に参加するために必要なことは何ですか？"
- options:
  1. "参加費を払う" (6자)
  2. [정답] "事前登録をする" (7자)
  3. "学生証を見せる" (7자)
  4. "推薦書をもらう" (7자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (7 vs avg 6.8)
  - **L1** (Info): TTS speaker markers: ["題目：", "講師：", "参加費："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-649f17b7-51ee-467a-afe8-48f7e9534c6f
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "次の文を聴いて、質問に答えてください。  社員の皆様へ。来月の健康診断についてお知らせします。日程は6月10日から14日の間で、各自都合のいい日を選んでください。前日の夜9時以降は食事を取らないでください。当日は受付で保険証を提示してください。  質問：健康診断の前日に注意すべきことは何ですか？"
- options:
  1. "運動をしない" (6자)
  2. [정답] "夜9時以降は食べない" (10자)
  3. "早く寝る" (4자)
  4. "水をたくさん飲む" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=10, min=4)
  - **B5** (Medium): correct is longest (10 vs avg 7.0)
---
### Q-1fbaddff-b3fe-490f-bcb2-c06f5ac2c626
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  講師：フィッシング詐欺の被害が増加しています。不審なメールのリンクは絶対にクリックしないでください。送信元のアドレスをよく確認し、少しでも怪しいと感じたら、情報セキュリティ部門に報告してください。パスワードは定期的に変更し、二要素認証を有効にすることも重要です。  質問：不審なメールを受け取ったらどうすべきですか？"
- options:
  1. "リンクをクリックして確認する" (14자)
  2. [정답] "セキュリティ部門に報告する" (13자)
  3. "削除して忘れる" (7자)
  4. "同僚に転送する" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=14, min=7)
  - **L1** (Info): TTS speaker markers: ["講師："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-a2d7d325-87fb-48d7-a21f-7cb8ce24418d
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  CTO：DX推進にあたり、三つの柱を立てます。第一に、レガシーシステムのモダナイゼーション。第二に、データ活用基盤の構築。第三に、デジタル人材の育成です。まずは現状のシステムを棚卸しするところから始めましょう。  質問：DX推進の第一歩は何ですか？"
- options:
  1. "新しいシステムを構築する" (12자)
  2. [정답] "現在のシステムを棚卸しする" (13자)
  3. "人材を採用する" (7자)
  4. "外注に任せる" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.17x (max=13, min=6)
  - **B5** (Medium): correct is longest (13 vs avg 9.5)
  - **L1** (Info): TTS speaker markers: ["CTO："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-1ba84fbb-e881-4ada-a7f4-855974156a09
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  講演者：ブロックチェーン技術の本質は、中央管理者を必要としない分散型の合意形成メカニズムにあります。暗号通貨への応用が有名ですが、サプライチェーン管理や電子投票など、信頼性の担保が求められるあらゆる領域で活用の可能性があります。  質問：ブロックチェーンの本質的な特徴は何ですか？"
- options:
  1. "高速処理が可能だ" (8자)
  2. [정답] "中央管理者不要の分散型合意形成" (15자)
  3. "データを削除できる" (9자)
  4. "無料で使用できる" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.88x (max=15, min=8)
  - **B5** (Medium): correct is longest (15 vs avg 10.0)
  - **L1** (Info): TTS speaker markers: ["講演者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-2a8cf1c7-7f75-483b-af8f-6b3a9bb985fb
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  講師：量子コンピュータの発展により、現在の暗号技術が将来破られる可能性があります。これに対応するため、耐量子暗号（ポスト量子暗号）の研究が急速に進んでいます。NISTは2024年に新しい暗号標準を策定しました。企業は今から移行計画を立てるべきです。  質問：耐量子暗号が必要な理由は何ですか？"
- options:
  1. "現在の暗号が複雑だから" (11자)
  2. [정답] "量子コンピュータで現暗号が破られるから" (19자)
  3. "コストを削減するため" (10자)
  4. "速度を上げるため" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.38x (max=19, min=8)
  - **B5** (Medium): correct is longest (19 vs avg 12.0)
  - **L1** (Info): TTS speaker markers: ["講師："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-3527a64e-8153-4232-b389-2cc4ba482a8b
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  田中：はじめまして。田中です。よろしくお願いします。 キム：はじめまして。キムです。韓国から来ました。 田中：そうですか。日本語が上手ですね。 キム：ありがとうございます。まだまだです。  キムさんはどこから来ましたか？"
- options:
  1. "中国" (2자)
  2. [정답] "韓国" (2자)
  3. "アメリカ" (4자)
  4. "タイ" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **B5** (Medium): correct is shortest (2 vs avg 2.5)
  - **L1** (Info): TTS speaker markers: ["田中：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-57514dca-e94f-4f83-8ea2-93ab0e72a834
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  店員：いらっしゃいませ。ご注文はお決まりですか？ キム：コーヒーを一つお願いします。 店員：ホットとアイス、どちらになさいますか？ キム：ホットでお願いします。 店員：かしこまりました。  キムさんは何を注文しましたか？"
- options:
  1. "アイスコーヒー" (7자)
  2. [정답] "ホットコーヒー" (7자)
  3. "紅茶" (2자)
  4. "ジュース" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.50x (max=7, min=2)
  - **B5** (Medium): correct is longest (7 vs avg 5.0)
  - **L1** (Info): TTS speaker markers: ["店員：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-eb9b3b1e-f05c-477e-bfaf-c65f2c865a21
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  田中：今日は暑いですね。 キム：そうですね。30度以上あるそうです。 田中：冷たいものが飲みたいですね。 キム：自動販売機で何か買いましょうか。 田中：いいですね。お茶をお願いします。  今日の天気はどうですか？"
- options:
  1. "寒い" (2자)
  2. "涼しい" (3자)
  3. [정답] "暑い" (2자)
  4. "雨が降っている" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.50x (max=7, min=2)
  - **B5** (Medium): correct is shortest (2 vs avg 3.5)
  - **L1** (Info): TTS speaker markers: ["田中：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-5d19a62a-26b9-45f8-b055-2735317d80e2
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  佐藤：キムさん、このタスクの進捗はどうですか？ キム：すみません、少し遅れています。データベースの設計で 　　　予想以上に時間がかかっていまして。 佐藤：そうですか。期限は金曜日ですよね。間に合いそうですか？ キム：木曜日までにはなんとか終わらせます。 佐藤：分かりました。もし助けが必要なら、遠慮なく言ってくださいね。 キム：ありがとうございます。  キムさんのタスクが遅れている理由は何ですか？"
- options:
  1. "テストに時間がかかっている" (13자)
  2. [정답] "データベースの設計に時間がかかっている" (19자)
  3. "体調が悪かった" (7자)
  4. "他のタスクが忙しかった" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.71x (max=19, min=7)
  - **B5** (Medium): correct is longest (19 vs avg 12.5)
  - **L1** (Info): TTS speaker markers: ["佐藤：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-7fbb9355-d048-4703-93e4-7df7d2232550
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  山田：来週の歓迎会の場所、決まりましたか？ 鈴木：はい、駅前のイタリアンレストランを予約しました。 山田：何人ですか？ 鈴木：今のところ12人です。でも、まだ返事をしていない人が3人います。 山田：そうですか。明日までに確認してもらえますか？ 鈴木：はい、明日のお昼までに全員に確認します。  歓迎会の場所はどこですか？"
- options:
  1. "会社の食堂" (5자)
  2. "駅前の居酒屋" (6자)
  3. [정답] "駅前のイタリアンレストラン" (13자)
  4. "ホテルのレストラン" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.60x (max=13, min=5)
  - **B5** (Medium): correct is longest (13 vs avg 8.3)
  - **L1** (Info): TTS speaker markers: ["山田：", "鈴木："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-6e818f14-e182-4a34-b44a-dff7734e1a34
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  上司：キムさん、明日のプレゼンの資料はできていますか？ キム：はい、ほぼ完成しています。グラフのデータだけ最新のものに 　　　更新する必要があります。 上司：分かりました。更新したら、私に確認のメールを送ってください。 キム：はい、今日中に送ります。 上司：それから、プレゼンは英語でお願いしますね。 キム：承知しました。  キムさんがまだやっていないことは何ですか？"
- options:
  1. "資料の作成" (5자)
  2. [정답] "グラフのデータ更新" (9자)
  3. "英語への翻訳" (6자)
  4. "メールの送信" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.80x (max=9, min=5)
  - **B5** (Medium): correct is longest (9 vs avg 6.5)
  - **L1** (Info): TTS speaker markers: ["上司：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-2d976811-496e-4d23-9fa3-8a43cbf65015
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  鈴木：すみません、プリンターが動かないんですが。 IT担当：どんな状態ですか？ 鈴木：電源は入っていますが、紙が詰まったというメッセージが出ています。 IT担当：分かりました。紙を取り出してみてください。 　　　　カバーを開けて、詰まった紙をゆっくり引き出してください。 鈴木：やってみます。あ、取れました。 IT担当：よかったです。それで動くはずです。  プリンターの問題は何でしたか？"
- options:
  1. "電源が入らない" (7자)
  2. "インクがない" (6자)
  3. [정답] "紙が詰まった" (6자)
  4. "ネットワークに接続できない" (13자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.17x (max=13, min=6)
  - **B5** (Medium): correct is shortest (6 vs avg 8.0)
  - **L1** (Info): TTS speaker markers: ["鈴木：", "IT担当："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-a4a6cf81-93f4-4c86-91a5-3b61ec6200d7
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  山田：キムさん、コードレビューのフィードバックなんですが、 　　　この関数は責務が多すぎると思います。 キム：具体的にはどの部分でしょうか？ 山田：データの取得と加工と表示を全部一つの関数でやっていますよね。 　　　単一責任の原則に沿って、それぞれ分割した方がいいですよ。 キム：なるほど、確かにテストも書きにくい状態ですね。 山田：そうなんです。分割すればユニットテストも書きやすくなります。  山田さんが指摘した問題は何ですか？"
- options:
  1. "変数名が分かりにくい" (10자)
  2. [정답] "一つの関数に責務が多すぎる" (13자)
  3. "コメントが少ない" (8자)
  4. "パフォーマンスが悪い" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.63x (max=13, min=8)
  - **B5** (Medium): correct is longest (13 vs avg 10.3)
  - **L1** (Info): TTS speaker markers: ["山田：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-3d24cdcc-fc68-4090-b3f3-92f78d6c1a84
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  クライアント：御社のシステムを導入する場合、既存のデータは 　　　　　　　移行できますか？ 営業：はい、もちろん可能です。ただし、データ量にもよりますが、 　　　移行作業には通常2〜3週間ほどかかります。 クライアント：費用はどのくらいでしょうか？ 営業：データ移行だけで申しますと、100万円からになります。 　　　ただ、年度末までにご契約いただければ、2割引きで 　　　ご提供できます。 クライアント：検討させていただきます。  年度末までに契約した場合の移行費用はいくらですか？"
- options:
  1. "50万円から" (6자)
  2. [정답] "80万円から" (6자)
  3. "100万円から" (7자)
  4. "120万円から" (7자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (6 vs avg 6.5)
  - **L1** (Info): TTS speaker markers: ["クライアント：", "営業："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-e63938d3-313b-43fa-9f1f-f21dd84ced99
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  鈴木：大変です！本番環境でエラーが発生しています。 佐藤：落ち着いて。まず影響範囲を確認してください。 　　　全ユーザーに影響がありますか？ 鈴木：ログを確認したところ、特定のAPIエンドポイントだけです。 　　　決済機能には影響はありません。 佐藤：分かりました。では、まず該当のエンドポイントを 　　　メンテナンスモードに切り替えて、原因調査に入りましょう。 　　　それから、お客様にはステータスページで状況を通知してください。  佐藤さんが最初に指示したことはどれですか？"
- options:
  1. [정답] "影響範囲を確認すること" (11자)
  2. "メンテナンスモードに切り替えること" (17자)
  3. "原因を調査すること" (9자)
  4. "お客様に通知すること" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.89x (max=17, min=9)
  - **L1** (Info): TTS speaker markers: ["鈴木：", "佐藤："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-4013a614-eff5-4222-acbc-83694173670c
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  上司：キムさん、今期の評価面談です。全体的に良い成績でしたね。 キム：ありがとうございます。 上司：特にコードの品質が向上しています。ただ、一点だけ 　　　改善点があります。 キム：何でしょうか？ 上司：チームミーティングでの発言をもう少し増やしてほしいんです。 　　　技術的な知識は十分あるので、それをチームに共有することで 　　　全体のレベルアップにつながります。 キム：分かりました。来期は積極的に発言するようにします。  上司がキムさんに求めていることは何ですか？"
- options:
  1. "コードの品質を上げること" (12자)
  2. "残業を減らすこと" (8자)
  3. [정답] "チームミーティングで積極的に発言すること" (20자)
  4. "新しい技術を学ぶこと" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=20, min=8)
  - **B5** (Medium): correct is longest (20 vs avg 12.5)
  - **L1** (Info): TTS speaker markers: ["上司：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-a6bf9034-7fea-4ef5-9af0-2de12059cebb
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  田中：現在のモノリシックなアーキテクチャをマイクロサービスに 　　　移行すべきか検討しています。 山田：メリットは理解していますが、チームの規模を考えると、 　　　運用の複雑さが大きな課題になりませんか？ 田中：確かにそうですね。現在のチームは5人ですから。 山田：まずはモジュラーモノリスで機能を分離して、 　　　チームが成長してからマイクロサービスに移行する方が 　　　現実的だと思います。 田中：段階的なアプローチですね。それが一番リスクが少なそうです。  山田さんが提案したアプローチはどれですか？"
- options:
  1. "すぐにマイクロサービスに移行する" (16자)
  2. "モノリシックのまま維持する" (13자)
  3. [정답] "まずモジュラーモノリスにして段階的に移行する" (22자)
  4. "外部のサービスを利用する" (12자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.83x (max=22, min=12)
  - **B5** (Medium): correct is longest (22 vs avg 15.8)
  - **L1** (Info): TTS speaker markers: ["田中：", "山田："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-71dcaaf9-51c8-483a-b65d-ced287c4a37e
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  部長：来期のプロジェクト体制についてですが、キムさんを 　　　サブリーダーに推薦したいと思います。 課長：キムさんですか。技術力は申し分ないですが、 　　　リーダーシップの経験がまだ浅いのが気になります。 部長：それは承知していますが、今のうちから経験を積ませないと、 　　　いつまでたっても育ちません。まずは小規模なチームで 　　　試してみてはどうでしょうか。 課長：そうですね。3〜4人のチームなら、フォローもしやすいですし。 　　　分かりました、その方向で進めましょう。  部長がキムさんをサブリーダーに推薦した理由はどれですか？"
- options:
  1. "リーダーシップ経験が豊富だから" (15자)
  2. "他に適任者がいないから" (11자)
  3. [정답] "早いうちから経験を積ませるため" (15자)
  4. "本人が希望したから" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=15, min=9)
  - **B5** (Medium): correct is longest (15 vs avg 12.5)
  - **L1** (Info): TTS speaker markers: ["部長：", "課長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-4500f411-1ef4-4ea4-94c1-66457ae0962f
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  鈴木：今回のリリースですが、ブルーグリーンデプロイメントで 　　　進めたいと思います。 佐藤：カナリアリリースではなくて？ 鈴木：今回は大きな仕様変更があるので、一部ユーザーだけに 　　　公開するよりも、環境を丸ごと切り替えて、問題があれば 　　　即座にロールバックできる方が安全だと判断しました。 佐藤：なるほど。ロールバック手順は準備できていますか？ 鈴木：はい、検証環境で3回テスト済みです。  ブルーグリーンデプロイメントを選んだ理由はどれですか？"
- options:
  1. "コストが安いから" (8자)
  2. [정답] "仕様変更でも即ロールバック可能だから" (18자)
  3. "カナリアリリースより簡単だから" (15자)
  4. "チームが慣れているから" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.25x (max=18, min=8)
  - **B5** (Medium): correct is longest (18 vs avg 13.0)
  - **L1** (Info): TTS speaker markers: ["鈴木：", "佐藤："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-1500fec0-4bd9-4174-abf5-276edb1a5a37
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  PM：要件定義の段階で、お客様から新しい要望が出ました。 　　ユーザー権限管理機能を追加してほしいそうです。 開発者：それは当初のスコープには含まれていませんよね？ PM：はい。ただ、お客様にとっては重要な機能らしいです。 開発者：追加するとなると、工数が2週間ほど増えますし、 　　　　テスト範囲も広がります。 PM：では、まず影響範囲を整理して、見積もりを出した上で 　　お客様と再度協議しましょう。スコープを広げるなら 　　納期か費用の調整が必要です。  PMの対応方針はどれですか？"
- options:
  1. "要望をすぐに受け入れる" (11자)
  2. "要望を断る" (5자)
  3. [정답] "影響を整理し顧客と協議する" (13자)
  4. "開発チームを増員する" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.60x (max=13, min=5)
  - **B5** (Medium): correct is longest (13 vs avg 9.8)
  - **L1** (Info): TTS speaker markers: ["PM：", "開発者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-b73a4a87-ceb8-47e0-aa49-4be13fcaeb7c
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  講師：Dockerコンテナの最大のメリットは環境の一貫性です。 　　　「自分の環境では動くのに、本番では動かない」という 　　　問題を解消できます。 受講生：VMとの違いは何ですか？ 講師：VMはOSごと仮想化しますが、コンテナはOSのカーネルを 　　　共有するので、起動が非常に速く、リソースの消費も 　　　少ないのが特徴です。 受講生：セキュリティ面ではどうですか？ 講師：カーネルを共有するため、VMに比べて分離性は低いです。 　　　そのため、センシティブな環境ではVMが適している場合もあります。  コンテナのデメリットとして述べられていることはど"
- options:
  1. "起動が遅い" (5자)
  2. "リソースの消費が多い" (10자)
  3. [정답] "VMに比べて分離性が低い" (12자)
  4. "環境の一貫性が保てない" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.40x (max=12, min=5)
  - **B5** (Medium): correct is longest (12 vs avg 9.5)
  - **L1** (Info): TTS speaker markers: ["講師：", "受講生："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-5ff2dc5e-5d2a-4802-83cf-7913e49d8ee0
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  マネージャー：AチームとBチームの間でAPIの仕様について意見が 　　　　　　食い違っているようですね。 リーダー：はい、AチームはRESTを主張していますが、 　　　　Bチームはパフォーマンスの面からgRPCを推しています。 マネージャー：両チームの要件を再度確認しましょう。 　　　　　　外部公開が必要な部分はREST、内部通信はgRPCという 　　　　　　ハイブリッドアプローチも一つの選択肢です。 リーダー：なるほど、要件によって使い分けるんですね。 　　　　両チームに提案してみます。  マネージャーが提案した解決策はどれですか？"
- options:
  1. "全てRESTに統一する" (11자)
  2. "全てgRPCに統一する" (11자)
  3. [정답] "外部REST・内部gRPCのハイブリッド" (20자)
  4. "第三の技術を採用する" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=20, min=10)
  - **B5** (Medium): correct is longest (20 vs avg 13.0)
  - **L1** (Info): TTS speaker markers: ["マネージャー：", "リーダー："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-5a2e84b2-45fa-470c-9737-a555fd1d74fd
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  佐藤：先月のプロジェクトの反省点として、ドキュメントの不足が 　　　挙げられています。 田中：確かに、設計書が古いまま更新されていなかったですね。 佐藤：新しいメンバーが参加したときに、コードを読むしかなくて 　　　キャッチアップに時間がかかったそうです。 田中：今後はプルリクエストのレビュー時に、関連ドキュメントの 　　　更新も確認項目に入れましょう。 佐藤：それは良い案ですね。レビューチェックリストに追加します。  ドキュメント不足による具体的な問題は何でしたか？"
- options:
  1. "バグが増えた" (6자)
  2. [정답] "新メンバーのキャッチアップに時間がかかった" (21자)
  3. "テストが書けなかった" (10자)
  4. "デプロイに失敗した" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.50x (max=21, min=6)
  - **B5** (Medium): correct is longest (21 vs avg 11.5)
  - **L1** (Info): TTS speaker markers: ["佐藤：", "田中："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-3343959f-02d1-47bf-8bf1-361de568ce25
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  課長：この機能の見積もりはどのくらいですか？ キム：開発だけで言えば3日程度ですが、テストとコードレビューを 　　　含めると5日は見ておいた方がいいと思います。 課長：お客様には3日と伝えてしまったんですが。 キム：品質を担保するためには、テスト期間は削れません。 　　　もし3日で納品するなら、機能を絞る必要があります。 課長：分かりました。お客様に正確な見積もりを再提示します。  キムさんの主張はどれですか？"
- options:
  1. "3日で全て完了できる" (10자)
  2. [정답] "テスト期間は品質のために削れない" (16자)
  3. "お客様の要望に合わせるべきだ" (14자)
  4. "機能を増やすべきだ" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.78x (max=16, min=9)
  - **B5** (Medium): correct is longest (16 vs avg 12.3)
  - **L1** (Info): TTS speaker markers: ["課長：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-b4ddfebe-7d92-47b0-8dd1-fed51c9ea8e2
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  キム：日本の会議で「検討します」と言われたとき、 　　　それは前向きな返事だと思っていいですか？ メンター：実は、それは注意が必要な表現です。「検討します」は 　　　　文字通り「考えます」という意味ですが、 　　　　日本のビジネスでは婉曲な断りである場合も多いです。 キム：えっ、そうなんですか？どう見分ければいいですか？ メンター：相手の表情やその後のフォローアップに注目してください。 　　　　具体的な日程や条件の話が続けば前向きですが、 　　　　そのまま連絡が途絶えた場合は、断られた可能性が高いです。  「検討します」の意味について正しいものはどれ"
- options:
  1. "必ず前向きな返事である" (11자)
  2. "必ず断りの意味である" (10자)
  3. [정답] "前向きな場合も婉曲な断りの場合もある" (18자)
  4. "返事を保留するという意味だけである" (17자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.80x (max=18, min=10)
  - **B5** (Medium): correct is longest (18 vs avg 14.0)
  - **L1** (Info): TTS speaker markers: ["キム：", "メンター："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-e62ae0a2-1260-4395-b4fe-883a76d45057
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  セキュリティ担当：最近、社内でフィッシングメールの被害が 　　　　　　　　増えています。先月だけで5件の報告がありました。 部長：具体的にはどんな手口ですか？ セキュリティ担当：取引先を装ったメールで、添付ファイルを 　　　　　　　　ひらかせるパターンが多いです。 部長：対策はどうしますか？ セキュリティ担当：まず、全社員向けのセキュリティ研修を実施します。 　　　　　　　　また、不審なメールを簡単に報告できるボタンを 　　　　　　　　メーラーに追加する予定です。  フィッシングメールの主な手口はどれですか？"
- options:
  1. "パスワードを聞き出す電話" (12자)
  2. [정답] "取引先を装い添付ファイルを開かせる" (17자)
  3. "偽のログインページに誘導する" (14자)
  4. "USBメモリを配布する" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.55x (max=17, min=11)
  - **B5** (Medium): correct is longest (17 vs avg 13.5)
  - **L1** (Info): TTS speaker markers: ["セキュリティ担当：", "部長："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-557bc618-1343-4d08-a655-26ccf8eafa3e
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  先輩：キムさん、日本の会社では名刺交換にもルールがあるんですよ。 キム：そうなんですか？ 先輩：まず、相手より先に名刺を出すのが礼儀です。両手で差し出して、 　　　相手の名刺も両手で受け取ります。 キム：受け取った名刺はすぐにしまっても大丈夫ですか？ 先輩：いいえ、それは失礼にあたります。打ち合わせちゅうは 　　　テーブルの上に置いておくのがマナーです。 　　　相手の名前を確認するためにも役立ちますよ。  名刺を受け取った後、すべきことはどれですか？"
- options:
  1. "すぐにカバンにしまう" (10자)
  2. "ポケットに入れる" (8자)
  3. [정답] "テーブルの上に置いておく" (12자)
  4. "名刺入れの中に入れる" (10자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (12 vs avg 10.0)
  - **L1** (Info): TTS speaker markers: ["先輩：", "キム："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-9eb1792a-9982-4617-9527-14af34e769b2
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  山田：最近チームのモチベーションが下がっているように感じます。 佐藤：何が原因だと思いますか？ 山田：連続するデッドラインと、成果が見えにくいことだと思います。 　　　バックエンドのリファクタリングって、ユーザーからは 　　　見えないですからね。 佐藤：なるほど。では、毎週のデモタイムを設けましょう。 　　　パフォーマンスの改善数値やコード品質のメトリクスを 　　　共有することで、成果を可視化できると思います。 山田：いいですね。小さな成功を積み重ねることが大事ですよね。  佐藤さんが提案した解決策の目的はどれですか？"
- options:
  1. "連続しているデッドラインを先に延ばすこと" (20자)
  2. "チームのメンバーを変えて心機一転すること" (20자)
  3. [정답] "成果を可視化してモチベーションを上げること" (21자)
  4. "バックエンドのリファクタリングをやめること" (21자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (21 vs avg 20.5)
  - **L1** (Info): TTS speaker markers: ["山田：", "佐藤："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-7b56bba2-ca9d-44f9-9f63-1d6470bfd295
- quiz_id: d0000004-0000-0000-0000-000000000004
- question_category: listening, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  社長：来期から組織をフラットにしたい。意思決定のスピードを上げるためだ。 役員：階層を減らすということですか。 社長：そうだ。部長・課長の二層制を、グループリーダー一層にする。 役員：現場の声が経営に届きやすくなりますね。  質問：組織改革の目的は何ですか？"
- options:
  1. "人件費を減らすため" (9자)
  2. [정답] "意思決定の速度を上げるため" (13자)
  3. "社員数を増やすため" (9자)
  4. "管理職を増やすため" (9자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (13 vs avg 10.0)
  - **L1** (Info): TTS speaker markers: ["社長：", "役員："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-eb2e3100-5019-45d6-8863-a278c2dbdaa4
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：Bさんは、がっこうまで どうやって いきますか。 B：バスで いきます。20ぷん ぐらいです。 A：でんしゃは つかいませんか。 B：えきが とおいですから、バスの ほうが べんりです。  質問：Bさんは なぜ バスで いきますか？"
- options:
  1. "バスの運賃が電車より安いから" (14자)
  2. [정답] "駅が遠いのでバスが便利だから" (14자)
  3. "学校まで行ける電車がないから" (14자)
  4. "健康のために歩きたいから" (12자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (14 vs avg 13.5)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-87de7550-5ca1-46b1-bdfd-829fa134f580
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：Bさん、技術の進歩は必ずしも人間の幸福につながるとは限らないのではないでしょうか。 B：技術自体は中立で、それをどう使うかが問題だと思います。 A：しかし、一度開発された技術は止められないという「技術的慣性」の問題があります。 B：だからこそ、開発段階から倫理的な議論を組み込む「バリュー・センシティブ・デザイン」が重要なんですね。  質問：Bさんが重要だと考える概念は何ですか？"
- options:
  1. "技術的慣性の不可避性" (10자)
  2. [정답] "バリュー・センシティブ・デザイン" (16자)
  3. "技術の倫理的中立性" (9자)
  4. "技術決定論の考え方" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.78x (max=16, min=9)
  - **B5** (Medium): correct is longest (16 vs avg 11.0)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-31db59bf-1f13-4a14-a848-b509874235be
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  アナウンス：次は「中央公園前」です。中央公園、市立図書館にお越しの方はこちらでおおりください。おおりの際は、前のドアからお降りください。車内では携帯電話はマナーモードにしてください。  質問：市立図書館にいきたい人はどうすればいいですか。"
- options:
  1. "次の停留所の市役所前で降りる" (14자)
  2. [정답] "中央公園前で降りる" (9자)
  3. "東京駅で降りる" (7자)
  4. "後ろのドアから降りる" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=14, min=7)
  - **L1** (Info): TTS speaker markers: ["アナウンス："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-c7fc243d-7844-4d1c-a606-b04f36dc4717
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：もしもし、あしたの約束なんだけど…。 B：うん、2時に駅前で会うよね？ A：ごめん、ちょっと仕事が入って。3時に変えてもいい？ B：いいよ。場所は同じ？ A：うん、駅前のカフェで待ってるね。  質問：約束の時間はどう変わりましたか？"
- options:
  1. "1時から2時に" (7자)
  2. [정답] "2時から3時に" (7자)
  3. "3時から4時に" (7자)
  4. "変更なし" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.75x (max=7, min=4)
  - **B5** (Medium): correct is longest (7 vs avg 6.3)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-a74ccf7e-9043-47a0-90a8-aa0a4f499cc5
- quiz_id: d0000005-0000-0000-0000-000000000005
- question_category: listening, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  CTO：私はCTOとして、組織のナレッジマネジメントを強化したいと考えている。ベテラン社員の暗黙知を形式知化する仕組みが必要だ。 マネージャー：社内Wikiの活用やペアプログラミングの推進はどうでしょうか。 CTO：いいね。加えて、月に一度テックトークを開催して、各チームの知見を共有する場を作ろう。  質問：CTOが新たに提案したことは何ですか？"
- options:
  1. "社内Wikiの活用" (9자)
  2. [정답] "月1回テックトークの開催" (12자)
  3. "ペアプログラミング" (9자)
  4. "外部研修" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.00x (max=12, min=4)
  - **B5** (Medium): correct is longest (12 vs avg 8.5)
  - **L1** (Info): TTS speaker markers: ["CTO：", "マネージャー："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-93854880-c2cb-4f55-8af5-d08fd1c10d8f
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  アナウンス：このバスは東京駅行きです。次は「中央公園前」です。本日は祝日ダイヤで運行しております。通常より本数が少なくなっておりますので、ご注意ください。  質問：きょうのバスについて正しいものはどれですか。"
- options:
  1. "普段より運行本数が多い" (11자)
  2. "今日は運行しない" (8자)
  3. [정답] "祝日ダイヤで運行本数が少ない" (14자)
  4. "東京駅まで行かない" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.75x (max=14, min=8)
  - **B5** (Medium): correct is longest (14 vs avg 10.5)
  - **L1** (Info): TTS speaker markers: ["アナウンス："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-7171b183-ea5a-476d-b5d9-dc5bd4238bbd
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  山田：土曜日、ひまですか。 鈴木：うん、ひまだよ。 山田：じゃあ、一緒に公園に行きませんか。 鈴木：いいね！なんじに会う？ 山田：十時はどうですか。 鈴木：十時はちょっと早いな。十一時はどう？ 山田：十一時、いいですよ。駅の前で会いましょう。  質問：二人はいつ、どこで会いますか。"
- options:
  1. "土曜日10時、公園の前で" (12자)
  2. "日曜日11時、駅の前で" (11자)
  3. [정답] "土曜日11時、駅の前で" (11자)
  4. "土曜日10時、駅の前で" (11자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (11 vs avg 11.3)
  - **L1** (Info): TTS speaker markers: ["山田：", "鈴木："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-b7b54fcf-e5ed-40c4-853f-b66bf6c899e4
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  アナウンサー：あしたは曇りで、午後から雨が降るでしょう。傘を持って出かけてください。週末は晴れて、暑くなります。水をたくさん飲んでください。  質問：あした出かける人は何を持っていくべきですか。"
- options:
  1. "水" (1자)
  2. "帽子" (2자)
  3. "日焼け止め" (5자)
  4. [정답] "傘" (1자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 5.00x (max=5, min=1)
  - **B5** (Medium): correct is shortest (1 vs avg 2.3)
  - **L1** (Info): TTS speaker markers: ["アナウンサー："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-ca18c15d-dcad-4cae-b429-f5576a1309f6
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  高橋：何にする？ 佐藤：私はカレーライスにする。高橋さんは？ 高橋：私はラーメンにします。 店員：ご注文はお決まりですか。 佐藤：カレーライスひとつとラーメンひとつ、お願いします。  質問：高橋さんは何を注文しましたか。"
- options:
  1. "カレーライス" (6자)
  2. "うどん" (3자)
  3. "カレーライスとラーメン" (11자)
  4. [정답] "ラーメン" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.67x (max=11, min=3)
  - **L1** (Info): TTS speaker markers: ["高橋：", "佐藤：", "店員："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-dac9b925-a59c-4be2-b379-d1f10a22c005
- quiz_id: d0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  店員：いらっしゃいませ。 田中：すみません、おにぎりはどこですか。 店員：おにぎりはあちらの棚にあります。 田中：ありがとうございます。これと、お茶をください。 店員：はい、おにぎりひとつとお茶ひとつですね。全部で三百二十円です。  質問：田中さんは何を買いましたか。"
- options:
  1. "おにぎりと水" (6자)
  2. [정답] "おにぎりとお茶" (7자)
  3. "お弁当とお茶" (6자)
  4. "パンとジュース" (7자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (7 vs avg 6.5)
  - **L1** (Info): TTS speaker markers: ["店員：", "田中："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-09dfdd2f-210e-45e8-bb58-525c9eb85e47
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の文を聴いて、質問に答えてください。  アナウンス：会場の北側には屋台が並んでおります。焼きそば、たこ焼き、かき氷などをお楽しみいただけます。お子様向けには、南側の広場で金魚すくいや輪投げなどのゲームをご用意しております。  質問：子ども向けの遊びはどこにありますか。"
- options:
  1. "会場の北側" (5자)
  2. "中央広場" (4자)
  3. "会場の東側" (5자)
  4. [정답] "南側の広場" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.8)
  - **L1** (Info): TTS speaker markers: ["アナウンス："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-fbab4c88-19c0-4534-8ffb-f6e8d5ded1f1
- quiz_id: d0000003-0000-0000-0000-000000000003
- question_category: listening, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  面接官：弊社を志望した理由を教えてください。 応募者：御社のグローバルな開発環境に魅力を感じました。多国籍のチームで開発することで技術力を高められます。また、異文化コミュニケーション能力も身につくと考えています。 面接官：当社ではどのようなキャリアを目指したいですか。 応募者：将来的にはプロジェクトマネージャーとして、国際プロジェクトをリードしたいと考えています。  質問：応募者の将来の目標は何ですか？"
- options:
  1. "フリーランス開発者になること" (14자)
  2. [정답] "PMとして国際プロジェクトをリードすること" (21자)
  3. "自分の会社を起業すること" (12자)
  4. "海外支社に転勤すること" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.91x (max=21, min=11)
  - **B5** (Medium): correct is longest (21 vs avg 14.5)
  - **L1** (Info): TTS speaker markers: ["面接官：", "応募者："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-468443f9-d7a1-41b2-9d51-98a8cea29361
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  山田：京都はどう？紅葉がきれいな時期だと思うんだけど。 鈴木：京都いいね。でも、宿は取れるかな。 山田：夜行バスのほうが安いよ。片道三千円ぐらいでいける。 鈴木：そんなに安いの？じゃあ、バスにしよう。  質問：二人はどうやって京都にいくことにしましたか。"
- options:
  1. "新幹線で" (4자)
  2. "飛行機で" (4자)
  3. "電車で" (3자)
  4. [정답] "夜行バスで" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **B5** (Medium): correct is longest (5 vs avg 4.0)
  - **L1** (Info): TTS speaker markers: ["山田：", "鈴木："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-5cb9e50f-1b71-49d1-acbc-e066500f2927
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：週末、一緒に映画を見にいかない？ B：土曜日は用事があるんだけど、日曜日なら空いてるよ。 A：じゃ、日曜日の午後はどう？ B：午前中に掃除したいから、1時以降がいいな。 A：わかった。2時にしよう。  質問：二人はなんじに映画を見ますか？"
- options:
  1. "午前11時" (5자)
  2. "午後1時" (4자)
  3. [정답] "午後2時" (4자)
  4. "午後3時" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.3)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-471286ec-ac13-4e54-a57f-6c75e9b582f0
- quiz_id: d0000002-0000-0000-0000-000000000002
- question_category: listening, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5, L1]
- question_text: "次の会話を聴いて、質問に答えてください。  A：山田さん、入院したらしいよ。 B：えっ、大丈夫かな。お見舞いにいこうよ。 A：うん。果物でも持っていこうか。 B：いいね。メロンとかどう？ A：メロンは高いから、りんごにしよう。  質問：二人は何を持っていくことにしましたか？"
- options:
  1. "メロン" (3자)
  2. [정답] "りんご" (3자)
  3. "花" (1자)
  4. "ケーキ" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.00x (max=3, min=1)
  - **B5** (Medium): correct is longest (3 vs avg 2.5)
  - **L1** (Info): TTS speaker markers: ["A：", "B："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---
### Q-7cc378d1-62fc-46dc-82bf-26e5eda66f33
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: listening, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, L1]
- question_text: "次の会話を聞いて、質問に答えてください。  キム：すみません。駅はどこですか？ 通行人：この道をまっすぐいって、二つ目の信号を右に曲がってください。 キム：右ですね。どのくらいかかりますか？ 通行人：歩いて5分くらいです。  駅にいくには、二つ目の信号をどうしますか？"
- options:
  1. "左に曲がる" (5자)
  2. "まっすぐ行く" (6자)
  3. [정답] "右に曲がる" (5자)
  4. "後ろに戻る" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (5 vs avg 5.3)
  - **L1** (Info): TTS speaker markers: ["キム：", "通行人："] (stripped by parseDialogueScript; verify with test-tts-parse.mjs)
---

## Low 우선순위 이슈

_없음_

## 거버넌스 이슈 (별도 마이그레이션 대상)

_없음_

## 자동감지 불가 항목 (Fixer가 수동 판단 필요)

- **A1 학습범위 준수**: 자동감지 불가. Fixer가 N-level 기준(N5~N1)으로 각 문제 난이도 대비 요구 지식 범위를 검토 필요.
- **A3 단일정답 보장**: 자동감지 불가. 각 오답이 맥락상 정답이 될 가능성 수동 검토.
- **B4 오답지 범위**: 자동감지 불가. 오답 선택지가 해당 lesson/N-level 학습 범위 내인지 수동 확인.
- **B6 상호배타 (동의어/포함관계)**: 슬래시 외 동의어·포함관계는 자동감지 불가.
