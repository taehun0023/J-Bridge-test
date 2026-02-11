-- ============================================
-- Quiz 3: 핵심 프로그래밍 능력 평가 (90 questions)
-- All in Korean, question_category: NULL
-- Easy: 변수/타입/연산자/입출력 (30)
-- Medium: 제어문/함수/배열/문자열 (30)
-- Hard: OOP/알고리즘/에러처리/재귀 (30)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- ==========================================
  -- EASY - 30 questions (sort_order 1-30)
  -- ==========================================

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'int와 float의 차이점으로 올바른 것은?', 'int는 정수형, float는 부동소수점(실수)형 데이터 타입입니다.', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'int는 문자열 데이터를, float는 논리형 데이터를 저장한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'int는 정수를 저장하고, float는 실수(소수점)를 저장한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'int는 실수를 저장하고, float는 정수만을 저장한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'int는 부호 없는 양수만, float는 음수만을 저장한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '변수 선언 시 const의 역할은?', 'const는 상수를 선언하여 한 번 할당된 값을 변경할 수 없게 합니다.', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '블록 스코프 내에서만 접근 가능한 변수를 선언한다', FALSE, 1),
    (gen_random_uuid(), q_id, '전역에서 접근 가능한 공개 변수를 선언한다', FALSE, 2),
    (gen_random_uuid(), q_id, '값을 변경할 수 없는 상수를 선언한다', TRUE, 3),
    (gen_random_uuid(), q_id, '함수 스코프를 가지는 지역 변수를 선언한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다음 중 Boolean 타입이 가질 수 있는 값은?', 'Boolean은 참(true)과 거짓(false) 두 가지 값만 가질 수 있는 논리 타입입니다.', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true와 false', TRUE, 1),
    (gen_random_uuid(), q_id, '0부터 255까지의 정수 범위의 숫자 값', FALSE, 2),
    (gen_random_uuid(), q_id, 'null, undefined, NaN 세 가지 특수 값', FALSE, 3),
    (gen_random_uuid(), q_id, '양수와 음수를 포함한 모든 정수 값', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '10 % 3의 결과값은?', '% 연산자는 나머지를 구하는 모듈러 연산자입니다. 10 / 3 = 3 나머지 1.', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3', FALSE, 1),
    (gen_random_uuid(), q_id, '1', TRUE, 2),
    (gen_random_uuid(), q_id, '0', FALSE, 3),
    (gen_random_uuid(), q_id, '2', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '문자열(String)과 문자(char)의 차이점은?', 'char는 단일 문자를 저장하고, String은 문자들의 배열(문자열)을 저장합니다.', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'char는 유니코드 숫자값을, String은 바이트 배열을 저장한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'char는 단일 문자를 저장하고, String은 여러 문자의 조합이다', TRUE, 2),
    (gen_random_uuid(), q_id, 'char는 여러 문자를 저장하고, String은 단일 문자만 저장한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'char는 숫자형 데이터를 저장하고, String은 논리형을 저장한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다음 중 할당 연산자는?', '=는 오른쪽 값을 왼쪽 변수에 할당하는 할당 연산자입니다.', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '== (동등 비교 연산자)', FALSE, 1),
    (gen_random_uuid(), q_id, '!= (부등 비교 연산자)', FALSE, 2),
    (gen_random_uuid(), q_id, '>= (크거나 같음 비교 연산자)', FALSE, 3),
    (gen_random_uuid(), q_id, '= (할당 연산자)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'null의 의미로 올바른 것은?', 'null은 변수에 값이 없음을 나타내는 특별한 값입니다.', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변수에 값이 없음을 명시적으로 나타낸다', TRUE, 1),
    (gen_random_uuid(), q_id, '정수 0과 동일한 의미를 가지는 숫자 리터럴이다', FALSE, 2),
    (gen_random_uuid(), q_id, '빈 문자열("")과 완전히 동일한 값을 나타낸다', FALSE, 3),
    (gen_random_uuid(), q_id, '불리언 false와 메모리상 같은 값으로 저장된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '변수의 이름 규칙으로 올바른 것은?', '변수 이름은 숫자로 시작할 수 없고, 예약어를 사용할 수 없습니다.', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '반드시 대문자 알파벳으로 시작해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '공백 문자를 포함하여 자유롭게 지을 수 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '숫자로 시작할 수 없다', TRUE, 3),
    (gen_random_uuid(), q_id, '특수문자만으로 구성하여 작성해야 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '정수를 실수로 변환하는 것을 무엇이라 하는가?', '타입 캐스팅(형변환)은 하나의 데이터 타입을 다른 타입으로 변환하는 것입니다.', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변수를 초기값으로 되돌리는 변수 초기화이다', FALSE, 1),
    (gen_random_uuid(), q_id, '운영체제가 수행하는 메모리 할당 과정이다', FALSE, 2),
    (gen_random_uuid(), q_id, '변수의 데이터 타입을 지정하는 타입 선언이다', FALSE, 3),
    (gen_random_uuid(), q_id, '타입 캐스팅 (형변환)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '논리 연산자 && (AND)의 결과로 올바른 것은?\ntrue && false = ?', '&&는 두 조건이 모두 true일 때만 true를 반환합니다.', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true', FALSE, 1),
    (gen_random_uuid(), q_id, 'false', TRUE, 2),
    (gen_random_uuid(), q_id, 'null', FALSE, 3),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 4);

