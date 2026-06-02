-- =====================================================================
-- 00178 JLPT 항목 수 기반 과제 (생활일본어 영역별 누적 사다리)
-- =====================================================================
-- 멘토가 (레벨 × 영역)별로 "항목 N개"를 부여 → 누적 사다리로 쌓임.
-- 완료 = 해당 레벨·영역의 user_mastered_items 수 >= cumulative_target (완료 후 동결).
-- 지연 = 7일간 진전 없음(앱 레벨에서 알림).
--
-- 기존 퀴즈형 과제는 target_count IS NULL 로 구분되어 그대로 공존한다.
-- ※ quiz_questions / quiz_question_options / quiz_answers 등 문제·정답 테이블은 일절 건드리지 않음.
-- 하위호환: 컬럼 추가만 (nullable / default), 롤백은 컬럼 DROP.

ALTER TABLE learning_assignments
  ADD COLUMN IF NOT EXISTS target_count           INT,         -- 이번 부여 개수 (표시용)
  ADD COLUMN IF NOT EXISTS cumulative_target      INT,         -- 완료 임계값 (누적, 생성 시 고정)
  ADD COLUMN IF NOT EXISTS mastered_snapshot      INT NOT NULL DEFAULT 0,  -- 직전 검사 시 마스터 수
  ADD COLUMN IF NOT EXISTS last_progress_at       TIMESTAMPTZ, -- 마스터 수가 마지막으로 증가한 시각
  ADD COLUMN IF NOT EXISTS last_stall_notified_at TIMESTAMPTZ; -- 마지막 스톨(지연) 알림 시각

-- 누적/현황 조회용 부분 인덱스 (count형 과제만)
CREATE INDEX IF NOT EXISTS idx_la_jlpt_count
  ON learning_assignments(assigned_to, content_level, subcategory)
  WHERE target_count IS NOT NULL;
