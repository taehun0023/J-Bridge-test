# CS Persistence Migration Spec

## Purpose
- This document locks the DB-side persistence shape required by the new CS comprehensive exam.
- It accompanies migration `00117_cs_comprehensive_exam_questions.sql`.

## Why This Exists
- Current comprehensive exam runtime stores:
  - exam metadata in `comprehensive_exams`
  - submitted answers in `comprehensive_exam_answers`
- It does **not** store the original presented question set.
- Because of that, `loadExamQuestions` can regenerate a different set on refresh.

## New Table
- `comprehensive_exam_questions`

## Column Design
- `id`
  - surrogate primary key
- `exam_id`
  - FK to `comprehensive_exams`
- `question_id`
  - FK to `quiz_questions`
- `question_category`
  - denormalized snapshot for reporting/debugging
- `difficulty`
  - denormalized snapshot for reporting/debugging
- `sort_order`
  - preserves the presented order
- `created_at`
  - audit timestamp

## Constraints
- unique `(exam_id, question_id)`
  - prevents duplicate question insertion into one exam
- unique `(exam_id, sort_order)`
  - preserves one stable slot per question position

## RLS Model
- `admin_read`
  - admins can inspect persisted sets
- `user_own`
  - exam owner can read/write rows tied to their own exam

## Why A Join Table Instead Of JSON
- simpler ordering guarantees
- cleaner join path for review/reporting
- easier debugging and admin inspection
- easier future analytics by category/difficulty/source

## Runtime Impact

### `startExam`
- generate selected question set
- insert rows into `comprehensive_exam_questions`
- render from persisted rows

### `loadExamQuestions`
- read existing rows from `comprehensive_exam_questions`
- never regenerate for an in-progress comprehensive exam

### `submitExam`
- grading can continue to rely on submitted answers
- but review integrity now has an authoritative presented-question source

### `review.ts`
- can continue using `comprehensive_exam_answers.sort_order`
- later should prefer joining through `comprehensive_exam_questions` when answers are partial or missing

### `weakness-report.ts`
- current logic can remain answer-based
- future diagnostics can join persisted question metadata without rehydrating from raw question lookup only

## Migration Dependency
- This migration is useful for all comprehensive exams.
- It is mandatory for the rebuilt CS comprehensive exam.

## Next Required Code Changes
1. write rows in `startExam`
2. read rows in `loadExamQuestions`
3. keep `sort_order` stable between presented questions and submitted answers
4. add tests for reload integrity
