# CS知識 품질 감사 종합 리포트

**감사일**: 2026-04-06
**대상**: CS知識(Step3) 종합시험 8개 카테고리, 696문제
**Rubric**: docs/exam_quality_rubric.md v2

## 감사 결과 요약

### Investigator 결과

| 카테고리 | 문제 수 | High | Medium | Low | 클레임 |
|---------|--------|------|--------|-----|-------|
| algorithm | 74 | 0 | 47 | 0 | 0 |
| data_structure | 65 | 0 | 42 | 0 | 0 |
| network | 82 | 0 | 66 | 0 | 0 |
| os | 127 | 4 | 96 | 0 | 4 |
| database | 85 | 0 | 74 | 0 | 0 |
| security | 113 | 4 | 100 | 0 | 1 |
| basic_theory | 76 | 5 | 44 | 0 | 0 |
| computer_architecture | 74 | 2 | 60 | 0 | 0 |
| **합계** | **696** | **15** | **529** | **0** | **5** |

### Validator 결과

**High 이슈 (15건)**:
- CONFIRMED: 8건
- DISMISSED: 7건 (수치 계산 false positive 3, 용어 정의 패턴 1, 테스트 클레임 1, 중복출제 1, 집합 원소 중복 1)

**Medium 이슈 (B5-a, 533건)**:
- CONFIRMED: 523건
- DISMISSED: 10건 (word-level avg ≤ 8 chars, length diff ≤ 2)
- 수정 자동 생성: 504건
- 수동 검토 필요 (correct=shortest): 19건

### 수정 마이그레이션

| # | 파일 | 내용 | UPDATE 수 |
|---|------|------|-----------|
| 00155 | fix_cs_high_quality.sql | A2 답안누설 + B8 한글혼용 | 21 |
| 00156 | fix_cs_algorithm_b5a.sql | algorithm B5-a 길이편향 | 46 |
| 00157 | fix_cs_data_structure_b5a.sql | data_structure B5-a | 38 |
| 00158 | fix_cs_network_b5a.sql | network B5-a | 64 |
| 00159 | fix_cs_os_b5a.sql | os B5-a | 96 |
| 00160 | fix_cs_database_b5a.sql | database B5-a | 71 |
| 00161 | fix_cs_security_b5a.sql | security B5-a | 93 |
| 00162 | fix_cs_basic_theory_b5a.sql | basic_theory B5-a | 37 |
| 00163 | fix_cs_computer_architecture_b5a.sql | computer_architecture B5-a | 59 |
| **합계** | | | **525** |

### 주요 발견

1. **B5-b 퀴즈별 정답=최장 비율이 거의 모든 퀴즈에서 FAIL** (>30%)
   - 일부 퀴즈는 100% (정답이 항상 최장)
   - 근본 원인: 정답을 더 상세히 서술하는 출제 패턴

2. **수정 전략**: 가장 긴 오답 1개를 정답보다 길게 패딩
   - 정답 텍스트 불변
   - 오답에 기술적으로 그럴듯하지만 틀린 세부 사항 추가
   - 문법 패턴별 자연스러운 일본어 패딩 (する→ことを目的とした, ない→とされている 등)

3. **correct=shortest 19건은 수동 검토 필요** — 오답을 줄일 수 없으므로 별도 접근 필요

### 미해결 사항

- correct=shortest 19건: 정답 텍스트 변경 없이는 자동 수정 불가
- B5-b 재측정: 수정 후 퀴즈별 비율 재확인 필요
