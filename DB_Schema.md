# J-Bridge Database Schema

Supabase (PostgreSQL) 기반 DB 스키마. 총 19개 테이블.

## ERD 개요

```
auth.users (Supabase Auth)
    │
    ▼
profiles ─────────────────────────────────────────────────────────┐
    │                                                             │
    ├── japanese_skills (축1: JLPT + 축2: IT일본어)                │
    ├── coding_skills (축3: Core + 축4: Framework)                 │
    ├── attitude_culture_skills (축5)                              │
    ├── dispatch_readiness_scores (5축 스냅샷)                     │
    │                                                             │
    ├── enrollments ── lesson_progress                            │
    │       │                                                     │
    │       ▼                                                     │
    │   courses ── lessons ── lesson_resources                    │
    │                  │                                          │
    │                  ├── coding_problems ── coding_test_cases   │
    │                  ├── projects ── project_requirements        │
    │                  └── quizzes ── quiz_questions               │
    │                                    └── quiz_question_options │
    │                                                             │
    ├── quiz_attempts ── quiz_answers                             │
    ├── code_submissions ── code_reviews                          │
    │                                                             │
    └── jlpt_vocabulary / it_glossary (콘텐츠 뱅크)               │
```

## 테이블 카테고리

| 카테고리 | 테이블 | 수 |
|---|---|---|
| 사용자 & 스킬 | profiles, japanese_skills, coding_skills, attitude_culture_skills, dispatch_readiness_scores, enrollments, lesson_progress | 7 |
| 콘텐츠 | courses, lessons, lesson_resources, coding_problems, coding_test_cases, projects, project_requirements | 7 |
| 퀴즈 시스템 | quizzes, quiz_questions, quiz_question_options, quiz_attempts, quiz_answers | 5 |
| 코딩 제출 & AI 리뷰 | code_submissions, code_reviews | 2 |
| 일본어 콘텐츠 뱅크 | jlpt_vocabulary, it_glossary | 2 |

---

## SQL Schema

### Extensions

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

---

### 1. profiles

```sql
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
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 2. japanese_skills

```sql
CREATE TABLE japanese_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,

  -- 축1: JLPT 기초 일본어
  jlpt_level TEXT CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1', NULL)),
  vocab_mastery SMALLINT DEFAULT 0 CHECK (vocab_mastery BETWEEN 0 AND 100),
  grammar_mastery SMALLINT DEFAULT 0 CHECK (grammar_mastery BETWEEN 0 AND 100),
  reading_mastery SMALLINT DEFAULT 0 CHECK (reading_mastery BETWEEN 0 AND 100),
  listening_mastery SMALLINT DEFAULT 0 CHECK (listening_mastery BETWEEN 0 AND 100),
  jlpt_normalized SMALLINT DEFAULT 0 CHECK (jlpt_normalized BETWEEN 0 AND 100),

  -- 축2: IT/비즈니스 일본어
  it_terminology_score SMALLINT DEFAULT 0 CHECK (it_terminology_score BETWEEN 0 AND 100),
  doc_reading_score SMALLINT DEFAULT 0 CHECK (doc_reading_score BETWEEN 0 AND 100),
  business_conv_score SMALLINT DEFAULT 0 CHECK (business_conv_score BETWEEN 0 AND 100),
  it_japanese_normalized SMALLINT DEFAULT 0 CHECK (it_japanese_normalized BETWEEN 0 AND 100),

  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 3. coding_skills

```sql
CREATE TABLE coding_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,

  -- 축3: Core Programming
  java_score SMALLINT DEFAULT 0 CHECK (java_score BETWEEN 0 AND 100),
  javascript_score SMALLINT DEFAULT 0 CHECK (javascript_score BETWEEN 0 AND 100),
  sql_score SMALLINT DEFAULT 0 CHECK (sql_score BETWEEN 0 AND 100),
  algorithm_score SMALLINT DEFAULT 0 CHECK (algorithm_score BETWEEN 0 AND 100),
  core_normalized SMALLINT DEFAULT 0 CHECK (core_normalized BETWEEN 0 AND 100),

  -- 축4: Framework/Practical
  spring_boot_score SMALLINT DEFAULT 0 CHECK (spring_boot_score BETWEEN 0 AND 100),
  react_score SMALLINT DEFAULT 0 CHECK (react_score BETWEEN 0 AND 100),
  db_design_score SMALLINT DEFAULT 0 CHECK (db_design_score BETWEEN 0 AND 100),
  project_score SMALLINT DEFAULT 0 CHECK (project_score BETWEEN 0 AND 100),
  framework_normalized SMALLINT DEFAULT 0 CHECK (framework_normalized BETWEEN 0 AND 100),

  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 4. attitude_culture_skills

```sql
CREATE TABLE attitude_culture_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,

  -- 축5: Attitude/Culture
  punctuality_score SMALLINT DEFAULT 0 CHECK (punctuality_score BETWEEN 0 AND 100),
  horenso_score SMALLINT DEFAULT 0 CHECK (horenso_score BETWEEN 0 AND 100),
  teamwork_score SMALLINT DEFAULT 0 CHECK (teamwork_score BETWEEN 0 AND 100),
  business_manner_score SMALLINT DEFAULT 0 CHECK (business_manner_score BETWEEN 0 AND 100),
  attitude_normalized SMALLINT DEFAULT 0 CHECK (attitude_normalized BETWEEN 0 AND 100),

  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 5. dispatch_readiness_scores

```sql
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
```

### 6. courses

```sql
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
```

### 7. lessons

```sql
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
```

### 8. lesson_resources

```sql
CREATE TABLE lesson_resources (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lesson_id UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  resource_type TEXT NOT NULL CHECK (resource_type IN ('pdf', 'audio', 'image', 'link', 'other')),
  resource_url TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 9. enrollments

```sql
CREATE TABLE enrollments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  enrolled_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ,
  progress_pct SMALLINT NOT NULL DEFAULT 0 CHECK (progress_pct BETWEEN 0 AND 100),

  UNIQUE(user_id, course_id)
);
```

### 10. lesson_progress

```sql
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
```

### 11. coding_problems

```sql
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
```

### 12. coding_test_cases

```sql
CREATE TABLE coding_test_cases (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  problem_id UUID NOT NULL REFERENCES coding_problems(id) ON DELETE CASCADE,
  input TEXT NOT NULL,
  expected_output TEXT NOT NULL,
  is_sample BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0
);
```

### 13. projects

```sql
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
```

### 14. project_requirements

```sql
CREATE TABLE project_requirements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  test_class_name TEXT,
  test_method_name TEXT,
  sort_order INTEGER DEFAULT 0
);
```

### 15. quizzes

```sql
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
```

### 16. quiz_questions

```sql
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
```

### 17. quiz_question_options

```sql
CREATE TABLE quiz_question_options (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  option_text TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0
);
```

### 18. quiz_attempts

```sql
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
```

### 19. quiz_answers

```sql
CREATE TABLE quiz_answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  attempt_id UUID NOT NULL REFERENCES quiz_attempts(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  selected_option_id UUID REFERENCES quiz_question_options(id) ON DELETE SET NULL,
  text_answer TEXT,
  is_correct BOOLEAN,
  answered_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 20. code_submissions

```sql
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
```

### 21. code_reviews

```sql
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
```

### 22. jlpt_vocabulary

```sql
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
```

### 23. it_glossary

```sql
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
```

---

## Triggers

### 자동 프로필 + 스킬 테이블 생성 (auth.users INSERT 시)

```sql
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.raw_user_meta_data->>'name', ''),
    COALESCE(NEW.raw_user_meta_data->>'avatar_url', '')
  );

  INSERT INTO japanese_skills (user_id) VALUES (NEW.id);
  INSERT INTO coding_skills (user_id) VALUES (NEW.id);
  INSERT INTO attitude_culture_skills (user_id) VALUES (NEW.id);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();
```

### updated_at 자동 갱신

```sql
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
```

---

## Row Level Security (RLS)

```sql
-- 모든 테이블 RLS 활성화
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

-- profiles: 본인만 읽기/수정
CREATE POLICY "Users can view own profile"
  ON profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update own profile"
  ON profiles FOR UPDATE USING (auth.uid() = id);

-- 스킬 테이블: 본인만 읽기 (수정은 서버 함수 통해서만)
CREATE POLICY "Users can view own japanese_skills"
  ON japanese_skills FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can view own coding_skills"
  ON coding_skills FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can view own attitude_culture_skills"
  ON attitude_culture_skills FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can view own dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR SELECT USING (auth.uid() = user_id);

-- enrollments & lesson_progress: 본인만
CREATE POLICY "Users can view own enrollments"
  ON enrollments FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own enrollments"
  ON enrollments FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can view own lesson_progress"
  ON lesson_progress FOR SELECT USING (
    enrollment_id IN (SELECT id FROM enrollments WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can update own lesson_progress"
  ON lesson_progress FOR UPDATE USING (
    enrollment_id IN (SELECT id FROM enrollments WHERE user_id = auth.uid())
  );

-- 콘텐츠: 인증된 사용자 읽기 가능
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

-- quiz_question_options: is_correct 노출 방지 (별도 뷰 사용 권장)
CREATE POLICY "Authenticated users can view quiz_options"
  ON quiz_question_options FOR SELECT USING (auth.role() = 'authenticated');

-- 퀴즈/코딩 제출: 본인만
CREATE POLICY "Users can view own quiz_attempts"
  ON quiz_attempts FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own quiz_attempts"
  ON quiz_attempts FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can view own quiz_answers"
  ON quiz_answers FOR SELECT USING (
    attempt_id IN (SELECT id FROM quiz_attempts WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can insert own quiz_answers"
  ON quiz_answers FOR INSERT WITH CHECK (
    attempt_id IN (SELECT id FROM quiz_attempts WHERE user_id = auth.uid())
  );
CREATE POLICY "Users can view own code_submissions"
  ON code_submissions FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own code_submissions"
  ON code_submissions FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can view own code_reviews"
  ON code_reviews FOR SELECT USING (
    submission_id IN (SELECT id FROM code_submissions WHERE user_id = auth.uid())
  );

-- 일본어 콘텐츠: 인증된 사용자 읽기 가능
CREATE POLICY "Authenticated users can view jlpt_vocabulary"
  ON jlpt_vocabulary FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view it_glossary"
  ON it_glossary FOR SELECT USING (auth.role() = 'authenticated');
```

---

## 퀴즈 정답 보호 (뷰)

클라이언트에서 `is_correct`가 노출되지 않도록 뷰를 사용:

```sql
CREATE VIEW quiz_question_options_safe AS
SELECT id, question_id, option_text, sort_order
FROM quiz_question_options;
```

---

## DB 네이밍 컨벤션

- 테이블/컬럼: `snake_case`
- Primary Key: `UUID` (uuid_generate_v4())
- Timestamp: `TIMESTAMPTZ` (타임존 포함)
- Boolean: `is_` 접두사 (예: `is_correct`, `is_published`)
- Foreign Key: `{참조테이블_단수}_id` (예: `user_id`, `course_id`)
