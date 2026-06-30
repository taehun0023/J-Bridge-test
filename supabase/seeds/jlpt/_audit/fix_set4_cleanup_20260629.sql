-- Set 4 더미 데이터 정리 + 생성된 문제 삽입
-- set_id = 'aa000001-0000-0000-0000-000000000014' (기존 행 재활용)

-- 1. 기존 Set 4 junction 삭제 (+ 연결된 options/questions도 정리)
DO $$
DECLARE
  q UUID;
BEGIN
  FOR q IN
    SELECT DISTINCT msq.question_id FROM jlpt_mock_set_questions msq
    WHERE msq.set_id = 'aa000001-0000-0000-0000-000000000014'
  LOOP
    DELETE FROM quiz_question_options WHERE question_id = q;
    DELETE FROM quiz_questions WHERE id = q;
  END LOOP;
  DELETE FROM jlpt_mock_set_questions WHERE set_id = 'aa000001-0000-0000-0000-000000000014';
  RAISE NOTICE 'Set 4 기존 데이터 삭제 완료';
END$$;
