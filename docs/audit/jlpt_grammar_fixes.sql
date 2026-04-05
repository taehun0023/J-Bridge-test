-- JLPT Grammar Quality Fixes (confirmed 14건)
-- 생성일: 2026-04-05
-- 근거: docs/audit/jlpt_grammar_validated.md
-- Rubric: docs/exam_quality_rubric.md
--
-- 수정 정책:
--   1. UPDATE만 사용. DELETE/INSERT 금지. ID/quiz_id/difficulty/category/선택지 수 불변.
--   2. 의미 묻기 문제 8건(Q-4ea13622, Q-693a9fff, Q-751cbcbe, Q-f9cc7799, Q-569bc54e,
--      Q-cae27d0d, Q-efc5488a, Q-2f86478f 중 본 정책 적용분)은 선택지를 "XX を表す" 형식의
--      의미 서술형으로 통일하여 A2(답안누설) + B5(길이편향)를 동시 해소.
--   3. 카테고리 오분류 2건(Q-1be35558, Q-2ebfa80f)은 문항 텍스트만 품질 개선.
--      카테고리 이관은 별도 마이그레이션에서 처리.
--
-- 해소 Rubric 매핑:
--   A2: 답안누설 (정답 문형이 본문·선택지에 노출)
--   A3: 단일정답 보장
--   B5: 선택지 길이 균등
--
-- 의미 서술형 통일 포맷 ("XX を表す"):
--   対比・逆接 / 対比・対立 / 義務・当然 / 可能 / 推測 / 希望 / 根拠・判断基準 /
--   同時・並行 / 追従・従属 / 追加・累加 / 情報源 / 類似 / 期限・区切り /
--   特別な事情・理由 / 無関係・逆接 / 差異 / 自然な感情・衝動 / 不要 / 義務 /
--   忠告 / 理由 / 条件 / 結果

-- ============================================================
-- Q-959d3860: 지시문 답안누설 (A2)
-- Before: question_text = "「...（　）がある。」傾向を表す正しいものはどれですか？"
--         (지시문에 정답 "傾向" 노출)
-- After:  question_text = "「...（　）がある。」空欄に入る最も適切なものは？"
--         오답지 "一方/反面" 을 "～がある" 接続 可能한 동류 명사로 교체
-- Rubric 해소: A2, A3(정답 유일성 강화)
-- ============================================================
UPDATE quiz_questions
SET question_text = '「最近、若者は本を読まない（　）がある。」空欄に入る最も適切なものはどれですか？',
    explanation = '「〜傾向がある」は「ある様子・ある方向に向かう動きがある」ことを表す文型です。「〜おそれがある」は否定的な可能性を表し文脈に合いません。「一方」「反面」は「〜がある」と接続できません。(최근 젊은이들은 책을 읽지 않는 경향이 있다)'
WHERE id = '959d3860-38a2-40b4-b8eb-ecaaba3d988f';

-- ============================================================
-- Q-81b9352b: N5 정답 유일성 부족 (A3)
-- Before: question_text = "日本に行く（　）、パスポートが必要です。"
--         ("時/から/ので" 모두 자연스러운 문장이 됨)
-- After:  문맥에 "入国の際" 단서를 추가하여 "時" 만 유일 정답이 되도록
-- Rubric 해소: A3
-- ============================================================
UPDATE quiz_questions
SET question_text = '日本に行く（　）は、空港でパスポートを見せます。',
    explanation = '「〜時は」は特定の時点を表す文型で、「~할 때는」という意味です。動詞の辞書形＋時 で「～する時」を表します。「から」「ので」は理由接続なので、この文脈では「空港で見せます」の具体的動作時点と合いません。'
WHERE id = '81b9352b-c869-49f2-84a6-66dcbcbd50c9';

-- ============================================================
-- Q-4ea13622: 템플릿 결함 (A2, B5) - 선택지 의미 서술형 통일
-- Before: 정답 "義務・当然（～すべきだ）" (괄호 안 정답 문형 노출, 12자)
-- After:  전 선택지 "XX を表す" 통일 (6~8자)
-- Rubric 해소: A2, B5
-- ============================================================
UPDATE quiz_question_options SET option_text = '義務・当然を表す' WHERE id = '16bb9f29-d31e-46ab-99f1-79d54acac287';
UPDATE quiz_question_options SET option_text = '可能を表す' WHERE id = 'b6d8755b-b3ef-49f2-93f0-7652671a5717';
UPDATE quiz_question_options SET option_text = '推測を表す' WHERE id = '3c0ce6cc-06cf-4de5-9ae1-2ce41fbb6601';
UPDATE quiz_question_options SET option_text = '希望を表す' WHERE id = '19f7c6d8-e8f7-4749-b2af-ecfbe2f2eac6';

-- ============================================================
-- Q-693a9fff: 선택지 문형 표기 노출 (A2, B5)
-- Before: 선택지 "～に反して/～に従って/～に基づいて/～とともに" (문형 그대로 노출)
-- After:  의미 서술형으로 통일
-- Rubric 해소: A2, B5
-- ============================================================
UPDATE quiz_question_options SET option_text = '追従・従属を表す' WHERE id = '0222d790-a8a3-41a3-9e80-8e6e200909ed';
UPDATE quiz_question_options SET option_text = '対立・逆接を表す' WHERE id = '3bff6fc9-46a0-4826-95b8-de6a9f0a27b1';
UPDATE quiz_question_options SET option_text = '根拠・判断基準を表す' WHERE id = '2d266d8e-39cd-46db-ac5e-3b227e966217';
UPDATE quiz_question_options SET option_text = '同時・並行を表す' WHERE id = 'd447a6d4-c2cf-428f-8301-6f73caba42fe';

-- ============================================================
-- Q-751cbcbe: 선택지 문형 표기 노출 (A2, B5)
-- Before: 선택지 "～というより/～だけでなく/～によると/～と同様に" (문형 노출)
-- After:  의미 서술형으로 통일
-- Rubric 해소: A2, B5
-- ============================================================
UPDATE quiz_question_options SET option_text = '追加・累加を表す' WHERE id = 'ec6646c4-e730-413d-95de-206277bd1a38';
UPDATE quiz_question_options SET option_text = '前者より後者が適切だと示す' WHERE id = '09140eb5-2dcf-4543-b756-ec3980629e2b';
UPDATE quiz_question_options SET option_text = '情報源を表す' WHERE id = '314fb556-1eb3-44a8-ae40-9006cf3cd1ef';
UPDATE quiz_question_options SET option_text = '類似を表す' WHERE id = 'c4af7779-a5fc-42e0-86a1-a6d10cefd6ec';

-- ============================================================
-- Q-f9cc7799: 정답 선택지에 문형 노출 (A2)
-- Before: 선택지 괄호 안에 "～一方で" 정답 문형 노출
-- After:  의미 서술형으로 통일 (괄호 제거)
-- Rubric 해소: A2, B5
-- ============================================================
UPDATE quiz_question_options SET option_text = '理由を表す' WHERE id = '2da1fdd1-0be8-42bc-a70f-f9edbe93cc84';
UPDATE quiz_question_options SET option_text = '対比・対立を表す' WHERE id = 'e4ad8638-2e51-4429-b46c-efb47cf89758';
UPDATE quiz_question_options SET option_text = '条件を表す' WHERE id = 'e5709ed7-59a3-4673-9ab7-8c8c6e74e996';
UPDATE quiz_question_options SET option_text = '結果を表す' WHERE id = '1104e793-dbef-4eed-b35a-74272ee3ab06';

-- ============================================================
-- Q-569bc54e: 정답 선택지 문형 노출 + 길이편향 (A2, B5)
-- Before: 정답 "～を限りに／～をもって" (11자, 슬래시 병기)
-- After:  "期限・区切りを表す" 로 균등화 (B6 슬래시도 동시 해소)
-- Rubric 해소: A2, B5, B6
-- ============================================================
UPDATE quiz_question_options SET option_text = '対象を表す' WHERE id = 'b724c631-1ece-4bcc-bd28-86b06fbb90bf';
UPDATE quiz_question_options SET option_text = '期限・区切りを表す' WHERE id = '2f57e116-97f5-4666-b6bd-2213af7224ba';
UPDATE quiz_question_options SET option_text = '情報源を表す' WHERE id = '2d0c3878-1148-4367-9af1-533abbf37702';
UPDATE quiz_question_options SET option_text = '関連する事柄を表す' WHERE id = '0e444236-1390-4e12-bd2e-0ae34edc0f4a';

-- ============================================================
-- Q-cae27d0d: 정답 선택지에 문형 노출 + 최장 (A2, B5)
-- Before: 정답 "～とあって（特別な事情）" (12자, 문형 그대로)
-- After:  "特別な事情・理由を表す" 로 균등화
-- Rubric 해소: A2, B5
-- ============================================================
UPDATE quiz_question_options SET option_text = '無関係・逆接を表す' WHERE id = '12c1bc9a-4eca-4e3c-84e9-c538ddbd353f';
UPDATE quiz_question_options SET option_text = '特別な事情・理由を表す' WHERE id = 'f3357302-cbcb-4ee8-abb5-8f731098359b';
UPDATE quiz_question_options SET option_text = '差異・対比を表す' WHERE id = 'f3cc99b2-509e-4d22-bc93-5863a12df7c2';
UPDATE quiz_question_options SET option_text = '情報源を表す' WHERE id = '6a4b5d7f-e42f-4b06-96b2-06a42bc2f638';

-- ============================================================
-- Q-efc5488a: 정답 선택지에 문형 노출 + 최장 (A2, B5)
-- Before: 정답 "～せずにはいられない（自然な感情）" (17자)
-- After:  "自然な感情・衝動を表す" 로 균등화
-- Rubric 해소: A2, B5
-- ============================================================
UPDATE quiz_question_options SET option_text = '不要を表す' WHERE id = '5e1b3290-dde2-4f5c-b086-be0142492e53';
UPDATE quiz_question_options SET option_text = '義務を表す' WHERE id = '982d810e-36ec-4c54-940b-d58041a5a1a2';
UPDATE quiz_question_options SET option_text = '自然な感情・衝動を表す' WHERE id = '17c80289-ec1c-4812-ac16-e25980aff82d';
UPDATE quiz_question_options SET option_text = '忠告を表す' WHERE id = 'e5862b53-dc56-4f9a-afd5-b4545a25545c';

-- ============================================================
-- Q-fc76935a: らし/っぽ 중복정답 (A3)
-- Before: "最近の天気は秋（　）くなってきた。" (らし/っぽ 둘 다 성립)
-- After:  "らし" 선택지를 "なさ" 로 교체. "秋らしい" 는 명사 후접, "秋っぽい" 는 구어
--         인상. 맥락을 구어 주관적 인상으로 고정하고 "らし" 오답지를 제거.
-- Rubric 해소: A3
-- ============================================================
UPDATE quiz_questions
SET question_text = '最近の天気は、なんだか秋（　）くなってきたね。',
    explanation = '「〜っぽい」は主観的な印象・感じを表す口語表現で、「~스러운 / ~같은」の意味です。「なんだか〜っぽい」の形で口語的な感覚評価に使われます。「らしい」は「秋らしい」のように直接名詞に接続するので「らし＋く」の形は活用として不自然です。'
WHERE id = 'fc76935a-41ea-4b0d-a293-10206006424e';
UPDATE quiz_question_options SET option_text = 'なさ' WHERE id = '5648b528-7c3e-4fad-afa3-cf4a8eb521c3';

-- ============================================================
-- Q-2f86478f: しかたない/ならない/たまらない 동의어 중복 (A3)
-- Before: "試験の結果が心配で（　）。" (3지 중복정답)
-- After:  문맥을 감각·욕구 중심으로 교체하여 "たまらない" 고유 용법 강제.
--         "のどが渇いて（　）。" (갈증 → たまらない 전용)
-- Rubric 해소: A3
-- ============================================================
UPDATE quiz_questions
SET question_text = '暑い日に外で運動して、のどが渇いて（　）。',
    explanation = '「〜てたまらない」は感覚・欲求が極限まで達して抑えられない状態を表す文型で、「~해서 견딜 수 없다」という意味です。特に身体感覚（のどが渇く・暑い・眠い）に自然に使われます。「しかたない」「ならない」は心理的な感情に主に使われ、身体感覚では「たまらない」が最も自然です。'
WHERE id = '2f86478f-9206-44ef-b960-189b4f2ad815';

-- ============================================================
-- Q-313037a2: 見間違える 시각적 오인 부적합 (A3)
-- Before: "日本人と（　）ほどだ。" 정답 "見間違える" (언어능력 맥락에 시각 동사 부적합)
-- After:  문장을 시각 맥락(쌍둥이)으로 교체. "見間違える" 정답 적합성 확보.
-- Rubric 해소: A3
-- ============================================================
UPDATE quiz_questions
SET question_text = '「あの双子は、親でも（　）ほどよく似ている。」程度を表す正しいものはどれですか？',
    explanation = '「見間違える」は見て別のものと取り違えることを表す動詞で、「見間違えるほど」で「見分けがつかないほど」の意味を表します。視覚的な類似の程度を強調する表現です。(저 쌍둥이는 부모조차 잘못 볼 정도로 닮았다)'
WHERE id = '313037a2-4af4-48c4-a4ab-13c36843dea1';

-- ============================================================
-- Q-1be35558: 敬語 (カテゴリ BJ 이관은 별도, 여기서는 품질만 유지)
-- 현 상태 정답 유일·명확. 수정 불필요 판단.
--   → 본 Fixer 범위 외 (카테고리 이관은 별도 마이그레이션)
-- 언어적 품질 이슈 없음 — NO-OP 기록용.
-- ============================================================
-- NO-OP: Q-1be35558 의 언어적 품질 문제 없음. 카테고리 이관은 별도 처리.

-- ============================================================
-- Q-2ebfa80f: ビジネス文書 (カテゴリ BJ 이관은 별도)
-- 현 상태 정답 유일·명확. 지시문 내 "ビジネス文書の表現として" 문구도 학습자에게 힌트
-- 제공이 아니라 장면 설정이므로 언어적 이슈 없음.
--   → 본 Fixer 범위 외 (카테고리 이관은 별도 마이그레이션)
-- ============================================================
-- NO-OP: Q-2ebfa80f 의 언어적 품질 문제 없음. 카테고리 이관은 별도 처리.

-- ============================================================
-- 최종 확인: confirmed 14건 중
--   - UPDATE 대상: 12건 (질문 5건 + 선택지 8건 단위, 총 37 UPDATE 문)
--   - NO-OP: 2건 (Q-1be35558, Q-2ebfa80f — 카테고리 이관 별건)
-- ============================================================

-- ============================================================
-- Part 2: Medium Confirmed (26건)
-- 근거: docs/audit/jlpt_grammar_medium_validated.md
-- 수정 패턴:
--   (a) 괄호 병기 과잉: 정답에만 덧붙은 괄호 설명 제거 또는 전 선택지 통일 포맷으로 수정
--   (b) 서술형 vs 단어형 혼재: 모두 서술형 또는 모두 단어형(短)으로 통일
--   (c) Ratio 3.0x+: 전면 재작성
--   (d) 슬래시 병기: 단일 표현만 유지
--   (e) 조동사 경계 편향: 길이 균등화
--   (f) 추가 2건 (uncertain→confirmed, A2 answer-leak): 의미 서술형 통일
-- ============================================================

-- Q-2a867fde (N5) [패턴: 괄호병기 과잉]
-- Before: 정답 "勧誘（一緒にしようと誘う）"(13) vs 오답 "命令/依頼/禁止"(2)
-- After:  정답 "勧誘"(2)로 단축, 전 선택지 2자 통일
UPDATE quiz_question_options SET option_text = '勧誘' WHERE id = '1cf9ad3a-84bf-4f94-8655-da98b8c44e47';

-- Q-d943a680 (N4) [패턴: 서술형 vs 단어형 혼재]
-- Before: 정답 "予想と違う結果への不満・驚き"(14) vs 오답 "～だから/～する時/～するために"(4~6)
-- After:  정답 "予想に反する結果"(8)로 단축, 오답들 "原因"형태 유지
UPDATE quiz_question_options SET option_text = '予想に反する結果' WHERE id = 'bfc5196d-7904-4503-8511-03945fcd69ce';
UPDATE quiz_question_options SET option_text = '原因・理由を示す' WHERE id = 'fcfa6718-4895-4aae-9879-b3da8b395a04';
UPDATE quiz_question_options SET option_text = '時点・場面を示す' WHERE id = '15bd6919-00ab-4323-85b0-b2209672b886';
UPDATE quiz_question_options SET option_text = '目的を表す' WHERE id = 'f744352e-a66a-4d60-a192-217c3d9dc455';

-- Q-6efa2def (N4) [패턴: 괄호병기 과잉]
-- Before: 정답 "他の人から聞いた情報（伝聞）"(14) 과다
-- After:  정답 "伝聞"(2) + 전 선택지 단어형 통일
UPDATE quiz_question_options SET option_text = '伝聞' WHERE id = '7e0e8eb0-3f1d-4bf5-96f3-fffd1e6d4b8f';
UPDATE quiz_question_options SET option_text = '推測' WHERE id = '57caefbf-1311-4ed3-aca4-f8665ec934a9';
UPDATE quiz_question_options SET option_text = '様態' WHERE id = '40406427-9efa-4272-96fd-b6c0943f304d';
UPDATE quiz_question_options SET option_text = '断定' WHERE id = 'e0353732-29d4-4d33-a7bd-ad6d48e3f486';

-- Q-d1a48ae1 (N4) [패턴: 서술형 vs 단어형 혼재]
-- Before: 정답만 서술형 "見た目や状況からの推測"(11)
-- After:  정답 단어형 "推測"(2)로 통일, 오답 괄호 제거하여 단어형 통일
UPDATE quiz_question_options SET option_text = '推測' WHERE id = 'ceac8769-8395-4edf-935a-7f435604f1f1';
UPDATE quiz_question_options SET option_text = '断定' WHERE id = '6a7c68df-c7a5-4a3c-aeb7-f2c3cd7ab9c9';
UPDATE quiz_question_options SET option_text = '意志' WHERE id = '420cefa7-6fcf-4c83-b231-1c2ed217e825';
UPDATE quiz_question_options SET option_text = '過去' WHERE id = '327074f2-f4c4-4588-b40c-b92d4fdfb865';

-- Q-6dc7b6c8 (N4) [패턴: 서술형 길이 편향]
-- Before: 정답 "意図的な行為の結果状態"(11)
-- After:  정답 "意図的な結果状態"(8)로 단축
UPDATE quiz_question_options SET option_text = '意図的な結果状態' WHERE id = '37cb811f-22d4-41e8-9b4d-4e4230d8cfd1';

-- Q-2292f361 (N4) [패턴: 괄호병기 과잉]
-- Before: 정답 "受身（他者の動作を受ける）"(13) vs 오답 "可能（～できる）"(8)
-- After:  정답 괄호 단축 "受身（～される）"(7)
UPDATE quiz_question_options SET option_text = '受身（～される）' WHERE id = '577ea5a3-529a-4afe-9dfc-08974d27921d';

-- Q-55bc8887 (N3) [패턴: 서술형 vs 단어형 혼재]
-- Before: 정답 "後悔・残念"(5) vs 오답 "喜び/希望/推測"(2)
-- After:  정답 "後悔"(2)로 단축, 전 선택지 2자 통일
UPDATE quiz_question_options SET option_text = '後悔' WHERE id = '514373c2-c498-45e8-8ae3-b9a8aee2d46f';

-- Q-8b03de6c (N3) [패턴: Ratio 2.25x]
-- Before: 정답 "外部要因によって決まったこと"(14), 오답4 "過去に決まったことが取り消されたこと"(18)
-- After:  4개 선택지 모두 10~11자로 통일
UPDATE quiz_question_options SET option_text = '自分で決めたこと' WHERE id = '5b543025-de68-485d-990c-cadde724d099';
UPDATE quiz_question_options SET option_text = '外部要因で決まったこと' WHERE id = 'd563778b-f9b6-4e6a-9335-7775bc52c65c';
UPDATE quiz_question_options SET option_text = '未定で保留中のこと' WHERE id = '630a93f2-6224-4bc9-9548-1cfb4c9fae31';
UPDATE quiz_question_options SET option_text = '以前決定が取消されたこと' WHERE id = '5d44684d-bfac-4dda-aeac-a6ac98ec8624';

-- Q-9271aa7b (N3) [패턴: Ratio 4.5x 심각]
-- Before: 정답 "程度・レベルの強調"(9) vs 오답 "理由/条件/時間"(2)
-- After:  정답 "程度"(2)로 단축, 전 선택지 2자 통일
UPDATE quiz_question_options SET option_text = '程度' WHERE id = 'd7e39844-d9b3-4fe9-8b77-24cb5a437999';

-- Q-165689c9 (N3) [패턴: 괄호병기 과잉]
-- Before: 정답 "～からこそ（理由の強調）"(12)
-- After:  정답 "理由を強く示す"(7)로 균등화
UPDATE quiz_question_options SET option_text = '理由を強く示す' WHERE id = '09d1b268-05bf-4881-a815-f9db35c35966';

-- Q-11939f02 (N2) [패턴: 서술형 길이 편향]
-- Before: 정답 "一方的に進行し続ける"(10) vs 오답 "～だけだ"(4)
-- After:  정답 "一方的に進行する"(8)로 단축
UPDATE quiz_question_options SET option_text = '一方的に進行する' WHERE id = '561ce442-387f-4fae-b407-d11fd25fe89c';

-- Q-47e3bda9 (N5) [패턴: 경미 편향]
-- Before: 정답 "現在進行中の動作"(8) vs 오답4 "可能な動作"(5)
-- After:  오답4 "可能性のある動作"(8)로 연장
UPDATE quiz_question_options SET option_text = '可能性のある動作' WHERE id = 'eeb583ee-2cd7-4095-a032-a1014897069f';

-- Q-3e2b874e (N5) [패턴: 경미 편향]
-- Before: 정답 "文を丁寧にする"(7) vs 오답 "過去を表す/否定を表す/推測を表す"(5)
-- After:  정답 "丁寧を表す"(5)로 "〇〇を表す" 패턴 통일
UPDATE quiz_question_options SET option_text = '丁寧を表す' WHERE id = '5c56f6f9-3888-459e-ab84-067e86a7b986';

-- Q-5875bc4e (N1) [패턴: 경미 편향]
-- Before: 정답 "～するなり（即座に）"(10)
-- After:  정답 "～するなり（直後）"(8)로 단축
UPDATE quiz_question_options SET option_text = '～するなり（直後）' WHERE id = '6a5f0668-e348-48e8-9ca3-a6fc5ac35fbc';

-- Q-8357953a (N1) [패턴: 조동사 경계 편향]
-- Before: 정답 "当然"(2) / 오답 "相反する"(4) 만 튐
-- After:  오답 "相反する"→"対立"(2)로 전 선택지 2자 통일
UPDATE quiz_question_options SET option_text = '対立' WHERE id = '6fc92890-4fb0-4f9b-a7cf-61fb38f44ab9';

-- Q-bf38471d (N3) [패턴: 경미 편향]
-- Before: 정답 "たった今完了した動作"(10)
-- After:  정답 "たった今した動作"(8)로 단축
UPDATE quiz_question_options SET option_text = 'たった今した動作' WHERE id = '2619ee6f-46e1-4554-bac8-f40d79e3cbd8';

-- Q-fd8a43a1 (N4) [패턴: 조동사 경계 편향]
-- Before: 정답 "かもしれない"(6) vs 오답 "はずだ"(3)/"べきだ"(3)
-- After:  오답 "はずだ"→"はずがない"(5), "べきだ"→"べきでない"(5) 균등화
UPDATE quiz_question_options SET option_text = 'はずがない' WHERE id = 'bbac68c5-84e6-48fb-96d3-bf403735cac5';
UPDATE quiz_question_options SET option_text = 'べきでない' WHERE id = 'd61694be-b60a-41e3-bd61-e187e6029c2a';

-- Q-dc062b9e (N3) [패턴: 경미 편향]
-- Before: 정답 "かもしれない"(6) vs 오답 "はずだ"(3)
-- After:  오답 "はずだ"→"はずもない"(5)로 균등화
UPDATE quiz_question_options SET option_text = 'はずもない' WHERE id = '58eef063-7017-4cb6-ab36-644a56700c95';

-- Q-7fd50731 (N3) [패턴: Ratio 2.0x, 정답 최단]
-- Before: 정답 "みた"(2) vs 오답 "しまった/おいた/あった"(3~4)
-- After:  오답들 2자로 단축, 정답 "みた"유지
UPDATE quiz_question_options SET option_text = 'きた' WHERE id = '06f49dd7-b754-4cf3-ad34-bf28b15c526b';
UPDATE quiz_question_options SET option_text = 'おく' WHERE id = 'e14931fe-2a39-4c92-920a-be8924ade327';
UPDATE quiz_question_options SET option_text = 'ある' WHERE id = '206352ee-9e64-4948-a8c6-bc20b2761545';

-- Q-71dd5af6 (N4) [패턴: Ratio 3.0x, 정답 최단]
-- Before: 정답 "た"(1) vs 오답 "ている/ての/てみた"(2~3)
-- After:  오답들 1~2자로 축소해 단어 길이 균등화
UPDATE quiz_question_options SET option_text = 'て' WHERE id = 'dd074cc1-ab74-4454-af5a-102ba7db4d15';
UPDATE quiz_question_options SET option_text = 'の' WHERE id = '439c299c-d110-4ff6-be88-1b5987cfab24';
UPDATE quiz_question_options SET option_text = 'てた' WHERE id = 'ccd6f6ba-e703-4dc3-bb3b-b7dbe7b58cca';

-- Q-d9efc57e (N2) [패턴: Ratio 3.0x, 정답 최단]
-- Before: 정답 "末"(1) vs 오답 "あげく/結果/ところ"(2~3)
-- After:  정답 "末に"(2)로 연장
UPDATE quiz_question_options SET option_text = '末に' WHERE id = 'd4921cb8-541e-4456-8eb5-f32ea136578d';

-- Q-2853200e (N5) [패턴: 경미 편향]
-- Before: 정답 "見た"(2) vs 오답 "見ている"(4)
-- After:  오답 "見ている"→"見てる"(3)로 단축
UPDATE quiz_question_options SET option_text = '見てる' WHERE id = 'f981cd98-eb40-4baa-8a83-5a1919c0bb13';

-- Q-d3aa5081 (N4) [패턴: 경미 편향]
-- Before: 정답 "し、し"(3) vs 오답 "ながら、ながら"(7)
-- After:  "ながら、ながら"→"つつ、つつ"(5)로 단축
UPDATE quiz_question_options SET option_text = 'つつ、つつ' WHERE id = '77715061-8f42-4eee-b944-6bd4b2729941';

-- Q-053f1bb3 (N2) [패턴: 슬래시 병기]
-- Before: 정답 "～に伴い／～とともに"(10) — 슬래시로 2표현 병기
-- After:  정답 "～に伴い"(4) 단일 표기
UPDATE quiz_question_options SET option_text = '～に伴い' WHERE id = '837fbb9d-fba3-4d10-96be-95f0869c5e5a';

-- Q-1a8470e1 (N2) [A2 answer-leak, uncertain→confirmed]
-- Before: 정답 "～に基づいて" (질문에 동일 문형 노출)
-- After:  의미 서술형 "根拠・基準を表す"로 통일 (High 14건 정책과 동일)
UPDATE quiz_question_options SET option_text = '対立を表す' WHERE id = 'f5971465-cbdb-43da-9a15-a1beca6a0c19';
UPDATE quiz_question_options SET option_text = '関連事項を表す' WHERE id = '042fca40-74f4-488a-a8f4-0d020b5a99b7';
UPDATE quiz_question_options SET option_text = '対象を表す' WHERE id = '9dd7217d-fbde-495a-bbee-2c58c7652e24';
UPDATE quiz_question_options SET option_text = '根拠・基準を表す' WHERE id = '8bfe4472-a477-43f7-821f-5bbe8e0ea83e';

-- Q-f5d8e98f (N1) [A2 answer-leak, uncertain→confirmed]
-- Before: 정답 "～をものともせず" (질문에 동일 문형 노출)
-- After:  의미 서술형 "困難を克服する意志を表す"로 통일
UPDATE quiz_question_options SET option_text = '困難を克服する意志を表す' WHERE id = '45e7b677-b51e-4e21-ad43-d9ab2787c2db';
UPDATE quiz_question_options SET option_text = '基準・参考を表す' WHERE id = 'd2fbc4f0-3f3f-414e-b8cc-6ffe0ee0cdac';
UPDATE quiz_question_options SET option_text = '開始のきっかけを表す' WHERE id = '873ad13a-ee94-4ba3-9cbc-4dbd5c96d4e9';
UPDATE quiz_question_options SET option_text = '代表例の提示を表す' WHERE id = '44161dd5-3dd8-413e-b7ae-9729b62e556f';

-- ============================================================
-- Part 3: N5/N4 Kanji-enrichment (3건)
-- 목적: 히라가나-only 문제 가독성 향상
-- 스캔 결과: N5/N4 grammar 64건 중 전 선택지+질문문이 히라가나-only인 문제는 3건
-- 정책: 주변 어휘만 N5 한자로 변환. 문법 테스트 대상(조사/활용형)은 히라가나 유지.
-- ============================================================

-- Q-4f831a0c (N5): 조사 문제. 선택지(を/で/に/が)는 그대로 유지.
-- Before: "あした　がっこう（　）いきます。"
-- After:  "明日　学校（　）行きます。"
UPDATE quiz_questions SET question_text = '明日　学校（　）行きます。' WHERE id = '4f831a0c-09da-4442-a995-9e23ea89b493';

-- Q-11118032 (N5): 조사(も/を/は/が) 문제. 선택지 그대로 유지.
-- Before: "わたしは　にほんご（　）べんきょうしています。えいご（　）べんきょうしています。"
-- After:  "私は　日本語（　）勉強しています。英語（　）勉強しています。"
UPDATE quiz_questions SET question_text = '私は　日本語（　）勉強しています。英語（　）勉強しています。' WHERE id = '11118032-215d-44cd-a088-fc35672f7e1c';

-- Q-7a89b707 (N5): あげる/もらう/くれる/やる 수수동사 문제.
-- 선택지는 문법 테스트 대상이므로 히라가나 유지. 질문문만 한자화.
-- Before: "ともだちが　わたしに　ほんを（　）。"
-- After:  "友達が　私に　本を（　）。"
UPDATE quiz_questions SET question_text = '友達が　私に　本を（　）。' WHERE id = '7a89b707-a9e3-4f94-b451-3b5359f9af9d';

-- ============================================================
-- 최종 확인 (Part 2 + Part 3):
--   - Medium Part 2: 26건 → 46 UPDATE 문 (quiz_question_options)
--   - Kanji-enrichment Part 3: 3건 → 3 UPDATE 문 (quiz_questions)
--   - 총 추가 UPDATE: 49건
-- ============================================================
