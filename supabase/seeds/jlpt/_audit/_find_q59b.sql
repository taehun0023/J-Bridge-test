-- 전체 N1 mock set 목록
SELECT ms.set_no, ms.id, ms.level, ms.title FROM jlpt_mock_sets ms WHERE ms.level = 'N1' ORDER BY ms.set_no;

-- 전체 quiz_questions에서 人間の知性 검색 (테이블 전체)
SELECT id, LEFT(question_text,200) as qt FROM quiz_questions WHERE question_text LIKE '%人間の知性%' LIMIT 5;

-- comprehensive_exams / 진행중인 시험 확인
-- ExamClient는 comprehensive_exam_id 기반이므로, 현재 진행중 시험 확인
SELECT ce.id, ce.category, ce.subcategory, ce.mock_set_no, ce.status
FROM comprehensive_exams ce
WHERE ce.category = 'jlpt-mock' AND ce.status IN ('in_progress','assigned')
ORDER BY ce.requested_at DESC LIMIT 10;
