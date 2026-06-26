# JLPT 어휘 레벨 권위정합 작업 — 재개 노트 (2026-06-26 새벽 중단)

## 목표 (user 지시: 옵션 A)
각 어휘를 **권위 출처(jisho.org JLPT 태그) 레벨 하나로** 통합. Claude 임의판단 금지.
N1∩N2 중복 442개 + 41 플래그 단어를 사전 레벨로 확정해, **각 단어가 권위레벨 한 곳에만 존재**하도록 통합(다른 레벨 행 삭제 + user_mastered_items 체크 remap).

## 중단 사유
재조회 3배치(미커버 178개)가 **계정 사용량 한도**로 실패(6:10am KST 리셋). 한도 풀리면 재개.

## 현재까지 산출물 (durable copy: `_audit/level_resolution/`)
- `consolidated_levels.tsv` — **권위레벨 확정 219개** (word<TAB>level, 충돌 0). 분포 N1 127·N3 49·N4 4·N2 39.
- `uncovered_words.txt` — **재조회 필요 178개** (442 중 깨진 분할로 누락된 것).
- `unknown_words.txt` — **90개** (jisho 태그 없음 → 보류, 안 건드림).
- `overlap_full.txt` — N1∩N2 중복 442 전체.
- `overlap_level_1~7.txt`, `uncov_part_1~3.txt` — 중간 산출.

## 재개 순서
1. **미커버 178개 재조회** (`uncov_part_1~3.txt`, node로 깨끗하게 재분할돼 있음 — 깨지면 `overlap_full.txt`에서 line-range로). content-curator 에이전트가 jisho.org JLPT 태그 확인 → `uncov_level_1~3.txt`.
2. **취합**: `consolidated_levels.tsv`(219) + uncov_level_*(178) 병합 → 최종 word→레벨 맵. UNKNOWN 제외.
3. **레벨 통합 적용** (SQL): 각 단어 W·권위레벨 L에 대해
   - W의 모든 행 조회. keeper = L레벨 행 있으면 그것, 없으면 임의 1행.
   - keeper.jlpt_level = L 로 set.
   - 나머지 W 행들의 `user_mastered_items`(item_type='jlpt_vocabulary', item_id=그 행 id) → keeper.id로 remap (유저별 중복체크는 dedup).
   - 나머지 W 행 DELETE.
4. **seq 재정렬** (`_verify/renumber_seq_gapless.sql`).
5. **검증**: 단어가 두 레벨에 동시 존재 0, seq 빈틈 0, 오분류(어휘속문법) 변화 확인.
6. **커밋 + _export 재추출.**

## 리포트(다른 AI 검수) 잔여 항목 — 레벨정합 후 처리
- 문법 N1∩N2 중복 33개 단일레벨화.
- 意味필드 일본어 잔재(預ける="맡기다, 預ける" 류) 정리.
- N2 모의 set5 `しかねます` 정답표기(しかねません 오기) 수정.
- 섹션5 오탐 `ありがたい·にぎやか·ひょっとして`는 제외(실제 단어).

## 환경
psql=`C:\Program Files\PostgreSQL\17\bin\psql.exe`, 로컬 host=`db.jpjvzlmwzeiyukqqbdit.supabase.co` user=postgres pw=`Weavus12345!!`. 일본어 SQL은 -c 금지, UTF-8 .sql+-f. git push는 local만(taehun0023 author).
