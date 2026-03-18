# Dev Practical Skills 셀프 리뷰 결과

> **리뷰어:** Claude (Dev Practical Skills 담당)
> **리뷰 대상:** Dev Practical Skills 콘텐츠 + 코드
> **기준 문서:** `docs/dev-practical-skills-work-instruction-draft.md`
> **리뷰 일자:** 2026-03-18

---

## 종합 평가: 85/100 (양호 — 수정 필요 사항 있음)

8개 과목 33개 레슨 전부 구현 완료. 콘텐츠 품질과 구조는 우수하나, 메타데이터 필드 누락 및 check_questions 수 부족이 주요 이슈.

---

## A. 과목 구조 (Section 3) — PASS

8개 과목 전부 구현 완료:

| 과목 | 모듈 수 | 라우트 | 상태 |
|------|---------|--------|------|
| Common Workplace Fundamentals | 8 | `/dev/cwf` | OK |
| Java | 4 | `/dev/java` | OK |
| JavaScript | 4 | `/dev/javascript` | OK |
| Python | 3 | `/dev/python` | OK |
| SQL | 3 | `/dev/sql` | OK |
| Spring Boot | 4 | `/dev/spring-boot` | OK |
| React | 4 | `/dev/react` | OK |
| Next.js | 3 | `/dev/nextjs` | OK |

- `src/lib/dev-content.ts`: SUBJECT_CONFIG에 8개 과목 정상 매핑
- `src/lib/navigation.ts`: categoryChildren['dev'] 8개 항목 정상
- CWF는 8개 토픽 패밀리 전부 포함 (Section 9 요구사항 충족)

---

## B. 콘텐츠 설계 원칙 (Section 5) — PASS

- 정적 설명 중심 콘텐츠: OK
- 실무 상황 해석 중심: OK (Practical Reading Scenario 섹션 존재)
- 시험 추출 메타데이터 포함: OK
- CWF가 정식 과목으로 존재: OK
- CS Knowledge 참조 없음: OK (전 레슨 파일에서 CS 참조 미발견)

---

## C. 표준 콘텐츠 유닛 메타데이터 (Section 6) — PARTIAL (수정 필요)

전 33개 레슨의 `.meta.json` 확인 결과, 존재하는 필드:
- lesson_id, category, subject, topic, summary, key_points, misconceptions, check_questions, exam_extractables

**지적 사항:**
- `estimated_read_minutes` 필드 누락 — 업무지시서 Section 6에서 요구하지만 meta.json에 없음
- `difficulty` 필드 누락 — 업무지시서 Section 6에서 요구하지만 meta.json에 없음
- `DevLessonMeta` 인터페이스(`dev-content.ts`)에도 해당 필드 미정의

---

## D. 레슨 템플릿 (Section 7) — PASS

7개 필수 섹션 전부 MDX 내에 존재 확인 (일본어 헤딩):

1. 学習目標 (Learning Objectives) — 4~5항목 OK
2. 業務コンテキスト (Work Context) — 실무 상황 설명 OK
3. 要点解説 (Core Explanation) — 산문체 + 코드 스니펫 OK
4. 実務解釈シナリオ (Practical Reading Scenario) — 2개 이상 OK
5. よくあるミス (Common Mistakes Or Misreadings) — 4~5개 OK
6. 確認質問 (Check Questions) — MDX 내 5개 존재
7. 出題抽出メモ (Exam Extraction Notes) — 존재 OK

---

## E. 시험 추출 필드 (Section 7.7 + 8) — PARTIAL (수정 필요)

### 필드명 불일치

| 업무지시서 요구 | 실제 구현 | 영향도 |
|----------------|----------|--------|
| `wrong_answer_patterns` | `common_wrong_answer_patterns` | **하** — 의미적 차이 미미 |

### 필드 내용 충족도

- fact_candidates 2개 이상: OK
- practical_judgment_candidates 1개 이상: OK
- error_interpretation_candidates 1개 이상: OK
- scenario_candidates 2개 이상: OK
- common_wrong_answer_patterns 2개 이상: OK

### UI 표시 범위

`DevStaticLessonPage.tsx` 사이드바에서 표시되는 항목:
- Practical Judgment — OK
- Error Interpretation — OK
- Scenarios — OK

**표시되지 않는 항목:**
- fact_candidates — 사이드바 미표시
- common_wrong_answer_patterns — 사이드바 미표시

---

## F. Check Questions 수 — FAIL (수정 필요)

업무지시서 Section 7.6: **4~6개** 요구

| 위치 | 실제 수 | 판단 |
|------|---------|------|
| MDX 본문 내 確認質問 | 5개 | OK |
| `.meta.json` check_questions | **3개** | **FAIL** |

전 33개 레슨의 meta.json에서 check_questions가 3개로 통일되어 있음. MDX에는 5개가 있으므로 meta.json이 MDX와 동기화되지 않은 상태.

---

## G. 작성 규칙 (Section 10) — PARTIAL

- 정적이고 읽기 가능한 예시: OK
- 코드 스니펫은 해석 보조용: OK
- 실행 불필요: OK
- CS Knowledge 사전 지식 불필요: OK

### 언어 우선순위 불일치

업무지시서 Section 10: **"Use Korean explanatory prose with practical examples"**
실제 구현: **일본어 우선** (`default_language: "ja"`), 한국어 번역 별도 제공

**판단:** 프로젝트 전체 방향(일본 파견 대상 LMS)에 맞는 의도적 변경. CS Knowledge와 동일한 패턴. 업무지시서 업데이트가 필요.

---

## H. 금지 패턴 (Section 11) — PASS

- 이해도 테스트 별도 과목 없음: OK
- CS Knowledge와 합치지 않음: OK
- 동적 랩/에디터 의존 없음: OK
- 퀴즈 컬렉션으로만 구성되지 않음: OK
- CWF 생략하지 않음: OK

---

## I. 파일 구조 (Section 13) — PASS

업무지시서 권장:
```
data/training-content-factory/content/dev-practical-skills/<subject>/
```

실제 구현:
```
data/training-content-factory/content/dev-practical-skills/modules/<MODULE-ID>/lessons/
```

**판단:** 모듈 기반 구조가 더 체계적이며, CS Knowledge와 동일한 패턴. 허용.

각 레슨 디렉토리에 3개 파일:
- `{LESSON-ID}.mdx` (일본어)
- `{LESSON-ID}.ko.mdx` (한국어)
- `{LESSON-ID}.meta.json` (메타데이터)

---

## J. 코드 리뷰

### `dev-content.ts` — OK (필드 추가 필요)

- 8개 과목 매핑 정상
- `getDevSubjectContent()` / `getDevLessonDetail()` 로직 정상
- 일본어 기본, 한국어 토글 지원
- **수정 필요:** DevLessonMeta에 `estimated_read_minutes`, `difficulty` 필드 추가

### `DevStaticSubjectPage.tsx` — OK

- 모듈별 레슨 목록 정상 표시
- 레벨 배지 (foundation/intermediate/advanced) 표시
- EmptyState 처리

### `DevStaticLessonPage.tsx` — PARTIAL

- 사이드바 메타데이터 표시: key_points, check_questions, exam_extractables 일부
- **수정 필요:** fact_candidates, common_wrong_answer_patterns 사이드바 표시 추가 검토
- **수정 필요:** misconceptions 사이드바 카드 추가 검토 (meta.json에 데이터 존재)

### 허브 페이지 (`dev/page.tsx`) — NOTE

- DevTestBlock 컴포넌트가 허브에 렌더링됨 (퀴즈 진입점)
- 정적 레슨이 주요 학습 표면이어야 한다는 업무지시서 방향과 다소 충돌
- 기능적 문제는 아니지만, 학습 흐름의 우선순위 정리 필요

### 과목 페이지 (8개) — OK

전부 동일 패턴으로 정상 구현.

### 레슨 라우트 `lessons/[lessonId]/page.tsx` — OK

- lang 쿼리 파라미터 지원 (기본값 'ja')

---

## K. Codex 상호 리뷰 결과와의 대조

`docs/dev-practical-skills-review-from-codex.md`에서 지적된 4개 항목과 본 셀프 리뷰 결과 대조:

| Codex 지적 | 셀프 리뷰 확인 | 일치 |
|-----------|--------------|------|
| 1. estimated_read_minutes, difficulty 누락 | Section C에서 동일 확인 | O |
| 2. check_questions 4~6개 미충족 | Section F에서 동일 확인 (meta.json 3개) | O |
| 3. 허브 페이지 DevTestBlock 문제 | Section J에서 동일 확인 | O |
| 4. 언어 정책 업무지시서 drift | Section G에서 동일 확인 | O |

---

## L. 전체 수정 사항 목록

### 필수 (Must Fix)

| # | 대상 | 내용 | 이유 |
|---|------|------|------|
| 1 | 33개 `.meta.json` | `estimated_read_minutes` 필드 추가 | 업무지시서 Section 6 필수 메타데이터 |
| 2 | 33개 `.meta.json` | `difficulty` 필드 추가 | 업무지시서 Section 6 필수 메타데이터 |
| 3 | 33개 `.meta.json` | `check_questions`를 4~6개로 확장 (MDX 본문과 동기화) | 업무지시서 Section 7.6 요구사항 |
| 4 | `dev-content.ts` | DevLessonMeta에 `estimated_read_minutes`, `difficulty` 필드 추가 | 타입 정합성 |

### 권장 (Should Fix)

| # | 대상 | 내용 | 이유 |
|---|------|------|------|
| 5 | 33개 `.meta.json` | `common_wrong_answer_patterns` → `wrong_answer_patterns` 리네임 | 업무지시서 Section 7.7 필드명 일관성 |
| 6 | `DevStaticLessonPage.tsx` | fact_candidates, wrong_answer_patterns 사이드바 표시 추가 | 메타데이터 활용도 향상 |
| 7 | `DevStaticLessonPage.tsx` | misconceptions 사이드바 카드 추가 | meta.json에 데이터 존재하나 UI 미표시 |
| 8 | `dev/page.tsx` | DevTestBlock의 위치/우선순위 재검토 | 정적 레슨 중심 학습 흐름과 정합성 |

### 참고 (Note)

| # | 대상 | 내용 |
|---|------|------|
| 9 | 업무지시서 | 언어 우선순위를 "Korean first"에서 "Japanese first (Korean available)"로 반영 필요 |
| 10 | 파일 구조 | 모듈 기반 구조는 업무지시서 권장과 다르지만 CS와 일관된 더 나은 선택이므로 지시서 업데이트 권장 |
| 11 | 언어 토글 | 선택 언어가 URL에 반영되지 않아 새로고침 시 초기화됨 (CS Knowledge와 동일 이슈) |
