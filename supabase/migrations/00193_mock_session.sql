-- JLPT 모의시험 2교시(1교시 言語知識・読解 / 2교시 聴解) 분리 응시용.
-- mock_session: 1 또는 2 (NULL이면 단일 세션 호환).
ALTER TABLE comprehensive_exams ADD COLUMN IF NOT EXISTS mock_session SMALLINT;
COMMENT ON COLUMN comprehensive_exams.mock_session IS 'JLPT 모의시험 교시(1=言語知識・読解, 2=聴解). NULL=단일세션.';

NOTIFY pgrst, 'reload schema';
