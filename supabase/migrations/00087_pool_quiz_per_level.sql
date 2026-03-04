-- 00087: Split 4 pool quizzes into 20 level-specific pool quizzes (4 categories × 5 levels)
-- Before: 1 pool quiz per category (all N5-N1 mixed)
-- After:  1 pool quiz per category per level (N5 語彙テスト, N4 語彙テスト, ...)

-- Step 1: Delete existing 4 pool quizzes
DELETE FROM quizzes WHERE id IN (
  'e0000001-0000-0000-0000-000000000001',
  'e0000001-0000-0000-0000-000000000002',
  'e0000001-0000-0000-0000-000000000003',
  'e0000001-0000-0000-0000-000000000004'
);

-- Step 2: Create 20 level-specific pool quizzes
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  -- 語彙 (15分)
  ('e0000001-0000-0000-0000-000000000011', 'N5 語彙テスト', 'jlpt_vocab', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000012', 'N4 語彙テスト', 'jlpt_vocab', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000013', 'N3 語彙テスト', 'jlpt_vocab', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000014', 'N2 語彙テスト', 'jlpt_vocab', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000015', 'N1 語彙テスト', 'jlpt_vocab', 70, 15, false, true, 20),
  -- 文法 (15分)
  ('e0000001-0000-0000-0000-000000000021', 'N5 文法テスト', 'jlpt_grammar', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000022', 'N4 文法テスト', 'jlpt_grammar', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000023', 'N3 文法テスト', 'jlpt_grammar', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000024', 'N2 文法テスト', 'jlpt_grammar', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000025', 'N1 文法テスト', 'jlpt_grammar', 70, 15, false, true, 20),
  -- 読解 (20分)
  ('e0000001-0000-0000-0000-000000000031', 'N5 読解テスト', 'jlpt_reading', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000032', 'N4 読解テスト', 'jlpt_reading', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000033', 'N3 読解テスト', 'jlpt_reading', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000034', 'N2 読解テスト', 'jlpt_reading', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000035', 'N1 読解テスト', 'jlpt_reading', 70, 20, false, true, 20),
  -- 聴解 (20分)
  ('e0000001-0000-0000-0000-000000000041', 'N5 聴解テスト', 'jlpt_listening', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000042', 'N4 聴解テスト', 'jlpt_listening', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000043', 'N3 聴解テスト', 'jlpt_listening', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000044', 'N2 聴解テスト', 'jlpt_listening', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000045', 'N1 聴解テスト', 'jlpt_listening', 70, 20, false, true, 20)
ON CONFLICT (id) DO NOTHING;
