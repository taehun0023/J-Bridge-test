-- ============================================
-- J-Bridge Seed: Coding Test Cases
-- 25개 문제 × 5개 테스트케이스 = 125개
-- 각 문제별: is_sample=TRUE 2개, is_sample=FALSE 3개
-- sort_order: 1~5
-- ============================================

-- ============================================
-- Problem #01: 문자열 뒤집기 (c0000001-...-000000000001)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000001', 'hello', 'olleh', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000001', 'abcde', 'edcba', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000001', 'a', 'a', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000001', 'racecar', 'racecar', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000001', 'abcdefghijklmnopqrstuvwxyz', 'zyxwvutsrqponmlkjihgfedcba', FALSE, 5);

-- ============================================
-- Problem #02: 배열에서 최대값 찾기 (c0000001-...-000000000002)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000002', E'5\n3 1 4 1 5', '5', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000002', E'3\n-1 -5 -3', '-1', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000002', E'1\n42', '42', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000002', E'4\n1000000 -1000000 0 999999', '1000000', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000002', E'6\n7 7 7 7 7 7', '7', FALSE, 5);

-- ============================================
-- Problem #03: 짝수 홀수 판별 (c0000001-...-000000000003)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000003', '4', 'even', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000003', '7', 'odd', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000003', '0', 'even', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000003', '-3', 'odd', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000003', '1000000', 'even', FALSE, 5);

-- ============================================
-- Problem #04: 구구단 출력 (c0000001-...-000000000004)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000004', '2', E'2 * 1 = 2\n2 * 2 = 4\n2 * 3 = 6\n2 * 4 = 8\n2 * 5 = 10\n2 * 6 = 12\n2 * 7 = 14\n2 * 8 = 16\n2 * 9 = 18', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000004', '5', E'5 * 1 = 5\n5 * 2 = 10\n5 * 3 = 15\n5 * 4 = 20\n5 * 5 = 25\n5 * 6 = 30\n5 * 7 = 35\n5 * 8 = 40\n5 * 9 = 45', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000004', '1', E'1 * 1 = 1\n1 * 2 = 2\n1 * 3 = 3\n1 * 4 = 4\n1 * 5 = 5\n1 * 6 = 6\n1 * 7 = 7\n1 * 8 = 8\n1 * 9 = 9', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000004', '9', E'9 * 1 = 9\n9 * 2 = 18\n9 * 3 = 27\n9 * 4 = 36\n9 * 5 = 45\n9 * 6 = 54\n9 * 7 = 63\n9 * 8 = 72\n9 * 9 = 81', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000004', '7', E'7 * 1 = 7\n7 * 2 = 14\n7 * 3 = 21\n7 * 4 = 28\n7 * 5 = 35\n7 * 6 = 42\n7 * 7 = 49\n7 * 8 = 56\n7 * 9 = 63', FALSE, 5);

-- ============================================
-- Problem #05: 배열 원소의 합 (c0000001-...-000000000005)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000005', E'4\n1 2 3 4', '10', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000005', E'3\n-1 0 1', '0', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000005', E'1\n100', '100', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000005', E'5\n-1000000 -1000000 1000000 1000000 0', '0', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000005', E'6\n10 20 30 40 50 60', '210', FALSE, 5);

-- ============================================
-- Problem #06: 팩토리얼 계산 (c0000001-...-000000000006)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000006', '5', '120', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000006', '3', '6', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000006', '0', '1', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000006', '1', '1', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000006', '10', '3628800', FALSE, 5);

-- ============================================
-- Problem #07: 문자열 내 특정 문자 개수 (c0000001-...-000000000007)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000007', E'banana\na', '3', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000007', E'hello\nl', '2', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000007', E'aaa\na', '3', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000007', E'abcdef\nz', '0', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000007', E'mississippi\ns', '4', FALSE, 5);

-- ============================================
-- Problem #08: 전체 사원 조회 (c0000001-...-000000000008)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000008',
    E'employees:\nid,name,department,salary,hire_date\n1,Alice,Engineering,90000,2020-01-15\n2,Bob,Sales,70000,2019-06-01\n3,Carol,Engineering,85000,2021-03-10',
    E'Alice,90000\nCarol,85000\nBob,70000', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000008',
    E'employees:\nid,name,department,salary,hire_date\n1,Tom,HR,60000,2022-01-01',
    E'Tom,60000', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000008',
    E'employees:\nid,name,department,salary,hire_date\n1,A,X,50000,2020-01-01\n2,B,Y,50000,2020-02-01',
    E'A,50000\nB,50000', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000008',
    E'employees:\nid,name,department,salary,hire_date\n1,Z,Dev,100000,2018-01-01\n2,Y,Dev,95000,2019-01-01\n3,X,Dev,80000,2020-01-01\n4,W,QA,75000,2021-01-01',
    E'Z,100000\nY,95000\nX,80000\nW,75000', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000008',
    E'employees:\nid,name,department,salary,hire_date\n1,Solo,Alone,999999,2023-01-01',
    E'Solo,999999', FALSE, 5);

-- ============================================
-- Problem #09: 부서별 사원 검색 (c0000001-...-000000000009)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000009',
    E'employees:\nid,name,department,salary,hire_date\n1,Alice,Engineering,90000,2020-01-15\n2,Bob,Sales,70000,2019-06-01\n3,Carol,Engineering,85000,2021-03-10',
    E'Alice,2020-01-15\nCarol,2021-03-10', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000009',
    E'employees:\nid,name,department,salary,hire_date\n1,Tom,HR,60000,2022-01-01\n2,Sue,Engineering,70000,2022-06-01',
    E'Sue,2022-06-01', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000009',
    E'employees:\nid,name,department,salary,hire_date\n1,A,Sales,50000,2020-01-01\n2,B,Sales,60000,2021-01-01',
    E'', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000009',
    E'employees:\nid,name,department,salary,hire_date\n1,X,Engineering,80000,2023-06-15\n2,Y,Engineering,75000,2022-03-01\n3,Z,Engineering,90000,2021-01-10',
    E'Z,2021-01-10\nY,2022-03-01\nX,2023-06-15', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000009',
    E'employees:\nid,name,department,salary,hire_date\n1,Solo,Engineering,100000,2020-07-01',
    E'Solo,2020-07-01', FALSE, 5);

-- ============================================
-- Problem #10: 소수 판별 (c0000001-...-00000000000a)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000a', '7', 'prime', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000a', '4', 'not prime', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000a', '2', 'prime', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000a', '1000000', 'not prime', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000a', '999983', 'prime', FALSE, 5);

-- ============================================
-- Problem #11: 버블 정렬 구현 (c0000001-...-00000000000b)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000b', E'5\n5 3 1 4 2', '1 2 3 4 5', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000b', E'3\n3 2 1', '1 2 3', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000b', E'1\n42', '42', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000b', E'4\n1 1 1 1', '1 1 1 1', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000b', E'6\n-3 5 -1 0 2 -7', '-7 -3 -1 0 2 5', FALSE, 5);

-- ============================================
-- Problem #12: 이진 탐색 (c0000001-...-00000000000c)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000c', E'5\n1 3 5 7 9\n5', '3', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000c', E'5\n1 3 5 7 9\n6', '-1', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000c', E'1\n10\n10', '1', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000c', E'7\n2 4 6 8 10 12 14\n2', '1', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000c', E'7\n2 4 6 8 10 12 14\n14', '7', FALSE, 5);

-- ============================================
-- Problem #13: 괄호 유효성 검사 (c0000001-...-00000000000d)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000d', '({[]})', 'YES', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000d', '({[})', 'NO', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000d', '', 'YES', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000d', '((((', 'NO', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000d', '(){}[](){}[]', 'YES', FALSE, 5);

-- ============================================
-- Problem #14: 단어 빈도수 계산 (c0000001-...-00000000000e)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000e', E'5\napple\nbanana\napple\ncherry\nbanana', E'apple 2\nbanana 2\ncherry 1', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000e', E'3\ndog\ncat\ndog', E'cat 1\ndog 2', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000e', E'1\nhello', E'hello 1', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000e', E'4\naaa\naaa\naaa\naaa', E'aaa 4', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000e', E'6\nzoo\napple\nmango\napple\nzoo\nmango', E'apple 2\nmango 2\nzoo 2', FALSE, 5);

-- ============================================
-- Problem #15: 요세푸스 문제 (c0000001-...-00000000000f)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000f', '7 3', '<3, 6, 2, 7, 5, 1, 4>', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000f', '4 2', '<2, 4, 3, 1>', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000f', '1 1', '<1>', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000f', '5 1', '<1, 2, 3, 4, 5>', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-00000000000f', '6 4', '<4, 2, 1, 3, 6, 5>', FALSE, 5);

-- ============================================
-- Problem #16: 문자열 압축 (c0000001-...-000000000010)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000010', 'AAABBC', 'A3B2C', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000010', 'ABCD', 'ABCD', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000010', 'A', 'A', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000010', 'AAAAAAAAAAAB', 'A11B', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000010', 'AABBCCDD', 'A2B2C2D2', FALSE, 5);

-- ============================================
-- Problem #17: N×N 행렬 90도 회전 (c0000001-...-000000000011)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000011', E'3\n1 2 3\n4 5 6\n7 8 9', E'7 4 1\n8 5 2\n9 6 3', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000011', E'2\n1 2\n3 4', E'3 1\n4 2', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000011', E'1\n5', '5', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000011', E'4\n1 2 3 4\n5 6 7 8\n9 10 11 12\n13 14 15 16', E'13 9 5 1\n14 10 6 2\n15 11 7 3\n16 12 8 4', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000011', E'2\n0 0\n0 0', E'0 0\n0 0', FALSE, 5);

-- ============================================
-- Problem #18: Two Sum (c0000001-...-000000000012)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000012', E'4\n2 7 11 15\n9', '0 1', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000012', E'3\n3 2 4\n6', '1 2', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000012', E'2\n1 2\n3', '0 1', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000012', E'5\n-1 0 1 2 -2\n0', '0 2', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000012', E'4\n1 5 3 7\n8', '0 3', FALSE, 5);

-- ============================================
-- Problem #19: 부서별 평균 급여 (c0000001-...-000000000013)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000013',
    E'employees:\nid,name,department,salary,hire_date\n1,Alice,Engineering,90000,2020-01-15\n2,Bob,Sales,70000,2019-06-01\n3,Carol,Engineering,80000,2021-03-10\n4,Dan,Sales,75000,2020-09-01',
    E'Engineering,85000\nSales,72500', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000013',
    E'employees:\nid,name,department,salary,hire_date\n1,Tom,HR,60000,2022-01-01',
    E'HR,60000', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000013',
    E'employees:\nid,name,department,salary,hire_date\n1,A,X,50000,2020-01-01\n2,B,X,60000,2020-02-01\n3,C,Y,55000,2020-03-01',
    E'X,55000\nY,55000', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000013',
    E'employees:\nid,name,department,salary,hire_date\n1,A,Dev,100000,2018-01-01\n2,B,QA,40000,2019-01-01\n3,C,Dev,80000,2020-01-01\n4,D,QA,50000,2021-01-01\n5,E,PM,95000,2022-01-01',
    E'PM,95000\nDev,90000\nQA,45000', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000013',
    E'employees:\nid,name,department,salary,hire_date\n1,Solo,Alone,99999,2023-01-01',
    E'Alone,99999', FALSE, 5);

-- ============================================
-- Problem #20: 주문 내역 조회 JOIN (c0000001-...-000000000014)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000014',
    E'customers:\nid,name,email\n1,Alice,alice@test.com\n2,Bob,bob@test.com\n3,Carol,carol@test.com\norders:\nid,customer_id,amount,order_date\n1,1,100,2024-01-01\n2,1,200,2024-02-01\n3,2,150,2024-01-15',
    E'Alice,300\nBob,150\nCarol,0', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000014',
    E'customers:\nid,name,email\n1,Tom,tom@test.com\norders:\nid,customer_id,amount,order_date\n1,1,500,2024-03-01',
    E'Tom,500', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000014',
    E'customers:\nid,name,email\n1,A,a@test.com\n2,B,b@test.com\norders:\nid,customer_id,amount,order_date',
    E'A,0\nB,0', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000014',
    E'customers:\nid,name,email\n1,X,x@test.com\n2,Y,y@test.com\norders:\nid,customer_id,amount,order_date\n1,1,10,2024-01-01\n2,1,20,2024-01-02\n3,1,30,2024-01-03\n4,2,100,2024-01-01',
    E'Y,100\nX,60', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000014',
    E'customers:\nid,name,email\n1,Solo,s@test.com\norders:\nid,customer_id,amount,order_date\n1,1,999,2024-06-01',
    E'Solo,999', FALSE, 5);

-- ============================================
-- Problem #21: LIS (c0000001-...-000000000015)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000015', E'6\n10 20 10 30 20 50', '4', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000015', E'5\n5 4 3 2 1', '1', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000015', E'1\n7', '1', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000015', E'8\n1 2 3 4 5 6 7 8', '8', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000015', E'9\n3 1 4 1 5 9 2 6 5', '5', FALSE, 5);

-- ============================================
-- Problem #22: 연결 요소의 개수 (c0000001-...-000000000016)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000016', E'6 5\n1 2\n2 5\n5 1\n3 4\n4 6', '2', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000016', E'3 0', '3', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000016', E'1 0', '1', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000016', E'4 3\n1 2\n2 3\n3 4', '1', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000016', E'5 2\n1 2\n4 5', '3', FALSE, 5);

-- ============================================
-- Problem #23: 배낭 문제 (c0000001-...-000000000017)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000017', E'4 7\n1 1\n3 4\n4 5\n5 7', '9', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000017', E'3 10\n5 10\n4 40\n6 30', '70', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000017', E'1 1\n1 100', '100', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000017', E'3 5\n6 10\n7 20\n8 30', '0', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000017', E'5 15\n1 1\n5 10\n10 15\n7 12\n3 5', '28', FALSE, 5);

-- ============================================
-- Problem #24: 부서별 급여 순위 (c0000001-...-000000000018)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000018',
    E'employees:\nid,name,department,salary,hire_date\n1,Alice,Engineering,90000,2020-01-15\n2,Bob,Engineering,85000,2019-06-01\n3,Carol,Engineering,90000,2021-03-10\n4,Dan,Sales,70000,2020-09-01\n5,Eve,Sales,75000,2021-01-01',
    E'Engineering,Alice,90000,1\nEngineering,Carol,90000,1\nEngineering,Bob,85000,2\nSales,Eve,75000,1\nSales,Dan,70000,2', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000018',
    E'employees:\nid,name,department,salary,hire_date\n1,Tom,HR,60000,2022-01-01',
    E'HR,Tom,60000,1', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000018',
    E'employees:\nid,name,department,salary,hire_date\n1,A,Dev,50000,2020-01-01\n2,B,Dev,50000,2020-02-01\n3,C,Dev,50000,2020-03-01',
    E'Dev,A,50000,1\nDev,B,50000,1\nDev,C,50000,1', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000018',
    E'employees:\nid,name,department,salary,hire_date\n1,X,A,100,2020-01-01\n2,Y,A,200,2020-01-01\n3,Z,B,300,2020-01-01',
    E'A,Y,200,1\nA,X,100,2\nB,Z,300,1', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000018',
    E'employees:\nid,name,department,salary,hire_date\n1,A,X,10,2020-01-01\n2,B,X,20,2020-01-01\n3,C,X,30,2020-01-01\n4,D,X,40,2020-01-01',
    E'X,D,40,1\nX,C,30,2\nX,B,20,3\nX,A,10,4', FALSE, 5);

-- ============================================
-- Problem #25: 최대 연속 로그인 일수 (c0000001-...-000000000019)
-- ============================================
INSERT INTO coding_test_cases (id, problem_id, input, expected_output, is_sample, sort_order) VALUES
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000019',
    E'login_history:\nid,user_id,login_date\n1,1,2024-01-01\n2,1,2024-01-02\n3,1,2024-01-03\n4,1,2024-01-05\n5,2,2024-01-01\n6,2,2024-01-02',
    E'1,3\n2,2', TRUE, 1),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000019',
    E'login_history:\nid,user_id,login_date\n1,1,2024-01-01',
    E'1,1', TRUE, 2),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000019',
    E'login_history:\nid,user_id,login_date\n1,1,2024-01-01\n2,1,2024-01-03\n3,1,2024-01-05',
    E'1,1', FALSE, 3),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000019',
    E'login_history:\nid,user_id,login_date\n1,1,2024-01-01\n2,1,2024-01-02\n3,1,2024-01-03\n4,1,2024-01-04\n5,1,2024-01-05\n6,2,2024-01-10\n7,2,2024-01-11',
    E'1,5\n2,2', FALSE, 4),
  (uuid_generate_v4(), 'c0000001-0000-4000-a000-000000000019',
    E'login_history:\nid,user_id,login_date\n1,3,2024-03-01\n2,3,2024-03-02\n3,3,2024-03-03\n4,3,2024-03-04\n5,1,2024-01-01\n6,1,2024-01-02\n7,1,2024-01-03\n8,2,2024-02-01',
    E'3,4\n1,3\n2,1', FALSE, 5);
