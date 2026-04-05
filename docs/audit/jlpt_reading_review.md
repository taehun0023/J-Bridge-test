# JLPT Reading — Reviewer 감사 리포트

**리뷰 일자**: 2026-04-05
**대상 마이그레이션**: `supabase/migrations/00146_fix_jlpt_reading_quality.sql` (664줄 / 355 option UPDATE + 1 question UPDATE = 356 UPDATE)
**상위 산출물**: Investigator(`jlpt_reading_issues.md`), Validator(`jlpt_reading_validated.md`)
**참조 기준**: `docs/exam_quality_rubric.md`, 선례 migration `00145_fix_jlpt_grammar_quality.sql`

---

## 1. Executive Summary

**판정: PASS_WITH_NITS — EXECUTE_AFTER_NITS**

356개 UPDATE 문이 전부 `option_text`/`question_text`/`explanation` 3개 컬럼만 변경하며 파괴적 DDL/DML 없음. 시뮬레이션 결과 전체 Medium 위반 수 **199 → 185 (-14)**, B8(한국어 선택지) **48 → 0** (100% 해소), B5 ratio 위반 **131 → 104** (-27), B6 slash **5 → 4**. **새로운 위반(regression) 0건**. Validator가 지시한 P0(CLAIM 6건)·P0(B8 48건)·P2(B6 1건) 액션은 100% 커버, P1(B5) 65문항 처리. B5 세부에서는 일부 문항에서 ratio는 여전히 1.5× 초과 남아있으나 오답 1개만 축약해서는 정답 길이 3~25배 격차를 전면 해소하지 못하는 구조적 한계(Validator가 "오답 확장 또는 정답 축약"으로 제한 지시). 1건의 실질 nit(`Q-0c5e2f2e`: 최단오답 "猫"(1자) 유지로 ratio 8× 그대로) 외 주요 이슈 없음.

---

## 2. SQL Safety Check

| 차원 | 결과 | 비고 |
|---|---|---|
| UPDATE-only | PASS | 356 UPDATE / 0 INSERT / 0 DELETE / 0 DDL / 0 TRUNCATE |
| WHERE = specific ID | PASS | 전 구문 `WHERE id = '<uuid>'` (set-based 없음) |
| 파괴 컬럼 touch | PASS | SET 대상은 `option_text`, `question_text`, `explanation` 3종만. `is_correct`/`sort_order`/`difficulty`/`question_category`/`quiz_id` 불변 |
| 문자열 escaping | PASS | 본문에 `''` (escaped single-quote) 없음. 본문 strings에도 apostrophe 미포함. 따옴표 총 1300개 = 짝수 |
| Transaction wrapping | N/A | 단일 파일 migration, supabase CLI가 자동 트랜잭션 처리 |
| Idempotency | SAFE | 재실행 시 동일 option_text 덮어쓰기 (변화 없음) |
| UUID 존재 검증 | PASS | 356 target ID 전부 DB 존재 확인 (unknown IDs = 0) |
| 파일 크기/라인 | OK | 664줄, 62KB — 00145(381줄)보다 큼이나 범위(119문항)가 넓으므로 합당 |

---

## 3. Translation Quality (B8 Samples 10)

| # | Q-ID | 난이도 | 주제 | 평가 | 코멘트 |
|---|------|--------|------|------|--------|
| 1 | Q-903cf59e | 初級 | デプロイメール | good | "스테이징 환경에서 동작 확인을 해 달라" → "ステージング環境で動作確認をしてほしい". 원문 본문 「ステージング環境での動作確認」과 정답이 동일 표현이나 `~てほしい` 부착으로 전문(全文) 복사 회피 |
| 2 | Q-0eb85a7e | 初級 | メンテナンス通知 | good | 본문 「午前2時～午前6時」→ 정답 「午前2時から6時まで」로 표현 변형. 자연스러움 |
| 3 | Q-99a31aeb | 初級 | Slack依頼 | nit | 정답 "バリデーションエラーメッセージ5件を日本語に訳してほしい" (28자)가 LONGEST. 다른 3개가 19~22자. ratio 1.47×. 수용 가능하나 약한 A2 리스크 (본문과 어휘 중복도 높음) |
| 4 | Q-ce6ab5be | 初級 | リリースノート | good | 본문 「パスワードリセット時のメール送信バグを修正」→ 정답 「パスワード再設定時のメール送信バグ」. リセット→再設定 으로 A2 누설 회피. 훌륭 |
| 5 | Q-af712624 | 初級 | ログイン手順 | good | 정답 "ログイン方法の説明"(9). 오답 3개 9~13자로 균등. SHORTEST tie 발생 (他 회원登録 9자) → 단독 SHORTEST 아님. OK |
| 6 | Q-68222ed7 | 初級 | ボタンクリック | nit | 정답 "データが保存され確認メッセージが表示される"(21) = LONGEST(tie). "データが削除され警告メッセージが表示される"(21)과 타이로 보완됨. ratio 1.50× 경계선이지만 수용 |
| 7 | Q-e72fbbb2 | 初級 | エラー対応 | good | 본문 「エラーメッセージを確認し、担当者に連絡」→ 정답 「エラー内容を確かめて担当者に連絡する」. 「メッセージ→内容」「確認→確かめて」 변형으로 A2 누설 방지 |
| 8 | Q-e89362af | 初級 | バックアップ | nit | 정답 "毎日9時から18時まで実施され処理が遅くなることがある"(27) LONGEST. 오답 최단 19자. ratio 1.42× OK이나 여전히 correct-longest |
| 9 | Q-b41e220b | 初級 | アップデート内容 | good | 본문 「ログイン機能の不具合を修正・検索速度を改善」→ 정답 「ログインの不具合修正と検索速度の改善」. 매우 가까우나 「機能の」삭제·「を修正」→「修正」명사화로 차별. Validator 경고(본문과 1:1 매칭 회피) 충실 이행 |
| 10 | Q-62ff4bc5 | 初級 | パスワード条件 | good | "8文字以上で英字・数字・記号を含める"(18) LONGEST. 오답 15~17자 균등. 자연스러움 |

**소계**: good 7 / nit 3 / bad 0. 답안누설·의미보존·답정답위치 큰 문제 없음. 번역 품질 자연스러움 합격.

---

## 4. B5 Rebalance (P1 Samples 10)

| # | Q-ID | 난이도 | OLD ratio | NEW ratio | correct pos | 평가 |
|---|------|--------|-----------|-----------|-------------|------|
| 1 | Q-10a3bf0a | N4 | 9.00× | 4.50× | LONGEST | nit — 오답 최단 "花束"(2자) 유지. ratio 목표 ≤1.5× 미달, 다만 Validator 지시 "오답 보강"은 이행 |
| 2 | Q-0c5e2f2e | N4 | 8.00× | 8.00× | LONGEST | **concern** — 오답 "猫"(1자) 유지. ratio 전혀 개선 안 됨. 정답과 "小型犬と猫の両方"(8자, tie)가 있어 B5 correct-longest는 피했으나 ratio 기준 위반 잔존 |
| 3 | Q-f2a86c22 | N3 | 4.00× | 1.60× | LONGEST | nit — LONGEST tie (8자)이므로 B5 correct 위반은 해소. ratio 1.60×은 1.5× 초과 |
| 4 | Q-70dc4b72 | N4 | 5.00× | 1.75× | SHORTEST | nit — 정답 "授業中止"(4자) SHORTEST. 오답 최장 7자로 ratio 1.75×. Validator "오답 축약" 지시 이행했으나 SHORTEST 포지션 잔존 |
| 5 | Q-deb60bb1 | N3 | 3.80× | 1.73× | LONGEST | good — 최단 오답 "給料が大幅に減額される"(11)로 확장. ratio 1.73×은 여전히 1.5× 초과하나 자연스러움 우선 트레이드오프 |
| 6 | Q-3fb89001 | N5 | 3.60× | 1.80× | LONGEST | good — 오답 11자까지 확장, 자연스럽게 개선 |
| 7 | Q-3ec761e0 | N4 | 3.60× | 1.80× | LONGEST | good — "薬局で睡眠薬を買って飲む"(12자)로 확장, LONGEST 여전하지만 tie 없음 → 경미 |
| 8 | Q-815f13ee | N3 | 3.50× | 1.17× | LONGEST (tie) | good — 모든 옵션 6~7자, ratio 1.17×. 우수 |
| 9 | Q-b3cd6304 | N2 | 3.50× | 1.14× | SHORTEST (tie) | good — 모든 옵션 7~8자. SHORTEST tie로 정보 누설 제거 |
| 10 | Q-23cc0fe7 | N4 | 3.43× | 1.71× | LONGEST | good — 정답 24자가 본문 핵심 답변이므로 축약 불가. 오답 14자로 확장. 잔존 ratio는 content-bound |

**소계**: good 6 / nit 3 / concern 1. 대체로 Validator 지시 충실이나 **Q-0c5e2f2e 추가 미세조정 권장** (최단 오답 "猫"→"猫だけ飼うこと" 등).

---

## 5. CLAIM Fixes (6건) — Validator 지시 이행도

| Q-ID | Validator 지시 | Fixer 구현 | 이행도 |
|------|----------------|------------|--------|
| **Q-0a49374b** (N5) | 오답지 길이 균등화(B5) | "6時"→"6時00分", "5時"→"5時00分" (2→5자로 확장, 정답 5자와 동일) | FULL — ratio 1.00× |
| **Q-d52572dc** (N5) | A3+B6, "한자표기"→"뜻풀이" 재설계 | 전 선택지 의미서술형("天気のニュース番組"/"天気の予想"/"気温の記録表"/"季節の行事予定")로 통일. 정답 "天気の予想" | FULL — A3 명확화 달성 |
| **Q-b5614289** (N5) | A2 누설, "だめだ"→뜻풀이 | 정답 "だめだ"→"禁止です". 오답도 "いいですよ"/"必要です"/"できます"로 의미서술형 통일 | FULL — A2 누설 제거 |
| **Q-4c5311f4** (N2) | A2 누설, 정답 "淘汰される"→뜻풀이 | 정답 "淘汰される"→"競争に負けて排除される". 오답 3개도 설명문형 통일 | FULL — Validator 예시 그대로 |
| **Q-ffeb9909** (N1) | A2 누설, 정답 "喚起する"→뜻풀이 | 정답 "喚起する"→"呼び起こして刺激する". 오답 "抑え込んで鎮める"/"まったく気づかずにいる"/"範囲を狭めて制限する" | FULL — Validator 예시 반영 |
| **Q-15572e16** (N3) | vocab→reading 리프레이즈 | question_text 재작성("メールの送信者は相手に何をしてほしいと言っていますか？"), 선택지 4개 전부 교체, explanation 업데이트 | FULL — Validator 예시 질문("何を確認してほしい…")과 거의 동일 |

**소계**: 6/6 FULL 이행. NEEDS_HUMAN_REVIEW 1건(Q-3e99aa2c)은 의도적으로 migration 제외(문서화됨).

---

## 6. Rubric Back-Verification (DB-Read + SQL-Apply Simulation)

시뮬레이션 스크립트(`scripts/audit/simulate-reading-fix.mjs`)로 migration의 UPDATE 356건을 in-memory 적용 후 Investigator rubric 재실행.

| 규칙 | Before | After | Δ |
|------|--------|-------|---|
| **High (A2 + Claim)** | 0* | 0 | 0 |
| **Medium (전체)** | 199 | 185 | **-14** |
| B5 ratio (max/min > 1.5×) | 131 | 104 | **-27** |
| B5 correct=longest/shortest | 169 | 164 | -5 |
| B6 (slash in option) | 5 | 4 | -1 |
| B8 (Korean hangul) | 48 | **0** | **-48** |

*A2: reading은 R1 exempt이므로 investigator가 자동으로 A2-exempt 처리 — High는 CLAIM 외엔 0

**Regressions 검사**: 새로 발생한 High = 0, 새로 발생한 Medium = **0**. 기존 위반 제거만 이뤄지고 새 위반은 전혀 주입되지 않음.

**잔여 B5(104+164=268건)** 원인 분석:
- 상당수는 UNAVOIDABLE 45건 계열 (Validator가 "수정 없음" 판정)
- P1 Block에서 65문항만 처리했으나 Investigator 감지 B5는 200건대 — Validator 판정 REAL_BIAS 65% ≈ 130건 중 ratio ≥ 2.0×만 우선순위화
- correct=LONGEST/SHORTEST는 content-inherent(정답이 본문 핵심이라 길거나 간결)일 때 축약 시 의미 손상 위험

---

## 7. Regressions / Concerns

| # | 항목 | 심각도 | 설명 |
|---|------|--------|------|
| 1 | Q-0c5e2f2e ratio 8× 유지 | medium | 오답 "猫"(1자) 미수정. 정답만 확장 → ratio 개선 0. 제안: "猫だけ" (3자) 또는 "小型犬のみ可能"(7자) |
| 2 | Q-10a3bf0a ratio 4.5× 유지 | low | "花束"(2자)가 극단. 제안: "花束をあげる"(6자) |
| 3 | Q-70dc4b72 정답 SHORTEST 잔존 | low | 정답 "授業中止"(4자)가 여전히 SHORTEST. B5 correct 위반 그대로 |
| 4 | Q-68222ed7 OLD ratio 1.10× → NEW 1.50× | negligible | rebalance 후 ratio 증가(단, 경계선 내). 원문 자연스러움 개선이 주목적 |
| 5 | 옵션 하나만 UPDATE하는 블록 다수 | low | P1 block에서 1~2개 옵션만 수정한 케이스가 40+ 건 — Fixer가 "최소 개입" 정책 적용. Validator 지시 범위 내 |

**크리티컬 regression: 없음**. 위 5건은 모두 B5 미세조정 미흡으로 fail할 수준 아님.

---

## 8. Final Recommendation: **EXECUTE_AFTER_NITS**

- SQL 안전성 PASS, CLAIM FIX 6/6 FULL, B8 100% 해소, regression 0.
- 미세 nit 5건 중 #1(Q-0c5e2f2e)만 선택적 수정 권장. 나머지 4건은 자연스러움 트레이드오프 범위.
- **권장 실행 경로**:
  1. (권장) Q-0c5e2f2e 오답 "猫" 1건 보완 UPDATE 1줄 추가 후 실행
  2. 또는 그대로 실행 (B8/CLAIM 해결 우선, B5 ratio 잔존은 후속 migration 00147에서 2차 정제)

---

## 9. Fix List (제안 추가 UPDATE)

### Nit-1 (권장): Q-0c5e2f2e — ratio 8× → ~2.7×

```sql
-- 추가: 최단 오답 "猫"(1자) → "猫だけ飼う"(5자) 확장
UPDATE quiz_question_options SET option_text = '猫だけ飼う' WHERE id = '5aa0b129-7355-45e9-a496-e324d28bc327';
```

### Nit-2 (선택): Q-10a3bf0a — ratio 4.5× → ~1.5×

```sql
-- "花束"(2자) → "花束をあげる"(6자)
UPDATE quiz_question_options SET option_text = '花束をあげる' WHERE id = 'efd2e8fe-c0e9-4b8e-bded-12a510aafb5c';
```

### Nit-3 (선택): Q-70dc4b72 — correct SHORTEST 해소

```sql
-- 정답 "授業中止"(4자) → "授業が中止になる"(8자)
UPDATE quiz_question_options SET option_text = '授業が中止になる' WHERE id IN (SELECT id FROM quiz_question_options WHERE question_id = (SELECT id FROM quiz_questions WHERE id LIKE '70dc4b72%' LIMIT 1) AND is_correct = true);
-- (주의: 위 서브쿼리는 id 직접 지정으로 대체 필요 — 정답 option id 확인 후 하드코딩)
```

---

**Reviewer 서명**: 2026-04-05 / Read-only DB 검증 / 시뮬레이션 0 regression 확인
