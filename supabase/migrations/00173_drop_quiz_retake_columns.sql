-- 00173_drop_quiz_retake_columns.sql
-- 재시험 승인 플로 제거에 따른 quiz_attempts 컬럼 drop
--
-- ⚠ 운영 적용 전 사용자 명시 승인 필요.
--   페이즈 1 코드 배포 후 안정성 확인 (최소 1주) 후 적용.
--
-- 영향: quiz_attempts 테이블의 retake 관련 3컬럼 삭제
-- 운영 데이터: retake_request_status != null 인 행 4건 (2026-05-25 시점)
-- 롤백: 이 마이그레이션 적용 후 되돌리려면 컬럼 재생성 필요 (데이터 복구 불가)

BEGIN;

ALTER TABLE quiz_attempts
  DROP COLUMN IF EXISTS retake_request_status;

ALTER TABLE quiz_attempts
  DROP COLUMN IF EXISTS retake_requested_at;

ALTER TABLE quiz_attempts
  DROP COLUMN IF EXISTS retake_approved_at;

COMMIT;
