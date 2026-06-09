-- 00181 월별 자동 항목과제 부여 "갯수" 설정 (관리자 편집)
-- runMonthlyAutoAssignment 의 영역별 부여 개수(語彙/文法/読解/聴解/漢字)를 코드 하드코딩 대신 DB에서 읽음.
-- 단일 행(id=true) 패턴.

CREATE TABLE IF NOT EXISTS monthly_assignment_config (
  id boolean PRIMARY KEY DEFAULT true,
  vocabulary integer NOT NULL DEFAULT 100,
  grammar   integer NOT NULL DEFAULT 10,
  reading   integer NOT NULL DEFAULT 10,
  listening integer NOT NULL DEFAULT 10,
  kanji     integer NOT NULL DEFAULT 170,
  updated_at timestamptz NOT NULL DEFAULT now(),
  updated_by uuid REFERENCES profiles(id) ON DELETE SET NULL,
  CONSTRAINT monthly_assignment_config_single CHECK (id)
);

INSERT INTO monthly_assignment_config (id) VALUES (true) ON CONFLICT (id) DO NOTHING;

ALTER TABLE monthly_assignment_config ENABLE ROW LEVEL SECURITY;

-- 관리자만 조회/수정 (서버 액션은 service_role로 우회)
DROP POLICY IF EXISTS monthly_config_admin_all ON monthly_assignment_config;
CREATE POLICY monthly_config_admin_all ON monthly_assignment_config
  FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles p WHERE p.id = auth.uid() AND p.role = 'admin'))
  WITH CHECK (EXISTS (SELECT 1 FROM profiles p WHERE p.id = auth.uid() AND p.role = 'admin'));

COMMENT ON TABLE monthly_assignment_config IS '월별 자동 항목과제 부여 개수 설정(단일 행). runMonthlyAutoAssignment 가 참조.';
