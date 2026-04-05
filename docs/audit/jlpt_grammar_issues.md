# JLPT Grammar 카테고리 감사 리포트

**감사일**: 2026-04-05
**대상 문제 수**: 190
**DB 조회 기준**: quiz_questions.question_category='grammar' OR quiz_id IN (b0000001, b0000002, b0000003, b0000004, b0000005)

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 17건    | 8.9% |
| Medium  | 129건    | 67.9% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 146 / 190 (76.8%)
**A2-exempt (필터링됨)**: 9건

## High 우선순위 이슈

### Q-959d3860-38a2-40b4-b8eb-ecaaba3d988f
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, A2]
- question_text: "「最近、若者は本を読まない（　）がある。」傾向を表す正しいものはどれですか？"
- options:
  1. "おそれ" (3자)
  2. [정답] "傾向" (2자)
  3. "一方" (2자)
  4. "反面" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.3)
  - **A2** (High): blank-fill leak: answer "傾向" appears in question frame (outside 「」)
---
### Q-81b9352b-c869-49f2-84a6-66dcbcbd50c9
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 있음(1건)
- 위반 항목: [B5, B5, CLAIM]
- question_text: "日本に行く（　）、パスポートが必要です。"
- options:
  1. "から" (2자)
  2. [정답] "時" (1자)
  3. "ので" (2자)
  4. "まで" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=2, min=1)
  - **B5** (Medium): correct is shortest (1 vs avg 1.8)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-ddf2bddc-6634-40c6-a9a0-d0b27f0d196e
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 있음(1건)
- 위반 항목: [CLAIM]
- question_text: "バグを減らす（　）にして、コードレビューを行っています。"
- options:
  1. "ため" (2자)
  2. "こと" (2자)
  3. "もの" (2자)
  4. [정답] "よう" (2자)
- 자동감지 근거:
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-3515e6ad-73da-4749-a0a5-75cf782501bf
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [CLAIM]
- question_text: "この問題の原因は理解し（　）。"
- options:
  1. "にくい" (3자)
  2. "づらい" (3자)
  3. "かねる" (3자)
  4. [정답] "がたい" (3자)
- 자동감지 근거:
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-4ea13622-4999-423c-a796-6ea5f28c27cb
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [B5, CLAIM]
- question_text: "「セキュリティ対策は常に最新にするべきだ。」の「〜べきだ」は何を表しますか？"
- options:
  1. [정답] "義務・当然（～すべきだ）" (12자)
  2. "可能（～できる）" (8자)
  3. "推測（～だろう）" (8자)
  4. "希望（～したい）" (8자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (12 vs avg 9.0)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-693a9fff-4f27-4189-9bc9-2d861743c477
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [B5, A2-exempt, CLAIM]
- question_text: "「予想に反して、プロジェクトは成功した。」の「に反して」は何を表しますか？"
- options:
  1. "～に従って" (5자)
  2. [정답] "～に反して" (5자)
  3. "～に基づいて" (6자)
  4. "～とともに" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (5 vs avg 5.3)
  - **A2-exempt** (Info): exempt (何を表), bigram overlap 75%
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-751cbcbe-ec25-4b5d-b87b-6c7e9a22fdf5
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [B5, A2-exempt, CLAIM]
- question_text: "「彼は優秀というより、努力家だと思う。」の「〜というより」の意味は？"
- options:
  1. "～だけでなく" (6자)
  2. [정답] "～というより" (6자)
  3. "～によると" (5자)
  4. "～と同様に" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (6 vs avg 5.5)
  - **A2-exempt** (Info): exempt (意味), bigram overlap 80%
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-f9cc7799-de82-4030-87fa-f091bb91b5ec
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [CLAIM]
- question_text: "「AIは便利な一方で、倫理的な問題も多い。」の「〜一方で」は何を表しますか？"
- options:
  1. "理由（～だから）" (8자)
  2. [정답] "対比（～一方で）" (8자)
  3. "条件（～たら）" (7자)
  4. "結果（～した結果）" (9자)
- 자동감지 근거:
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-569bc54e-d634-4493-899f-c72fd28f921a
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 있음(2건)
- 위반 항목: [B5, B5, CLAIM]
- question_text: "「本日をもって、このサービスを終了いたします。」の「をもって」の意味は？"
- options:
  1. "～に対して" (5자)
  2. [정답] "～を限りに／～をもって" (11자)
  3. "～によると" (5자)
  4. "～に関して" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.20x (max=11, min=5)
  - **B5** (Medium): correct is longest (11 vs avg 6.5)
  - **CLAIM** (High): 2 claim(s) filed
---
### Q-cae27d0d-4fa8-49e1-b8f7-5b0ca1870929
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 있음(1건)
- 위반 항목: [B5, B5, CLAIM]
- question_text: "「新製品の発表会とあって、会場は満員だった。」の「とあって」の意味は？"
- options:
  1. "～にもかかわらず" (8자)
  2. [정답] "～とあって（特別な事情）" (12자)
  3. "～と違って" (5자)
  4. "～によると" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.40x (max=12, min=5)
  - **B5** (Medium): correct is longest (12 vs avg 7.5)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-efc5488a-a8c7-40f2-be1f-bb2136872ff8
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 있음(1건)
- 위반 항목: [B5, B5, CLAIM]
- question_text: "「その美しいコードを見て、感心せずにはいられなかった。」の「〜ずにはいられない」は何を表しますか？"
- options:
  1. "～しなくてもいい" (8자)
  2. "～しなければならない（義務）" (14자)
  3. [정답] "～せずにはいられない（自然な感情）" (17자)
  4. "～しないほうがいい" (9자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.13x (max=17, min=8)
  - **B5** (Medium): correct is longest (17 vs avg 12.0)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-fc76935a-41ea-4b0d-a293-10206006424e
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 있음(1건)
- 위반 항목: [B5, CLAIM]
- question_text: "最近の天気は秋（　）くなってきた。"
- options:
  1. "みたい" (3자)
  2. "らし" (2자)
  3. [정답] "っぽ" (2자)
  4. "そう" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.3)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-1f5e156f-7bc3-4583-bd85-04920d4714ea
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [CLAIM]
- question_text: "できる（　）やってみろ。"
- options:
  1. "ことなら" (4자)
  2. [정답] "ものなら" (4자)
  3. "としたら" (4자)
  4. "ばかりか" (4자)
- 자동감지 근거:
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-2f86478f-9206-44ef-b960-189b4f2ad815
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 있음(1건)
- 위반 항목: [B5, CLAIM]
- question_text: "試験の結果が心配で（　）。"
- options:
  1. "しかたない" (5자)
  2. "ならない" (4자)
  3. [정답] "たまらない" (5자)
  4. "いられない" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.8)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-313037a2-4af4-48c4-a4ab-13c36843dea1
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 있음(1건)
- 위반 항목: [B5, CLAIM]
- question_text: "「彼の日本語力は、日本人と（　）ほどだ。」程度を表す正しいものはどれですか？"
- options:
  1. "間違える" (4자)
  2. [정답] "見間違える" (5자)
  3. "見分ける" (4자)
  4. "区別する" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.3)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-2ebfa80f-0dbe-4c38-85a7-92a95986ab09
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 있음(1건)
- 위반 항목: [B5, CLAIM]
- question_text: "「本件（　）、下記の通りご報告いたします。」ビジネス文書の表現として正しいものはどれですか？"
- options:
  1. [정답] "につきまして" (6자)
  2. "にあたりまして" (7자)
  3. "にかかわりまして" (8자)
  4. "にいたりまして" (7자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (6 vs avg 7.0)
  - **CLAIM** (High): 1 claim(s) filed
---
### Q-1be35558-bc6b-4e5b-8d57-276e7ad07b48
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 있음(1건)
- 위반 항목: [CLAIM]
- question_text: "「資料は私が（　）。」謙譲語として正しいものはどれですか？"
- options:
  1. "お持ちになります" (8자)
  2. [정답] "お持ちいたします" (8자)
  3. "お持ちされます" (7자)
  4. "お持ちでございます" (9자)
- 자동감지 근거:
  - **CLAIM** (High): 1 claim(s) filed
---

## Medium 우선순위 이슈

### Q-9d86b6c9-888e-426b-83e9-b160383a1c2b
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「日本に（　）です。」に入る正しいものは？"
- options:
  1. "行かない" (4자)
  2. "行ける" (3자)
  3. "行った" (3자)
  4. [정답] "行きたい" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-f4228b27-4c3d-4204-9a3d-6d475ef10a4b
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「昨日、食べ（　）てお腹が痛くなりました。」に入る正しいものは？"
- options:
  1. "やすく" (3자)
  2. [정답] "すぎ" (2자)
  3. "にくく" (3자)
  4. "たく" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.5)
---
### Q-da2c9ab8-c355-4f17-a4e1-7d3812c7e20b
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「手を洗って（　）、ごはんを食べます。」に入る正しいものは？"
- options:
  1. "ながら" (3자)
  2. "まで" (2자)
  3. [정답] "から" (2자)
  4. "のに" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.3)
---
### Q-87f8efca-404c-45d5-8721-026392050456
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「休みの日は映画を見（　）買い物をし（　）します。」に入る正しいものは？"
- options:
  1. "ながら…ながら" (7자)
  2. [정답] "たり…たり" (5자)
  3. "ては…ては" (5자)
  4. "つつ…つつ" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (5 vs avg 5.5)
---
### Q-71dd5af6-5791-4f2f-85be-0a67d9f109ca
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「日本に行っ（　）ことがあります。」に入る正しいものは？"
- options:
  1. "ている" (3자)
  2. "ての" (2자)
  3. [정답] "た" (1자)
  4. "てみた" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.00x (max=3, min=1)
  - **B5** (Medium): correct is shortest (1 vs avg 2.3)
---
### Q-fd8a43a1-87cf-4f36-81b8-55e9c1ed7d0c
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「明日は雨が降る（　）。」に入る正しいものは？"
- options:
  1. "に違いない" (5자)
  2. [정답] "かもしれない" (6자)
  3. "はずだ" (3자)
  4. "べきだ" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=6, min=3)
  - **B5** (Medium): correct is longest (6 vs avg 4.3)
---
### Q-e291a19f-ef02-4c07-95f6-e503d1a6ac5b
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「母は子どもに野菜を食べ（　）。」に入る正しいものは？"
- options:
  1. "られた" (3자)
  2. [정답] "させた" (3자)
  3. "たがった" (4자)
  4. "すぎた" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-58b33f6f-4de5-4314-9988-e9b53ece88cb
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「雨（　）、試合は予定通り行われた。」に入る正しいものは？"
- options:
  1. "によって" (4자)
  2. [정답] "にもかかわらず" (7자)
  3. "に関して" (4자)
  4. "に対して" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.75x (max=7, min=4)
  - **B5** (Medium): correct is longest (7 vs avg 4.8)
---
### Q-91de16cd-439e-462d-bae6-8392df31eb66
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「夢を実現せ（　）、毎日努力を続けている。」に入る正しいものは？"
- options:
  1. "ざるを得ず" (5자)
  2. [정답] "んがために" (5자)
  3. "ずにはいられず" (7자)
  4. "んばかりに" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (5 vs avg 5.5)
---
### Q-9c63c1eb-b05b-4748-8b56-0f8fd296591b
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「経験不足（　）、多くの失敗を重ねた。」に入る正しいものは？"
- options:
  1. "にもかかわらず" (7자)
  2. [정답] "ゆえに" (3자)
  3. "ならでは" (4자)
  4. "をもって" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.33x (max=7, min=3)
  - **B5** (Medium): correct is shortest (3 vs avg 4.5)
---
### Q-542b95ae-15d5-4a78-8259-0ed4280d53c7
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「この味は京都（　）の味だ。」に入る正しいものは？"
- options:
  1. "だからこその" (6자)
  2. [정답] "ならでは" (4자)
  3. "にとっての" (5자)
  4. "にしての" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.8)
---
### Q-845943af-09c7-4fc3-99b3-8e396200fb74
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "彼は10年日本に住んでいる。日本語が上手な（　）だ。"
- options:
  1. "もの" (2자)
  2. "つもり" (3자)
  3. [정답] "わけ" (2자)
  4. "ところ" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.5)
---
### Q-bca42a69-0274-4516-85c6-a66a06cc0fb6
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "忙しくて旅行（　）、買い物にも行けない。"
- options:
  1. "ばかりか" (4자)
  2. [정답] "どころか" (4자)
  3. "だけでなく" (5자)
  4. "のみならず" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.5)
---
### Q-90931eec-4226-47bd-99bf-8010bdcd2057
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, A2-exempt]
- question_text: "「食べる」の丁寧形（ます形）はどれですか？"
- options:
  1. [정답] "食べます" (4자)
  2. "食べるます" (5자)
  3. "食びます" (4자)
  4. "食べいます" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.5)
  - **A2-exempt** (Info): exempt (寧形), bigram overlap 67%
---
### Q-67bb588b-ecc8-4c33-bd64-72463f048cf4
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「この部屋は（　）です。」正しいものを選んでください。"
- options:
  1. "静かい" (3자)
  2. "静かな" (3자)
  3. [정답] "静か" (2자)
  4. "静かく" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.8)
---
### Q-c9462006-184f-4b4c-897c-5db36ae98183
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「日本語が（　）。」可能の意味になる正しいものはどれですか？"
- options:
  1. "話します" (4자)
  2. "話されます" (5자)
  3. [정답] "話せます" (4자)
  4. "話させます" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.5)
---
### Q-34cc39e4-6c86-42fd-8950-fc6a3ac2e55a
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「机の上に本が（　）。」正しいものはどれですか？"
- options:
  1. "います" (3자)
  2. [정답] "あります" (4자)
  3. "なります" (4자)
  4. "します" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-f8555fd4-050d-4cb3-9f62-8adca7a5dbcc
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「一緒に昼ご飯を（　）。」誘いの表現として正しいものはどれですか？"
- options:
  1. [정답] "食べましょう" (6자)
  2. "食べました" (5자)
  3. "食べません" (5자)
  4. "食べています" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (6 vs avg 5.5)
---
### Q-4c6117c0-9acc-4cb1-af61-950ef712997b
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「昨日、映画を（　）。」正しい過去形はどれですか？"
- options:
  1. "見ます" (3자)
  2. "見ません" (4자)
  3. [정답] "見ました" (4자)
  4. "見ています" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
---
### Q-32a8ee9f-030c-41f0-9602-2f9a280ada94
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「友達が私に本を（　）。」正しいものはどれですか？"
- options:
  1. "あげました" (5자)
  2. "もらいました" (6자)
  3. "やりました" (5자)
  4. [정답] "くれました" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (5 vs avg 5.3)
---
### Q-3fb27255-fe6e-43af-860e-c0e6c6aea9e3
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「電車の中で足を（　）。」受身形として正しいものはどれですか？"
- options:
  1. "踏んだ" (3자)
  2. "踏ませた" (4자)
  3. [정답] "踏まれた" (4자)
  4. "踏まされた" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
---
### Q-dd6c89d6-7870-485d-97eb-694f3e678d7a
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「先生は学生に作文を（　）。」使役形として正しいものはどれですか？"
- options:
  1. [정답] "書かせた" (4자)
  2. "書かれた" (4자)
  3. "書けた" (3자)
  4. "書いた" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-dc062b9e-68a6-4e5f-bd38-0a4bd726caef
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「空が暗いから、雨が降る（　）。」推量を表す正しいものはどれですか？"
- options:
  1. "つもりだ" (4자)
  2. "はずだ" (3자)
  3. [정답] "かもしれない" (6자)
  4. "にちがいない" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=6, min=3)
  - **B5** (Medium): correct is longest (6 vs avg 4.8)
---
### Q-8e5ee9d3-f070-4190-8673-b123e211fdbb
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「天気予報によると、明日は晴れる（　）。」伝聞を表す正しいものはどれですか？"
- options:
  1. "ようだ" (3자)
  2. "らしい" (3자)
  3. "みたいだ" (4자)
  4. [정답] "そうだ" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-2244d3a8-f0b3-4059-9fda-3c2f1b66065a
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「このケーキは（　）そうだ。」様態を表す正しいものはどれですか？"
- options:
  1. "おいしい" (4자)
  2. [정답] "おいし" (3자)
  3. "おいしく" (4자)
  4. "おいしさ" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.8)
---
### Q-af61b496-1027-4631-8e86-286a900f555b
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「明日までにレポートを出さ（　）。」義務を表す正しいものはどれですか？"
- options:
  1. "なくてもいい" (6자)
  2. "ないでほしい" (6자)
  3. [정답] "なければならない" (8자)
  4. "ないようにする" (7자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (8 vs avg 6.8)
---
### Q-d0d7a789-b7b5-4cff-b1f9-eb02a82b14ee
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「富士山に登った（　）がありますか。」経験を表す正しいものはどれですか？"
- options:
  1. "もの" (2자)
  2. [정답] "こと" (2자)
  3. "ところ" (3자)
  4. "わけ" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.3)
---
### Q-1d591bbb-3a52-4d21-bbfb-a4bc6d12f111
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「音楽を聞き（　）、勉強しています。」同時動作を表す正しいものはどれですか？"
- options:
  1. "つつ" (2자)
  2. [정답] "ながら" (3자)
  3. "がてら" (3자)
  4. "つも" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (3 vs avg 2.5)
---
### Q-7fd50731-b748-4ff0-8667-74b7f571e9c1
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「新しいレストランに行って（　）。」試みを表す正しいものはどれですか？"
- options:
  1. "しまった" (4자)
  2. "おいた" (3자)
  3. [정답] "みた" (2자)
  4. "あった" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **B5** (Medium): correct is shortest (2 vs avg 3.0)
---
### Q-8ad1e9fa-3231-4703-9d84-5c6ca56b2e4a
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「日本語が上手に（　）。」変化を表す正しいものはどれですか？"
- options:
  1. "しました" (4자)
  2. "できました" (5자)
  3. "ありました" (5자)
  4. [정답] "なりました" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.8)
---
### Q-bf89d334-b454-4e85-b52e-5c145852f00e
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「何度説明した（　）、彼は理解しなかった。」逆接を表す正しいものはどれですか？"
- options:
  1. [정답] "にもかかわらず" (7자)
  2. "にしたがって" (6자)
  3. "につれて" (4자)
  4. "にともなって" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.75x (max=7, min=4)
  - **B5** (Medium): correct is longest (7 vs avg 5.8)
---
### Q-628ad1c0-f973-425f-89f7-328c52a670dd
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「調査結果（　）、新しい方針を決定した。」根拠を表す正しいものはどれですか？"
- options:
  1. "に関して" (4자)
  2. "に対して" (4자)
  3. [정답] "に基づいて" (5자)
  4. "について" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.3)
---
### Q-49b97210-c751-43a3-a6a8-144ff866ae20
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「努力し（　）、成功はない。」条件を表す正しいものはどれですか？"
- options:
  1. "ないうちに" (5자)
  2. "ないばかりに" (6자)
  3. [정답] "ない限り" (4자)
  4. "ないわけに" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 5.0)
---
### Q-9e9edf8d-3ef8-4027-bc91-40e1d58539eb
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「あの映画を見ると、感動せずには（　）。」正しいものはどれですか？"
- options:
  1. "すまない" (4자)
  2. "おかない" (4자)
  3. [정답] "いられない" (5자)
  4. "ならない" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.3)
---
### Q-a457c202-57bb-4268-8965-4ae13dca816a
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「参加する（　）、明日までに連絡してください。」正しいものはどれですか？"
- options:
  1. [정답] "かどうか" (4자)
  2. "かのように" (5자)
  3. "かといって" (5자)
  4. "かわりに" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.5)
---
### Q-aa4c592d-6c14-42c4-8836-8db39ff3acb7
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「このバグは再現性が低い（　）、修正が難しい。」理由を表す正しいものはどれですか？"
- options:
  1. "ものの" (3자)
  2. [정답] "だけに" (3자)
  3. "ながらも" (4자)
  4. "わりに" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-0b2427ff-9d3f-4128-8ed7-b8288d602116
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「会議が終わる（　）、すぐに報告書を作成した。」直後を表す正しいものはどれですか？"
- options:
  1. "とたんに" (4자)
  2. "か早いか" (4자)
  3. "なり" (2자)
  4. [정답] "や否や" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
---
### Q-2c6bb011-31bf-4724-b573-517d5cd8baab
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「品質管理は（　）、納期の厳守も求められる。」正しいものはどれですか？"
- options:
  1. "ともかく" (4자)
  2. [정답] "言うまでもなく" (7자)
  3. "もとより" (4자)
  4. "さておき" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.75x (max=7, min=4)
  - **B5** (Medium): correct is longest (7 vs avg 4.8)
---
### Q-c274cef6-c314-4399-869f-ccc34b045173
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「たとえ失敗（　）、挑戦することに意味がある。」譲歩を表す正しいものはどれですか？"
- options:
  1. "したところで" (6자)
  2. [정답] "したとしても" (6자)
  3. "したばかりに" (6자)
  4. "したあげく" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (6 vs avg 5.8)
---
### Q-77a5b8ee-ecab-4c56-8a0e-2d057ca84f21
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「お客様のご要望（　）、対応いたしかねます。」不可能を表す正しいものはどれですか？"
- options:
  1. [정답] "には" (2자)
  2. "では" (2자)
  3. "とは" (2자)
  4. "からは" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.3)
---
### Q-346c6ac9-d25c-4590-b3a4-081a226e1756
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「彼の話（　）と、プロジェクトは順調らしい。」正しいものはどれですか？"
- options:
  1. "にすると" (4자)
  2. [정답] "によると" (4자)
  3. "にしたら" (4자)
  4. "にかかると" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.3)
---
### Q-650a0031-c414-4edc-ad67-8c33c8e6222b
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「納期に間に合わせるためには、残業する（　）。」仕方ない気持ちを表す正しいものはどれですか？"
- options:
  1. "べきではない" (6자)
  2. "わけにはいかない" (8자)
  3. [정답] "よりほかない" (6자)
  4. "ことはない" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.60x (max=8, min=5)
---
### Q-4426996f-2a09-4c3f-862c-3a8e3269b1d3
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「システムを導入する（　）、十分なテストが必要だ。」正しいものはどれですか？"
- options:
  1. "において" (4자)
  2. [정답] "にあたって" (5자)
  3. "にかけて" (4자)
  4. "にわたって" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.5)
---
### Q-d9efc57e-6e73-48f5-8653-8762489f0622
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「長時間議論した（　）、最終的に合意に達した。」結果を表す正しいものはどれですか？"
- options:
  1. "あげく" (3자)
  2. "結果" (2자)
  3. [정답] "末" (1자)
  4. "ところ" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.00x (max=3, min=1)
  - **B5** (Medium): correct is shortest (1 vs avg 2.3)
---
### Q-aa8c605f-38f4-44cf-9857-5c76905034fb
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「情報漏洩の危険性は（　）。」自明であることを表す正しいものはどれですか？"
- options:
  1. "言いようがない" (7자)
  2. [정답] "言うに及ばない" (7자)
  3. "言わざるを得ない" (8자)
  4. "言ってはならない" (8자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (7 vs avg 7.5)
---
### Q-ed3ce2e0-b2c4-4402-b2bb-762d217377a5
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「フロントエンドは改善された（　）、バックエンドには課題が残っている。」対比を表す正しいものはどれですか？"
- options:
  1. "ところが" (4자)
  2. "それなのに" (5자)
  3. [정답] "一方で" (3자)
  4. "それでも" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **B5** (Medium): correct is shortest (3 vs avg 4.0)
---
### Q-7b1ce36b-5a75-44c6-aecf-8358add24770
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「経験の有無（　）、応募できます。」無関係を表す正しいものはどれですか？"
- options:
  1. "をめぐって" (5자)
  2. "をもとに" (4자)
  3. "を通じて" (4자)
  4. [정답] "を問わず" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.3)
---
### Q-ff98af30-a387-4a98-ba8d-7ad60dc4be2c
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「入社1年目（　）、彼のスキルは非常に高い。」評価の基準を表す正しいものはどれですか？"
- options:
  1. [정답] "にしては" (4자)
  2. "としては" (4자)
  3. "にとっては" (5자)
  4. "に関しては" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.5)
---
### Q-ab7a56f3-08d0-43df-9240-0c79b0ed21c2
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「この問題は簡単に解決でき（　）ものではない。」否定の強調として正しいものはどれですか？"
- options:
  1. "かねる" (3자)
  2. [정답] "得る" (2자)
  3. "がたい" (3자)
  4. "づらい" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.8)
---
### Q-742db1c6-f2e5-45e8-9a78-546c5131440a
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「残業が多い（　）、給料は良い。」代償を表す正しいものはどれですか？"
- options:
  1. "うえに" (3자)
  2. "ばかりか" (4자)
  3. [정답] "かわりに" (4자)
  4. "どころか" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.8)
---
### Q-81f7e542-b24b-4ef5-828e-b598252324af
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「部長が先にお帰りに（　）。」尊敬語として正しいものはどれですか？"
- options:
  1. "されました" (5자)
  2. "いたしました" (6자)
  3. [정답] "なりました" (5자)
  4. "ございました" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (5 vs avg 5.5)
---
### Q-5aff5fbe-80d4-4bba-9180-306a11ba1bed
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「高いソフトウェアが（　）良いとは限らない。」部分否定を表す正しいものはどれですか？"
- options:
  1. [정답] "必ずしも" (4자)
  2. "決して" (3자)
  3. "めったに" (4자)
  4. "まさか" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-2a9cef56-9bd2-4861-84e7-50b8a584df35
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「彼は何事もなかった（　）、平然としていた。」比喩を表す正しいものはどれですか？"
- options:
  1. "ばかりに" (4자)
  2. "ものなら" (4자)
  3. [정답] "かのように" (5자)
  4. "とばかりに" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.5)
---
### Q-3e2b874e-ae63-43dd-a867-82da6c05c525
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「〜です」の役割として正しいものは？"
- options:
  1. "過去を表す" (5자)
  2. [정답] "文を丁寧にする" (7자)
  3. "否定を表す" (5자)
  4. "推測を表す" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (7 vs avg 5.5)
---
### Q-e5e22f97-c099-4be4-a2df-711df81e564d
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "私は朝ごはんを（　）。"
- options:
  1. "食べます" (4자)
  2. "食べた" (3자)
  3. [정답] "食べない" (4자)
  4. "食べて" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-6639bcc3-ed82-42ee-b4ea-aadc6b5979fb
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "すみません、ここに名前を（　）ください。"
- options:
  1. [정답] "書いて" (3자)
  2. "書かない" (4자)
  3. "書きたい" (4자)
  4. "書くと" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.5)
---
### Q-2853200e-e82e-454c-baba-28435529342f
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "昨日、映画を（　）。"
- options:
  1. "見ます" (3자)
  2. [정답] "見た" (2자)
  3. "見ている" (4자)
  4. "見ない" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **B5** (Medium): correct is shortest (2 vs avg 3.0)
---
### Q-55549a0a-ec66-4f79-ba8b-cedd4cd6b2aa
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「雨が降っているから、傘を持っていきます。」の「から」の意味は？"
- options:
  1. [정답] "理由（～から）" (7자)
  2. "譲歩（～けど）" (7자)
  3. "条件（～たら）" (7자)
  4. "時間（～時）" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (7 vs avg 6.8)
---
### Q-2a867fde-e6af-4cd8-9e93-54ff5c2456a2
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「一緒に昼ごはんを食べましょう。」の「〜ましょう」は何を表しますか？"
- options:
  1. "命令" (2자)
  2. "依頼" (2자)
  3. [정답] "勧誘（一緒にしようと誘う）" (13자)
  4. "禁止" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 6.50x (max=13, min=2)
  - **B5** (Medium): correct is longest (13 vs avg 4.8)
---
### Q-2abe04bd-020e-4abb-9c60-62fa65a6c998
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "明日はたぶん雨が降る（　）。"
- options:
  1. "ましょう" (4자)
  2. "ません" (3자)
  3. [정답] "でしょう" (4자)
  4. "ました" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-488d02a4-3235-4be3-bbb0-cef130178516
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "次の文で文法的に正しいものはどれですか？"
- options:
  1. "来年、日本に行きますつもりです。" (16자)
  2. [정답] "来年、日本に行くつもりです。" (14자)
  3. "来年、日本に行ってつもりです。" (15자)
  4. "来年、日本に行くないつもりです。" (16자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (14 vs avg 15.3)
---
### Q-484bdd82-a66d-4721-bfca-eab54ccf0196
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「このアプリは使いやすいです。」の「〜やすい」の意味は？"
- options:
  1. "～しにくい" (5자)
  2. "～したい" (4자)
  3. [정답] "～しやすい" (5자)
  4. "～しなければならない" (10자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=10, min=4)
---
### Q-a9656349-a27c-4e3f-82ae-eb2b3dceaaef
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "風邪を引いたなら、早く寝た（　）いいですよ。"
- options:
  1. "のが" (2자)
  2. [정답] "ほうが" (3자)
  3. "ために" (3자)
  4. "ように" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (3 vs avg 2.8)
---
### Q-be98c948-a1c6-4391-b494-fba0cc49d237
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "駅に着い（　）、電話してください。"
- options:
  1. "ても" (2자)
  2. "てから" (3자)
  3. [정답] "たら" (2자)
  4. "ので" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.3)
---
### Q-3c8d20e3-f03c-4381-8a74-e5b5ea3ab39e
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "音楽を聞き（　）、勉強します。"
- options:
  1. "たり" (2자)
  2. [정답] "ながら" (3자)
  3. "ために" (3자)
  4. "のに" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (3 vs avg 2.5)
---
### Q-d943a680-47c0-40e9-b0bd-1326f2cd79bf
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「薬を飲んだのに、まだ頭が痛い。」の「のに」の意味は？"
- options:
  1. "～だから" (4자)
  2. "～する時" (4자)
  3. [정답] "予想と違う結果への不満・驚き" (14자)
  4. "～するために" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 3.50x (max=14, min=4)
  - **B5** (Medium): correct is longest (14 vs avg 7.0)
---
### Q-47e3bda9-fc0c-4c5d-bfd0-d2dc4c2843ad
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「田中さんは今、本を読んでいます。」の「読んでいます」は何を表していますか？"
- options:
  1. "過去に完了した動作" (9자)
  2. "未来に行う予定" (7자)
  3. [정답] "現在進行中の動作" (8자)
  4. "可能な動作" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.80x (max=9, min=5)
---
### Q-d3aa5081-fea3-433c-bee8-73d51d55fd3a
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "この店は安い（　）、おいしい（　）、よく来ます。"
- options:
  1. [정답] "し、し" (3자)
  2. "たり、たり" (5자)
  3. "ながら、ながら" (7자)
  4. "から、から" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.33x (max=7, min=3)
  - **B5** (Medium): correct is shortest (3 vs avg 5.0)
---
### Q-6efa2def-7bd4-49e9-b902-eea734133260
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「来週、新しいプロジェクトが始まるそうです。」の「そうです」は何を表しますか？"
- options:
  1. "自分の推測" (5자)
  2. [정답] "他の人から聞いた情報（伝聞）" (14자)
  3. "外見から判断したこと" (10자)
  4. "確実な事実" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.80x (max=14, min=5)
  - **B5** (Medium): correct is longest (14 vs avg 8.5)
---
### Q-d1a48ae1-fa6d-44ab-ab14-22b2f9ebf262
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「彼は疲れているみたいだ。」の「みたいだ」の意味は？"
- options:
  1. "～だ（断定）" (6자)
  2. [정답] "見た目や状況からの推測" (11자)
  3. "～しようとする（意志）" (11자)
  4. "～だった（過去）" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.83x (max=11, min=6)
  - **B5** (Medium): correct is longest (11 vs avg 9.0)
---
### Q-81a0b80b-d088-4224-9d89-efae9ebdb3f3
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "会議の前に資料を準備し（　）。"
- options:
  1. "てある" (3자)
  2. "ている" (3자)
  3. [정답] "ておく" (3자)
  4. "てしまう" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-6dc7b6c8-0e8d-4168-9f7d-76b344bdc553
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「窓が開けてあります。」の「〜てある」は何を表しますか？"
- options:
  1. "現在進行中の動作" (8자)
  2. "未来のための準備" (8자)
  3. "自然な状態" (5자)
  4. [정답] "意図的な行為の結果状態" (11자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.20x (max=11, min=5)
  - **B5** (Medium): correct is longest (11 vs avg 8.0)
---
### Q-3ea78d09-c750-4be3-84f2-b4d4dcaa3e81
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "今からご飯を食べる（　）です。"
- options:
  1. [정답] "ところ" (3자)
  2. "はず" (2자)
  3. "つもり" (3자)
  4. "わけ" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (3 vs avg 2.5)
---
### Q-e33135df-e1fc-40e8-ad5f-ef973a8cdce0
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "次の文で文法的に正しいものはどれですか？"
- options:
  1. "田中さんはもう帰りますはずです。" (16자)
  2. "田中さんはもう帰るのはずです。" (15자)
  3. [정답] "田中さんはもう帰ったはずです。" (15자)
  4. "田中さんはもう帰ってはずです。" (15자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (15 vs avg 15.3)
---
### Q-2292f361-915f-480e-a3dd-93632ff14782
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「先生に褒められました。」の「〜られる」は何を表しますか？"
- options:
  1. "可能（～できる）" (8자)
  2. [정답] "受身（他者の動作を受ける）" (13자)
  3. "使役（～させる）" (8자)
  4. "尊敬（～なさる）" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.63x (max=13, min=8)
  - **B5** (Medium): correct is longest (13 vs avg 9.3)
---
### Q-ae645942-b98b-49a7-bd51-f19cad1ef2c2
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "テストに合格できる（　）、毎日勉強しています。"
- options:
  1. "ために" (3자)
  2. [정답] "ように" (3자)
  3. "ことに" (3자)
  4. "のに" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (3 vs avg 2.8)
---
### Q-1143e54d-09f1-4f80-afc2-4d5b72e88688
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5, A2-exempt]
- question_text: "電車の中で寝（　）、終点まで行ってしまいました。"
- options:
  1. [정답] "てしまい" (4자)
  2. "ておき" (3자)
  3. "てあり" (3자)
  4. "ていき" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.3)
  - **A2-exempt** (Info): coincidental char overlap (100%); predecessor "で寝" + answer "てしまい" not found as compound
---
### Q-3bbf7ae4-0b8e-443a-a4f4-d140cd4392f3
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "次の文で文法的に正しいものはどれですか？"
- options:
  1. "日本で働いたために、日本語を勉強しています。" (22자)
  2. [정답] "日本で働くために、日本語を勉強しています。" (21자)
  3. "日本で働きますために、日本語を勉強しています。" (23자)
  4. "日本で働いてために、日本語を勉強しています。" (22자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (21 vs avg 22.0)
---
### Q-e647fbcc-4d1b-4b1c-b4d9-20486b9c7f0e
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "スキルアップの（　）、毎日プログラミングの勉強をしています。"
- options:
  1. "ように" (3자)
  2. [정답] "ために" (3자)
  3. "ことに" (3자)
  4. "ところに" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-bf38471d-4b5e-4d52-8e75-fcbc5dce23ac
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「さっき昼ご飯を食べたばかりです。」の「〜たばかり」は何を表しますか？"
- options:
  1. "ずっと前にした動作" (9자)
  2. "今している動作" (7자)
  3. [정답] "たった今完了した動作" (10자)
  4. "まだしていない動作" (9자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (10 vs avg 8.8)
---
### Q-6cc101d2-497e-4959-a3cb-dab29cdcbc13
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "このケーキはおいし（　）ですね。"
- options:
  1. "いそう" (3자)
  2. "くそう" (3자)
  3. [정답] "そう" (2자)
  4. "さそう" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.8)
---
### Q-55bc8887-817f-400b-bfd8-b49c0f8379ba
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「大切なファイルを消してしまいました。」の「〜てしまう」は何を表しますか？"
- options:
  1. "喜び" (2자)
  2. [정답] "後悔・残念" (5자)
  3. "希望" (2자)
  4. "推測" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=5, min=2)
  - **B5** (Medium): correct is longest (5 vs avg 2.8)
---
### Q-eeb80c55-c752-4d69-86e3-2b2d31255e54
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "練習を続けて、日本語が話せる（　）なりました。"
- options:
  1. "ことに" (3자)
  2. [정답] "ように" (3자)
  3. "ために" (3자)
  4. "ところに" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-8b03de6c-ef45-49bf-a1b8-349a2e7083a2
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「来月から東京のオフィスに転勤することになりました。」の「ことになる」は何を表しますか？"
- options:
  1. "自分が決めたこと" (8자)
  2. [정답] "外部要因によって決まったこと" (14자)
  3. "まだ決まっていないこと" (11자)
  4. "過去に決まったことが取り消されたこと" (18자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.25x (max=18, min=8)
---
### Q-3d7b76bd-e2c5-49d5-a850-9de538ca05f1
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "パスワードを忘れた時は、リセットボタンを（　）いい。"
- options:
  1. "押しては" (4자)
  2. "押すと" (3자)
  3. "押したら" (4자)
  4. [정답] "押せば" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.5)
---
### Q-9271aa7b-b58f-4b56-935b-cb28b79c69a8
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「涙が出るほど嬉しかった。」の「〜ほど」は何を表しますか？"
- options:
  1. [정답] "程度・レベルの強調" (9자)
  2. "理由" (2자)
  3. "条件" (2자)
  4. "時間" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 4.50x (max=9, min=2)
  - **B5** (Medium): correct is longest (9 vs avg 3.8)
---
### Q-d2e190f3-9032-4c5f-a3ff-4c7b6ca79ed6
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "次の文で文法的に正しいものはどれですか？"
- options:
  1. "そんなに心配するのことはない。" (15자)
  2. "そんなに心配したことはない。" (14자)
  3. [정답] "そんなに心配することはない。" (14자)
  4. "そんなに心配しますことはない。" (15자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (14 vs avg 14.5)
---
### Q-165689c9-0bcb-4207-9e90-79353f7d28ae
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「あなたのことが大切だからこそ、厳しく言うのです。」の「〜からこそ」の意味は？"
- options:
  1. "～にもかかわらず" (8자)
  2. [정답] "～からこそ（理由の強調）" (12자)
  3. "～だけでなく" (6자)
  4. "～する代わりに" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=12, min=6)
  - **B5** (Medium): correct is longest (12 vs avg 8.3)
---
### Q-ed882482-8c78-4365-8022-4268e47526ac
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "先輩が教えてくれた（　）、プロジェクトを無事に終えることができました。"
- options:
  1. "せいで" (3자)
  2. [정답] "おかげで" (4자)
  3. "ために" (3자)
  4. "ばかりに" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-90c786f2-0abe-4dcf-8b2f-b43caa70e92a
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "次の文で文法的に正しいものはどれですか？"
- options:
  1. "問題があったら、すぐに報告しますべきだ。" (20자)
  2. [정답] "問題があったら、すぐに報告するべきだ。" (19자)
  3. "問題があったら、すぐに報告したべきだ。" (19자)
  4. "問題があったら、すぐに報告してべきだ。" (19자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (19 vs avg 19.3)
---
### Q-174b57e6-2b8d-414c-8931-54afb5ee450f
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "納期が迫っているので、休む（　）。"
- options:
  1. "ことはない" (5자)
  2. "はずがない" (5자)
  3. [정답] "わけにはいかない" (8자)
  4. "ものではない" (6자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.60x (max=8, min=5)
  - **B5** (Medium): correct is longest (8 vs avg 6.0)
---
### Q-11939f02-23a7-458c-b6e1-8983f732b9c2
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「最近、物価が上がるばかりだ。」の「ばかりだ」は何を表しますか？"
- options:
  1. "たった今～した" (7자)
  2. "～だけだ" (4자)
  3. [정답] "一方的に進行し続ける" (10자)
  4. "～したことがある" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.50x (max=10, min=4)
  - **B5** (Medium): correct is longest (10 vs avg 7.3)
---
### Q-a061bcf0-7eaf-4d32-b046-e90c7aa9e3d3
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "彼は英語（　）、フランス語も話せる。"
- options:
  1. "だけか" (3자)
  2. "しか" (2자)
  3. [정답] "ばかりか" (4자)
  4. "までか" (3자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **B5** (Medium): correct is longest (4 vs avg 3.0)
---
### Q-053f1bb3-6133-4626-914d-e186d40bf2ef
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「技術の進歩とともに、新しい課題も生まれている。」の「とともに」の意味は？"
- options:
  1. "～に反して" (5자)
  2. "～にもかかわらず" (8자)
  3. [정답] "～に伴い／～とともに" (10자)
  4. "～の結果として" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=10, min=5)
  - **B5** (Medium): correct is longest (10 vs avg 7.5)
---
### Q-1a8470e1-dbf1-4add-a724-886327539d70
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, A2-exempt]
- question_text: "「要件定義書に基づいて、システムを開発します。」の「に基づいて」の意味は？"
- options:
  1. "～に反して" (5자)
  2. "～に関して" (5자)
  3. "～に対して" (5자)
  4. [정답] "～に基づいて" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (6 vs avg 5.3)
  - **A2-exempt** (Info): exempt (意味), bigram overlap 80%
---
### Q-7719560d-d931-4fae-9b6c-28ca888aed74
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "仮に締め切りを延ばした（　）、品質が上がるとは限らない。"
- options:
  1. "にしても" (4자)
  2. [정답] "としても" (4자)
  3. "からしても" (5자)
  4. "としたら" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (4 vs avg 4.3)
---
### Q-a0560a42-9f26-407f-840d-5a01af1eef2a
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "次の文で文法的に正しいものはどれですか？"
- options:
  1. "経験が増えたにしたがって、仕事が楽になった。" (22자)
  2. "経験が増えるのにしたがって、仕事が楽になった。" (23자)
  3. "経験が増えますにしたがって、仕事が楽になった。" (23자)
  4. [정답] "経験が増えるにしたがって、仕事が楽になった。" (22자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (22 vs avg 22.5)
---
### Q-d6681821-d53b-45c7-a415-d31ce1319523
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "ユーザー数の増加（　）、サーバーの増強が必要となった。"
- options:
  1. "に関して" (4자)
  2. "に対して" (4자)
  3. [정답] "に伴い" (3자)
  4. "に基づき" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.8)
---
### Q-82d607a5-3e5c-4594-8e23-7ff980a6d84f
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "テストが完了し（　）、結果をご報告いたします。"
- options:
  1. [정답] "次第" (2자)
  2. "上で" (2자)
  3. "からには" (4자)
  4. "限り" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **B5** (Medium): correct is shortest (2 vs avg 2.5)
---
### Q-b3501caa-13aa-4794-b6e8-e150d58e6584
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "次の文で文法的に正しいものはどれですか？"
- options:
  1. "契約します上で、注意すべき点がいくつかあります。" (24자)
  2. "契約した上で、注意すべき点がいくつかあります。" (23자)
  3. [정답] "契約する上で、注意すべき点がいくつかあります。" (23자)
  4. "契約して上で、注意すべき点がいくつかあります。" (23자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (23 vs avg 23.3)
---
### Q-f1ce8ae9-c522-421f-98f3-381bdfeccaa7
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "セキュリティに関しては、一瞬（　）油断してはならない。"
- options:
  1. "でさえ" (3자)
  2. "ばかり" (3자)
  3. [정답] "たりとも" (4자)
  4. "だけでも" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-374d1e0a-22b7-44d9-9d1e-3fef2733f755
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "サーバー障害により、システムの全面停止を（　）。"
- options:
  1. "禁じ得ない" (5자)
  2. [정답] "余儀なくされた" (7자)
  3. "ものともしなかった" (9자)
  4. "限りではなかった" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.80x (max=9, min=5)
---
### Q-fe775f05-0118-4c5e-b4b6-9ca2558f3bae
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "クライアント（　）、納期の延長は受け入れがたいだろう。"
- options:
  1. "としたら" (4자)
  2. "にとって" (4자)
  3. [정답] "にしてみれば" (6자)
  4. "からすると" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (6 vs avg 4.8)
---
### Q-6ba85a64-8517-445a-b349-b394e0b372c5
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "このプロジェクトの成功は、チーム全員の努力の結果（　）。"
- options:
  1. "に限らない" (5자)
  2. "に過ぎない" (5자)
  3. [정답] "にほかならない" (7자)
  4. "に相違ない" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (7 vs avg 5.5)
---
### Q-f5d8e98f-9328-40de-8ac0-d1770ef4124b
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5, A2-exempt]
- question_text: "「数々の困難をものともせず、プロジェクトを完成させた。」の「をものともせず」は何を表しますか？"
- options:
  1. [정답] "～をものともせず" (8자)
  2. "～をもとに" (5자)
  3. "～をきっかけに" (7자)
  4. "～をはじめとして" (8자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.60x (max=8, min=5)
  - **B5** (Medium): correct is longest (8 vs avg 7.0)
  - **A2-exempt** (Info): exempt (何を表), bigram overlap 86%
---
### Q-f6b1748e-43eb-4d07-adec-e007e5326013
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "次の文で文法的に正しいものはどれですか？"
- options:
  1. "皆様のご成功を願いてやみません。" (16자)
  2. "皆様のご成功を願うてやみません。" (16자)
  3. [정답] "皆様のご成功を願ってやみません。" (16자)
  4. "皆様のご成功を願ったてやみません。" (17자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (16 vs avg 16.3)
---
### Q-5875bc4e-7f34-445b-894b-3990e85b91ef
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「家に帰るなり、倒れてしまった。」の「〜なり」の意味は？"
- options:
  1. "～なり（選択）" (7자)
  2. [정답] "～するなり（即座に）" (10자)
  3. "～しながら（同時）" (9자)
  4. "～した結果（結果）" (9자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (10 vs avg 8.8)
---
### Q-29d6e27f-c84f-4c2d-adf7-02f7dd72e1ff
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "チームメンバー（　）プロジェクトの成功だと実感しています。"
- options:
  1. "による" (3자)
  2. [정답] "あっての" (4자)
  3. "としての" (4자)
  4. "にとっての" (5자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
---
### Q-30310285-4115-4ef5-8647-60c7f0e5f354
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "あの映画のラストシーンには、涙を流さ（　）いられなかった。"
- options:
  1. "ないでは" (4자)
  2. [정답] "ずには" (3자)
  3. "なくては" (4자)
  4. "ないには" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.8)
---
### Q-11118032-215d-44cd-a088-fc35672f7e1c
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B6]
- question_text: "わたしは　にほんご（　）べんきょうしています。えいご（　）べんきょうしています。"
- options:
  1. "を / を" (5자)
  2. [정답] "も / も" (5자)
  3. "は / は" (5자)
  4. "が / が" (5자)
- 자동감지 근거:
  - **B6** (Medium): slash in option: "を / を"
---
### Q-7a89b707-a9e3-4f94-b451-3b5359f9af9d
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "ともだちが　わたしに　ほんを（　）。"
- options:
  1. "あげました" (5자)
  2. "もらいました" (6자)
  3. [정답] "くれました" (5자)
  4. "やりました" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (5 vs avg 5.3)
---
### Q-5699560f-e460-4cc1-8f05-43c271a378e6
- quiz_id: b0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N5
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "A：「もう宿題をしましたか。」 B：「いいえ、（　）。」"
- options:
  1. "もうしました" (6자)
  2. "しません" (4자)
  3. [정답] "まだしていません" (8자)
  4. "しなかったです" (7자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=8, min=4)
  - **B5** (Medium): correct is longest (8 vs avg 6.3)
---
### Q-97370b21-0b8f-4bd2-a0de-ec212f86c6ed
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "妹に漢字を教えて（　）。"
- options:
  1. "もらった" (4자)
  2. "くれた" (3자)
  3. [정답] "あげた" (3자)
  4. "やった" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-a401d65a-67e1-4f2d-a628-fc63116a9691
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "友達に荷物を持って（　）。"
- options:
  1. "あげた" (3자)
  2. [정답] "もらった" (4자)
  3. "くれた" (3자)
  4. "おいた" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.3)
---
### Q-c6543e8b-8cf7-495b-8481-cf05a5294f03
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "台風の（　）、飛行機が欠航になった。"
- options:
  1. "おかげで" (4자)
  2. [정답] "せいで" (3자)
  3. "ために" (3자)
  4. "ことで" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-fbc4c7c8-ce8c-49f7-abc9-1a163e682366
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "手伝ってくれた（　）、昼ご飯をおごりますよ。"
- options:
  1. "ついでに" (4자)
  2. [정답] "かわりに" (4자)
  3. "ために" (3자)
  4. "おかげで" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.8)
---
### Q-72034ef8-c6b9-4fea-a790-7cbc547cedfd
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "買い物に行く（　）、クリーニングも出してきてくれない？"
- options:
  1. "かわりに" (4자)
  2. "ために" (3자)
  3. [정답] "ついでに" (4자)
  4. "ながら" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-52dd9101-2702-4ac1-a4d7-2f9b2d07ac8d
- quiz_id: b0000004-0000-0000-0000-000000000004
- question_category: grammar, difficulty: N2
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "あの店は外観（　）高級そうだ。"
- options:
  1. "にして" (3자)
  2. [정답] "からして" (4자)
  3. "として" (3자)
  4. "にとって" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (4 vs avg 3.5)
---
### Q-3a81ecc1-6d3b-421c-bbcf-e4cca6568a49
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "社長（　）人が、そんな初歩的なミスをするとは信じられない。"
- options:
  1. [정답] "ともあろう" (5자)
  2. "ともなると" (5자)
  3. "としての" (4자)
  4. "にあたる" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.5)
---
### Q-43083591-6158-4674-ac27-185596d2c84e
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "日本に来て（　）、毎日が新しい発見の連続だ。"
- options:
  1. "からには" (4자)
  2. [정답] "からというもの" (7자)
  3. "てはじめて" (5자)
  4. "たとたん" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.75x (max=7, min=4)
  - **B5** (Medium): correct is longest (7 vs avg 5.0)
---
### Q-1f3d809e-f3cd-45f0-9a08-40413d6e821e
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "教師に（　）行為として、厳しく批判された。"
- options:
  1. "あるべき" (4자)
  2. [정답] "あるまじき" (5자)
  3. "あらざる" (4자)
  4. "ありえない" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.5)
---
### Q-6bb74860-f85f-448f-9a97-1f2c228c62c7
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "あの政治家の発言は無責任（　）。"
- options:
  1. "きわまる" (4자)
  2. [정답] "極まりない" (5자)
  3. "この上ない" (5자)
  4. "に堪えない" (5자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (5 vs avg 4.8)
---
### Q-bf4ed9ed-ad26-4ca1-bcef-d6b8754c116e
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "まさか彼が辞職する（　）、誰も予想していなかった。"
- options:
  1. [정답] "とは" (2자)
  2. "ものを" (3자)
  3. "ことに" (3자)
  4. "ところを" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **B5** (Medium): correct is shortest (2 vs avg 3.0)
---
### Q-b0d9f3a8-b38d-40d0-b651-9f4dd7da0cb6
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "会議の資料は明日までに（　）ならない。"
- options:
  1. "準備しても" (5자)
  2. [정답] "準備しなければ" (7자)
  3. "準備しないで" (6자)
  4. "準備しようと" (6자)
- 자동감지 근거:
  - **B5** (Medium): correct is longest (7 vs avg 6.0)
---
### Q-8357953a-9754-4dc8-be17-cff9acf35c5c
- quiz_id: b0000005-0000-0000-0000-000000000005
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「プロジェクトリーダーともなると、技術力だけでなくマネジメント力も求められる。」の「ともなると」は何を表しますか？"
- options:
  1. "譲歩" (2자)
  2. "結果" (2자)
  3. "相反する" (4자)
  4. [정답] "当然" (2자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 2.00x (max=4, min=2)
  - **B5** (Medium): correct is shortest (2 vs avg 2.5)
---
### Q-59eaa01c-8204-4484-b7d1-c0893e37d0b4
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5, B5]
- question_text: "「彼は英語（　）、フランス語も話せる。」追加を表す正しいものはどれですか？"
- options:
  1. "ばかり" (3자)
  2. "だけあって" (5자)
  3. [정답] "のみならず" (5자)
  4. "からして" (4자)
- 자동감지 근거:
  - **B5** (Medium): length ratio 1.67x (max=5, min=3)
  - **B5** (Medium): correct is longest (5 vs avg 4.3)
---
### Q-4b4711f2-c9bd-4b05-b7cf-d65ac688519b
- quiz_id: b0000003-0000-0000-0000-000000000003
- question_category: grammar, difficulty: N3
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "彼は毎日練習しているから、上手な（　）です。"
- options:
  1. "ところ" (3자)
  2. "もの" (2자)
  3. [정답] "はず" (2자)
  4. "こと" (2자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (2 vs avg 2.3)
---
### Q-87375154-2dd6-4493-8f86-63ef111afa93
- quiz_id: b0000002-0000-0000-0000-000000000002
- question_category: grammar, difficulty: N4
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "天気予報によると、明日は暑い（　）。"
- options:
  1. [정답] "そうだ" (3자)
  2. "ようだ" (3자)
  3. "みたいだ" (4자)
  4. "だろう" (3자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.3)
---
### Q-f1996abf-4a17-4e1b-b91e-c9a4c6ef8204
- quiz_id: a0000001-0000-0000-0000-000000000001
- question_category: grammar, difficulty: N1
- 클레임: 없음
- 위반 항목: [B5]
- question_text: "「プロジェクトの失敗というリスクを承知の上で、（　）未経験の最新技術を採用することに決めた。」"
- options:
  1. "せっかく" (4자)
  2. [정답] "あえて" (3자)
  3. "さすがに" (4자)
  4. "ようやく" (4자)
- 자동감지 근거:
  - **B5** (Medium): correct is shortest (3 vs avg 3.8)
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
