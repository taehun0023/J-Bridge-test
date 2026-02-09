-- updated_at 트리거 for new tables
CREATE TRIGGER set_updated_at BEFORE UPDATE ON coding_skill_exams
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON admin_feedbacks
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
