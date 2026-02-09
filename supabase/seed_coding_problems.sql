-- ============================================
-- J-Bridge Seed: Coding Problems (25개)
-- UUID: c0000001-0000-4000-a000-000000000001 ~ 000000000019
-- 분포: easy 10, medium 10, hard 5
-- 언어: java 15, javascript 5, sql 5
-- ============================================

-- ============================================
-- EASY 문제 (10개) — 001 ~ 00a (hex)
-- ============================================

-- #01 Easy / Java — 문자열 뒤집기
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000001',
  '문자열 뒤집기',
  E'주어진 문자열을 뒤집어서 출력하세요.\n\n**입력**\n첫 줄에 문자열 S가 주어진다. (1 ≤ |S| ≤ 1000, 영소문자로만 구성)\n\n**출력**\n뒤집은 문자열을 출력한다.\n\n**예시**\n입력: hello\n출력: olleh',
  'easy', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        String s = sc.nextLine();\n        // 여기에 코드를 작성하세요\n    }\n}',
  2000, 256
);

-- #02 Easy / Java — 최대값 찾기
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000002',
  '배열에서 최대값 찾기',
  E'N개의 정수가 주어졌을 때, 최대값을 출력하세요.\n\n**입력**\n첫 줄에 정수 N (1 ≤ N ≤ 1000)\n둘째 줄에 N개의 정수 (각 정수는 -1000000 이상 1000000 이하)\n\n**출력**\n최대값을 출력한다.\n\n**예시**\n입력:\n5\n3 1 4 1 5\n출력: 5',
  'easy', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        // 여기에 코드를 작성하세요\n    }\n}',
  2000, 256
);

-- #03 Easy / Java — 짝수 홀수 판별
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000003',
  '짝수 홀수 판별',
  E'정수 N이 주어졌을 때, 짝수면 "even", 홀수면 "odd"를 출력하세요.\n\n**입력**\n정수 N (-1000000 ≤ N ≤ 1000000)\n\n**출력**\n"even" 또는 "odd"\n\n**예시**\n입력: 4\n출력: even',
  'easy', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        // 여기에 코드를 작성하세요\n    }\n}',
  2000, 256
);

-- #04 Easy / Java — 구구단 출력
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000004',
  '구구단 출력',
  E'정수 N이 주어졌을 때, N단 구구단을 출력하세요.\n\n**입력**\n정수 N (1 ≤ N ≤ 9)\n\n**출력**\nN * 1 = ? 부터 N * 9 = ? 까지 한 줄씩 출력\n형식: "N * i = 결과"\n\n**예시**\n입력: 2\n출력:\n2 * 1 = 2\n2 * 2 = 4\n2 * 3 = 6\n2 * 4 = 8\n2 * 5 = 10\n2 * 6 = 12\n2 * 7 = 14\n2 * 8 = 16\n2 * 9 = 18',
  'easy', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        // 여기에 코드를 작성하세요\n    }\n}',
  2000, 256
);

-- #05 Easy / Java — 배열 합계
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000005',
  '배열 원소의 합',
  E'N개의 정수가 주어졌을 때, 모든 원소의 합을 출력하세요.\n\n**입력**\n첫 줄에 정수 N (1 ≤ N ≤ 1000)\n둘째 줄에 N개의 정수 (각 정수는 -1000000 이상 1000000 이하)\n\n**출력**\n합계를 출력한다.\n\n**예시**\n입력:\n4\n1 2 3 4\n출력: 10',
  'easy', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        // 여기에 코드를 작성하세요\n    }\n}',
  2000, 256
);

-- #06 Easy / JavaScript — 팩토리얼 계산
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000006',
  '팩토리얼 계산',
  E'정수 N이 주어졌을 때, N! (N 팩토리얼)을 출력하세요.\n\n**입력**\n정수 N (0 ≤ N ≤ 20)\n\n**출력**\nN!의 값\n\n**예시**\n입력: 5\n출력: 120',
  'easy', 'javascript',
  E'const readline = require(''readline'');\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on(''line'', (line) => {\n    const n = parseInt(line.trim());\n    // 여기에 코드를 작성하세요\n    rl.close();\n});',
  2000, 256
);

-- #07 Easy / JavaScript — 문자열 내 특정 문자 개수
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000007',
  '문자열 내 특정 문자 개수',
  E'문자열 S와 문자 C가 주어졌을 때, S에서 C가 등장하는 횟수를 출력하세요.\n\n**입력**\n첫 줄에 문자열 S (1 ≤ |S| ≤ 1000, 영소문자)\n둘째 줄에 문자 C (영소문자 1개)\n\n**출력**\n등장 횟수\n\n**예시**\n입력:\nbanana\na\n출력: 3',
  'easy', 'javascript',
  E'const readline = require(''readline'');\nconst rl = readline.createInterface({ input: process.stdin });\nconst lines = [];\n\nrl.on(''line'', (line) => {\n    lines.push(line.trim());\n    if (lines.length === 2) {\n        const s = lines[0];\n        const c = lines[1];\n        // 여기에 코드를 작성하세요\n        rl.close();\n    }\n});',
  2000, 256
);

-- #08 Easy / SQL — 전체 사원 조회
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000008',
  '전체 사원 조회',
  E'employees 테이블에서 모든 사원의 name과 salary를 조회하세요. salary 내림차순으로 정렬합니다.\n\n**테이블 구조**\nemployees (id INT, name VARCHAR, department VARCHAR, salary INT, hire_date DATE)\n\n**출력 컬럼**\nname, salary\n\n**정렬**\nsalary 내림차순',
  'easy', 'sql',
  E'-- 여기에 SQL을 작성하세요\nSELECT',
  5000, 256
);

-- #09 Easy / SQL — 조건 검색
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000009',
  '부서별 사원 검색',
  E'employees 테이블에서 department가 "Engineering"인 사원의 name과 hire_date를 조회하세요.\nhire_date 오름차순으로 정렬합니다.\n\n**테이블 구조**\nemployees (id INT, name VARCHAR, department VARCHAR, salary INT, hire_date DATE)\n\n**출력 컬럼**\nname, hire_date\n\n**정렬**\nhire_date 오름차순',
  'easy', 'sql',
  E'-- 여기에 SQL을 작성하세요\nSELECT',
  5000, 256
);

-- #10 Easy / Java — 소수 판별
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-00000000000a',
  '소수 판별',
  E'정수 N이 주어졌을 때, 소수이면 "prime", 아니면 "not prime"을 출력하세요.\n\n**입력**\n정수 N (2 ≤ N ≤ 1000000)\n\n**출력**\n"prime" 또는 "not prime"\n\n**예시**\n입력: 7\n출력: prime\n\n입력: 4\n출력: not prime',
  'easy', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        // 여기에 코드를 작성하세요\n    }\n}',
  2000, 256
);

-- ============================================
-- MEDIUM 문제 (10개) — 00b ~ 014 (hex)
-- ============================================

-- #11 Medium / Java — 버블 정렬 구현
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-00000000000b',
  '버블 정렬 구현',
  E'N개의 정수가 주어졌을 때, 버블 정렬 알고리즘을 사용하여 오름차순으로 정렬한 결과를 출력하세요.\n\n**입력**\n첫 줄에 정수 N (1 ≤ N ≤ 1000)\n둘째 줄에 N개의 정수\n\n**출력**\n정렬된 정수를 공백으로 구분하여 출력\n\n**예시**\n입력:\n5\n5 3 1 4 2\n출력: 1 2 3 4 5',
  'medium', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int[] arr = new int[n];\n        for (int i = 0; i < n; i++) {\n            arr[i] = sc.nextInt();\n        }\n        // 버블 정렬을 구현하세요\n    }\n}',
  2000, 256
);

-- #12 Medium / Java — 이진 탐색
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-00000000000c',
  '이진 탐색',
  E'오름차순으로 정렬된 N개의 정수 배열에서 특정 값 X의 위치를 찾으세요.\n존재하면 1-based 인덱스, 없으면 -1을 출력합니다.\n\n**입력**\n첫 줄에 정수 N (1 ≤ N ≤ 100000)\n둘째 줄에 N개의 정수 (오름차순, 중복 없음)\n셋째 줄에 찾을 정수 X\n\n**출력**\nX의 위치(1-based) 또는 -1\n\n**예시**\n입력:\n5\n1 3 5 7 9\n5\n출력: 3',
  'medium', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int[] arr = new int[n];\n        for (int i = 0; i < n; i++) {\n            arr[i] = sc.nextInt();\n        }\n        int x = sc.nextInt();\n        // 이진 탐색을 구현하세요\n    }\n}',
  2000, 256
);

-- #13 Medium / Java — 스택으로 괄호 검증
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-00000000000d',
  '괄호 유효성 검사',
  E'괄호 문자열이 주어졌을 때, 올바른 괄호 문자열인지 판별하세요.\n소괄호 (), 중괄호 {}, 대괄호 []를 모두 처리해야 합니다.\n\n**입력**\n괄호 문자열 S (1 ≤ |S| ≤ 10000)\n\n**출력**\n올바르면 "YES", 아니면 "NO"\n\n**예시**\n입력: ({[]})\n출력: YES\n\n입력: ({[})\n출력: NO',
  'medium', 'java',
  E'import java.util.Scanner;\nimport java.util.Stack;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        String s = sc.nextLine();\n        // 스택을 사용하여 괄호를 검증하세요\n    }\n}',
  2000, 256
);

-- #14 Medium / Java — HashMap으로 빈도수 계산
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-00000000000e',
  '단어 빈도수 계산',
  E'N개의 단어가 주어졌을 때, 각 단어의 등장 횟수를 구하세요.\n알파벳 순서대로 출력합니다.\n\n**입력**\n첫 줄에 정수 N (1 ≤ N ≤ 10000)\n둘째 줄부터 N줄에 걸쳐 단어 (영소문자, 1 ≤ |단어| ≤ 20)\n\n**출력**\n알파벳 순서대로 "단어 빈도수" 형식으로 한 줄씩 출력\n\n**예시**\n입력:\n5\napple\nbanana\napple\ncherry\nbanana\n출력:\napple 2\nbanana 2\ncherry 1',
  'medium', 'java',
  E'import java.util.*;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = Integer.parseInt(sc.nextLine());\n        // HashMap을 사용하여 빈도수를 구하세요\n    }\n}',
  2000, 256
);

-- #15 Medium / Java — 큐를 이용한 요세푸스 문제
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-00000000000f',
  '요세푸스 문제',
  E'N명의 사람이 원형으로 앉아 있을 때, K번째 사람을 순서대로 제거합니다.\n제거되는 순서를 출력하세요.\n\n**입력**\n첫 줄에 정수 N, K (1 ≤ K ≤ N ≤ 1000)\n\n**출력**\n제거 순서를 쉼표와 공백으로 구분하여 출력\n형식: <1, 2, 3, ...>\n\n**예시**\n입력: 7 3\n출력: <3, 6, 2, 7, 5, 1, 4>',
  'medium', 'java',
  E'import java.util.*;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int k = sc.nextInt();\n        // 큐를 사용하여 요세푸스 문제를 풀어보세요\n    }\n}',
  2000, 256
);

-- #16 Medium / JavaScript — 문자열 압축
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000010',
  '문자열 압축',
  E'연속된 같은 문자를 "문자+개수" 형식으로 압축하세요.\n개수가 1인 경우 숫자를 생략합니다.\n\n**입력**\n문자열 S (1 ≤ |S| ≤ 1000, 영대문자)\n\n**출력**\n압축된 문자열\n\n**예시**\n입력: AAABBC\n출력: A3B2C\n\n입력: ABCD\n출력: ABCD',
  'medium', 'javascript',
  E'const readline = require(''readline'');\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on(''line'', (line) => {\n    const s = line.trim();\n    // 여기에 코드를 작성하세요\n    rl.close();\n});',
  2000, 256
);

-- #17 Medium / JavaScript — 행렬 회전
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000011',
  'N×N 행렬 90도 회전',
  E'N×N 행렬을 시계방향으로 90도 회전한 결과를 출력하세요.\n\n**입력**\n첫 줄에 정수 N (1 ≤ N ≤ 100)\n이후 N줄에 걸쳐 N개의 정수 (공백 구분)\n\n**출력**\n회전된 행렬을 N줄에 걸쳐 출력 (각 원소 공백 구분)\n\n**예시**\n입력:\n3\n1 2 3\n4 5 6\n7 8 9\n출력:\n7 4 1\n8 5 2\n9 6 3',
  'medium', 'javascript',
  E'const readline = require(''readline'');\nconst rl = readline.createInterface({ input: process.stdin });\nconst lines = [];\n\nrl.on(''line'', (line) => {\n    lines.push(line.trim());\n});\n\nrl.on(''close'', () => {\n    const n = parseInt(lines[0]);\n    const matrix = [];\n    for (let i = 1; i <= n; i++) {\n        matrix.push(lines[i].split('' '').map(Number));\n    }\n    // 여기에 코드를 작성하세요\n});',
  2000, 256
);

-- #18 Medium / JavaScript — 두 수의 합 (Two Sum)
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000012',
  'Two Sum',
  E'N개의 정수 배열과 목표값 T가 주어졌을 때, 합이 T가 되는 두 원소의 인덱스를 찾으세요.\n답이 항상 존재하며, 0-based 인덱스를 오름차순으로 출력합니다.\n\n**입력**\n첫 줄에 정수 N (2 ≤ N ≤ 10000)\n둘째 줄에 N개의 정수\n셋째 줄에 목표값 T\n\n**출력**\n두 인덱스를 공백으로 구분하여 출력\n\n**예시**\n입력:\n4\n2 7 11 15\n9\n출력: 0 1',
  'medium', 'javascript',
  E'const readline = require(''readline'');\nconst rl = readline.createInterface({ input: process.stdin });\nconst lines = [];\n\nrl.on(''line'', (line) => {\n    lines.push(line.trim());\n});\n\nrl.on(''close'', () => {\n    const n = parseInt(lines[0]);\n    const arr = lines[1].split('' '').map(Number);\n    const target = parseInt(lines[2]);\n    // 여기에 코드를 작성하세요\n});',
  2000, 256
);

-- #19 Medium / SQL — GROUP BY 집계
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000013',
  '부서별 평균 급여',
  E'employees 테이블에서 부서별 평균 급여를 구하세요.\n평균 급여가 높은 부서부터 출력합니다.\n\n**테이블 구조**\nemployees (id INT, name VARCHAR, department VARCHAR, salary INT, hire_date DATE)\n\n**출력 컬럼**\ndepartment, avg_salary (소수점 반올림하여 정수)\n\n**정렬**\navg_salary 내림차순',
  'medium', 'sql',
  E'-- 여기에 SQL을 작성하세요\nSELECT',
  5000, 256
);

-- #20 Medium / SQL — JOIN 활용
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000014',
  '주문 내역 조회 (JOIN)',
  E'customers와 orders 테이블을 JOIN하여 각 고객의 이름과 총 주문 금액을 구하세요.\n주문이 없는 고객도 포함합니다.\n\n**테이블 구조**\ncustomers (id INT, name VARCHAR, email VARCHAR)\norders (id INT, customer_id INT, amount INT, order_date DATE)\n\n**출력 컬럼**\nname, total_amount (NULL이면 0으로 표시)\n\n**정렬**\ntotal_amount 내림차순',
  'medium', 'sql',
  E'-- 여기에 SQL을 작성하세요\nSELECT',
  5000, 256
);

-- ============================================
-- HARD 문제 (5개) — 015 ~ 019 (hex)
-- ============================================

-- #21 Hard / Java — 동적 프로그래밍: 최장 증가 부분 수열 (LIS)
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000015',
  '최장 증가 부분 수열 (LIS)',
  E'N개의 정수로 이루어진 수열에서 가장 긴 증가하는 부분 수열의 길이를 구하세요.\n\n**입력**\n첫 줄에 정수 N (1 ≤ N ≤ 1000)\n둘째 줄에 N개의 정수 (각 정수는 1 이상 1000000 이하)\n\n**출력**\n최장 증가 부분 수열의 길이\n\n**예시**\n입력:\n6\n10 20 10 30 20 50\n출력: 4\n\n설명: [10, 20, 30, 50]이 가장 긴 증가하는 부분 수열',
  'hard', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int[] arr = new int[n];\n        for (int i = 0; i < n; i++) {\n            arr[i] = sc.nextInt();\n        }\n        // DP를 사용하여 LIS 길이를 구하세요\n    }\n}',
  3000, 256
);

-- #22 Hard / Java — 그래프 탐색: DFS 연결 요소 개수
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000016',
  '연결 요소의 개수',
  E'무방향 그래프에서 연결 요소의 개수를 구하세요.\n\n**입력**\n첫 줄에 정점 수 N, 간선 수 M (1 ≤ N ≤ 1000, 0 ≤ M ≤ N*(N-1)/2)\n이후 M줄에 걸쳐 간선 정보 "u v" (1 ≤ u, v ≤ N, u ≠ v)\n\n**출력**\n연결 요소의 개수\n\n**예시**\n입력:\n6 5\n1 2\n2 5\n5 1\n3 4\n4 6\n출력: 2',
  'hard', 'java',
  E'import java.util.*;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int m = sc.nextInt();\n        // 인접 리스트를 구성하고 DFS/BFS로 연결 요소를 세세요\n    }\n}',
  3000, 256
);

-- #23 Hard / Java — DP: 배낭 문제 (0/1 Knapsack)
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000017',
  '배낭 문제 (0/1 Knapsack)',
  E'N개의 물건과 배낭 용량 W가 주어졌을 때, 배낭에 넣을 수 있는 물건의 최대 가치를 구하세요.\n각 물건은 한 번만 사용할 수 있습니다.\n\n**입력**\n첫 줄에 N, W (1 ≤ N ≤ 100, 1 ≤ W ≤ 10000)\n이후 N줄에 걸쳐 각 물건의 무게 wi와 가치 vi (1 ≤ wi ≤ W, 1 ≤ vi ≤ 1000)\n\n**출력**\n최대 가치\n\n**예시**\n입력:\n4 7\n1 1\n3 4\n4 5\n5 7\n출력: 9\n\n설명: 무게 3(가치4) + 무게 4(가치5) = 무게7, 가치9',
  'hard', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int w = sc.nextInt();\n        int[] weight = new int[n];\n        int[] value = new int[n];\n        for (int i = 0; i < n; i++) {\n            weight[i] = sc.nextInt();\n            value[i] = sc.nextInt();\n        }\n        // 0/1 Knapsack DP를 구현하세요\n    }\n}',
  3000, 256
);

-- #24 Hard / SQL — 서브쿼리 + 윈도우 함수
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000018',
  '부서별 급여 순위',
  E'각 사원에 대해 소속 부서 내 급여 순위를 구하세요.\n같은 급여일 경우 같은 순위를 부여합니다 (DENSE_RANK).\n\n**테이블 구조**\nemployees (id INT, name VARCHAR, department VARCHAR, salary INT, hire_date DATE)\n\n**출력 컬럼**\ndepartment, name, salary, salary_rank\n\n**정렬**\ndepartment 오름차순, salary_rank 오름차순',
  'hard', 'sql',
  E'-- 윈도우 함수를 사용하세요\nSELECT',
  5000, 256
);

-- #25 Hard / SQL — 복합 쿼리: 연속 출근 일수
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, time_limit_ms, memory_limit_mb)
VALUES (
  'c0000001-0000-4000-a000-000000000019',
  '최대 연속 로그인 일수',
  E'사용자의 로그인 기록에서 각 사용자별 최대 연속 로그인 일수를 구하세요.\n\n**테이블 구조**\nlogin_history (id INT, user_id INT, login_date DATE)\n(같은 날 중복 로그인은 없음)\n\n**출력 컬럼**\nuser_id, max_streak\n\n**정렬**\nmax_streak 내림차순, user_id 오름차순',
  'hard', 'sql',
  E'-- 윈도우 함수와 날짜 연산을 활용하세요\nSELECT',
  5000, 256
);
