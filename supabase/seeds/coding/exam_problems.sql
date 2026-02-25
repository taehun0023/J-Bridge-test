-- ============================================
-- J-Bridge Seed: Coding Exam ↔ Problem Mapping
-- 기존 seed.sql에서 생성된 5개 시험(D/C/B/A/S)에 문제 배정
--
-- 배점 분배:
--   D등급: easy 3문제 (20+40+40 = 100)
--   C등급: easy 2 + medium 2 (20+20+30+30 = 100)
--   B등급: medium 3 + hard 1 (25+25+25+25 = 100)
--   A등급: medium 2 + hard 2 (25+25+25+25 = 100)
--   S등급: medium 1 + hard 3 (10+30+30+30 = 100)
-- ============================================

-- ============================================
-- D등급 시험: easy 3문제
-- #01 문자열 뒤집기 (20점)
-- #02 배열에서 최대값 찾기 (40점)
-- #03 짝수 홀수 판별 (40점)
-- ============================================
INSERT INTO coding_exam_problems (exam_id, problem_id, sort_order, points)
SELECT e.id, 'c0000001-0000-4000-a000-000000000001'::uuid, 1, 20
FROM coding_skill_exams e WHERE e.target_rank = 'D'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000002'::uuid, 2, 40
FROM coding_skill_exams e WHERE e.target_rank = 'D'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000003'::uuid, 3, 40
FROM coding_skill_exams e WHERE e.target_rank = 'D';

-- ============================================
-- C등급 시험: easy 2 + medium 2
-- #04 구구단 출력 (20점)
-- #05 배열 원소의 합 (20점)
-- #11 버블 정렬 구현 (30점)
-- #12 이진 탐색 (30점)
-- ============================================
INSERT INTO coding_exam_problems (exam_id, problem_id, sort_order, points)
SELECT e.id, 'c0000001-0000-4000-a000-000000000004'::uuid, 1, 20
FROM coding_skill_exams e WHERE e.target_rank = 'C'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000005'::uuid, 2, 20
FROM coding_skill_exams e WHERE e.target_rank = 'C'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-00000000000b'::uuid, 3, 30
FROM coding_skill_exams e WHERE e.target_rank = 'C'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-00000000000c'::uuid, 4, 30
FROM coding_skill_exams e WHERE e.target_rank = 'C';

-- ============================================
-- B등급 시험: medium 3 + hard 1
-- #13 괄호 유효성 검사 (25점)
-- #14 단어 빈도수 계산 (25점)
-- #15 요세푸스 문제 (25점)
-- #21 최장 증가 부분 수열 LIS (25점)
-- ============================================
INSERT INTO coding_exam_problems (exam_id, problem_id, sort_order, points)
SELECT e.id, 'c0000001-0000-4000-a000-00000000000d'::uuid, 1, 25
FROM coding_skill_exams e WHERE e.target_rank = 'B'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-00000000000e'::uuid, 2, 25
FROM coding_skill_exams e WHERE e.target_rank = 'B'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-00000000000f'::uuid, 3, 25
FROM coding_skill_exams e WHERE e.target_rank = 'B'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000015'::uuid, 4, 25
FROM coding_skill_exams e WHERE e.target_rank = 'B';

-- ============================================
-- A등급 시험: medium 2 + hard 2
-- #16 문자열 압축 (25점)
-- #18 Two Sum (25점)
-- #22 연결 요소의 개수 (25점)
-- #23 배낭 문제 0/1 Knapsack (25점)
-- ============================================
INSERT INTO coding_exam_problems (exam_id, problem_id, sort_order, points)
SELECT e.id, 'c0000001-0000-4000-a000-000000000010'::uuid, 1, 25
FROM coding_skill_exams e WHERE e.target_rank = 'A'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000012'::uuid, 2, 25
FROM coding_skill_exams e WHERE e.target_rank = 'A'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000016'::uuid, 3, 25
FROM coding_skill_exams e WHERE e.target_rank = 'A'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000017'::uuid, 4, 25
FROM coding_skill_exams e WHERE e.target_rank = 'A';

-- ============================================
-- S등급 시험: medium 1 + hard 3
-- #17 N×N 행렬 90도 회전 (10점)
-- #24 부서별 급여 순위 (30점)
-- #25 최대 연속 로그인 일수 (30점)
-- #23 배낭 문제 — 이미 A등급에 사용되므로 #22 대신 #21 LIS 재활용
--     대안: hard SQL 문제 2개 (#24, #25) + hard Java #22 연결 요소
-- 최종: #17 행렬회전(10) + #22 연결요소(30) + #24 급여순위(30) + #25 연속로그인(30)
-- ============================================
INSERT INTO coding_exam_problems (exam_id, problem_id, sort_order, points)
SELECT e.id, 'c0000001-0000-4000-a000-000000000011'::uuid, 1, 10
FROM coding_skill_exams e WHERE e.target_rank = 'S'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000016'::uuid, 2, 30
FROM coding_skill_exams e WHERE e.target_rank = 'S'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000018'::uuid, 3, 30
FROM coding_skill_exams e WHERE e.target_rank = 'S'
UNION ALL
SELECT e.id, 'c0000001-0000-4000-a000-000000000019'::uuid, 4, 30
FROM coding_skill_exams e WHERE e.target_rank = 'S';
