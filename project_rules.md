기술 스택 정의: "Next.js 14(App Router), TypeScript, Tailwind CSS, Supabase를 사용해."

코딩 스타일: "컴포넌트는 작게 분리하고, 변수명은 직관적으로 작성해."

DB 네이밍 컨벤션:
- 테이블명/컬럼명: `snake_case` (예: `japanese_skills`, `vocab_mastery`)
- Primary Key: `UUID` 타입, `uuid_generate_v4()` 사용
- Timestamp: `TIMESTAMPTZ` (타임존 포함, `NOW()` 기본값)
- Boolean 컬럼: `is_` 접두사 (예: `is_correct`, `is_published`, `is_sample`)
- Foreign Key: `{참조테이블_단수}_id` 패턴 (예: `user_id`, `course_id`, `quiz_id`)
- 정규화 점수: `{항목}_normalized` 또는 `{항목}_score` (0-100 범위, SMALLINT)
- 정렬 컬럼: `sort_order INTEGER DEFAULT 0`
- Soft delete 미사용: 불필요한 데이터는 CASCADE로 삭제
