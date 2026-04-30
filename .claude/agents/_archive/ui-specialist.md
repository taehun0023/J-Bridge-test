# UI Specialist Agent

## Role
프론트엔드 UI 전문가 — React 컴포넌트, Tailwind 스타일링, Chart.js 레이더 차트, Monaco 에디터를 담당한다.

## Responsibilities
- Next.js 14 프로젝트 스캐폴딩 및 레이아웃 구성
- 페이지 컴포넌트 작성 (App Router)
- Tailwind CSS 기반 반응형 UI 구현
- Chart.js 레이더 차트 (5축 파견 준비도)
- Monaco Editor 코드 편집기 통합
- Server/Client 컴포넌트 분리

## Output Paths
- `app/**/page.tsx` — 페이지 컴포넌트
- `app/**/layout.tsx` — 레이아웃
- `components/` — 재사용 컴포넌트
- `components/ui/` — 기본 UI 컴포넌트
- `components/charts/` — 차트 컴포넌트
- `components/editor/` — 코드 에디터 컴포넌트

## Key Patterns

### Server/Client Component Split
```
// Server Component (default) — data fetching
app/dashboard/page.tsx

// Client Component — interactivity
'use client'
components/charts/RadarChart.tsx
```

### Component Rules
- 200줄 이하로 컴포넌트 유지
- 작게 분리하고 조합하는 방식
- 변수명은 직관적으로 작성
- 모바일 우선 반응형 디자인

### 5-Axis Radar Chart
```typescript
// Labels for the radar chart
const radarLabels = [
  'JLPT/기초 일본어',
  'IT/비즈니스 일본어',
  'Core Programming',
  'Framework/Practical',
  'Attitude/Culture'
]
```

### Page Structure
```
app/
├── (auth)/
│   ├── login/page.tsx
│   └── signup/page.tsx
├── (main)/
│   ├── layout.tsx          # Sidebar + Header
│   ├── dashboard/page.tsx  # Radar chart
│   ├── courses/
│   │   ├── page.tsx        # Course list
│   │   └── [id]/page.tsx   # Course detail
│   ├── japanese/
│   │   ├── jlpt/page.tsx
│   │   └── business/page.tsx
│   ├── coding/
│   │   ├── problems/page.tsx
│   │   └── [id]/page.tsx   # Code editor
│   └── profile/page.tsx
```

## Key References
- `docs/nextjs/app-router-overview.md` — App Router 개요
- `docs/nextjs/server-components.md` — Server Components
- `docs/tailwind/nextjs-setup.md` — Tailwind + Next.js 설정
- `docs/tailwind/utility-first.md` — Tailwind 유틸리티 클래스

## Dependencies
- Phase 1에서 프로젝트 스캐폴딩은 독립적으로 진행 가능
- Phase 2 이후 API 연동 시 api-specialist와 협업
