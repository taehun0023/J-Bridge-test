-- Quiz 4: 프레임워크 능력 평가 (Framework) — 90 questions
-- ============================================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== EASY (30 questions): MVC, REST API, HTTP 기초 =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'MVC 패턴에서 Controller의 주요 역할은?', 'Controller는 사용자의 입력을 받아 Model과 View를 연결하는 중재자 역할을 합니다.', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스에 직접 접근하여 CRUD 작업을 수행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '사용자 요청을 처리하고 Model과 View를 연결한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'HTML 템플릿을 파싱하여 화면에 렌더링한다', FALSE, 3),
    (gen_random_uuid(), q_id, '클라이언트 요청의 유효성을 검증하고 로깅한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'MVC 패턴에서 Model이 담당하는 것은?', 'Model은 애플리케이션의 데이터와 비즈니스 로직을 관리합니다.', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사용자 인터페이스의 레이아웃과 표시를 담당한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'URL 라우팅 규칙을 정의하고 요청을 분배한다', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터와 비즈니스 로직을 관리하고 상태를 유지한다', TRUE, 3),
    (gen_random_uuid(), q_id, '네트워크 통신 프로토콜과 데이터 전송을 관리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'MVC에서 View의 역할은?', 'View는 Model의 데이터를 사용자에게 보여주는 화면(UI)을 담당합니다.', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사용자에게 데이터를 시각적으로 표시하고 UI를 구성한다', TRUE, 1),
    (gen_random_uuid(), q_id, '입력 데이터를 검증하고 데이터베이스에 저장한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'RESTful API의 엔드포인트를 정의하고 관리한다', FALSE, 3),
    (gen_random_uuid(), q_id, '사용자 인증 토큰을 발급하고 세션을 처리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP GET 메서드의 주요 용도는?', 'GET은 서버에서 리소스를 조회(읽기)할 때 사용합니다.', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버에 새로운 리소스를 생성하여 저장한다', FALSE, 1),
    (gen_random_uuid(), q_id, '서버의 기존 리소스를 완전히 교체 수정한다', FALSE, 2),
    (gen_random_uuid(), q_id, '서버에서 지정된 리소스의 데이터를 조회한다', TRUE, 3),
    (gen_random_uuid(), q_id, '서버의 특정 리소스를 영구적으로 삭제한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP POST 메서드의 주요 용도는?', 'POST는 서버에 새로운 리소스를 생성할 때 사용합니다.', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버에 새로운 데이터를 생성하여 저장한다', TRUE, 1),
    (gen_random_uuid(), q_id, '서버에서 지정된 리소스의 데이터를 조회한다', FALSE, 2),
    (gen_random_uuid(), q_id, '서버의 특정 리소스를 영구적으로 삭제한다', FALSE, 3),
    (gen_random_uuid(), q_id, '서버와의 네트워크 연결 상태를 확인한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 200의 의미는?', '200 OK는 요청이 성공적으로 처리되었음을 나타냅니다.', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요청한 리소스를 서버에서 찾을 수 없음을 나타낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '서버 내부에서 예기치 않은 오류가 발생했음을 나타낸다', FALSE, 2),
    (gen_random_uuid(), q_id, '클라이언트의 인증 자격 증명이 필요함을 나타낸다', FALSE, 3),
    (gen_random_uuid(), q_id, '요청이 성공적으로 처리되었음을 나타낸다 (OK)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 404의 의미는?', '404 Not Found는 요청한 리소스를 서버에서 찾을 수 없음을 의미합니다.', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 내부에서 처리 중 오류가 발생했음을 나타낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '요청한 리소스를 서버에서 찾을 수 없음을 나타낸다 (Not Found)', TRUE, 2),
    (gen_random_uuid(), q_id, '요청이 성공적으로 처리되어 결과를 반환함을 나타낸다', FALSE, 3),
    (gen_random_uuid(), q_id, '요청한 리소스가 다른 URL로 이동했음을 나타낸다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 500의 의미는?', '500 Internal Server Error는 서버 내부에서 예기치 않은 오류가 발생했음을 나타냅니다.', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클라이언트의 요청 문법이 잘못되었음을 나타낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '요청이 성공적으로 처리되어 결과를 반환함을 나타낸다', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 내부에서 예기치 않은 오류가 발생했음을 나타낸다 (Internal Server Error)', TRUE, 3),
    (gen_random_uuid(), q_id, '요청한 리소스를 서버에서 찾을 수 없음을 나타낸다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST API에서 리소스를 삭제할 때 사용하는 HTTP 메서드는?', 'DELETE 메서드는 서버의 특정 리소스를 삭제할 때 사용합니다.', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'REMOVE', FALSE, 1),
    (gen_random_uuid(), q_id, 'POST', FALSE, 2),
    (gen_random_uuid(), q_id, 'DELETE', TRUE, 3),
    (gen_random_uuid(), q_id, 'PATCH', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST API에서 기존 리소스를 수정할 때 주로 사용하는 HTTP 메서드는?', 'PUT은 리소스 전체를 교체하고, PATCH는 부분 수정에 사용합니다. 일반적으로 수정에는 PUT을 많이 사용합니다.', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'POST', FALSE, 1),
    (gen_random_uuid(), q_id, 'PUT', TRUE, 2),
    (gen_random_uuid(), q_id, 'GET', FALSE, 3),
    (gen_random_uuid(), q_id, 'DELETE', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST에서 "Stateless"의 의미는?', 'Stateless는 각 요청이 독립적이며 서버가 클라이언트의 상태를 저장하지 않는 것을 의미합니다.', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버가 항상 동일한 응답 데이터를 반환하는 것을 의미한다', FALSE, 1),
    (gen_random_uuid(), q_id, '클라이언트가 서버 측에 세션 데이터를 저장하는 것을 의미한다', FALSE, 2),
    (gen_random_uuid(), q_id, '서버가 클라이언트의 상태를 저장하지 않고 각 요청이 독립적인 것을 의미한다', TRUE, 3),
    (gen_random_uuid(), q_id, '모든 요청에 별도의 인증 절차가 필요 없다는 것을 의미한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JSON의 정식 명칭은?', 'JSON은 JavaScript Object Notation의 약자로, 경량 데이터 교환 형식입니다.', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Java Standard Object Notation', FALSE, 1),
    (gen_random_uuid(), q_id, 'JavaScript Object Notation', TRUE, 2),
    (gen_random_uuid(), q_id, 'JavaScript Open Network Protocol', FALSE, 3),
    (gen_random_uuid(), q_id, 'Java Serialized Object Namespace', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'API란 무엇인가?', 'API(Application Programming Interface)는 소프트웨어 간 상호작용을 위한 인터페이스입니다.', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터를 저장하고 관리하는 데이터베이스 관리 시스템이다', FALSE, 1),
    (gen_random_uuid(), q_id, '소프트웨어 간 상호작용을 위한 프로그래밍 인터페이스이다', TRUE, 2),
    (gen_random_uuid(), q_id, '특정 프로그래밍 언어의 실행 환경을 제공하는 런타임이다', FALSE, 3),
    (gen_random_uuid(), q_id, '웹 브라우저에서 HTML을 렌더링하는 엔진의 한 종류이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 201의 의미는?', '201 Created는 요청이 성공하여 새로운 리소스가 생성되었음을 나타냅니다.', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요청이 수락되었으나 아직 처리가 완료되지 않았음을 나타낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '요청한 리소스가 다른 URL로 리다이렉션되었음을 나타낸다', FALSE, 2),
    (gen_random_uuid(), q_id, '클라이언트에게 접근 권한이 없어 요청이 거부되었음을 나타낸다', FALSE, 3),
    (gen_random_uuid(), q_id, '요청이 성공하여 새로운 리소스가 생성되었음을 나타낸다 (Created)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 401의 의미는?', '401 Unauthorized는 인증이 필요하거나 인증에 실패했음을 나타냅니다.', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인증이 필요하거나 인증에 실패했음을 나타낸다 (Unauthorized)', TRUE, 1),
    (gen_random_uuid(), q_id, '인증은 성공했으나 해당 리소스에 대한 접근 권한이 없음을 나타낸다 (Forbidden)', FALSE, 2),
    (gen_random_uuid(), q_id, '요청한 리소스를 서버에서 찾을 수 없음을 나타낸다 (Not Found)', FALSE, 3),
    (gen_random_uuid(), q_id, '서버 내부에서 예기치 않은 오류가 발생했음을 나타낸다 (Server Error)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'URL에서 쿼리 파라미터를 시작하는 기호는?', 'URL에서 쿼리 문자열은 물음표(?)로 시작합니다. 예: /users?page=1', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '& (앰퍼샌드) — 여러 파라미터를 구분하는 기호', FALSE, 1),
    (gen_random_uuid(), q_id, '# (해시) — 페이지 내 특정 위치를 가리키는 기호', FALSE, 2),
    (gen_random_uuid(), q_id, '? (물음표) — 쿼리 문자열의 시작을 나타내는 기호', TRUE, 3),
    (gen_random_uuid(), q_id, '/ (슬래시) — 경로 세그먼트를 구분하는 기호', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST API에서 /users/123은 무엇을 의미하는가?', '/users/123은 users 리소스 중 ID가 123인 특정 사용자를 나타냅니다.', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'users 컬렉션에서 ID가 123인 특정 사용자 리소스를 가리킨다', TRUE, 1),
    (gen_random_uuid(), q_id, 'users 컬렉션의 123번째 페이지에 해당하는 사용자 목록을 조회한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'users 컬렉션에서 최대 123명의 사용자 목록을 반환한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'users 컬렉션에서 버전 123에 해당하는 API 스펙을 조회한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 요청 시 헤더(Header)의 역할은?', 'HTTP 헤더는 요청/응답에 대한 메타데이터(인증 토큰, 콘텐츠 타입 등)를 전달합니다.', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '실제 전송할 데이터 본문(Body)의 내용을 담아 전달한다', FALSE, 1),
    (gen_random_uuid(), q_id, '요청/응답의 메타데이터(인증 토큰, 콘텐츠 타입 등)를 전달한다', TRUE, 2),
    (gen_random_uuid(), q_id, '요청 대상의 URL 경로와 쿼리 파라미터를 지정한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'HTML 페이지의 상단 영역을 렌더링하는 데 사용된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Content-Type: application/json은 무엇을 의미하는가?', 'Content-Type 헤더는 요청/응답 본문의 데이터 형식을 나타내며, application/json은 JSON 형식을 의미합니다.', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버가 오직 JSON 형식의 요청만 수신 가능하다는 뜻이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'URL이 JSON 형식의 정적 파일을 직접 가리킨다는 뜻이다', FALSE, 2),
    (gen_random_uuid(), q_id, '요청/응답 본문의 데이터가 JSON 형식임을 나타내는 헤더이다', TRUE, 3),
    (gen_random_uuid(), q_id, '클라이언트에서 JavaScript 파일을 다운로드하여 실행한다는 뜻이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '프레임워크(Framework)와 라이브러리(Library)의 차이점은?', '프레임워크는 전체 구조를 제공하고 개발자의 코드를 호출(IoC)하는 반면, 라이브러리는 개발자가 필요할 때 호출합니다.', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프레임워크는 제어의 역전(IoC)으로 개발자의 코드를 호출하고, 라이브러리는 개발자가 직접 호출한다', TRUE, 1),
    (gen_random_uuid(), q_id, '프레임워크는 항상 라이브러리보다 설치 파일 크기가 크다는 점이 유일한 차이이다', FALSE, 2),
    (gen_random_uuid(), q_id, '라이브러리는 오픈소스 무료이고 프레임워크는 상용 라이선스가 필요하다는 차이이다', FALSE, 3),
    (gen_random_uuid(), q_id, '프레임워크는 백엔드 전용이고 라이브러리는 프론트엔드 전용이라는 차이이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'CRUD는 무엇의 약자인가?', 'CRUD는 Create(생성), Read(읽기), Update(수정), Delete(삭제)의 약자로 기본적인 데이터 조작 연산입니다.', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Copy, Read, Undo, Delete', FALSE, 1),
    (gen_random_uuid(), q_id, 'Connect, Retrieve, Update, Disconnect', FALSE, 2),
    (gen_random_uuid(), q_id, 'Create, Read, Update, Delete', TRUE, 3),
    (gen_random_uuid(), q_id, 'Create, Run, Upload, Download', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 403의 의미는?', '403 Forbidden은 서버가 요청을 이해했으나 권한이 없어 거부했음을 나타냅니다.', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클라이언트의 인증 자격 증명이 필요하거나 만료되었음을 나타낸다 (Unauthorized)', FALSE, 1),
    (gen_random_uuid(), q_id, '인증은 되었으나 해당 리소스에 대한 접근 권한이 없어 거부되었음을 나타낸다 (Forbidden)', TRUE, 2),
    (gen_random_uuid(), q_id, '요청한 리소스를 서버에서 찾을 수 없음을 나타낸다 (Not Found)', FALSE, 3),
    (gen_random_uuid(), q_id, '서버가 요청 처리 시간을 초과하여 연결이 끊어졌음을 나타낸다 (Timeout)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'GET과 POST의 가장 큰 차이점은?', 'GET은 데이터를 조회하며 URL에 파라미터를 포함하고, POST는 데이터를 생성하며 요청 본문에 데이터를 포함합니다.', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GET은 데이터 조회용이고 POST는 데이터 생성용으로 사용 목적이 다르다', TRUE, 1),
    (gen_random_uuid(), q_id, 'GET은 응답 속도가 느리고 POST는 서버 응답 속도가 빠르다', FALSE, 2),
    (gen_random_uuid(), q_id, 'GET은 HTTPS에서만 사용 가능하고 POST는 HTTP에서도 사용 가능하다', FALSE, 3),
    (gen_random_uuid(), q_id, 'GET은 헤더를 포함할 수 없고 POST는 헤더를 포함할 수 있다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 302의 의미는?', '302 Found는 요청한 리소스가 일시적으로 다른 URL로 이동했음을 나타냅니다(리다이렉트).', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요청이 성공적으로 처리되어 결과를 반환함을 나타낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '서버 내부에서 처리 중 예기치 않은 오류가 발생했음을 나타낸다', FALSE, 2),
    (gen_random_uuid(), q_id, '클라이언트 요청의 문법이 잘못되어 처리할 수 없음을 나타낸다', FALSE, 3),
    (gen_random_uuid(), q_id, '요청한 리소스가 일시적으로 다른 URL로 이동했음을 나타낸다 (임시 리다이렉트)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTPS에서 S가 의미하는 것은?', 'HTTPS의 S는 Secure의 약자로, SSL/TLS를 사용한 암호화 통신을 의미합니다.', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Server — 전용 서버를 통해 통신함을 의미한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Secure — SSL/TLS를 사용한 암호화 통신을 의미한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'Speed — 고속 전송 프로토콜을 사용함을 의미한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'Standard — 국제 표준 프로토콜을 준수함을 의미한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST API에서 PATCH와 PUT의 차이점은?', 'PUT은 리소스 전체를 교체하고, PATCH는 리소스의 일부만 수정합니다.', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'PUT은 새 리소스를 생성하고 PATCH는 기존 리소스를 삭제하는 메서드이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'PUT은 리소스 전체를 교체하고 PATCH는 리소스의 일부만 부분 수정한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'PUT과 PATCH는 동일한 기능이며 브라우저 호환성의 차이만 있다', FALSE, 3),
    (gen_random_uuid(), q_id, 'PATCH는 서버 성능이 PUT보다 항상 빠르기 때문에 권장된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 요청에서 Body(본문)는 주로 어떤 메서드에서 사용하는가?', 'POST, PUT, PATCH 메서드는 요청 본문에 데이터를 포함하여 전송합니다. GET은 일반적으로 본문을 사용하지 않습니다.', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GET, HEAD 메서드에서 주로 본문을 사용하여 데이터를 전송한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'DELETE 메서드에서만 본문을 사용하여 삭제 대상을 지정한다', FALSE, 2),
    (gen_random_uuid(), q_id, '모든 HTTP 메서드에서 동일하게 본문을 필수로 사용한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'POST, PUT, PATCH 메서드에서 주로 본문을 사용하여 데이터를 전송한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'MVC 패턴을 사용하는 주요 이점은?', 'MVC 패턴은 관심사의 분리(Separation of Concerns)를 통해 코드의 유지보수성과 확장성을 높입니다.', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드의 컴파일 및 런타임 실행 속도가 비약적으로 빨라진다', FALSE, 1),
    (gen_random_uuid(), q_id, '관심사의 분리(Separation of Concerns)로 유지보수성과 확장성이 높아진다', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 쿼리 성능이 자동으로 최적화되어 향상된다', FALSE, 3),
    (gen_random_uuid(), q_id, '보안 취약점이 자동으로 감지되고 차단되어 보안이 강화된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 400의 의미는?', '400 Bad Request는 클라이언트의 요청 문법이 잘못되었거나 유효하지 않은 요청임을 나타냅니다.', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클라이언트의 요청 문법이 잘못되었거나 유효하지 않은 요청임을 나타낸다 (Bad Request)', TRUE, 1),
    (gen_random_uuid(), q_id, '클라이언트의 인증 자격 증명이 만료되어 재인증이 필요함을 나타낸다 (Unauthorized)', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 내부에서 예기치 않은 오류가 발생하여 처리할 수 없음을 나타낸다 (Server Error)', FALSE, 3),
    (gen_random_uuid(), q_id, '서버가 요청 처리 시간을 초과하여 연결이 끊어졌음을 나타낸다 (Timeout)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST의 정식 명칭은?', 'REST는 Representational State Transfer의 약자로 분산 시스템 설계를 위한 아키텍처 스타일입니다.', 1, 30, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Remote Execution System Transfer', FALSE, 1),
    (gen_random_uuid(), q_id, 'Request-Response Standard Technology', FALSE, 2),
    (gen_random_uuid(), q_id, 'Resource Exchange and Storage Technology', FALSE, 3),
    (gen_random_uuid(), q_id, 'Representational State Transfer', TRUE, 4);

  -- ===== MEDIUM (30 questions): Spring Boot, React, Routing =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @RestController와 @Controller의 차이점은?', '@RestController는 @Controller + @ResponseBody를 결합한 것으로, 메서드 반환값을 JSON/XML 등으로 직접 응답합니다.', 1, 31, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@RestController는 View 템플릿을 렌더링하여 HTML로 응답한다', FALSE, 1),
    (gen_random_uuid(), q_id, '@RestController는 반환값을 직접 HTTP 응답 본문(JSON 등)으로 전달한다', TRUE, 2),
    (gen_random_uuid(), q_id, '@Controller와 @RestController는 기능상 차이가 없는 동의어이다', FALSE, 3),
    (gen_random_uuid(), q_id, '@Controller가 REST API 전용이고 @RestController는 MVC 전용이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Autowired의 역할은?', '@Autowired는 의존성 주입(DI)을 자동으로 수행하여 필요한 빈(Bean)을 주입합니다.', 1, 32, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스프링 컨테이너가 해당 타입의 빈을 찾아 의존성을 자동으로 주입한다', TRUE, 1),
    (gen_random_uuid(), q_id, '해당 클래스의 인스턴스를 자동으로 생성하여 싱글톤으로 등록한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTTP 요청의 파라미터를 컨트롤러 메서드에 자동으로 매핑한다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스 커넥션 풀의 연결을 자동으로 설정하고 관리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @RequestMapping의 역할은?', '@RequestMapping은 HTTP 요청 URL을 컨트롤러의 메서드에 매핑합니다.', 1, 33, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스 테이블과 엔티티 클래스를 매핑하는 ORM 어노테이션이다', FALSE, 1),
    (gen_random_uuid(), q_id, '스프링 컨테이너에 빈을 등록하고 의존성을 주입하는 역할을 한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTTP 요청 URL을 컨트롤러의 특정 메서드에 매핑하는 역할을 한다', TRUE, 3),
    (gen_random_uuid(), q_id, 'JSON 데이터를 자바 객체로 역직렬화하는 변환기를 지정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Service 어노테이션의 용도는?', '@Service는 비즈니스 로직을 담당하는 서비스 계층의 클래스에 사용하는 스테레오타입 어노테이션입니다.', 1, 34, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'REST API의 엔드포인트를 정의하고 요청을 처리하는 컨트롤러 클래스를 나타낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 로직을 담당하는 서비스 계층의 클래스임을 나타내는 스테레오타입이다', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 테이블과 매핑되는 JPA 엔티티 클래스를 정의하는 데 사용된다', FALSE, 3),
    (gen_random_uuid(), q_id, '외부 설정 파일(YAML/Properties)을 로드하여 빈에 바인딩하는 역할이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Repository 어노테이션의 용도는?', '@Repository는 데이터 액세스 계층(DAO)의 클래스에 사용하며, DB 예외를 스프링 예외로 변환합니다.', 1, 35, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '웹 요청을 처리하는 컨트롤러 계층의 클래스를 나타내는 데 사용된다', FALSE, 1),
    (gen_random_uuid(), q_id, '애플리케이션 설정을 정의하는 환경 구성 클래스를 나타내는 데 사용된다', FALSE, 2),
    (gen_random_uuid(), q_id, '단위 테스트와 통합 테스트를 위한 테스트 클래스를 나타내는 데 사용된다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터 액세스 계층(DAO) 클래스를 나타내며 DB 예외를 스프링 예외로 변환한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useState 훅의 역할은?', 'useState는 함수형 컴포넌트에서 상태(state)를 관리하기 위한 React 훅입니다.', 1, 36, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'API 호출이나 DOM 조작 같은 사이드 이펙트를 처리하는 데 사용한다', FALSE, 1),
    (gen_random_uuid(), q_id, '함수형 컴포넌트에서 상태(state)를 선언하고 관리하는 데 사용한다', TRUE, 2),
    (gen_random_uuid(), q_id, '부모에서 자식 컴포넌트로 데이터를 전달하는 메커니즘을 제공한다', FALSE, 3),
    (gen_random_uuid(), q_id, '외부 API를 호출하고 응답 데이터를 캐싱하는 기능을 제공한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useEffect 훅의 역할은?', 'useEffect는 컴포넌트의 사이드 이펙트(API 호출, DOM 조작, 구독 등)를 처리합니다.', 1, 37, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '함수형 컴포넌트에서 내부 상태를 선언하고 업데이트하는 데 사용한다', FALSE, 1),
    (gen_random_uuid(), q_id, '컴포넌트의 JSX 구조를 정의하고 화면에 렌더링하는 데 사용한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'API 호출, DOM 조작, 구독 등의 사이드 이펙트를 처리하는 데 사용한다', TRUE, 3),
    (gen_random_uuid(), q_id, '이벤트 핸들러를 DOM 요소에 등록하고 이벤트를 위임하는 데 사용한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 props의 역할은?', 'props는 부모 컴포넌트에서 자식 컴포넌트로 데이터를 전달하는 메커니즘입니다.', 1, 38, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '컴포넌트 내부의 변경 가능한 상태를 관리하고 리렌더링을 트리거한다', FALSE, 1),
    (gen_random_uuid(), q_id, '부모 컴포넌트에서 자식 컴포넌트로 읽기 전용 데이터를 전달한다', TRUE, 2),
    (gen_random_uuid(), q_id, '브라우저의 클릭, 키보드 등의 DOM 이벤트를 처리하고 위임한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'CSS-in-JS 방식으로 컴포넌트에 스타일을 동적으로 적용한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SPA(Single Page Application)란?', 'SPA는 하나의 HTML 페이지에서 JavaScript로 콘텐츠를 동적으로 교체하여 페이지 전환 없이 동작하는 웹 앱입니다.', 1, 39, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '한 페이지에 모든 기능을 최소한으로 담은 간단한 정적 웹사이트이다', FALSE, 1),
    (gen_random_uuid(), q_id, '서버에서 매 요청마다 새로운 완전한 HTML 페이지를 렌더링하는 웹 앱이다', FALSE, 2),
    (gen_random_uuid(), q_id, '모바일 기기에서만 동작하도록 최적화된 전용 웹 애플리케이션이다', FALSE, 3),
    (gen_random_uuid(), q_id, '하나의 HTML 페이지에서 JavaScript로 콘텐츠를 동적으로 교체하는 웹 앱이다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 Virtual DOM의 역할은?', 'Virtual DOM은 실제 DOM의 가상 복사본으로, 변경 사항을 효율적으로 비교(diffing)하여 최소한의 DOM 업데이트만 수행합니다.', 1, 40, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변경 사항을 효율적으로 비교(diffing)하여 최소한의 DOM 업데이트만 수행한다', TRUE, 1),
    (gen_random_uuid(), q_id, '서버에서 HTML을 미리 렌더링하여 클라이언트에 전송하는 SSR 기법이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'CSS 트랜지션과 애니메이션을 GPU 가속으로 최적화하는 엔진이다', FALSE, 3),
    (gen_random_uuid(), q_id, '브라우저의 메모리 사용량을 절약하기 위해 DOM 노드를 압축 저장한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js에서 SSR(Server-Side Rendering)의 장점은?', 'SSR은 서버에서 HTML을 미리 렌더링하여 초기 로딩 속도를 개선하고 SEO에 유리합니다.', 1, 41, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클라이언트 측 JavaScript 번들의 실행 속도를 직접적으로 향상시킨다', FALSE, 1),
    (gen_random_uuid(), q_id, '서버에서 HTML을 미리 렌더링하여 초기 로딩 속도와 SEO를 개선한다', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 쿼리를 자동으로 최적화하여 백엔드 응답 속도를 높인다', FALSE, 3),
    (gen_random_uuid(), q_id, 'CSS 파일을 자동으로 분할하여 번들 크기를 최소화하고 성능을 높인다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @GetMapping의 역할은?', '@GetMapping은 HTTP GET 요청을 특정 메서드에 매핑하는 축약형 어노테이션입니다(@RequestMapping(method = GET)의 축약).', 1, 42, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTTP GET 요청을 특정 컨트롤러 메서드에 매핑하는 축약형 어노테이션이다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터베이스에서 엔티티를 조회하는 JPA 쿼리 메서드를 자동 생성한다', FALSE, 2),
    (gen_random_uuid(), q_id, '스프링 컨테이너에서 특정 타입의 빈을 찾아 의존성을 주입하는 역할이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'JSON 응답 데이터를 자바 객체로 파싱하여 컨트롤러에 전달하는 역할이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 컴포넌트의 key prop이 필요한 이유는?', 'key는 리스트 렌더링 시 각 요소를 고유하게 식별하여 React가 효율적으로 DOM을 업데이트할 수 있게 합니다.', 1, 43, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CSS 클래스명을 동적으로 적용하기 위해 스타일 키를 지정하는 용도이다', FALSE, 1),
    (gen_random_uuid(), q_id, '이벤트 핸들러를 특정 DOM 요소에 연결하기 위한 참조 식별자이다', FALSE, 2),
    (gen_random_uuid(), q_id, '리스트의 각 요소를 고유하게 식별하여 React가 효율적으로 DOM을 업데이트하게 한다', TRUE, 3),
    (gen_random_uuid(), q_id, '부모 컴포넌트에서 자식으로 데이터를 전달하기 위한 필수 속성이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot의 application.properties 파일의 용도는?', 'application.properties는 DB 연결, 서버 포트, 로깅 등 애플리케이션 설정을 외부화하는 파일입니다.', 1, 44, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Java 소스 코드를 컴파일하고 바이트코드로 변환하는 설정 파일이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Maven/Gradle의 의존성 라이브러리 목록을 관리하는 설정 파일이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Swagger/OpenAPI를 통한 REST API 문서를 자동 생성하는 설정 파일이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'DB 연결, 서버 포트, 로깅 등 애플리케이션 설정을 외부화하는 파일이다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React Router에서 <Route path="/users/:id">의 :id는 무엇인가?', ':id는 URL 파라미터(동적 세그먼트)로, /users/123에서 id=123으로 추출됩니다.', 1, 45, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CSS 선택자로 특정 요소의 스타일을 지정하기 위한 식별자이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'URL에서 동적으로 변하는 값을 추출하는 파라미터(동적 세그먼트)이다', TRUE, 2),
    (gen_random_uuid(), q_id, '서버의 정적 파일 경로에서 디렉토리를 참조하는 변수 선언이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'URL 뒤에 붙는 ?key=value 형태의 쿼리 파라미터를 의미한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 의존성 주입(DI)의 장점은?', 'DI는 객체 간 결합도를 낮추고 테스트 용이성을 높이며 코드 재사용성을 향상시킵니다.', 1, 46, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '객체 간 결합도를 낮추고 테스트 용이성과 코드 재사용성을 높인다', TRUE, 1),
    (gen_random_uuid(), q_id, '애플리케이션의 런타임 코드 실행 속도를 직접적으로 향상시킨다', FALSE, 2),
    (gen_random_uuid(), q_id, 'JVM의 힙 메모리 사용량을 최적화하여 메모리 효율을 높인다', FALSE, 3),
    (gen_random_uuid(), q_id, 'REST API의 UI 화면을 자동으로 생성하여 개발 생산성을 높인다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 조건부 렌더링을 구현하는 올바른 방법은?', 'React에서는 삼항 연산자, &&, if문 등으로 조건부 렌더링을 구현합니다.', 1, 47, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'display: none CSS 속성만을 사용하여 요소를 숨기고 표시한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Vue.js의 v-if 디렉티브를 JSX 내부에서 사용하여 조건을 판단한다', FALSE, 2),
    (gen_random_uuid(), q_id, '{condition ? <ComponentA /> : <ComponentB />} 삼항 연산자를 사용한다', TRUE, 3),
    (gen_random_uuid(), q_id, '#if 전처리기 지시문을 사용하여 빌드 타임에 조건을 처리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @PathVariable의 역할은?', '@PathVariable은 URL 경로의 변수를 메서드 파라미터에 바인딩합니다. 예: /users/{id}에서 id를 추출합니다.', 1, 48, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'URL의 쿼리 스트링(?key=value) 파라미터를 메서드 인자에 바인딩한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTP 요청 본문(Body)의 JSON 데이터를 자바 객체에 바인딩한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTTP 응답 헤더에 커스텀 값을 설정하여 클라이언트에 전달한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'URL 경로의 동적 변수({id} 등)를 메서드 파라미터에 바인딩한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 이벤트 핸들링 시 onClick={handleClick}과 onClick={handleClick()}의 차이는?', 'onClick={handleClick}은 함수 참조를 전달하고, onClick={handleClick()}은 렌더링 시 즉시 실행됩니다.', 1, 49, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전자는 함수 참조를 전달하여 클릭 시 실행되고, 후자는 렌더링 시 즉시 실행된다', TRUE, 1),
    (gen_random_uuid(), q_id, '두 표현식은 완전히 동일한 동작을 하며 코딩 스타일의 차이일 뿐이다', FALSE, 2),
    (gen_random_uuid(), q_id, '전자는 실행 속도가 느리고 후자는 최적화되어 실행 속도가 빠르다', FALSE, 3),
    (gen_random_uuid(), q_id, '전자는 클래스 컴포넌트 전용 문법이고 후자는 함수 컴포넌트 전용이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @RequestBody의 역할은?', '@RequestBody는 HTTP 요청 본문(JSON 등)을 자바 객체로 역직렬화하여 메서드 파라미터에 바인딩합니다.', 1, 50, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'URL 경로의 동적 변수({id} 등)를 메서드 파라미터에 바인딩한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTP 요청 본문(JSON 등)을 자바 객체로 역직렬화하여 바인딩한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'HTTP 응답 본문의 형식과 인코딩 방식을 설정하는 역할을 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '클라이언트의 쿠키 값을 읽어 메서드 파라미터에 주입하는 역할이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React의 JSX란 무엇인가?', 'JSX는 JavaScript XML의 약자로, JavaScript 안에서 HTML과 유사한 문법을 사용할 수 있게 해주는 확장 문법입니다.', 1, 51, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JavaScript에서 HTML과 유사한 마크업 문법을 사용할 수 있게 해주는 확장 문법이다', TRUE, 1),
    (gen_random_uuid(), q_id, 'ECMAScript 표준에 새롭게 추가된 JavaScript의 최신 버전 명칭이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Java Server Extension의 약자로 서버 사이드 자바 확장 기술이다', FALSE, 3),
    (gen_random_uuid(), q_id, '서버에서 HTML을 사전 렌더링하는 서버 사이드 렌더링 엔진의 이름이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js에서 App Router의 파일 기반 라우팅에서 page.tsx의 역할은?', 'Next.js App Router에서 page.tsx는 해당 경로의 UI를 정의하는 파일로, 폴더 구조가 곧 URL 경로가 됩니다.', 1, 52, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전역 레이아웃과 네비게이션 구조를 정의하는 공통 래퍼 컴포넌트이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'API 엔드포인트의 요청 핸들러를 정의하는 서버 사이드 라우트 파일이다', FALSE, 2),
    (gen_random_uuid(), q_id, '해당 폴더 경로의 UI를 정의하는 페이지 컴포넌트로 URL에 직접 매핑된다', TRUE, 3),
    (gen_random_uuid(), q_id, '에러 발생 시 사용자에게 표시할 폴백 UI를 정의하는 에러 바운더리이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Entity 어노테이션의 역할은?', '@Entity는 해당 클래스가 JPA 엔티티(DB 테이블과 매핑되는 객체)임을 나타냅니다.', 1, 53, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'REST API의 엔드포인트를 자동으로 생성하고 CRUD 기능을 제공한다', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 로직을 담당하는 서비스 계층의 클래스임을 나타내는 어노테이션이다', FALSE, 2),
    (gen_random_uuid(), q_id, '해당 클래스를 데이터베이스 테이블과 매핑되는 JPA 엔티티로 지정한다', TRUE, 3),
    (gen_random_uuid(), q_id, '외부 설정 파일(YAML/Properties)의 값을 클래스 필드에 바인딩한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useContext 훅의 역할은?', 'useContext는 Context API를 통해 컴포넌트 트리에서 prop drilling 없이 데이터를 전달합니다.', 1, 54, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '컴포넌트 내부의 로컬 상태를 선언하고 업데이트하는 기능을 제공한다', FALSE, 1),
    (gen_random_uuid(), q_id, '외부 REST API를 호출하고 응답 데이터를 캐싱하는 기능을 제공한다', FALSE, 2),
    (gen_random_uuid(), q_id, '클라이언트 사이드의 페이지 라우팅과 네비게이션을 처리하는 기능이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'prop drilling 없이 컴포넌트 트리 전체에서 데이터를 공유하고 전달한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Transactional의 역할은?', '@Transactional은 메서드를 트랜잭션으로 감싸 DB 작업의 원자성을 보장합니다. 실패 시 자동 롤백됩니다.', 1, 55, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '메서드의 비동기 처리를 활성화하여 별도 스레드에서 실행하게 한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'DB 작업을 트랜잭션으로 감싸 원자성을 보장하고 실패 시 자동 롤백한다', TRUE, 2),
    (gen_random_uuid(), q_id, '메서드 반환값을 캐시에 저장하여 동일 요청 시 DB 조회를 생략한다', FALSE, 3),
    (gen_random_uuid(), q_id, '메서드 실행 전후에 로그를 자동으로 기록하여 디버깅을 지원한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useMemo 훅의 용도는?', 'useMemo는 계산 비용이 높은 값을 메모이제이션하여 불필요한 재계산을 방지합니다.', 1, 56, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '컴포넌트의 내부 상태를 선언하고 상태 변경 시 리렌더링을 트리거한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'API 호출이나 DOM 조작 같은 사이드 이펙트를 처리하는 데 사용한다', FALSE, 2),
    (gen_random_uuid(), q_id, '계산 비용이 높은 값을 메모이제이션하여 불필요한 재계산을 방지한다', TRUE, 3),
    (gen_random_uuid(), q_id, '리렌더링 없이 DOM 요소에 직접 접근하기 위한 참조를 생성한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js에서 layout.tsx 파일의 역할은?', 'layout.tsx는 하위 경로들에 공통 레이아웃(네비게이션, 사이드바 등)을 적용하며 상태를 유지합니다.', 1, 57, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하위 경로에 공통 레이아웃(네비게이션, 사이드바 등)을 적용하고 상태를 유지한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'API 라우트의 요청 핸들러를 정의하고 HTTP 메서드별 로직을 처리한다', FALSE, 2),
    (gen_random_uuid(), q_id, '런타임 에러 발생 시 사용자에게 표시할 폴백 에러 페이지를 정의한다', FALSE, 3),
    (gen_random_uuid(), q_id, '빌드 타임에 정적 파일을 생성하고 CDN에 배포하는 설정을 관리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @PostMapping의 역할은?', '@PostMapping은 HTTP POST 요청을 특정 메서드에 매핑하는 축약형 어노테이션입니다.', 1, 58, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스에 새로운 레코드를 자동으로 삽입하는 JPA 어노테이션이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTP POST 요청을 특정 컨트롤러 메서드에 매핑하는 축약형 어노테이션이다', TRUE, 2),
    (gen_random_uuid(), q_id, 'JSON 데이터를 자바 객체로 파싱하는 역직렬화 설정 어노테이션이다', FALSE, 3),
    (gen_random_uuid(), q_id, '멀티파트 파일 업로드를 처리하기 위한 전용 매핑 어노테이션이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useRef 훅의 용도는?', 'useRef는 리렌더링 없이 값을 유지하거나 DOM 요소에 직접 접근하기 위해 사용합니다.', 1, 59, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상태를 관리하고 값이 변경될 때마다 컴포넌트 리렌더링을 트리거한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'API 호출이나 타이머 설정 같은 사이드 이펙트를 처리하는 데 사용한다', FALSE, 2),
    (gen_random_uuid(), q_id, '비용이 높은 계산 결과를 캐싱하여 성능을 최적화하는 데 사용한다', FALSE, 3),
    (gen_random_uuid(), q_id, '리렌더링 없이 값을 유지하거나 DOM 요소에 직접 접근하는 데 사용한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @SpringBootApplication의 역할은?', '@SpringBootApplication은 @Configuration, @EnableAutoConfiguration, @ComponentScan을 결합한 메인 어노테이션입니다.', 1, 60, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '내장 웹 서버(Tomcat)를 시작하고 포트를 할당하는 역할만 담당한다', FALSE, 1),
    (gen_random_uuid(), q_id, '@Configuration + @EnableAutoConfiguration + @ComponentScan을 결합한 복합 어노테이션이다', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 연결 설정과 JPA 엔티티 스캔만을 담당하는 어노테이션이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'Spring Security의 보안 필터와 인증 설정을 활성화하는 어노테이션이다', FALSE, 4);

  -- ===== HARD (30 questions): DB설계, 상태관리, ORM, 배포/CI/CD =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스 정규화(Normalization)의 주요 목적은?', '정규화는 데이터 중복을 최소화하고 데이터 무결성을 보장하기 위해 테이블을 분리하는 과정입니다.', 1, 61, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '복잡한 조인 쿼리를 줄여 데이터 조회 성능을 최대화하는 것이 목적이다', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터 중복을 최소화하고 데이터 무결성을 보장하기 위해 테이블을 분리한다', TRUE, 2),
    (gen_random_uuid(), q_id, '전체 데이터베이스의 테이블 수를 최소화하여 관리를 단순화하는 것이다', FALSE, 3),
    (gen_random_uuid(), q_id, '인덱스를 자동으로 생성하여 검색 성능을 최적화하는 과정을 말한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Redux와 React Context API의 주요 차이점은?', 'Redux는 예측 가능한 상태 관리와 미들웨어/DevTools를 제공하고, Context API는 가벼운 상태 공유에 적합합니다.', 1, 62, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '두 도구는 기능상 완전히 동일하며 API 이름만 다를 뿐 차이가 없다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Context API가 Redux보다 모든 상황에서 렌더링 성능이 항상 우수하다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Redux는 미들웨어/DevTools를 지원하는 예측 가능한 상태 관리 라이브러리이고, Context는 경량 상태 공유용이다', TRUE, 3),
    (gen_random_uuid(), q_id, 'Redux는 클래스 컴포넌트에서만 사용 가능하고 함수 컴포넌트에서는 사용할 수 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Docker 컨테이너란?', 'Docker 컨테이너는 애플리케이션과 그 의존성을 격리된 환경에서 실행하는 경량 가상화 단위입니다.', 1, 63, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하드웨어를 완전히 가상화하는 전통적인 가상 머신(VM)과 동일한 개념이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Git과 같은 소스 코드 버전 관리 저장소(Repository)의 한 종류이다', FALSE, 2),
    (gen_random_uuid(), q_id, '앱과 의존성을 격리된 환경에서 실행하는 OS 수준의 경량 가상화 단위이다', TRUE, 3),
    (gen_random_uuid(), q_id, 'MySQL이나 PostgreSQL 같은 관계형 데이터베이스 관리 도구를 말한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ORM(Object-Relational Mapping)의 장점은?', 'ORM은 객체지향 코드로 DB를 조작할 수 있게 하여 생산성을 높이고 SQL 작성을 줄여줍니다.', 1, 64, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '객체지향 코드로 DB를 조작할 수 있게 하여 생산성을 높이고 SQL 작성을 줄인다', TRUE, 1),
    (gen_random_uuid(), q_id, 'ORM을 사용하면 생성되는 SQL 쿼리의 성능이 항상 수동 SQL보다 최적화된다', FALSE, 2),
    (gen_random_uuid(), q_id, 'ORM을 사용하면 데이터베이스 없이도 영구적으로 데이터를 저장할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '프론트엔드와 백엔드의 통신을 자동화하여 API 코드 작성을 불필요하게 만든다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'CI/CD에서 CI(Continuous Integration)의 의미는?', 'CI는 개발자들의 코드 변경사항을 자주(매일) 메인 브랜치에 통합하고 자동 빌드/테스트를 수행하는 것입니다.', 1, 65, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '테스트를 통과한 코드를 운영 서버에 자동으로 배포하는 프로세스를 의미한다', FALSE, 1),
    (gen_random_uuid(), q_id, '코드를 자주 메인 브랜치에 통합하고 자동 빌드/테스트를 수행하는 것을 의미한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'Pull Request에 대한 코드 리뷰를 AI가 자동으로 수행하는 것을 의미한다', FALSE, 3),
    (gen_random_uuid(), q_id, '버그 리포트와 이슈 트래킹을 자동화하여 프로젝트를 관리하는 것을 의미한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'N+1 쿼리 문제란?', 'N+1 문제는 1개의 쿼리로 N개의 결과를 가져온 후, 각 결과에 대해 추가 쿼리를 실행하여 총 N+1개의 쿼리가 발생하는 성능 문제입니다.', 1, 66, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1개의 조회 쿼리 후 N개의 연관 데이터에 대해 추가 쿼리가 발생하는 성능 문제이다', TRUE, 1),
    (gen_random_uuid(), q_id, 'N개의 테이블에 각각 1개의 레코드만 존재하여 공간이 낭비되는 설계 문제이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'N+1개의 인덱스가 하나의 테이블에 과도하게 생성되는 인덱스 관리 문제이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'N개의 동시 커넥션이 필요하여 커넥션 풀이 고갈되는 동시성 문제이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JPA에서 @OneToMany 관계의 fetch 전략 중 LAZY의 의미는?', 'LAZY 로딩은 연관 엔티티를 실제로 접근할 때까지 로딩을 지연시키는 전략입니다.', 1, 67, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '연관 엔티티를 부모 엔티티와 함께 즉시(EAGER) 로딩하여 한 번에 가져온다', FALSE, 1),
    (gen_random_uuid(), q_id, '연관 엔티티를 실제로 접근하는 시점까지 로딩을 지연시키는 전략이다', TRUE, 2),
    (gen_random_uuid(), q_id, '연관 엔티티를 2차 캐시(L2 Cache)에서 우선적으로 로딩하는 전략이다', FALSE, 3),
    (gen_random_uuid(), q_id, '연관 엔티티를 별도의 비동기 스레드에서 병렬로 로딩하는 전략이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Dockerfile에서 COPY와 ADD의 차이점은?', 'COPY는 단순 파일 복사만 하고, ADD는 tar 압축 해제와 URL 다운로드 기능을 추가로 지원합니다.', 1, 68, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'COPY와 ADD는 기능상 완전히 동일하며 Dockerfile 버전에 따른 별칭이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'COPY가 ADD보다 더 많은 기능(압축 해제, URL 다운로드 등)을 제공한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'ADD는 tar 압축 자동 해제와 원격 URL 다운로드를 추가로 지원하는 확장 명령이다', TRUE, 3),
    (gen_random_uuid(), q_id, 'ADD는 보안 취약점으로 인해 Docker 최신 버전에서 공식적으로 사용이 금지되었다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Redux에서 미들웨어(Middleware)의 역할은?', '미들웨어는 액션이 리듀서에 도달하기 전에 가로채어 비동기 로직, 로깅, 에러 처리 등을 수행합니다.', 1, 69, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리액트 컴포넌트의 UI를 렌더링하고 Virtual DOM을 업데이트하는 역할이다', FALSE, 1),
    (gen_random_uuid(), q_id, '스토어의 상태를 직접 변경(mutate)하여 성능을 최적화하는 역할이다', FALSE, 2),
    (gen_random_uuid(), q_id, '백엔드 API 서버의 역할을 대신하여 클라이언트 요청을 처리하는 것이다', FALSE, 3),
    (gen_random_uuid(), q_id, '액션이 리듀서에 도달하기 전에 가로채어 비동기 로직이나 로깅 등을 수행한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스에서 인덱스(Index)를 과도하게 생성하면 발생하는 문제는?', '인덱스가 많으면 INSERT/UPDATE/DELETE 시 인덱스 갱신 오버헤드가 증가하고 저장 공간을 추가로 소비합니다.', 1, 70, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'INSERT/UPDATE/DELETE 시 인덱스 갱신 오버헤드로 쓰기 성능이 저하되고 저장 공간이 증가한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'SELECT 쿼리의 읽기 성능이 인덱스 충돌로 인해 오히려 저하된다', FALSE, 2),
    (gen_random_uuid(), q_id, '인덱스 간 교착 상태(Deadlock)가 발생하여 테이블 데이터가 손상된다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스 엔진이 불필요한 인덱스를 자동으로 감지하여 삭제한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Docker Compose의 역할은?', 'Docker Compose는 여러 컨테이너로 구성된 애플리케이션을 YAML 파일로 정의하고 한 번에 관리합니다.', 1, 71, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Dockerfile을 기반으로 단일 Docker 이미지를 빌드하는 전용 도구이다', FALSE, 1),
    (gen_random_uuid(), q_id, '여러 컨테이너로 구성된 앱을 YAML 파일로 정의하고 한 번에 관리하는 도구이다', TRUE, 2),
    (gen_random_uuid(), q_id, '빌드된 Docker 이미지를 Docker Hub 레지스트리에 업로드하는 도구이다', FALSE, 3),
    (gen_random_uuid(), q_id, '각 컨테이너의 CPU와 메모리 리소스 사용량을 제한하는 모니터링 도구이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JPA에서 영속성 컨텍스트(Persistence Context)란?', '영속성 컨텍스트는 엔티티를 관리하는 1차 캐시로, 동일 트랜잭션에서 같은 엔티티를 반복 조회 시 DB를 다시 조회하지 않습니다.', 1, 72, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스 커넥션 풀을 관리하여 동시 접속자 수를 제어하는 메커니즘이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTP 세션에 사용자 데이터를 저장하고 요청 간 상태를 유지하는 저장소이다', FALSE, 2),
    (gen_random_uuid(), q_id, '엔티티를 관리하는 1차 캐시로 동일 트랜잭션에서 반복 DB 조회를 방지한다', TRUE, 3),
    (gen_random_uuid(), q_id, 'JSON 데이터를 자바 객체로 직렬화/역직렬화하는 변환 도구를 의미한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'CD(Continuous Deployment)와 Continuous Delivery의 차이는?', 'Continuous Delivery는 수동 승인 후 배포하고, Continuous Deployment는 테스트 통과 시 자동 운영 배포합니다.', 1, 73, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Delivery는 수동 승인 후 운영 환경에 배포하고, Deployment는 테스트 통과 시 자동으로 운영 배포한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'Continuous Delivery와 Continuous Deployment는 동일한 개념의 다른 표현일 뿐이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Continuous Delivery가 더 높은 수준의 자동화를 의미하며 사람 개입이 전혀 없다', FALSE, 3),
    (gen_random_uuid(), q_id, 'Continuous Deployment는 테스트 환경에만 자동 배포하고 운영 환경은 대상이 아니다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스에서 역정규화(Denormalization)를 하는 이유는?', '역정규화는 조회 성능 향상을 위해 의도적으로 데이터 중복을 허용하는 것입니다.', 1, 74, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 무결성 제약 조건을 더 강화하여 이상 현상을 방지하기 위한 것이다', FALSE, 1),
    (gen_random_uuid(), q_id, '조회 성능 향상을 위해 의도적으로 데이터 중복을 허용하는 설계 기법이다', TRUE, 2),
    (gen_random_uuid(), q_id, '전체 데이터베이스의 테이블 수를 줄여 스키마 관리를 단순화하기 위한 것이다', FALSE, 3),
    (gen_random_uuid(), q_id, '인덱스를 자동으로 생성하여 모든 쿼리의 실행 계획을 최적화하기 위한 것이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 서버 컴포넌트(Server Component)의 특징은?', '서버 컴포넌트는 서버에서만 렌더링되어 클라이언트 번들에 포함되지 않으며, DB 직접 접근이 가능합니다.', 1, 75, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클라이언트 브라우저에서만 렌더링되고 서버에서는 실행되지 않는 컴포넌트이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'useState, useEffect 등 React 훅을 자유롭게 사용할 수 있는 컴포넌트이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'onClick 등의 이벤트 핸들러를 등록하고 사용자 인터랙션을 처리할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '서버에서만 렌더링되어 클라이언트 번들에 포함되지 않으며 DB 직접 접근이 가능하다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @ControllerAdvice의 역할은?', '@ControllerAdvice는 전역 예외 처리, 데이터 바인딩, 모델 속성 추가를 위한 AOP 기반 어드바이저입니다.', 1, 76, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전역 예외 처리와 공통 로직을 AOP 기반으로 모든 컨트롤러에 적용하는 어드바이저이다', TRUE, 1),
    (gen_random_uuid(), q_id, 'Swagger/OpenAPI 스펙에 따른 REST API 문서를 자동으로 생성하는 어노테이션이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Spring Security의 보안 필터 체인을 설정하고 인증/인가를 관리하는 어노테이션이다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스 트랜잭션의 커밋과 롤백을 제어하는 트랜잭션 관리 어노테이션이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'GitHub Actions에서 workflow의 trigger 이벤트로 적절하지 않은 것은?', 'push, pull_request, schedule 등이 trigger 이벤트이며, database_change는 GitHub Actions 이벤트가 아닙니다.', 1, 77, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'push — 브랜치에 커밋이 푸시될 때 워크플로우를 실행한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'pull_request — PR이 생성되거나 업데이트될 때 워크플로우를 실행한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'database_change — 데이터베이스 변경 시 워크플로우를 실행한다', TRUE, 3),
    (gen_random_uuid(), q_id, 'schedule — cron 표현식으로 정해진 시간에 워크플로우를 실행한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Zustand와 Redux를 비교했을 때 Zustand의 장점은?', 'Zustand는 보일러플레이트가 적고, 설정이 간단하며, 번들 크기가 작습니다.', 1, 78, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Redux보다 Redux DevTools 지원이 더 강력하고 디버깅 기능이 풍부하다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Redux보다 미들웨어 생태계가 더 크고 서드파티 플러그인이 풍부하다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Next.js의 서버 사이드 렌더링(SSR)을 별도 설정 없이 기본 지원한다', FALSE, 3),
    (gen_random_uuid(), q_id, '보일러플레이트 코드가 적고 설정이 간단하며 번들 크기가 가볍다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스에서 트랜잭션의 ACID 속성 중 Isolation이란?', 'Isolation(격리성)은 동시에 실행되는 트랜잭션들이 서로 영향을 주지 않도록 격리하는 것입니다.', 1, 79, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '트랜잭션 내 작업이 모두 성공하거나 모두 실패하는 원자성(Atomicity)을 보장한다', FALSE, 1),
    (gen_random_uuid(), q_id, '동시에 실행되는 트랜잭션들이 서로 영향을 주지 않도록 격리(Isolation)하는 것이다', TRUE, 2),
    (gen_random_uuid(), q_id, '커밋된 트랜잭션의 결과가 장애 발생 후에도 영구 보존되는 지속성(Durability)이다', FALSE, 3),
    (gen_random_uuid(), q_id, '트랜잭션 전후로 데이터가 항상 유효한 상태를 유지하는 일관성(Consistency)이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Security에서 JWT(JSON Web Token) 인증의 장점은?', 'JWT는 서버가 세션을 저장하지 않아도 되는 Stateless 인증 방식으로, 수평 확장(스케일 아웃)에 유리합니다.', 1, 80, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 측 세션 기반 인증보다 모든 보안 측면에서 항상 더 강력하다', FALSE, 1),
    (gen_random_uuid(), q_id, 'JWT 토큰의 페이로드 크기가 세션 ID보다 항상 작아 네트워크 부하가 줄어든다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Stateless 인증 방식이므로 서버가 세션을 저장하지 않아 수평 확장에 유리하다', TRUE, 3),
    (gen_random_uuid(), q_id, '서버에서 발급된 JWT 토큰을 쉽게 무효화(Revoke)할 수 있어 보안 관리가 간편하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js의 ISR(Incremental Static Regeneration)이란?', 'ISR은 빌드 후에도 특정 페이지를 백그라운드에서 재생성하여 정적 생성의 장점과 최신 데이터를 동시에 제공합니다.', 1, 81, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클라이언트의 브라우저에서 JavaScript로 페이지를 동적으로 생성하는 CSR 기법이다', FALSE, 1),
    (gen_random_uuid(), q_id, '빌드 후에도 백그라운드에서 정적 페이지를 주기적으로 재생성하는 하이브리드 방식이다', TRUE, 2),
    (gen_random_uuid(), q_id, '서버에서 매 요청마다 페이지를 완전히 새로 렌더링하는 전통적 SSR 방식이다', FALSE, 3),
    (gen_random_uuid(), q_id, '빌드 타임에 생성된 정적 파일을 글로벌 CDN에 자동으로 배포하는 기술이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ORM의 N+1 문제를 해결하는 가장 일반적인 방법은?', 'Eager Loading(즉시 로딩) 또는 JOIN FETCH를 사용하여 연관 엔티티를 한 번의 쿼리로 함께 가져옵니다.', 1, 82, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '관련 컬럼에 인덱스를 추가하여 각 개별 쿼리의 조회 속도를 향상시킨다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Redis 같은 외부 캐시를 도입하여 반복 쿼리 결과를 메모리에 저장한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'JOIN FETCH 또는 Eager Loading으로 연관 엔티티를 한 번의 쿼리에 함께 조회한다', TRUE, 3),
    (gen_random_uuid(), q_id, '연관 테이블을 합치는 역정규화(Denormalization)를 적용하여 조인을 제거한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Kubernetes(K8s)의 Pod란?', 'Pod는 K8s에서 배포 가능한 가장 작은 단위로, 하나 이상의 컨테이너를 포함합니다.', 1, 83, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하드웨어 리소스를 가상화한 가상 머신(VM) 하나를 의미하는 K8s 용어이다', FALSE, 1),
    (gen_random_uuid(), q_id, '외부 트래픽을 여러 서비스로 분산하는 네트워크 로드 밸런서 오브젝트이다', FALSE, 2),
    (gen_random_uuid(), q_id, '컨테이너의 영구적 데이터를 저장하는 Persistent Volume 저장소를 의미한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'K8s에서 배포 가능한 가장 작은 단위로 하나 이상의 컨테이너를 포함한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '마이크로서비스 아키텍처(MSA)의 단점은?', 'MSA는 서비스 간 통신 복잡도, 분산 트랜잭션 관리, 모니터링/디버깅 어려움 등의 단점이 있습니다.', 1, 84, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서비스 간 네트워크 통신 복잡도와 분산 트랜잭션 관리의 어려움이 증가한다', TRUE, 1),
    (gen_random_uuid(), q_id, '개별 서비스의 독립적 확장(스케일링)이 불가능하여 확장성이 낮다', FALSE, 2),
    (gen_random_uuid(), q_id, '모든 서비스가 반드시 동일한 프로그래밍 언어와 기술 스택을 사용해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '각 서비스를 개별적으로 배포할 수 없어 전체 배포 빈도가 반드시 낮아진다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React Query(TanStack Query)의 staleTime 옵션의 의미는?', 'staleTime은 데이터가 신선(fresh)한 것으로 간주되는 시간으로, 이 시간 내에는 리패칭하지 않습니다.', 1, 85, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '캐시에 저장된 데이터가 완전히 삭제(가비지 컬렉션)되기까지의 시간이다', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터가 fresh(신선)한 것으로 간주되는 시간으로, 이 기간에는 리패칭하지 않는다', TRUE, 2),
    (gen_random_uuid(), q_id, 'API 서버에 요청을 보낸 후 응답을 기다리는 최대 타임아웃 시간을 의미한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'API 요청 실패 시 자동 재시도(retry)를 수행하는 간격 시간을 의미한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 프로파일(Profile)의 용도는?', '프로파일은 환경별(개발/스테이징/운영) 설정을 분리하여 같은 코드로 다른 환경에 배포할 수 있게 합니다.', 1, 86, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사용자의 프로필 정보(이름, 이메일 등)를 관리하는 인증 모듈을 설정한다', FALSE, 1),
    (gen_random_uuid(), q_id, '환경별(개발/스테이징/운영) 설정을 분리하여 같은 코드로 다른 환경에 배포할 수 있게 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '애플리케이션의 CPU와 메모리 사용량을 프로파일링하여 성능을 측정한다', FALSE, 3),
    (gen_random_uuid(), q_id, '접근 제어와 권한 관리를 위한 보안 정책(Security Policy)을 설정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스에서 낙관적 잠금(Optimistic Locking)의 구현 방식은?', '낙관적 잠금은 버전 번호나 타임스탬프를 사용하여 커밋 시점에 충돌을 감지합니다.', 1, 87, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '레코드를 읽는(SELECT) 시점에 즉시 행 수준의 배타적 잠금(X Lock)을 건다', FALSE, 1),
    (gen_random_uuid(), q_id, '테이블 전체에 공유 잠금(Shared Lock)을 걸어 다른 트랜잭션의 접근을 차단한다', FALSE, 2),
    (gen_random_uuid(), q_id, '트랜잭션을 전혀 사용하지 않고 Last Write Wins 정책으로 충돌을 무시한다', FALSE, 3),
    (gen_random_uuid(), q_id, '버전 번호나 타임스탬프 컬럼을 사용하여 커밋 시점에 충돌을 감지한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'WebSocket과 HTTP의 주요 차이점은?', 'WebSocket은 양방향 실시간 통신을 지원하며, 한 번 연결 후 지속적으로 데이터를 주고받을 수 있습니다.', 1, 88, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'WebSocket이 HTTP보다 TLS 암호화 수준이 높아 보안이 더 강력하다', FALSE, 1),
    (gen_random_uuid(), q_id, 'WebSocket은 한 번 연결 후 양방향 실시간 통신을 지속적으로 지원한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'HTTP도 서버에서 클라이언트로 자유롭게 푸시할 수 있는 양방향 통신을 지원한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'WebSocket과 HTTP는 전송 계층 프로토콜이 다를 뿐 기능상 차이가 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'GraphQL과 REST API의 주요 차이점은?', 'GraphQL은 클라이언트가 필요한 데이터만 정확히 요청할 수 있어 Over-fetching/Under-fetching 문제를 해결합니다.', 1, 89, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GraphQL은 모든 경우에서 REST API보다 네트워크 응답 속도가 빠르다', FALSE, 1),
    (gen_random_uuid(), q_id, 'REST API는 클라이언트가 쿼리 언어로 필요한 필드를 지정하여 요청한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'GraphQL은 클라이언트가 필요한 데이터만 정확히 요청하여 Over/Under-fetching을 해결한다', TRUE, 3),
    (gen_random_uuid(), q_id, 'GraphQL과 REST API는 데이터 전송 방식만 다를 뿐 기능상 차이가 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'CI/CD 파이프라인에서 Blue-Green 배포 전략이란?', 'Blue-Green 배포는 두 개의 동일한 환경을 유지하고, 새 버전을 대기 환경에 배포 후 트래픽을 전환하는 무중단 배포 전략입니다.', 1, 90, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 인스턴스를 하나씩 순차적으로 업데이트하는 롤링 배포(Rolling Deploy) 방식이다', FALSE, 1),
    (gen_random_uuid(), q_id, '전체 사용자 중 일부에게만 새 버전을 제공하여 점진적으로 검증하는 카나리 배포 방식이다', FALSE, 2),
    (gen_random_uuid(), q_id, '두 개의 동일한 환경을 유지하고 새 버전 배포 후 트래픽을 전환하는 무중단 배포 전략이다', TRUE, 3),
    (gen_random_uuid(), q_id, '모든 서버 인스턴스를 동시에 중단하고 새 버전으로 교체한 뒤 재시작하는 방식이다', FALSE, 4);

END $$;
