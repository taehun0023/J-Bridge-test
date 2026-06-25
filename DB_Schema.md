# J-Bridge Database Schema

Supabase (PostgreSQL) 기반 DB 스키마. 총 48개 테이블 (+ coding_exam_problems junction).

> **Migration 기준:** `00001` ~ `00170` (2026-04 기준 — 인수 시점 최신)
>
> 이후 추가된 마이그레이션은 다음을 포함:
> - `00148`~`00163`: JLPT/BJ/CS 품질 감사 수정 + N5 grammar answer-leak 수정
> - `00164`: shared_vocab 테이블 폐기
> - `00165`~`00169`: 작문(writing_exercises) 시스템 도입 + 한국어 예시 + claims + 설명 수정
> - `00170`: 코딩 학습(coding_learning) 시스템

## ERD 개요

```
auth.users (Supabase Auth)
    │
    ▼
profiles ─────────────────────────────────────────────────────────┐
    │  (+ is_japanese, onboarding_step, coding_rank)              │
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
    │                         │           └── quiz_question_options│
    │                         │           └── question_claims      │
    │                         └── quiz_attempts ── quiz_answers    │
    │                                                             │
    ├── code_submissions ── code_reviews                          │
    ├── coding_skill_exams ── coding_exam_attempts (Paiza식 등급) │
    ├── ranking_seasons ── user_rankings (3개월 시즌 랭킹)         │
    │                                                             │
    ├── mentor_mentee_assignments (멘토↔멘티 매칭)                │
    ├── notifications (범용 알림)                                  │
    │                                                             │
    ├── task_assignments (관리자 과제 배정)                         │
    ├── admin_feedbacks ── feedback_replies (피드백 + 답글)        │
    │                                                             │
    ├── learning_assignments (학습 과제)                           │
    ├── exam_cycles ── comprehensive_exams ── comprehensive_exam_answers │
    ├── content_access_requests (열람 신청)                        │
    ├── user_mastered_items (암기 체크)                            │
    │                                                             │
    ├── jlpt_vocabulary / jlpt_grammar (JLPT 콘텐츠)             │
    ├── jlpt_reading_passages / jlpt_listening_scripts            │
    ├── it_glossary (IT 용어)                                     │
    └── cs_terms (CS 지식 용어)                                   │
```

## 테이블 카테고리

| 카테고리 | 테이블 | 수 |
|---|---|---|
| 사용자 & 스킬 | profiles, japanese_skills, coding_skills, attitude_culture_skills, dispatch_readiness_scores, enrollments, lesson_progress | 7 |
| 콘텐츠 | courses, lessons, lesson_resources, coding_problems, coding_test_cases, projects, project_requirements | 7 |
| 퀴즈 시스템 | quizzes, quiz_questions, quiz_question_options, quiz_attempts, quiz_answers | 5 |
| 코딩 제출 & AI 리뷰 | code_submissions, code_reviews | 2 |
| 일본어 콘텐츠 뱅크 | jlpt_vocabulary, jlpt_grammar, jlpt_reading_passages, jlpt_listening_scripts, it_glossary | 5 |
| CS 지식 콘텐츠 | cs_terms | 1 |
| 코딩 등급 시험 | coding_skill_exams, coding_exam_problems (junction), coding_exam_attempts | 3 |
| 랭킹 시스템 | ranking_seasons, user_rankings | 2 |
| 관리자/멘토 기능 | task_assignments, admin_feedbacks, feedback_replies | 3 |
| 멘토-멘티 & 알림 | mentor_mentee_assignments, notifications | 2 |
| 학습 과제 & 종합 시험 | learning_assignments, exam_cycles, comprehensive_exams, comprehensive_exam_answers | 4 |
| 콘텐츠 접근 & 사용자 인터랙션 | content_access_requests, question_claims, user_mastered_items | 3 |

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

  -- 온보딩 필드
  target_jlpt_level TEXT CHECK (target_jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1', NULL)),
  target_coding_area TEXT CHECK (target_coding_area IN ('java', 'javascript') OR target_coding_area IS NULL),
  coding_rank TEXT DEFAULT 'D' CHECK (coding_rank IN ('S', 'A', 'B', 'C', 'D')),
  is_onboarded BOOLEAN NOT NULL DEFAULT FALSE,

  -- 평가 시스템 (v3)
  is_japanese BOOLEAN NOT NULL DEFAULT FALSE,
  onboarding_step SMALLINT NOT NULL DEFAULT 0,

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

  -- v3 추가 점수
  business_culture_score SMALLINT DEFAULT 0 CHECK (business_culture_score BETWEEN 0 AND 100),
  it_security_score SMALLINT DEFAULT 0 CHECK (it_security_score BETWEEN 0 AND 100),

  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 5. dispatch_readiness_scores

```sql
CREATE TABLE dispatch_readiness_scores (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,

  jlpt_score SMALLINT CHECK (jlpt_score BETWEEN 0 AND 100),               -- nullable (일본인은 NULL)
  it_japanese_score SMALLINT CHECK (it_japanese_score BETWEEN 0 AND 100),  -- nullable (일본인은 NULL)
  core_programming_score SMALLINT NOT NULL CHECK (core_programming_score BETWEEN 0 AND 100),
  framework_score SMALLINT NOT NULL CHECK (framework_score BETWEEN 0 AND 100),
  attitude_culture_score SMALLINT NOT NULL CHECK (attitude_culture_score BETWEEN 0 AND 100),

  overall_score SMALLINT,  -- 트리거로 자동 계산 (비NULL 축의 평균)
  is_japanese BOOLEAN NOT NULL DEFAULT FALSE,

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
    'it_terminology', 'role_play_scenario', 'attitude_culture',
    'core_programming', 'framework',
    'sentence_pattern', 'business_expression',
    'cs_knowledge'
  )),
  passing_score SMALLINT DEFAULT 70 CHECK (passing_score BETWEEN 0 AND 100),
  time_limit_minutes INTEGER,

  -- 평가 시스템 (v3)
  is_assessment BOOLEAN NOT NULL DEFAULT FALSE,
  questions_per_attempt SMALLINT,  -- NULL이면 전 문항 출제
  content_level TEXT,              -- 'N5','N4' 등

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
  sort_order INTEGER DEFAULT 0,

  -- 콘텐츠 관리 (v3)
  difficulty TEXT CHECK (difficulty IN ('easy', 'medium', 'hard')),
  question_category TEXT,     -- 'java','javascript','sql','spring_boot','react','db_design' 등
  is_published BOOLEAN NOT NULL DEFAULT TRUE
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
  completed_at TIMESTAMPTZ,

  -- 재시험 요청 (v3)
  retake_request_status TEXT DEFAULT NULL
    CHECK (retake_request_status IN ('requested', 'approved', 'denied') OR retake_request_status IS NULL),
  retake_requested_at TIMESTAMPTZ,
  retake_approved_at TIMESTAMPTZ
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

### 23. jlpt_grammar

```sql
CREATE TABLE jlpt_grammar (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  pattern TEXT NOT NULL,
  meaning_ko TEXT NOT NULL,
  meaning_ja TEXT NOT NULL,
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  formation TEXT NOT NULL,
  formation_detail TEXT,
  category TEXT CHECK (category IN (
    'permission', 'obligation', 'desire', 'ability', 'condition',
    'reason', 'contrast', 'conjecture', 'change', 'degree',
    'time', 'manner', 'listing', 'emphasis', 'formal'
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
```

### 24. jlpt_reading_passages

```sql
CREATE TABLE jlpt_reading_passages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  passage TEXT NOT NULL,
  passage_type TEXT NOT NULL CHECK (passage_type IN (
    'notice', 'email', 'article', 'advertisement',
    'instruction', 'essay', 'letter', 'report'
  )),
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
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
```

### 25. jlpt_listening_scripts

```sql
CREATE TABLE jlpt_listening_scripts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  script TEXT NOT NULL,
  script_type TEXT NOT NULL CHECK (script_type IN (
    'dialogue', 'monologue', 'announcement',
    'instruction', 'meeting', 'phone_call'
  )),
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  speakers TEXT[],
  situation TEXT,
  vocabulary_notes JSONB NOT NULL DEFAULT '[]',
  translation_ko TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_listening_level ON jlpt_listening_scripts(jlpt_level);
CREATE INDEX idx_jlpt_listening_type ON jlpt_listening_scripts(script_type);
```

### 26. it_glossary

```sql
CREATE TABLE it_glossary (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  term_ja TEXT NOT NULL,
  reading TEXT,
  term_ko TEXT NOT NULL,
  term_en TEXT,
  category TEXT NOT NULL CHECK (category IN (
    'development', 'testing', 'design_doc', 'infrastructure',
    'project_management', 'business',
    'expression', 'sentence_pattern'
  )),
  subcategory TEXT,
  description TEXT,
  example_sentence TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_it_glossary_category ON it_glossary(category);
CREATE INDEX idx_it_glossary_subcategory ON it_glossary(subcategory);
```

### 27. cs_terms

CS 지식 용어 테이블 (ITパスポート + 基本情報技術者試験).

```sql
CREATE TABLE cs_terms (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  term_ja TEXT NOT NULL,
  reading TEXT,
  term_ko TEXT NOT NULL,
  term_en TEXT,
  category TEXT NOT NULL CHECK (category IN (
    'basic_theory', 'algorithms', 'data_structures',
    'computer_architecture', 'database', 'networking', 'security'
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
```

---

### 28. coding_skill_exams

Paiza식 등급 시험 세트 정의. 각 등급(S/A/B/C/D)별로 시험 세트를 구성한다.

```sql
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

-- 등급 시험 ↔ 코딩 문제 연결 (M:N junction)
CREATE TABLE coding_exam_problems (
  exam_id UUID NOT NULL REFERENCES coding_skill_exams(id) ON DELETE CASCADE,
  problem_id UUID NOT NULL REFERENCES coding_problems(id) ON DELETE CASCADE,
  sort_order INTEGER DEFAULT 0,
  points SMALLINT NOT NULL DEFAULT 10,
  PRIMARY KEY (exam_id, problem_id)
);
```

### 29. coding_exam_attempts

유저의 등급 시험 도전 기록.

```sql
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
```

### 30. ranking_seasons

3개월 시즌 관리.

```sql
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
```

### 31. user_rankings

시즌별 유저 랭킹 스냅샷.

```sql
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
```

### 32. task_assignments

관리자가 사원에게 과제를 배정.

```sql
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
```

### 33. admin_feedbacks

관리자/멘토가 사원에게 남기는 피드백.

```sql
CREATE TABLE admin_feedbacks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  admin_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,

  category TEXT NOT NULL DEFAULT 'seikatsu' CHECK (category IN (
    'seikatsu', 'business_jp', 'cs', 'dev', 'business_lit'
  )),
  content TEXT NOT NULL,

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_admin_feedbacks_user ON admin_feedbacks(user_id, created_at DESC);
```

### 34. feedback_replies

피드백에 대한 답글 (쌍방향 소통).

```sql
CREATE TABLE feedback_replies (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  feedback_id UUID NOT NULL REFERENCES admin_feedbacks(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_feedback_replies_feedback ON feedback_replies(feedback_id, created_at ASC);
```

### 35. mentor_mentee_assignments

멘토↔멘티 매칭 관리.

```sql
CREATE TABLE mentor_mentee_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  mentor_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  mentee_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  assigned_by UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(mentor_id, mentee_id)
);
```

### 36. notifications

범용 알림 테이블.

```sql
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  type TEXT NOT NULL,  -- 'task_assigned','exam_requested','exam_approved','exam_denied','exam_completed' 등
  title TEXT NOT NULL,
  message TEXT,
  link TEXT,             -- 클릭 시 이동 경로
  is_read BOOLEAN NOT NULL DEFAULT FALSE,
  related_id UUID,       -- 관련 오브젝트 ID
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_notifications_user ON notifications(user_id, is_read, created_at DESC);
```

### 37. learning_assignments

학습 과제 (카테고리/서브카테고리/레벨 지정).

```sql
CREATE TABLE learning_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  assigned_by UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  assigned_to UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  category TEXT NOT NULL,      -- 'seikatsu','business-jp','cs','dev','business-lit'
  subcategory TEXT NOT NULL,   -- 'vocabulary','grammar','reading','listening','java' 등
  content_level TEXT,          -- 'N5','N4'... or null
  title TEXT NOT NULL,
  description TEXT,
  due_date TIMESTAMPTZ,
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'in_progress', 'completed')),
  required_quiz_ids UUID[] DEFAULT '{}',
  passed_quiz_ids UUID[] DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE INDEX idx_learning_assignments_assignee ON learning_assignments(assigned_to, status);
```

### 38a. exam_cycles

시험 사이클 추적 (유저별 2주 간격 종합시험 스케줄링).

```sql
CREATE TABLE exam_cycles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  cycle_number SMALLINT NOT NULL DEFAULT 1,
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'in_progress', 'completed', 'expired')),
  scheduled_at TIMESTAMPTZ NOT NULL,
  deadline_at TIMESTAMPTZ NOT NULL,
  completed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(user_id, cycle_number)
);

CREATE INDEX idx_exam_cycles_user_status ON exam_cycles(user_id, status);
```

- `cycle_number=1`: 입사 후 첫 시험 (온보딩 완료 시 자동 생성)
- 이후 2주마다 새 사이클 자동 생성 (대시보드 접속 시 체크)
- 사이클 내 모든 시험 완료 시 `status='completed'`

### 38b. comprehensive_exams

종합 시험 (카테고리별 시험). 사이클 기반 자동 생성 또는 수동 요청.

```sql
CREATE TABLE comprehensive_exams (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  category TEXT NOT NULL,
  subcategory TEXT NOT NULL,
  content_level TEXT,
  status TEXT NOT NULL DEFAULT 'requested'
    CHECK (status IN ('requested', 'approved', 'denied', 'in_progress', 'completed', 'failed')),
  exam_cycle_id UUID REFERENCES exam_cycles(id) ON DELETE SET NULL,
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
CREATE INDEX idx_comprehensive_exams_cycle ON comprehensive_exams(exam_cycle_id);
```

- `exam_cycle_id`: 사이클 기반 시험일 때 설정 (자동 생성, status='approved')
- `exam_cycle_id IS NULL`: 수동 요청 시험 (기존 request→approve 플로우)

### 39. comprehensive_exam_answers

종합 시험 답안.

```sql
CREATE TABLE comprehensive_exam_answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  exam_id UUID NOT NULL REFERENCES comprehensive_exams(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES quiz_questions(id),
  selected_option_id UUID REFERENCES quiz_question_options(id),
  is_correct BOOLEAN,
  answered_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 40. content_access_requests

열람 신청 테이블.

```sql
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

CREATE UNIQUE INDEX idx_unique_pending_request
  ON content_access_requests(user_id, content_category) WHERE status = 'pending';
```

### 41. question_claims

시험 문제 이의 제기.

```sql
CREATE TABLE question_claims (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  claim_reason TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(question_id, user_id)
);
```

### 42. user_mastered_items

암기/마스터리 체크.

```sql
CREATE TABLE user_mastered_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  item_type TEXT NOT NULL CHECK (item_type IN ('it_glossary', 'jlpt_vocabulary', 'jlpt_grammar', 'cs_term')),
  item_id UUID NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(user_id, item_type, item_id)
);

CREATE INDEX idx_user_mastered_user ON user_mastered_items(user_id, item_type);
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

-- 적용 테이블:
-- profiles, japanese_skills, coding_skills, attitude_culture_skills,
-- courses, lessons, feedback_replies, content_access_requests
```

### dispatch_readiness_scores overall_score 자동 계산

비NULL 축의 평균을 자동 계산 (일본인 사용자는 JLPT/IT일본어가 NULL).

```sql
CREATE OR REPLACE FUNCTION compute_dispatch_overall_score()
RETURNS TRIGGER AS $$
DECLARE
  total INT := 0;
  cnt INT := 0;
BEGIN
  IF NEW.jlpt_score IS NOT NULL THEN total := total + NEW.jlpt_score; cnt := cnt + 1; END IF;
  IF NEW.it_japanese_score IS NOT NULL THEN total := total + NEW.it_japanese_score; cnt := cnt + 1; END IF;
  IF NEW.core_programming_score IS NOT NULL THEN total := total + NEW.core_programming_score; cnt := cnt + 1; END IF;
  IF NEW.framework_score IS NOT NULL THEN total := total + NEW.framework_score; cnt := cnt + 1; END IF;
  IF NEW.attitude_culture_score IS NOT NULL THEN total := total + NEW.attitude_culture_score; cnt := cnt + 1; END IF;

  NEW.overall_score := CASE WHEN cnt > 0 THEN total / cnt ELSE NULL END;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER compute_overall_before_insert
  BEFORE INSERT OR UPDATE ON dispatch_readiness_scores
  FOR EACH ROW EXECUTE FUNCTION compute_dispatch_overall_score();
```

---

## Helper Functions

```sql
-- 현재 유저가 admin인지 확인
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- 현재 유저가 mentor인지 확인
CREATE OR REPLACE FUNCTION is_mentor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role = 'mentor'
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- admin 또는 mentor 확인
CREATE OR REPLACE FUNCTION is_admin_or_mentor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role IN ('admin', 'mentor')
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- 특정 유저의 멘토인지 확인
CREATE OR REPLACE FUNCTION is_mentor_of(target_user_id UUID)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM mentor_mentee_assignments
    WHERE mentor_id = auth.uid() AND mentee_id = target_user_id
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;
```

---

## Views

```sql
-- 퀴즈 정답 보호 (클라이언트에서 is_correct 노출 방지)
CREATE VIEW quiz_question_options_safe AS
SELECT id, question_id, option_text, sort_order
FROM quiz_question_options;
```

---

## Indexes 총정리

| 인덱스 | 테이블 | 칼럼/조건 |
|---|---|---|
| idx_dispatch_readiness_user_date | dispatch_readiness_scores | (user_id, recorded_at DESC) |
| idx_lessons_course | lessons | (course_id, sort_order) |
| idx_quiz_attempts_user | quiz_attempts | (user_id, quiz_id) |
| idx_code_submissions_user | code_submissions | (user_id, submitted_at DESC) |
| idx_jlpt_vocabulary_level | jlpt_vocabulary | (jlpt_level) |
| idx_jlpt_grammar_level | jlpt_grammar | (jlpt_level) |
| idx_jlpt_grammar_category | jlpt_grammar | (category) |
| idx_jlpt_reading_level | jlpt_reading_passages | (jlpt_level) |
| idx_jlpt_reading_type | jlpt_reading_passages | (passage_type) |
| idx_jlpt_listening_level | jlpt_listening_scripts | (jlpt_level) |
| idx_jlpt_listening_type | jlpt_listening_scripts | (script_type) |
| idx_it_glossary_category | it_glossary | (category) |
| idx_it_glossary_subcategory | it_glossary | (subcategory) |
| idx_cs_terms_category | cs_terms | (category) |
| idx_cs_terms_difficulty | cs_terms | (difficulty_level) |
| idx_cs_terms_cat_diff | cs_terms | (category, difficulty_level) |
| idx_coding_exam_attempts_user | coding_exam_attempts | (user_id, started_at DESC) |
| idx_ranking_seasons_active | ranking_seasons | (is_active) WHERE is_active = TRUE |
| idx_user_rankings_season | user_rankings | (season_id, overall_rank) |
| idx_task_assignments_assignee | task_assignments | (assigned_to, status) |
| idx_task_assignments_assigner | task_assignments | (assigned_by, created_at DESC) |
| idx_admin_feedbacks_user | admin_feedbacks | (user_id, created_at DESC) |
| idx_feedback_replies_feedback | feedback_replies | (feedback_id, created_at ASC) |
| idx_notifications_user | notifications | (user_id, is_read, created_at DESC) |
| idx_learning_assignments_assignee | learning_assignments | (assigned_to, status) |
| idx_comprehensive_exams_user | comprehensive_exams | (user_id, status) |
| idx_unique_pending_request | content_access_requests | (user_id, content_category) WHERE status = 'pending' |
| idx_user_mastered_user | user_mastered_items | (user_id, item_type) |
| idx_quiz_questions_quiz_published_diff | quiz_questions | (quiz_id, is_published, difficulty) |
| idx_quiz_questions_quiz_category | quiz_questions | (quiz_id, question_category) |
| idx_coding_exam_attempts_user_passed | coding_exam_attempts | (user_id) WHERE passed = TRUE |
| idx_quiz_attempts_retake_status | quiz_attempts | (retake_request_status) WHERE retake_request_status IS NOT NULL |
| idx_comprehensive_exams_status | comprehensive_exams | (status) WHERE status IN ('requested','approved','in_progress') |
| idx_learning_assignments_progress | learning_assignments | (assigned_to, status) WHERE status != 'completed' |

---

## DB 네이밍 컨벤션

- 테이블/컬럼: `snake_case`
- Primary Key: `UUID` (uuid_generate_v4() 또는 gen_random_uuid())
- Timestamp: `TIMESTAMPTZ` (타임존 포함)
- Boolean: `is_` 접두사 (예: `is_correct`, `is_published`)
- Foreign Key: `{참조테이블_단수}_id` (예: `user_id`, `course_id`)
- CHECK 제약조건: `{테이블}_{컬럼}_check` 형태
- Index: `idx_{테이블}_{용도}` 형태
