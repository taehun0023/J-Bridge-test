# 04. 데이터 아키텍처 (Data Architecture)

> **J-Bridge** - 일본 IT 엔지니어 파견 플랫폼 LMS
> 최종 갱신: 2026-02-13
> 스키마 버전: Migration 00001 ~ 00048

---

## 목차

1. [마이그레이션 진화 분석 (6 Phase)](#1-마이그레이션-진화-분석-6-phase)
2. [테이블 전체 인벤토리 (42 테이블)](#2-테이블-전체-인벤토리-42-테이블)
3. [전체 ASCII ERD](#3-전체-ascii-erd)
4. [트랜잭션 경계 분석](#4-트랜잭션-경계-분석)
5. [인덱스 전략](#5-인덱스-전략)
6. [Seed 구조 분석](#6-seed-구조-분석)
7. [스키마 갭 분석](#7-스키마-갭-분석)
8. [타 문서 참조](#8-타-문서-참조)

---

## 1. 마이그레이션 진화 분석 (6 Phase)

48개 마이그레이션 파일을 설계 의도에 따라 6개 Phase로 분류한다.

### 1.1 Phase 분류표

| Phase | 마이그레이션 범위 | 주요 변경 | 설계 의도 |
|:-----:|:-----|:-----|:-----|
| **Phase 1** | 00001 ~ 00014 | Extensions, profiles, 3개 스킬 테이블, dispatch_readiness, courses/lessons, coding/quiz 테이블, enrollments, triggers, RLS, views | **Core Foundation** - 29개 기본 테이블 + RLS + trigger 구축. LMS의 핵심 도메인(유저, 콘텐츠, 퀴즈, 코딩) 확립 |
| **Phase 2** | 00015 ~ 00020 | coding_skill_exams, coding_exam_attempts, ranking_seasons, user_rankings, task_assignments, admin_feedbacks, Admin RLS, 신규 테이블 triggers | **등급 시험 + 랭킹 + 관리자** - Paiza식 코딩 등급(S~D) 시험 시스템, 3개월 시즌 랭킹, Admin CRUD/배정/피드백 기능 추가 |
| **Phase 3** | 00021 ~ 00028 | UPDATE RLS 보완, 종합 RLS 수정, handle_new_user trigger 수정, avatars bucket, Assessment 시스템, 문항 카테고리 태깅, Admin UPDATE policy, Assessment 구조조정(is_japanese, retake) | **안정화 + Assessment** - 실 운영에서 발견된 RLS 누락 보수, 온보딩 Assessment 퀴즈(5축 진단), 일본인/한국인 분기 처리 |
| **Phase 4** | 00029 ~ 00036 | content_access_requests, Mentor RLS, jlpt_grammar, jlpt_reading_passages, jlpt_listening_scripts, mentor_mentee_assignments, notifications, learning_assignments, comprehensive_exams, comprehensive_exam_answers, question_claims | **콘텐츠 확장 + 멘토링** - JLPT 문법/독해/청해 콘텐츠 테이블, 멘토-멘티 매칭, 학습 과제, 종합시험, 알림 시스템 |
| **Phase 5** | 00037 ~ 00041 | quiz_questions.is_published, question_claims.claim_reason, feedback_replies, admin_feedbacks 카테고리 변경(5축), it_glossary 카테고리 확장(expression, sentence_pattern), user_mastered_items | **콘텐츠 관리 고도화** - 문항 공개/비공개, 양방향 피드백(replies), 암기 체크 시스템, IT 용어 카테고리 확장 |
| **Phase 6** | 00042 ~ 00048 | 퀴즈 타이틀 한->일 변환, quiz_type 확장(business_expression, sentence_pattern, cs_knowledge), cs_terms 테이블, Admin/Mentor quiz_attempts UPDATE, tts-cache bucket | **CS 지식 + 국제화** - CS 용어(ITパスポート/基本情報) 테이블, 비즈니스 퀴즈 타입, TTS 음성 캐시 Storage |

### 1.2 진화 타임라인

```
Phase 1 (00001-00014)         Phase 2 (00015-00020)       Phase 3 (00021-00028)
 Core Foundation               등급 + 랭킹 + Admin          안정화 + Assessment
 ========================      ====================        ====================
 - 29 tables                   - coding_skill_exams        - RLS gap 보수 (5건)
 - 23 RLS policies             - coding_exam_attempts      - handle_new_user 3차 수정
 - 2 trigger functions         - ranking_seasons           - avatars bucket
 - 1 view                      - user_rankings             - Assessment system
 - uuid-ossp extension         - task_assignments          - is_japanese 분기
                                - admin_feedbacks           - Retake request
                                - coding_exam_problems      - question_category 태깅
                                - is_admin() helper
         |                              |                           |
         v                              v                           v
Phase 4 (00029-00036)         Phase 5 (00037-00041)       Phase 6 (00042-00048)
 콘텐츠 확장 + 멘토링           콘텐츠 관리 고도화             CS 지식 + 국제화
 ========================      ====================        ====================
 - content_access_requests     - is_published flag         - cs_terms table
 - Mentor RLS + helpers        - feedback_replies          - quiz_type 확장 (3종)
 - jlpt_grammar                - 카테고리 5축 변경          - 퀴즈 타이틀 JP 변환
 - jlpt_reading_passages       - it_glossary 확장          - Admin/Mentor UPDATE
 - jlpt_listening_scripts      - user_mastered_items       - tts-cache bucket
 - mentor_mentee_assignments
 - notifications
 - learning_assignments
 - comprehensive_exams
 - comprehensive_exam_answers
 - question_claims
```

### 1.3 주요 설계 전환점

| 전환점 | 마이그레이션 | 설명 |
|:------|:-----|:-----|
| **RLS 보수 3연타** | 00021 ~ 00023 | 실제 Server Action 운영 시 발견된 UPDATE/INSERT policy 누락을 3회에 걸쳐 수정. SECURITY DEFINER + `SET search_path = public` 패턴 확립 |
| **Assessment 도입** | 00025, 00028 | 온보딩 5축 진단 퀴즈 시스템 추가. `is_assessment`, `questions_per_attempt`, `onboarding_step` 도입. is_japanese 분기로 일본인 사원 고려 |
| **Mentor 역할 확립** | 00030, 00034-00035 | `is_mentor()`, `is_admin_or_mentor()`, `is_mentor_of()` helper 함수로 3-tier 권한 모델 완성 |
| **종합시험 체계** | 00034 | comprehensive_exams + comprehensive_exam_answers로 카테고리별 종합시험. 기존 coding_skill_exams와 별도 체계 |
| **Feedback 양방향화** | 00038 | feedback_replies 추가로 Admin/Mentor -> Mentee 일방향에서 양방향 피드백으로 전환 |

---

## 2. 테이블 전체 인벤토리 (42 테이블)

DB_Schema.md에 기록된 29개 + 마이그레이션에서 추가된 13개 = **총 42개 테이블** (+ 1 View, 2 Storage Buckets).

### 2.1 카테고리별 분류

| # | 테이블명 | 카테고리 | 컬럼 수 | PK | 주요 FK | RLS | 생성 마이그레이션 |
|:-:|:-----|:-----|:--:|:--:|:-----|:--:|:-----|
| 1 | `profiles` | User | 18 | id (UUID, auth.users FK) | auth.users(id) | O | 00002 |
| 2 | `japanese_skills` | User/Skills | 11 | UUID | profiles(id) | O | 00003 |
| 3 | `coding_skills` | User/Skills | 12 | UUID | profiles(id) | O | 00003 |
| 4 | `attitude_culture_skills` | User/Skills | 9 | UUID | profiles(id) | O | 00003 |
| 5 | `dispatch_readiness_scores` | User/Skills | 9 | UUID | profiles(id) | O | 00004 |
| 6 | `courses` | Content | 10 | UUID | profiles(id) | O | 00005 |
| 7 | `lessons` | Content | 10 | UUID | courses(id) | O | 00005 |
| 8 | `lesson_resources` | Content | 6 | UUID | lessons(id) | O | 00005 |
| 9 | `coding_problems` | Coding | 10 | UUID | lessons(id) | O | 00006 |
| 10 | `coding_test_cases` | Coding | 5 | UUID | coding_problems(id) | O | 00006 |
| 11 | `projects` | Coding | 7 | UUID | lessons(id) | O | 00006 |
| 12 | `project_requirements` | Coding | 5 | UUID | projects(id) | O | 00006 |
| 13 | `quizzes` | Quiz | 9 | UUID | lessons(id) | O | 00007 |
| 14 | `quiz_questions` | Quiz | 11 | UUID | quizzes(id) | O | 00007 |
| 15 | `quiz_question_options` | Quiz | 4 | UUID | quiz_questions(id) | O | 00007 |
| 16 | `quiz_attempts` | Quiz | 9 | UUID | profiles(id), quizzes(id) | O | 00008 |
| 17 | `quiz_answers` | Quiz | 6 | UUID | quiz_attempts(id), quiz_questions(id) | O | 00008 |
| 18 | `code_submissions` | Coding | 12 | UUID | profiles(id), coding_problems(id), projects(id) | O | 00009 |
| 19 | `code_reviews` | Coding | 6 | UUID | code_submissions(id) | O | 00009 |
| 20 | `jlpt_vocabulary` | Japanese | 9 | UUID | - | O | 00010 |
| 21 | `it_glossary` | Japanese | 9 | UUID | - | O | 00010 |
| 22 | `enrollments` | User | 5 | UUID | profiles(id), courses(id) | O | 00011 |
| 23 | `lesson_progress` | User | 7 | UUID | enrollments(id), lessons(id) | O | 00011 |
| 24 | `coding_skill_exams` | Exam | 10 | UUID | - | O | 00015 |
| 25 | `coding_exam_problems` | Exam (Junction) | 4 | Composite (exam_id, problem_id) | coding_skill_exams(id), coding_problems(id) | O | 00015 |
| 26 | `coding_exam_attempts` | Exam | 7 | UUID | profiles(id), coding_skill_exams(id) | O | 00016 |
| 27 | `ranking_seasons` | Ranking | 5 | UUID | - | O | 00017 |
| 28 | `user_rankings` | Ranking | 11 | UUID | ranking_seasons(id), profiles(id) | O | 00017 |
| 29 | `task_assignments` | Admin | 10 | UUID | profiles(id) x2 | O | 00018 |
| 30 | `admin_feedbacks` | Admin | 6 | UUID | profiles(id) x2 | O | 00018 |
| 31 | `content_access_requests` | Admin | 10 | UUID | profiles(id) x2 | O | 00029 |
| 32 | `jlpt_grammar` | Japanese | 12 | UUID | - | O | 00031 |
| 33 | `jlpt_reading_passages` | Japanese | 10 | UUID | - | O | 00032 |
| 34 | `jlpt_listening_scripts` | Japanese | 10 | UUID | - | O | 00033 |
| 35 | `mentor_mentee_assignments` | Mentor | 4 | UUID | profiles(id) x3 | O | 00034 |
| 36 | `notifications` | System | 8 | UUID | profiles(id) | O | 00034 |
| 37 | `learning_assignments` | Mentor | 12 | UUID | profiles(id) x2 | O | 00034 |
| 38 | `comprehensive_exams` | Exam | 14 | UUID | profiles(id) x2 | O | 00034 |
| 39 | `comprehensive_exam_answers` | Exam | 5 | UUID | comprehensive_exams(id), quiz_questions(id) | O | 00034 |
| 40 | `feedback_replies` | Admin | 5 | UUID | admin_feedbacks(id), profiles(id) | O | 00038 |
| 41 | `user_mastered_items` | User | 5 | UUID | auth.users(id) | O | 00041 |
| 42 | `cs_terms` | Japanese/CS | 10 | UUID | - | O | 00046 |

### 2.2 View 목록

| View 명 | 기반 테이블 | 목적 | 생성 마이그레이션 |
|:-----|:-----|:-----|:-----|
| `quiz_question_options_safe` | quiz_question_options | `is_correct` 필드 제외하여 클라이언트 노출 방지 | 00014 |

### 2.3 Storage Buckets

| Bucket | Public | 파일 크기 제한 | 허용 MIME | 생성 마이그레이션 |
|:-----|:--:|:--:|:-----|:-----|
| `avatars` | O | 5MB | image/jpeg, png, gif, webp | 00024 |
| `tts-cache` | O | 5MB | audio/mpeg | 00048 |

### 2.4 Helper Functions

| 함수명 | 반환 | 용도 | SECURITY | 생성 |
|:-----|:--:|:-----|:--:|:-----|
| `handle_new_user()` | TRIGGER | auth.users INSERT 시 profiles + 3개 스킬 테이블 자동 생성 | DEFINER | 00012 (00023, 00027 수정) |
| `update_updated_at()` | TRIGGER | updated_at 자동 갱신 | - | 00012 |
| `is_admin()` | BOOLEAN | 현재 유저 admin 여부 | DEFINER | 00019 (00035 재정의) |
| `is_mentor()` | BOOLEAN | 현재 유저 mentor 여부 | DEFINER | 00030 (00038 재정의) |
| `is_admin_or_mentor()` | BOOLEAN | admin 또는 mentor 여부 | DEFINER | 00030 |
| `is_mentor_of(target_user_id)` | BOOLEAN | 특정 멘티의 멘토 여부 | DEFINER | 00035 |
| `compute_dispatch_overall_score()` | TRIGGER | dispatch_readiness_scores.overall_score 자동 계산 (NULL축 제외 평균) | - | 00028 |

---

## 3. 전체 ASCII ERD

### 3.1 Domain-Clustered ERD

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│                              auth.users (Supabase Auth)                              │
│                                       │                                              │
│                                       │ 1:1 (ON DELETE CASCADE)                      │
│                                       ▼                                              │
│  ┌─────────────────────────────── profiles ──────────────────────────────────┐       │
│  │ id, email, full_name, role, coding_rank, is_japanese, onboarding_step    │       │
│  └────┬────────┬────────┬────────┬────────┬────────┬────────┬───────────────┘       │
│       │        │        │        │        │        │        │                         │
│       │        │        │        │        │        │        │                         │
│  ┌────┴────────┴────────┴────┐   │        │        │        │                         │
│  │    User & Skills Domain    │   │        │        │        │                         │
│  │                            │   │        │        │        │                         │
│  │  ┌──────────────────┐     │   │        │        │        │                         │
│  │  │ japanese_skills   │     │   │        │        │        │                         │
│  │  │ (1:1 user_id)     │     │   │        │        │        │                         │
│  │  └──────────────────┘     │   │        │        │        │                         │
│  │  ┌──────────────────┐     │   │        │        │        │                         │
│  │  │ coding_skills     │     │   │        │        │        │                         │
│  │  │ (1:1 user_id)     │     │   │        │        │        │                         │
│  │  └──────────────────┘     │   │        │        │        │                         │
│  │  ┌────────────────────┐   │   │        │        │        │                         │
│  │  │attitude_culture    │   │   │        │        │        │                         │
│  │  │_skills (1:1)       │   │   │        │        │        │                         │
│  │  └────────────────────┘   │   │        │        │        │                         │
│  │  ┌────────────────────┐   │   │        │        │        │                         │
│  │  │dispatch_readiness  │   │   │        │        │        │                         │
│  │  │_scores (1:N)       │   │   │        │        │        │                         │
│  │  └────────────────────┘   │   │        │        │        │                         │
│  │  ┌──────────────────┐     │   │        │        │        │                         │
│  │  │user_mastered_items│     │   │        │        │        │                         │
│  │  │(1:N auth.users)   │     │   │        │        │        │                         │
│  │  └──────────────────┘     │   │        │        │        │                         │
│  └───────────────────────────┘   │        │        │        │                         │
│                                   │        │        │        │                         │
│  ┌────────────────────────────────┴──┐     │        │        │                         │
│  │       Content Domain               │     │        │        │                         │
│  │                                    │     │        │        │                         │
│  │  courses ◄── instructor_id         │     │        │        │                         │
│  │    │ 1:N                           │     │        │        │                         │
│  │    ▼                               │     │        │        │                         │
│  │  lessons                           │     │        │        │                         │
│  │    │ 1:N          │ 1:N    │ 1:N   │     │        │        │                         │
│  │    ▼              ▼        ▼       │     │        │        │                         │
│  │  lesson_      coding_   quizzes    │     │        │        │                         │
│  │  resources    problems     │ 1:N   │     │        │        │                         │
│  │               │ 1:N       ▼       │     │        │        │                         │
│  │               ▼       quiz_       │     │        │        │                         │
│  │           coding_     questions    │     │        │        │                         │
│  │           test_cases    │ 1:N     │     │        │        │                         │
│  │                         ▼         │     │        │        │                         │
│  │  projects           quiz_question │     │        │        │                         │
│  │    │ 1:N            _options      │     │        │        │                         │
│  │    ▼                              │     │        │        │                         │
│  │  project_requirements             │     │        │        │                         │
│  └───────────────────────────────────┘     │        │        │                         │
│                                             │        │        │                         │
│  ┌──────────────────────────────────────────┴──┐     │        │                         │
│  │          Quiz & Assessment Domain            │     │        │                         │
│  │                                              │     │        │                         │
│  │  quiz_attempts ◄── user_id, quiz_id          │     │        │                         │
│  │    │ 1:N                                     │     │        │                         │
│  │    ▼                                         │     │        │                         │
│  │  quiz_answers ── question_id ──► quiz_questions    │        │                         │
│  │                                              │     │        │                         │
│  │  comprehensive_exams ◄── user_id             │     │        │                         │
│  │    │ 1:N                                     │     │        │                         │
│  │    ▼                                         │     │        │                         │
│  │  comprehensive_exam_answers                  │     │        │                         │
│  │    ├── question_id ──► quiz_questions         │     │        │                         │
│  │    └── selected_option_id ──► quiz_options    │     │        │                         │
│  │                                              │     │        │                         │
│  │  question_claims ◄── user_id, question_id    │     │        │                         │
│  └──────────────────────────────────────────────┘     │        │                         │
│                                                        │        │                         │
│  ┌─────────────────────────────────────────────────────┴──┐     │                         │
│  │              Code Submission Domain                     │     │                         │
│  │                                                        │     │                         │
│  │  code_submissions ◄── user_id, problem_id, project_id  │     │                         │
│  │    │ 1:N                                               │     │                         │
│  │    ▼                                                   │     │                         │
│  │  code_reviews                                          │     │                         │
│  └────────────────────────────────────────────────────────┘     │                         │
│                                                                  │                         │
│  ┌───────────────────────────────────────────────────────────────┴──┐                     │
│  │                    Exam & Ranking Domain                          │                     │
│  │                                                                  │                     │
│  │  coding_skill_exams                   ranking_seasons             │                     │
│  │    │ 1:N                                │ 1:N                     │                     │
│  │    ├──► coding_exam_problems ◄── coding_problems                  │                     │
│  │    │    (M:N Junction)                  │                         │                     │
│  │    ▼                                    ▼                         │                     │
│  │  coding_exam_attempts ◄── user_id   user_rankings ◄── user_id    │                     │
│  └──────────────────────────────────────────────────────────────────┘                     │
│                                                                                            │
│  ┌───────────────────────────────────────────────────────────────────┐                     │
│  │                Japanese Content Bank Domain                       │                     │
│  │                                                                   │                     │
│  │  jlpt_vocabulary    it_glossary    jlpt_grammar                   │                     │
│  │  jlpt_reading_passages    jlpt_listening_scripts    cs_terms      │                     │
│  │  (모두 독립 테이블, FK 없음 - 참조 데이터)                         │                     │
│  └───────────────────────────────────────────────────────────────────┘                     │
│                                                                                            │
│  ┌───────────────────────────────────────────────────────────────────┐                     │
│  │                 Admin & Mentor Domain                              │                     │
│  │                                                                   │                     │
│  │  task_assignments ◄── assigned_by, assigned_to (profiles)         │                     │
│  │  admin_feedbacks ◄── admin_id, user_id (profiles)                 │                     │
│  │    │ 1:N                                                          │                     │
│  │    ▼                                                              │                     │
│  │  feedback_replies ◄── user_id (profiles)                          │                     │
│  │                                                                   │                     │
│  │  content_access_requests ◄── user_id, reviewed_by (profiles)      │                     │
│  │  mentor_mentee_assignments ◄── mentor_id, mentee_id, assigned_by  │                     │
│  │  learning_assignments ◄── assigned_by, assigned_to (profiles)     │                     │
│  │  notifications ◄── user_id (profiles)                             │                     │
│  └───────────────────────────────────────────────────────────────────┘                     │
│                                                                                            │
│  ┌───────────────────────────────────────────────────────────────────┐                     │
│  │                 Enrollment Domain                                  │                     │
│  │                                                                   │                     │
│  │  enrollments ◄── user_id, course_id  (UNIQUE user+course)         │                     │
│  │    │ 1:N                                                          │                     │
│  │    ▼                                                              │                     │
│  │  lesson_progress ◄── enrollment_id, lesson_id (UNIQUE pair)       │                     │
│  └───────────────────────────────────────────────────────────────────┘                     │
└─────────────────────────────────────────────────────────────────────────────────────────────┘
```

### 3.2 핵심 FK 관계 요약

```
auth.users ──1:1──► profiles
profiles   ──1:1──► japanese_skills          (UNIQUE user_id)
profiles   ──1:1──► coding_skills            (UNIQUE user_id)
profiles   ──1:1──► attitude_culture_skills   (UNIQUE user_id)
profiles   ──1:N──► dispatch_readiness_scores
profiles   ──1:N──► quiz_attempts
profiles   ──1:N──► code_submissions
profiles   ──1:N──► coding_exam_attempts
profiles   ──1:N──► comprehensive_exams
profiles   ──1:N──► notifications
profiles   ──1:N──► user_mastered_items (via auth.users)
courses    ──1:N──► lessons
courses    ──1:N──► enrollments
lessons    ──1:N──► coding_problems
lessons    ──1:N──► quizzes
lessons    ──1:N──► projects
quizzes    ──1:N──► quiz_questions ──1:N──► quiz_question_options
quiz_attempts ──1:N──► quiz_answers
code_submissions ──1:N──► code_reviews
coding_skill_exams ──M:N──► coding_problems  (via coding_exam_problems)
coding_skill_exams ──1:N──► coding_exam_attempts
ranking_seasons ──1:N──► user_rankings
admin_feedbacks ──1:N──► feedback_replies
comprehensive_exams ──1:N──► comprehensive_exam_answers
enrollments ──1:N──► lesson_progress
mentor_mentee_assignments: profiles(mentor) ──M:N──► profiles(mentee)
```

---

## 4. 트랜잭션 경계 분석

> **참고:** 아래 분석은 소스 코드(Server Actions)에서 명시적 트랜잭션(`BEGIN`/`COMMIT`, `.rpc()`)이 전혀 사용되지 않은 점을 기반으로 한다. 모든 트랜잭션 이슈는 **추정(estimated)** 이다.

### 4.1 확인된 사실 (확인)

- Supabase JS Client는 개별 `.from().upsert()`/`.insert()` 호출마다 독립 HTTP 요청 발생
- Server Actions 내 `await` 체인은 각각 별도 DB 트랜잭션으로 처리됨
- PostgreSQL 수준의 명시적 트랜잭션(`BEGIN`/`COMMIT`)은 소스 코드에서 **미사용** (확인)
- Seed 파일 중 `seed_assessment_quizzes.sql`과 `00026_tag_quiz_question_categories.sql`만 `BEGIN`/`COMMIT` 사용 (확인)

### 4.2 `recalculateUserScores` 원자성 갭 (추정)

`src/app/actions/scores.ts`의 `recalculateUserScores()`는 7단계 연속 DB 호출로 구성:

```
Step 1: SELECT quiz_attempts      (읽기)
Step 2: SELECT code_submissions    (읽기)
Step 3: SELECT coding_exam_attempts (읽기)
Step 4: UPSERT japanese_skills     (쓰기)  ◄── 여기서 실패 시
Step 5: UPSERT coding_skills       (쓰기)  ◄── Step 4만 반영된 불일치 상태
Step 6: UPSERT attitude_culture    (쓰기)
Step 7: INSERT dispatch_readiness  (쓰기)
```

**추정 리스크:**
- Step 4 성공 후 Step 5에서 네트워크 오류 발생 시 → japanese_skills만 갱신, coding_skills는 이전 값 유지
- Step 7(snapshot) 실패 시 → 스킬 테이블은 갱신되었으나 readiness 히스토리 누락
- 동일 유저에 대해 동시 호출 시(예: 퀴즈 완료 + 코딩 제출 동시) → Race condition 가능

**추정 영향도:** 중 (Medium) - 5축 레이더 차트 데이터 불일치 가능하나, 다음 재계산 시 자동 보정

### 4.3 퀴즈 제출 파이프라인 (추정)

퀴즈 제출 시 예상 흐름:

```
1. INSERT quiz_answers (N건 개별)
2. UPDATE quiz_attempts (score, passed, completed_at)
3. recalculateUserScores() 호출
```

**추정 리스크:**
- Step 1 도중 실패 시 → 일부 답안만 저장
- Step 2 실패 시 → 답안은 있으나 채점 결과 없음

### 4.4 종합시험 제출 파이프라인 (추정)

```
1. INSERT comprehensive_exam_answers (N건)
2. UPDATE comprehensive_exams (score, passed, completed_at)
3. recalculateUserScores() 호출 (해당 시)
```

동일한 원자성 갭 패턴이 존재할 것으로 추정.

### 4.5 권장 개선 방향 (추정)

| 방안 | 구현 난이도 | 효과 |
|:-----|:--:|:--:|
| Supabase RPC (plpgsql 함수)로 Score 계산 로직 이전 | 상 | 완전한 원자성 |
| Edge Function에서 `pg` 직접 연결 + BEGIN/COMMIT | 중 | 트랜잭션 보장 |
| 실패 시 재시도 로직 + idempotent 설계 | 하 | 실용적 보완 |
| 낙관적 동시성 제어 (`updated_at` 비교) | 하 | Race condition 방지 |

---

## 5. 인덱스 전략

### 5.1 마이그레이션에서 확인된 인덱스 (확인)

| # | 인덱스명 | 테이블 | 컬럼 | 종류 | 마이그레이션 |
|:-:|:-----|:-----|:-----|:--:|:-----|
| 1 | `idx_dispatch_readiness_user_date` | dispatch_readiness_scores | (user_id, recorded_at DESC) | B-tree | 00004 |
| 2 | `idx_lessons_course` | lessons | (course_id, sort_order) | B-tree | 00005 |
| 3 | `idx_quiz_attempts_user` | quiz_attempts | (user_id, quiz_id) | B-tree | 00008 |
| 4 | `idx_code_submissions_user` | code_submissions | (user_id, submitted_at DESC) | B-tree | 00009 |
| 5 | `idx_jlpt_vocabulary_level` | jlpt_vocabulary | (jlpt_level) | B-tree | 00010 |
| 6 | `idx_it_glossary_category` | it_glossary | (category) | B-tree | 00010 |
| 7 | `idx_coding_exam_attempts_user` | coding_exam_attempts | (user_id, started_at DESC) | B-tree | 00016 |
| 8 | `idx_ranking_seasons_active` | ranking_seasons | (is_active) WHERE is_active=TRUE | Partial | 00017 |
| 9 | `idx_user_rankings_season` | user_rankings | (season_id, overall_rank) | B-tree | 00017 |
| 10 | `idx_task_assignments_assignee` | task_assignments | (assigned_to, status) | B-tree | 00018 |
| 11 | `idx_task_assignments_assigner` | task_assignments | (assigned_by, created_at DESC) | B-tree | 00018 |
| 12 | `idx_admin_feedbacks_user` | admin_feedbacks | (user_id, created_at DESC) | B-tree | 00018 |
| 13 | `idx_unique_pending_request` | content_access_requests | (user_id, content_category) WHERE status='pending' | Partial UNIQUE | 00029 |
| 14 | `idx_jlpt_grammar_level` | jlpt_grammar | (jlpt_level) | B-tree | 00031 |
| 15 | `idx_jlpt_grammar_category` | jlpt_grammar | (category) | B-tree | 00031 |
| 16 | `idx_jlpt_reading_level` | jlpt_reading_passages | (jlpt_level) | B-tree | 00032 |
| 17 | `idx_jlpt_reading_type` | jlpt_reading_passages | (passage_type) | B-tree | 00032 |
| 18 | `idx_jlpt_listening_level` | jlpt_listening_scripts | (jlpt_level) | B-tree | 00033 |
| 19 | `idx_jlpt_listening_type` | jlpt_listening_scripts | (script_type) | B-tree | 00033 |
| 20 | `idx_notifications_user` | notifications | (user_id, is_read, created_at DESC) | B-tree | 00034 |
| 21 | `idx_learning_assignments_assignee` | learning_assignments | (assigned_to, status) | B-tree | 00034 |
| 22 | `idx_comprehensive_exams_user` | comprehensive_exams | (user_id, status) | B-tree | 00034 |
| 23 | `idx_feedback_replies_feedback` | feedback_replies | (feedback_id, created_at ASC) | B-tree | 00038 |
| 24 | `idx_it_glossary_subcategory` | it_glossary | (subcategory) | B-tree | 00040 |
| 25 | `idx_user_mastered_user` | user_mastered_items | (user_id, item_type) | B-tree | 00041 |
| 26 | `idx_cs_terms_category` | cs_terms | (category) | B-tree | 00046 |
| 27 | `idx_cs_terms_difficulty` | cs_terms | (difficulty_level) | B-tree | 00046 |
| 28 | `idx_cs_terms_cat_diff` | cs_terms | (category, difficulty_level) | Composite B-tree | 00046 |

### 5.2 UNIQUE 제약조건 (암묵적 인덱스)

| 테이블 | 컬럼 | 비고 |
|:-----|:-----|:-----|
| japanese_skills | (user_id) | 1:1 관계 보장 |
| coding_skills | (user_id) | 1:1 관계 보장 |
| attitude_culture_skills | (user_id) | 1:1 관계 보장 |
| enrollments | (user_id, course_id) | 중복 수강 방지 |
| lesson_progress | (enrollment_id, lesson_id) | 중복 진도 방지 |
| user_rankings | (season_id, user_id) | 시즌별 1인 1기록 |
| mentor_mentee_assignments | (mentor_id, mentee_id) | 중복 매칭 방지 |
| question_claims | (question_id, user_id) | 중복 이의 제기 방지 |
| user_mastered_items | (user_id, item_type, item_id) | 중복 암기 방지 |
| coding_exam_problems | (exam_id, problem_id) | PK = Composite UNIQUE |

### 5.3 누락 인덱스 제안 (추정)

소스 코드의 쿼리 패턴을 분석하여 추가 인덱스를 제안한다.

| # | 테이블 | 제안 인덱스 | 근거 | 우선순위 |
|:-:|:-----|:-----|:-----|:--:|
| 1 | `quiz_questions` | (quiz_id, is_published, difficulty) | `fetchAllQuestions()`에서 quiz_id + is_published 필터링 후 difficulty 기반 분류. Assessment 핵심 쿼리 | 상 |
| 2 | `quiz_questions` | (quiz_id, question_category) | `fetchRandomByCategory()`, `fetchRandomByLanguageGroup()`에서 category 필터링 | 상 |
| 3 | `quiz_attempts` | (user_id, completed_at) WHERE completed_at IS NOT NULL | `recalculateUserScores()`에서 completed_at IS NOT NULL 필터. 매 퀴즈 완료 시 호출 | 중 |
| 4 | `code_submissions` | (user_id, problem_id, status) | `recalculateUserScores()`에서 user별 problem별 최고 성적 집계 | 중 |
| 5 | `jlpt_vocabulary` | (jlpt_level, part_of_speech) | `fetchJlptVocabulary()`에서 level + part_of_speech 복합 필터 | 하 |
| 6 | `comprehensive_exam_answers` | (exam_id) | exam별 답안 조회 시 사용 | 하 |
| 7 | `coding_exam_attempts` | (user_id, passed) WHERE passed = TRUE | `recalculateUserScores()`에서 passed=true만 조회 | 중 |

### 5.4 인덱스 설계 특징

- **DESC 정렬 인덱스:** `dispatch_readiness_scores`, `code_submissions`, `coding_exam_attempts`, `admin_feedbacks`, `notifications`에서 최신 데이터 조회 최적화
- **Partial 인덱스:** `ranking_seasons`(is_active=TRUE), `content_access_requests`(status='pending')로 저카디널리티 필터 최적화
- **Composite 인덱스:** `cs_terms`(category, difficulty_level)로 2차원 필터링 최적화
- **누락 패턴:** quiz_questions 테이블에 인덱스 없음 (quiz_id FK 인덱스만 자동 생성) - Assessment 쿼리 성능에 영향 가능

---

## 6. Seed 구조 분석

### 6.1 Seed 파일 인벤토리 (36 파일)

전체 **36개 Seed 파일**, 총 **20,256줄**.

| # | 파일명 | 대상 테이블 | 예상 레코드 수 | 카테고리 |
|:-:|:-----|:-----|:--:|:-----|
| 1 | `seed.sql` | courses, jlpt_vocabulary, it_glossary, coding_problems, coding_skill_exams, ranking_seasons | ~50 | 기본 샘플 |
| 2 | `seed_jlpt_n5.sql` | jlpt_vocabulary | ~280 | JLPT 단어 |
| 3 | `seed_jlpt_n4.sql` | jlpt_vocabulary | ~300 | JLPT 단어 |
| 4 | `seed_jlpt_n3.sql` | jlpt_vocabulary | ~200 | JLPT 단어 |
| 5 | `seed_jlpt_n2.sql` | jlpt_vocabulary | ~300 | JLPT 단어 |
| 6 | `seed_jlpt_n1.sql` | jlpt_vocabulary | ~200 | JLPT 단어 |
| 7 | `seed_it_glossary.sql` | it_glossary | ~100 | IT 용어 v1 |
| 8 | `seed_it_glossary_v2.sql` | it_glossary | ~166 | IT 용어 v2 (reading 보완) |
| 9 | `seed_it_passport_security.sql` | it_glossary | ~35 | ITパスポート セキュリティ |
| 10 | `seed_it_passport_network.sql` | it_glossary | ~30 | ITパスポート ネットワーク |
| 11 | `seed_it_passport_database.sql` | it_glossary | ~30 | ITパスポート データベース |
| 12 | `seed_it_passport_strategy.sql` | it_glossary | ~50 | ITパスポート 経営戦略 |
| 13 | `seed_it_passport_fundamentals.sql` | it_glossary | ~35 | ITパスポート IT基礎 |
| 14 | `seed_business_expressions.sql` | it_glossary (expression) | ~60 | ビジネス表現 |
| 15 | `seed_sentence_patterns.sql` | it_glossary (sentence_pattern) | ~35 | 文章パターン |
| 16 | `seed_employee_vocabulary.sql` | it_glossary | ~150 | 사내 스프레드시트 데이터 |
| 17 | `seed_assessment_quizzes.sql` | quizzes, quiz_questions, quiz_question_options | ~450Q / ~1800O | 온보딩 5축 진단 (5 퀴즈) |
| 18 | `seed_jlpt_quizzes.sql` | quizzes, quiz_questions, quiz_question_options | ~300Q | JLPT 어휘 퀴즈 (N5~N1) |
| 19 | `seed_it_quizzes.sql` | quizzes, quiz_questions, quiz_question_options | ~100Q | IT 용어 퀴즈 |
| 20 | `seed_it_passport_quizzes.sql` | quizzes, quiz_questions, quiz_question_options | ~55Q | ITパスポート 퀴즈 |
| 21 | `seed_attitude_quizzes.sql` | quizzes, quiz_questions, quiz_question_options | ~100Q | 태도/문화 퀴즈 |
| 22 | `seed_roleplay_quizzes.sql` | quizzes, quiz_questions, quiz_question_options | ~80Q | 롤플레이 시나리오 퀴즈 |
| 23 | `seed_coding_problems.sql` | coding_problems | ~20 | 코딩 문제 |
| 24 | `seed_coding_test_cases.sql` | coding_test_cases | ~60 | 코딩 테스트 케이스 |
| 25 | `seed_coding_exam_problems.sql` | coding_exam_problems | ~30 | 등급시험-문제 연결 |
| 26 | `seed_business_mock_vocab.sql` | quizzes, quiz_questions, quiz_question_options | ~500Q | 비즈니스 IT용어 퀴즈 |
| 27 | `seed_business_mock_patterns.sql` | quizzes, quiz_questions, quiz_question_options | ~100Q | 문장패턴 퀴즈 |
| 28 | `seed_business_mock_expressions.sql` | quizzes, quiz_questions, quiz_question_options | ~150Q | 비즈니스 표현 퀴즈 |
| 29 | `seed_cs_basic_theory.sql` | cs_terms | ~50 | CS 기초이론 |
| 30 | `seed_cs_algorithms.sql` | cs_terms | ~50 | CS 알고리즘 |
| 31 | `seed_cs_data_structures.sql` | cs_terms | ~45 | CS 자료구조 |
| 32 | `seed_cs_computer_architecture.sql` | cs_terms | ~55 | CS 컴퓨터아키텍처 |
| 33 | `seed_cs_database.sql` | cs_terms | ~50 | CS 데이터베이스 |
| 34 | `seed_cs_networking.sql` | cs_terms | ~45 | CS 네트워킹 |
| 35 | `seed_cs_security.sql` | cs_terms | ~50 | CS 보안 |
| 36 | `seed_cs_quizzes.sql` | quizzes, quiz_questions, quiz_question_options | ~500Q | CS 지식 퀴즈 |

### 6.2 콘텐츠 볼륨 요약

| 콘텐츠 유형 | 예상 총 레코드 수 | 비고 |
|:-----|:--:|:-----|
| JLPT 단어 (jlpt_vocabulary) | ~1,300 | N5 280 + N4 300 + N3 200 + N2 300 + N1 200 + 샘플 20 |
| IT 용어 (it_glossary) | ~700+ | v1 100 + v2 166 + passport 180 + expression 60 + pattern 35 + employee 150 |
| CS 용어 (cs_terms) | ~345 | 7 카테고리 x ~50 |
| 퀴즈 문항 (quiz_questions) | ~2,400+ | Assessment 450 + JLPT 300 + IT 155 + Attitude 100 + Roleplay 80 + Business 750 + CS 500 |
| 퀴즈 옵션 (quiz_question_options) | ~9,600+ | 문항당 평균 4개 옵션 |
| 코딩 문제 (coding_problems) | ~20 | Java/JavaScript |
| 코딩 테스트 케이스 | ~60 | 문제당 평균 3개 |
| 코스 (courses) | 12 | 7개 카테고리 |
| **총 콘텐츠 레코드** | **~14,400+** | |

### 6.3 Seed 적용 구조

**적용 도구:**
- `scripts/apply-seeds.js`: 16개 핵심 Seed 파일을 순서대로 나열, Supabase Dashboard SQL Editor에서 수동 실행 안내
- `scripts/merge-seeds.js`: 16개 파일을 `supabase/all_seeds.sql`로 병합
- `supabase/apply_seeds.sql`: 적용 순서 가이드 문서

**적용 순서 의존성:**

```
seed.sql (courses, 기본 샘플 데이터)
  ├── seed_jlpt_n5~n1.sql (jlpt_vocabulary - 독립)
  ├── seed_it_glossary_v2.sql (it_glossary - 독립)
  ├── seed_it_passport_*.sql (it_glossary 확장 - 독립)
  ├── seed_business_expressions.sql (it_glossary 확장 - 독립)
  ├── seed_sentence_patterns.sql (it_glossary 확장 - 독립)
  ├── seed_employee_vocabulary.sql (it_glossary 확장 - 독립)
  ├── seed_assessment_quizzes.sql (quizzes/questions - quiz 테이블 필요)
  │     └── 00026에서 question_category 태깅 (마이그레이션 의존)
  ├── seed_coding_problems.sql (coding_problems - 독립)
  │     ├── seed_coding_test_cases.sql (coding_problems FK 필요)
  │     └── seed_coding_exam_problems.sql (coding_skill_exams + coding_problems FK 필요)
  ├── seed_jlpt_quizzes.sql (quizzes - quiz 테이블 필요)
  ├── seed_it_quizzes.sql (quizzes - quiz 테이블 필요)
  ├── seed_it_passport_quizzes.sql (quizzes - quiz 테이블 필요)
  ├── seed_business_mock_*.sql (quizzes - quiz 테이블 필요)
  └── seed_cs_*.sql (cs_terms + quizzes - 00046 이후 필요)
```

**주의사항:**
- `apply-seeds.js`와 `merge-seeds.js`에 나열된 파일 목록은 36개 전체가 아닌 16개만 포함
- 나머지 20개(JLPT 퀴즈, 코딩 문제, 비즈니스 mock, CS seed 등)는 수동 관리 필요
- `ON CONFLICT` 절이 일부 Seed에만 적용되어 중복 실행 시 오류 가능

---

## 7. 스키마 갭 분석

### 7.1 DB_Schema.md vs 실제 마이그레이션 차이

| 항목 | DB_Schema.md | 실제 마이그레이션 | 갭 유형 |
|:-----|:-----|:-----|:-----|
| 테이블 수 | 29개 | 42개 | DB_Schema.md 미갱신 (+13 테이블) |
| `profiles.onboarding_step` | 미기재 | 00025에서 추가 | 문서 누락 |
| `profiles.is_japanese` | 미기재 | 00028에서 추가 | 문서 누락 |
| `quizzes.is_assessment` | 미기재 | 00025에서 추가 | 문서 누락 |
| `quizzes.questions_per_attempt` | 미기재 | 00025에서 추가 | 문서 누락 |
| `quizzes.content_level` | 미기재 | 00034에서 추가 | 문서 누락 |
| `quiz_questions.difficulty` | 미기재 | 00025에서 추가 | 문서 누락 |
| `quiz_questions.question_category` | 미기재 | 00025에서 추가 | 문서 누락 |
| `quiz_questions.is_published` | 미기재 | 00037에서 추가 | 문서 누락 |
| `quiz_attempts.retake_*` | 미기재 | 00028에서 추가 (3 컬럼) | 문서 누락 |
| `attitude_culture_skills.business_culture_score` | 미기재 | 00028에서 추가 | 문서 누락 |
| `attitude_culture_skills.it_security_score` | 미기재 | 00028에서 추가 | 문서 누락 |
| `it_glossary.subcategory` | 미기재 | 00040에서 추가 | 문서 누락 |
| `question_claims.claim_reason` | 미기재 | 00037에서 추가 | 문서 누락 |
| `dispatch_readiness_scores.overall_score` | GENERATED ALWAYS | 일반 컬럼 + trigger (00028) | 구현 변경 |
| `dispatch_readiness_scores.is_japanese` | 미기재 | 00028에서 추가 | 문서 누락 |
| `profiles.target_coding_area` CHECK | `('java','javascript','sql')` | `('java','javascript')` (00028) | 제약조건 변경 |
| `admin_feedbacks.category` CHECK | 6종 | 5종 (00038에서 변경) | 제약조건 변경 |
| `quizzes.quiz_type` CHECK | 7종 | 12종 (00025, 00043, 00046) | 제약조건 확장 |

### 7.2 DB_Schema.md에 미기재된 테이블 (13개)

| # | 테이블명 | 생성 마이그레이션 | 용도 |
|:-:|:-----|:-----|:-----|
| 1 | `content_access_requests` | 00029 | 콘텐츠 열람 신청 |
| 2 | `jlpt_grammar` | 00031 | JLPT 문법 콘텐츠 |
| 3 | `jlpt_reading_passages` | 00032 | JLPT 독해 지문 |
| 4 | `jlpt_listening_scripts` | 00033 | JLPT 청해 스크립트 |
| 5 | `mentor_mentee_assignments` | 00034 | 멘토-멘티 매칭 |
| 6 | `notifications` | 00034 | 범용 알림 |
| 7 | `learning_assignments` | 00034 | 학습 과제 배정 |
| 8 | `comprehensive_exams` | 00034 | 종합시험 |
| 9 | `comprehensive_exam_answers` | 00034 | 종합시험 답안 |
| 10 | `question_claims` | 00036 | 문항 이의 제기 |
| 11 | `feedback_replies` | 00038 | 피드백 답글 |
| 12 | `user_mastered_items` | 00041 | 암기 체크 |
| 13 | `cs_terms` | 00046 | CS 지식 용어 |

### 7.3 미사용 테이블 분석 (추정)

| 테이블 | 상태 | 근거 |
|:-----|:-----|:-----|
| `ranking_seasons` | **미사용 추정** | Seed에서 1개 시즌 생성, 관련 Server Action 없음. 쿼리 파일에서 참조 미확인 |
| `user_rankings` | **미사용 추정** | ranking_seasons에 의존, 실제 랭킹 계산/표시 로직 미확인 |
| `projects` | **미사용 추정** | Seed 데이터 없음, 관련 UI 미확인 |
| `project_requirements` | **미사용 추정** | projects에 의존, Seed 데이터 없음 |
| `lesson_resources` | **미사용 추정** | courses/lessons는 Seed 존재하나 리소스 관련 Seed/UI 미확인 |
| `enrollments` | **부분 사용 추정** | 쿼리 파일 존재하나 실제 코스 수강 Flow 미확인 |
| `lesson_progress` | **부분 사용 추정** | enrollments에 의존 |

### 7.4 제약조건 누락 (추정)

| 테이블 | 누락 제약 | 설명 |
|:-----|:-----|:-----|
| `task_assignments.target_id` | FK 없음 | polymorphic reference (quiz/coding_problem/coding_exam/project) - FK 대신 TEXT target_type으로 구분. 참조 무결성 미보장 |
| `learning_assignments.required_quiz_ids` | FK 없음 | UUID[] 배열로 퀴즈 ID 저장. PostgreSQL 배열 FK 미지원 |
| `learning_assignments.passed_quiz_ids` | FK 없음 | 동일 |
| `comprehensive_exams.approved_by` | ON DELETE 미지정 | SET NULL이 적절하나 명시적 지정 없음 (PostgreSQL 기본값 NO ACTION) |
| `notifications.related_id` | FK 없음 | 범용 참조 ID - 여러 테이블 참조 가능 |
| `user_mastered_items.item_id` | FK 없음 | polymorphic reference (it_glossary/jlpt_vocabulary/jlpt_grammar/cs_term) |

### 7.5 RLS 진화 추적

RLS 정책은 6차에 걸쳐 점진적으로 보완되었다:

```
00013: 초기 RLS (23 테이블, SELECT/INSERT 위주)
00019: Admin RLS (is_admin() helper, FOR ALL 정책)
00021: UPDATE 정책 보완 (quiz_attempts, code_submissions, coding_exam_attempts)
00022: 종합 RLS 수정 (INSERT 7건 추가: 스킬, dispatch, lesson_progress, code_reviews)
00027: Admin UPDATE profiles 추가
00030: Mentor RLS (is_mentor(), is_admin_or_mentor())
00035: Mentor-Mentee RLS (is_mentor_of(), 5개 신규 테이블)
00038: Feedback RLS (양방향 피드백, feedback_replies)
00039: Mentee DELETE feedbacks
00047: Admin/Mentor UPDATE quiz_attempts (retake 승인)
```

**현재 3-Tier 권한 모델:**

```
Admin (is_admin())
  └── 모든 테이블 FOR ALL 또는 SELECT+UPDATE
Mentor (is_mentor(), is_admin_or_mentor())
  └── 멘티 데이터 조회 + 과제 배정 + 피드백
  └── is_mentor_of() → 특정 멘티 한정 관리
Mentee (auth.uid() = user_id)
  └── 본인 데이터 CRUD + 콘텐츠 SELECT
```

---

## 8. 타 문서 참조

| 문서 | 참조 내용 |
|:-----|:-----|
| **01_system_overview.md** | 전체 시스템 아키텍처에서 Supabase DB가 담당하는 역할, 데이터 흐름 개요 |
| **02_folder_responsibility.md** | `supabase/migrations/`, `supabase/seeds/`, `src/lib/supabase/` 디렉토리 역할 상세 |
| **03_runtime_flow.md** | Server Actions에서 DB 호출 흐름, `recalculateUserScores()` 실행 시퀀스 |
| **05_network_and_infrastructure.md** | Supabase 호스팅 인프라, Connection Pooling, Edge Function 구성 |
| **06_security_design.md** | RLS 정책 상세 분석, `SECURITY DEFINER` 함수 보안 검토, 인증 흐름 |
| **07_exam_and_domain_model.md** | Assessment 5축 진단 로직, 종합시험/등급시험 도메인 모델 상세 |
| **08_scalability_analysis.md** | 쿼리 성능 분석, 인덱스 효과, 데이터 증가에 따른 스케일링 전략 |
| **09_refactoring_candidates.md** | DB_Schema.md 갱신 필요성, 트랜잭션 도입, polymorphic FK 개선, Seed 스크립트 통합 |
| **10_learning_roadmap_for_architect.md** | 데이터 아키텍처 학습 관점에서의 PostgreSQL/RLS/Supabase 심화 학습 가이드 |

---

> **작성 기준:** 마이그레이션 파일 00001~00048, Seed 파일 36개, Server Actions 소스 코드, DB_Schema.md 기반 분석.
> **확인/추정 구분:** 소스 코드에서 직접 확인된 사항은 "확인", 코드 패턴에서 유추한 사항은 "추정"으로 명시.
