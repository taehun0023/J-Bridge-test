# 일본어/Dev 콘텐츠 품질 감사 요약 (Phase 9-C 인수 문서)

**최종 업데이트**: 2026-04-30
**대상 인수자**: JP 콘텐츠 멘토 / Dev 실무 콘텐츠 멘토 / 신규 운영자

본 문서는 2026년 4월에 걸쳐 진행된 일본어(JLPT/BJ) 및 개발실무(Dev) 콘텐츠 품질 감사의 결과를 1페이지로 압축한 것이다. `docs/audit/` 폴더의 `_issues.md`/`_validated.md`/`_review.md` 파일들과 `docs/dev-*.md` / `docs/dev-overhaul-deliverables/` 폴더는 본 요약본으로 대체되어 삭제되었다.

---

## 1. 감사 작업 배경

- Phase 5 시드 데이터 확장(JLPT 1,293문제 / BJ 534문제 / Dev 300문제)과 Phase 7~8 풀 퀴즈화 완료 후, 자동 휴리스틱 기반의 1차 출제 품질 검증이 필요했다.
- `docs/exam_quality_rubric.md` v2 기준(A/B/C 카테고리 + A1-a BJ 전용 규칙)으로 카테고리별 Investigator → Validator → Fixer 3단계 워크플로우를 적용.
- 목표: 종합시험·이해도테스트 모든 풀에서 답안누설(A2), 길이편향(B5), 한글혼용(B8), 슬래시 표기(B6), TTS 마커 노출(L1) 등 구조적 결함을 일소.

## 2. JLPT (Step1, 生活日本語) 감사 결과

| 카테고리 | 대상 문항 | High | Medium(B5 등) | 주요 결함 | 상태 |
|---------|----------|------|----------------|-----------|------|
| 어휘 | 1,293 (N5~N1) | 소수 | 다수 | 보기 `/` 표기, 보기 길이 균등 | 완료 (Phase 7-A, 8-A) |
| 문법 | 130+a | 17건 (12 confirmed) | B5-a 다수 | 정답 노출, 문법표현 양자택일 포맷 | 완료 (00084 + audit fix) |
| 독해 | 200건 이슈 | 7건 (6 FIX) | 193건 | A2 답안누설(`喚起する` 등), B8 한국어 보기, 히라가나 N5 본문 | 완료 |
| 청해 | 157건 이슈 (180문항) | 99 L1 | B5 149건 | TTS 마커(`A：`, `店員：` 등) 음독, 청해 보기 길이 | 완료 (Strategy A/B/C/D 분류 적용) |

**핵심 발견**: 청해의 L1(TTS 마커) 99건은 **단순 마커 제거(D, 67건) / 질문 리라이트(B, 26건) / 호명 삽입(C, 6건)** 으로 분류 처리. 독해는 한국어 보기 48건이 `a0000002` quiz_id에 집중되어 일괄 일본어 리라이트.

## 3. BJ (Step2, ビジネス日本語) 감사 결과

| 카테고리 | 대상 문항 | CONFIRMED | DISMISSED | 주요 결함 | 상태 |
|---------|----------|-----------|-----------|-----------|------|
| vocabulary | 41건 이슈 | 39 | 0 (BORDERLINE 2) | B6 슬래시 (`검수/수령 확인` → `검수·수령 확인`), 7종 슬래시 텍스트 통일 | 완료 (00149~00154) |
| sentence_pattern | 33건 (1 High + 32 Medium + 1 B6) | 14 | 18 | B5-a 길이편향, A1-a false positive 1건 dismiss | 완료 |
| business_expression | 29건 | 13 | 12 (BORDERLINE 4) | B5-a 정답 최단/최장 패턴 | 완료 |
| keigo | 36건 (35 B5 + 1 B6) | 18 | 17 | B5-a, A1-a 검출 0건(재감사) | 완료 |

**A1-a 규칙(BJ 전용)**: "기술지식 의존 문제 금지" — Step2는 일본어력만으로 풀려야 함. 위반 시 DELETE 후보. 4월 재감사에서 검출 0건 — 기존 검증 유효.

## 4. Dev (Step5, 開発実務能力) 감사 결과

- **Subject inventory**: 8개 (Java, JavaScript, Python, SQL, Spring Boot, React, Next.js, CWF). Track 분기는 `profiles.target_coding_area` 로 Java Track(java + spring_boot + sql) / JS Track(javascript + react + sql).
- **종합시험 구조**: 60문제 / 60분 / 합격 70점. 각 subject 20문제(concept 10 + code_reading 10) × 3 subject. 난이도 `easy 3 / medium 5 / hard 2`.
- **분류 결과**: 정비 전 150 + 신규 150 = 300문제 모두 `aligned`, `out_of_scope` 0건. `quiz4_*_code.sql` 시리즈와 `quiz4_concept_expansion.sql` 로 코드읽기 + 개념 풀 확보.
- **완료 작업**: P0(question_subtype 컬럼 추가, 종합시험 60문제 구조 재편, 3차원 출제 로직 category×subtype×difficulty), P1(code_reading 작성, concept 보충 5과목 × 12문제) 모두 완료.
- **Cross-Review 평가(2026-03-18)**: 93/100 — 콘텐츠 품질 양호, 잔존 과제는 문서 문구 정리 수준.

## 5. 검증 완료 / 미완료 카테고리

| 영역 | 검증 완료 | 미완료/잔여 |
|------|-----------|-------------|
| JLPT | 어휘·문법·독해·청해 4개 모두 완료 (Phase 7~8) | 일부 N1 관용표현 보기 길이 미세조정 |
| BJ | vocabulary·sentence_pattern·business_expression·keigo 4개 완료 | reading 카테고리 일부 한국어 보기 잔존 검토 권장 |
| Dev | java·javascript·spring_boot·react·sql 5개 종합시험 대상 완료 | python·nextjs·cwf 이해도테스트 전용 — 별도 감사 미진행 |

## 6. 운영 시 콘텐츠 추가/수정 품질 기준

신규 문제 등록 또는 수정 시 반드시 `docs/exam_quality_rubric.md` v2 self-check 통과:

- **A1**: 학습목표 범위 내 지식만 요구 (BJ는 추가 A1-a — 일본어력만으로 풀이 가능해야 함)
- **A2**: 본문에 정답 핵심 키워드 노출 금지 (단, 의미 풀이형 등 A2-exempt 패턴은 예외)
- **A3**: 단일정답 명확. 동의어·포함관계 오답 금지
- **B5**: 정답이 항상 최장/최단이면 안 됨. 길이 편향 자동검출(B5-a/B5-b)
- **B6**: 슬래시(`/`)로 대안 표기 금지. `·` 또는 별도 텍스트화 (날짜·기술약어 SSL/TLS 등은 예외)
- **B8**: 일본어 콘텐츠에 한국어 보기 혼용 금지
- **L1** (청해 전용): 스크립트의 화자 마커(`A：`, `店員：`, `田中：`)는 TTS가 음독하므로 제거하거나 자연스러운 호명으로 대체
- **C9**: 해설은 최소 20자 이상 의미 있는 풀이

수정 권한: UPDATE만 허용 (문항수/ID/difficulty/category 불변). A1-a 위반 BJ 문제만 거버넌스 승인 후 DELETE 가능.

## 7. 관련 보존 문서

- `docs/exam_quality_rubric.md` — 품질 기준 v2 (전 도메인 공통)
- `docs/content_strategy.md` — 콘텐츠 전체 소싱 전략
- `docs/FEATURE_LIST.md` — 기능 목록
- `docs/cs-content-migration-summary.md` — CS知識 거버넌스 요약 (자매 문서)
- `supabase/migrations/00149~00163_*` — JP/CS audit fix 마이그레이션 SQL
