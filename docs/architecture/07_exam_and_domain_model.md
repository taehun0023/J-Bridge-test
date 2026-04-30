# 07. 시험 및 도메인 모델 (Exam & Domain Model)

> **문서 버전:** 1.0
> **최종 갱신:** 2026-02-13
> **대상 독자:** Senior Architect / Tech Lead
> **프로젝트:** J-Bridge (Japan IT Engineer Dispatch Platform)

---

## 목차

1. [도메인 분류 (Domain Classification)](#1-도메인-분류-domain-classification)
2. [도메인 모델 계층 구조 (Domain Model Hierarchy)](#2-도메인-모델-계층-구조-domain-model-hierarchy)
3. [3개 시험 시스템 비교](#3-3개-시험-시스템-비교)
4. [5축 레이더 점수 산정 로직 상세](#4-5축-레이더-점수-산정-로직-상세)
5. [Paiza 코딩 랭크 시스템 (D->S)](#5-paiza-코딩-랭크-시스템-ds)
6. [랭킹 시스템 분석](#6-랭킹-시스템-분석)
7. [점수 갱신 트리거 분석](#7-점수-갱신-트리거-분석)
8. [도메인 이벤트 흐름](#8-도메인-이벤트-흐름)
9. [타 문서 참조](#9-타-문서-참조)

---

## 1. 도메인 분류 (Domain Classification)

### 1.1 도메인 계층 구조

```
┌──────────────────────────────────────────────────────────┐
│              Primary: LMS (학습 관리)                      │
│  학습 콘텐츠 제공, 진도 관리, 코스/레슨 구조              │
│                                                          │
│  ┌──────────────────────────────────────────────────────┐│
│  │         Secondary: 시험 플랫폼 (Exam)                 ││
│  │  Regular Quiz / Assessment / Comprehensive Exam      ││
│  │  코딩 제출 / Judge0 자동 채점                         ││
│  │                                                      ││
│  │  ┌──────────────────────────────────────────────────┐││
│  │  │       Tertiary: HR 평가 (Evaluation)              │││
│  │  │  5축 레이더 차트 / Dispatch Readiness Score       │││
│  │  │  Paiza식 코딩 랭크 (S/A/B/C/D)                   │││
│  │  │  랭킹 시스템 / 시즌 관리                          │││
│  │  │                                                  │││
│  │  │  ┌──────────────────────────────────────────────┐│││
│  │  │  │    Supporting: 멘토링 (Mentoring)             ││││
│  │  │  │  Mentor-Mentee 매칭, 과제 배정               ││││
│  │  │  │  피드백, 알림                                ││││
│  │  │  └──────────────────────────────────────────────┘│││
│  │  └──────────────────────────────────────────────────┘││
│  └──────────────────────────────────────────────────────┘│
└──────────────────────────────────────────────────────────┘
```

### 1.2 도메인별 범위, 엔티티, 경계

| 도메인 | 범위 | 핵심 엔티티 | 경계 |
|:------|:-----|:-----------|:-----|
| **Primary: LMS** | 학습 콘텐츠 구조화, 코스/레슨 관리, 수강 등록, 진도 추적, 암기 체크 | `courses`, `lessons`, `lesson_resources`, `enrollments`, `lesson_progress`, `user_mastered_items` | 학습 콘텐츠를 제공하는 것까지가 책임. 채점이나 평가는 하위 도메인으로 위임 |
| **Secondary: Exam** | 3종 시험(Regular Quiz / Assessment / Comprehensive Exam) 출제, 채점, 제출 이력 관리. 코딩 문제 Judge0 자동 채점 | `quizzes`, `quiz_questions`, `quiz_question_options`, `quiz_attempts`, `quiz_answers`, `coding_problems`, `coding_test_cases`, `code_submissions`, `code_reviews`, `comprehensive_exams`, `comprehensive_exam_answers`, `question_claims` | 채점 결과 산출까지가 책임. 점수 해석/종합은 HR 평가 도메인으로 위임 |
| **Tertiary: HR Evaluation** | 5축 점수 산정, 레이더 차트 데이터, Dispatch Readiness Score 스냅샷, Paiza 코딩 랭크 관리, 랭킹 | `japanese_skills`, `coding_skills`, `attitude_culture_skills`, `dispatch_readiness_scores`, `coding_skill_exams`, `coding_exam_problems`, `coding_exam_attempts`, `ranking_seasons`, `user_rankings` | 개별 시험 결과를 종합하여 파견 준비도를 산출하는 것이 핵심 책임 |
| **Supporting: Mentoring** | Mentor-Mentee 매칭, 학습 과제 배정/관리, 양방향 피드백, 알림, 시험 승인 워크플로 | `mentor_mentee_assignments`, `learning_assignments`, `task_assignments`, `admin_feedbacks`, `feedback_replies`, `notifications`, `content_access_requests` | 인적 관리 및 커뮤니케이션 채널. 점수/채점 로직에는 직접 관여하지 않음 |

### 1.3 도메인 간 의존성 방향

```
   LMS (콘텐츠)
      │
      │ lessons → quizzes, coding_problems (FK)
      ▼
   Exam (시험)
      │
      │ quiz_attempts.score → recalculateUserScores()
      │ code_submissions.ratio → recalculateUserScores()
      ▼
   HR Evaluation (평가)
      │
      │ comprehensive_exams → Mentoring (승인 워크플로)
      │ admin_feedbacks ← HR scores 참고
      ▼
   Mentoring (멘토링)
```

**확인:** 의존성은 항상 상위 → 하위 방향으로 흐른다. Mentoring 도메인은 HR Evaluation의 점수를 **읽기**만 하고, 직접 변경하지 않는다.

---

## 2. 도메인 모델 계층 구조 (Domain Model Hierarchy)

### 2.1 Entity Relationship (도메인 개념 수준)

```
                          ┌───────────┐
                          │   User    │  Aggregate Root
                          │ (Profile) │
                          └─────┬─────┘
           ┌──────┬──────┬─────┼──────┬──────┬──────┐
           ▼      ▼      ▼     ▼      ▼      ▼      ▼
      ┌────────┐┌────┐┌──────┐│  ┌──────┐┌──────┐┌───────┐
      │Japanese││Code││Attit.││  │Enroll││Notif.││Mastery│
      │ Skills ││Skil││Skills││  │ments ││      ││ Items │
      │(1:1 VO)││(VO)││(VO)  ││  │(1:N) ││(1:N) ││(1:N)  │
      └────────┘└────┘└──────┘│  └──┬───┘└──────┘└───────┘
                               │     │
                               │     ▼
                               │  ┌────────┐
                               │  │Lesson  │
                               │  │Progress│
                               │  └────────┘
                               │
          ┌────────────────────┼───────────────────────┐
          ▼                    ▼                         ▼
   ┌──────────────┐    ┌──────────────┐         ┌───────────────┐
   │ Quiz Attempt │    │ Code         │         │Comprehensive  │
   │  (Entity)    │    │ Submission   │         │ Exam (Entity) │
   │              │    │  (Entity)    │         │               │
   │ ┌──────────┐│    │ ┌──────────┐ │         │ ┌───────────┐ │
   │ │ Answers  ││    │ │ Reviews  │ │         │ │ Answers   │ │
   │ │ (1:N VO) ││    │ │ (1:N VO) │ │         │ │ (1:N VO)  │ │
   │ └──────────┘│    │ └──────────┘ │         │ └───────────┘ │
   └──────────────┘    └──────────────┘         └───────────────┘
          │                    │
          ▼                    ▼
   ┌──────────────────────────────────┐
   │   Dispatch Readiness Score       │
   │         (1:N Snapshot)           │  ◄── recalculateUserScores() 생성
   └──────────────────────────────────┘
```

### 2.2 Aggregate Root 식별

| Aggregate Root | 범위 | 불변조건 (Invariant) |
|:--------------|:-----|:-------------------|
| **User (Profile)** | profiles + 3개 스킬 테이블 + enrollments + notifications + mastered_items | 사용자 생성 시 `handle_new_user()` trigger가 profiles + 3개 스킬 테이블을 원자적으로 생성 (확인). 한 사용자의 스킬은 항상 존재해야 함 |
| **Quiz** | quizzes + quiz_questions + quiz_question_options | 퀴즈는 문항 없이 존재할 수 없음. `ON DELETE CASCADE`로 생명주기 공유 |
| **Quiz Attempt** | quiz_attempts + quiz_answers | 하나의 응시에 속하는 답안 세트. `ON DELETE CASCADE`로 생명주기 공유 |
| **Code Submission** | code_submissions + code_reviews | 제출 코드와 자동 리뷰는 불가분. 리뷰는 제출 없이 존재 불가 |
| **Comprehensive Exam** | comprehensive_exams + comprehensive_exam_answers | 종합시험 + 답안 세트. 독자적 생명주기를 가지며 별도 승인 워크플로를 포함 |
| **Coding Skill Exam** | coding_skill_exams + coding_exam_problems (junction) + coding_exam_attempts | 등급 시험 정의와 문제 구성, 응시 이력 |

### 2.3 Value Object 식별

| Value Object | 소속 Aggregate | 특성 |
|:------------|:--------------|:-----|
| `japanese_skills` 레코드 | User | user_id UNIQUE, 독립 ID 있으나 User 없이 무의미 |
| `coding_skills` 레코드 | User | 동일 패턴 |
| `attitude_culture_skills` 레코드 | User | 동일 패턴 |
| `quiz_answers` 레코드 | Quiz Attempt | attempt_id + question_id로 의미. CASCADE 삭제 |
| `code_reviews` 레코드 | Code Submission | submission_id 종속. 자동 생성 |
| `comprehensive_exam_answers` 레코드 | Comprehensive Exam | exam_id 종속. CASCADE 삭제 |
| `dispatch_readiness_scores` 레코드 | User (이력) | 시점 스냅샷. 불변(INSERT only) |
| `SkillGrade` ('S'\|'A'\|'B'\|'C'\|'D') | HR Evaluation | 점수에서 파생되는 순수 값 객체 (`assessment-config.ts:L32-38`) |

### 2.4 도메인 이벤트 (Domain Events)

| 이벤트 | 트리거 시점 | 부수효과 |
|:------|:-----------|:--------|
| **QuizCompleted** | `submitQuizAnswers()` 완료 (`quiz.ts:L101`) | `recalculateUserScores()` 비동기 호출, `checkAssignmentProgress()` 호출 (합격 시) |
| **AssessmentCompleted** | `submitAssessment()` 완료 (`assessment.ts:L133`) | `recalculateUserScores()` **동기** 호출 (await) |
| **CodeSubmitted** | `submitCode()` 완료 (`coding.ts:L98`) | `recalculateUserScores()` 비동기 호출 |
| **ExamRequested** | `requestExam()` 완료 (`comprehensive-exam.ts:L40`) | Mentor/Admin에게 Notification 발송 |
| **ExamApproved** | `approveExam()` 완료 (`comprehensive-exam.ts:L138`) | Mentee에게 Notification 발송 |
| **ExamCompleted** | `submitExam()` 완료 (`comprehensive-exam.ts:L357`) | Mentor에게 결과 Notification 발송 |
| **RetakeRequested** | `requestRetake()` 완료 (`assessment.ts:L243`) | Mentor/Admin에게 Notification 발송 |
| **ScoresRecalculated** | `recalculateUserScores()` 완료 (`scores.ts:L257`) | `dispatch_readiness_scores` INSERT, `revalidatePath()` |

**참고:** 이벤트는 명시적 Event 객체로 구현되어 있지 않고, Server Action 내 순차 호출 패턴으로 **암묵적(implicit)** 구현되어 있다. Event-Driven Architecture가 아닌 **Procedural Transaction Script** 패턴이다.

---

## 3. 3개 시험 시스템 비교

### 3.1 종합 비교표

| 구분 | Regular Quiz | Assessment (등급テスト) | Comprehensive Exam (総合試験) |
|:-----|:-----------|:----------------------|:---------------------------|
| **목적** | 일상 학습 확인 (코스/레슨 연동) | 온보딩 시 5축 진단. 현재 실력 측정 | 카테고리별 종합 역량 검증. 학습 과제 완료 확인 |
| **출제 방식** | 퀴즈 고정 문항 순서대로 전부 출제 | 문항풀에서 30문항 랜덤 추출 (난이도 밸런싱: easy 20%, medium 40%, hard 40%) | 카테고리/레벨에 해당하는 퀴즈 문항풀에서 랜덤 추출 (기본 30문항) |
| **채점 방식** | 정답수/총문항 x 100 (서버사이드 정답 검증) | 정답수/총문항(30) x 100. 최소 1점 보장 | 정답수/제출답안수 x 100 |
| **재시험** | 무제한 (이전 기록 유지, Math.max로 반영) | 완료 후 Retake Request → Admin/Mentor 승인 필요. 승인 시 이전 attempt 삭제 후 재응시 | 불합격 시 `requestRetakeExam()` → 새 exam 레코드 생성 (requested 상태) → 승인 필요 |
| **점수 반영** | `recalculateUserScores()`에서 quiz_type별 평균으로 5축에 간접 반영 | Assessment step → 해당 축의 `_normalized` 값에 직접 설정. `Math.max(assessment, learning)` | 5축 점수 산정에 **직접 반영되지 않음** (확인). 학습 과제 완료 검증용 |
| **DB 테이블** | `quizzes`, `quiz_questions`, `quiz_question_options`, `quiz_attempts`, `quiz_answers` | 동일 테이블 사용. `quizzes.is_assessment=true`, `quiz_attempts.retake_*` 컬럼 활용 | `comprehensive_exams`, `comprehensive_exam_answers` (별도 테이블) |
| **액션 파일** | `src/app/actions/quiz.ts` | `src/app/actions/assessment.ts` | `src/app/actions/comprehensive-exam.ts` |
| **난이도** | 퀴즈별 고정 | easy/medium/hard 태깅 + 밸런싱 | 출제 퀴즈의 난이도에 의존 |
| **시간 제한** | `quizzes.time_limit_minutes` (설정 시) | 축별 25~30분 (`ASSESSMENT_TIME_LIMITS`) | `comprehensive_exams.time_limit_minutes` (기본 40분) |
| **합격 기준** | `quizzes.passing_score` (기본 70) | 항상 passed=true (진단 목적) | `comprehensive_exams.passing_score` (기본 70) |
| **일본인 처리** | 구분 없음 | Step 1,2 (일본어) 스킵, Step 3,4,5만 응시 | 구분 없음 |

### 3.2 Regular Quiz 상세 흐름

```
Mentee                  Server Action              Supabase
  │                        (quiz.ts)                   │
  │                                                    │
  ├─ startQuizAttempt() ──>│                           │
  │                        ├── INSERT quiz_attempts ──>│
  │                        │<── attempt.id ────────────┤
  │<── attemptId ──────────┤                           │
  │                                                    │
  │  (UI에서 문항 풀기)                                 │
  │                                                    │
  ├─ submitQuizAnswers() ─>│                           │
  │                        ├── SELECT correct answers ─>│
  │                        │<── correctMap ─────────────┤
  │                        │                           │
  │                        ├── INSERT quiz_answers ────>│  (N건 일괄)
  │                        │                           │
  │                        ├── score = correct/total*100│
  │                        ├── passed = score >= 70    │
  │                        │                           │
  │                        ├── UPDATE quiz_attempts ───>│  (score, passed, completed_at)
  │                        │                           │
  │                        ├── recalculateUserScores() │  (비동기 .catch)
  │                        ├── checkAssignmentProgress()│  (합격 시, 비동기)
  │                        │                           │
  │<── {score, passed} ────┤                           │
```

**확인 (`quiz.ts:L101`):** `recalculateUserScores(user.id).catch(() => {})` — fire-and-forget 패턴으로 비동기 실행. 점수 재계산 실패가 퀴즈 제출 결과에 영향을 주지 않는다.

### 3.3 Assessment (등급テスト) 상세 흐름

```
Mentee                  Server Action              Supabase
  │                     (assessment.ts)                │
  │                                                    │
  ├─ getAssessmentForStep(step) ──>│                   │
  │                        │                           │
  │                        ├── ASSESSMENT_QUIZ_IDS[step]│
  │                        ├── fetchAssessmentQuiz() ──>│
  │                        ├── fetchRandomAssessment   │
  │                        │   Questions() ────────────>│  랜덤 30문항 추출
  │                        │<── quiz + questions ───────┤
  │<── {quiz, questions} ──┤                           │
  │                                                    │
  │  (UI에서 문항 풀기, 시간 제한)                       │
  │                                                    │
  ├─ submitAssessment() ──>│                           │
  │                        │                           │
  │                        ├── DELETE 이전 attempts ───>│  (ServiceRole, retake 시)
  │                        ├── INSERT quiz_attempts ───>│
  │                        ├── SELECT correct answers ─>│
  │                        ├── INSERT quiz_answers ────>│
  │                        │                           │
  │                        ├── score = correct/30 * 100│
  │                        ├── passed = true (항상)    │
  │                        │                           │
  │                        ├── UPDATE quiz_attempts ───>│
  │                        │                           │
  │                        ├── await recalculateUser   │  ← 동기 호출 (await)
  │                        │   Scores()                │
  │                        │                           │
  │<── {score, results} ──>│                           │
```

**핵심 차이점:**
1. **동기 점수 재계산:** Assessment는 `await recalculateUserScores()` (`assessment.ts:L133`). Regular Quiz는 비동기.
2. **이전 attempt 삭제:** Retake 시 `ServiceRole`로 이전 attempt를 DELETE (`assessment.ts:L75-81`). `quiz_answers`는 `ON DELETE CASCADE`로 자동 삭제.
3. **항상 합격:** `passed: true` 고정 (`assessment.ts:L127`). 진단 목적이므로 불합격 개념 없음.
4. **랜덤 출제 전략:** Step별 다른 추출 알고리즘 사용 (`assessments.ts:L143-183`).

### 3.4 Assessment 랜덤 출제 전략 상세

| Step | 축 | 추출 알고리즘 | 총 문항 | 세부 구성 |
|:----:|:---|:------------|:------:|:---------|
| 1 | 生活日本語 | `fetchRandomByDifficulty()` | 30 | easy 6 + medium 12 + hard 12 |
| 2 | ビジネス日本語 | `fetchRandomByCategory()` | 30 | vocab 10 + reading 10 + fill_blank 10 |
| 3 | CS知識 | `fetchRandomByWeightedCategory()` | 30 | algorithm 9 + data_structure 9 + os 6 + network 6 |
| 4 | 開発実務能力 | `fetchRandomByLanguageGroup()` | 30 | Java: java_core + spring_boot + sql + java_code / JS: javascript_core + react + sql + javascript_code |
| 5 | ビジネスリテラシー | `fetchRandomByCategory()` | 30 | business_manner 10 + communication 10 + cross_culture 10 |

**확인 (`assessments.ts:L143-183`):** Step 3, 4, 5에서 카테고리 기반 추출이 실패하면(문항 미태깅) `fetchRandomByDifficulty()`로 fallback한다.

### 3.5 Comprehensive Exam (総合試験) 상세 흐름

```
Mentee              Server Action                    Admin/Mentor
  │              (comprehensive-exam.ts)                  │
  │                                                       │
  ├─ requestExam() ──>│                                   │
  │                   ├── INSERT comprehensive_exams ──>DB │
  │                   │   (status: 'requested')           │
  │                   ├── Notify mentor(s) ──────────────>│
  │                   ├── Notify admin(s) ───────────────>│
  │<── success ───────┤                                   │
  │                                                       │
  │                                    approveExam() ◄────┤
  │                                   ├── UPDATE status='approved'
  │                   ┌── Notification │   (approved_at, approved_by)
  │<── exam_approved ─┤               │
  │                                                       │
  ├─ startExam() ────>│                                   │
  │                   ├── SELECT matching quizzes by type/level
  │                   ├── SELECT random questions ──────>DB
  │                   ├── UPDATE status='in_progress'
  │                   │   (started_at)
  │<── {questions,    │
  │    timeLimit} ────┤
  │                                                       │
  │  (UI에서 문항 풀기, 시간 제한)                          │
  │                                                       │
  ├─ submitExam() ───>│                                   │
  │                   ├── SELECT correct answers ──────>DB
  │                   ├── INSERT comprehensive_exam_answers
  │                   ├── score = correct/answered * 100
  │                   ├── passed = score >= passing_score
  │                   ├── UPDATE status='completed'|'failed'
  │                   │   (score, passed, completed_at)
  │                   ├── Notify mentor(s) ──────────────>│
  │<── {score, passed}│                                   │
```

**핵심 특징:**
1. **승인 워크플로:** `requested` → `approved` → `in_progress` → `completed`/`failed` 상태 머신
2. **별도 DB 테이블:** `comprehensive_exams` + `comprehensive_exam_answers` (기존 quiz 테이블과 분리)
3. **카테고리 기반:** `ASSIGNMENT_CATEGORIES`의 category/subcategory/quizType 매핑으로 해당 문항풀에서 출제 (`comprehensive-exam.ts:L212-213`)
4. **5축 점수 비반영:** `recalculateUserScores()`가 호출되지 않음 (확인). 학습 과제 완료 검증 목적

### 3.6 Range Quiz (범위 퀴즈) — 4번째 퀴즈 유형

Regular Quiz/Assessment/Comprehensive Exam 외에 `range-quiz.ts`에 정의된 **Range Quiz**가 존재한다.

| 구분 | Range Quiz |
|:-----|:----------|
| **목적** | 특정 범위의 용어/단어를 빠르게 복습 (암기 확인용) |
| **출제 방식** | DB 테이블(it_glossary, cs_terms, jlpt_vocabulary)에서 정렬 후 범위(rangeStart~rangeEnd) 지정, 셔플 후 N문항 추출 |
| **채점 방식** | 클라이언트에서 즉시 정답 확인 (서버에서 정답 포함 반환) |
| **점수 반영** | 5축 점수에 **미반영** (확인). DB에 결과 저장 안 함 |
| **액션 파일** | `src/app/actions/range-quiz.ts` |

**확인:** Range Quiz는 `generateGlossaryQuiz()`, `generateCsTermQuiz()`, `generateVocabQuiz()` 3개 함수로 구성. 오답 보기를 동일 카테고리 풀에서 자동 생성한다 (`range-quiz.ts:L83-88`).

---

## 4. 5축 레이더 점수 산정 로직 상세

> **소스:** `src/app/actions/scores.ts:recalculateUserScores()` (L18-262)
> **설정:** `src/lib/assessment-config.ts`

### 4.1 전체 점수 산정 아키텍처

```
┌───────────────────────────────────────────────────────────────────────┐
│                  recalculateUserScores(userId)                        │
│                                                                       │
│  INPUT                                                                │
│  ┌──────────────────┐  ┌──────────────────┐  ┌────────────────────┐  │
│  │  quiz_attempts   │  │ code_submissions │  │coding_exam_attempts│  │
│  │  (completed)     │  │ (all)            │  │ (passed=true)      │  │
│  └────────┬─────────┘  └────────┬─────────┘  └────────┬───────────┘  │
│           │                     │                      │              │
│    ┌──────┴──────┐              │                      │              │
│    │ Assessment  │              │                      │              │
│    │  Quizzes    │              │                      │              │
│    │(step→score) │              │                      │              │
│    └──────┬──────┘              │                      │              │
│           │    ┌────────┐       │                      │              │
│           │    │Regular │       │                      │              │
│           │    │Quizzes │       │                      │              │
│           │    │(type→  │       │                      │              │
│           │    │ avg)   │       │                      │              │
│           │    └───┬────┘       │                      │              │
│           │        │            │                      │              │
│  PROCESS  ▼        ▼            ▼                      ▼              │
│  ┌──────────────────────────────────────────────────────────┐        │
│  │              5축 각축 계산 (Axis 1~5)                      │        │
│  │                                                          │        │
│  │  axis_normalized = Math.max(                             │        │
│  │      assessmentScores[step],    ← Assessment 직접 설정    │        │
│  │      learning계산값             ← Regular Quiz + Coding   │        │
│  │  )                                                       │        │
│  └──────────────────────────────────────────────────────────┘        │
│                            │                                          │
│  OUTPUT                    ▼                                          │
│  ┌────────────────┐  ┌──────────┐  ┌──────────────────┐              │
│  │japanese_skills  │  │coding_   │  │attitude_culture_ │              │
│  │  UPSERT        │  │skills    │  │skills UPSERT     │              │
│  │                │  │UPSERT    │  │                  │              │
│  └────────────────┘  └──────────┘  └──────────────────┘              │
│                            │                                          │
│                            ▼                                          │
│                 ┌────────────────────┐                                │
│                 │dispatch_readiness  │                                │
│                 │_scores INSERT      │  ← 시점 스냅샷                 │
│                 └────────────────────┘                                │
└───────────────────────────────────────────────────────────────────────┘
```

### 4.2 축별 산정 로직

#### Axis 1: 生活日本語 (JLPT) — 일본인 스킵

**확인 (`scores.ts:L75-99`):**

```
산정 기준:
  - Assessment Step 1 최고 점수 (assessmentScores[1])
  - Regular Quiz 학습 점수 (가중 평균)

가중치 (Regular Quiz):
  - jlpt_vocab:     0.30
  - jlpt_grammar:   0.30
  - jlpt_reading:   0.25
  - jlpt_listening: 0.15

계산식:
  learningJlpt = 활성 파트만 가중평균 (score > 0인 파트만)
               = SUM(score_i * weight_i) / SUM(weight_i)  (활성 파트만)

  jlptNormalized = Math.max(assessmentScores[1], learningJlpt)

데이터 소스:
  - quiz_attempts WHERE quiz_type IN ('jlpt_vocab','jlpt_grammar',
    'jlpt_reading','jlpt_listening')
  - 퀴즈별 best score → type별 평균

일본인 사용자 (is_japanese=true):
  - jlptNormalized = 0 (스킵)
  - dispatch_readiness_scores.jlpt_score = NULL
```

#### Axis 2: ビジネス日本語 (IT Japanese) — 일본인 스킵

**확인 (`scores.ts:L101-118`):**

```
산정 기준:
  - Assessment Step 2 최고 점수
  - Regular Quiz 학습 점수 (가중 평균)

가중치:
  - it_terminology (IT用語):    0.40
  - doc_reading (文書読解):     0.30  ← itTermScore * 0.8 로 파생
  - role_play_scenario (会話):  0.30

계산식:
  docReadingScore = Math.round(itTermScore * 0.8)  ← IT 용어 점수에서 파생

  learningItJapanese = 활성 파트만 가중평균

  itJapaneseNormalized = Math.max(assessmentScores[2], learningItJapanese)

참고:
  - doc_reading_score는 독립적 시험 없이 it_terminology의 80%로 추정 산출
  - 이는 IT 문서 독해력이 IT 용어 이해도와 높은 상관관계를 가진다는 가정에 기반 (추정)
```

#### Axis 3: CS知識 (Core Programming)

**확인 (`scores.ts:L120-162`):**

```
산정 기준:
  - Assessment Step 3 최고 점수
  - Regular Quiz 학습 점수 (core_programming 퀴즈 평균)
  - 코딩 제출 결과 (언어별 점수 + 알고리즘 점수)

코딩 제출 점수 계산:
  문제별 최고 통과율 기준:
    score = Math.round(ratio * 100 * difficultyMultiplier)

    difficultyMultiplier:
      easy:   0.6
      medium: 0.8
      hard:   1.0

  언어별 점수:
    javaScore = avg(Java 문제 scores)
    jsScore   = avg(JavaScript 문제 scores)

  알고리즘 점수:
    algorithmScore = avg(medium+hard 난이도 문제 scores만)

최종 계산:
  learningCore = avg([javaScore, jsScore, algorithmScore, coreQuizAvg]
                     .filter(s => s > 0))

  coreNormalized = Math.max(assessmentScores[3], learningCore)

데이터 소스:
  - code_submissions (모든 제출) → 문제별 best ratio
  - quiz_attempts WHERE quiz_type = 'core_programming'
```

#### Axis 4: 開発実務能力 (Framework)

**확인 (`scores.ts:L164-187`):**

```
산정 기준:
  - Assessment Step 4 최고 점수
  - Coding Skill Exam 합격 기록 (Paiza 랭크)
  - Regular Quiz 학습 점수 (framework 퀴즈 평균)
  - 코딩 제출 파생 점수

Paiza 랭크 → 점수 변환:
  D: 20,  C: 40,  B: 60,  A: 80,  S: 100

  highestRankScore = max(합격한 모든 exam의 rankScore)

파생 점수:
  springBootScore = Math.min(100, Math.round(highestRankScore * 0.8))
  reactScore      = Math.min(100, Math.round(highestRankScore * 0.7))
  dbDesignScore   = Math.min(100, Math.round(
                      (avg(java) || avg(js)) * 0.9))
  projectScore    = Math.min(100, Math.round(highestRankScore * 0.6))

최종 계산:
  learningFramework = avg([springBootScore, reactScore, dbDesignScore,
                          projectScore, fwQuizAvg].filter(s > 0))

  frameworkNormalized = Math.max(assessmentScores[4], learningFramework)

데이터 소스:
  - coding_exam_attempts WHERE passed=true
  - quiz_attempts WHERE quiz_type = 'framework'
  - code_submissions (Axis 3과 동일 데이터 재활용)
```

**주의:** Framework 축의 파생 점수(Spring Boot, React 등)는 실제 해당 기술 시험이 아니라 **Coding Skill Exam 랭크에서 비율 계산으로 파생**된다. 이는 프레임워크별 독립 평가가 아닌 코딩 역량의 **프록시 지표**이다 (확인).

#### Axis 5: ビジネスリテラシー (Attitude/Culture)

**확인 (`scores.ts:L189-201`):**

```
산정 기준:
  - Assessment Step 5 최고 점수
  - Regular Quiz 학습 점수 (attitude_culture 퀴즈 평균)

계산식:
  learningAttitude = avg(quizScoresByType['attitude_culture'])

  attitudeNormalized = Math.max(assessmentScores[5], learningAttitude)

세부 점수 (모두 동일 값):
  punctualityScore     = attitudeNormalized
  horensoScore         = attitudeNormalized
  teamworkScore        = attitudeNormalized
  businessMannerScore  = attitudeNormalized
  businessCultureScore = attitudeNormalized
  itSecurityScore      = attitudeNormalized

참고:
  - 6개 세부 점수가 모두 동일한 값으로 설정됨 (확인)
  - 개별 세부 평가 기능은 미구현이며, 향후 분리 가능하도록 DB 컬럼은 마련되어 있음
```

### 4.3 점수 산정 종합 공식

```
┌─────────────────────────────────────────────────────────────┐
│  각 축 공통 패턴:                                            │
│                                                             │
│  normalized = Math.max(                                     │
│      Assessment 최고 점수,    ← 진단 시험 결과 (직접)        │
│      Learning 합산 점수       ← 학습 활동 기반 (간접)        │
│  )                                                          │
│                                                             │
│  → 점수는 절대 하락하지 않음 (Math.max 보장)                  │
│  → Assessment를 잘 보면 즉시 높은 점수 확보 가능              │
│  → 학습으로 점진적 향상도 가능                               │
│                                                             │
│  Grade 변환 (assessment-config.ts:L32-38):                   │
│    score >= 90 → S                                          │
│    score >= 80 → A                                          │
│    score >= 70 → B  ← 파견 최소 기준 (DISPATCH_MINIMUM)      │
│    score >= 50 → C                                          │
│    score <  50 → D                                          │
│                                                             │
│  일본인 사용자:                                              │
│    - Axis 1, 2 스킵 → 3축(CS/FW/Attitude)만 산정            │
│    - 최대 총점: 300 (비일본인: 500)                           │
│    - 랭킹에서 일본어 점수 200 고정                            │
└─────────────────────────────────────────────────────────────┘
```

### 4.4 DB 저장 구조

```
recalculateUserScores() 실행 결과:

japanese_skills (UPSERT, user_id UNIQUE):
  ├── vocab_mastery        ← jlpt_vocab 퀴즈 평균
  ├── grammar_mastery      ← jlpt_grammar 퀴즈 평균
  ├── reading_mastery      ← jlpt_reading 퀴즈 평균
  ├── listening_mastery    ← jlpt_listening 퀴즈 평균
  ├── jlpt_normalized      ← Axis 1 최종 점수 ★
  ├── it_terminology_score ← it_terminology 퀴즈 평균
  ├── doc_reading_score    ← it_terminology * 0.8
  ├── business_conv_score  ← role_play_scenario 퀴즈 평균
  └── it_japanese_normalized ← Axis 2 최종 점수 ★

coding_skills (UPSERT, user_id UNIQUE):
  ├── java_score           ← Java 코딩 제출 평균
  ├── javascript_score     ← JS 코딩 제출 평균
  ├── sql_score            ← 0 (항상, 미구현)
  ├── algorithm_score      ← medium+hard 코딩 제출 평균
  ├── core_normalized      ← Axis 3 최종 점수 ★
  ├── spring_boot_score    ← highestRank * 0.8
  ├── react_score          ← highestRank * 0.7
  ├── db_design_score      ← (java||js) * 0.9
  ├── project_score        ← highestRank * 0.6
  └── framework_normalized ← Axis 4 최종 점수 ★

attitude_culture_skills (UPSERT, user_id UNIQUE):
  ├── punctuality_score     ← = attitudeNormalized
  ├── horenso_score         ← = attitudeNormalized
  ├── teamwork_score        ← = attitudeNormalized
  ├── business_manner_score ← = attitudeNormalized
  ├── business_culture_score← = attitudeNormalized
  ├── it_security_score     ← = attitudeNormalized
  └── attitude_normalized   ← Axis 5 최종 점수 ★

dispatch_readiness_scores (INSERT, 시점 스냅샷):
  ├── jlpt_score              ← Axis 1 (일본인: NULL)
  ├── it_japanese_score       ← Axis 2 (일본인: NULL)
  ├── core_programming_score  ← Axis 3
  ├── framework_score         ← Axis 4
  ├── attitude_culture_score  ← Axis 5
  ├── is_japanese             ← boolean
  └── overall_score           ← trigger 자동 계산 (NULL축 제외 평균)
```

---

## 5. Paiza 코딩 랭크 시스템 (D->S)

### 5.1 랭크 정의

**확인 (`assessment-config.ts:L26-38`):**

| 랭크 | 점수 기준 | 색상 | 파견 가능 |
|:----:|:---------|:-----|:--------:|
| **S** | >= 90 | 금색 (yellow) | O |
| **A** | >= 80 | 보라 (purple) | O |
| **B** | >= 70 | 파랑 (blue) | O (최소 기준) |
| **C** | >= 50 | 초록 (green) | X |
| **D** | < 50 | 회색 (gray) | X |

```
파견 최소 기준: B 등급 이상 (DISPATCH_MINIMUM_GRADE = 'B')
                점수 70 이상 (DISPATCH_MINIMUM_SCORE = 70)
```

### 5.2 랭크 결정 메커니즘

J-Bridge의 랭크 시스템은 두 가지 관점에서 작동한다:

#### A. 5축 축별 등급 (SkillGrade)

**확인:** `getGrade(score: number): SkillGrade` 함수가 각 축의 normalized 점수를 S/A/B/C/D로 변환한다. 이는 레이더 차트 UI에서 각 축별 뱃지로 표시된다.

```
Axis 1 jlpt_normalized     → getGrade() → S/A/B/C/D
Axis 2 it_japanese_normalized → getGrade() → S/A/B/C/D
Axis 3 core_normalized       → getGrade() → S/A/B/C/D
Axis 4 framework_normalized  → getGrade() → S/A/B/C/D
Axis 5 attitude_normalized   → getGrade() → S/A/B/C/D
```

#### B. Coding Skill Exam 랭크 (Paiza식)

**확인 (`00015_coding_skill_exams.sql`):** 별도의 코딩 등급 시험 시스템.

```
coding_skill_exams:
  - target_rank: S/A/B/C/D (해당 랭크를 위한 시험)
  - language: java/javascript/sql
  - passing_score: 기본 70
  - time_limit_minutes: 기본 60

coding_exam_problems:
  - exam_id ↔ problem_id (M:N Junction)
  - points: 문제별 배점

coding_exam_attempts:
  - score, passed, achieved_rank
  - 합격 시 achieved_rank에 목표 랭크 기록

profiles.coding_rank:
  - 현재 달성된 최고 코딩 랭크
  - 초기값: 'D'
```

### 5.3 랭크 변경 조건

**확인 (`scores.ts:L164-177`):** 랭크 기반 점수 계산은 `coding_exam_attempts`에서 `passed=true`인 최고 랭크를 추출한다.

```
랭크 상승:
  - 상위 랭크 시험 합격 (passed=true) → profiles.coding_rank 갱신
  - coding_exam_attempts에 이력 기록

랭크 하락:
  - 현재 구현에서 하락 메커니즘 없음 (확인)
  - Math.max 패턴으로 최고 기록만 유지

Framework 점수 반영:
  coding_exam_attempts에서 합격 최고 랭크 기준:
    D(20) → C(40) → B(60) → A(80) → S(100)
  이 점수가 Framework 축 파생 점수의 기반이 됨
```

### 5.4 Paiza 실제 시스템과의 비교

| 항목 | 실제 Paiza | J-Bridge |
|:-----|:----------|:---------|
| **등급 체계** | S/A/B/C/D 5단계 | 동일 |
| **시험 구성** | 랭크별 1~4문제, 시간 제한 | 랭크별 N문제 (coding_exam_problems), 기본 60분 |
| **채점** | 컴파일/실행 자동 채점 | Judge0 자동 채점 (확인) |
| **합격 기준** | 비공개 (문제별 다름) | passing_score (기본 70) |
| **재응시** | 일정 기간 후 가능 | 제한 없음 (확인: 재시도 제한 로직 미구현) |
| **외부 공인** | 취업/이직에 활용 | 사내 인사 평가 + 파견처 매칭 (외부 연계 없음) |
| **언어 선택** | 다수 언어 지원 | Java/JavaScript/SQL (3종) |

---

## 6. 랭킹 시스템 분석

### 6.1 설계 (DB) vs 구현 (코드) 간 갭

J-Bridge의 랭킹 시스템에는 **설계와 구현 사이에 상당한 갭**이 존재한다.

#### DB 설계 (00017_ranking_system.sql)

```
ranking_seasons:
  - id, name, start_date, end_date, is_active
  - 3개월 시즌 관리 설계
  - Partial Index: is_active=TRUE

user_rankings:
  - season_id, user_id
  - overall_score, jlpt_score, coding_score, attitude_score
  - coding_rank (S/A/B/C/D)
  - overall_rank, jlpt_rank, coding_rank_position, attitude_rank
  - UNIQUE(season_id, user_id)
```

#### 실제 구현 (src/lib/ranking.ts + ranking/page.tsx)

```
현재 구현:
  1. RSC(page.tsx)에서 profiles + japanese_skills + coding_skills 조회
  2. 클라이언트 라이브러리(ranking.ts)에서 실시간 계산
  3. ranking_seasons, user_rankings 테이블은 미사용 (확인)
```

### 6.2 실제 랭킹 계산 로직

**확인 (`src/lib/ranking.ts:L31-58`, `ranking/page.tsx:L16-45`):**

```
Step 1: RSC에서 데이터 조회
  profiles → japanese_skills (jlpt_normalized, it_japanese_normalized)
           → coding_skills (core_normalized, framework_normalized)

Step 2: computeRankingEntry()로 점수 계산
  japanese_score = is_japanese ? 200 : (jlpt_normalized + it_japanese_normalized)
  programming_score = core_normalized + framework_normalized
  overall_score = japanese_score + programming_score

  → 최대 overall_score = 400 (일본인: 200+200, 비일본인: 200+200)

Step 3: filterForCategory()
  - 'japanese' 카테고리 → 일본인 사용자 제외
  - 'overall', 'programming' → 전원 포함

Step 4: sortByCategory()
  - 선택 카테고리의 score 기준 내림차순 정렬

※ Attitude(Axis 5)는 랭킹 점수에 포함되지 않음 (확인)
```

### 6.3 설계-구현 갭 분석

| 항목 | DB 설계 | 실제 구현 | 갭 상태 |
|:-----|:-------|:---------|:--------|
| **시즌 관리** | `ranking_seasons` 테이블 (3개월 주기) | 시즌 개념 없음. 실시간 계산 | **미사용** |
| **랭킹 스냅샷** | `user_rankings` 테이블 (시즌별 저장) | 매 페이지 로드 시 실시간 계산 | **미사용** |
| **점수 구성** | overall, jlpt, coding, attitude 4분야 | overall, japanese, programming 3분야 | **불일치** |
| **Attitude 포함** | `attitude_score` 컬럼 존재 | 랭킹 계산에서 제외 | **설계만 존재** |
| **순위 저장** | `overall_rank` 등 4개 순위 컬럼 | 클라이언트 정렬로 순위 결정 | **미사용** |
| **Server Action** | 없음 (`src/app/actions/ranking.ts` 미존재) | RSC page에서 직접 조회 + lib 함수로 계산 | **Action 레이어 우회** |

### 6.4 현재 구현의 특성

**장점:**
- 항상 최신 점수 반영 (실시간 계산)
- 구현 단순함 (별도 동기화 불필요)

**한계:**
- 사용자 수 증가 시 매 페이지 요청마다 전체 사용자 조회 → 성능 저하 가능
- 시즌별 이력 추적 불가 (과거 랭킹 조회 불가)
- 순위 공유/외부 참조 시 일관성 미보장 (동시 접속 시 순위 다를 수 있음)

---

## 7. 점수 갱신 트리거 분석

### 7.1 recalculateUserScores() 호출 지점

| # | 호출 지점 | 파일:라인 | 호출 방식 | 트리거 |
|:-:|:---------|:---------|:---------|:------|
| 1 | `submitQuizAnswers()` | `quiz.ts:L101` | **비동기** `.catch(() => {})` | 퀴즈 제출 완료 |
| 2 | `submitAssessment()` | `assessment.ts:L133` | **동기** `await` | Assessment 제출 완료 |
| 3 | `submitCode()` | `coding.ts:L98` | **비동기** `.catch(() => {})` | 코딩 문제 제출 완료 |
| 4 | `recalculateAllScores()` | `scores.ts:L267` | **동기** 순차 `await` | Admin 일괄 재계산 |

### 7.2 점수 전파 경로

```
┌──────────────────────────────────────────────────────────────────────┐
│                       점수 전파 경로                                  │
│                                                                      │
│  Trigger Events:                                                     │
│                                                                      │
│  Quiz Submit ──┐                                                     │
│                ├──> recalculateUserScores(userId)                     │
│  Assessment ───┤         │                                           │
│  Submit        │         ├── 1. quiz_attempts 조회 (READ)            │
│                │         │    ├── Assessment 분리                     │
│  Code Submit ──┘         │    └── Regular 분리 → type별 best → avg   │
│                          │                                           │
│  Admin Batch ──────────> ├── 2. code_submissions 조회 (READ)         │
│  (all users)             │    └── 문제별 best ratio → 언어별 avg     │
│                          │                                           │
│                          ├── 3. coding_exam_attempts 조회 (READ)     │
│                          │    └── passed=true 최고 랭크              │
│                          │                                           │
│                          ├── 4. Axis 1~5 계산                        │
│                          │    └── Math.max(assessment, learning)     │
│                          │                                           │
│                          ├── 5. UPSERT japanese_skills (WRITE)       │
│                          ├── 6. UPSERT coding_skills (WRITE)         │
│                          ├── 7. UPSERT attitude_culture_skills (WRITE)│
│                          ├── 8. INSERT dispatch_readiness_scores     │
│                          │                                           │
│                          └── 9. revalidatePath()                     │
│                               ├── /dashboard                        │
│                               ├── /profile                          │
│                               └── /admin/reports                    │
└──────────────────────────────────────────────────────────────────────┘
```

### 7.3 호출되지 않는 경우

| 이벤트 | recalculateUserScores() | 이유 |
|:------|:----------------------:|:-----|
| Comprehensive Exam 완료 | **X** | 학습 과제 검증 목적. 5축 반영 대상 아님 (확인) |
| Range Quiz 완료 | **X** | DB에 결과 미저장. 암기 연습 목적 (확인) |
| Mastery 토글 | **X** | 암기 체크. 점수 산정과 무관 (확인) |
| Profile 수정 | **X** | 점수와 무관한 데이터 변경 |
| Coding Skill Exam 시작 | **X** | 아직 미완료. 제출 시에만 반영 |

### 7.4 일관성 우려 사항

**확인된 패턴 — fire-and-forget:**
```typescript
// quiz.ts:L101
recalculateUserScores(user.id).catch(() => {})

// coding.ts:L98
recalculateUserScores(user.id).catch(() => {})
```

**추정 리스크:**
1. **조용한 실패:** 점수 재계산 실패 시 에러가 무시됨. 사용자에게 알림 없음
2. **비원자적 갱신:** 7단계 DB 호출이 개별 트랜잭션 (04_data_architecture.md 4.2절 참조)
3. **동시 호출:** 퀴즈와 코딩 동시 제출 시 race condition 가능
4. **최종 일관성:** 비동기 호출이므로 퀴즈 결과 확인 시점에 점수 미갱신 가능

**보완 메커니즘:**
- `recalculateAllScores()`: Admin이 수동으로 전체 재계산 가능 (`scores.ts:L267-292`)
- `Math.max()` 패턴: 재계산 시 이전 최고 기록은 항상 보존
- Idempotent: 동일 입력에 대해 동일 결과 (읽기 기반 재계산)

---

## 8. 도메인 이벤트 흐름

### 8.1 핵심 도메인 이벤트와 핸들러

```
                    도메인 이벤트 흐름도

Event Producer           Event              Side Effects
─────────────────────────────────────────────────────────────

quiz.ts              QuizCompleted
submitQuizAnswers()      │
                         ├──> recalculateUserScores()     [비동기]
                         └──> checkAssignmentProgress()   [합격 시]
                                  │
                                  └──> learning_assignments 상태 갱신

assessment.ts        AssessmentCompleted
submitAssessment()       │
                         └──> recalculateUserScores()     [동기 await]

coding.ts            CodeSubmitted
submitCode()             │
                         ├──> code_reviews INSERT          [자동 리뷰]
                         └──> recalculateUserScores()     [비동기]

comprehensive-exam.ts  ExamRequested
requestExam()            │
                         ├──> Notification → mentor(s)
                         └──> Notification → admin(s)

comprehensive-exam.ts  ExamApproved
approveExam()            │
                         └──> Notification → mentee

comprehensive-exam.ts  ExamDenied
denyExam()               │
                         └──> Notification → mentee

comprehensive-exam.ts  ExamCompleted
submitExam()             │
                         └──> Notification → mentor(s)
                              [score, passed 포함]

assessment.ts          RetakeRequested
requestRetake()          │
                         ├──> quiz_attempts.retake_request_status = 'requested'
                         ├──> Notification → mentor(s)
                         └──> Notification → admin(s)

comprehensive-exam.ts  RetakeExamRequested
requestRetakeExam()      │
                         ├──> INSERT comprehensive_exams (status='requested')
                         ├──> Notification → mentor(s)
                         └──> Notification → admin(s)

scores.ts              ScoresRecalculated
recalculateUserScores()  │
                         ├──> UPSERT japanese_skills
                         ├──> UPSERT coding_skills
                         ├──> UPSERT attitude_culture_skills
                         ├──> INSERT dispatch_readiness_scores
                         └──> revalidatePath() (3 경로)
```

### 8.2 Notification 체계

**확인 (`comprehensive-exam.ts`, `assessment.ts`):** Notification 발송은 `createNotification()` 유틸리티 함수를 통해 수행된다.

```
createNotification(userId, type, title, message?, link?, relatedId?)

Notification Types:
  ├── 'retake_requested'  → Mentor/Admin에게
  ├── 'exam_requested'    → Mentor/Admin에게
  ├── 'exam_approved'     → Mentee에게
  ├── 'exam_denied'       → Mentee에게
  └── 'exam_completed'    → Mentor에게
```

**알림 발송 대상 결정 (`comprehensive-exam.ts:L41-85`):**
1. `mentor_mentee_assignments`에서 해당 mentee의 mentor(s) 조회
2. `profiles` WHERE `role = 'admin'`으로 전체 admin 조회
3. 각각에게 개별 Notification INSERT

### 8.3 Event-Driven 패턴 부재

현재 시스템에는 명시적 Event-Driven 아키텍처가 구현되어 있지 않다.

| 측면 | 현재 상태 | 개선 가능성 |
|:-----|:---------|:-----------|
| **이벤트 정의** | 암묵적 (Server Action 내 순차 호출) | Domain Event 클래스 정의 가능 |
| **이벤트 발행** | 함수 직접 호출 (`recalculateUserScores()`) | Event Bus/Queue 도입 가능 |
| **이벤트 구독** | 없음 (하드코딩된 호출 체인) | Event Handler 패턴 도입 가능 |
| **이벤트 저장** | `dispatch_readiness_scores`가 사실상 Event Sourcing의 스냅샷 역할 | Event Store 패턴으로 확장 가능 |
| **비동기 처리** | fire-and-forget (`catch(() => {})`) | Message Queue(Supabase Edge Functions) 도입 가능 |

**현재 패턴 평가:** Transaction Script 패턴으로 충분히 동작하며, 현 규모(사내 LMS, 소규모 사용자)에서는 과도한 추상화보다 현재의 직접 호출 패턴이 적절하다. 다만 `fire-and-forget` 패턴의 에러 로깅은 개선이 필요하다.

---

## 9. 타 문서 참조

| 문서 | 참조 내용 |
|:-----|:---------|
| **[01_system_overview.md](./01_system_overview.md)** | 2.3절 Server Actions 뮤테이션 패턴 — 본 문서의 시험 Action 파일들의 아키텍처적 위치. 4.2절 Actions 평가 — `scores.ts:recalculateUserScores()` 복잡도 지적 |
| **[02_folder_responsibility.md](./02_folder_responsibility.md)** | `src/app/actions/` 디렉토리 역할, `src/lib/assessment-config.ts` 등 공유 설정 파일 위치 |
| **[03_runtime_flow.md](./03_runtime_flow.md)** | 시험 제출 시 Server Action 실행 흐름, Judge0 polling 시퀀스, `revalidatePath()` 캐시 무효화 |
| **[04_data_architecture.md](./04_data_architecture.md)** | 3.1절 ERD — Quiz/Assessment/Exam 도메인 테이블 관계. 4.2절 트랜잭션 경계 — `recalculateUserScores()` 원자성 갭 분석. 7.3절 미사용 테이블 — `ranking_seasons`, `user_rankings` 미사용 추정 |
| **[05_network_and_infrastructure.md](./05_network_and_infrastructure.md)** | Judge0 API 네트워크 구성, Supabase Storage TTS 캐시 구조 |
| **[06_security_design.md](./06_security_design.md)** | `quiz_question_options_safe` View (정답 은닉), `ServiceRole` 사용 패턴 (Assessment retake 시 DELETE), 3-Tier RLS 구조 |
| **[08_scalability_analysis.md](./08_scalability_analysis.md)** | `recalculateAllScores()` 배치 성능, 랭킹 전체 사용자 조회 성능, 퀴즈 문항 수 증가에 따른 영향 |
| **[09_refactoring_candidates.md](./09_refactoring_candidates.md)** | `recalculateUserScores()` 262줄 분할 제안, 시즌 랭킹 구현, Attitude 세부 점수 분리, fire-and-forget 에러 처리 |
| **[10_learning_roadmap_for_architect.md](./10_learning_roadmap_for_architect.md)** | DDD 도메인 모델링 학습, Event-Driven Architecture 패턴, 점수 산정 로직 설계 패턴 |

---

## 부록 A: Assessment Quiz ID 매핑

**확인 (`src/lib/assessment-config.ts:L1-7`):**

| Step | Quiz ID (UUID) | 축 | 일본어 라벨 | 시간 제한 |
|:----:|:--------------|:---|:-----------|:--------:|
| 1 | `a0000001-0000-0000-0000-000000000001` | 生活日本語 | 生活日本語総合試験 | 25분 |
| 2 | `a0000002-0000-0000-0000-000000000002` | ビジネス日本語 | ビジネス日本語総合試験 | 25분 |
| 3 | `a0000003-0000-0000-0000-000000000003` | CS知識 | CS知識総合試験 | 30분 |
| 4 | `a0000004-0000-0000-0000-000000000004` | 開発実務能力 | 開発実務能力総合試験 | 30분 |
| 5 | `a0000005-0000-0000-0000-000000000005` | ビジネスリテラシー | ビジネスリテラシー総合試験 | 25분 |

## 부록 B: Assignment Category 매핑

**확인 (`src/lib/assignment-categories.ts:L16-63`):**

```
seikatsu (生活日本語)
  ├── levelOnly: true (N5~N1 레벨 선택)
  └── quizTypes: jlpt_vocab, jlpt_grammar, jlpt_reading, jlpt_listening

business-jp (ビジネス日本語)
  ├── glossary      → it_terminology
  ├── sentence-patterns → role_play_scenario
  └── expressions   → role_play_scenario

cs (CS知識)
  ├── basic-theory          → cs_knowledge
  ├── algorithms            → cs_knowledge
  ├── data-structures       → cs_knowledge
  ├── computer-architecture → cs_knowledge
  ├── database              → cs_knowledge
  ├── networking            → cs_knowledge
  └── security              → cs_knowledge

dev (開発実務能力)
  ├── java         → core_programming
  ├── javascript   → core_programming
  ├── spring-boot  → framework
  ├── react        → framework
  ├── nextjs       → framework
  ├── python       → core_programming
  └── sql          → core_programming

business-lit (ビジネスリテラシー)
  ├── attitude → attitude_culture
  ├── culture  → attitude_culture
  └── security → attitude_culture
```

## 부록 C: 핵심 파일 참조

| 파일 | 줄 수 | 핵심 역할 |
|:-----|:----:|:---------|
| `src/app/actions/scores.ts` | 293 | 5축 점수 재계산 엔진 (`recalculateUserScores`, `recalculateAllScores`) |
| `src/lib/assessment-config.ts` | 106 | Assessment 설정 (Quiz ID, Grade 변환, Axis 정의, 언어 그룹) |
| `src/app/actions/assessment.ts` | 263 | Assessment 제출/재시험 요청 |
| `src/app/actions/comprehensive-exam.ts` | 462 | 종합시험 CRUD + 승인 워크플로 |
| `src/app/actions/quiz.ts` | 115 | Regular Quiz 시작/제출 |
| `src/app/actions/coding.ts` | 151 | 코딩 제출 + Judge0 채점 + 코드 리뷰 |
| `src/app/actions/range-quiz.ts` | 222 | 범위 퀴즈 생성 (용어/단어 복습) |
| `src/lib/ranking.ts` | 74 | 클라이언트 랭킹 계산 (computeRankingEntry, sortByCategory) |
| `src/lib/assignment-categories.ts` | 74 | 과제/종합시험 카테고리 정의 |
| `src/lib/supabase/queries/assessments.ts` | 184 | Assessment 문항 랜덤 추출 (난이도/카테고리 밸런싱) |
| `supabase/migrations/00007_quiz_tables.sql` | 35 | 퀴즈 기본 테이블 DDL |
| `supabase/migrations/00015_coding_skill_exams.sql` | 24 | Paiza식 코딩 등급 시험 DDL |
| `supabase/migrations/00016_coding_exam_attempts.sql` | 14 | 코딩 시험 응시 기록 DDL |
| `supabase/migrations/00017_ranking_system.sql` | 37 | 랭킹 시즌/스냅샷 DDL (미사용) |
| `supabase/migrations/00025_assessment_system.sql` | 25 | Assessment 시스템 확장 DDL |
| `supabase/migrations/00028_assessment_restructure.sql` | 115 | is_japanese 분기, retake 시스템 DDL |
| `supabase/migrations/00034_mentor_mentee_system.sql` | 86 | 멘토링/과제/종합시험/알림 DDL |

---

> **작성 기준:** 소스 코드(`src/app/actions/`, `src/lib/`), 마이그레이션 파일(00007, 00015-00017, 00025, 00028, 00034), DB_Schema.md 기반 분석.
> **확인/추정 구분:** 소스 코드에서 직접 확인된 사항은 "확인", 코드 패턴에서 유추한 사항은 "추정"으로 명시.
