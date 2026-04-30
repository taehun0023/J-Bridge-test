# CS 콘텐츠 마이그레이션 요약 (Phase 9-C 핵심 인수 문서)

**최종 업데이트**: 2026-04-30
**대상 인수자**: 신규 운영자/개발자 (CS知識 종합시험·이해도テスト 담당)

본 문서는 2026년 3월~4월에 걸쳐 진행된 CS知識(Step3) 콘텐츠 거버넌스 작업의 핵심 결과를 1페이지로 압축한 것이다. 진행 중 산출된 30여 개 임시 문서(`docs/cs-*.md`, `docs/audit/cs_*`)는 본 요약본으로 대체되어 삭제되었다.

---

## 1. 마이그레이션 배경

- 기존 CS 종합시험은 `assessment-config` + `fetchStep3CsStyle` 의 step-3 selection 파이프라인에 묶여 있어, 카테고리·난이도·학습목표 정합성이 보장되지 않았다.
- 임시로 누적된 문제풀에는 `out_of_scope`(현 커리큘럼 범위 밖) / 중복 / `unset difficulty` / 한국어 혼용 / 정답 길이 편향 등 구조적 결함이 다수 존재.
- 목표: `교육컨텐츠 → 이해도테스트 → 종합시험` 흐름의 정합성을 확보하고, **종합시험 80문항(8 카테고리 × 10문제) 출제 가능한 최소 풀 + 품질 기준**을 구축한다.

## 2. 진행 단계 흐름

| 단계 | 산출물(삭제됨) | 핵심 결정 |
|------|----------------|-----------|
| Baseline Audit | `cs-comprehensive-baseline-audit.md` | 8개 카테고리(`basic_theory`/`data_structure`/`algorithm`/`computer_architecture`/`database`/`network`/`os`/`security`) × 4 lessons 구조 확정. 종합시험 목표 80문항 수립 |
| Classification Matrix | `cs-problem-classification-matrix.md`, `cs-problem-reclassification-worklist.md` | 모든 기존 문제를 `aligned / adaptable / out_of_scope` × `understanding_only / comprehensive_only / shared / exclude` 매트릭스로 분류 |
| First Pass Review | `cs-first-pass-review-summary.md`, `cs-question-review-sheet.md` | 명백한 범위이탈/오답누설 1차 정리 |
| Governance Spec | `cs-question-governance-spec.md`, `cs-governance-recount-spec.md`, `cs-persistence-migration-spec.md` | DB 메타데이터(question_subtype, scope, governance status) 표준 확정 |
| Second Pass Batches 1~9 | `cs-second-pass-governance-batch-{1..2}.md`, `cs-governance-batch-{3..9}-notes.md` | 카테고리별로 문항 추가/수정 시드 마이그레이션(00115~00122 계열) 작성 |
| Live Recount | `cs-governance-live-recount.md`, `*-after-00121.md`, `*-final.md` | Supabase 실데이터 카운트로 floor 충족 검증 |
| Quality Audit | `audit/cs_*_issues.md`, `audit/cs_*_validated.md`, `audit/cs_quality_audit_summary.md` | 696문제 전수 Investigator+Validator 감사. fix 마이그레이션 00155~00163 적용 |

## 3. 최종 결과 (2026-04-06 기준)

- **총 문항**: 696 approved (8 카테고리 합)
- **카테고리별 풀(approved/총)**: basic_theory 73/110, data_structure 63/93, algorithm 71/109, computer_architecture 51/71, database 83/130, network 61/90, os 30/30, security 111/154
- **종합시험 floor**: 모든 카테고리에서 `easy ≥ 9 / medium ≥ 15 / hard ≥ 6 / total ≥ 30` 충족 — 80문항 출제 안전
- **품질 감사**: High 이슈 15건 중 8건 CONFIRMED → 마이그레이션 00155로 수정. Medium(B5-a 길이편향) 533건 중 523건 CONFIRMED → 00156~00163 마이그레이션으로 504건 자동 수정
- **종합시험 출제 정책**: 카테고리당 10문제, 난이도 비율 `easy 30% / medium 50% / hard 20%` (= 3/5/2)

## 4. 핵심 결정사항 (운영 시 기준)

1. **분류 체계**: 신규 문제는 반드시 `category` + `difficulty(easy/medium/hard)` + `question_subtype` + `scope(understanding_only / comprehensive_only / shared)` 메타데이터를 부여한다. `out_of_scope`는 출제 풀에서 제외.
2. **난이도 정책**: `unset difficulty` 잔여분이 일부 카테고리(database/security/algorithm/basic_theory)에 남아있다. 이는 종합시험 출제 대상이 아니므로 우선순위는 낮으나, 이해도테스트 풀에서는 점차 명시적 난이도 부여 필요.
3. **중복 처리**: `cs-duplicate-pruning-candidates.md` 기준으로 중복 후보를 식별. 의미 중복은 통폐합, 형태만 다른 변형은 보존(난이도 분산용).
4. **품질 Rubric**: `docs/exam_quality_rubric.md` v2 기준 — A(본문)/B(선택지)/C(해설) 카테고리 위반 시 수정. 특히 **B5(정답 길이편향)** 은 자동검출 대상이므로 신규 출제 시 정답=중간 길이를 유지.
5. **부분 재사용 원칙**: 이해도테스트 풀과 종합시험 풀은 완전 공용이 아니다. `shared` 표시된 검증 완료 문제만 종합시험에 재사용.

## 5. 잔여 이슈 / 운영 시 주의점

- **correct=shortest 19건 수동 검토 필요**: B5-a 자동 수정 패턴(가장 긴 오답 패딩)으로 해결 불가. 정답 텍스트를 직접 늘리는 인간 검수 필요.
- **B5-b 재측정**: 00156~00163 적용 후 퀴즈별 정답=최장 비율(>30%) 재확인 필요.
- **`unset difficulty` 정리**: 종합시험 영향은 없으나, 이해도테스트 출제 다양성을 위해 점진적 라벨링 권장.
- **신규 문제 추가 절차**:
  1. 해당 lesson의 학습목표(Module ID 기준) 명시
  2. `aligned` 분류 + 난이도 + scope 부여
  3. `exam_quality_rubric.md` v2 self-check 통과
  4. 종합시험 풀 추가 시는 `shared` 또는 `comprehensive_only` 라벨

## 6. 관련 보존 문서

- `docs/exam_quality_rubric.md` — 품질 기준 (v2)
- `docs/content_strategy.md` — 콘텐츠 전체 소싱 전략
- `docs/FEATURE_LIST.md` — 기능 목록
- `supabase/migrations/00115_*` ~ `00163_*` — 실제 적용된 마이그레이션 SQL
