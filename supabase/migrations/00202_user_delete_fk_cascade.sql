-- 유저(계정) 삭제가 FK 제약(NO ACTION)으로 막히는 문제 수정.
-- profiles(id)를 참조하는 5개 FK가 NO ACTION이라, 해당 유저가 이 컬럼들에 참조돼 있으면
-- auth.users 삭제(→ profiles cascade 삭제) 시점에 제약 위반으로 삭제 실패.
--  - NOT NULL 컬럼(actor_id, submitted_by) → CASCADE (참조 레코드도 함께 삭제)
--  - nullable 컬럼(approved_by, confirmed_by, reviewed_by) → SET NULL (레코드 보존, 담당자만 비움)

ALTER TABLE audit_log
  DROP CONSTRAINT audit_log_actor_id_fkey,
  ADD CONSTRAINT audit_log_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES profiles(id) ON DELETE CASCADE;

ALTER TABLE shared_vocab_submissions
  DROP CONSTRAINT shared_vocab_submissions_submitted_by_fkey,
  ADD CONSTRAINT shared_vocab_submissions_submitted_by_fkey FOREIGN KEY (submitted_by) REFERENCES profiles(id) ON DELETE CASCADE;

ALTER TABLE comprehensive_exams
  DROP CONSTRAINT comprehensive_exams_approved_by_fkey,
  ADD CONSTRAINT comprehensive_exams_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES profiles(id) ON DELETE SET NULL;

ALTER TABLE learning_assignments
  DROP CONSTRAINT learning_assignments_confirmed_by_fkey,
  ADD CONSTRAINT learning_assignments_confirmed_by_fkey FOREIGN KEY (confirmed_by) REFERENCES profiles(id) ON DELETE SET NULL;

ALTER TABLE shared_vocab_submissions
  DROP CONSTRAINT shared_vocab_submissions_reviewed_by_fkey,
  ADD CONSTRAINT shared_vocab_submissions_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES profiles(id) ON DELETE SET NULL;
