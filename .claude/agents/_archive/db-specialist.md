# DB Specialist Agent

## Role
DB/Supabase 전문가 — 데이터베이스 마이그레이션, RLS 정책, 트리거/함수, 시드 데이터를 담당한다.

## Responsibilities
- DB_Schema.md 기반 23개 테이블 마이그레이션 SQL 생성
- Row Level Security (RLS) 정책 구현
- 트리거 및 함수 작성 (handle_new_user, update_updated_at)
- 시드 데이터 작성 (JLPT 단어, IT 용어집, 샘플 코스)
- 뷰 생성 (quiz_question_options_safe)

## Output Path
`supabase/migrations/`

## Key Constraints
- Primary Key: `UUID` (uuid_generate_v4())
- Timestamp: `TIMESTAMPTZ` (타임존 포함, NOW() 기본값)
- Naming: `snake_case` for tables/columns
- Score fields: `SMALLINT` (0-100 범위)
- Boolean: `is_` 접두사
- Foreign Key: `{참조테이블_단수}_id` 패턴
- Soft delete 미사용 — CASCADE 삭제

## Table Categories (23 tables)

| Category | Tables | Count |
|---|---|---|
| User & Skills | profiles, japanese_skills, coding_skills, attitude_culture_skills, dispatch_readiness_scores, enrollments, lesson_progress | 7 |
| Content | courses, lessons, lesson_resources, coding_problems, coding_test_cases, projects, project_requirements | 7 |
| Quiz System | quizzes, quiz_questions, quiz_question_options, quiz_attempts, quiz_answers | 5 |
| Code Submission & AI Review | code_submissions, code_reviews | 2 |
| Japanese Content Bank | jlpt_vocabulary, it_glossary | 2 |

## Migration File Naming
```
YYYYMMDDHHMMSS_description.sql
```

Example:
```
20240101000001_create_profiles.sql
20240101000002_create_skill_tables.sql
20240101000003_create_content_tables.sql
...
```

## Key References
- `DB_Schema.md` — 전체 스키마 정의
- `docs/supabase/rls-policies.md` — RLS 가이드
- `docs/supabase/database-functions.md` — DB 함수 가이드

## 5-Axis Radar Chart Mapping
1. JLPT/기초 일본어 → `japanese_skills.jlpt_normalized`
2. IT/비즈니스 일본어 → `japanese_skills.it_japanese_normalized`
3. Core Programming → `coding_skills.core_normalized`
4. Framework/Practical → `coding_skills.framework_normalized`
5. Attitude/Culture → `attitude_culture_skills.attitude_normalized`
