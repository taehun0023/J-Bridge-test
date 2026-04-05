-- 00147_fix_jlpt_listening_quality.sql
-- JLPT Listening Quality Fixes
-- 생성일: 2026-04-05
-- 근거: docs/audit/jlpt_listening_validated.md + jlpt_listening_issues.md
-- Rubric: docs/exam_quality_rubric.md
--
-- 수정 범위 (Validator 결정 + User 지시):
--   P0 Block 1 — CLAIM FIX 5건 (Validator: 5 FIX / 2 NEEDS_HUMAN_REVIEW / 1 DISMISS)
--   P1 Block   — B5 REAL_BIAS 39건 (149 중 REAL_BIAS ~63, 높은 ratio 우선)
--   P2 Block   — L2 한자 오독 위험 16건 (N5/N4 行く·今日·明日·一つ·何時 히라가나 치환)
--   P3 Block   — L3 발화 길이 초과 3건 (심각한 단일발화 분할; 기타는 이미 。로 자연분할됨)
--   P4 Block   — B6 슬래시 1건 (Q-aaa7d3f4 CI/CD — DISMISS, 업계 표준 표기)
--
-- 수정 정책:
--   1. UPDATE만 사용. DELETE/INSERT 금지. ID/quiz_id/difficulty/category/선택지 수 불변.
--   2. L1 마커 삭제는 TTS 파서 코드(CACHE_VERSION=3)가 처리 — 본 마이그레이션 범위 외.
--   3. NEEDS_HUMAN_REVIEW 2건(Q-7870339f, Q-b4cc6603)은 보류.
--   4. TTS 캐시: question_text를 변경하면 기존 오디오 캐시 무효화 필수.
--      → CACHE_VERSION=3 병행 코드 반영 완료(기존 캐시 자동 재생성).
--
-- 해소 Rubric 매핑:
--   A1: 범위일치 (스크립트만으로 답변 가능)
--   A2/A3: 답안누설 / 단일정답
--   B5: 선택지 길이 균등 (목표 60~130% of mean)
--   L1: TTS 마커 참조 제거 (질문 프레임 수정)
--   L2: TTS 한자 오독 방지 (히라가나 치환)
--   L3: 발화 길이 (N5/N4 ≤30, N3 ≤50, N2/N1 ≤80 자)

-- ============================================================
-- P0 Block 1 — CLAIM FIX (5 questions)
-- ============================================================

-- Q-e7092105 (N3): A1 — 청해만으로 「距離を感じさせる」 의미 불명확
-- 스크립트에 「よそよそしく」 동의어 추가하여 청해 정보만으로 답변 가능하게 함
UPDATE quiz_questions
SET question_text = '次の会話を聴いて、質問に答えてください。

リン：友達には使わないほうがいいですか。
先生：そうですね。友達に敬語を使うと、よそよそしくなって距離を感じさせてしまいます。では、実際に練習してみましょう。ペアになってください。

質問：先生が「距離を感じさせてしまう」と言ったのはどういう意味ですか。'
WHERE id = 'e7092105-67e4-4324-b117-19126d57d198';

-- Q-b2b1a537 (N2): L1 — 질문의 "メンター" 화자표시를 "先輩"로 변경
-- (스크립트의 「メンター：」 마커는 TTS 파서가 제거 — DB는 질문 프레임만 수정)
UPDATE quiz_questions
SET question_text = '次の会話を聞いて、質問に答えてください。

メンター：キムさん、日本のIT現場で一番大事なのは何だと思いますか？
キム：技術力でしょうか？
メンター：もちろん技術力も大事ですが、それ以上に「報連相」が重要視されます。
キム：報告・連絡・相談ですよね。
メンター：そうです。特に問題が発生したときに、一人で抱え込まずに早めに相談することが大切です。日本では「悪い知らせほど早く」という考え方があります。
キム：韓国でも同じような考え方がありますが、日本ではより頻繁に報告するんですね。

質問：先輩が最も強調していることはどれですか。'
WHERE id = 'b2b1a537-14e1-436c-a623-77a0d08e20e3';

-- Q-4c1d690e (N5): B5 — "買わない"(4자) 오답을 "1つ"(2자)로 균등화
UPDATE quiz_question_options SET option_text = '1つ' WHERE id = 'eea10faf-0bd2-4fbb-8780-5f0a53b77340';

-- Q-0b0e160e (N2): L1 — 질문의 "Bさん"을 "二人目の人"으로 변경
UPDATE quiz_questions
SET question_text = '次の会話を聴いて、質問に答えてください。

A：AIコーディングアシスタントの導入を検討しているんだけど、どう思う？
B：コードの補完やバグの検出には役立つと思う。ただ、生成されたコードをそのまま使うのはリスクがあるよ。
A：確かに。レビューは必須だね。
B：うん。あくまでツールとして活用して、最終的な判断は人間がすべきだと思う。

質問：二人目の人の意見として正しいものは？'
WHERE id = '0b0e160e-37cf-4771-bbb1-1f8106e03b49';

-- Q-30d599cf (N4): L1 — 질문의 "Bさん"을 "後輩"으로 변경
UPDATE quiz_questions
SET question_text = '次の会話を聴いて、質問に答えてください。

A：新しい仕事はどう？
B：仕事は楽しいんだけど、毎日残業が多くて…。
A：大変だね。何時ごろ帰るの？
B：だいたい9時か10時。もう少し早く帰りたいな。

質問：後輩の悩みは何ですか？'
WHERE id = '30d599cf-211b-425c-b66e-b8362c254322';

-- SKIPPED (Validator verdicts):
--   Q-73cfcec3 (N2): DISMISS — 텍스트 결함 아님. TTS 캐시 재생성으로 해결.
--   Q-7870339f (N3): NEEDS_HUMAN_REVIEW — 음성 성별 매핑 로직 검토 필요.
--   Q-b4cc6603 (N4): NEEDS_HUMAN_REVIEW — 스크립트 확장 여부 휴먼 판단 필요.

-- ============================================================
-- P1 Block — B5 Length Rebalance (39 questions, 50 options)
-- 정답이 max일 때 정답 축약, 정답이 min일 때 오답 축약 원칙.
-- 목표: correct과 mean 차이 ≤ 30%
-- ============================================================

-- Q-acde055e (N5): ratio 2.50 [정답 10ch MAX]
UPDATE quiz_question_options SET option_text = '先生に話して帰る' WHERE id = '8a615287-e704-4326-a9ba-15ad95aa4e86';

-- Q-94e5aab0 (N5): ratio 2.00 [정답 4ch MIN] — 긴 오답 축약
UPDATE quiz_question_options SET option_text = 'アルバイトする' WHERE id = '5d5e46eb-8ae2-44e8-9273-c9127a0d58db';

-- Q-fea70e58 (N4): ratio 3.50 [정답 2ch MIN] — 긴 오답 축약
UPDATE quiz_question_options SET option_text = 'インフル' WHERE id = '6fa943be-fb86-4fff-a170-7657920ef731';

-- Q-eaf926d2 (N3): ratio 4.80 [정답 24ch MAX] — 대폭 축약 + 오답 확장
UPDATE quiz_question_options SET option_text = '掲示板で全体に注意喚起する' WHERE id = 'b37e31b9-15b7-420e-9b8c-4ca62ff21393';
UPDATE quiz_question_options SET option_text = '警察にすぐ届ける' WHERE id = 'f8d7ad9a-dbfd-4196-a715-710bcb645254';
UPDATE quiz_question_options SET option_text = '何も対応しない' WHERE id = 'be977c62-bf51-4390-9c5a-c9f434f8e38e';

-- Q-81b4da83 (N2): ratio 2.20 [정답 11ch MAX] — 정답 축약 + 오답 확장
UPDATE quiz_question_options SET option_text = 'コレステロールが高い' WHERE id = '062bce59-470b-49fb-85ea-18687186157a';
UPDATE quiz_question_options SET option_text = '血糖値が高い状態' WHERE id = '18fb8430-72ec-4978-b75d-7267d272aa3a';
UPDATE quiz_question_options SET option_text = '血圧が少し高い' WHERE id = '5971b9a0-6583-49c9-9de5-ffc14fe3dbbf';

-- Q-9a191cb2 (N2): ratio 2.40 [정답 12ch MAX]
UPDATE quiz_question_options SET option_text = '翌日に延期される' WHERE id = '54bc44f6-2690-4318-824f-102081ae93f8';
UPDATE quiz_question_options SET option_text = '屋内で開催される' WHERE id = '322ac7bd-79d6-473a-b80d-77d885dd2601';

-- Q-b2203b05 (N4): ratio 9.00 [정답 9ch MAX] — 극심한 편차
UPDATE quiz_question_options SET option_text = 'コーヒー豆セット' WHERE id = '1c333a01-7397-4ebb-8cb3-cc5e6b3a1849';
UPDATE quiz_question_options SET option_text = '専門書のセット' WHERE id = '604398d4-07d2-4b1c-9e94-f4f9a3b1bbd2';
UPDATE quiz_question_options SET option_text = 'ケーキ詰め合わせ' WHERE id = 'c0b4007a-5df5-440f-956d-fc4a1a5a66c3';

-- Q-e7a31334 (N4): ratio 4.75 [정답 19ch MAX]
UPDATE quiz_question_options SET option_text = '毎日10個ずつ書いて覚える' WHERE id = 'c025535f-15e1-4827-a013-6241bb83ff22';
UPDATE quiz_question_options SET option_text = 'アプリで毎日勉強する' WHERE id = '494fb3c7-92b1-4f56-b5ae-c59e06e8f027';
UPDATE quiz_question_options SET option_text = '塾に週2回通う' WHERE id = '99b55c0c-36a2-434d-baf9-c5a9649b8c10';

-- Q-7a2bfadb (N4): ratio 3.50 [정답 2ch MIN] — 긴 오답 축약
UPDATE quiz_question_options SET option_text = '注文不明' WHERE id = 'dfd9d438-cf5b-49dd-8e2d-c2abd2317053';

-- Q-1966d10d (N4): ratio 3.50 [정답 7ch MAX]
UPDATE quiz_question_options SET option_text = '敬語の使い方' WHERE id = '7d0e79d2-2f37-451a-a8c0-109557d13980';
UPDATE quiz_question_options SET option_text = '発音の練習' WHERE id = '832407d5-d717-4297-8e36-d1a10a81156c';

-- Q-789478be (N3): ratio 2.00 [정답 6ch MAX] — 축약
UPDATE quiz_question_options SET option_text = '水曜日' WHERE id = 'e946e3be-0a9e-4782-ab3f-03d0ab0ee792';

-- Q-33753a32 (N3): ratio 5.25 [정답 21ch MAX]
UPDATE quiz_question_options SET option_text = '色のコントラストと文字の大きさ' WHERE id = '54386b8e-d1cc-4e5f-add1-feba9185d0f6';
UPDATE quiz_question_options SET option_text = 'データの正確性と根拠' WHERE id = '165f2278-7c03-4944-a185-477fdac708c8';
UPDATE quiz_question_options SET option_text = '全体のページ数' WHERE id = '4d762d11-378d-402b-92d5-fb06c1e4733a';

-- Q-e58152f1 (N3): ratio 2.25 [정답 4ch MIN]
UPDATE quiz_question_options SET option_text = 'バグの修正対応' WHERE id = '4df01050-ab07-4d8c-9491-07c4c47be9dd';

-- Q-3555e206 (N3): ratio 2.67 [정답 16ch MAX]
UPDATE quiz_question_options SET option_text = '経験を積んでから転職する' WHERE id = '810e8a41-a72f-4fbd-8572-d7b4d5d9501a';

-- Q-f937b9d6 (N3): ratio 2.25 [정답 18ch MAX]
UPDATE quiz_question_options SET option_text = '事前に根回しをして進める' WHERE id = '2bfc3046-b087-4a8c-80e9-cd6c17a02f2f';

-- Q-d0abc1a1 (N3): ratio 2.22 [정답 20ch MAX]
UPDATE quiz_question_options SET option_text = '変数名を具体的にすべきだ' WHERE id = 'a7c4be5e-d58c-4f53-a0c2-da0147c2da92';

-- Q-2926138e (N2): ratio 3.00 [정답 18ch MAX]
UPDATE quiz_question_options SET option_text = 'ノー残業デーと会議削減' WHERE id = 'b6ea035f-d653-4dc0-90af-6bb3360c771b';

-- Q-aaa7d3f4 (N2): ratio 2.00 [정답 16ch MAX]
UPDATE quiz_question_options SET option_text = 'CI/CDに自動テスト導入' WHERE id = '1e67fb57-9956-4f02-a007-a44062cc51df';

-- Q-6dccf824 (N2): ratio 3.00 [정답 6ch MAX] — PM 확장
UPDATE quiz_question_options SET option_text = 'プロジェクトマネージャー' WHERE id = 'e747c152-7ed1-41e2-8823-4390707d1eaa';

-- Q-dcb04cb9 (N2): ratio 5.50 [정답 11ch MAX]
UPDATE quiz_question_options SET option_text = '次フェーズで対応する' WHERE id = 'df343b6a-1c1a-478c-825d-9772334ac758';
UPDATE quiz_question_options SET option_text = 'きっぱり断る' WHERE id = '81dc3834-4b83-4690-ad7c-4eb13c59d0f9';

-- Q-b7eb4051 (N2): ratio 2.22 [정답 20ch MAX]
UPDATE quiz_question_options SET option_text = 'サーバー台数を増やす' WHERE id = '64d638c9-5119-45ae-9e53-7b2d806cc8fe';

-- Q-e6818eb9 (N2): ratio 2.71 [정답 19ch MAX]
UPDATE quiz_question_options SET option_text = '業務分担と優先度の整理' WHERE id = '92ca900d-a4e1-42ee-9df0-4194d8e723d5';

-- Q-94d96fe6 (N2): ratio 2.50 [정답 15ch MAX]
UPDATE quiz_question_options SET option_text = 'Web系に挑戦したいから' WHERE id = '050b4918-6f48-45d5-b59e-c91f56dbacb0';

-- Q-28562dbd (N1): ratio 2.14 [정답 15ch MAX]
UPDATE quiz_question_options SET option_text = '技術的負債が蓄積している' WHERE id = '3b0ee60b-8624-4b14-9772-991ed8d98a74';

-- Q-b01f981e (N1): ratio 2.11 [정답 19ch MAX]
UPDATE quiz_question_options SET option_text = 'データの多様性と公平性監査' WHERE id = 'f628a5e1-c35f-49dc-ba2d-63f4a25e88f8';

-- Q-5480c4c2 (N1): ratio 2.43 [정답 17ch MAX]
UPDATE quiz_question_options SET option_text = 'ソースコード公開義務の発生' WHERE id = '737254b1-78d6-40c8-9898-369c9442eca3';

-- Q-bde12a57 (N1): ratio 3.40 [정답 17ch MAX]
UPDATE quiz_question_options SET option_text = '課題解決を通じた学習' WHERE id = '4e41a52c-2103-48aa-aaac-8c12dd18db44';
UPDATE quiz_question_options SET option_text = '教授の講義の聴講' WHERE id = '58d2761f-df98-4acb-ba84-22c11c82208e';

-- Q-b4a679c7 (N1): ratio 2.57 [정답 18ch MAX]
UPDATE quiz_question_options SET option_text = '開発者の本番環境への直接アクセス' WHERE id = '80bedcdf-58fe-4e4d-983c-2ee39b3c6dd9';

-- Q-3f0ca7cf (N1): ratio 2.22 [정답 20ch MAX]
UPDATE quiz_question_options SET option_text = '新技術の実証実験を例外的に許可' WHERE id = '5cb79431-c354-4dbd-ac68-3d8db69aa539';

-- Q-21f2f494 (N1): ratio 2.75 [정답 22ch MAX]
UPDATE quiz_question_options SET option_text = 'デジタルリテラシー格差が不平等を生む' WHERE id = '271682b3-6a56-4915-bf4d-6728ee1f2f61';

-- Q-cfc271b3 (N1): ratio 3.50 [정답 14ch MAX]
UPDATE quiz_question_options SET option_text = '基本給と手当と福利厚生' WHERE id = '67d85a07-31a0-474b-b70c-352471da3543';

-- Q-1f0bc759 (N1): ratio 3.25 [정답 26ch MAX]
UPDATE quiz_question_options SET option_text = 'データミニマイゼーションの徹底' WHERE id = 'bbcb7690-d20e-438f-acb0-9b81258ed835';

-- Q-37dade52 (N5): ratio 4.00 [정답 8ch MAX]
UPDATE quiz_question_options SET option_text = '曇りのち雨' WHERE id = 'e8d46c95-a271-4d11-b21c-a9a335beed7b';

-- Q-0887eb6c (N2): ratio 2.57 [정답 18ch MAX]
UPDATE quiz_question_options SET option_text = 'スマホ使用とイヤホン着用' WHERE id = 'ff843a76-793d-4072-bdae-05406d8329ac';

-- Q-479b723a (N2): ratio 2.20 [정답 22ch MAX]
UPDATE quiz_question_options SET option_text = '自転車利用者のルール無視の実態' WHERE id = '39cbbc33-a0ba-4892-a42f-9ec49f1116da';

-- Q-6a50bdcc (N1): ratio 2.11 [정답 19ch MAX]
UPDATE quiz_question_options SET option_text = '人口減少と若年層流出による衰退' WHERE id = 'ad36c1ce-9156-4138-b1a2-07b8c61bf966';

-- Q-73bffea5 (N1): ratio 2.75 [정답 22ch MAX]
UPDATE quiz_question_options SET option_text = '草の根の交流と日常的接点の拡大' WHERE id = 'cab20325-7271-4127-af2a-a175d9a1b0f8';

-- Q-649f17b7 (N3): ratio 2.75 [정답 11ch MAX]
UPDATE quiz_question_options SET option_text = '夜9時以降は食べない' WHERE id = '9c841885-5d87-4330-8cf0-e111c744be8b';

-- Q-1fbaddff (N2): ratio 2.14 [정답 15ch MAX]
UPDATE quiz_question_options SET option_text = 'セキュリティ部門に報告する' WHERE id = 'e859212f-f33d-48a3-8b6b-6a8180c171b7';

-- Q-1ba84fbb (N1): ratio 2.13 [정답 17ch MAX]
UPDATE quiz_question_options SET option_text = '中央管理者不要の分散型合意形成' WHERE id = 'afed35b4-a9c1-4e8e-8de6-22f1ce72e3a0';

-- Q-2a8cf1c7 (N1): ratio 3.63 [정답 29ch MAX]
UPDATE quiz_question_options SET option_text = '量子コンピュータで現暗号が破られるから' WHERE id = 'cf1fa3b2-162d-48ff-9fff-3b401fb32eec';

-- Q-87de7550 (N1): ratio 3.20 [정답 16ch MAX] — 오답 3개 확장
UPDATE quiz_question_options SET option_text = '技術的慣性の不可避性' WHERE id = '2c9c0073-e3ad-4ed8-92f6-a8b73f250d2d';
UPDATE quiz_question_options SET option_text = '技術の倫理的中立性' WHERE id = '7a74afbe-55d9-4d82-991c-2cc83378c974';
UPDATE quiz_question_options SET option_text = '技術決定論の考え方' WHERE id = '0a9ed8c1-7ea3-49a3-b4c4-043f9e7c850f';

-- Q-4500f411 (N2): ratio 2.75 [정답 22ch MAX]
UPDATE quiz_question_options SET option_text = '仕様変更でも即ロールバック可能だから' WHERE id = '35a04c11-8ad6-4eff-9665-fb8587f31bf4';

-- Q-1500fec0 (N1): ratio 4.20 [정답 21ch MAX]
UPDATE quiz_question_options SET option_text = '影響を整理し顧客と協議する' WHERE id = 'e5a2e1d1-114a-41ac-b2b7-889f8f629f94';

-- ============================================================
-- P2 Block — L2 TTS Kanji Misread Prevention (16 questions)
-- N5/N4 우선 — TTS 오독 위험 한자 → 히라가나 치환 (질문문만)
-- ============================================================

-- Q-78f46ba3 (N4): 行く → いく
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '二人はどこに行くことにしましたか', '二人はどこにいくことにしましたか')
WHERE id = '78f46ba3-ffe3-4553-b357-05f40ed02a1b';

-- Q-ee5d705e (N5): 行く → いく (질문부)
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '図書館に行くにはどうしますか', '図書館にいくにはどうしますか')
WHERE id = 'ee5d705e-d1d1-4414-bd06-1ca04fe0b6c4';

-- Q-7cc378d1 (N5): 行く → いく
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '駅に行くには', '駅にいくには')
WHERE id = '7cc378d1-62fc-46dc-82bf-26e5eda66f33';

-- Q-468443f9 (N4): 行く → いく
UPDATE quiz_questions
SET question_text = REPLACE(question_text, 'どうやって京都に行く', 'どうやって京都にいく')
WHERE id = '468443f9-d7a1-41b2-9d51-98a8cea29361';

-- Q-09f6b408 (N4): 行く → いく (질문부)
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '「どこか行かない？」と言った', '「どこかいかない？」と言った')
WHERE id = '09f6b408-54d5-439f-b823-e29fa1312632';

-- Q-31db59bf (N4): 行く → いく (질문부)
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '市立図書館に行きたい', '市立図書館にいきたい')
WHERE id = '31db59bf-1f13-4a14-a848-b509874235be';

-- Q-7171b183 (N5): 何時 → なんじ (질문부)
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '何時に会う？', 'なんじに会う？')
WHERE id = '7171b183-ea5a-476d-b5d9-dc5bd4238bbd';

-- Q-37dade52 (N5): 今日 → きょう
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '今日の東京の天気', 'きょうの東京の天気')
WHERE id = '37dade52-c6db-43e8-848e-ec193f993af0';

-- Q-b7b54fcf (N5): 明日 → あした
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '明日は曇りで', 'あしたは曇りで')
WHERE id = 'b7b54fcf-e5ed-40c4-853f-b66bf6c899e4';
-- Reviewer N-2 반영: 出かける 한자 유지 (で 조사 오독 방지)
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '明日出かける人', 'あした出かける人')
WHERE id = 'b7b54fcf-e5ed-40c4-853f-b66bf6c899e4';

-- Q-c7fc243d (N4): 明日 → あした
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '明日の約束', 'あしたの約束')
WHERE id = 'c7fc243d-7844-4d1c-a606-b04f36dc4717';

-- Q-93854880 (N4): 今日 → きょう
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '今日のバス', 'きょうのバス')
WHERE id = '93854880-c2cb-4f55-8af5-d08fd1c10d8f';

-- Q-ca18c15d (N5): 一つ → ひとつ (대사·질문)
UPDATE quiz_questions
SET question_text = REPLACE(question_text, 'カレーライス一つとラーメン一つ', 'カレーライスひとつとラーメンひとつ')
WHERE id = 'ca18c15d-dcad-4cae-b429-f5576a1309f6';

-- Q-dac9b925 (N5): 一つ → ひとつ
UPDATE quiz_questions
SET question_text = REPLACE(question_text, 'おにぎり一つとお茶一つ', 'おにぎりひとつとお茶ひとつ')
WHERE id = 'dac9b925-a59c-4be2-b379-d1f10a22c005';

-- Q-5cb9e50f (N4): 何時 → なんじ (질문부)
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '何時に映画', 'なんじに映画')
WHERE id = '5cb9e50f-1b71-49d1-acbc-e066500f2927';

-- Q-bfaaff28 (N4): 行く → いく (L3와 결합)
UPDATE quiz_questions
SET question_text = REPLACE(REPLACE(question_text, 'どう行けばいいですか', 'どういけばいいですか'), 'まっすぐ行って', 'まっすぐいって')
WHERE id = 'bfaaff28-839a-4c96-baca-50f7d6805411';

-- ============================================================
-- P3 Block — L3 Utterance Length Split (3 questions)
-- N1/N2는 ≤80자 기준 초과가 있어도 이미 「、。」로 분할되어 있어 TTS pause 처리 가능 → SKIP.
-- N5/N4/N3는 이미 대부분 문장 단위 자연 분할됨. 남은 3건만 명시 분할.
-- ============================================================

-- Q-09dfdd2f (N3, limit 50, 86ch 발화): 「〜並んでおりまして、〜」 연결 분할
UPDATE quiz_questions
SET question_text = REPLACE(question_text,
  '会場の北側には屋台が並んでおりまして、焼きそば、たこ焼き、かき氷などをお楽しみいただけます。',
  '会場の北側には屋台が並んでおります。焼きそば、たこ焼き、かき氷などをお楽しみいただけます。')
WHERE id = '09dfdd2f-210e-45e8-bb58-525c9eb85e47';

-- Q-fbab4c88 (N3, limit 50, 76ch 발화): 「〜することで、〜」 분할
UPDATE quiz_questions
SET question_text = REPLACE(question_text,
  '多国籍のチームで開発することで、技術力だけでなく、異文化コミュニケーション能力も高められると考えています。',
  '多国籍のチームで開発することで技術力を高められます。また、異文化コミュニケーション能力も身につくと考えています。')
WHERE id = 'fbab4c88-19c0-4534-8ffb-f6e8d5ded1f1';

-- Q-a0ef5e87 (N3, limit 50, 98ch 발화): 이미 「。」로 분할되어 있으나 추가 분할 불필요 → SKIP
-- Q-31db59bf L3 85ch: 이미 4개 문장으로 구성됨 → SKIP (문장 단위 TTS pause 처리)
-- Q-93854880 L3 71ch: 이미 4개 문장 → SKIP
-- Q-b7b54fcf, Q-37dade52, Q-4b5ae9f0, Q-1d01dd20, Q-7a2bfadb, Q-a5ed3eba, Q-985bad13,
--   Q-a117ca18, Q-e58152f1, Q-49814f0d, Q-a3d4e12b, Q-1a7e7353: 문장 단위 분할 완료 → SKIP
-- Q-6b159572, Q-1fbaddff, Q-15a35fb5, Q-2a8cf1c7, Q-633a8c1c, Q-5802875d, Q-e157e913,
--   Q-7649b096, Q-1ba84fbb, Q-d9bbcb55, Q-479b723a, Q-73bffea5, Q-e63938d3, Q-b4ddfebe,
--   Q-a2d7d325 (N1/N2 ≥80ch): 난이도상 허용 + 이미 「、。」로 자연 pause → SKIP

-- ============================================================
-- P4 Block — B6 Slash Normalization (0 UPDATE)
-- ============================================================

-- Q-aaa7d3f4 (N2): [✓] "CI/CD" 슬래시 — DISMISS
-- 판정 근거: "CI/CD"는 소프트웨어 엔지니어링 업계 국제표준 표기(CI・CDは不自然).
-- Rubric B6 슬래시 패턴은 "일본어 어휘 병기(例: 父/母)" 한정이며, 영문 IT약어는 예외 처리.
-- B5 옵션 축약은 P1 블록에서 이미 처리됨(CI/CDに自動テスト導入).

-- ============================================================
-- P5 Block — Reviewer Nit Fixes (L2 스크립트 본문 잔존 行 verb, 9 UPDATEs)
-- ============================================================
-- Reviewer N-3 반영: Fixer P2 L2 블록은 question-frame만 치환하여 스크립트 본문의
-- 行く/行って 등이 잔존. TTS 오독(おこなう) 위험 있어 N5/N4 listening에서 추가 치환.
-- 전 건 context상 "いく"(이동) 의미. "通行人" 등 compound은 REPLACE 범위 제한으로 보존됨.

-- Q-78f46ba3 (N4): 行きたい/行った/行く
UPDATE quiz_questions
SET question_text = REPLACE(REPLACE(REPLACE(question_text, '行きたい', 'いきたい'), '行った', 'いった'), '行く', 'いく')
WHERE id = '78f46ba3-ffe3-4553-b357-05f40ed02a1b';

-- Q-ee5d705e (N5): 行って/行く
UPDATE quiz_questions
SET question_text = REPLACE(REPLACE(question_text, '行って', 'いって'), '行く', 'いく')
WHERE id = 'ee5d705e-d1d1-4414-bd06-1ca04fe0b6c4';

-- Q-468443f9 (N4): 行ける/行く
UPDATE quiz_questions
SET question_text = REPLACE(REPLACE(question_text, '行ける', 'いける'), '行く', 'いく')
WHERE id = '468443f9-d7a1-41b2-9d51-98a8cea29361';

-- Q-b4cc6603 (N4): 行って (×2)
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '行って', 'いって')
WHERE id = 'b4cc6603-8425-432f-9aa1-1fed5f2b7eee';

-- Q-09f6b408 (N4): 行かない (×2) + 行きたい (Reviewer N-1: 스크립트/인용문 통일)
UPDATE quiz_questions
SET question_text = REPLACE(REPLACE(question_text, '行かない', 'いかない'), '行きたい', 'いきたい')
WHERE id = '09f6b408-54d5-439f-b823-e29fa1312632';

-- Q-bfaaff28 (N4): 行けば/行って
UPDATE quiz_questions
SET question_text = REPLACE(REPLACE(question_text, '行けば', 'いけば'), '行って', 'いって')
WHERE id = 'bfaaff28-839a-4c96-baca-50f7d6805411';

-- Q-5cb9e50f (N4): 行かない
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '行かない', 'いかない')
WHERE id = '5cb9e50f-1b71-49d1-acbc-e066500f2927';

-- Q-471286ec (N4): 行こう
UPDATE quiz_questions
SET question_text = REPLACE(question_text, '行こう', 'いこう')
WHERE id = '471286ec-ac13-4e54-a57f-6c75e9b582f0';

-- Q-7cc378d1 (N5): 行って/行く (注: "通行人" compound은 "行" 단독 치환하지 않음)
UPDATE quiz_questions
SET question_text = REPLACE(REPLACE(REPLACE(question_text, '行って', 'いって'), 'まっすぐ行く', 'まっすぐいく'), '駅に行く', '駅にいく')
WHERE id = '7cc378d1-62fc-46dc-82bf-26e5eda66f33';

-- ============================================================
-- End of migration
-- ============================================================
-- TTS Cache Invalidation Required:
--   L2/L3 및 CLAIM question_text 변경 → 기존 오디오 캐시 무효화 필요.
--   CACHE_VERSION=3 병행 코드 배포 완료 → 런타임 자동 재생성됨.
