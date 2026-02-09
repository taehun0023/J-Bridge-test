-- ============================================
-- J-Bridge Seed Data
-- NOTE: profiles/skills 테이블은 handle_new_user 트리거로 자동 생성됨
-- ============================================

-- ============================================
-- 1. Courses (7개 카테고리)
-- ============================================
INSERT INTO courses (id, title, description, category, difficulty, is_published, sort_order) VALUES
  (uuid_generate_v4(), 'JLPT N5 기초', 'N5 급수 단어/문법/독해 기초 과정', 'jlpt_prep', 'beginner', TRUE, 1),
  (uuid_generate_v4(), 'JLPT N4 초급', 'N4 급수 단어/문법/독해/청해 과정', 'jlpt_prep', 'beginner', TRUE, 2),
  (uuid_generate_v4(), 'JLPT N3 중급', 'N3 급수 종합 과정', 'jlpt_prep', 'intermediate', TRUE, 3),
  (uuid_generate_v4(), 'IT 현장 일본어', '개발 현장에서 쓰이는 IT 용어와 비즈니스 회화', 'it_japanese', 'beginner', TRUE, 1),
  (uuid_generate_v4(), 'Java 기초 프로그래밍', 'Java 변수, 조건문, 반복문, 배열 기초', 'core_programming', 'beginner', TRUE, 1),
  (uuid_generate_v4(), 'JavaScript 기초', 'JS 문법, DOM, 비동기 프로그래밍', 'core_programming', 'beginner', TRUE, 2),
  (uuid_generate_v4(), 'SQL 필수 문법', 'SELECT, JOIN, 서브쿼리 등 실무 SQL', 'core_programming', 'beginner', TRUE, 3),
  (uuid_generate_v4(), 'Spring Boot 입문', 'Spring Boot 기반 REST API 개발', 'framework', 'intermediate', TRUE, 1),
  (uuid_generate_v4(), 'React 입문', 'React 컴포넌트, 상태관리, 라우팅', 'framework', 'intermediate', TRUE, 2),
  (uuid_generate_v4(), '알고리즘 기초', '정렬, 탐색, 스택/큐, 해시', 'algorithm', 'beginner', TRUE, 1),
  (uuid_generate_v4(), '사내 근태 관리 시스템', 'SI 프로젝트 시뮬레이션: 근태 관리 시스템 구현', 'project', 'intermediate', TRUE, 1),
  (uuid_generate_v4(), '일본 비즈니스 매너', '호렌소, 근태, 팀워크, 비즈니스 매너 학습', 'attitude_culture', 'beginner', TRUE, 1);

-- ============================================
-- 2. JLPT Vocabulary (N5 샘플 20개)
-- ============================================
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko) VALUES
  ('食べる', 'たべる', '먹다', 'N5', '동사', '朝ごはんを食べる。', '아침밥을 먹다.'),
  ('飲む', 'のむ', '마시다', 'N5', '동사', '水を飲む。', '물을 마시다.'),
  ('行く', 'いく', '가다', 'N5', '동사', '学校に行く。', '학교에 가다.'),
  ('来る', 'くる', '오다', 'N5', '동사', '友達が来る。', '친구가 오다.'),
  ('見る', 'みる', '보다', 'N5', '동사', 'テレビを見る。', '텔레비전을 보다.'),
  ('書く', 'かく', '쓰다', 'N5', '동사', '手紙を書く。', '편지를 쓰다.'),
  ('読む', 'よむ', '읽다', 'N5', '동사', '本を読む。', '책을 읽다.'),
  ('聞く', 'きく', '듣다', 'N5', '동사', '音楽を聞く。', '음악을 듣다.'),
  ('話す', 'はなす', '말하다', 'N5', '동사', '日本語を話す。', '일본어를 말하다.'),
  ('買う', 'かう', '사다', 'N5', '동사', 'パンを買う。', '빵을 사다.'),
  ('大きい', 'おおきい', '크다', 'N5', '형용사', '大きい家。', '큰 집.'),
  ('小さい', 'ちいさい', '작다', 'N5', '형용사', '小さい猫。', '작은 고양이.'),
  ('新しい', 'あたらしい', '새롭다', 'N5', '형용사', '新しい車。', '새 차.'),
  ('古い', 'ふるい', '오래되다', 'N5', '형용사', '古い本。', '오래된 책.'),
  ('高い', 'たかい', '높다/비싸다', 'N5', '형용사', '高い山。', '높은 산.'),
  ('学校', 'がっこう', '학교', 'N5', '명사', '学校に行きます。', '학교에 갑니다.'),
  ('会社', 'かいしゃ', '회사', 'N5', '명사', '会社で働く。', '회사에서 일하다.'),
  ('電車', 'でんしゃ', '전철', 'N5', '명사', '電車に乗る。', '전철을 타다.'),
  ('天気', 'てんき', '날씨', 'N5', '명사', '今日はいい天気です。', '오늘은 좋은 날씨입니다.'),
  ('時間', 'じかん', '시간', 'N5', '명사', '時間がない。', '시간이 없다.');

-- ============================================
-- 3. IT Glossary (카테고리별 샘플)
-- ============================================
INSERT INTO it_glossary (term_ja, reading, term_ko, term_en, category, description, example_sentence) VALUES
  ('要件定義', 'ようけんていぎ', '요건 정의', 'Requirements Definition', 'design_doc', '시스템 개발 전에 고객 요구사항을 정리하는 문서', '要件定義書を作成してください。'),
  ('設計書', 'せっけいしょ', '설계서', 'Design Document', 'design_doc', '시스템의 구조와 동작을 기술한 문서', '基本設計書のレビューをお願いします。'),
  ('テスト仕様書', 'テストしようしょ', '테스트 사양서', 'Test Specification', 'testing', '테스트 항목과 기대 결과를 정리한 문서', 'テスト仕様書に従ってテストを実施する。'),
  ('結合テスト', 'けつごうテスト', '결합 테스트', 'Integration Test', 'testing', '여러 모듈을 연결하여 동작을 확인하는 테스트', '結合テストでバグが見つかりました。'),
  ('デプロイ', NULL, '배포', 'Deploy', 'development', '개발한 코드를 서버에 반영하는 작업', '本番環境にデプロイします。'),
  ('プルリクエスト', NULL, '풀 리퀘스트', 'Pull Request', 'development', '코드 변경을 리뷰 요청하는 것', 'プルリクエストを出しましたのでレビューお願いします。'),
  ('コードレビュー', NULL, '코드 리뷰', 'Code Review', 'development', '다른 개발자의 코드를 검토하는 과정', 'コードレビューのコメントを確認してください。'),
  ('サーバー', NULL, '서버', 'Server', 'infrastructure', '서비스를 제공하는 컴퓨터/시스템', 'サーバーの負荷が高くなっています。'),
  ('ミドルウェア', NULL, '미들웨어', 'Middleware', 'infrastructure', 'OS와 애플리케이션 사이의 소프트웨어', 'ミドルウェアのバージョンを確認してください。'),
  ('進捗報告', 'しんちょくほうこく', '진척 보고', 'Progress Report', 'project_management', '프로젝트 진행 상황을 보고하는 것', '毎週月曜に進捗報告をお願いします。'),
  ('納期', 'のうき', '납기', 'Deadline', 'project_management', '프로젝트 완료 기한', '納期に間に合うように進めてください。'),
  ('打ち合わせ', 'うちあわせ', '미팅/회의', 'Meeting', 'business', '업무 관련 논의를 위한 회의', '15時から打ち合わせがあります。'),
  ('報連相', 'ほうれんそう', '보고·연락·상담', 'Report-Contact-Consult', 'business', '일본 비즈니스의 핵심 커뮤니케이션 원칙', '報連相を徹底してください。');

-- ============================================
-- 4. Coding Problems (난이도별 샘플)
-- ============================================
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb) VALUES
  (
    uuid_generate_v4(),
    'Hello World 출력',
    '표준 출력으로 "Hello World"를 출력하세요.',
    'easy', 'java',
    E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        // 여기에 코드를 작성하세요\n    }\n}',
    2000, 256
  ),
  (
    uuid_generate_v4(),
    '두 수의 합',
    '두 정수 A, B가 주어졌을 때, A+B를 출력하세요.\n\n입력: 첫 줄에 A와 B가 공백으로 구분되어 주어진다. (1 ≤ A, B ≤ 1000)\n출력: A+B를 출력한다.',
    'easy', 'java',
    E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // 여기에 코드를 작성하세요\n    }\n}',
    2000, 256
  ),
  (
    uuid_generate_v4(),
    '배열 정렬',
    'N개의 정수가 주어졌을 때, 오름차순으로 정렬하여 출력하세요.\n\n입력: 첫 줄에 N (1 ≤ N ≤ 1000), 둘째 줄에 N개의 정수\n출력: 정렬된 정수를 공백으로 구분하여 출력',
    'medium', 'java',
    E'import java.util.Scanner;\nimport java.util.Arrays;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // 여기에 코드를 작성하세요\n    }\n}',
    2000, 256
  ),
  (
    uuid_generate_v4(),
    '피보나치 수열',
    'N번째 피보나치 수를 구하세요.\nF(0)=0, F(1)=1, F(n)=F(n-1)+F(n-2)\n\n입력: 정수 N (0 ≤ N ≤ 45)\n출력: N번째 피보나치 수',
    'medium', 'java',
    E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // 여기에 코드를 작성하세요\n    }\n}',
    2000, 256
  ),
  (
    uuid_generate_v4(),
    '최단 경로 (BFS)',
    'N×M 크기의 미로에서 (1,1)부터 (N,M)까지의 최단 거리를 구하세요.\n1은 이동 가능, 0은 벽.\n\n입력: 첫 줄에 N, M (2 ≤ N, M ≤ 100), 이후 N줄에 미로 정보\n출력: 최단 거리 (칸 수)',
    'hard', 'java',
    E'import java.util.*;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // 여기에 코드를 작성하세요\n    }\n}',
    3000, 256
  );

-- ============================================
-- 5. Coding Skill Exams (등급별 샘플)
-- ============================================
INSERT INTO coding_skill_exams (title, target_rank, language, description, time_limit_minutes, passing_score, is_published, sort_order) VALUES
  ('D등급 시험 - Java 기초', 'D', 'java', '기본 문법 이해: 변수, 조건문, 반복문', 30, 70, TRUE, 1),
  ('C등급 시험 - Java 기초 알고리즘', 'C', 'java', '기초 알고리즘: 배열, 문자열 처리, 정렬', 45, 70, TRUE, 2),
  ('B등급 시험 - Java 중급 알고리즘', 'B', 'java', '중급 알고리즘: 탐색, 스택/큐, 해시', 60, 70, TRUE, 3),
  ('A등급 시험 - Java 고급 알고리즘', 'A', 'java', '고급 알고리즘: DP, 그래프, DFS/BFS', 90, 70, FALSE, 4),
  ('S등급 시험 - Java 최상위', 'S', 'java', '복합 알고리즘, 최적화', 120, 80, FALSE, 5);

-- ============================================
-- 6. Ranking Season (현재 시즌)
-- ============================================
INSERT INTO ranking_seasons (name, start_date, end_date, is_active) VALUES
  ('2026 Q1', '2026-01-01', '2026-03-31', TRUE);
