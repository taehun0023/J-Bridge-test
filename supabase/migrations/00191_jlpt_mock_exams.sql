-- ============================================================
-- JLPT 모의시험(Bunpro식 레벨별 실전 모의시험) 스키마
-- - comprehensive_exams 재사용(category='jlpt-mock', subcategory='mock')
-- - 섹션별 점수/채점 지원 + 모의시험 정의 테이블 2개
-- 전부 가산적(non-destructive). category에는 CHECK 제약 없음(추가 불필요).
-- ============================================================

-- 1) comprehensive_exams: 섹션 점수 + 세트 번호
ALTER TABLE comprehensive_exams
  ADD COLUMN IF NOT EXISTS section_scores JSONB,   -- {"gengo_chishiki":{score,correct,total,passed}, ...}
  ADD COLUMN IF NOT EXISTS mock_set_no SMALLINT;   -- 1..3 (어느 세트인지; jlpt-mock 전용)

-- 2) 답안/출제문항에 섹션 태그
ALTER TABLE comprehensive_exam_answers   ADD COLUMN IF NOT EXISTS section TEXT;
ALTER TABLE comprehensive_exam_questions ADD COLUMN IF NOT EXISTS section TEXT;

-- 3) 모의시험 정의(세트) — 레벨×세트번호로 15행
CREATE TABLE IF NOT EXISTS jlpt_mock_sets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level TEXT NOT NULL CHECK (level IN ('N1','N2','N3','N4','N5')),
  set_no SMALLINT NOT NULL,
  title TEXT NOT NULL,
  time_limit_minutes INT NOT NULL DEFAULT 40,
  -- [{section, label, quiz_types[], question_count, pass_pct}]
  section_config JSONB NOT NULL DEFAULT '[]'::jsonb,
  is_published BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (level, set_no)
);

-- 4) 세트↔문항 (고정 출제). 문항 본문은 기존 quiz_questions 재사용.
CREATE TABLE IF NOT EXISTS jlpt_mock_set_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  set_id UUID NOT NULL REFERENCES jlpt_mock_sets(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  section TEXT NOT NULL,            -- 'gengo_chishiki' | 'dokkai' | 'choukai' | 'gengo_dokkai'
  sort_order INT NOT NULL DEFAULT 0,
  UNIQUE (set_id, question_id)
);

CREATE INDEX IF NOT EXISTS idx_jlpt_mock_set_questions_set
  ON jlpt_mock_set_questions(set_id, section, sort_order);

-- 5) RLS — 정의 테이블: 인증 사용자 읽기, 관리자 쓰기
ALTER TABLE jlpt_mock_sets ENABLE ROW LEVEL SECURITY;
ALTER TABLE jlpt_mock_set_questions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "read_authenticated" ON jlpt_mock_sets
  FOR SELECT USING (auth.uid() IS NOT NULL);
CREATE POLICY "admin_write" ON jlpt_mock_sets
  FOR ALL USING (is_admin()) WITH CHECK (is_admin());

CREATE POLICY "read_authenticated" ON jlpt_mock_set_questions
  FOR SELECT USING (auth.uid() IS NOT NULL);
CREATE POLICY "admin_write" ON jlpt_mock_set_questions
  FOR ALL USING (is_admin()) WITH CHECK (is_admin());

NOTIFY pgrst, 'reload schema';
