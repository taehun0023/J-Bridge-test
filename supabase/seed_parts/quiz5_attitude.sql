-- Quiz 5: 태도/문화 이해도 평가 (Attitude/Culture) — 30 questions
-- ============================================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== EASY (9 questions): 비즈니스 인사, 기본 경어, 출퇴근 =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 아침에 출근했을 때 적절한 인사는?', '일본 직장에서 아침 출근 시에는 "おはようございます"(좋은 아침입니다)가 기본 인사입니다.', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おはようございます (좋은 아침입니다)', TRUE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様です (수고하셨습니다 - 업무 중/퇴근 시 인사)', FALSE, 2),
    (gen_random_uuid(), q_id, 'こんにちは (안녕하세요 - 낮 시간 일반 인사)', FALSE, 3),
    (gen_random_uuid(), q_id, 'お世話になっております (신세를 지고 있습니다 - 외부 거래처용)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 퇴근할 때 남아있는 동료에게 하는 인사는?', '먼저 퇴근할 때는 "お先に失礼します"(먼저 실례합니다)라고 인사합니다.', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様でした (수고하셨습니다 - 동료 퇴근 시 응답)', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご苦労様です (수고하셨습니다 - 상사가 부하에게 쓰는 표현)', FALSE, 2),
    (gen_random_uuid(), q_id, 'お先に失礼します (먼저 실례합니다)', TRUE, 3),
    (gen_random_uuid(), q_id, 'また明日よろしくお願いします (내일 또 잘 부탁드립니다)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 명함을 교환할 때의 올바른 매너는?', '명함은 양손으로 건네고 받으며, 받은 명함은 바로 주머니에 넣지 않고 테이블 위에 놓습니다.', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '한 손으로 가볍게 건네고 받은 뒤 명함첩에 바로 정리한다', FALSE, 1),
    (gen_random_uuid(), q_id, '양손으로 건네고 받으며, 받은 명함은 테이블에 놓는다', TRUE, 2),
    (gen_random_uuid(), q_id, '받은 명함에 상대의 특징을 메모하며 대화를 이어간다', FALSE, 3),
    (gen_random_uuid(), q_id, '명함을 받은 즉시 내용을 확인하고 가방에 소중히 보관한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "敬語(けいご)"란?', '경어는 일본어에서 상대방에 대한 존경과 예의를 표현하는 언어 체계로, 존경어, 겸양어, 정중어로 나뉩니다.', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본 각 지역의 전통 사투리를 총칭하는 언어 분류 체계', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 문서에서만 사용하는 격식체 문어 표현 방식', FALSE, 2),
    (gen_random_uuid(), q_id, '일본 고전 문학에서 유래한 전통적인 문학 표현 양식', FALSE, 3),
    (gen_random_uuid(), q_id, '상대방에 대한 존경과 예의를 표현하는 언어 체계', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 출근 시간에 대한 일반적인 기대는?', '일본에서는 시간 엄수가 매우 중요하며, 정시보다 5-10분 일찍 도착하는 것이 일반적입니다.', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '플렉스 타임제로 각자 원하는 시간에 출근하는 것이 보편적이다', FALSE, 1),
    (gen_random_uuid(), q_id, '정시에 맞춰 도착하면 일본 비즈니스 매너로 충분하다', FALSE, 2),
    (gen_random_uuid(), q_id, '정시보다 5-10분 일찍 도착하는 것이 바람직하다', TRUE, 3),
    (gen_random_uuid(), q_id, '업무 시작 30분 전에 도착하여 자리를 준비하는 것이 필수이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 직장에서 전화를 받을 때 첫 마디로 적절한 것은?', '일본 회사에서 전화를 받을 때는 "お電話ありがとうございます、○○会社の△△です"라고 합니다.', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'もしもし、○○会社です (여보세요, ○○회사입니다)', FALSE, 1),
    (gen_random_uuid(), q_id, 'お電話ありがとうございます (전화 감사합니다)', TRUE, 2),
    (gen_random_uuid(), q_id, 'はい、○○会社でございます (네, ○○회사입니다)', FALSE, 3),
    (gen_random_uuid(), q_id, 'お世話になっております、○○です (신세를 지고 있습니다)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 お辞儀(おじぎ, 인사 절)의 종류가 아닌 것은?', '일본의 인사 절에는 会釈(에샤쿠, 15도), 敬礼(케이레이, 30도), 最敬礼(사이케이레이, 45도)가 있습니다.', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会釈 (えしゃく, 15도 - 가벼운 목례)', FALSE, 1),
    (gen_random_uuid(), q_id, '敬礼 (けいれい, 30도 - 일반적 비즈니스 인사)', FALSE, 2),
    (gen_random_uuid(), q_id, '最敬礼 (さいけいれい, 45도 - 깊은 감사/사과)', FALSE, 3),
    (gen_random_uuid(), q_id, '直礼 (ちょくれい)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 동료가 퇴근할 때 하는 인사는?', '동료가 먼저 퇴근할 때는 "お疲れ様でした"(수고하셨습니다)라고 인사합니다.', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様でした (수고하셨습니다)', TRUE, 1),
    (gen_random_uuid(), q_id, 'お先に失礼します (먼저 실례합니다 - 본인이 퇴근할 때)', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご苦労様です (수고하셨습니다 - 상사가 부하에게 쓰는 표현)', FALSE, 3),
    (gen_random_uuid(), q_id, 'また明日お願いします (내일 또 부탁드립니다 - 격식 인사)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 직장에서 복장에 대한 일반적인 기준은?', '일본 회사에서는 깔끔하고 단정한 비즈니스 캐주얼 또는 정장이 기본이며, 회사 규정을 따릅니다.', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IT 업계에서는 자유로운 복장이 보편적이므로 편한 옷을 입는다', FALSE, 1),
    (gen_random_uuid(), q_id, '매일 반드시 검은색 정장에 넥타이를 착용해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '부서별로 지정된 유니폼을 착용하는 것이 일반적이다', FALSE, 3),
    (gen_random_uuid(), q_id, '깔끔하고 단정한 비즈니스 캐주얼/정장이 기본이다', TRUE, 4);

  -- ===== MEDIUM (12 questions): 호렌소, 회의 매너, 이메일 =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 직장에서 "ホウレンソウ(호렌소)"란?', '호렌소는 報告(보고), 連絡(연락), 相談(상담)의 약자로, 일본 직장의 핵심 커뮤니케이션 원칙입니다.', 1, 10, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'PDCA(Plan-Do-Check-Act) 사이클의 일본식 명칭', FALSE, 1),
    (gen_random_uuid(), q_id, '일본 특유의 프로젝트 관리 방법론인 카이젠의 하위 원칙', FALSE, 2),
    (gen_random_uuid(), q_id, '報告(보고)・連絡(연락)・相談(상담)의 약자', TRUE, 3),
    (gen_random_uuid(), q_id, '일본 조직의 위계 구조를 나타내는 경영 용어', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회의에서 상사가 발언 중일 때 적절한 행동은?', '일본에서는 상사의 발언을 끝까지 경청한 후 의견을 말하는 것이 예의입니다.', 1, 11, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '적극성을 보여주기 위해 좋은 아이디어는 즉시 발언한다', FALSE, 1),
    (gen_random_uuid(), q_id, '끝까지 경청한 후 의견을 말한다', TRUE, 2),
    (gen_random_uuid(), q_id, '메모를 하면서 동의하는 부분에서 바로 호응하며 끼어든다', FALSE, 3),
    (gen_random_uuid(), q_id, '반대 의견이 있으면 논리적으로 즉시 반박하여 효율을 높인다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 비즈니스 이메일에서 첫 줄에 적는 것은?', '일본 비즈니스 이메일은 "○○会社 △△様" 또는 "お世話になっております"로 시작하는 것이 일반적입니다.', 1, 12, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이메일의 목적과 용건을 간결하게 먼저 요약하여 적는다', FALSE, 1),
    (gen_random_uuid(), q_id, '발신일자와 발신자의 소속, 직위를 먼저 기재한다', FALSE, 2),
    (gen_random_uuid(), q_id, '자기소개와 함께 이전 미팅에 대한 감사 인사를 적는다', FALSE, 3),
    (gen_random_uuid(), q_id, '상대방의 소속과 이름, 그리고 인사말(お世話になっております)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '호렌소 중 "報告(보고)"를 할 때 가장 중요한 것은?', '보고는 결론부터 먼저 말하고(結論ファースト), 사실에 기반하여 간결하게 전달하는 것이 중요합니다.', 1, 13, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배경과 경과를 상세하게 설명한 뒤 결론을 마지막에 전달한다', FALSE, 1),
    (gen_random_uuid(), q_id, '좋은 결과를 위주로 보고하고 부정적 내용은 별도로 전달한다', FALSE, 2),
    (gen_random_uuid(), q_id, '결론부터 먼저, 사실 기반으로 간결하게 전달한다', TRUE, 3),
    (gen_random_uuid(), q_id, '일정 기간 동안 진행 상황을 모아서 한꺼번에 종합 보고한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회의에서 의사록(議事録)을 작성하는 이유는?', '의사록은 결정 사항, 담당자, 기한을 명확히 기록하여 이후 확인과 책임 소재를 분명히 하기 위해 작성합니다.', 1, 14, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '결정 사항과 담당자, 기한을 명확히 기록하기 위해', TRUE, 1),
    (gen_random_uuid(), q_id, '회의에 참석하지 못한 상사에게 회의 내용을 공유하기 위해', FALSE, 2),
    (gen_random_uuid(), q_id, '법적으로 의무화된 기업 문서 보관 규정을 준수하기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '프로젝트 종료 시 성과 평가의 근거 자료로 활용하기 위해', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 비즈니스 이메일 마지막에 적는 인사는?', '일본 비즈니스 이메일 마지막에는 "よろしくお願いいたします"(잘 부탁드립니다)를 적는 것이 일반적입니다.', 1, 15, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '失礼いたします (실례하겠습니다 - 격식체 마무리 표현)', FALSE, 1),
    (gen_random_uuid(), q_id, 'お手数おかけしますが (번거로우시겠지만 - 요청 시 표현)', FALSE, 2),
    (gen_random_uuid(), q_id, '以上、ご確認ください (이상, 확인 부탁드립니다)', FALSE, 3),
    (gen_random_uuid(), q_id, 'よろしくお願いいたします (잘 부탁드립니다)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 회의 시작 시간 5분 전에 도착하는 것이 중요한 이유는?', '일본에서 시간 엄수는 상대방에 대한 존중의 표현이며, 지각은 신뢰를 잃게 하는 큰 결례입니다.', 1, 16, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의 자료를 미리 준비하고 좌석 배치를 확인하기 위해서이다', FALSE, 1),
    (gen_random_uuid(), q_id, '시간 엄수는 상대방에 대한 존중이며 신뢰의 기본이다', TRUE, 2),
    (gen_random_uuid(), q_id, '일본 회사에서는 지각 시 인사 평가에 직접 감점이 반영된다', FALSE, 3),
    (gen_random_uuid(), q_id, '회의실 사용 시간이 한정되어 있어 효율적 운영이 필요하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '호렌소 중 "相談(상담)"을 할 때 적절한 태도는?', '상담 시에는 자신의 의견이나 해결안을 먼저 준비한 후 상사에게 확인/조언을 구하는 것이 바람직합니다.', 1, 17, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '문제 상황을 정확히 전달하고 해결 방법은 상사의 판단에 맡긴다', FALSE, 1),
    (gen_random_uuid(), q_id, '스스로 완전히 해결할 수 있을 때까지 상담 시점을 미룬다', FALSE, 2),
    (gen_random_uuid(), q_id, '자신의 의견/해결안을 준비한 후 조언을 구한다', TRUE, 3),
    (gen_random_uuid(), q_id, '먼저 동료들과 충분히 논의한 후 결론을 상사에게 보고한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 업무 중 실수를 했을 때 적절한 대응은?', '실수를 발견하면 즉시 상사에게 보고하고, 대응 방안을 함께 논의하는 것이 중요합니다. 숨기면 더 큰 문제가 됩니다.', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '실수의 원인을 스스로 분석하고 해결한 후 결과를 보고한다', FALSE, 1),
    (gen_random_uuid(), q_id, '영향 범위가 작은 실수는 조용히 수정하고 보고를 생략한다', FALSE, 2),
    (gen_random_uuid(), q_id, '동료에게 먼저 상의하여 팀 차원의 대응책을 마련한 후 보고한다', FALSE, 3),
    (gen_random_uuid(), q_id, '즉시 상사에게 보고하고 대응 방안을 함께 논의한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "お疲れ様です"와 "ご苦労様です"의 차이는?', '"お疲れ様です"는 누구에게나 사용 가능하지만, "ご苦労様です"는 상사가 부하에게 사용하는 표현입니다.', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご苦労様가 더 정중한 표현이므로 윗사람에게 사용하는 것이 적절하다', FALSE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様は누구에게나, ご苦労様は상사→부하 표현', TRUE, 2),
    (gen_random_uuid(), q_id, '두 표현은 의미와 용법이 동일하여 상황에 따라 자유롭게 교체 가능하다', FALSE, 3),
    (gen_random_uuid(), q_id, 'お疲れ様는 사내에서만, ご苦労様는 외부 거래처에 사용하는 표현이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 회의 시 좌석 배치에서 "上座(かみざ)"란?', '上座는 출입구에서 가장 먼 자리로, 상위 직급이나 손님이 앉는 상석입니다.', 1, 20, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의를 진행하는 사회자가 앉는 회의실 중앙의 지정된 좌석', FALSE, 1),
    (gen_random_uuid(), q_id, '회의실에 먼저 도착한 순서대로 자유롭게 선택하는 좌석', FALSE, 2),
    (gen_random_uuid(), q_id, '출입구에 가까운 자리로 업무 효율을 위해 상사가 앉는 좌석', FALSE, 3),
    (gen_random_uuid(), q_id, '출입구에서 가장 먼 자리로 상위 직급/손님이 앉는 상석', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 비즈니스 이메일에서 CC에 상사를 포함하는 이유는?', 'CC에 상사를 포함하는 것은 정보 공유와 보고를 동시에 하는 호렌소의 일환이며, 일본 비즈니스의 일반적 관행입니다.', 1, 21, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정보 공유와 보고를 동시에 하기 위한 호렌소의 일환', TRUE, 1),
    (gen_random_uuid(), q_id, '상사의 사전 승인을 받아야 이메일 발송이 유효하기 때문이다', FALSE, 2),
    (gen_random_uuid(), q_id, '문제 발생 시 상사가 즉시 개입하여 해결할 수 있도록 하기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '일본 기업의 내부 감사 규정에 따라 의무적으로 포함해야 한다', FALSE, 4);

  -- ===== HARD (9 questions): 네마와시, 갈등 해결, 이문화 커뮤니케이션 =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "根回し(ねまわし, 네마와시)"란?', '네마와시는 공식 회의 전에 관계자들에게 미리 설명하고 동의를 구하는 비공식 사전 조율 과정입니다.', 1, 22, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '稟議(품의) 시스템에서 문서를 순차적으로 결재받는 공식 절차', FALSE, 1),
    (gen_random_uuid(), q_id, '카이젠(改善) 활동의 일환으로 현장 문제를 개선하는 과정', FALSE, 2),
    (gen_random_uuid(), q_id, '공식 회의 전에 관계자들과 사전 조율하는 비공식 과정', TRUE, 3),
    (gen_random_uuid(), q_id, '조직 내 부서 간 업무 분담을 조정하는 인사 관리 제도', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 직장에서 상사의 의견에 동의하지 않을 때 적절한 대응은?', '직접적 반박보다는 "なるほど、一方で…"(그렇군요, 한편으로는...) 등 완곡하게 다른 관점을 제시합니다.', 1, 23, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의 중에는 동의하고 이후 개별적으로 서면으로 의견을 전달한다', FALSE, 1),
    (gen_random_uuid(), q_id, '완곡하게 다른 관점을 제시한다 (例: なるほど、一方で…)', TRUE, 2),
    (gen_random_uuid(), q_id, '논리적 근거를 갖추어 명확하고 직접적으로 반대 의견을 제시한다', FALSE, 3),
    (gen_random_uuid(), q_id, '상사의 의견을 수용한 뒤 실행 과정에서 자신의 방식을 반영한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "空気を読む(くうきをよむ)"의 비즈니스적 의미는?', '空気を読む는 말로 표현되지 않은 분위기나 상황을 파악하고, 그에 맞게 행동하는 것을 의미합니다.', 1, 24, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의 전에 참석자들의 입장을 미리 파악하여 네마와시하는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '상사의 업무 지시를 정확하게 이해하고 신속하게 실행하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '말로 표현되지 않은 분위기/상황을 파악하고 적절히 행동한다', TRUE, 3),
    (gen_random_uuid(), q_id, '팀원들의 업무 부담을 살펴보고 자발적으로 업무를 분배하는 것', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '한국과 일본의 의사결정 방식의 주요 차이점은?', '한국은 톱다운(Top-down) 의사결정이 빠른 반면, 일본은 稟議(품의)와 네마와시를 통한 합의 형성(ボトムアップ)을 중시합니다.', 1, 25, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본은 합의 형성(ボトムアップ)을 중시하여 의사결정이 느릴 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '일본은 한국보다 경영진의 톱다운 결정이 강하고 실행 속도가 빠르다', FALSE, 2),
    (gen_random_uuid(), q_id, '한국과 일본 모두 현장 담당자의 자율적 판단에 의사결정을 맡긴다', FALSE, 3),
    (gen_random_uuid(), q_id, '일본은 팀 리더가 단독 결정하고 한국은 팀원 합의를 거치는 편이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "建前(たてまえ)"와 "本音(ほんね)"의 의미는?', '建前는 공적/사회적 입장(표면적 의견)이고, 本音는 개인의 진짜 생각(속마음)입니다. 이 구분을 이해하는 것이 중요합니다.', 1, 26, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '建前는 사내 규칙, 本音는 업무 외 개인적 목표를 뜻하는 경영 용어', FALSE, 1),
    (gen_random_uuid(), q_id, '建前는 상사에게 보고하는 내용, 本音는 동료와 공유하는 비공식 정보', FALSE, 2),
    (gen_random_uuid(), q_id, '建前는 공적 입장(표면), 本音는 진짜 속마음', TRUE, 3),
    (gen_random_uuid(), q_id, '建前는 회의에서의 공식 발언, 本音는 네마와시 과정에서의 비공식 의견', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 IT 기업에서 팀 갈등 발생 시 가장 적절한 해결 방법은?', '일본에서는 직접적인 대립을 피하고, 제3자(상사나 리더)를 통해 중재하거나 개별 면담으로 해결하는 것을 선호합니다.', 1, 27, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '팀 전체가 모인 자리에서 각자의 의견을 투명하게 공유하고 토론한다', FALSE, 1),
    (gen_random_uuid(), q_id, '제3자 중재 또는 개별 면담을 통한 해결', TRUE, 2),
    (gen_random_uuid(), q_id, '갈등 당사자 간 직접 대화로 문제의 원인을 분석하고 합의를 도출한다', FALSE, 3),
    (gen_random_uuid(), q_id, '사내 공식 갈등 해결 절차에 따라 HR 부서에 조정을 요청한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "稟議(りんぎ)"란?', '稟議는 제안서를 관련 부서와 상위 직급자에게 순차적으로 회람하여 승인을 얻는 일본 특유의 의사결정 시스템입니다.', 1, 28, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '제안서를 순차적으로 회람하여 승인을 얻는 의사결정 시스템', TRUE, 1),
    (gen_random_uuid(), q_id, '네마와시와 동일한 개념으로 비공식적 사전 합의를 이루는 과정', FALSE, 2),
    (gen_random_uuid(), q_id, '신입 사원이 부서 배치 전에 거치는 사내 오리엔테이션 제도', FALSE, 3),
    (gen_random_uuid(), q_id, '분기별로 시행하는 직원 업무 성과 평가 및 피드백 절차', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '한국인 IT 엔지니어가 일본 파견 시 가장 주의해야 할 커뮤니케이션 차이는?', '한국은 직접적 표현을 선호하지만, 일본은 간접적 표현과 맥락(문맥)을 중시하는 하이컨텍스트 문화입니다.', 1, 29, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기술 문서와 코드 리뷰에서 사용하는 전문 용어의 차이에 주의해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '일본은 간접적 표현과 맥락을 중시하는 하이컨텍스트 문화', TRUE, 2),
    (gen_random_uuid(), q_id, '일본은 한국보다 직접적이고 명확한 표현을 선호하는 로우컨텍스트 문화', FALSE, 3),
    (gen_random_uuid(), q_id, '한일 간 커뮤니케이션 방식은 유사하므로 경어 사용에만 주의하면 된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "和(わ)"를 중시하는 것이 IT 프로젝트에 미치는 영향은?', '和(조화)를 중시하면 팀 결속력은 높지만, 반대 의견 표현이 어려워 문제가 숨겨질 수 있습니다. 적절한 균형이 필요합니다.', 1, 30, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '팀 결속력은 높지만 반대 의견 표현이 어려울 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '개인보다 팀 성과를 우선시하여 개발자의 창의적 해결책이 늘어난다', FALSE, 2),
    (gen_random_uuid(), q_id, '의사결정 속도가 빨라져 프로젝트 일정 준수에 긍정적 영향을 준다', FALSE, 3),
    (gen_random_uuid(), q_id, '팀 내 경쟁이 줄어들어 코드 품질 향상과 기술 혁신이 촉진된다', FALSE, 4);

END $$;
