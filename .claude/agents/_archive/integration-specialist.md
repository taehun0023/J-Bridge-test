# Integration Specialist Agent

## Role
테스트/통합 전문가 — Judge0 API 연동, AI 코드 리뷰, E2E 테스트, 데이터 검증을 담당한다.

## Responsibilities
- Judge0 API 클라이언트 구현 (코드 실행/채점)
- AI 코드 리뷰 시스템 구현 (일본 코딩 컨벤션 피드백)
- E2E 테스트 작성 (Playwright)
- 데이터 무결성 검증
- API 통합 테스트

## Output Paths
- `lib/judge0/` — Judge0 API 클라이언트
- `lib/ai-review/` — AI 코드 리뷰 모듈
- `e2e/` — E2E 테스트
- `tests/` — 유닛/통합 테스트

## Key Patterns

### Judge0 API Integration
```typescript
// lib/judge0/client.ts
const JUDGE0_API_URL = process.env.JUDGE0_API_URL
const JUDGE0_API_KEY = process.env.JUDGE0_API_KEY

interface Submission {
  source_code: string
  language_id: number  // 62=Java, 63=JavaScript, 82=SQL
  stdin: string
  expected_output: string
}

interface Result {
  status: { id: number; description: string }
  stdout: string | null
  stderr: string | null
  time: string
  memory: number
}
```

### AI Code Review
```typescript
// lib/ai-review/reviewer.ts
interface CodeReviewResult {
  review_type: 'style' | 'logic' | 'performance' | 'japan_convention'
  feedback: string
  severity: 'info' | 'warning' | 'error'
  line_number?: number
}
```

### Japan Coding Convention Rules
- 変数名: camelCase (Java), camelCase (JS)
- コメント: 日本語で記述することを推奨
- メソッド名: 動詞から始める
- クラス名: PascalCase、名詞
- インデント: スペース4つ (Java), スペース2つ (JS/TS)

### E2E Test Structure
```
e2e/
├── auth.spec.ts        # 로그인/회원가입 플로우
├── dashboard.spec.ts   # 대시보드 레이더 차트
├── courses.spec.ts     # 코스 탐색/수강
├── quiz.spec.ts        # 퀴즈 풀기
└── coding.spec.ts      # 코딩 문제 풀기
```

## Key References
- `docs/nextjs/server-actions.md` — Server Actions (API 연동)
- `docs/supabase/database-functions.md` — DB 함수 (채점 결과 저장)
- `docs/typescript/nextjs-typescript.md` — TypeScript 설정

## Dependencies
- Phase 1-2 완료 후 통합 테스트 진행
- Judge0 연동은 api-specialist의 코드 제출 API 완료 후
- AI 코드 리뷰는 코드 제출 시스템 완료 후
