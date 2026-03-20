# CS Knowledge 콘텐츠 상호 리뷰 결과

> **리뷰어:** Claude (Dev Practical Skills 담당)
> **리뷰 대상:** CS Knowledge 콘텐츠 + 코드 (GPT 담당 작업물)
> **기준 문서:** `docs/cs-knowledge-work-instruction-draft.md`
> **리뷰 일자:** 2026-03-18

---

## 종합 평가: 93/100 (양호 — 주요 정합성 이슈 해결, 일부 문서/제품 흐름 과제 잔존)

콘텐츠 자체는 고품질이며 업무지시서의 대부분의 요구사항을 충족. 메타데이터 스키마와 레슨 UI 정합성 이슈는 해결되었고, 남은 과제는 지시서 문구와 제품 흐름 정리 쪽에 가깝다.

---

## A. 과목 구조 (Section 3) — PASS

8개 과목 전부 구현 완료:

| 과목 | 모듈 ID | 라우트 | 상태 |
|------|---------|--------|------|
| Basic Theory | CSK-BT-01 | `/cs/basic-theory` | OK |
| Data Structures | CSK-DS-01 | `/cs/data-structures` | OK |
| Algorithms | CSK-AL-01 | `/cs/algorithms` | OK |
| Computer Architecture | CSK-CA-01 | `/cs/computer-architecture` | OK |
| Operating Systems | CSK-OS-01 | `/cs/operating-systems` | OK |
| Database | CSK-DB-01 | `/cs/database` | OK |
| Networking | CSK-NW-01 | `/cs/networking` | OK |
| Security | CSK-SC-01 | `/cs/security` | OK |

- `src/lib/cs-content.ts` (lines 73-82): SUBJECT_CONFIG 정상 매핑
- `src/lib/navigation.ts`: categoryChildren['cs'] 8개 항목 정상

**업데이트:**
- `/cs/os/` 빈 디렉토리 이슈는 정리 완료

---

## B. 콘텐츠 설계 원칙 (Section 5) — PASS

- 정적 콘텐츠, 동적 기능 불필요: OK
- 의미/경계/구분 설명: OK (예: CSK-SC-01-01 "認証と認可" 혼동 경계 명시)
- 레슨 독립 이해 가능: OK
- CS 내부 참조만 허용: OK
- 개발실무능력으로 리다이렉트 없음: OK

---

## C. 표준 콘텐츠 유닛 메타데이터 (Section 6) — PASS

전 16개 레슨의 `.meta.json` 확인 결과, 필수 필드 전부 존재:
- lesson_id, category, subject, topic, summary, key_points, misconceptions, check_questions, exam_extractables

**업데이트:**
- `difficulty` 필드는 전 16개 `.meta.json`에 추가 완료
- `estimated_read_minutes`는 MDX frontmatter의 `est_minutes`로 대체됨 (허용 가능)

---

## D. 레슨 템플릿 (Section 7) — PASS

8개 필수 섹션 전부 MDX 내에 존재 확인:

1. Learning Objectives (학습 목표) — 3~4항목 OK
2. Why This Concept Matters (개념 중요성) — 1문단 OK
3. Core Explanation (핵심 설명) — 산문체 OK
4. Structure/Mechanism Breakdown (구조/메커니즘) — 번호 순서 OK
5. Comparison With Similar Concepts (유사 개념 비교) — 1~3개 OK
6. Common Misunderstandings (오해) — 3개 이상 OK
7. Check Questions (확인 질문) — 4개 OK
8. Exam Extraction Notes (출제 메모) — 존재 OK

---

## E. 시험 추출 필드 (Section 7.8 + 8) — PASS

### 현재 상태

| 업무지시서 요구 | 현재 구현 | 상태 |
|----------------|----------|------|
| `contrast_candidates` | `contrast_candidates` | OK |
| `mechanism_sequence_candidates` | 존재 | OK |
| `wrong_answer_patterns` | `wrong_answer_patterns` | OK |

### 필드 내용 충족도

- 사실 후보 3개 이상: OK
- 대비 후보 2개 이상: OK
- 시나리오 후보 1개 이상: OK (각 2개씩 있음)
- 오답 패턴 2개 이상: OK

### 업데이트

1. **16개 `.meta.json` 전부**: `contrast_candidates`, `wrong_answer_patterns`, `mechanism_sequence_candidates` 반영 완료
2. **`src/lib/cs-content.ts`**: CsLessonMeta 인터페이스 업데이트 완료

---

## F. 작성 규칙 (Section 9) — PARTIAL

- 설명적 산문체: OK
- 개념적 예시 (프레임워크 비의존): OK
- 구현 워크스루 없음: OK
- 제품/브랜드 의존 없음: OK
- 면접 준비 문구 없음: OK

### 언어 우선순위 불일치

업무지시서 Section 9: **"Define terms in plain Korean first, then refine technically"**
실제 구현: **일본어 우선**, 한국어 번역 제공 (`default_language: "ja"`)

**판단:** 이것은 프로젝트 전체 방향(일본 파견 대상 LMS)에 맞는 의도적 변경으로 보임. 다만 업무지시서 자체가 이를 반영하지 못하고 있으므로, **업무지시서 업데이트 또는 이 변경에 대한 명시적 문서화**가 필요.

---

## G. 금지 패턴 (Section 10) — PASS

- 이해도 테스트 별도 과목 없음: OK
- Java/Spring/React/SQL 프레임워크 실습 없음: OK
- 레슨 내 코드 실행 없음: OK
- 동적 위젯 불필요: OK
- 용어집만으로 축소되지 않음: OK

---

## H. 파일 구조 (Section 12) — PASS

업무지시서 권장:
```
cs-knowledge/<subject>/<lesson-id>.mdx
```

실제 구현:
```
cs-knowledge/modules/<MODULE-ID>/lessons/<LESSON-ID>.mdx
```

**판단:** 모듈 기반 구조가 더 체계적이며, 과목당 여러 레슨 관리에 적합. 허용.

---

## I. 코드 리뷰

### `cs-content.ts` — OK

- 8개 과목 매핑 정상
- `readModule()` 로직 정상 (ja 기본, ko 제외 필터링)
- exam_extractables 타입이 현재 메타데이터와 정합
- 과목 순서도 명시 배열 기반으로 고정되어 암묵적 객체 순서 의존이 줄어듦

### `CsStaticSubjectPage.tsx` — OK

- 레슨 목록 정상 표시
- 시간/태그/요약 표시

### `CsStaticLessonPage.tsx` — OK

현재 사이드바에 표시되는 항목:
- Key Points (key_points) — OK
- Misconceptions (misconceptions) — OK
- Check Questions (check_questions) — OK
- Exam Extraction: Contrasts + Mechanisms + Scenarios + Wrong Answers — OK

**남은 검토 사항:**
- Learning Objectives를 key_points와 별도로 표시할지 여부는 UX 선택 사항
- Why This Concept Matters를 본문 외 카드로 중복 노출할지는 선택 사항

### 과목 페이지 (8개) — OK

전부 동일 패턴으로 정상 구현.

### 레슨 라우트 `[lessonId]/page.tsx` — OK

---

## J. 전체 수정 사항 목록

### 필수 (Must Fix)

| # | 대상 | 내용 | 이유 |
|---|------|------|------|
| 없음 | - | 현재 필수 수정 사항은 해소됨 | - |

### 권장 (Should Fix)

| # | 대상 | 내용 | 이유 |
|---|------|------|------|
| 1 | 업무지시서 | 언어 우선순위를 Japanese first 기준으로 갱신 | 실제 구현 방향과 지시서 정합성 필요 |
| 2 | 업무지시서 | 모듈 기반 파일 구조를 공식 반영 | 현재 구현과 지시서 정합성 필요 |
| 3 | 제품 흐름 | static lesson과 legacy quiz 관계를 더 명확히 설명 | 사용자 정보 구조 측면 개선 여지 |

### 참고 (Note)

| # | 대상 | 내용 |
|---|------|------|
| 1 | 과목 페이지/허브 | 이해도 테스트 목록으로 가는 브리지 링크 추가됨 |
| 2 | CS 레슨 상세 | `?lang=ko` URL 공유 및 새로고침 보존 가능 |
