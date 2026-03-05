-- ============================================
-- BJ IT Vocabulary Quiz Expansion
-- ~284 new questions
-- Generated: 2026-03-05
-- ============================================

-- ============================================
-- business vocabulary (150 new questions, 3 quizzes)
-- ============================================

DO $$
DECLARE quiz_id UUID := 'b1000001-0000-0000-0000-000000000006';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第6回', 'it_terminology', 70, 15)
  ON CONFLICT (id) DO NOTHING;

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「見積書」의 의미로 올바른 것은?', '見積書(みつもりしょ)는 ''견적서''라는 뜻입니다.', 2, 1, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '견적서', TRUE, 1),
    (gen_random_uuid(), q_id, '마련하다', FALSE, 2),
    (gen_random_uuid(), q_id, '下の階級。下層。하류', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「請求書」의 의미로 올바른 것은?', '請求書(せいきゅうしょ)는 ''청구서''라는 뜻입니다.', 2, 2, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '경감', FALSE, 1),
    (gen_random_uuid(), q_id, '청구서', TRUE, 2),
    (gen_random_uuid(), q_id, '어쩔 수 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「契約書」의 의미로 올바른 것은?', '契約書(けいやくしょ)는 ''계약서''라는 뜻입니다.', 2, 3, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신속한', FALSE, 1),
    (gen_random_uuid(), q_id, '계약서', TRUE, 2),
    (gen_random_uuid(), q_id, '기한', FALSE, 3),
    (gen_random_uuid(), q_id, '리뷰 지적', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「派遣」의 의미로 올바른 것은?', '派遣(はけん)는 ''파견''라는 뜻입니다.', 2, 4, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 1),
    (gen_random_uuid(), q_id, '파견', TRUE, 2),
    (gen_random_uuid(), q_id, '증명서', FALSE, 3),
    (gen_random_uuid(), q_id, '리뷰 지적', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「常駐」의 의미로 올바른 것은?', '常駐(じょうちゅう)는 ''상주''라는 뜻입니다.', 2, 5, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상주', TRUE, 1),
    (gen_random_uuid(), q_id, '추가 개발', FALSE, 2),
    (gen_random_uuid(), q_id, '방향처', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「案件」의 의미로 올바른 것은?', '案件(あんけん)는 ''안건/프로젝트''라는 뜻입니다.', 2, 6, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상영', FALSE, 1),
    (gen_random_uuid(), q_id, '검수/수령 확인', FALSE, 2),
    (gen_random_uuid(), q_id, '안건/프로젝트', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「単価」의 의미로 올바른 것은?', '単価(たんか)는 ''단가''라는 뜻입니다.', 2, 7, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유럽풍', FALSE, 1),
    (gen_random_uuid(), q_id, '단가', TRUE, 2),
    (gen_random_uuid(), q_id, '수신인', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「稼働」의 의미로 올바른 것은?', '稼働(かどう)는 ''가동''라는 뜻입니다.', 2, 8, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방향처', FALSE, 1),
    (gen_random_uuid(), q_id, '가동', TRUE, 2),
    (gen_random_uuid(), q_id, '사정 청취', FALSE, 3),
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「勤怠」의 의미로 올바른 것은?', '勤怠(きんたい)는 ''근태''라는 뜻입니다.', 2, 9, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '근태', TRUE, 1),
    (gen_random_uuid(), q_id, '엄수', FALSE, 2),
    (gen_random_uuid(), q_id, '맞붙다', FALSE, 3),
    (gen_random_uuid(), q_id, '품질 보증', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「有給休暇」의 의미로 올바른 것은?', '有給休暇(ゆうきゅうきゅうか)는 ''유급 휴가''라는 뜻입니다.', 2, 10, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '청구서', FALSE, 1),
    (gen_random_uuid(), q_id, '지급/긴급', FALSE, 2),
    (gen_random_uuid(), q_id, '시스템 구성도', FALSE, 3),
    (gen_random_uuid(), q_id, '유급 휴가', TRUE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「残業」의 의미로 올바른 것은?', '残業(ざんぎょう)는 ''잔업/야근''라는 뜻입니다.', 2, 11, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잔업/야근', TRUE, 1),
    (gen_random_uuid(), q_id, '전념', FALSE, 2),
    (gen_random_uuid(), q_id, '조치', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「出張」의 의미로 올바른 것은?', '出張(しゅっちょう)는 ''출장''라는 뜻입니다.', 2, 12, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '손해배상', FALSE, 1),
    (gen_random_uuid(), q_id, '지참', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '출장', TRUE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「名刺交換」의 의미로 올바른 것은?', '名刺交換(めいしこうかん)는 ''명함 교환''라는 뜻입니다.', 2, 13, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상위', FALSE, 1),
    (gen_random_uuid(), q_id, '체결', FALSE, 2),
    (gen_random_uuid(), q_id, '명함 교환', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「敬語」의 의미로 올바른 것은?', '敬語(けいご)는 ''경어''라는 뜻입니다.', 2, 14, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '극력', FALSE, 1),
    (gen_random_uuid(), q_id, '청구서', FALSE, 2),
    (gen_random_uuid(), q_id, '경어', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「お辞儀」의 의미로 올바른 것은?', 'お辞儀(おじぎ)는 ''인사(절)''라는 뜻입니다.', 2, 15, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인사(절)', TRUE, 1),
    (gen_random_uuid(), q_id, '기축', FALSE, 2),
    (gen_random_uuid(), q_id, '차별화', FALSE, 3),
    (gen_random_uuid(), q_id, '정기 회의', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「席順」의 의미로 올바른 것은?', '席順(せきじゅん)는 ''자리 배치''라는 뜻입니다.', 2, 16, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '창출', FALSE, 1),
    (gen_random_uuid(), q_id, '횡령', FALSE, 2),
    (gen_random_uuid(), q_id, '명세서', FALSE, 3),
    (gen_random_uuid(), q_id, '자리 배치', TRUE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ビジネスメール」의 의미로 올바른 것은?', 'ビジネスメール(ビジネスメール)는 ''비즈니스 메일''라는 뜻입니다.', 2, 17, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '임시 대응', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 메일', TRUE, 2),
    (gen_random_uuid(), q_id, '마음에 새기다', FALSE, 3),
    (gen_random_uuid(), q_id, '결과물', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「電話応対」의 의미로 올바른 것은?', '電話応対(でんわおうたい)는 ''전화 응대''라는 뜻입니다.', 2, 18, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '여행', FALSE, 1),
    (gen_random_uuid(), q_id, '원격', FALSE, 2),
    (gen_random_uuid(), q_id, '전화 응대', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「クライアント」의 의미로 올바른 것은?', 'クライアント(クライアント)는 ''클라이언트''라는 뜻입니다.', 2, 19, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조치', FALSE, 1),
    (gen_random_uuid(), q_id, '클라이언트', TRUE, 2),
    (gen_random_uuid(), q_id, '예고 없이 실시하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ベンダー」의 의미로 올바른 것은?', 'ベンダー(ベンダー)는 ''벤더''라는 뜻입니다.', 2, 20, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '벤더', TRUE, 1),
    (gen_random_uuid(), q_id, '영구 대응', FALSE, 2),
    (gen_random_uuid(), q_id, '신고', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「発注」의 의미로 올바른 것은?', '発注(はっちゅう)는 ''발주''라는 뜻입니다.', 2, 21, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '관리자', FALSE, 1),
    (gen_random_uuid(), q_id, '(액체에)담그다', FALSE, 2),
    (gen_random_uuid(), q_id, '발주', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「受注」의 의미로 올바른 것은?', '受注(じゅちゅう)는 ''수주''라는 뜻입니다.', 2, 22, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '(액체에)담그다', FALSE, 1),
    (gen_random_uuid(), q_id, '상영', FALSE, 2),
    (gen_random_uuid(), q_id, '프로토타입', FALSE, 3),
    (gen_random_uuid(), q_id, '수주', TRUE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「検収」의 의미로 올바른 것은?', '検収(けんしゅう)는 ''검수''라는 뜻입니다.', 2, 23, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '근본 원인', FALSE, 1),
    (gen_random_uuid(), q_id, '헬프데스크', FALSE, 2),
    (gen_random_uuid(), q_id, '검수', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「仕様変更」의 의미로 올바른 것은?', '仕様変更(しようへんこう)는 ''사양 변경''라는 뜻입니다.', 2, 24, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유지보수', FALSE, 1),
    (gen_random_uuid(), q_id, '리소스', FALSE, 2),
    (gen_random_uuid(), q_id, '사양 변경', TRUE, 3),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「追加開発」의 의미로 올바른 것은?', '追加開発(ついかかいはつ)는 ''추가 개발''라는 뜻입니다.', 2, 25, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '최우선', FALSE, 1),
    (gen_random_uuid(), q_id, '중요함 / 핵심', FALSE, 2),
    (gen_random_uuid(), q_id, '추가 개발', TRUE, 3),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「保守運用」의 의미로 올바른 것은?', '保守運用(ほしゅうんよう)는 ''유지보수 운영''라는 뜻입니다.', 2, 26, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유지보수 운영', TRUE, 1),
    (gen_random_uuid(), q_id, '견적서', FALSE, 2),
    (gen_random_uuid(), q_id, '임시 대응', FALSE, 3),
    (gen_random_uuid(), q_id, '품질 보증', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ヘルプデスク」의 의미로 올바른 것은?', 'ヘルプデスク(ヘルプデスク)는 ''헬프데스크''라는 뜻입니다.', 2, 27, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보고・연락・상담', FALSE, 1),
    (gen_random_uuid(), q_id, '헬프데스크', TRUE, 2),
    (gen_random_uuid(), q_id, '축적', FALSE, 3),
    (gen_random_uuid(), q_id, '결과물', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「報連相」의 의미로 올바른 것은?', '報連相(ほうれんそう)는 ''보고/연락/상담''라는 뜻입니다.', 2, 28, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보고/연락/상담', TRUE, 1),
    (gen_random_uuid(), q_id, '질문의 의도를 정확하게 파악하다', FALSE, 2),
    (gen_random_uuid(), q_id, '횡령', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ご査収」의 의미로 올바른 것은?', 'ご査収(ごさしゅう)는 ''검수/수령 확인''라는 뜻입니다.', 2, 29, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서류', FALSE, 1),
    (gen_random_uuid(), q_id, '검수/수령 확인', TRUE, 2),
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「根本原因」의 의미로 올바른 것은?', '根本原因(こんぽんげんいん)는 ''근본 원인''라는 뜻입니다.', 2, 30, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '근본 원인', TRUE, 1),
    (gen_random_uuid(), q_id, '벤더', FALSE, 2),
    (gen_random_uuid(), q_id, '기초를 두다', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「暫定対応」의 의미로 올바른 것은?', '暫定対応(ざんていたいおう)는 ''임시 대응''라는 뜻입니다.', 2, 31, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '청구서', FALSE, 1),
    (gen_random_uuid(), q_id, '지급/긴급', FALSE, 2),
    (gen_random_uuid(), q_id, '화면 설계서', FALSE, 3),
    (gen_random_uuid(), q_id, '임시 대응', TRUE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「恒久対応」의 의미로 올바른 것은?', '恒久対応(こうきゅうたいおう)는 ''영구 대응''라는 뜻입니다.', 2, 32, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서론', FALSE, 1),
    (gen_random_uuid(), q_id, '영구 대응', TRUE, 2),
    (gen_random_uuid(), q_id, '마음에 새기다', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リソース」의 의미로 올바른 것은?', 'リソース(リソース)는 ''리소스''라는 뜻입니다.', 2, 33, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리소스', TRUE, 1),
    (gen_random_uuid(), q_id, '투명성', FALSE, 2),
    (gen_random_uuid(), q_id, '의심 물품', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「至急」의 의미로 올바른 것은?', '至急(しきゅう)는 ''지급/긴급''라는 뜻입니다.', 2, 34, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지급/긴급', TRUE, 1),
    (gen_random_uuid(), q_id, '억제', FALSE, 2),
    (gen_random_uuid(), q_id, '보고・연락・상담', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「施主」의 의미로 올바른 것은?', '施主(せしゅ)는 ''시주''라는 뜻입니다.', 2, 35, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시주', TRUE, 1),
    (gen_random_uuid(), q_id, '비기능', FALSE, 2),
    (gen_random_uuid(), q_id, '투명성', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ヒアリング」의 의미로 올바른 것은?', 'ヒアリング는 ''사정 청취''라는 뜻입니다.', 2, 36, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방향처', FALSE, 1),
    (gen_random_uuid(), q_id, '사정 청취', TRUE, 2),
    (gen_random_uuid(), q_id, '시주', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「部位」의 의미로 올바른 것은?', '部位(ぶい)는 ''부위''라는 뜻입니다.', 2, 37, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '할당', FALSE, 1),
    (gen_random_uuid(), q_id, '부위', TRUE, 2),
    (gen_random_uuid(), q_id, '가동', FALSE, 3),
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「網羅」의 의미로 올바른 것은?', '網羅(もうら)는 ''망라''라는 뜻입니다.', 2, 38, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '접속처', FALSE, 1),
    (gen_random_uuid(), q_id, '계약서', FALSE, 2),
    (gen_random_uuid(), q_id, '화면 설계서', FALSE, 3),
    (gen_random_uuid(), q_id, '망라', TRUE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「委託」의 의미로 올바른 것은?', '委託(いたく)는 ''위탁''라는 뜻입니다.', 2, 39, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상주', FALSE, 1),
    (gen_random_uuid(), q_id, '감사', FALSE, 2),
    (gen_random_uuid(), q_id, '스토리지', FALSE, 3),
    (gen_random_uuid(), q_id, '위탁', TRUE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「複数回」의 의미로 올바른 것은?', '複数回(ふくすうかい)는 ''여러번''라는 뜻입니다.', 2, 40, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '추장', FALSE, 1),
    (gen_random_uuid(), q_id, '여러번', TRUE, 2),
    (gen_random_uuid(), q_id, '하루빨리 적응기반을 마련하다', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「接続先」의 의미로 올바른 것은?', '接続先(せつぞくさき)는 ''접속처''라는 뜻입니다.', 2, 41, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '망라', FALSE, 1),
    (gen_random_uuid(), q_id, '가동', FALSE, 2),
    (gen_random_uuid(), q_id, '멱등성', FALSE, 3),
    (gen_random_uuid(), q_id, '접속처', TRUE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「注釈」의 의미로 올바른 것은?', '注釈(ちゅうしゃく)는 ''주석''라는 뜻입니다.', 2, 42, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주석', TRUE, 1),
    (gen_random_uuid(), q_id, '기한', FALSE, 2),
    (gen_random_uuid(), q_id, '인사(절)', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「割り当て」의 의미로 올바른 것은?', '割り当て(わりあて)는 ''할당''라는 뜻입니다.', 2, 43, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서류', FALSE, 1),
    (gen_random_uuid(), q_id, '할당', TRUE, 2),
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「宛先」의 의미로 올바른 것은?', '宛先(あてさき)는 ''수신인''라는 뜻입니다.', 2, 44, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사정 청취', FALSE, 1),
    (gen_random_uuid(), q_id, '극력', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '수신인', TRUE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「締結」의 의미로 올바른 것은?', '締結(ていけつ)는 ''체결''라는 뜻입니다.', 2, 45, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '체결', TRUE, 1),
    (gen_random_uuid(), q_id, '마련하다', FALSE, 2),
    (gen_random_uuid(), q_id, '下の階級。下層。하류', FALSE, 3),
    (gen_random_uuid(), q_id, '정기 회의', FALSE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「監査」의 의미로 올바른 것은?', '監査(かんさ)는 ''감사''라는 뜻입니다.', 2, 46, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모습', FALSE, 1),
    (gen_random_uuid(), q_id, '수선', FALSE, 2),
    (gen_random_uuid(), q_id, '감사', TRUE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「下流」의 의미로 올바른 것은?', '下流(かりゅう)는 ''下の階級。下層。하류''라는 뜻입니다.', 2, 47, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '下の階級。下層。하류', TRUE, 1),
    (gen_random_uuid(), q_id, '벤더', FALSE, 2),
    (gen_random_uuid(), q_id, '기초를 두다', FALSE, 3),
    (gen_random_uuid(), q_id, '품질 보증', FALSE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「短縮」의 의미로 올바른 것은?', '短縮(たんしゅく)는 ''단축''라는 뜻입니다.', 2, 48, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '불명확', FALSE, 1),
    (gen_random_uuid(), q_id, '각하', FALSE, 2),
    (gen_random_uuid(), q_id, '구성도', FALSE, 3),
    (gen_random_uuid(), q_id, '단축', TRUE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「損益」의 의미로 올바른 것은?', '損益(そんえき)는 ''「損失」と「利益」손익''라는 뜻입니다.', 2, 49, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '청구서', FALSE, 1),
    (gen_random_uuid(), q_id, '리소스', FALSE, 2),
    (gen_random_uuid(), q_id, '화면 설계서', FALSE, 3),
    (gen_random_uuid(), q_id, '「損失」と「利益」손익', TRUE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「上映」의 의미로 올바른 것은?', '上映(じょうえい)는 ''상영''라는 뜻입니다.', 2, 50, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '안건/프로젝트', FALSE, 1),
    (gen_random_uuid(), q_id, '단축', FALSE, 2),
    (gen_random_uuid(), q_id, '상영', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

END $$;

DO $$
DECLARE quiz_id UUID := 'b1000001-0000-0000-0000-000000000007';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第7回', 'it_terminology', 70, 15)
  ON CONFLICT (id) DO NOTHING;

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「準委」의 의미로 올바른 것은?', '準委(じゅんい)는 ''준위''라는 뜻입니다.', 2, 1, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '반올림', FALSE, 1),
    (gen_random_uuid(), q_id, '촉진', FALSE, 2),
    (gen_random_uuid(), q_id, '준위', TRUE, 3),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「交渉」의 의미로 올바른 것은?', '交渉(こうしょう)는 ''교섭''라는 뜻입니다.', 2, 2, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '묶음', FALSE, 1),
    (gen_random_uuid(), q_id, '교섭', TRUE, 2),
    (gen_random_uuid(), q_id, '마련하다', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「互角だ」의 의미로 올바른 것은?', '互角だ(ごかくだ)는 ''호각을다투다''라는 뜻입니다.', 2, 3, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '호각을다투다', TRUE, 1),
    (gen_random_uuid(), q_id, '확장기능', FALSE, 2),
    (gen_random_uuid(), q_id, '경감', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「文明」의 의미로 올바른 것은?', '文明(ぶんめい)는 ''문명''라는 뜻입니다.', 2, 4, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클라이언트', FALSE, 1),
    (gen_random_uuid(), q_id, '문명', TRUE, 2),
    (gen_random_uuid(), q_id, '제어', FALSE, 3),
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ヨーロッパ風」의 의미로 올바른 것은?', 'ヨーロッパ風(よーろっぱふう)는 ''유럽풍''라는 뜻입니다.', 2, 5, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '미리', FALSE, 1),
    (gen_random_uuid(), q_id, '유럽풍', TRUE, 2),
    (gen_random_uuid(), q_id, '자리 배치', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「工面する」의 의미로 올바른 것은?', '工面する(くめんする)는 ''마련하다''라는 뜻입니다.', 2, 6, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유실물', FALSE, 1),
    (gen_random_uuid(), q_id, '수주', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 3),
    (gen_random_uuid(), q_id, '마련하다', TRUE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「浸す」의 의미로 올바른 것은?', '浸す(ひたす)는 ''(액체에)담그다''라는 뜻입니다.', 2, 7, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조치', FALSE, 1),
    (gen_random_uuid(), q_id, '(액체에)담그다', TRUE, 2),
    (gen_random_uuid(), q_id, '예고 없이 실시하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「縛り」의 의미로 올바른 것은?', '縛り(しばり)는 ''묶음''라는 뜻입니다.', 2, 8, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '바람직하다', FALSE, 1),
    (gen_random_uuid(), q_id, '묶음', TRUE, 2),
    (gen_random_uuid(), q_id, '자리 배치', FALSE, 3),
    (gen_random_uuid(), q_id, '리뷰 지적', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「俯瞰」의 의미로 올바른 것은?', '俯瞰(ふかん)는 ''부감''라는 뜻입니다.', 2, 9, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '몸소 실감', FALSE, 1),
    (gen_random_uuid(), q_id, '모습', FALSE, 2),
    (gen_random_uuid(), q_id, '프로토타입', FALSE, 3),
    (gen_random_uuid(), q_id, '부감', TRUE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「整数」의 의미로 올바른 것은?', '整数(せいすう)는 ''정수''라는 뜻입니다.', 2, 10, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정수', TRUE, 1),
    (gen_random_uuid(), q_id, '게으름을 피우다', FALSE, 2),
    (gen_random_uuid(), q_id, '클라이언트', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「違約金」의 의미로 올바른 것은?', '違約金(いやくきん)는 ''위약금''라는 뜻입니다.', 2, 11, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '각하', FALSE, 1),
    (gen_random_uuid(), q_id, '손해배상', FALSE, 2),
    (gen_random_uuid(), q_id, '위약금', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「透明性」의 의미로 올바른 것은?', '透明性(とうめいせい)는 ''투명성''라는 뜻입니다.', 2, 12, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '투명성', TRUE, 1),
    (gen_random_uuid(), q_id, '벤더', FALSE, 2),
    (gen_random_uuid(), q_id, '기초를 두다', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「基軸」의 의미로 올바른 것은?', '基軸(きじく)는 ''기축''라는 뜻입니다.', 2, 13, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '관리자', FALSE, 1),
    (gen_random_uuid(), q_id, '마련하다', FALSE, 2),
    (gen_random_uuid(), q_id, '기축', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「身をもって実感」의 의미로 올바른 것은?', '身をもって実感(みをもってじっかん)는 ''몸소 실감''라는 뜻입니다.', 2, 14, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상위', FALSE, 1),
    (gen_random_uuid(), q_id, '수신인', FALSE, 2),
    (gen_random_uuid(), q_id, '몸소 실감', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「俯瞰系」의 의미로 올바른 것은?', '俯瞰系(ふかんけい)는 ''부감계(전체를 위에서 내려다 보는 느낌)''라는 뜻입니다.', 2, 15, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '횡령', FALSE, 1),
    (gen_random_uuid(), q_id, '명찰', FALSE, 2),
    (gen_random_uuid(), q_id, '부감계(전체를 위에서 내려다 보는 느낌)', TRUE, 3),
    (gen_random_uuid(), q_id, '미들웨어', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「基本機能」의 의미로 올바른 것은?', '基本機能(きほんきのう)는 ''기본기능''라는 뜻입니다.', 2, 16, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '체결', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 메일', FALSE, 2),
    (gen_random_uuid(), q_id, '기본기능', TRUE, 3),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「拡張機能」의 의미로 올바른 것은?', '拡張機能(かくちょうきのう)는 ''확장기능''라는 뜻입니다.', 2, 17, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '극력', FALSE, 1),
    (gen_random_uuid(), q_id, '청구서', FALSE, 2),
    (gen_random_uuid(), q_id, '확장기능', TRUE, 3),
    (gen_random_uuid(), q_id, '미들웨어', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「不明確」의 의미로 올바른 것은?', '不明確(ふめいかく)는 ''불명확''라는 뜻입니다.', 2, 18, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서류', FALSE, 1),
    (gen_random_uuid(), q_id, '불명확', TRUE, 2),
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 3),
    (gen_random_uuid(), q_id, '결과물', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「最優先」의 의미로 올바른 것은?', '最優先(さいゆうせん)는 ''최우선''라는 뜻입니다.', 2, 19, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '불명확', FALSE, 1),
    (gen_random_uuid(), q_id, '중요함 / 핵심', FALSE, 2),
    (gen_random_uuid(), q_id, '최우선', TRUE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「差別化」의 의미로 올바른 것은?', '差別化(さべつか)는 ''차별화''라는 뜻입니다.', 2, 20, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '문명', FALSE, 1),
    (gen_random_uuid(), q_id, '차별화', TRUE, 2),
    (gen_random_uuid(), q_id, '할당', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「業務率」의 의미로 올바른 것은?', '業務率(ぎょうむりつ)는 ''업무률''라는 뜻입니다.', 2, 21, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서류', FALSE, 1),
    (gen_random_uuid(), q_id, '업무률', TRUE, 2),
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 3),
    (gen_random_uuid(), q_id, '결과물', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「展望」의 의미로 올바른 것은?', '展望(てんぼう)는 ''전망''라는 뜻입니다.', 2, 22, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전망', TRUE, 1),
    (gen_random_uuid(), q_id, '자리 배치', FALSE, 2),
    (gen_random_uuid(), q_id, '마련하다', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「様相」의 의미로 올바른 것은?', '様相(ようそう)는 ''모습''라는 뜻입니다.', 2, 23, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모습', TRUE, 1),
    (gen_random_uuid(), q_id, '투명성', FALSE, 2),
    (gen_random_uuid(), q_id, '최우선', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「推奨」의 의미로 올바른 것은?', '推奨(すいしょう)는 ''추장''라는 뜻입니다.', 2, 24, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '추장', TRUE, 1),
    (gen_random_uuid(), q_id, '어지럽히다', FALSE, 2),
    (gen_random_uuid(), q_id, '단가', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「厳守」의 의미로 올바른 것은?', '厳守(げんしゅ)는 ''엄수''라는 뜻입니다.', 2, 25, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '절도', FALSE, 1),
    (gen_random_uuid(), q_id, '소정', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '엄수', TRUE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「遵守」의 의미로 올바른 것은?', '遵守(じゅんしゅ)는 ''준수''라는 뜻입니다.', 2, 26, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '헬프데스크', FALSE, 1),
    (gen_random_uuid(), q_id, '준수', TRUE, 2),
    (gen_random_uuid(), q_id, '비기능', FALSE, 3),
    (gen_random_uuid(), q_id, '결과물', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「制裁」의 의미로 올바른 것은?', '制裁(せいさい)는 ''제재''라는 뜻입니다.', 2, 27, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '업무률', FALSE, 1),
    (gen_random_uuid(), q_id, '고객', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 3),
    (gen_random_uuid(), q_id, '제재', TRUE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「設ける」의 의미로 올바른 것은?', '設ける(もうける)는 ''마련하다''라는 뜻입니다.', 2, 28, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '미리', FALSE, 1),
    (gen_random_uuid(), q_id, '마련하다', TRUE, 2),
    (gen_random_uuid(), q_id, '파견', FALSE, 3),
    (gen_random_uuid(), q_id, '리뷰 지적', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「抑制」의 의미로 올바른 것은?', '抑制(よくせい)는 ''억제''라는 뜻입니다.', 2, 29, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '여러번', FALSE, 1),
    (gen_random_uuid(), q_id, '계약서', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '억제', TRUE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「促進」의 의미로 올바른 것은?', '促進(そくしん)는 ''촉진''라는 뜻입니다.', 2, 30, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상영', FALSE, 1),
    (gen_random_uuid(), q_id, '촉진', TRUE, 2),
    (gen_random_uuid(), q_id, '임시 대응', FALSE, 3),
    (gen_random_uuid(), q_id, '결과물', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「排除」의 의미로 올바른 것은?', '排除(はいじょ)는 ''배제''라는 뜻입니다.', 2, 31, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지참', FALSE, 1),
    (gen_random_uuid(), q_id, '어울리다', FALSE, 2),
    (gen_random_uuid(), q_id, '배제', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「軽減」의 의미로 올바른 것은?', '軽減(けいげん)는 ''경감''라는 뜻입니다.', 2, 32, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '경감', TRUE, 1),
    (gen_random_uuid(), q_id, '어쩔 수 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '제약', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「蓄積」의 의미로 올바른 것은?', '蓄積(ちくせき)는 ''축적''라는 뜻입니다.', 2, 33, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인사(절)', FALSE, 1),
    (gen_random_uuid(), q_id, '축적', TRUE, 2),
    (gen_random_uuid(), q_id, '추장', FALSE, 3),
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「創出」의 의미로 올바른 것은?', '創出(そうしゅつ)는 ''창출''라는 뜻입니다.', 2, 34, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '중요함 / 핵심', FALSE, 1),
    (gen_random_uuid(), q_id, '우러러보다', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 3),
    (gen_random_uuid(), q_id, '창출', TRUE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「却下」의 의미로 올바른 것은?', '却下(きゃっか)는 ''각하''라는 뜻입니다.', 2, 35, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신속', FALSE, 1),
    (gen_random_uuid(), q_id, '유급 휴가', FALSE, 2),
    (gen_random_uuid(), q_id, '견적', FALSE, 3),
    (gen_random_uuid(), q_id, '각하', TRUE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「措置」의 의미로 올바른 것은?', '措置(そち)는 ''조치''라는 뜻입니다.', 2, 36, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조치', TRUE, 1),
    (gen_random_uuid(), q_id, '下の階級。下層。하류', FALSE, 2),
    (gen_random_uuid(), q_id, '검수', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「制御」의 의미로 올바른 것은?', '制御(せいぎょ)는 ''제어''라는 뜻입니다.', 2, 37, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '납기', FALSE, 1),
    (gen_random_uuid(), q_id, '전화 응대', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트 케이스', FALSE, 3),
    (gen_random_uuid(), q_id, '제어', TRUE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「肝心」의 의미로 올바른 것은?', '肝心(かんじん)는 ''중요함 / 핵심''라는 뜻입니다.', 2, 38, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '중요함 / 핵심', TRUE, 1),
    (gen_random_uuid(), q_id, '위탁', FALSE, 2),
    (gen_random_uuid(), q_id, '서론', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「安全性を考慮する」의 의미로 올바른 것은?', '安全性を考慮する(あんぜんせいをこうりょする)는 ''안전성을 고려하다''라는 뜻입니다.', 2, 39, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영구 대응', FALSE, 1),
    (gen_random_uuid(), q_id, '무분별함', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '안전성을 고려하다', TRUE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「基づく」의 의미로 올바른 것은?', '基づく(もとづく)는 ''기초를 두다''라는 뜻입니다.', 2, 40, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '접속처', FALSE, 1),
    (gen_random_uuid(), q_id, '상주', FALSE, 2),
    (gen_random_uuid(), q_id, '기초를 두다', TRUE, 3),
    (gen_random_uuid(), q_id, '미들웨어', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「質問の意図を正しく把握する」의 의미로 올바른 것은?', '質問の意図を正しく把握する(しつもんのいとをただしくはあくする)는 ''질문의 의도를 정확하게 파악하다''라는 뜻입니다.', 2, 41, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유실물', FALSE, 1),
    (gen_random_uuid(), q_id, '수주', FALSE, 2),
    (gen_random_uuid(), q_id, '프로토타입', FALSE, 3),
    (gen_random_uuid(), q_id, '질문의 의도를 정확하게 파악하다', TRUE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「遠隔」의 의미로 올바른 것은?', '遠隔(えんかく)는 ''원격''라는 뜻입니다.', 2, 42, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '원격', TRUE, 1),
    (gen_random_uuid(), q_id, '준위', FALSE, 2),
    (gen_random_uuid(), q_id, '지급/긴급', FALSE, 3),
    (gen_random_uuid(), q_id, '품질 보증', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「担当者」의 의미로 올바른 것은?', '担当者(たんとうしゃ)는 ''담당자''라는 뜻입니다.', 2, 43, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배제', FALSE, 1),
    (gen_random_uuid(), q_id, '담당자', TRUE, 2),
    (gen_random_uuid(), q_id, '어쩔 수 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「優先度」의 의미로 올바른 것은?', '優先度(ゆうせんど)는 ''우선도''라는 뜻입니다.', 2, 44, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '우선도', TRUE, 1),
    (gen_random_uuid(), q_id, '견적서', FALSE, 2),
    (gen_random_uuid(), q_id, '근본 원인', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「期限」의 의미로 올바른 것은?', '期限(きげん)는 ''기한''라는 뜻입니다.', 2, 45, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '명찰', FALSE, 1),
    (gen_random_uuid(), q_id, '사정을 짐작하여 승낙[허락]함', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '기한', TRUE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「納期」의 의미로 올바른 것은?', '納期(のうき)는 ''납기''라는 뜻입니다.', 2, 46, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '납기', TRUE, 1),
    (gen_random_uuid(), q_id, '파견', FALSE, 2),
    (gen_random_uuid(), q_id, '주석', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「顧客」의 의미로 올바른 것은?', '顧客(こきゃく)는 ''고객''라는 뜻입니다.', 2, 47, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '단가', FALSE, 1),
    (gen_random_uuid(), q_id, '고객', TRUE, 2),
    (gen_random_uuid(), q_id, '준위', FALSE, 3),
    (gen_random_uuid(), q_id, '결과물', FALSE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「書類」의 의미로 올바른 것은?', '書類(しょるい)는 ''서류''라는 뜻입니다.', 2, 48, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '접속처', FALSE, 1),
    (gen_random_uuid(), q_id, '상주', FALSE, 2),
    (gen_random_uuid(), q_id, '서류', TRUE, 3),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「証明書」의 의미로 올바른 것은?', '証明書(しょうめいしょ)는 ''증명서''라는 뜻입니다.', 2, 49, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소정', FALSE, 1),
    (gen_random_uuid(), q_id, '우선순위', FALSE, 2),
    (gen_random_uuid(), q_id, '증명서', TRUE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「修繕」의 의미로 올바른 것은?', '修繕(しゅうぜん)는 ''수선''라는 뜻입니다.', 2, 50, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '취급', FALSE, 1),
    (gen_random_uuid(), q_id, '호각을다투다', FALSE, 2),
    (gen_random_uuid(), q_id, '산출물', FALSE, 3),
    (gen_random_uuid(), q_id, '수선', TRUE, 4);

END $$;

DO $$
DECLARE quiz_id UUID := 'b1000001-0000-0000-0000-000000000008';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第8回', 'it_terminology', 70, 15)
  ON CONFLICT (id) DO NOTHING;

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「維持補修」의 의미로 올바른 것은?', '維持補修(いじほしゅう)는 ''유지보수''라는 뜻입니다.', 2, 1, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유지보수', TRUE, 1),
    (gen_random_uuid(), q_id, '하루빨리 적응기반을 마련하다', FALSE, 2),
    (gen_random_uuid(), q_id, '망라', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「方向先」의 의미로 올바른 것은?', '方向先(ほうこうさき)는 ''방향처''라는 뜻입니다.', 2, 2, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '원격', FALSE, 1),
    (gen_random_uuid(), q_id, '근태', FALSE, 2),
    (gen_random_uuid(), q_id, '방향처', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「いち早く適応基盤を整える」의 의미로 올바른 것은?', 'いち早く適応基盤を整える(いちはやくてきおうきばんをととのえる)는 ''하루빨리 적응기반을 마련하다''라는 뜻입니다.', 2, 3, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인사(절)', FALSE, 1),
    (gen_random_uuid(), q_id, '하루빨리 적응기반을 마련하다', TRUE, 2),
    (gen_random_uuid(), q_id, '추장', FALSE, 3),
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「優先順位」의 의미로 올바른 것은?', '優先順位(ゆうせんじゅんばん)는 ''우선순위''라는 뜻입니다.', 2, 4, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상영', FALSE, 1),
    (gen_random_uuid(), q_id, '우선순위', TRUE, 2),
    (gen_random_uuid(), q_id, '임시 대응', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「相違」의 의미로 올바른 것은?', '相違(そうい)는 ''상위''라는 뜻입니다.', 2, 5, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '헬프데스크', FALSE, 1),
    (gen_random_uuid(), q_id, '상위', TRUE, 2),
    (gen_random_uuid(), q_id, '비기능', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「取組む」의 의미로 올바른 것은?', '取組む(とりくむ)는 ''맞붙다''라는 뜻입니다.', 2, 6, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '의심 물품', FALSE, 1),
    (gen_random_uuid(), q_id, '추가 개발', FALSE, 2),
    (gen_random_uuid(), q_id, '맞붙다', TRUE, 3),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「取込む」의 의미로 올바른 것은?', '取込む(とりこむ)는 ''어수선하다''라는 뜻입니다.', 2, 7, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '관리자', FALSE, 1),
    (gen_random_uuid(), q_id, '마련하다', FALSE, 2),
    (gen_random_uuid(), q_id, '어수선하다', TRUE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「取扱い」의 의미로 올바른 것은?', '取扱い(とりあつかい)는 ''취급''라는 뜻입니다.', 2, 8, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유실물', FALSE, 1),
    (gen_random_uuid(), q_id, '수주', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '취급', TRUE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「管理者」의 의미로 올바른 것은?', '管理者(かんりしゃ)는 ''관리자''라는 뜻입니다.', 2, 9, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '관리자', TRUE, 1),
    (gen_random_uuid(), q_id, '서류', FALSE, 2),
    (gen_random_uuid(), q_id, '헬프데스크', FALSE, 3),
    (gen_random_uuid(), q_id, '정기 회의', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「制約」의 의미로 올바른 것은?', '制約(せいやく)는 ''제약''라는 뜻입니다.', 2, 10, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '경어', FALSE, 1),
    (gen_random_uuid(), q_id, '업무률', FALSE, 2),
    (gen_random_uuid(), q_id, '제약', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「非機能」의 의미로 올바른 것은?', '非機能(ひきのう)는 ''비기능''라는 뜻입니다.', 2, 11, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '체결', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 메일', FALSE, 2),
    (gen_random_uuid(), q_id, '비기능', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「同意書」의 의미로 올바른 것은?', '同意書(どういしょ)는 ''동의서''라는 뜻입니다.', 2, 12, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '명함 교환', FALSE, 1),
    (gen_random_uuid(), q_id, '불명확', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 3),
    (gen_random_uuid(), q_id, '동의서', TRUE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「了承」의 의미로 올바른 것은?', '了承(りょうしょう)는 ''사정을 짐작하여 승낙[허락]함''라는 뜻입니다.', 2, 13, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '바람직하다', FALSE, 1),
    (gen_random_uuid(), q_id, '사정을 짐작하여 승낙[허락]함', TRUE, 2),
    (gen_random_uuid(), q_id, '자리 배치', FALSE, 3),
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「承諾」의 의미로 올바른 것은?', '承諾(しょうだく)는 ''승낙''라는 뜻입니다.', 2, 14, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '집무', FALSE, 1),
    (gen_random_uuid(), q_id, '승낙', TRUE, 2),
    (gen_random_uuid(), q_id, '전념', FALSE, 3),
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「圧迫」의 의미로 올바른 것은?', '圧迫(あっぱく)는 ''압박''라는 뜻입니다.', 2, 15, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '검수/수령 확인', FALSE, 1),
    (gen_random_uuid(), q_id, '유지보수 운영', FALSE, 2),
    (gen_random_uuid(), q_id, '압박', TRUE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「解約」의 의미로 올바른 것은?', '解約(かいやく)는 ''해약''라는 뜻입니다.', 2, 16, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '업무률', FALSE, 1),
    (gen_random_uuid(), q_id, '납기', FALSE, 2),
    (gen_random_uuid(), q_id, '견적', FALSE, 3),
    (gen_random_uuid(), q_id, '해약', TRUE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「四捨五入」의 의미로 올바른 것은?', '四捨五入(ししゃごにゅう)는 ''반올림''라는 뜻입니다.', 2, 17, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '반올림', TRUE, 1),
    (gen_random_uuid(), q_id, '예고 없이 실시하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '바람직하다', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「報連相(報告・連絡・相談)」의 의미로 올바른 것은?', '報連相(報告・連絡・相談)(ほうれんそう(ほうこく・れんらく・そうだん))는 ''보고・연락・상담''라는 뜻입니다.', 2, 18, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신고', FALSE, 1),
    (gen_random_uuid(), q_id, '보고・연락・상담', TRUE, 2),
    (gen_random_uuid(), q_id, '맞붙다', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「専念」의 의미로 올바른 것은?', '専念(せんねん)는 ''전념''라는 뜻입니다.', 2, 19, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '청구서', FALSE, 1),
    (gen_random_uuid(), q_id, '리소스', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '전념', TRUE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「打刻」의 의미로 올바른 것은?', '打刻(だこく)는 ''(기계 등을 통해)글자나 숫자를 찍는 일''라는 뜻입니다.', 2, 20, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '납기', FALSE, 1),
    (gen_random_uuid(), q_id, '발주', FALSE, 2),
    (gen_random_uuid(), q_id, '(기계 등을 통해)글자나 숫자를 찍는 일', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「励行」의 의미로 올바른 것은?', '励行(れいこう)는 ''여행''라는 뜻입니다.', 2, 21, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사정을 짐작하여 승낙[허락]함', FALSE, 1),
    (gen_random_uuid(), q_id, '여행', TRUE, 2),
    (gen_random_uuid(), q_id, '차별화', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「速やかな」의 의미로 올바른 것은?', '速やかな(すみやかな)는 ''신속한''라는 뜻입니다.', 2, 22, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신속한', TRUE, 1),
    (gen_random_uuid(), q_id, '임시 대응', FALSE, 2),
    (gen_random_uuid(), q_id, '신고', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「心掛ける」의 의미로 올바른 것은?', '心掛ける(こころかける)는 ''마음에 새기다''라는 뜻입니다.', 2, 23, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '검수/수령 확인', FALSE, 1),
    (gen_random_uuid(), q_id, '전념', FALSE, 2),
    (gen_random_uuid(), q_id, '마음에 새기다', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「整理整頓」의 의미로 올바른 것은?', '整理整頓(せいりせいとん)는 ''정리정돈''라는 뜻입니다.', 2, 24, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상해', FALSE, 1),
    (gen_random_uuid(), q_id, '정리정돈', TRUE, 2),
    (gen_random_uuid(), q_id, '지니다', FALSE, 3),
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「所定」의 의미로 올바른 것은?', '所定(しょてい)는 ''소정''라는 뜻입니다.', 2, 25, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '부위', FALSE, 1),
    (gen_random_uuid(), q_id, '신속', FALSE, 2),
    (gen_random_uuid(), q_id, '소정', TRUE, 3),
    (gen_random_uuid(), q_id, '와이어프레임', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「届出」의 의미로 올바른 것은?', '届出(とどけで)는 ''신고''라는 뜻입니다.', 2, 26, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신고', TRUE, 1),
    (gen_random_uuid(), q_id, '추장', FALSE, 2),
    (gen_random_uuid(), q_id, '상위', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「やむを得ない」의 의미로 올바른 것은?', 'やむを得ない(やむをえない)는 ''어쩔 수 없다''라는 뜻입니다.', 2, 27, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '발주', FALSE, 1),
    (gen_random_uuid(), q_id, '원격', FALSE, 2),
    (gen_random_uuid(), q_id, '멱등성', FALSE, 3),
    (gen_random_uuid(), q_id, '어쩔 수 없다', TRUE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「名札」의 의미로 올바른 것은?', '名札(なふだ)는 ''명찰''라는 뜻입니다.', 2, 28, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '체결', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 메일', FALSE, 2),
    (gen_random_uuid(), q_id, '명찰', TRUE, 3),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「みだり」의 의미로 올바른 것은?', 'みだり는 ''무분별함''라는 뜻입니다.', 2, 29, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '감사', FALSE, 1),
    (gen_random_uuid(), q_id, '무분별함', TRUE, 2),
    (gen_random_uuid(), q_id, '벤더', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「執務」의 의미로 올바른 것은?', '執務(しつむ)는 ''집무''라는 뜻입니다.', 2, 30, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '집무', TRUE, 1),
    (gen_random_uuid(), q_id, '보고・연락・상담', FALSE, 2),
    (gen_random_uuid(), q_id, '각하', FALSE, 3),
    (gen_random_uuid(), q_id, '품질 보증', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「帯びる」의 의미로 올바른 것은?', '帯びる(おびる)는 ''지니다''라는 뜻입니다.', 2, 31, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '무분별함', FALSE, 1),
    (gen_random_uuid(), q_id, '지니다', TRUE, 2),
    (gen_random_uuid(), q_id, '보고・연락・상담', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「窃盗」의 의미로 올바른 것은?', '窃盗(せっとう)는 ''절도''라는 뜻입니다.', 2, 32, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정수', FALSE, 1),
    (gen_random_uuid(), q_id, '기축', FALSE, 2),
    (gen_random_uuid(), q_id, '절도', TRUE, 3),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「横領」의 의미로 올바른 것은?', '横領(おうりょう)는 ''횡령''라는 뜻입니다.', 2, 33, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '취급', FALSE, 1),
    (gen_random_uuid(), q_id, '마련하다', FALSE, 2),
    (gen_random_uuid(), q_id, '횡령', TRUE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「傷害」의 의미로 올바른 것은?', '傷害(しょうがい)는 ''상해''라는 뜻입니다.', 2, 34, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수선', FALSE, 1),
    (gen_random_uuid(), q_id, '영구 대응', FALSE, 2),
    (gen_random_uuid(), q_id, '상해', TRUE, 3),
    (gen_random_uuid(), q_id, '미들웨어', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「刑法犯」의 의미로 올바른 것은?', '刑法犯(けいほうはん)는 ''형법 위반''라는 뜻입니다.', 2, 35, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '고객', FALSE, 1),
    (gen_random_uuid(), q_id, '형법 위반', TRUE, 2),
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 3),
    (gen_random_uuid(), q_id, '리뷰 지적', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「損害賠償」의 의미로 올바른 것은?', '損害賠償(そんがいばいしょう)는 ''손해배상''라는 뜻입니다.', 2, 36, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '어쩔 수 없다', FALSE, 1),
    (gen_random_uuid(), q_id, '동의서', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '손해배상', TRUE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「持込」의 의미로 올바른 것은?', '持込(もちこめ)는 ''지참''라는 뜻입니다.', 2, 37, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사정을 짐작하여 승낙[허락]함', FALSE, 1),
    (gen_random_uuid(), q_id, '지참', TRUE, 2),
    (gen_random_uuid(), q_id, '차별화', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「持出し」의 의미로 올바른 것은?', '持出し(もちだし)는 ''반출''라는 뜻입니다.', 2, 38, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '창출', FALSE, 1),
    (gen_random_uuid(), q_id, '형법 위반', FALSE, 2),
    (gen_random_uuid(), q_id, '반출', TRUE, 3),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「抜き打ち」의 의미로 올바른 것은?', '抜き打ち(ぬきうち)는 ''예고 없이 실시하는 것''라는 뜻입니다.', 2, 39, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배제', FALSE, 1),
    (gen_random_uuid(), q_id, '예고 없이 실시하는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '신고', FALSE, 3),
    (gen_random_uuid(), q_id, '직함', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「相応しい」의 의미로 올바른 것은?', '相応しい(ふさわしい)는 ''어울리다''라는 뜻입니다.', 2, 40, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기한', FALSE, 1),
    (gen_random_uuid(), q_id, '전화 응대', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트 계획서', FALSE, 3),
    (gen_random_uuid(), q_id, '어울리다', TRUE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「極力」의 의미로 올바른 것은?', '極力(きょくりょく)는 ''극력''라는 뜻입니다.', 2, 41, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '극력', TRUE, 1),
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 2),
    (gen_random_uuid(), q_id, '유지보수', FALSE, 3),
    (gen_random_uuid(), q_id, '정기 회의', FALSE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「予め」의 의미로 올바른 것은?', '予め(あらかじめ)는 ''미리''라는 뜻입니다.', 2, 42, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유지보수', FALSE, 1),
    (gen_random_uuid(), q_id, '미리', TRUE, 2),
    (gen_random_uuid(), q_id, '시주', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「乱す」의 의미로 올바른 것은?', '乱す(みだす)는 ''어지럽히다''라는 뜻입니다.', 2, 43, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '해약', FALSE, 1),
    (gen_random_uuid(), q_id, '억제', FALSE, 2),
    (gen_random_uuid(), q_id, '어지럽히다', TRUE, 3),
    (gen_random_uuid(), q_id, '미들웨어', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「迅速」의 의미로 올바른 것은?', '迅速(じんそく)는 ''신속''라는 뜻입니다.', 2, 44, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신속', TRUE, 1),
    (gen_random_uuid(), q_id, '출장', FALSE, 2),
    (gen_random_uuid(), q_id, '준수', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「仰ぐ」의 의미로 올바른 것은?', '仰ぐ(あおぐ)는 ''우러러보다''라는 뜻입니다.', 2, 45, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '우러러보다', TRUE, 1),
    (gen_random_uuid(), q_id, '임시 대응', FALSE, 2),
    (gen_random_uuid(), q_id, '소정', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「望ましい」의 의미로 올바른 것은?', '望ましい(のぞましい)는 ''바람직하다''라는 뜻입니다.', 2, 46, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '바람직하다', TRUE, 1),
    (gen_random_uuid(), q_id, '위약금', FALSE, 2),
    (gen_random_uuid(), q_id, '의심 물품', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「怠る」의 의미로 올바른 것은?', '怠る(おこたる)는 ''게으름을 피우다''라는 뜻입니다.', 2, 47, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '축적', FALSE, 1),
    (gen_random_uuid(), q_id, '절도', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 3),
    (gen_random_uuid(), q_id, '게으름을 피우다', TRUE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「遺失物」의 의미로 올바른 것은?', '遺失物(いしつぶつ)는 ''유실물''라는 뜻입니다.', 2, 48, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유실물', TRUE, 1),
    (gen_random_uuid(), q_id, '서류', FALSE, 2),
    (gen_random_uuid(), q_id, '헬프데스크', FALSE, 3),
    (gen_random_uuid(), q_id, '품질 보증', FALSE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「不審物」의 의미로 올바른 것은?', '不審物(ふしんぶつ)는 ''의심 물품''라는 뜻입니다.', 2, 49, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '제어', FALSE, 1),
    (gen_random_uuid(), q_id, '신속', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', FALSE, 3),
    (gen_random_uuid(), q_id, '의심 물품', TRUE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「前置き」의 의미로 올바른 것은?', '前置き(まえおき)는 ''서론''라는 뜻입니다.', 2, 50, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서론', TRUE, 1),
    (gen_random_uuid(), q_id, '가동', FALSE, 2),
    (gen_random_uuid(), q_id, '문명', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

END $$;

-- ============================================
-- it vocabulary (40 new questions, 1 quizzes)
-- ============================================

DO $$
DECLARE quiz_id UUID := 'b1000001-0000-0000-0000-000000000009';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第9回', 'it_terminology', 70, 15)
  ON CONFLICT (id) DO NOTHING;

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ブランチ」의 의미로 올바른 것은?', 'ブランチ(ブランチ)는 ''브랜치''라는 뜻입니다.', 2, 1, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '핫픽스', FALSE, 1),
    (gen_random_uuid(), q_id, '템플릿', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트 계획서', FALSE, 3),
    (gen_random_uuid(), q_id, '브랜치', TRUE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「パッケージ」의 의미로 올바른 것은?', 'パッケージ(パッケージ)는 ''패키지''라는 뜻입니다.', 2, 2, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '미들웨어', FALSE, 1),
    (gen_random_uuid(), q_id, '패키지', TRUE, 2),
    (gen_random_uuid(), q_id, '리버스 프록시', FALSE, 3),
    (gen_random_uuid(), q_id, '차별화', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「モジュール」의 의미로 올바른 것은?', 'モジュール(モジュール)는 ''모듈''라는 뜻입니다.', 2, 3, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 센터', FALSE, 1),
    (gen_random_uuid(), q_id, '빌드', FALSE, 2),
    (gen_random_uuid(), q_id, '모듈', TRUE, 3),
    (gen_random_uuid(), q_id, '컴포넌트 다이어그램', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テンプレート」의 의미로 올바른 것은?', 'テンプレート(テンプレート)는 ''템플릿''라는 뜻입니다.', 2, 4, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '템플릿', TRUE, 1),
    (gen_random_uuid(), q_id, '네트워크', FALSE, 2),
    (gen_random_uuid(), q_id, '백엔드', FALSE, 3),
    (gen_random_uuid(), q_id, '컴포넌트 다이어그램', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「実装」의 의미로 올바른 것은?', '実装(じっそう)는 ''구현''라는 뜻입니다.', 2, 5, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '구현', TRUE, 1),
    (gen_random_uuid(), q_id, '머지', FALSE, 2),
    (gen_random_uuid(), q_id, '확장성', FALSE, 3),
    (gen_random_uuid(), q_id, '파견', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SSL証明書」의 의미로 올바른 것은?', 'SSL証明書(エスエスエルしょうめいしょ)는 ''SSL 인증서''라는 뜻입니다.', 2, 6, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SSL 인증서', TRUE, 1),
    (gen_random_uuid(), q_id, '아키텍처', FALSE, 2),
    (gen_random_uuid(), q_id, '프레임워크', FALSE, 3),
    (gen_random_uuid(), q_id, '워터폴', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「モニタリング」의 의미로 올바른 것은?', 'モニタリング(モニタリング)는 ''모니터링''라는 뜻입니다.', 2, 7, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '건물·기계 등의 관리[보수]·유지', FALSE, 1),
    (gen_random_uuid(), q_id, '모니터링', TRUE, 2),
    (gen_random_uuid(), q_id, '패치', FALSE, 3),
    (gen_random_uuid(), q_id, '어울리다', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ログ管理」의 의미로 올바른 것은?', 'ログ管理(ログかんり)는 ''로그 관리''라는 뜻입니다.', 2, 8, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그 관리', TRUE, 1),
    (gen_random_uuid(), q_id, '멱등성', FALSE, 2),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 3),
    (gen_random_uuid(), q_id, '파견', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「プロキシ」의 의미로 올바른 것은?', 'プロキシ(プロキシ)는 ''프록시''라는 뜻입니다.', 2, 9, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프록시', TRUE, 1),
    (gen_random_uuid(), q_id, '네트워크', FALSE, 2),
    (gen_random_uuid(), q_id, '백엔드', FALSE, 3),
    (gen_random_uuid(), q_id, '촉진', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ネットワーク」의 의미로 올바른 것은?', 'ネットワーク(ネットワーク)는 ''네트워크''라는 뜻입니다.', 2, 10, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '환경 변수', FALSE, 1),
    (gen_random_uuid(), q_id, 'Validation(밸리데이션)', FALSE, 2),
    (gen_random_uuid(), q_id, '네트워크', TRUE, 3),
    (gen_random_uuid(), q_id, '컴포넌트 다이어그램', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「パッチ」의 의미로 올바른 것은?', 'パッチ(パッチ)는 ''패치''라는 뜻입니다.', 2, 11, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그', FALSE, 1),
    (gen_random_uuid(), q_id, '패치', TRUE, 2),
    (gen_random_uuid(), q_id, 'Deploy(배포)', FALSE, 3),
    (gen_random_uuid(), q_id, '리소스', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「セキュリティ」의 의미로 올바른 것은?', 'セキュリティ(セキュリティ)는 ''보안''라는 뜻입니다.', 2, 12, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보안', TRUE, 1),
    (gen_random_uuid(), q_id, '프록시', FALSE, 2),
    (gen_random_uuid(), q_id, '구현', FALSE, 3),
    (gen_random_uuid(), q_id, '기기배치', FALSE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「データセンター」의 의미로 올바른 것은?', 'データセンター(データセンター)는 ''데이터 센터''라는 뜻입니다.', 2, 13, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '핫픽스', FALSE, 1),
    (gen_random_uuid(), q_id, '모듈', FALSE, 2),
    (gen_random_uuid(), q_id, '포괄적', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터 센터', TRUE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ホットフィックス」의 의미로 올바른 것은?', 'ホットフィックス(ホットフィックス)는 ''핫픽스''라는 뜻입니다.', 2, 14, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 1),
    (gen_random_uuid(), q_id, '핫픽스', TRUE, 2),
    (gen_random_uuid(), q_id, '프록시', FALSE, 3),
    (gen_random_uuid(), q_id, '스텁', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ロールバック」의 의미로 올바른 것은?', 'ロールバック(ロールバック)는 ''롤백''라는 뜻입니다.', 2, 15, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '백엔드', FALSE, 1),
    (gen_random_uuid(), q_id, '확장성', FALSE, 2),
    (gen_random_uuid(), q_id, '롤백', TRUE, 3),
    (gen_random_uuid(), q_id, '파견', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「デプロイパイプライン」의 의미로 올바른 것은?', 'デプロイパイプライン(デプロイパイプライン)는 ''배포 파이프라인''라는 뜻입니다.', 2, 16, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그', FALSE, 1),
    (gen_random_uuid(), q_id, 'Deploy(배포)', FALSE, 2),
    (gen_random_uuid(), q_id, '스프린트', FALSE, 3),
    (gen_random_uuid(), q_id, '배포 파이프라인', TRUE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「グレード」의 의미로 올바른 것은?', 'グレード(ぐれーど)는 ''그레이드''라는 뜻입니다.', 2, 17, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그', FALSE, 1),
    (gen_random_uuid(), q_id, '그레이드', TRUE, 2),
    (gen_random_uuid(), q_id, 'Deploy(배포)', FALSE, 3),
    (gen_random_uuid(), q_id, '스프린트', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「移行性」의 의미로 올바른 것은?', '移行性(いこうせい)는 ''이행''라는 뜻입니다.', 2, 18, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '건물·기계 등의 관리[보수]·유지', FALSE, 1),
    (gen_random_uuid(), q_id, '행목(몇 번째 줄)', FALSE, 2),
    (gen_random_uuid(), q_id, '이행', TRUE, 3),
    (gen_random_uuid(), q_id, '파견', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「入出力系」의 의미로 올바른 것은?', '入出力系(にゅうしゅつりょくけい)는 ''입출력계''라는 뜻입니다.', 2, 19, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이행', FALSE, 1),
    (gen_random_uuid(), q_id, '입출력계', TRUE, 2),
    (gen_random_uuid(), q_id, '프록시', FALSE, 3),
    (gen_random_uuid(), q_id, '「損失」と「利益」손익', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「メンテナンス」의 의미로 올바른 것은?', 'メンテナンス는 ''건물·기계 등의 관리[보수]·유지''라는 뜻입니다.', 2, 20, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '건물·기계 등의 관리[보수]·유지', TRUE, 1),
    (gen_random_uuid(), q_id, '풀 리퀘스트', FALSE, 2),
    (gen_random_uuid(), q_id, '패키지', FALSE, 3),
    (gen_random_uuid(), q_id, '촉진', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「行目」의 의미로 올바른 것은?', '行目(ぎょうめ)는 ''행목(몇 번째 줄)''라는 뜻입니다.', 2, 21, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모듈', FALSE, 1),
    (gen_random_uuid(), q_id, '프로코드', FALSE, 2),
    (gen_random_uuid(), q_id, '행목(몇 번째 줄)', TRUE, 3),
    (gen_random_uuid(), q_id, '디버깅', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「カスタマイズ」의 의미로 올바른 것은?', 'カスタマイズ는 ''커스터마이즈''라는 뜻입니다.', 2, 22, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소스코드', FALSE, 1),
    (gen_random_uuid(), q_id, '플로', FALSE, 2),
    (gen_random_uuid(), q_id, '스프린트', FALSE, 3),
    (gen_random_uuid(), q_id, '커스터마이즈', TRUE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「疎結合」의 의미로 올바른 것은?', '疎結合(そけつごう)는 ''소결합(결합이 느슨한 상태)''라는 뜻입니다.', 2, 23, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배포 파이프라인', FALSE, 1),
    (gen_random_uuid(), q_id, '방화벽', FALSE, 2),
    (gen_random_uuid(), q_id, '소결합(결합이 느슨한 상태)', TRUE, 3),
    (gen_random_uuid(), q_id, '테스트 실시', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リード」의 의미로 올바른 것은?', 'リード(りーど)는 ''리드''라는 뜻입니다.', 2, 24, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기대값', FALSE, 1),
    (gen_random_uuid(), q_id, '자리 배치', FALSE, 2),
    (gen_random_uuid(), q_id, '배제', FALSE, 3),
    (gen_random_uuid(), q_id, '리드', TRUE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「レビュー」의 의미로 올바른 것은?', 'レビュー(れびゅー)는 ''리뷰''라는 뜻입니다.', 2, 25, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리뷰', TRUE, 1),
    (gen_random_uuid(), q_id, '클라우드', FALSE, 2),
    (gen_random_uuid(), q_id, '소스코드', FALSE, 3),
    (gen_random_uuid(), q_id, '위탁', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「エラーハンドリング」의 의미로 올바른 것은?', 'エラーハンドリング(えらーはんどりんぐ)는 ''Error handling(에러 핸들링)''라는 뜻입니다.', 2, 26, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로코드', FALSE, 1),
    (gen_random_uuid(), q_id, 'Error handling(에러 핸들링)', TRUE, 2),
    (gen_random_uuid(), q_id, '구현', FALSE, 3),
    (gen_random_uuid(), q_id, '리소스', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ページネーション」의 의미로 올바른 것은?', 'ページネーション(ぺーじねーしょん)는 ''Pagination(페이지네이션)''라는 뜻입니다.', 2, 27, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Pagination(페이지네이션)', TRUE, 1),
    (gen_random_uuid(), q_id, '스토리지', FALSE, 2),
    (gen_random_uuid(), q_id, '포트 번호', FALSE, 3),
    (gen_random_uuid(), q_id, '예외계(테스트 공정)', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バリデーション」의 의미로 올바른 것은?', 'バリデーション(ばりでーしょん)는 ''Validation(밸리데이션)''라는 뜻입니다.', 2, 28, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그 관리', FALSE, 1),
    (gen_random_uuid(), q_id, '행목(몇 번째 줄)', FALSE, 2),
    (gen_random_uuid(), q_id, 'Validation(밸리데이션)', TRUE, 3),
    (gen_random_uuid(), q_id, '예외계(테스트 공정)', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「入力チェック」의 의미로 올바른 것은?', '入力チェック(にゅうりょくちぇっく)는 ''입력 체크(검증)''라는 뜻입니다.', 2, 29, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그 관리', FALSE, 1),
    (gen_random_uuid(), q_id, '행목(몇 번째 줄)', FALSE, 2),
    (gen_random_uuid(), q_id, '입력 체크(검증)', TRUE, 3),
    (gen_random_uuid(), q_id, '무분별함', FALSE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リモート」의 의미로 올바른 것은?', 'リモート(りもーと)는 ''리모트(원격)''라는 뜻입니다.', 2, 30, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리모트(원격)', TRUE, 1),
    (gen_random_uuid(), q_id, '노코드', FALSE, 2),
    (gen_random_uuid(), q_id, '온프레미스', FALSE, 3),
    (gen_random_uuid(), q_id, '촉진', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「フロントエンド」의 의미로 올바른 것은?', 'フロントエンド(ふろんとえんど)는 ''프론트엔드''라는 뜻입니다.', 2, 31, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리드', FALSE, 1),
    (gen_random_uuid(), q_id, '프론트엔드', TRUE, 2),
    (gen_random_uuid(), q_id, '리뷰', FALSE, 3),
    (gen_random_uuid(), q_id, '차별화', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バックエンド」의 의미로 올바른 것은?', 'バックエンド(ばっくえんど)는 ''백엔드''라는 뜻입니다.', 2, 32, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '노코드', FALSE, 1),
    (gen_random_uuid(), q_id, '온프레미스', FALSE, 2),
    (gen_random_uuid(), q_id, '백엔드', TRUE, 3),
    (gen_random_uuid(), q_id, '유지보수 운영', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ロジック」의 의미로 올바른 것은?', 'ロジック(ろじっく)는 ''로직''라는 뜻입니다.', 2, 33, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '컴파일', FALSE, 1),
    (gen_random_uuid(), q_id, '건물·기계 등의 관리[보수]·유지', FALSE, 2),
    (gen_random_uuid(), q_id, '항목', FALSE, 3),
    (gen_random_uuid(), q_id, '로직', TRUE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ログイン」의 의미로 올바른 것은?', 'ログイン(ろぐいん)는 ''로그인''라는 뜻입니다.', 2, 34, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그인', TRUE, 1),
    (gen_random_uuid(), q_id, '프록시', FALSE, 2),
    (gen_random_uuid(), q_id, 'Deploy(배포)', FALSE, 3),
    (gen_random_uuid(), q_id, '디버깅', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「環境設定」의 의미로 올바른 것은?', '環境設定(かんきょうせってい)는 ''환경설정''라는 뜻입니다.', 2, 35, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '그레이드', FALSE, 1),
    (gen_random_uuid(), q_id, '모니터링', FALSE, 2),
    (gen_random_uuid(), q_id, '환경설정', TRUE, 3),
    (gen_random_uuid(), q_id, '부감', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ローグ」의 의미로 올바른 것은?', 'ローグ(ろーぐ)는 ''로그''라는 뜻입니다.', 2, 36, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '멱등성', FALSE, 1),
    (gen_random_uuid(), q_id, '로그', TRUE, 2),
    (gen_random_uuid(), q_id, '이중화', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 계획서', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「フロー」의 의미로 올바른 것은?', 'フロー(ふろー)는 ''플로''라는 뜻입니다.', 2, 37, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '그레이드', FALSE, 1),
    (gen_random_uuid(), q_id, '모니터링', FALSE, 2),
    (gen_random_uuid(), q_id, '플로', TRUE, 3),
    (gen_random_uuid(), q_id, '부감', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ローコード」의 의미로 올바른 것은?', 'ローコード(ろーこーど)는 ''로코드''라는 뜻입니다.', 2, 38, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '패키지', FALSE, 1),
    (gen_random_uuid(), q_id, '로코드', TRUE, 2),
    (gen_random_uuid(), q_id, '리모트(원격)', FALSE, 3),
    (gen_random_uuid(), q_id, '차별화', FALSE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ノーコード」의 의미로 올바른 것은?', 'ノーコード(のーこーど)는 ''노코드''라는 뜻입니다.', 2, 39, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배포 파이프라인', FALSE, 1),
    (gen_random_uuid(), q_id, '방화벽', FALSE, 2),
    (gen_random_uuid(), q_id, '노코드', TRUE, 3),
    (gen_random_uuid(), q_id, '디버깅', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「プロコード」의 의미로 올바른 것은?', 'プロコード(ぷろこーど)는 ''프로코드''라는 뜻입니다.', 2, 40, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로코드', TRUE, 1),
    (gen_random_uuid(), q_id, '환경 변수', FALSE, 2),
    (gen_random_uuid(), q_id, 'Pagination(페이지네이션)', FALSE, 3),
    (gen_random_uuid(), q_id, '파견', FALSE, 4);

END $$;

-- ============================================
-- dev vocabulary (94 new questions, 2 quizzes)
-- ============================================

DO $$
DECLARE quiz_id UUID := 'b1000001-0000-0000-0000-00000000000a';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第10回', 'it_terminology', 70, 15)
  ON CONFLICT (id) DO NOTHING;

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「不具合」의 의미로 올바른 것은?', '不具合(ふぐあい)는 ''결함''라는 뜻입니다.', 2, 1, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '결함', TRUE, 1),
    (gen_random_uuid(), q_id, '시스템 구성도', FALSE, 2),
    (gen_random_uuid(), q_id, '시퀀스 다이어그램', FALSE, 3),
    (gen_random_uuid(), q_id, '압박', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「障害」의 의미로 올바른 것은?', '障害(しょうがい)는 ''장애''라는 뜻입니다.', 2, 2, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스크럼 마스터', FALSE, 1),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 2),
    (gen_random_uuid(), q_id, '잔업/야근', FALSE, 3),
    (gen_random_uuid(), q_id, '장애', TRUE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「セキュリティテスト」의 의미로 올바른 것은?', 'セキュリティテスト(セキュリティテスト)는 ''보안 테스트''라는 뜻입니다.', 2, 3, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 1),
    (gen_random_uuid(), q_id, '이해관계자', FALSE, 2),
    (gen_random_uuid(), q_id, '기술 부채', FALSE, 3),
    (gen_random_uuid(), q_id, '보안 테스트', TRUE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テストデータ」의 의미로 올바른 것은?', 'テストデータ(テストデータ)는 ''테스트 데이터''라는 뜻입니다.', 2, 4, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '탑재', FALSE, 1),
    (gen_random_uuid(), q_id, '테스트 데이터', TRUE, 2),
    (gen_random_uuid(), q_id, '테스트 계획서', FALSE, 3),
    (gen_random_uuid(), q_id, '빌드', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バグ票」의 의미로 올바른 것은?', 'バグ票(ばぐひょう)는 ''버그 티켓''라는 뜻입니다.', 2, 5, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '버그 티켓', TRUE, 1),
    (gen_random_uuid(), q_id, '기안서', FALSE, 2),
    (gen_random_uuid(), q_id, '구축', FALSE, 3),
    (gen_random_uuid(), q_id, '호각을다투다', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テスト実施」의 의미로 올바른 것은?', 'テスト実施(テストじっし)는 ''테스트 실시''라는 뜻입니다.', 2, 6, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요건정의서', FALSE, 1),
    (gen_random_uuid(), q_id, '항목', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 센터', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 실시', TRUE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「期待値」의 의미로 올바른 것은?', '期待値(きたいち)는 ''기대값''라는 뜻입니다.', 2, 7, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기대값', TRUE, 1),
    (gen_random_uuid(), q_id, '명세서', FALSE, 2),
    (gen_random_uuid(), q_id, '시퀀스 다이어그램', FALSE, 3),
    (gen_random_uuid(), q_id, '클라우드', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「実測値」의 의미로 올바른 것은?', '実測値(じっそくち)는 ''실측값''라는 뜻입니다.', 2, 8, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스크럼', FALSE, 1),
    (gen_random_uuid(), q_id, '에스컬레이션', FALSE, 2),
    (gen_random_uuid(), q_id, '패키지', FALSE, 3),
    (gen_random_uuid(), q_id, '실측값', TRUE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リグレッション」의 의미로 올바른 것은?', 'リグレッション(リグレッション)는 ''리그레션''라는 뜻입니다.', 2, 9, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이해', FALSE, 1),
    (gen_random_uuid(), q_id, '잘라 나누는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '리그레션', TRUE, 3),
    (gen_random_uuid(), q_id, '프록시', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「再現手順」의 의미로 올바른 것은?', '再現手順(さいげんてじゅん)는 ''재현 절차''라는 뜻입니다.', 2, 10, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '재현 절차', TRUE, 1),
    (gen_random_uuid(), q_id, '부하 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '컴포넌트 다이어그램', FALSE, 3),
    (gen_random_uuid(), q_id, '각하', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「画面設計書」의 의미로 올바른 것은?', '画面設計書(がめんせっけいしょ)는 ''화면 설계서''라는 뜻입니다.', 2, 11, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 1),
    (gen_random_uuid(), q_id, '잘라 나누는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '화면 설계서', TRUE, 3),
    (gen_random_uuid(), q_id, '프록시', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ER図」의 의미로 올바른 것은?', 'ER図(イーアールず)는 ''ER 다이어그램''라는 뜻입니다.', 2, 12, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스프린트', FALSE, 1),
    (gen_random_uuid(), q_id, '간트 차트', FALSE, 2),
    (gen_random_uuid(), q_id, 'ER 다이어그램', TRUE, 3),
    (gen_random_uuid(), q_id, '검수/수령 확인', FALSE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「フローチャート」의 의미로 올바른 것은?', 'フローチャート(フローチャート)는 ''플로우차트''라는 뜻입니다.', 2, 13, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정상계(테스트 공정)', FALSE, 1),
    (gen_random_uuid(), q_id, '단위 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', TRUE, 3),
    (gen_random_uuid(), q_id, '억제', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「シーケンス図」의 의미로 올바른 것은?', 'シーケンス図(シーケンスず)는 ''시퀀스 다이어그램''라는 뜻입니다.', 2, 14, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '대표이사', FALSE, 1),
    (gen_random_uuid(), q_id, '릴리스', FALSE, 2),
    (gen_random_uuid(), q_id, '준수', FALSE, 3),
    (gen_random_uuid(), q_id, '시퀀스 다이어그램', TRUE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「クラス図」의 의미로 올바른 것은?', 'クラス図(クラスず)는 ''클래스 다이어그램''라는 뜻입니다.', 2, 15, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클래스 다이어그램', TRUE, 1),
    (gen_random_uuid(), q_id, '상세설계서', FALSE, 2),
    (gen_random_uuid(), q_id, '데일리 스탠드업', FALSE, 3),
    (gen_random_uuid(), q_id, '예고 없이 실시하는 것', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ユースケース図」의 의미로 올바른 것은?', 'ユースケース図(ユースケースず)는 ''유스케이스 다이어그램''라는 뜻입니다.', 2, 16, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유스케이스 다이어그램', TRUE, 1),
    (gen_random_uuid(), q_id, '품질 보증', FALSE, 2),
    (gen_random_uuid(), q_id, '구축', FALSE, 3),
    (gen_random_uuid(), q_id, '롤백', FALSE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「状態遷移図」의 의미로 올바른 것은?', '状態遷移図(じょうたいせんいず)는 ''상태 전이도''라는 뜻입니다.', 2, 17, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '항목', FALSE, 1),
    (gen_random_uuid(), q_id, '공통 설계', FALSE, 2),
    (gen_random_uuid(), q_id, '상태 전이도', TRUE, 3),
    (gen_random_uuid(), q_id, '라이브러리', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「機能仕様書」의 의미로 올바른 것은?', '機能仕様書(きのうしようしょ)는 ''기능 사양서''라는 뜻입니다.', 2, 18, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기대값', FALSE, 1),
    (gen_random_uuid(), q_id, '기능 사양서', TRUE, 2),
    (gen_random_uuid(), q_id, '상세설계서', FALSE, 3),
    (gen_random_uuid(), q_id, '백엔드', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「非機能要件」의 의미로 올바른 것은?', '非機能要件(ひきのうようけん)는 ''비기능 요건''라는 뜻입니다.', 2, 19, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '탑재', FALSE, 1),
    (gen_random_uuid(), q_id, '비기능 요건', TRUE, 2),
    (gen_random_uuid(), q_id, '테스트 계획서', FALSE, 3),
    (gen_random_uuid(), q_id, '풀 리퀘스트', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「データベース設計」의 의미로 올바른 것은?', 'データベース設計(データベースせっけい)는 ''데이터베이스 설계''라는 뜻입니다.', 2, 20, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상태 전이도', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스 설계', TRUE, 2),
    (gen_random_uuid(), q_id, '부하 테스트', FALSE, 3),
    (gen_random_uuid(), q_id, '비즈니스 메일', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テーブル定義書」의 의미로 올바른 것은?', 'テーブル定義書(テーブルていぎしょ)는 ''테이블 정의서''라는 뜻입니다.', 2, 21, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '구분선', FALSE, 1),
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 2),
    (gen_random_uuid(), q_id, '테이블 정의서', TRUE, 3),
    (gen_random_uuid(), q_id, '집무', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「API仕様書」의 의미로 올바른 것은?', 'API仕様書(エーピーアイしようしょ)는 ''API 사양서''라는 뜻입니다.', 2, 22, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변경 관리', FALSE, 1),
    (gen_random_uuid(), q_id, '이해', FALSE, 2),
    (gen_random_uuid(), q_id, '패키지', FALSE, 3),
    (gen_random_uuid(), q_id, 'API 사양서', TRUE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「画面遷移図」의 의미로 올바른 것은?', '画面遷移図(がめんせんいず)는 ''화면 전이도''라는 뜻입니다.', 2, 23, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ER 다이어그램', FALSE, 1),
    (gen_random_uuid(), q_id, '잘라 나누는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '화면 전이도', TRUE, 3),
    (gen_random_uuid(), q_id, '질문의 의도를 정확하게 파악하다', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ワイヤーフレーム」의 의미로 올바른 것은?', 'ワイヤーフレーム(ワイヤーフレーム)는 ''와이어프레임''라는 뜻입니다.', 2, 24, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '와이어프레임', TRUE, 1),
    (gen_random_uuid(), q_id, '구성도', FALSE, 2),
    (gen_random_uuid(), q_id, '버그 티켓', FALSE, 3),
    (gen_random_uuid(), q_id, '시주', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コンポーネント図」의 의미로 올바른 것은?', 'コンポーネント図(コンポーネントず)는 ''컴포넌트 다이어그램''라는 뜻입니다.', 2, 25, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사양서', FALSE, 1),
    (gen_random_uuid(), q_id, '비기능 요건', FALSE, 2),
    (gen_random_uuid(), q_id, '컴포넌트 다이어그램', TRUE, 3),
    (gen_random_uuid(), q_id, '우러러보다', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「システム構成図」의 의미로 올바른 것은?', 'システム構成図(システムこうせいず)는 ''시스템 구성도''라는 뜻입니다.', 2, 26, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시스템 구성도', TRUE, 1),
    (gen_random_uuid(), q_id, '컴포넌트 다이어그램', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 3),
    (gen_random_uuid(), q_id, '롤백', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ネットワーク構成図」의 의미로 올바른 것은?', 'ネットワーク構成図(ネットワークこうせいず)는 ''네트워크 구성도''라는 뜻입니다.', 2, 27, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '네트워크 구성도', TRUE, 1),
    (gen_random_uuid(), q_id, '출하', FALSE, 2),
    (gen_random_uuid(), q_id, '탑재', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「インフラ設計書」의 의미로 올바른 것은?', 'インフラ設計書(インフラせっけいしょ)는 ''인프라 설계서''라는 뜻입니다.', 2, 28, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코딩 규약', FALSE, 1),
    (gen_random_uuid(), q_id, '공통 설계', FALSE, 2),
    (gen_random_uuid(), q_id, '인프라 설계서', TRUE, 3),
    (gen_random_uuid(), q_id, '질문의 의도를 정확하게 파악하다', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「外部設計」의 의미로 올바른 것은?', '外部設計(がいぶせっけい)는 ''외부 설계''라는 뜻입니다.', 2, 29, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시스템 구성도', FALSE, 1),
    (gen_random_uuid(), q_id, '유스케이스 다이어그램', FALSE, 2),
    (gen_random_uuid(), q_id, '커밋', FALSE, 3),
    (gen_random_uuid(), q_id, '외부 설계', TRUE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「内部設計」의 의미로 올바른 것은?', '内部設計(ないぶせっけい)는 ''내부 설계''라는 뜻입니다.', 2, 30, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정합성', FALSE, 1),
    (gen_random_uuid(), q_id, '테스트 데이터', FALSE, 2),
    (gen_random_uuid(), q_id, '내부 설계', TRUE, 3),
    (gen_random_uuid(), q_id, '질문의 의도를 정확하게 파악하다', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「共通設計」의 의미로 올바른 것은?', '共通設計(きょうつうせっけい)는 ''공통 설계''라는 뜻입니다.', 2, 31, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공통 설계', TRUE, 1),
    (gen_random_uuid(), q_id, '에스컬레이션', FALSE, 2),
    (gen_random_uuid(), q_id, '버그 티켓', FALSE, 3),
    (gen_random_uuid(), q_id, '소결합(결합이 느슨한 상태)', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コーディング規約」의 의미로 올바른 것은?', 'コーディング規約(コーディングきやく)는 ''코딩 규약''라는 뜻입니다.', 2, 32, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '대표이사', FALSE, 1),
    (gen_random_uuid(), q_id, '릴리스', FALSE, 2),
    (gen_random_uuid(), q_id, '보고・연락・상담', FALSE, 3),
    (gen_random_uuid(), q_id, '코딩 규약', TRUE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「命名規則」의 의미로 올바른 것은?', '命名規則(めいめいきそく)는 ''명명 규칙''라는 뜻입니다.', 2, 33, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '명명 규칙', TRUE, 1),
    (gen_random_uuid(), q_id, '애자일', FALSE, 2),
    (gen_random_uuid(), q_id, '구축', FALSE, 3),
    (gen_random_uuid(), q_id, '맞붙다', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「レビュー指摘」의 의미로 올바른 것은?', 'レビュー指摘(レビューしてき)는 ''리뷰 지적''라는 뜻입니다.', 2, 34, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '내부 설계', FALSE, 1),
    (gen_random_uuid(), q_id, '네트워크 구성도', FALSE, 2),
    (gen_random_uuid(), q_id, '보고・연락・상담', FALSE, 3),
    (gen_random_uuid(), q_id, '리뷰 지적', TRUE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「設計変更」의 의미로 올바른 것은?', '設計変更(せっけいへんこう)는 ''설계 변경''라는 뜻입니다.', 2, 35, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '성능 테스트', FALSE, 1),
    (gen_random_uuid(), q_id, '변경 관리', FALSE, 2),
    (gen_random_uuid(), q_id, '설계 변경', TRUE, 3),
    (gen_random_uuid(), q_id, '「損失」と「利益」손익', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リリース」의 의미로 올바른 것은?', 'リリース(リリース)는 ''릴리스''라는 뜻입니다.', 2, 36, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리스크 관리', FALSE, 1),
    (gen_random_uuid(), q_id, '릴리스', TRUE, 2),
    (gen_random_uuid(), q_id, '출하', FALSE, 3),
    (gen_random_uuid(), q_id, '동의서', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「アジャイル」의 의미로 올바른 것은?', 'アジャイル(アジャイル)는 ''애자일''라는 뜻입니다.', 2, 37, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '애자일', TRUE, 1),
    (gen_random_uuid(), q_id, '연혁', FALSE, 2),
    (gen_random_uuid(), q_id, '스프린트', FALSE, 3),
    (gen_random_uuid(), q_id, '각하', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ウォーターフォール」의 의미로 올바른 것은?', 'ウォーターフォール(ウォーターフォール)는 ''워터폴''라는 뜻입니다.', 2, 38, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '칸반', FALSE, 1),
    (gen_random_uuid(), q_id, '이해관계자', FALSE, 2),
    (gen_random_uuid(), q_id, '유럽풍', FALSE, 3),
    (gen_random_uuid(), q_id, '워터폴', TRUE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「課題管理」의 의미로 올바른 것은?', '課題管理(かだいかんり)는 ''과제 관리''라는 뜻입니다.', 2, 39, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '체계적', FALSE, 1),
    (gen_random_uuid(), q_id, '과제 관리', TRUE, 2),
    (gen_random_uuid(), q_id, '예외계(테스트 공정)', FALSE, 3),
    (gen_random_uuid(), q_id, 'Deploy(배포)', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「変更管理」의 의미로 올바른 것은?', '変更管理(へんこうかんり)는 ''변경 관리''라는 뜻입니다.', 2, 40, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변경 관리', TRUE, 1),
    (gen_random_uuid(), q_id, '출하', FALSE, 2),
    (gen_random_uuid(), q_id, '탑재', FALSE, 3),
    (gen_random_uuid(), q_id, '환경설정', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スケジュール」의 의미로 올바른 것은?', 'スケジュール(スケジュール)는 ''스케줄''라는 뜻입니다.', 2, 41, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '구분선', FALSE, 1),
    (gen_random_uuid(), q_id, '견적', FALSE, 2),
    (gen_random_uuid(), q_id, '스케줄', TRUE, 3),
    (gen_random_uuid(), q_id, '원격', FALSE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「品質管理」의 의미로 올바른 것은?', '品質管理(ひんしつかんり)는 ''품질 관리''라는 뜻입니다.', 2, 42, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모크', FALSE, 1),
    (gen_random_uuid(), q_id, '견적', FALSE, 2),
    (gen_random_uuid(), q_id, '품질 관리', TRUE, 3),
    (gen_random_uuid(), q_id, '경어', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テスト計画書」의 의미로 올바른 것은?', 'テスト計画書(テストけいかくしょ)는 ''테스트 계획서''라는 뜻입니다.', 2, 43, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모크', FALSE, 1),
    (gen_random_uuid(), q_id, '견적', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트 계획서', TRUE, 3),
    (gen_random_uuid(), q_id, '질문의 의도를 정확하게 파악하다', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「要員計画」의 의미로 올바른 것은?', '要員計画(よういんけいかく)는 ''인원 계획''라는 뜻입니다.', 2, 44, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코딩 규약', FALSE, 1),
    (gen_random_uuid(), q_id, '인원 계획', TRUE, 2),
    (gen_random_uuid(), q_id, '명명 규칙', FALSE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「レビュー会」의 의미로 올바른 것은?', 'レビュー会(レビューかい)는 ''리뷰 회의''라는 뜻입니다.', 2, 45, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정합성', FALSE, 1),
    (gen_random_uuid(), q_id, '테스트 데이터', FALSE, 2),
    (gen_random_uuid(), q_id, '리뷰 회의', TRUE, 3),
    (gen_random_uuid(), q_id, '검수/수령 확인', FALSE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「定例会議」의 의미로 올바른 것은?', '定例会議(ていれいかいぎ)는 ''정기 회의''라는 뜻입니다.', 2, 46, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클래스 다이어그램', FALSE, 1),
    (gen_random_uuid(), q_id, '기술서', FALSE, 2),
    (gen_random_uuid(), q_id, '보고・연락・상담', FALSE, 3),
    (gen_random_uuid(), q_id, '정기 회의', TRUE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「成果物」의 의미로 올바른 것은?', '成果物(せいかぶつ)는 ''산출물''라는 뜻입니다.', 2, 47, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '결함', FALSE, 1),
    (gen_random_uuid(), q_id, '산출물', TRUE, 2),
    (gen_random_uuid(), q_id, '명명 규칙', FALSE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「受入基準」의 의미로 올바른 것은?', '受入基準(うけいれきじゅん)는 ''인수 기준''라는 뜻입니다.', 2, 48, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인수 기준', TRUE, 1),
    (gen_random_uuid(), q_id, '기안서', FALSE, 2),
    (gen_random_uuid(), q_id, '구축', FALSE, 3),
    (gen_random_uuid(), q_id, '각하', FALSE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「エスカレーション」의 의미로 올바른 것은?', 'エスカレーション(エスカレーション)는 ''에스컬레이션''라는 뜻입니다.', 2, 49, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리뷰 회의', FALSE, 1),
    (gen_random_uuid(), q_id, '에스컬레이션', TRUE, 2),
    (gen_random_uuid(), q_id, '부하 테스트', FALSE, 3),
    (gen_random_uuid(), q_id, '비즈니스 메일', FALSE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「設計書」의 의미로 올바른 것은?', '設計書(せっけいしょ)는 ''설계서・设计书''라는 뜻입니다.', 2, 50, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리뷰 회의', FALSE, 1),
    (gen_random_uuid(), q_id, '설계서・设计书', TRUE, 2),
    (gen_random_uuid(), q_id, '부하 테스트', FALSE, 3),
    (gen_random_uuid(), q_id, '유실물', FALSE, 4);

END $$;

DO $$
DECLARE quiz_id UUID := 'b1000001-0000-0000-0000-00000000000b';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第11回', 'it_terminology', 70, 15)
  ON CONFLICT (id) DO NOTHING;

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「整合性」의 의미로 올바른 것은?', '整合性(せいごうせい)는 ''정합성''라는 뜻입니다.', 2, 1, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '칸반', FALSE, 1),
    (gen_random_uuid(), q_id, '스크럼 마스터', FALSE, 2),
    (gen_random_uuid(), q_id, '준수', FALSE, 3),
    (gen_random_uuid(), q_id, '정합성', TRUE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「明細書」의 의미로 올바른 것은?', '明細書(めいさいしょ)는 ''명세서''라는 뜻입니다.', 2, 2, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '포괄적', FALSE, 1),
    (gen_random_uuid(), q_id, '요건정의서', FALSE, 2),
    (gen_random_uuid(), q_id, '명세서', TRUE, 3),
    (gen_random_uuid(), q_id, '입출력계', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「改修」의 의미로 올바른 것은?', '改修(かいしゅう)는 ''개수''라는 뜻입니다.', 2, 3, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비기능 요건', FALSE, 1),
    (gen_random_uuid(), q_id, '모크', FALSE, 2),
    (gen_random_uuid(), q_id, '기본기능', FALSE, 3),
    (gen_random_uuid(), q_id, '개수', TRUE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「仕様書」의 의미로 올바른 것은?', '仕様書(しようしょ)는 ''사양서''라는 뜻입니다.', 2, 4, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의록', FALSE, 1),
    (gen_random_uuid(), q_id, '사양서', TRUE, 2),
    (gen_random_uuid(), q_id, '상세 설계', FALSE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「構築」의 의미로 올바른 것은?', '構築(こうちく)는 ''구축''라는 뜻입니다.', 2, 5, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '구축', TRUE, 1),
    (gen_random_uuid(), q_id, '요건정의', FALSE, 2),
    (gen_random_uuid(), q_id, '프로토타입', FALSE, 3),
    (gen_random_uuid(), q_id, '이중화', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「見出し」의 의미로 올바른 것은?', '見出し(みだし)는 ''표제''라는 뜻입니다.', 2, 6, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '표제', TRUE, 1),
    (gen_random_uuid(), q_id, '명명 규칙', FALSE, 2),
    (gen_random_uuid(), q_id, '스프린트', FALSE, 3),
    (gen_random_uuid(), q_id, '각하', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「項目」의 의미로 올바른 것은?', '項目(こうもく)는 ''항목''라는 뜻입니다.', 2, 7, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시스템 구성도', FALSE, 1),
    (gen_random_uuid(), q_id, '유스케이스 다이어그램', FALSE, 2),
    (gen_random_uuid(), q_id, '이행', FALSE, 3),
    (gen_random_uuid(), q_id, '항목', TRUE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「肩書」의 의미로 올바른 것은?', '肩書(かたがき)는 ''직함''라는 뜻입니다.', 2, 8, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이해관계자', FALSE, 1),
    (gen_random_uuid(), q_id, '직함', TRUE, 2),
    (gen_random_uuid(), q_id, '출하', FALSE, 3),
    (gen_random_uuid(), q_id, '풀 리퀘스트', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「沿革」의 의미로 올바른 것은?', '沿革(えんかく)는 ''연혁''라는 뜻입니다.', 2, 9, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '연혁', TRUE, 1),
    (gen_random_uuid(), q_id, '기안서', FALSE, 2),
    (gen_random_uuid(), q_id, '사양서', FALSE, 3),
    (gen_random_uuid(), q_id, '호각을다투다', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「代表取締役」의 의미로 올바른 것은?', '代表取締役(だいひょうとりしまりやく)는 ''대표이사''라는 뜻입니다.', 2, 10, '初級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '포괄적', FALSE, 1),
    (gen_random_uuid(), q_id, '요건정의서', FALSE, 2),
    (gen_random_uuid(), q_id, '대표이사', TRUE, 3),
    (gen_random_uuid(), q_id, '로그', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「区切り線」의 의미로 올바른 것은?', '区切り線(くぎりせん)는 ''구분선''라는 뜻입니다.', 2, 11, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이상계(테스트 공정)', FALSE, 1),
    (gen_random_uuid(), q_id, '구분선', TRUE, 2),
    (gen_random_uuid(), q_id, '부하 테스트', FALSE, 3),
    (gen_random_uuid(), q_id, '상영', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「基本設計書」의 의미로 올바른 것은?', '基本設計書(きほんせっけいしょ)는 ''기본설계서''라는 뜻입니다.', 2, 12, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '테스트 계획서', FALSE, 1),
    (gen_random_uuid(), q_id, '기술서', FALSE, 2),
    (gen_random_uuid(), q_id, '이행', FALSE, 3),
    (gen_random_uuid(), q_id, '기본설계서', TRUE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「詳細設計書」의 의미로 올바른 것은?', '詳細設計書(しょうさいせっけいしょ)는 ''상세설계서''라는 뜻입니다.', 2, 13, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상세설계서', TRUE, 1),
    (gen_random_uuid(), q_id, '정합성', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 관리', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「マニュアル」의 의미로 올바른 것은?', 'マニュアル(まにゅある)는 ''메뉴얼''라는 뜻입니다.', 2, 14, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잘라 나누는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '기술서', FALSE, 2),
    (gen_random_uuid(), q_id, '유럽풍', FALSE, 3),
    (gen_random_uuid(), q_id, '메뉴얼', TRUE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「手順書」의 의미로 올바른 것은?', '手順書(てじゅんしょ)는 ''절차서''라는 뜻입니다.', 2, 15, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보안 테스트', FALSE, 1),
    (gen_random_uuid(), q_id, '절차서', TRUE, 2),
    (gen_random_uuid(), q_id, '품질 관리', FALSE, 3),
    (gen_random_uuid(), q_id, '경감', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「搭載」의 의미로 올바른 것은?', '搭載(とうさい)는 ''탑재''라는 뜻입니다.', 2, 16, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '메뉴얼', FALSE, 1),
    (gen_random_uuid(), q_id, '과제 관리', FALSE, 2),
    (gen_random_uuid(), q_id, '탑재', TRUE, 3),
    (gen_random_uuid(), q_id, '라이브러리', FALSE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「機器配置」의 의미로 올바른 것은?', '機器配置(ききはいち)는 ''기기배치''라는 뜻입니다.', 2, 17, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인수 기준', FALSE, 1),
    (gen_random_uuid(), q_id, '테스트 자동화', FALSE, 2),
    (gen_random_uuid(), q_id, '기기배치', TRUE, 3),
    (gen_random_uuid(), q_id, '여행', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「参考資料」의 의미로 올바른 것은?', '参考資料(さんこうしりょう)는 ''참고 자료''라는 뜻입니다.', 2, 18, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인프라 설계서', FALSE, 1),
    (gen_random_uuid(), q_id, '참고 자료', TRUE, 2),
    (gen_random_uuid(), q_id, 'API 사양서', FALSE, 3),
    (gen_random_uuid(), q_id, '정리정돈', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「組込み」의 의미로 올바른 것은?', '組込み(くみこみ)는 ''짜 넣는 일''라는 뜻입니다.', 2, 19, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클래스 다이어그램', FALSE, 1),
    (gen_random_uuid(), q_id, '기술서', FALSE, 2),
    (gen_random_uuid(), q_id, '보고・연락・상담', FALSE, 3),
    (gen_random_uuid(), q_id, '짜 넣는 일', TRUE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「適用作業」의 의미로 올바른 것은?', '適用作業(てきようさぎょう)는 ''적용작업''라는 뜻입니다.', 2, 20, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변경 관리', FALSE, 1),
    (gen_random_uuid(), q_id, '잘라 나누는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '적용작업', TRUE, 3),
    (gen_random_uuid(), q_id, '최우선', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「起案書」의 의미로 올바른 것은?', '起案書(きあんしょ)는 ''기안서''라는 뜻입니다.', 2, 21, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '테스트 환경', FALSE, 1),
    (gen_random_uuid(), q_id, '마일스톤', FALSE, 2),
    (gen_random_uuid(), q_id, '증명서', FALSE, 3),
    (gen_random_uuid(), q_id, '기안서', TRUE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「要件定義書」의 의미로 올바른 것은?', '要件定義書(ようけんていぎしょ)는 ''요건정의서''라는 뜻입니다.', 2, 22, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '재현 절차', FALSE, 1),
    (gen_random_uuid(), q_id, '기안서', FALSE, 2),
    (gen_random_uuid(), q_id, '요건정의서', TRUE, 3),
    (gen_random_uuid(), q_id, '모듈', FALSE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「仕様確認」의 의미로 올바른 것은?', '仕様確認(しようかくにん)는 ''사양확인''라는 뜻입니다.', 2, 23, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사양확인', TRUE, 1),
    (gen_random_uuid(), q_id, '디버깅', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 3),
    (gen_random_uuid(), q_id, '이중화', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「連携画面」의 의미로 올바른 것은?', '連携画面(れんけいがめん)는 ''연계화면''라는 뜻입니다.', 2, 24, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '버그', FALSE, 1),
    (gen_random_uuid(), q_id, '내부 설계', FALSE, 2),
    (gen_random_uuid(), q_id, '연계화면', TRUE, 3),
    (gen_random_uuid(), q_id, '로그', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「出荷」의 의미로 올바른 것은?', '出荷(しゅっか)는 ''출하''라는 뜻입니다.', 2, 25, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '짜 넣는 일', FALSE, 1),
    (gen_random_uuid(), q_id, '출하', TRUE, 2),
    (gen_random_uuid(), q_id, 'API 사양서', FALSE, 3),
    (gen_random_uuid(), q_id, '가상 머신', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「参画」의 의미로 올바른 것은?', '参画(さんかく)는 ''참획(계획에 참여함)''라는 뜻입니다.', 2, 26, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스케줄', FALSE, 1),
    (gen_random_uuid(), q_id, '참획(계획에 참여함)', TRUE, 2),
    (gen_random_uuid(), q_id, '예외계(테스트 공정)', FALSE, 3),
    (gen_random_uuid(), q_id, '하루빨리 적응기반을 마련하다', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「包括的」의 의미로 올바른 것은?', '包括的(ほうかつてき)는 ''포괄적''라는 뜻입니다.', 2, 27, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이상계(테스트 공정)', FALSE, 1),
    (gen_random_uuid(), q_id, '포괄적', TRUE, 2),
    (gen_random_uuid(), q_id, '부하 테스트', FALSE, 3),
    (gen_random_uuid(), q_id, '인터페이스', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「策定」의 의미로 올바른 것은?', '策定(さくてい)는 ''책정''라는 뜻입니다.', 2, 28, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '책정', TRUE, 1),
    (gen_random_uuid(), q_id, '예외계(테스트 공정)', FALSE, 2),
    (gen_random_uuid(), q_id, '결함', FALSE, 3),
    (gen_random_uuid(), q_id, '맞붙다', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「一貫する」의 의미로 올바른 것은?', '一貫する(いっかんする)는 ''일관하다''라는 뜻입니다.', 2, 29, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '경계치(테스트 공정)', FALSE, 1),
    (gen_random_uuid(), q_id, '모크', FALSE, 2),
    (gen_random_uuid(), q_id, '중요함 / 핵심', FALSE, 3),
    (gen_random_uuid(), q_id, '일관하다', TRUE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「推進する」의 의미로 올바른 것은?', '推進する(すいしんする)는 ''추진하다''라는 뜻입니다.', 2, 30, '中級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요건정의서', FALSE, 1),
    (gen_random_uuid(), q_id, '연혁', FALSE, 2),
    (gen_random_uuid(), q_id, '추진하다', TRUE, 3),
    (gen_random_uuid(), q_id, '원격', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「利害」의 의미로 올바른 것은?', '利害(りがい)는 ''이해''라는 뜻입니다.', 2, 31, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이해', TRUE, 1),
    (gen_random_uuid(), q_id, '기능 사양서', FALSE, 2),
    (gen_random_uuid(), q_id, '결함', FALSE, 3),
    (gen_random_uuid(), q_id, '압박', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「体系的」의 의미로 올바른 것은?', '体系的(たいけいてき)는 ''체계적''라는 뜻입니다.', 2, 32, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스크럼 마스터', FALSE, 1),
    (gen_random_uuid(), q_id, '기안서', FALSE, 2),
    (gen_random_uuid(), q_id, '체계적', TRUE, 3),
    (gen_random_uuid(), q_id, '경어', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「影響範囲」의 의미로 올바른 것은?', '影響範囲(えいきょうはんい)는 ''영향범위''라는 뜻입니다.', 2, 33, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '표제', FALSE, 1),
    (gen_random_uuid(), q_id, '내부 설계', FALSE, 2),
    (gen_random_uuid(), q_id, '영향범위', TRUE, 3),
    (gen_random_uuid(), q_id, '관리자', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「切り分け」의 의미로 올바른 것은?', '切り分け(きりわけ)는 ''잘라 나누는 것''라는 뜻입니다.', 2, 34, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잘라 나누는 것', TRUE, 1),
    (gen_random_uuid(), q_id, '디버깅', FALSE, 2),
    (gen_random_uuid(), q_id, '플로우차트', FALSE, 3),
    (gen_random_uuid(), q_id, '어쩔 수 없다', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「正常系」의 의미로 올바른 것은?', '正常系(せいじょうけい)는 ''정상계(테스트 공정)''라는 뜻입니다.', 2, 35, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '포스트모템', FALSE, 1),
    (gen_random_uuid(), q_id, '리그레션', FALSE, 2),
    (gen_random_uuid(), q_id, '정상계(테스트 공정)', TRUE, 3),
    (gen_random_uuid(), q_id, '관리자', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「異常系」의 의미로 올바른 것은?', '異常系(いじょうけい)는 ''이상계(테스트 공정)''라는 뜻입니다.', 2, 36, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '테스트 자동화', FALSE, 1),
    (gen_random_uuid(), q_id, '스크럼 마스터', FALSE, 2),
    (gen_random_uuid(), q_id, '준수', FALSE, 3),
    (gen_random_uuid(), q_id, '이상계(테스트 공정)', TRUE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「例外系」의 의미로 올바른 것은?', '例外系(れいがいけい)는 ''예외계(테스트 공정)''라는 뜻입니다.', 2, 37, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '예외계(테스트 공정)', TRUE, 1),
    (gen_random_uuid(), q_id, '구성도', FALSE, 2),
    (gen_random_uuid(), q_id, '버그 티켓', FALSE, 3),
    (gen_random_uuid(), q_id, '예외 처리', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「境界値」의 의미로 올바른 것은?', '境界値(きょうかいち)는 ''경계치(테스트 공정)''라는 뜻입니다.', 2, 38, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정의서', FALSE, 1),
    (gen_random_uuid(), q_id, '테스트 실시', FALSE, 2),
    (gen_random_uuid(), q_id, '이행', FALSE, 3),
    (gen_random_uuid(), q_id, '경계치(테스트 공정)', TRUE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「結果物」의 의미로 올바른 것은?', '結果物(けっかぶつ)는 ''결과물''라는 뜻입니다.', 2, 39, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의록', FALSE, 1),
    (gen_random_uuid(), q_id, '결과물', TRUE, 2),
    (gen_random_uuid(), q_id, '상세 설계', FALSE, 3),
    (gen_random_uuid(), q_id, '비즈니스 메일', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「説明書」의 의미로 올바른 것은?', '説明書(せつめいしょ)는 ''설명서''라는 뜻입니다.', 2, 40, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잘라 나누는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '단위 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '설명서', TRUE, 3),
    (gen_random_uuid(), q_id, '모듈', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「構成図」의 의미로 올바른 것은?', '構成図(こうせいず)는 ''구성도''라는 뜻입니다.', 2, 41, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '추진하다', FALSE, 1),
    (gen_random_uuid(), q_id, '영향범위', FALSE, 2),
    (gen_random_uuid(), q_id, '구성도', TRUE, 3),
    (gen_random_uuid(), q_id, '유지보수 운영', FALSE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「定義書」의 의미로 올바른 것은?', '定義書(ていぎしょ)는 ''정의서''라는 뜻입니다.', 2, 42, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로덕트 오너', FALSE, 1),
    (gen_random_uuid(), q_id, '참고 자료', FALSE, 2),
    (gen_random_uuid(), q_id, '유럽풍', FALSE, 3),
    (gen_random_uuid(), q_id, '정의서', TRUE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「技術書」의 의미로 올바른 것은?', '技術書(ぎじゅつしょ)는 ''기술서''라는 뜻입니다.', 2, 43, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기기배치', FALSE, 1),
    (gen_random_uuid(), q_id, '인수 기준', FALSE, 2),
    (gen_random_uuid(), q_id, '검수', FALSE, 3),
    (gen_random_uuid(), q_id, '기술서', TRUE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, quiz_id, 'multiple_choice', '「議事録」의 의미로 올바른 것은?', '議事録(ぎじろく)는 ''회의록''라는 뜻입니다.', 2, 44, '上級', 'vocabulary', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이해관계자', FALSE, 1),
    (gen_random_uuid(), q_id, '회의록', TRUE, 2),
    (gen_random_uuid(), q_id, '연계화면', FALSE, 3),
    (gen_random_uuid(), q_id, '네트워크', FALSE, 4);

END $$;

