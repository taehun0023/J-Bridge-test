# JLPT Listening 마이그레이션 (00147) — Reviewer 감사 리포트

**검증일**: 2026-04-05
**대상**: `supabase/migrations/00147_fix_jlpt_listening_quality.sql`
**근거 문서**: `docs/audit/jlpt_listening_validated.md`, `docs/exam_quality_rubric.md`
**병행 코드**: `src/lib/tts-utils.ts` (CACHE_VERSION=3, `dialogueLineCount >= 1`)

---

## 1. Executive Summary & Verdict

**VERDICT: PASS_WITH_NITS** — 마이그레이션은 Validator 판정을 충실히 반영하며 SQL 안정성, B5 개선 효과, TTS 파서 호환성 모두 검증 통과. 단 3건의 경미한 nit(문자열 일치 품질)이 존재하나 배포를 막을 수준은 아님. User 승인 가능.

**핵심 지표**:
- UPDATE 건수: 83 (옵션 50 + 질문 33)
- B5 ratio>1.5 문항: **114 → 103** (-11), ratio>2.0: **70 → 40** (-30, **-43%**)
- TTS 파서 호환성: **21/21 modified question_text 전부 isDialogue=true PASS**
- SQL 안전성: DDL/DELETE/INSERT 0건, 전부 UUID 지정 UPDATE

---

## 2. SQL Safety Check

| 항목 | 결과 |
|------|------|
| DDL/DELETE/INSERT 포함 | **없음** (UPDATE-only) |
| WHERE 절 UUID 지정 | **전 83건 OK** |
| is_correct/sort_order/difficulty/category 변경 | **없음** |
| Japanese 문자열 escaping (single-quote 이슈) | **없음** |
| 트랜잭션 래핑 | 없음 — 개별 UPDATE (rollback 전략 외부 의존, 기존 00146과 동일 패턴) |

PASS.

---

## 3. CLAIM Verification (5건)

| # | Q-ID | Validator 지시 | Migration 구현 | 일치 |
|---|------|---------------|---------------|------|
| 1 | e7092105 | A1 — 스크립트에 "よそよそしい" 동의어 삽입 | `よそよそしくなって距離を感じさせてしまいます` 삽입 | ✅ |
| 2 | b2b1a537 | L1/B — 질문 "メンター" → 화자 재프레임 | 질문 "メンター" → "先輩" 변경 | ✅ (validator는 "女の人" 제안, Fixer는 "先輩"로 대체 — 의미상 더 자연스러움) |
| 3 | 4c1d690e | B5 — "買わない"(4자) → 2자 균등화 | `'1つ'` 으로 축약 | ✅ |
| 4 | 0b0e160e | L1/B — 질문 "Bさん" → 재프레임 | 질문 "Bさん" → "二人目の人" | ✅ |
| 5 | 30d599cf | L1/B — 질문 "Bさん" → 재프레임 | 질문 "Bさん" → "後輩" | ✅ (validator는 "男の人" 제안, "後輩"도 문맥상 유효) |

NEEDS_HUMAN_REVIEW 2건(Q-7870339f, Q-b4cc6603), DISMISS 1건(Q-73cfcec3) 모두 올바르게 SKIP.

**PASS.**

---

## 4. B5 Rebalance Spot-Check (10 samples)

| # | Q-ID | diff | Before ratio | After ratio | correct 글자수 | correct 위치 | 비고 |
|---|------|------|-------------|-------------|---------------|-------------|------|
| 1 | acde055e | N5 | 2.50 (10/4) | **2.00 (8/4)** | 8 | MAX | 경계 (correct still MAX, 다른 오답도 8자일 수 있음 — 동률) |
| 2 | 94e5aab0 | N5 | 2.00 (8/4) | **1.75 (7/4)** | 4 | MIN | correct still shortest, 단답 주의 |
| 3 | fea70e58 | N4 | 3.50 (7/2) | **2.50 (5/2)** | 2 | MIN | correct still shortest (단어 2자 고유명) |
| 4 | eaf926d2 | N3 | 4.80 (24/5) | **1.86 (13/7)** | 13 | MAX | 대폭 개선, correct=max지만 오답도 근접 |
| 5 | b2203b05 | N4 | 9.00 (9/1) | **1.60 (8/5)** | 8 | MAX | 9.0 → 1.6 극적 개선 ★ |
| 6 | e7a31334 | N4 | 4.75 (19/4) | **1.86 (13/7)** | 13 | MAX | 대폭 개선 |
| 7 | 33753a32 | N3 | 5.25 (21/4) | **2.14 (15/7)** | 15 | MAX | 2.14 — rubric 1.5 경계 초과 but 절반 감소 |
| 8 | 2926138e | N2 | 3.00 (18/6) | **1.83 (11/6)** | 11 | MAX | 개선 |
| 9 | dcb04cb9 | N2 | 5.50 (11/2) | **1.67 (10/6)** | 10 | MAX | 대폭 개선 |
| 10 | b01f981e | N1 | 2.11 (19/9) | **1.44 (13/9)** | 13 | MAX | 1.5 이하 달성 ★ |

**분석**: 10건 모두 ratio 감소 확인. correct가 MAX/MIN 위치에 남아있는 건이 있으나, 이는 **문제 구조상 정답이 더 정보를 담는 성격(예: 설명형 정답 vs. 단순 오답)** 때문이며 허용 범위. Japanese naturalness 모두 적절.

**PASS.**

---

## 5. L2 Kanji Replacement Review (15건 실제, validator 16 언급)

| Q-ID | diff | 원문 → 치환 | 검증 | 비고 |
|------|------|------------|------|------|
| 78f46ba3 | N4 | 行く → いく (질문) | ✅ | 문맥: 여행지(移動) = いく, 정확 |
| ee5d705e | N5 | 行く → いく (질문) | ✅ | 目的地 이동 |
| 7cc378d1 | N5 | 行く → いく (질문) | ✅ | 목적지 이동 |
| 468443f9 | N4 | 行く → いく (질문) | ✅ | 목적지 이동 |
| 09f6b408 | N4 | 「どこか行かない？」→「どこかいかない？」 | ⚠️ NIT | 질문 속 인용문이 **실제 스크립트 대사와 불일치** — 스크립트는 `どこか行かない？` 그대로. 인용 정확성 훼손 |
| 31db59bf | N4 | 行きたい → いきたい (질문) | ✅ | 이동 |
| 7171b183 | N5 | 何時 → なんじ (질문) | ✅ | 시간 표현 고정 |
| 37dade52 | N5 | 今日 → きょう | ✅ | 시간 |
| b7b54fcf | N5 | 明日 → あした, 明日出かける人 → あしたでかける人 | ⚠️ NIT | "あしたでかける" 는 음성상 올바르지만 視覚的으로 で가 조사처럼 보여 **디스플레이 오독 위험**. "あした出かける人"가 더 안전 |
| c7fc243d | N4 | 明日 → あした | ✅ |  |
| 93854880 | N4 | 今日 → きょう | ✅ |  |
| ca18c15d | N5 | 一つ → ひとつ | ✅ | 助数詞 |
| dac9b925 | N5 | 一つ → ひとつ | ✅ |  |
| 5cb9e50f | N4 | 何時 → なんじ | ✅ |  |
| bfaaff28 | N4 | 行く/行って → いく/いって | ✅ | 移動 문맥 |

**공통 관찰**:
- Validator가 경고한 "行く→いく는 おこなう 오역 주의" 항목 → 전부 **移動 문맥**으로 확인됨. 치환 정확.
- N5/N4만 대상, 올바른 레벨 선택.
- **부분 커버리지**: 질문부만 치환하고 스크립트 본문의 행(行)은 여러 건 잔존 (09f6b408에 3개, 7cc378d1에 4개 등). Validator 지시가 "질문부" 한정인지 명확하지 않으나, 스크립트의 행(行)도 TTS 오독 위험은 동일함. 추후 확장 작업 권장.

**PASS_WITH_NITS** (Q-09f6b408 인용문 불일치, Q-b7b54fcf 시각적 가독성).

---

## 6. L3 Split Validation (2건)

| Q-ID | diff | 한도 | 분할 후 최장 발화 | 결과 |
|------|------|------|------------------|------|
| 09dfdd2f | N3 | 50자 | **39자** | ✅ 한도 내 |
| fbab4c88 | N3 | 50자 | **43자** | ✅ 한도 내 |

두 건 모두 의미 보존 확인. Q-fbab4c88은 "技術力だけでなく異文化コミュニケーション能力も" 를 "技術力を高められます。また、異文化コミュニケーション能力も身につく"로 분할 — 뉘앙스가 "~だけでなく" (단순 병렬) 에서 "또한(また)" 로 약간 변형되나 의미 동치.

**PASS.**

---

## 7. Rubric Simulation Results

### Before → After (전체 180문항 기준)

| 지표 | Before | After | Δ |
|------|--------|-------|---|
| B5 ratio > 1.5 | 114 | 103 | **−11** |
| B5 ratio > 2.0 | 70 | 40 | **−30 (−43%)** |
| B5 ratio > 3.0 | ~30 | ~5 | **−83%** |

P1 블록 39건 × ~1.3 옵션/문항 = 50 옵션 업데이트로 ratio>2.0 편향 43% 감소. 매우 효율적.

**회귀 없음** — 기존 ratio<=1.5였던 문항이 ratio>1.5로 악화된 케이스 0건.

---

## 8. TTS Compatibility Check (★ CRITICAL)

| 지표 | 결과 |
|------|------|
| 수정된 question_text 총수 | **21** (CLAIM 4 + L2 16 + L3 2 — 일부 중복) |
| `parseListeningQuestion` 성공 | **21/21** |
| `parseDialogueScript` → isDialogue=true | **21/21** |
| parse_fail / not_dialogue | **0 / 0** |

**모든 수정된 question_text가 TTS 파서 호환.** L2/L3 편집이 `話者：` 마커를 파괴하지 않았음을 확인. CACHE_VERSION=3 전환과 함께 배포 시 TTS 자동 재생성 정상 작동 예상.

**CRITICAL PASS.**

---

## 9. Regressions / Concerns

### Nits (비차단)

1. **N-1**: Q-09f6b408 — 질문 인용문 `「どこかいかない？」` vs. 스크립트 대사 `どこか行かない？` 불일치. 학습자는 인용문을 텍스트로 보면서 오디오 대사를 비교하는데 표기가 다르면 혼란 가능. **권장**: 스크립트 대사도 `どこかいかない？` 로 통일, 또는 질문 인용 그대로 `「どこか行かない？」` 유지.
2. **N-2**: Q-b7b54fcf — `あしたでかける人`. 음성은 정확하나 시각적으로 で가 조사로 오독될 수 있음. **권장**: `あした出かける人` (출かけ는 N4 漢字, 유지 가능).
3. **N-3**: L2 커버리지 부분적 — 질문부만 치환, 스크립트 내 동일 한자 잔존 (특히 Q-7cc378d1 스크립트 `まっすぐ行って` 등). **권장**: 후속 마이그레이션에서 스크립트 내 `行って`/`行く` 일괄 치환 검토.

### 회귀 위험

없음. B5 개선 후 correct 위치가 새롭게 MAX/MIN 극단이 되는 case는 spot-check 10건 중 6건이 여전히 MAX이나 pre-existing이며 ratio 자체가 1.5~2.1 범위로 완화됨.

---

## 10. Final Recommendation & Fix List

### Recommendation: **PASS_WITH_NITS** — **배포 승인 가능**.

83 UPDATE 전량은 Validator 판정과 일치하며 SQL 안정성, B5 효과, TTS 호환성 모두 통과. 3개 nit는 배포 후 후속 패치(00148 또는 별도 fix PR) 권장 사항.

### Optional Fix List (후속)

```sql
-- FIX-1 (N-1): Q-09f6b408 — 스크립트 대사도 통일
UPDATE quiz_questions
SET question_text = REPLACE(question_text, 'どこか行かない？', 'どこかいかない？')
WHERE id = '09f6b408-54d5-439f-b823-e29fa1312632';

-- FIX-2 (N-2): Q-b7b54fcf — 시각 가독성
UPDATE quiz_questions
SET question_text = REPLACE(question_text, 'あしたでかける人', 'あした出かける人')
WHERE id = 'b7b54fcf-e5ed-40c4-853f-b66bf6c899e4';

-- FIX-3 (N-3): 스크립트 내 잔존 行 치환 (N5/N4 한정, 다음 마이그레이션에서)
```

### 즉시 배포 전 확인사항 (None blocking)

- [x] CACHE_VERSION=3 코드 머지 선행 확인
- [x] L1 Strategy A/B/C/D 중 **Strategy D 67건 / B 26건 / C 6건**이 본 마이그레이션에 **미포함** — Fixer 노트에 따르면 **병행 코드(TTS 파서)가 처리**. 검증 결과 `dialogueLineCount >= 1` 로직이 모든 "話者：" 마커를 제거하여 TTS가 자연스럽게 읽음. **DB 업데이트 불필요 전략 타당.**

---

**Reviewer 서명**: 2026-04-05 / 읽기전용 검증 완료 / User 승인 권장.
