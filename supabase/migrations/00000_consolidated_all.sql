-- ============================================
-- Consolidated Migration File
-- This file contains all migrations (00001-00059) consolidated in order
-- Created: 2026-02-19
--
-- Usage:
--   - For new database setups: Use this file instead of running individual migrations
--   - For existing databases: Continue using individual migration files
--   - This file is for reference and new environment initialization only
-- ============================================

-- ============================================
-- 00001_extensions.sql
-- ============================================
-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- 00002_profiles.sql
-- ============================================
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  role TEXT NOT NULL DEFAULT 'mentee' CHECK (role IN ('mentee', 'mentor', 'admin')),
  jlpt_level TEXT CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1', NULL)),
  years_of_experience INTEGER DEFAULT 0,
  target_dispatch_date DATE,
  bio TEXT,

  -- 온보딩 필드
  target_jlpt_level TEXT CHECK (target_jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1', NULL)),
  target_coding_area TEXT CHECK (target_coding_area IN ('java', 'javascript', 'sql', NULL)),
  coding_rank TEXT DEFAULT 'D' CHECK (coding_rank IN ('S', 'A', 'B', 'C', 'D')),
  is_onboarded BOOLEAN NOT NULL DEFAULT FALSE,

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================
-- 00003_skill_tables.sql
-- ============================================
-- 축1 & 축2: JLPT + IT/비즈니스 일본어
CREATE TABLE japanese_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
  jlpt_level TEXT CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1', NULL)),
  vocab_mastery SMALLINT DEFAULT 0 CHECK (vocab_mastery BETWEEN 0 AND 100),
  grammar_mastery SMALLINT DEFAULT 0 CHECK (grammar_mastery BETWEEN 0 AND 100),
  reading_mastery SMALLINT DEFAULT 0 CHECK (reading_mastery BETWEEN 0 AND 100),
  listening_mastery SMALLINT DEFAULT 0 CHECK (listening_mastery BETWEEN 0 AND 100),
  jlpt_normalized SMALLINT DEFAULT 0 CHECK (jlpt_normalized BETWEEN 0 AND 100),
  it_terminology_score SMALLINT DEFAULT 0 CHECK (it_terminology_score BETWEEN 0 AND 100),
  doc_reading_score SMALLINT DEFAULT 0 CHECK (doc_reading_score BETWEEN 0 AND 100),
  business_conv_score SMALLINT DEFAULT 0 CHECK (business_conv_score BETWEEN 0 AND 100),
  it_japanese_normalized SMALLINT DEFAULT 0 CHECK (it_japanese_normalized BETWEEN 0 AND 100),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 축3 & 축4: Core Programming + Framework/Practical
CREATE TABLE coding_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
  java_score SMALLINT DEFAULT 0 CHECK (java_score BETWEEN 0 AND 100),
  javascript_score SMALLINT DEFAULT 0 CHECK (javascript_score BETWEEN 0 AND 100),
  sql_score SMALLINT DEFAULT 0 CHECK (sql_score BETWEEN 0 AND 100),
  algorithm_score SMALLINT DEFAULT 0 CHECK (algorithm_score BETWEEN 0 AND 100),
  core_normalized SMALLINT DEFAULT 0 CHECK (core_normalized BETWEEN 0 AND 100),
  spring_boot_score SMALLINT DEFAULT 0 CHECK (spring_boot_score BETWEEN 0 AND 100),
  react_score SMALLINT DEFAULT 0 CHECK (react_score BETWEEN 0 AND 100),
  db_design_score SMALLINT DEFAULT 0 CHECK (db_design_score BETWEEN 0 AND 100),
  project_score SMALLINT DEFAULT 0 CHECK (project_score BETWEEN 0 AND 100),
  framework_normalized SMALLINT DEFAULT 0 CHECK (framework_normalized BETWEEN 0 AND 100),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 축5: Attitude/Culture
CREATE TABLE attitude_culture_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
  punctuality_score SMALLINT DEFAULT 0 CHECK (punctuality_score BETWEEN 0 AND 100),
  horenso_score SMALLINT DEFAULT 0 CHECK (horenso_score BETWEEN 0 AND 100),
  teamwork_score SMALLINT DEFAULT 0 CHECK (teamwork_score BETWEEN 0 AND 100),
  business_manner_score SMALLINT DEFAULT 0 CHECK (business_manner_score BETWEEN 0 AND 100),
  attitude_normalized SMALLINT DEFAULT 0 CHECK (attitude_normalized BETWEEN 0 AND 100),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================
-- 00004_dispatch_readiness.sql
-- ============================================
CREATE TABLE dispatch_readiness_scores (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  jlpt_score SMALLINT NOT NULL CHECK (jlpt_score BETWEEN 0 AND 100),
  it_japanese_score SMALLINT NOT NULL CHECK (it_japanese_score BETWEEN 0 AND 100),
  core_programming_score SMALLINT NOT NULL CHECK (core_programming_score BETWEEN 0 AND 100),
  framework_score SMALLINT NOT NULL CHECK (framework_score BETWEEN 0 AND 100),
  attitude_culture_score SMALLINT NOT NULL CHECK (attitude_culture_score BETWEEN 0 AND 100),
  overall_score SMALLINT GENERATED ALWAYS AS (
    (jlpt_score + it_japanese_score + core_programming_score + framework_score + attitude_culture_score) / 5
  ) STORED,
  recorded_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_dispatch_readiness_user_date ON dispatch_readiness_scores(user_id, recorded_at DESC);

-- ============================================
-- 00005_content_tables.sql
-- ============================================
CREATE TABLE courses (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  description TEXT,
  category TEXT NOT NULL CHECK (category IN (
    'jlpt_prep', 'it_japanese', 'core_programming',
    'framework', 'algorithm', 'project', 'attitude_culture'
  )),
  thumbnail_url TEXT,
  instructor_id UUID REFERENCES profiles(id) ON DELETE SET NULL,
  difficulty TEXT NOT NULL DEFAULT 'beginner' CHECK (difficulty IN ('beginner', 'intermediate', 'advanced')),
  is_published BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE lessons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  content_type TEXT NOT NULL CHECK (content_type IN (
    'video', 'text', 'quiz', 'coding_exercise', 'role_play'
  )),
  content_url TEXT,
  content_body TEXT,
  duration_minutes INTEGER,
  sort_order INTEGER NOT NULL DEFAULT 0,
  is_free_preview BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_lessons_course ON lessons(course_id, sort_order);

CREATE TABLE lesson_resources (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lesson_id UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  resource_type TEXT NOT NULL CHECK (resource_type IN ('pdf', 'audio', 'image', 'link', 'other')),
  resource_url TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================
-- 00006_coding_tables.sql
-- ============================================
CREATE TABLE coding_problems (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
  language TEXT NOT NULL DEFAULT 'java' CHECK (language IN ('java', 'javascript', 'sql')),
  starter_code TEXT,
  solution_code TEXT,
  time_limit_ms INTEGER DEFAULT 2000,
  memory_limit_mb INTEGER DEFAULT 256,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE coding_test_cases (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  problem_id UUID NOT NULL REFERENCES coding_problems(id) ON DELETE CASCADE,
  input TEXT NOT NULL,
  expected_output TEXT NOT NULL,
  is_sample BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0
);

CREATE TABLE projects (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  starter_repo_url TEXT,
  language TEXT NOT NULL DEFAULT 'java' CHECK (language IN ('java', 'javascript')),
  difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE project_requirements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  test_class_name TEXT,
  test_method_name TEXT,
  sort_order INTEGER DEFAULT 0
);

-- ============================================
-- 00007_quiz_tables.sql
-- ============================================
CREATE TABLE quizzes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  quiz_type TEXT NOT NULL CHECK (quiz_type IN (
    'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening',
    'it_terminology', 'role_play_scenario', 'attitude_culture'
  )),
  passing_score SMALLINT DEFAULT 70 CHECK (passing_score BETWEEN 0 AND 100),
  time_limit_minutes INTEGER,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE quiz_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
  question_type TEXT NOT NULL CHECK (question_type IN (
    'multiple_choice', 'fill_in_blank', 'audio_listening', 'ordering'
  )),
  question_text TEXT NOT NULL,
  audio_url TEXT,
  image_url TEXT,
  explanation TEXT,
  points SMALLINT NOT NULL DEFAULT 1,
  sort_order INTEGER DEFAULT 0
);

CREATE TABLE quiz_question_options (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  option_text TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0
);

-- ============================================
-- 00008_attempt_tables.sql
-- ============================================
CREATE TABLE quiz_attempts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
  score SMALLINT,
  passed BOOLEAN,
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE INDEX idx_quiz_attempts_user ON quiz_attempts(user_id, quiz_id);

CREATE TABLE quiz_answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  attempt_id UUID NOT NULL REFERENCES quiz_attempts(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  selected_option_id UUID REFERENCES quiz_question_options(id) ON DELETE SET NULL,
  text_answer TEXT,
  is_correct BOOLEAN,
  answered_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================
-- 00009_submission_tables.sql
-- ============================================
CREATE TABLE code_submissions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  problem_id UUID REFERENCES coding_problems(id) ON DELETE SET NULL,
  project_id UUID REFERENCES projects(id) ON DELETE SET NULL,
  language TEXT NOT NULL,
  source_code TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN (
    'pending', 'running', 'accepted', 'wrong_answer',
    'time_limit', 'memory_limit', 'runtime_error', 'compile_error'
  )),
  execution_time_ms INTEGER,
  memory_used_mb INTEGER,
  passed_test_cases INTEGER DEFAULT 0,
  total_test_cases INTEGER DEFAULT 0,
  submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CHECK (problem_id IS NOT NULL OR project_id IS NOT NULL)
);

CREATE INDEX idx_code_submissions_user ON code_submissions(user_id, submitted_at DESC);

CREATE TABLE code_reviews (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  submission_id UUID NOT NULL REFERENCES code_submissions(id) ON DELETE CASCADE,
  review_type TEXT NOT NULL CHECK (review_type IN (
    'style', 'logic', 'performance', 'japan_convention'
  )),
  feedback TEXT NOT NULL,
  severity TEXT NOT NULL DEFAULT 'info' CHECK (severity IN ('info', 'warning', 'error')),
  line_number INTEGER,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================
-- 00010_japanese_content.sql
-- ============================================
CREATE TABLE jlpt_vocabulary (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  word TEXT NOT NULL,
  reading TEXT NOT NULL,
  meaning_ko TEXT NOT NULL,
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  part_of_speech TEXT,
  example_sentence TEXT,
  example_sentence_ko TEXT,
  audio_url TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_vocabulary_level ON jlpt_vocabulary(jlpt_level);

CREATE TABLE it_glossary (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  term_ja TEXT NOT NULL,
  reading TEXT,
  term_ko TEXT NOT NULL,
  term_en TEXT,
  category TEXT NOT NULL CHECK (category IN (
    'development', 'testing', 'design_doc', 'infrastructure',
    'project_management', 'business'
  )),
  description TEXT,
  example_sentence TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_it_glossary_category ON it_glossary(category);

-- ============================================
-- 00011_enrollments.sql
-- ============================================
CREATE TABLE enrollments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  enrolled_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ,
  progress_pct SMALLINT NOT NULL DEFAULT 0 CHECK (progress_pct BETWEEN 0 AND 100),
  UNIQUE(user_id, course_id)
);

CREATE TABLE lesson_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  enrollment_id UUID NOT NULL REFERENCES enrollments(id) ON DELETE CASCADE,
  lesson_id UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
  status TEXT NOT NULL DEFAULT 'not_started' CHECK (status IN ('not_started', 'in_progress', 'completed')),
  progress_pct SMALLINT NOT NULL DEFAULT 0 CHECK (progress_pct BETWEEN 0 AND 100),
  last_position_sec INTEGER DEFAULT 0,
  started_at TIMESTAMPTZ,
  completed_at TIMESTAMPTZ,
  UNIQUE(enrollment_id, lesson_id)
);

-- ============================================
-- 00012_triggers.sql
-- ============================================
-- 신규 유저 가입 시 profiles + skill 테이블 자동 생성
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(NEW.email, 'user_' || LEFT(NEW.id::text, 8) || '@unknown.com'),
    COALESCE(
      NEW.raw_user_meta_data->>'full_name',
      NEW.raw_user_meta_data->>'name',
      'User_' || floor(random() * 90000 + 10000)::text
    ),
    COALESCE(NEW.raw_user_meta_data->>'avatar_url', '')
  );

  INSERT INTO japanese_skills (user_id) VALUES (NEW.id);
  INSERT INTO coding_skills (user_id) VALUES (NEW.id);
  INSERT INTO attitude_culture_skills (user_id) VALUES (NEW.id);

  RETURN NEW;
EXCEPTION WHEN others THEN
  RAISE LOG 'handle_new_user failed for %: %', NEW.id, SQLERRM;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- updated_at 자동 갱신
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_updated_at BEFORE UPDATE ON profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON japanese_skills
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON coding_skills
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON attitude_culture_skills
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON courses
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON lessons
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ============================================
-- 00013_rls_policies.sql
-- ============================================
-- ============================================
-- RLS 활성화 (모든 테이블)
-- ============================================
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE japanese_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE attitude_culture_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE dispatch_readiness_scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrollments ENABLE ROW LEVEL SECURITY;
ALTER TABLE lesson_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE lesson_resources ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_test_cases ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE project_requirements ENABLE ROW LEVEL SECURITY;
ALTER TABLE quizzes ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_question_options ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE code_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE code_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE jlpt_vocabulary ENABLE ROW LEVEL SECURITY;
ALTER TABLE it_glossary ENABLE ROW LEVEL SECURITY;

-- ============================================
-- profiles: 본인만 읽기/수정
-- ============================================
CREATE POLICY "Users can view own profile"
  ON profiles FOR SELECT USING ((SELECT auth.uid()) = id);
CREATE POLICY "Users can update own profile"
  ON profiles FOR UPDATE USING ((SELECT auth.uid()) = id);

-- ============================================
-- 스킬 테이블: 본인만 읽기
-- ============================================
CREATE POLICY "Users can view own japanese_skills"
  ON japanese_skills FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own coding_skills"
  ON coding_skills FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own attitude_culture_skills"
  ON attitude_culture_skills FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR SELECT USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- enrollments & lesson_progress: 본인만
-- ============================================
CREATE POLICY "Users can view own enrollments"
  ON enrollments FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can insert own enrollments"
  ON enrollments FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own lesson_progress"
  ON lesson_progress FOR SELECT USING (
    enrollment_id IN (SELECT id FROM enrollments WHERE user_id = (SELECT auth.uid()))
  );
CREATE POLICY "Users can update own lesson_progress"
  ON lesson_progress FOR UPDATE USING (
    enrollment_id IN (SELECT id FROM enrollments WHERE user_id = (SELECT auth.uid()))
  );

-- ============================================
-- 콘텐츠: 인증된 사용자 읽기 가능
-- ============================================
CREATE POLICY "Authenticated users can view courses"
  ON courses FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view lessons"
  ON lessons FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view lesson_resources"
  ON lesson_resources FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view coding_problems"
  ON coding_problems FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view sample test_cases"
  ON coding_test_cases FOR SELECT USING (is_sample = TRUE);
CREATE POLICY "Authenticated users can view projects"
  ON projects FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view project_requirements"
  ON project_requirements FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view quizzes"
  ON quizzes FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view quiz_questions"
  ON quiz_questions FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view quiz_options"
  ON quiz_question_options FOR SELECT USING (auth.role() = 'authenticated');

-- ============================================
-- 퀴즈/코딩 제출: 본인만
-- ============================================
CREATE POLICY "Users can view own quiz_attempts"
  ON quiz_attempts FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can insert own quiz_attempts"
  ON quiz_attempts FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own quiz_answers"
  ON quiz_answers FOR SELECT USING (
    attempt_id IN (SELECT id FROM quiz_attempts WHERE user_id = (SELECT auth.uid()))
  );
CREATE POLICY "Users can insert own quiz_answers"
  ON quiz_answers FOR INSERT WITH CHECK (
    attempt_id IN (SELECT id FROM quiz_attempts WHERE user_id = (SELECT auth.uid()))
  );
CREATE POLICY "Users can view own code_submissions"
  ON code_submissions FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can insert own code_submissions"
  ON code_submissions FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own code_reviews"
  ON code_reviews FOR SELECT USING (
    submission_id IN (SELECT id FROM code_submissions WHERE user_id = (SELECT auth.uid()))
  );

-- ============================================
-- 일본어 콘텐츠: 인증된 사용자 읽기 가능
-- ============================================
CREATE POLICY "Authenticated users can view jlpt_vocabulary"
  ON jlpt_vocabulary FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view it_glossary"
  ON it_glossary FOR SELECT USING (auth.role() = 'authenticated');

-- ============================================
-- 00014_views.sql
-- ============================================
-- 퀴즈 정답 보호 뷰 (is_correct 필드 제외)
CREATE VIEW quiz_question_options_safe AS
SELECT id, question_id, option_text, sort_order
FROM quiz_question_options;

-- ============================================
-- 00015_coding_skill_exams.sql
-- ============================================
-- Paiza식 등급 시험 세트 정의
CREATE TABLE coding_skill_exams (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  target_rank TEXT NOT NULL CHECK (target_rank IN ('S', 'A', 'B', 'C', 'D')),
  language TEXT NOT NULL DEFAULT 'java' CHECK (language IN ('java', 'javascript', 'sql')),
  description TEXT,
  time_limit_minutes INTEGER NOT NULL DEFAULT 60,
  passing_score SMALLINT NOT NULL DEFAULT 70 CHECK (passing_score BETWEEN 0 AND 100),
  is_published BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 등급 시험 ↔ 코딩 문제 연결 (M:N)
CREATE TABLE coding_exam_problems (
  exam_id UUID NOT NULL REFERENCES coding_skill_exams(id) ON DELETE CASCADE,
  problem_id UUID NOT NULL REFERENCES coding_problems(id) ON DELETE CASCADE,
  sort_order INTEGER DEFAULT 0,
  points SMALLINT NOT NULL DEFAULT 10,
  PRIMARY KEY (exam_id, problem_id)
);

-- ============================================
-- 00016_coding_exam_attempts.sql
-- ============================================
-- 유저의 등급 시험 도전 기록
CREATE TABLE coding_exam_attempts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  exam_id UUID NOT NULL REFERENCES coding_skill_exams(id) ON DELETE CASCADE,
  score SMALLINT,
  passed BOOLEAN,
  achieved_rank TEXT CHECK (achieved_rank IN ('S', 'A', 'B', 'C', 'D', NULL)),
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE INDEX idx_coding_exam_attempts_user ON coding_exam_attempts(user_id, started_at DESC);

-- ============================================
-- 00017_ranking_system.sql
-- ============================================
-- 3개월 시즌 관리
CREATE TABLE ranking_seasons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CHECK (end_date > start_date)
);

CREATE INDEX idx_ranking_seasons_active ON ranking_seasons(is_active) WHERE is_active = TRUE;

-- 시즌별 유저 랭킹 스냅샷
CREATE TABLE user_rankings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  season_id UUID NOT NULL REFERENCES ranking_seasons(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,

  overall_score SMALLINT NOT NULL DEFAULT 0 CHECK (overall_score BETWEEN 0 AND 100),
  jlpt_score SMALLINT NOT NULL DEFAULT 0 CHECK (jlpt_score BETWEEN 0 AND 100),
  coding_score SMALLINT NOT NULL DEFAULT 0 CHECK (coding_score BETWEEN 0 AND 100),
  attitude_score SMALLINT NOT NULL DEFAULT 0 CHECK (attitude_score BETWEEN 0 AND 100),
  coding_rank TEXT DEFAULT 'D' CHECK (coding_rank IN ('S', 'A', 'B', 'C', 'D')),

  overall_rank INTEGER,
  jlpt_rank INTEGER,
  coding_rank_position INTEGER,
  attitude_rank INTEGER,

  recorded_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  UNIQUE(season_id, user_id)
);

CREATE INDEX idx_user_rankings_season ON user_rankings(season_id, overall_rank);

-- ============================================
-- 00018_admin_features.sql
-- ============================================
-- 관리자 과제 배정
CREATE TABLE task_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  assigned_by UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  assigned_to UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,

  target_type TEXT NOT NULL CHECK (target_type IN ('quiz', 'coding_problem', 'coding_exam', 'project')),
  target_id UUID NOT NULL,

  title TEXT,
  description TEXT,
  due_date TIMESTAMPTZ,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'in_progress', 'completed', 'overdue')),

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE INDEX idx_task_assignments_assignee ON task_assignments(assigned_to, status);
CREATE INDEX idx_task_assignments_assigner ON task_assignments(assigned_by, created_at DESC);

-- 관리자 피드백
CREATE TABLE admin_feedbacks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  admin_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,

  category TEXT NOT NULL DEFAULT 'general' CHECK (category IN (
    'general', 'japanese', 'coding', 'attitude', 'assignment', 'dispatch_readiness'
  )),
  content TEXT NOT NULL,

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_admin_feedbacks_user ON admin_feedbacks(user_id, created_at DESC);

-- ============================================
-- 00019_admin_rls_policies.sql
-- ============================================
-- ============================================
-- 헬퍼 함수: 현재 유저가 admin인지 확인
-- ============================================
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- ============================================
-- Admin이 기존 테이블 전체 조회 가능
-- ============================================

-- profiles
CREATE POLICY "Admins can view all profiles"
  ON profiles FOR SELECT USING (is_admin());

-- 스킬 테이블
CREATE POLICY "Admins can view all japanese_skills"
  ON japanese_skills FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all coding_skills"
  ON coding_skills FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all attitude_culture_skills"
  ON attitude_culture_skills FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR SELECT USING (is_admin());

-- 제출/시도 기록
CREATE POLICY "Admins can view all code_submissions"
  ON code_submissions FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all code_reviews"
  ON code_reviews FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all quiz_attempts"
  ON quiz_attempts FOR SELECT USING (is_admin());

-- 콘텐츠 CRUD
CREATE POLICY "Admins can manage courses"
  ON courses FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage lessons"
  ON lessons FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage coding_problems"
  ON coding_problems FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage coding_test_cases"
  ON coding_test_cases FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage quizzes"
  ON quizzes FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage quiz_questions"
  ON quiz_questions FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage quiz_question_options"
  ON quiz_question_options FOR ALL USING (is_admin());

-- ============================================
-- 신규 테이블 RLS 활성화 + 정책
-- ============================================

ALTER TABLE coding_skill_exams ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_exam_problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_exam_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE ranking_seasons ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_rankings ENABLE ROW LEVEL SECURITY;
ALTER TABLE task_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE admin_feedbacks ENABLE ROW LEVEL SECURITY;

-- coding_skill_exams: 인증된 사용자 published만, Admin 전체
CREATE POLICY "Authenticated users can view published exams"
  ON coding_skill_exams FOR SELECT USING (auth.role() = 'authenticated' AND is_published = TRUE);
CREATE POLICY "Admins can manage coding_skill_exams"
  ON coding_skill_exams FOR ALL USING (is_admin());

-- coding_exam_problems: 인증된 사용자 읽기, Admin CRUD
CREATE POLICY "Authenticated users can view exam problems"
  ON coding_exam_problems FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Admins can manage coding_exam_problems"
  ON coding_exam_problems FOR ALL USING (is_admin());

-- coding_exam_attempts: 본인 + Admin 조회
CREATE POLICY "Users can view own exam attempts"
  ON coding_exam_attempts FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can insert own exam attempts"
  ON coding_exam_attempts FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Admins can view all exam attempts"
  ON coding_exam_attempts FOR SELECT USING (is_admin());

-- ranking_seasons: 인증된 사용자 읽기, Admin CRUD
CREATE POLICY "Authenticated users can view ranking_seasons"
  ON ranking_seasons FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Admins can manage ranking_seasons"
  ON ranking_seasons FOR ALL USING (is_admin());

-- user_rankings: 인증된 사용자 전원 조회 (랭킹보드)
CREATE POLICY "Authenticated users can view rankings"
  ON user_rankings FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Admins can manage user_rankings"
  ON user_rankings FOR ALL USING (is_admin());

-- task_assignments: 본인 배정 조회/수정 + Admin 전체 관리
CREATE POLICY "Users can view own assignments"
  ON task_assignments FOR SELECT USING ((SELECT auth.uid()) = assigned_to);
CREATE POLICY "Users can update own assignment status"
  ON task_assignments FOR UPDATE USING ((SELECT auth.uid()) = assigned_to);
CREATE POLICY "Admins can manage all task_assignments"
  ON task_assignments FOR ALL USING (is_admin());

-- admin_feedbacks: 본인 피드백 조회 + Admin CRUD
CREATE POLICY "Users can view own feedbacks"
  ON admin_feedbacks FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Admins can manage all admin_feedbacks"
  ON admin_feedbacks FOR ALL USING (is_admin());

-- ============================================
-- 00020_new_table_triggers.sql
-- ============================================
-- updated_at 트리거 for new tables
CREATE TRIGGER set_updated_at BEFORE UPDATE ON coding_skill_exams
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER set_updated_at BEFORE UPDATE ON admin_feedbacks
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ============================================
-- 00021_missing_update_policies.sql
-- ============================================
-- ============================================
-- 누락된 UPDATE RLS 정책 추가
-- quiz_attempts, code_submissions, coding_exam_attempts
-- ============================================

-- quiz_attempts: submitQuizAnswers()에서 score/passed/completed_at UPDATE 필요
CREATE POLICY "Users can update own quiz_attempts"
  ON quiz_attempts FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- code_submissions: submitCode()에서 status/passed_test_cases UPDATE 필요
CREATE POLICY "Users can update own code_submissions"
  ON code_submissions FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- coding_exam_attempts: 시험 완료 시 UPDATE 필요
CREATE POLICY "Users can update own coding_exam_attempts"
  ON coding_exam_attempts FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- 00022_comprehensive_rls_fixes.sql
-- ============================================
-- ============================================
-- Comprehensive RLS Policy Fixes
-- Addresses multiple missing policies that prevent
-- server actions from working properly
-- ============================================

-- 1. Fix coding_test_cases: Allow authenticated users to read ALL test cases
-- Server actions filter results before returning to client (only sample cases shown)
DROP POLICY IF EXISTS "Authenticated users can view sample test_cases" ON coding_test_cases;
CREATE POLICY "Authenticated users can view all test_cases"
  ON coding_test_cases FOR SELECT USING (auth.role() = 'authenticated');

-- 2. Add code_reviews INSERT policy (for submitCode code review saving)
CREATE POLICY "Users can insert code_reviews for own submissions"
  ON code_reviews FOR INSERT WITH CHECK (
    submission_id IN (SELECT id FROM code_submissions WHERE user_id = (SELECT auth.uid()))
  );

-- 3. Add japanese_skills INSERT/UPDATE policies (for recalculateUserScores upsert)
CREATE POLICY "Users can insert own japanese_skills"
  ON japanese_skills FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can update own japanese_skills"
  ON japanese_skills FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- 4. Add coding_skills INSERT/UPDATE policies (for recalculateUserScores upsert)
CREATE POLICY "Users can insert own coding_skills"
  ON coding_skills FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can update own coding_skills"
  ON coding_skills FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- 5. Add attitude_culture_skills INSERT/UPDATE policies (for recalculateUserScores upsert)
CREATE POLICY "Users can insert own attitude_culture_skills"
  ON attitude_culture_skills FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can update own attitude_culture_skills"
  ON attitude_culture_skills FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- 6. Add dispatch_readiness_scores INSERT policy (for recalculateUserScores snapshot)
CREATE POLICY "Users can insert own dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);

-- 7. Add lesson_progress INSERT policy (for course progress tracking)
CREATE POLICY "Users can insert own lesson_progress"
  ON lesson_progress FOR INSERT WITH CHECK (
    enrollment_id IN (SELECT id FROM enrollments WHERE user_id = (SELECT auth.uid()))
  );

-- ============================================
-- 00023_fix_handle_new_user_trigger.sql
-- ============================================
-- ============================================
-- Fix handle_new_user trigger
-- 1. SET search_path = public (SECURITY DEFINER 함수에서 테이블 못 찾는 문제 해결)
-- 2. 테이블명에 public. 스키마 명시
-- 3. EXCEPTION 블록에서 에러를 삼키지 않고 RAISE하도록 변경
-- ============================================

CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(NEW.email, 'user_' || LEFT(NEW.id::text, 8) || '@unknown.com'),
    COALESCE(
      NEW.raw_user_meta_data->>'full_name',
      NEW.raw_user_meta_data->>'name',
      'User_' || floor(random() * 90000 + 10000)::text
    ),
    COALESCE(NEW.raw_user_meta_data->>'avatar_url', '')
  );

  INSERT INTO public.japanese_skills (user_id) VALUES (NEW.id);
  INSERT INTO public.coding_skills (user_id) VALUES (NEW.id);
  INSERT INTO public.attitude_culture_skills (user_id) VALUES (NEW.id);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- ============================================
-- 00024_create_avatars_bucket.sql
-- ============================================
-- ============================================
-- avatars Storage Bucket 생성
-- ============================================

INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'avatars',
  'avatars',
  true,
  5242880, -- 5MB
  ARRAY['image/jpeg', 'image/png', 'image/gif', 'image/webp']
)
ON CONFLICT (id) DO NOTHING;

-- 누구나 아바타 이미지 조회 가능
CREATE POLICY "Public avatar access"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'avatars');

-- 인증된 유저는 자신의 아바타 업로드 가능
CREATE POLICY "Users can upload own avatar"
  ON storage.objects FOR INSERT
  WITH CHECK (
    bucket_id = 'avatars'
    AND auth.role() = 'authenticated'
  );

-- 인증된 유저는 자신의 아바타 수정 가능
CREATE POLICY "Users can update own avatar"
  ON storage.objects FOR UPDATE
  USING (
    bucket_id = 'avatars'
    AND auth.role() = 'authenticated'
  );

-- 인증된 유저는 자신의 아바타 삭제 가능
CREATE POLICY "Users can delete own avatar"
  ON storage.objects FOR DELETE
  USING (
    bucket_id = 'avatars'
    AND auth.role() = 'authenticated'
  );

-- ============================================
-- 00025_assessment_system.sql
-- ============================================
-- Assessment System Migration
-- Adds support for onboarding assessment quizzes with random question selection

-- 1) Extend quiz_type CHECK to include new types
ALTER TABLE quizzes DROP CONSTRAINT quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check CHECK (quiz_type IN (
  'jlpt_vocab','jlpt_grammar','jlpt_reading','jlpt_listening',
  'it_terminology','role_play_scenario','attitude_culture',
  'core_programming','framework'
));

-- 2) Assessment quiz flags + random question selection
ALTER TABLE quizzes ADD COLUMN is_assessment BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE quizzes ADD COLUMN questions_per_attempt SMALLINT;

-- 3) Question difficulty + category tags for balanced random selection
ALTER TABLE quiz_questions ADD COLUMN difficulty TEXT CHECK (difficulty IN ('easy','medium','hard'));
ALTER TABLE quiz_questions ADD COLUMN question_category TEXT;

-- 4) Onboarding step tracking (0=not started, 1=preferences done, 2-6=test 1-5 done)
ALTER TABLE profiles ADD COLUMN onboarding_step SMALLINT NOT NULL DEFAULT 0;

-- Set existing onboarded users to step 6 (fully complete)
UPDATE profiles SET onboarding_step = 6 WHERE is_onboarded = TRUE;

-- ============================================
-- 00026_tag_quiz_question_categories.sql
-- ============================================
-- ============================================
-- Tag Quiz 3 (Programming) and Quiz 4 (Framework) questions
-- with question_category for language-group-based selection
-- ============================================

BEGIN;

-- ============================================
-- Quiz 3: Core Programming (a0000003-0000-0000-0000-000000000003)
-- Each difficulty group of 30 → 10 java + 10 javascript + 10 sql
-- ============================================

-- EASY (sort_order 1-30)
UPDATE quiz_questions SET question_category = 'java'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 1 AND 10;

UPDATE quiz_questions SET question_category = 'javascript'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 11 AND 20;

UPDATE quiz_questions SET question_category = 'sql'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 21 AND 30;

-- MEDIUM (sort_order 31-60)
UPDATE quiz_questions SET question_category = 'java'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 31 AND 40;

UPDATE quiz_questions SET question_category = 'javascript'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 41 AND 50;

UPDATE quiz_questions SET question_category = 'sql'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 51 AND 60;

-- HARD (sort_order 61-90)
UPDATE quiz_questions SET question_category = 'java'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 61 AND 70;

UPDATE quiz_questions SET question_category = 'javascript'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 71 AND 80;

UPDATE quiz_questions SET question_category = 'sql'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 81 AND 90;

-- ============================================
-- Quiz 4: Framework (a0000004-0000-0000-0000-000000000004)
-- Each difficulty group of 30 → 10 spring_boot + 10 react + 10 db_design
-- ============================================

-- EASY (sort_order 1-30)
UPDATE quiz_questions SET question_category = 'spring_boot'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 1 AND 10;

UPDATE quiz_questions SET question_category = 'react'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 11 AND 20;

UPDATE quiz_questions SET question_category = 'db_design'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 21 AND 30;

-- MEDIUM (sort_order 31-60)
UPDATE quiz_questions SET question_category = 'spring_boot'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 31 AND 40;

UPDATE quiz_questions SET question_category = 'react'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 41 AND 50;

UPDATE quiz_questions SET question_category = 'db_design'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 51 AND 60;

-- HARD (sort_order 61-90)
UPDATE quiz_questions SET question_category = 'spring_boot'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 61 AND 70;

UPDATE quiz_questions SET question_category = 'react'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 71 AND 80;

UPDATE quiz_questions SET question_category = 'db_design'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 81 AND 90;

COMMIT;

-- ============================================
-- 00027_fix_trigger_and_admin_policies.sql
-- ============================================
-- ============================================
-- 1. Fix handle_new_user trigger: restore EXCEPTION handler
--    Without it, any INSERT failure crashes user creation entirely
-- 2. Add admin UPDATE policy on profiles
--    Without it, admin role changes via RLS are silently rejected
-- ============================================

-- Fix trigger: add EXCEPTION block so auth.users INSERT isn't rolled back on failure
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(NEW.email, 'user_' || LEFT(NEW.id::text, 8) || '@unknown.com'),
    COALESCE(
      NEW.raw_user_meta_data->>'full_name',
      NEW.raw_user_meta_data->>'name',
      'User_' || floor(random() * 90000 + 10000)::text
    ),
    COALESCE(NEW.raw_user_meta_data->>'avatar_url', '')
  );

  INSERT INTO public.japanese_skills (user_id) VALUES (NEW.id);
  INSERT INTO public.coding_skills (user_id) VALUES (NEW.id);
  INSERT INTO public.attitude_culture_skills (user_id) VALUES (NEW.id);

  RETURN NEW;
EXCEPTION
  WHEN unique_violation THEN
    -- Profile already exists (e.g. re-confirmation), skip silently
    RETURN NEW;
  WHEN OTHERS THEN
    -- Log but don't block user creation
    RAISE WARNING 'handle_new_user trigger failed for user %: %', NEW.id, SQLERRM;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- Add admin UPDATE policy on profiles (was missing — only SELECT existed)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'profiles'
      AND policyname = 'Admins can update all profiles'
  ) THEN
    EXECUTE 'CREATE POLICY "Admins can update all profiles" ON profiles FOR UPDATE USING (is_admin())';
  END IF;
END $$;

-- ============================================
-- 00028_assessment_restructure.sql
-- ============================================
-- ============================================================
-- 00028: Assessment Restructure (idempotent)
-- Category rename + is_japanese mode + retake system
-- ============================================================

-- 1A. Add is_japanese column to profiles
DO $$ BEGIN
  ALTER TABLE profiles ADD COLUMN is_japanese BOOLEAN NOT NULL DEFAULT FALSE;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- 1B. Remove SQL from target_coding_area options
UPDATE profiles SET target_coding_area = 'java' WHERE target_coding_area = 'sql';
ALTER TABLE profiles DROP CONSTRAINT IF EXISTS profiles_target_coding_area_check;
ALTER TABLE profiles ADD CONSTRAINT profiles_target_coding_area_check
  CHECK (target_coding_area IN ('java', 'javascript') OR target_coding_area IS NULL);

-- 1C. dispatch_readiness_scores: make jlpt/it_japanese nullable
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores ALTER COLUMN jlpt_score DROP NOT NULL;
EXCEPTION WHEN others THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores ALTER COLUMN it_japanese_score DROP NOT NULL;
EXCEPTION WHEN others THEN NULL;
END $$;

-- Drop the generated column and re-add as a regular column
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores DROP COLUMN overall_score;
EXCEPTION WHEN undefined_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores ADD COLUMN overall_score SMALLINT;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores ADD COLUMN is_japanese BOOLEAN NOT NULL DEFAULT FALSE;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- Overall score trigger: average of non-null axes
CREATE OR REPLACE FUNCTION compute_dispatch_overall_score()
RETURNS TRIGGER AS $$
DECLARE
  total INT := 0;
  cnt INT := 0;
BEGIN
  IF NEW.jlpt_score IS NOT NULL THEN
    total := total + NEW.jlpt_score;
    cnt := cnt + 1;
  END IF;
  IF NEW.it_japanese_score IS NOT NULL THEN
    total := total + NEW.it_japanese_score;
    cnt := cnt + 1;
  END IF;
  IF NEW.core_programming_score IS NOT NULL THEN
    total := total + NEW.core_programming_score;
    cnt := cnt + 1;
  END IF;
  IF NEW.framework_score IS NOT NULL THEN
    total := total + NEW.framework_score;
    cnt := cnt + 1;
  END IF;
  IF NEW.attitude_culture_score IS NOT NULL THEN
    total := total + NEW.attitude_culture_score;
    cnt := cnt + 1;
  END IF;

  IF cnt > 0 THEN
    NEW.overall_score := total / cnt;
  ELSE
    NEW.overall_score := NULL;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS compute_overall_before_insert ON dispatch_readiness_scores;
CREATE TRIGGER compute_overall_before_insert
  BEFORE INSERT OR UPDATE ON dispatch_readiness_scores
  FOR EACH ROW EXECUTE FUNCTION compute_dispatch_overall_score();

-- 1D. Add new sub-scores to attitude_culture_skills
DO $$ BEGIN
  ALTER TABLE attitude_culture_skills
    ADD COLUMN business_culture_score SMALLINT DEFAULT 0 CHECK (business_culture_score BETWEEN 0 AND 100);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE attitude_culture_skills
    ADD COLUMN it_security_score SMALLINT DEFAULT 0 CHECK (it_security_score BETWEEN 0 AND 100);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- 1E. Update Quiz 5 metadata (10 questions -> 30 questions, 10 min -> 25 min)
UPDATE quizzes SET questions_per_attempt = 30, time_limit_minutes = 25
WHERE id = 'a0000005-0000-0000-0000-000000000005';

-- 9A. Retake request system columns on quiz_attempts
DO $$ BEGIN
  ALTER TABLE quiz_attempts ADD COLUMN retake_request_status TEXT DEFAULT NULL
    CHECK (retake_request_status IN ('requested', 'approved', 'denied') OR retake_request_status IS NULL);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE quiz_attempts ADD COLUMN retake_requested_at TIMESTAMPTZ;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE quiz_attempts ADD COLUMN retake_approved_at TIMESTAMPTZ;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- ============================================
-- 00029_content_access_requests.sql
-- ============================================
-- ============================================
-- 열람 신청 테이블
-- ============================================
CREATE TABLE content_access_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  content_category TEXT NOT NULL,
  content_path TEXT NOT NULL,
  reason TEXT,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'denied')),
  reviewed_by UUID REFERENCES profiles(id) ON DELETE SET NULL,
  reviewed_at TIMESTAMPTZ,
  review_note TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 동일 유저의 중복 pending 방지
CREATE UNIQUE INDEX idx_unique_pending_request
  ON content_access_requests(user_id, content_category) WHERE status = 'pending';

-- updated_at 트리거
CREATE TRIGGER set_content_access_requests_updated_at
  BEFORE UPDATE ON content_access_requests
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- RLS
-- ============================================
ALTER TABLE content_access_requests ENABLE ROW LEVEL SECURITY;

-- 본인 조회
CREATE POLICY "Users can view own access requests"
  ON content_access_requests FOR SELECT
  USING ((SELECT auth.uid()) = user_id);

-- 본인 생성
CREATE POLICY "Users can create own access requests"
  ON content_access_requests FOR INSERT
  WITH CHECK ((SELECT auth.uid()) = user_id);

-- Admin 전체 관리
CREATE POLICY "Admins can manage all access requests"
  ON content_access_requests FOR ALL
  USING (is_admin());

-- ============================================
-- 00030_mentor_rls_policies.sql
-- ============================================
-- ============================================
-- 멘토 헬퍼 함수
-- ============================================
CREATE OR REPLACE FUNCTION is_mentor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role = 'mentor'
  );
$$ LANGUAGE sql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION is_admin_or_mentor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role IN ('admin', 'mentor')
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- ============================================
-- 멘토: task_assignments 접근
-- ============================================
CREATE POLICY "Mentors can view all task_assignments"
  ON task_assignments FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can create task_assignments"
  ON task_assignments FOR INSERT
  WITH CHECK (is_mentor() AND (SELECT auth.uid()) = assigned_by);

-- ============================================
-- 멘토: 프로필 및 스킬 조회 (레포트용)
-- ============================================
CREATE POLICY "Mentors can view all profiles"
  ON profiles FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all japanese_skills"
  ON japanese_skills FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all coding_skills"
  ON coding_skills FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all attitude_culture_skills"
  ON attitude_culture_skills FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR SELECT
  USING (is_mentor());

-- ============================================
-- 멘토: 퀴즈 시도 및 피드백 조회
-- ============================================
CREATE POLICY "Mentors can view all quiz_attempts"
  ON quiz_attempts FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all admin_feedbacks"
  ON admin_feedbacks FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can create admin_feedbacks"
  ON admin_feedbacks FOR INSERT
  WITH CHECK (is_mentor() AND (SELECT auth.uid()) = admin_id);

-- ============================================
-- 멘토: 열람 신청 조회/승인
-- ============================================
CREATE POLICY "Mentors can view all access requests"
  ON content_access_requests FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can update access requests"
  ON content_access_requests FOR UPDATE
  USING (is_mentor());

-- ============================================
-- 00031_jlpt_grammar_table.sql
-- ============================================
-- ============================================
-- JLPT Grammar Table
-- ============================================

CREATE TABLE jlpt_grammar (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  pattern TEXT NOT NULL,
  meaning_ko TEXT NOT NULL,
  meaning_ja TEXT NOT NULL,
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5','N4','N3','N2','N1')),
  formation TEXT NOT NULL,
  formation_detail TEXT,
  category TEXT CHECK (category IN (
    'permission','obligation','desire','ability','condition',
    'reason','contrast','conjecture','change','degree',
    'time','manner','listing','emphasis','formal'
  )),
  example_sentences JSONB NOT NULL DEFAULT '[]',
  related_patterns TEXT[],
  common_mistakes TEXT,
  usage_notes TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_grammar_level ON jlpt_grammar(jlpt_level);
CREATE INDEX idx_jlpt_grammar_category ON jlpt_grammar(category);

-- RLS
ALTER TABLE jlpt_grammar ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read grammar" ON jlpt_grammar FOR SELECT USING (true);
CREATE POLICY "Admin can manage grammar" ON jlpt_grammar FOR ALL
  USING ((SELECT role FROM profiles WHERE id = (SELECT auth.uid())) = 'admin');

-- ============================================
-- 00032_jlpt_reading_passages.sql
-- ============================================
-- ============================================
-- JLPT Reading Passages Table
-- ============================================

CREATE TABLE jlpt_reading_passages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  passage TEXT NOT NULL,
  passage_type TEXT NOT NULL CHECK (passage_type IN (
    'notice','email','article','advertisement','instruction','essay','letter','report'
  )),
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5','N4','N3','N2','N1')),
  word_count INTEGER DEFAULT 0,
  topic TEXT,
  vocabulary_notes JSONB NOT NULL DEFAULT '[]',
  grammar_notes TEXT[],
  translation_ko TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_reading_level ON jlpt_reading_passages(jlpt_level);
CREATE INDEX idx_jlpt_reading_type ON jlpt_reading_passages(passage_type);

-- RLS
ALTER TABLE jlpt_reading_passages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read passages" ON jlpt_reading_passages FOR SELECT USING (true);
CREATE POLICY "Admin can manage passages" ON jlpt_reading_passages FOR ALL
  USING ((SELECT role FROM profiles WHERE id = (SELECT auth.uid())) = 'admin');

-- ============================================
-- 00033_jlpt_listening_scripts.sql
-- ============================================
-- ============================================
-- JLPT Listening Scripts Table
-- ============================================

CREATE TABLE jlpt_listening_scripts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  script TEXT NOT NULL,
  script_type TEXT NOT NULL CHECK (script_type IN (
    'dialogue','monologue','announcement','instruction','meeting','phone_call'
  )),
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5','N4','N3','N2','N1')),
  speakers TEXT[],
  situation TEXT,
  vocabulary_notes JSONB NOT NULL DEFAULT '[]',
  translation_ko TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_listening_level ON jlpt_listening_scripts(jlpt_level);
CREATE INDEX idx_jlpt_listening_type ON jlpt_listening_scripts(script_type);

-- RLS
ALTER TABLE jlpt_listening_scripts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read scripts" ON jlpt_listening_scripts FOR SELECT USING (true);
CREATE POLICY "Admin can manage scripts" ON jlpt_listening_scripts FOR ALL
  USING ((SELECT role FROM profiles WHERE id = (SELECT auth.uid())) = 'admin');

-- ============================================
-- 00034_mentor_mentee_system.sql
-- ============================================
-- メンター⇔メンティー紐付けテーブル
CREATE TABLE mentor_mentee_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  mentor_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  mentee_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  assigned_by UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(mentor_id, mentee_id)
);

-- 汎用通知テーブル
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  type TEXT NOT NULL,  -- 'task_assigned','exam_requested','exam_approved','exam_denied','exam_completed'
  title TEXT NOT NULL,
  message TEXT,
  link TEXT,             -- クリック時の遷移先
  is_read BOOLEAN NOT NULL DEFAULT FALSE,
  related_id UUID,       -- 関連オブジェクトID
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_notifications_user ON notifications(user_id, is_read, created_at DESC);

-- 学習課題テーブル (カテゴリ/サブカテゴリ/レベル指定)
CREATE TABLE learning_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  assigned_by UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  assigned_to UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  category TEXT NOT NULL,      -- 'seikatsu','business-jp','cs','dev','business-lit'
  subcategory TEXT NOT NULL,   -- 'vocabulary','grammar','reading','listening','java' 等
  content_level TEXT,          -- 'N5','N4'... or null
  title TEXT NOT NULL,
  description TEXT,
  due_date TIMESTAMPTZ,
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending','in_progress','completed')),
  required_quiz_ids UUID[] DEFAULT '{}',  -- この課題に必要なクイズID
  passed_quiz_ids UUID[] DEFAULT '{}',    -- 合格済みクイズID
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);
CREATE INDEX idx_learning_assignments_assignee ON learning_assignments(assigned_to, status);

-- 総合試験テーブル
CREATE TABLE comprehensive_exams (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  category TEXT NOT NULL,
  subcategory TEXT NOT NULL,
  content_level TEXT,
  status TEXT NOT NULL DEFAULT 'requested'
    CHECK (status IN ('requested','approved','denied','in_progress','completed','failed')),
  requested_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  approved_at TIMESTAMPTZ,
  approved_by UUID REFERENCES profiles(id),
  started_at TIMESTAMPTZ,
  completed_at TIMESTAMPTZ,
  time_limit_minutes INT NOT NULL DEFAULT 40,
  total_questions INT NOT NULL DEFAULT 30,
  score SMALLINT,
  passed BOOLEAN,
  passing_score SMALLINT NOT NULL DEFAULT 70
);
CREATE INDEX idx_comprehensive_exams_user ON comprehensive_exams(user_id, status);

-- 総合試験回答テーブル
CREATE TABLE comprehensive_exam_answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  exam_id UUID NOT NULL REFERENCES comprehensive_exams(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES quiz_questions(id),
  selected_option_id UUID REFERENCES quiz_question_options(id),
  is_correct BOOLEAN,
  answered_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- quizzesテーブルにcontent_level列を追加
ALTER TABLE quizzes ADD COLUMN IF NOT EXISTS content_level TEXT;

-- 既存クイズタイトルからレベルをバックフィル
UPDATE quizzes SET content_level = 'N5' WHERE title ILIKE '%N5%' AND content_level IS NULL;
UPDATE quizzes SET content_level = 'N4' WHERE title ILIKE '%N4%' AND content_level IS NULL;
UPDATE quizzes SET content_level = 'N3' WHERE title ILIKE '%N3%' AND content_level IS NULL;
UPDATE quizzes SET content_level = 'N2' WHERE title ILIKE '%N2%' AND content_level IS NULL;
UPDATE quizzes SET content_level = 'N1' WHERE title ILIKE '%N1%' AND content_level IS NULL;

-- ============================================
-- 00035_mentor_mentee_rls.sql
-- ============================================
-- helper function
CREATE OR REPLACE FUNCTION is_mentor_of(target_user_id UUID)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM mentor_mentee_assignments
    WHERE mentor_id = auth.uid() AND mentee_id = target_user_id
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- helper function
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- mentor_mentee_assignments RLS
ALTER TABLE mentor_mentee_assignments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "admin_full_access" ON mentor_mentee_assignments FOR ALL USING (is_admin());
CREATE POLICY "mentor_read_own" ON mentor_mentee_assignments FOR SELECT USING (mentor_id = auth.uid());
CREATE POLICY "mentee_read_own" ON mentor_mentee_assignments FOR SELECT USING (mentee_id = auth.uid());

-- notifications RLS
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
CREATE POLICY "user_read_own" ON notifications FOR SELECT USING (user_id = auth.uid());
CREATE POLICY "user_update_own" ON notifications FOR UPDATE USING (user_id = auth.uid());
CREATE POLICY "admin_insert" ON notifications FOR INSERT WITH CHECK (is_admin());
CREATE POLICY "mentor_insert" ON notifications FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role IN ('admin','mentor'))
);

-- learning_assignments RLS
ALTER TABLE learning_assignments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "admin_full_access" ON learning_assignments FOR ALL USING (is_admin());
CREATE POLICY "mentor_manage_own" ON learning_assignments FOR ALL USING (
  assigned_by = auth.uid() OR is_mentor_of(assigned_to)
);
CREATE POLICY "mentee_read_own" ON learning_assignments FOR SELECT USING (assigned_to = auth.uid());

-- comprehensive_exams RLS
ALTER TABLE comprehensive_exams ENABLE ROW LEVEL SECURITY;
CREATE POLICY "admin_full_access" ON comprehensive_exams FOR ALL USING (is_admin());
CREATE POLICY "mentor_manage_mentee" ON comprehensive_exams FOR ALL USING (is_mentor_of(user_id));
CREATE POLICY "user_own" ON comprehensive_exams FOR ALL USING (user_id = auth.uid());

-- comprehensive_exam_answers RLS
ALTER TABLE comprehensive_exam_answers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "admin_read" ON comprehensive_exam_answers FOR SELECT USING (is_admin());
CREATE POLICY "user_own" ON comprehensive_exam_answers FOR ALL USING (
  EXISTS (SELECT 1 FROM comprehensive_exams WHERE id = exam_id AND user_id = auth.uid())
);

NOTIFY pgrst, 'reload schema';

-- ============================================
-- 00036_question_claims.sql
-- ============================================
-- Question claims table for exam review feedback
CREATE TABLE question_claims (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(question_id, user_id)
);

-- RLS
ALTER TABLE question_claims ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can insert own claims"
  ON question_claims FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can view own claims"
  ON question_claims FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all claims"
  ON question_claims FOR SELECT
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Mentors can view all claims"
  ON question_claims FOR SELECT
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'mentor')
  );

-- ============================================
-- 00037_content_management.sql
-- ============================================
-- Content management improvements

-- 1. quiz_questions に is_published カラム追加
ALTER TABLE quiz_questions ADD COLUMN IF NOT EXISTS is_published BOOLEAN NOT NULL DEFAULT TRUE;

-- 既存の全問題を公開に設定
UPDATE quiz_questions SET is_published = TRUE WHERE is_published = FALSE;

-- 2. question_claims に claim_reason カラム追加 (nullable)
ALTER TABLE question_claims ADD COLUMN IF NOT EXISTS claim_reason TEXT;

-- ============================================
-- 00038_feedback_overhaul.sql
-- ============================================
-- ============================================
-- 00038: Feedback System Overhaul
-- - カテゴリを5軸(seikatsu, business_jp, cs, dev, business_lit)に変更
-- - feedback_replies テーブル追加（双方向フィードバック）
-- - RLS: 当事者のみ閲覧・作成、本人のみ修正・削除
-- ============================================

-- ヘルパー関数（未作成の場合に備えて再定義）
CREATE OR REPLACE FUNCTION is_mentor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role = 'mentor'
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- 1-A. admin_feedbacks カテゴリ CHECK 制約変更
-- 既存データを新カテゴリにマッピング
UPDATE admin_feedbacks SET category = 'seikatsu' WHERE category IN ('general', 'japanese');
UPDATE admin_feedbacks SET category = 'dev' WHERE category IN ('coding', 'assignment');
UPDATE admin_feedbacks SET category = 'business_lit' WHERE category IN ('attitude', 'dispatch_readiness');

ALTER TABLE admin_feedbacks DROP CONSTRAINT admin_feedbacks_category_check;
ALTER TABLE admin_feedbacks ADD CONSTRAINT admin_feedbacks_category_check
  CHECK (category IN ('seikatsu', 'business_jp', 'cs', 'dev', 'business_lit'));

-- デフォルト値も変更
ALTER TABLE admin_feedbacks ALTER COLUMN category SET DEFAULT 'seikatsu';

-- 1-B. feedback_replies テーブル
CREATE TABLE feedback_replies (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  feedback_id UUID NOT NULL REFERENCES admin_feedbacks(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_feedback_replies_feedback ON feedback_replies(feedback_id, created_at ASC);

-- updated_at 自動更新トリガー
CREATE TRIGGER set_updated_at BEFORE UPDATE ON feedback_replies
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- 1-C. RLS
ALTER TABLE feedback_replies ENABLE ROW LEVEL SECURITY;

-- フィードバック当事者（発信者 or 受信者）のみリプライ閲覧
CREATE POLICY "Feedback participants can view replies" ON feedback_replies FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM admin_feedbacks f
    WHERE f.id = feedback_id AND (f.admin_id = auth.uid() OR f.user_id = auth.uid())
  ));

-- フィードバック当事者のみリプライ作成
CREATE POLICY "Feedback participants can create replies" ON feedback_replies FOR INSERT
  WITH CHECK (auth.uid() = user_id AND EXISTS (
    SELECT 1 FROM admin_feedbacks f
    WHERE f.id = feedback_id AND (f.admin_id = auth.uid() OR f.user_id = auth.uid())
  ));

-- 本人リプライのみ修正
CREATE POLICY "Users can update own replies" ON feedback_replies FOR UPDATE
  USING (auth.uid() = user_id);

-- 本人リプライのみ削除
CREATE POLICY "Users can delete own replies" ON feedback_replies FOR DELETE
  USING (auth.uid() = user_id);

-- Admin 全管理
CREATE POLICY "Admins can manage all feedback_replies" ON feedback_replies FOR ALL
  USING (is_admin());

-- Mentor: admin_feedbacks 本人作成分の修正・削除
CREATE POLICY "Mentors can update own feedbacks" ON admin_feedbacks FOR UPDATE
  USING (is_mentor() AND admin_id = auth.uid());
CREATE POLICY "Mentors can delete own feedbacks" ON admin_feedbacks FOR DELETE
  USING (is_mentor() AND admin_id = auth.uid());

-- 発信者も自分のフィードバックを閲覧可能
CREATE POLICY "Feedback authors can view own feedbacks" ON admin_feedbacks FOR SELECT
  USING (auth.uid() = admin_id);

-- ============================================
-- 00039_feedback_mentee_delete.sql
-- ============================================
-- Part 1: Allow mentees to delete their own received feedbacks
CREATE POLICY "Users can delete own received feedbacks"
  ON admin_feedbacks FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================
-- 00040_it_glossary_expand.sql
-- ============================================
-- ============================================
-- IT Glossary 카테고리 확장 + subcategory 컬럼 추가
-- expression, sentence_pattern 카테고리 추가
-- ============================================

-- 1. 기존 CHECK 제약조건 삭제
ALTER TABLE it_glossary DROP CONSTRAINT IF EXISTS it_glossary_category_check;

-- 2. 새 CHECK 제약조건 추가 (expression, sentence_pattern 추가)
ALTER TABLE it_glossary ADD CONSTRAINT it_glossary_category_check
  CHECK (category IN (
    'development', 'testing', 'design_doc', 'infrastructure',
    'project_management', 'business',
    'expression', 'sentence_pattern'
  ));

-- 3. subcategory 컬럼 추가 (expression, sentence_pattern 세부 분류용)
ALTER TABLE it_glossary ADD COLUMN IF NOT EXISTS subcategory TEXT;

-- 4. subcategory 인덱스 추가
CREATE INDEX IF NOT EXISTS idx_it_glossary_subcategory ON it_glossary(subcategory);

-- ============================================
-- 00041_user_mastered_items.sql
-- ============================================
-- 암기 체크 (마스터리) 테이블
CREATE TABLE user_mastered_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  item_type TEXT NOT NULL CHECK (item_type IN ('it_glossary', 'jlpt_vocabulary', 'jlpt_grammar')),
  item_id UUID NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(user_id, item_type, item_id)
);

CREATE INDEX idx_user_mastered_user ON user_mastered_items(user_id, item_type);

ALTER TABLE user_mastered_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own mastered items"
  ON user_mastered_items FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own mastered items"
  ON user_mastered_items FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own mastered items"
  ON user_mastered_items FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================
-- 00042_rename_assessment_titles.sql
-- ============================================
-- Rename assessment quiz titles: ランク試験 → 総合試験
UPDATE quizzes SET title = REPLACE(title, 'ランク試験', '総合試験')
WHERE is_assessment = TRUE AND title LIKE '%ランク試験';

-- ============================================
-- 00043_business_quiz_types.sql
-- ============================================
-- Extend quiz_type constraint to include business quiz types
ALTER TABLE quizzes DROP CONSTRAINT quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check CHECK (quiz_type IN (
  'jlpt_vocab','jlpt_grammar','jlpt_reading','jlpt_listening',
  'it_terminology','role_play_scenario','attitude_culture',
  'core_programming','framework',
  'sentence_pattern','business_expression'
));

-- ============================================
-- 00044_rename_jlpt_quiz_titles.sql
-- ============================================
-- Rename JLPT vocabulary quiz titles from Korean to Japanese
UPDATE quizzes SET title = 'N5 語彙テスト 第1回' WHERE id = 'a0000001-0000-4000-a000-000000000001';
UPDATE quizzes SET title = 'N5 語彙テスト 第2回' WHERE id = 'a0000001-0000-4000-a000-000000000002';
UPDATE quizzes SET title = 'N5 語彙テスト 第3回' WHERE id = 'a0000001-0000-4000-a000-000000000003';
UPDATE quizzes SET title = 'N5 語彙テスト 第4回' WHERE id = 'a0000001-0000-4000-a000-000000000004';
UPDATE quizzes SET title = 'N5 語彙テスト 第5回' WHERE id = 'a0000001-0000-4000-a000-000000000005';
UPDATE quizzes SET title = 'N4 語彙テスト 第1回' WHERE id = 'a0000001-0000-4000-a000-000000000006';
UPDATE quizzes SET title = 'N4 語彙テスト 第2回' WHERE id = 'a0000001-0000-4000-a000-000000000007';
UPDATE quizzes SET title = 'N4 語彙テスト 第3回' WHERE id = 'a0000001-0000-4000-a000-000000000008';
UPDATE quizzes SET title = 'N4 語彙テスト 第4回' WHERE id = 'a0000001-0000-4000-a000-000000000009';
UPDATE quizzes SET title = 'N4 語彙テスト 第5回' WHERE id = 'a0000001-0000-4000-a000-00000000000a';
UPDATE quizzes SET title = 'N3 語彙テスト 第1回' WHERE id = 'a0000001-0000-4000-a000-00000000000b';
UPDATE quizzes SET title = 'N3 語彙テスト 第2回' WHERE id = 'a0000001-0000-4000-a000-00000000000c';
UPDATE quizzes SET title = 'N3 語彙テスト 第3回' WHERE id = 'a0000001-0000-4000-a000-00000000000d';
UPDATE quizzes SET title = 'N2 語彙テスト 第1回' WHERE id = 'a0000001-0000-4000-a000-00000000000e';
UPDATE quizzes SET title = 'N2 語彙テスト 第2回' WHERE id = 'a0000001-0000-4000-a000-00000000000f';
UPDATE quizzes SET title = 'N2 語彙テスト 第3回' WHERE id = 'a0000001-0000-4000-a000-000000000010';
UPDATE quizzes SET title = 'N1 語彙テスト 第1回' WHERE id = 'a0000001-0000-4000-a000-000000000011';
UPDATE quizzes SET title = 'N1 語彙テスト 第2回' WHERE id = 'a0000001-0000-4000-a000-000000000012';

-- ============================================
-- 00045_rename_business_quiz_titles.sql
-- ============================================
-- Rename business quiz titles to テスト
UPDATE quizzes SET title = 'IT語彙テスト 第1回' WHERE id = 'b1000001-0000-0000-0000-000000000001';
UPDATE quizzes SET title = 'IT語彙テスト 第2回' WHERE id = 'b1000002-0000-0000-0000-000000000002';
UPDATE quizzes SET title = 'IT語彙テスト 第3回' WHERE id = 'b1000003-0000-0000-0000-000000000003';
UPDATE quizzes SET title = 'IT語彙テスト 第4回' WHERE id = 'b1000004-0000-0000-0000-000000000004';
UPDATE quizzes SET title = 'IT語彙テスト 第5回' WHERE id = 'b1000005-0000-0000-0000-000000000005';
UPDATE quizzes SET title = '文章パターンテスト 第1回' WHERE id = 'b2000001-0000-0000-0000-000000000001';
UPDATE quizzes SET title = '文章パターンテスト 第2回' WHERE id = 'b2000002-0000-0000-0000-000000000002';
UPDATE quizzes SET title = '文章パターンテスト 第3回' WHERE id = 'b2000003-0000-0000-0000-000000000003';
UPDATE quizzes SET title = 'ビジネス表現テスト 第1回' WHERE id = 'b3000001-0000-0000-0000-000000000001';
UPDATE quizzes SET title = 'ビジネス表現テスト 第2回' WHERE id = 'b3000002-0000-0000-0000-000000000002';
UPDATE quizzes SET title = 'ビジネス表現テスト 第3回' WHERE id = 'b3000003-0000-0000-0000-000000000003';

-- ============================================
-- 00046_cs_terms_table.sql
-- ============================================
-- CS知識 用語テーブル (ITパスポート + 基本情報技術者試験)
CREATE TABLE cs_terms (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  term_ja TEXT NOT NULL,
  reading TEXT,
  term_ko TEXT NOT NULL,
  term_en TEXT,
  category TEXT NOT NULL CHECK (category IN (
    'basic_theory','algorithms','data_structures',
    'computer_architecture','database','networking','security'
  )),
  difficulty_level TEXT NOT NULL DEFAULT 'ip' CHECK (difficulty_level IN ('ip', 'fe')),
  description TEXT,
  example_sentence TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_cs_terms_category ON cs_terms(category);
CREATE INDEX idx_cs_terms_difficulty ON cs_terms(difficulty_level);
CREATE INDEX idx_cs_terms_cat_diff ON cs_terms(category, difficulty_level);

ALTER TABLE cs_terms ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone authenticated can view cs_terms"
  ON cs_terms FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Admins can insert cs_terms"
  ON cs_terms FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admins can update cs_terms"
  ON cs_terms FOR UPDATE
  TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admins can delete cs_terms"
  ON cs_terms FOR DELETE
  TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- user_mastered_items に cs_term を追加
ALTER TABLE user_mastered_items DROP CONSTRAINT IF EXISTS user_mastered_items_item_type_check;
ALTER TABLE user_mastered_items ADD CONSTRAINT user_mastered_items_item_type_check
  CHECK (item_type IN ('it_glossary', 'jlpt_vocabulary', 'jlpt_grammar', 'cs_term'));

-- quizzes の quiz_type に cs_knowledge を追加
ALTER TABLE quizzes DROP CONSTRAINT IF EXISTS quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check
  CHECK (quiz_type IN (
    'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening',
    'it_terminology', 'role_play_scenario', 'attitude_culture',
    'core_programming', 'framework', 'sentence_pattern', 'business_expression',
    'cs_knowledge'
  ));

-- ============================================
-- 00047_admin_quiz_attempts_update.sql
-- ============================================
-- Admin/Mentor can update quiz_attempts (for retake approval/denial)
CREATE POLICY "Admins can update all quiz_attempts"
  ON quiz_attempts FOR UPDATE USING (is_admin());

CREATE POLICY "Mentors can update mentee quiz_attempts"
  ON quiz_attempts FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM mentor_mentee_assignments
      WHERE mentor_id = auth.uid() AND mentee_id = quiz_attempts.user_id
    )
  );

-- ============================================
-- 00048_create_tts_cache_bucket.sql
-- ============================================
-- TTS音声キャッシュ用 Storage Bucket
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'tts-cache',
  'tts-cache',
  true,
  5242880, -- 5MB
  ARRAY['audio/mpeg']
)
ON CONFLICT (id) DO NOTHING;

-- 누구나 TTS 캐시 조회 가능 (public bucket)
CREATE POLICY "Public tts cache access"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'tts-cache');

-- 인증된 유저는 TTS 캐시 업로드 가능
CREATE POLICY "Authenticated users can upload tts cache"
  ON storage.objects FOR INSERT
  WITH CHECK (
    bucket_id = 'tts-cache'
    AND auth.role() = 'authenticated'
  );

-- ============================================
-- 00049_add_missing_indexes.sql
-- ============================================
-- 00049_add_missing_indexes.sql
-- Performance indexes identified in architecture analysis (09_refactoring_candidates.md 5.3절)

-- 1. Assessment core query: fetchAllQuestions() filters by quiz_id + is_published + difficulty
CREATE INDEX IF NOT EXISTS idx_quiz_questions_quiz_published_diff
  ON quiz_questions (quiz_id, is_published, difficulty);

-- 2. fetchRandomByCategory() filters by quiz_id + question_category
CREATE INDEX IF NOT EXISTS idx_quiz_questions_quiz_category
  ON quiz_questions (quiz_id, question_category);

-- 3. recalculateUserScores() only queries passed=true exam attempts
CREATE INDEX IF NOT EXISTS idx_coding_exam_attempts_user_passed
  ON coding_exam_attempts (user_id)
  WHERE passed = TRUE;

-- 4. quiz_attempts: retake_request_status filtering (admin tasks page)
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_retake_status
  ON quiz_attempts (retake_request_status)
  WHERE retake_request_status IS NOT NULL;

-- 5. comprehensive_exams: approval workflow queries
CREATE INDEX IF NOT EXISTS idx_comprehensive_exams_status
  ON comprehensive_exams (status)
  WHERE status IN ('requested', 'approved', 'in_progress');

-- 6. learning_assignments: progress check by assigned_to + status
CREATE INDEX IF NOT EXISTS idx_learning_assignments_progress
  ON learning_assignments (assigned_to, status)
  WHERE status != 'completed';

-- ============================================
-- 00050_add_security_manual_mastery_type.sql
-- ============================================
-- user_mastered_items に security_manual を追加
ALTER TABLE user_mastered_items DROP CONSTRAINT IF EXISTS user_mastered_items_item_type_check;
ALTER TABLE user_mastered_items ADD CONSTRAINT user_mastered_items_item_type_check
  CHECK (item_type IN ('it_glossary', 'jlpt_vocabulary', 'jlpt_grammar', 'cs_term', 'security_manual'));

-- ============================================
-- 00051_add_attitude_culture_mastery_types.sql
-- ============================================
-- user_mastered_items に attitude_manual, culture_manual を追加
ALTER TABLE user_mastered_items DROP CONSTRAINT IF EXISTS user_mastered_items_item_type_check;
ALTER TABLE user_mastered_items ADD CONSTRAINT user_mastered_items_item_type_check
  CHECK (item_type IN ('it_glossary', 'jlpt_vocabulary', 'jlpt_grammar', 'cs_term',
         'security_manual', 'attitude_manual', 'culture_manual'));

-- ============================================
-- 00052_mastery_item_id_to_text.sql
-- ============================================
-- item_id を UUID から TEXT に変更
-- マニュアル系 (security_manual, attitude_manual, culture_manual) は
-- テキストID（例: 'work-attitude-sincerity'）を使うため
ALTER TABLE user_mastered_items ALTER COLUMN item_id TYPE TEXT USING item_id::TEXT;

-- ============================================
-- 00053_ranking_rpc.sql
-- ============================================
-- Get a single user's rank efficiently within the DB
-- instead of fetching all profiles to the client.
CREATE OR REPLACE FUNCTION get_user_rank(target_user_id uuid)
RETURNS TABLE(
  overall_rank bigint,
  total_ranked bigint,
  overall_score int,
  japanese_score int,
  programming_score int
) LANGUAGE sql STABLE AS $$
  WITH scored AS (
    SELECT
      p.id,
      CASE WHEN p.is_japanese THEN 200
           ELSE COALESCE(js.jlpt_normalized, 0) + COALESCE(js.it_japanese_normalized, 0)
      END AS jp_score,
      COALESCE(cs.core_normalized, 0) + COALESCE(cs.framework_normalized, 0) AS prog_score
    FROM profiles p
    LEFT JOIN japanese_skills js ON js.user_id = p.id
    LEFT JOIN coding_skills cs  ON cs.user_id = p.id
    WHERE p.role = 'mentee'
      AND (js.updated_at IS NOT NULL OR cs.updated_at IS NOT NULL)
  )
  SELECT
    (SELECT COUNT(*) + 1 FROM scored WHERE (jp_score + prog_score) > s.jp_score + s.prog_score)::bigint AS overall_rank,
    (SELECT COUNT(*)     FROM scored)::bigint AS total_ranked,
    (s.jp_score + s.prog_score) AS overall_score,
    s.jp_score     AS japanese_score,
    s.prog_score   AS programming_score
  FROM scored s
  WHERE s.id = target_user_id;
$$;

-- ============================================
-- 00054_ranking_rpc_include_mentor.sql
-- ============================================
-- Include mentor role in ranking RPC (previously mentee only)
CREATE OR REPLACE FUNCTION get_user_rank(target_user_id uuid)
RETURNS TABLE(
  overall_rank bigint,
  total_ranked bigint,
  overall_score int,
  japanese_score int,
  programming_score int
) LANGUAGE sql STABLE AS $$
  WITH scored AS (
    SELECT
      p.id,
      CASE WHEN p.is_japanese THEN 200
           ELSE COALESCE(js.jlpt_normalized, 0) + COALESCE(js.it_japanese_normalized, 0)
      END AS jp_score,
      COALESCE(cs.core_normalized, 0) + COALESCE(cs.framework_normalized, 0) AS prog_score
    FROM profiles p
    LEFT JOIN japanese_skills js ON js.user_id = p.id
    LEFT JOIN coding_skills cs  ON cs.user_id = p.id
    WHERE p.role IN ('mentee', 'mentor')
      AND (js.updated_at IS NOT NULL OR cs.updated_at IS NOT NULL)
  )
  SELECT
    (SELECT COUNT(*) + 1 FROM scored WHERE (jp_score + prog_score) > s.jp_score + s.prog_score)::bigint AS overall_rank,
    (SELECT COUNT(*)     FROM scored)::bigint AS total_ranked,
    (s.jp_score + s.prog_score) AS overall_score,
    s.jp_score     AS japanese_score,
    s.prog_score   AS programming_score
  FROM scored s
  WHERE s.id = target_user_id;
$$;

-- ============================================
-- 00055_ranking_visibility_fix.sql
-- ============================================
-- Fix ranking visibility: allow all authenticated users to read profiles and
-- skill tables, and fix get_user_rank RPC to filter by actual scores.

-- 1) Allow all authenticated users to read profiles / japanese_skills / coding_skills
--    (needed for ranking page — mentees previously couldn't see other users' data)
--    profiles had "Users can view own profile" (auth.uid() = id) → only self visible
CREATE POLICY "Authenticated can view all profiles"
  ON profiles FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated can view all japanese_skills"
  ON japanese_skills FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated can view all coding_skills"
  ON coding_skills FOR SELECT USING (auth.role() = 'authenticated');

-- 2) Fix get_user_rank RPC: replace "updated_at IS NOT NULL" (always true due to
--    handle_new_user trigger) with actual score > 0 check
CREATE OR REPLACE FUNCTION get_user_rank(target_user_id uuid)
RETURNS TABLE(
  overall_rank bigint,
  total_ranked bigint,
  overall_score int,
  japanese_score int,
  programming_score int
) LANGUAGE sql STABLE AS $$
  WITH scored AS (
    SELECT
      p.id,
      CASE WHEN p.is_japanese THEN 200
           ELSE COALESCE(js.jlpt_normalized, 0) + COALESCE(js.it_japanese_normalized, 0)
      END AS jp_score,
      COALESCE(cs.core_normalized, 0) + COALESCE(cs.framework_normalized, 0) AS prog_score
    FROM profiles p
    LEFT JOIN japanese_skills js ON js.user_id = p.id
    LEFT JOIN coding_skills cs  ON cs.user_id = p.id
    WHERE p.role IN ('mentee', 'mentor')
      AND (
        COALESCE(js.jlpt_normalized, 0) > 0
        OR COALESCE(js.it_japanese_normalized, 0) > 0
        OR COALESCE(cs.core_normalized, 0) > 0
        OR COALESCE(cs.framework_normalized, 0) > 0
      )
  )
  SELECT
    (SELECT COUNT(*) + 1 FROM scored WHERE (jp_score + prog_score) > s.jp_score + s.prog_score)::bigint AS overall_rank,
    (SELECT COUNT(*)     FROM scored)::bigint AS total_ranked,
    (s.jp_score + s.prog_score) AS overall_score,
    s.jp_score     AS japanese_score,
    s.prog_score   AS programming_score
  FROM scored s
  WHERE s.id = target_user_id;
$$;

-- ============================================
-- 00056_add_courses_subcategory.sql
-- ============================================
ALTER TABLE courses ADD COLUMN subcategory TEXT;

-- ============================================
-- 00057_fix_java_course_titles.sql
-- ============================================
-- Fix SILVER-04 course title/description to Japanese
UPDATE courses SET
  title = '例外処理',
  description = '例外階層、処理・伝播戦略、リソース解放パターンを理解し実務で活用する。'
WHERE id = '1a62e5bc-996b-4e1d-a6df-88a1aba2d719';

-- ============================================
-- 00058_add_lesson_content_body_ko.sql
-- ============================================
-- Add Korean translation column for lesson content
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS content_body_ko TEXT;

-- ============================================
-- 00059_merge_silver_courses.sql
-- ============================================
-- Merge JAVA-SILVER-04 (例外処理) into JAVA-SILVER-01 (オブジェクト指向と例外処理)
DO $$ DECLARE silver01_id UUID; silver04_id UUID;
BEGIN
  SELECT id INTO silver01_id FROM courses WHERE subcategory='java' AND sort_order=20;
  SELECT id INTO silver04_id FROM courses WHERE subcategory='java' AND sort_order=40;
  IF silver01_id IS NOT NULL AND silver04_id IS NOT NULL THEN
    -- Move lessons from SILVER-04 to SILVER-01 (offset sort_order to avoid collision)
    UPDATE lessons SET course_id=silver01_id, sort_order=sort_order+5 WHERE course_id=silver04_id;
    -- Migrate enrollments
    INSERT INTO enrollments(user_id, course_id)
      SELECT user_id, silver01_id FROM enrollments WHERE course_id=silver04_id
      ON CONFLICT DO NOTHING;
    DELETE FROM enrollments WHERE course_id=silver04_id;
    -- Update course metadata
    UPDATE courses
      SET title='オブジェクト指向と例外処理',
          description='クラス定義、継承、ポリモーフィズム、インタフェース、例外処理の基本を理解し実務で使いこなす。'
      WHERE id=silver01_id;
    -- Soft-delete old course
    UPDATE courses SET is_published=FALSE WHERE id=silver04_id;
  END IF;
END $$;

