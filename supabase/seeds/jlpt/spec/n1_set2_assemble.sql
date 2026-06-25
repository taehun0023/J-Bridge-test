-- encoding: UTF-8
-- N1 set2 어셈블 — 기존 placeholder 정리 후 100문항 연결
-- set2 전용 문항만 삭제 (set1/set3 공유 문항은 건드리지 않음)

-- ============================================================
-- 1. set2 기존 placeholder 링크 및 set2 전용 문항 정리
--    (set1/set3에는 연결되지 않은 set2 전용 문항만 삭제)
-- ============================================================

-- set2 링크 전부 제거
DELETE FROM jlpt_mock_set_questions WHERE set_id = 'aa000001-0000-0000-0000-000000000012';

-- set2 전용 컨테이너(quiz_id)에 속하는 기존 옵션·문항 정리
DELETE FROM quiz_question_options
WHERE question_id IN (
    SELECT id FROM quiz_questions
    WHERE quiz_id IN (
        'ad000001-0000-0000-0000-000000000121',
        'ad000001-0000-0000-0000-000000000122',
        'ad000001-0000-0000-0000-000000000123'
    )
);

DELETE FROM quiz_questions
WHERE quiz_id IN (
    'ad000001-0000-0000-0000-000000000121',
    'ad000001-0000-0000-0000-000000000122',
    'ad000001-0000-0000-0000-000000000123'
);

-- ============================================================
-- 2. set2 jlpt_mock_set_questions 연결
--    (n1_set2_gengo/dokkai/choukai 적재 후 실행)
-- ============================================================
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000012', qq.id,
  CASE qq.quiz_id
    WHEN 'ad000001-0000-0000-0000-000000000121' THEN 'gengo_chishiki'
    WHEN 'ad000001-0000-0000-0000-000000000122' THEN 'dokkai'
    WHEN 'ad000001-0000-0000-0000-000000000123' THEN 'choukai'
  END,
  qq.sort_order
FROM quiz_questions qq
WHERE qq.quiz_id IN (
  'ad000001-0000-0000-0000-000000000121',
  'ad000001-0000-0000-0000-000000000122',
  'ad000001-0000-0000-0000-000000000123'
);
