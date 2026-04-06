# BJ vocabulary カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 723
**Rubric**: docs/exam_quality_rubric.md v2 (B5-a: 1.2x, B5-b: 30%)

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 0건    | 0.0% |
| Medium  | 1건    | 0.1% |
| Low     | 2건    | 0.3% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 3 / 723 (0.4%)
**A2-exempt (필터링됨)**: 0건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|

**B5-b 위반 퀴즈**: 없음

## High 우선순위 이슈

_없음_

## Medium 우선순위 이슈

### Q-d0000002-0000-4000-a000-000000001118
- quiz_id: d0000001-0000-4000-a000-000000000101
- question_category: vocabulary, difficulty: 中級
- 클레임: 없음
- 위반 항목: [B6]
- question_text: "「HTTP」と「HTTPS」의 차이점은?"
- options:
  1. [정답] "HTTPS는 HTTP에 SSL/TLS 암호화가 추가된 것이다" (33자)
  2. "HTTPS는 HTTP보다 속도가 빠른 프로토콜이다" (27자)
  3. "HTTP와 HTTPS는 동일한 프로토콜이다" (23자)
  4. "HTTPS는 파일 전송 전용 프로토콜이다" (22자)
- 자동감지 근거:
  - **B6** (Medium): slash in option: "HTTPS는 HTTP에 SSL/TLS 암호화가 추가된 것이다"
---

## Low 우선순위 이슈

### Q-d5a277b5-a8b1-49e6-bfab-e280e9bbe1d0
- quiz_id: b1000001-0000-0000-0000-000000000008
- question_category: vocabulary, difficulty: 中級
- 클레임: 없음
- 위반 항목: [C9]
  근거: C9:explanation only 19 chars
---
### Q-961c84b6-4dcb-44d1-a5ea-4b7dc5856c45
- quiz_id: b1000001-0000-0000-0000-000000000008
- question_category: vocabulary, difficulty: 中級
- 클레임: 없음
- 위반 항목: [C9]
  근거: C9:explanation only 19 chars
---

## 거버넌스 이슈 (별도 마이그레이션 대상)

_없음_

## 자동감지 불가 항목 (수동 판단 필요)

- **A1 학습범위 준수 (A1-a 자동감지 외)**: 기술지식 의존 외 기타 범위 이탈은 수동 판단
- **A3 단일정답 보장**: 오답이 맥락상 정답이 될 가능성 수동 검토
- **B4 오답지 범위**: 오답 선택지가 BJ 학습 범위 내인지 확인
- **B6 상호배타 (동의어/포함관계)**: 슬래시 외 동의어·포함관계는 자동감지 불가
