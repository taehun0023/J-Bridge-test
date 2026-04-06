# BJ Vocabulary B6 (Slash) Validation Summary

**Date:** 2026-04-06
**Migration:** `supabase/migrations/00152_fix_bj_vocab_slash.sql`
**Source:** `docs/audit/bj_vocab_b6_data.json` (59 questions)

## Statistics

| Category | Count |
|----------|-------|
| Total slash options found | 84 |
| CONFIRMED (fixed) | 83 |
| DISMISSED (technical term) | 1 |
| UPDATE statements | 83 |
| Questions affected | 59 |

## Dismissed Cases

| Option ID | Text | Reason |
|-----------|------|--------|
| `196d9e97` | HTTPS는 HTTP에 **SSL/TLS** 암호화가 추가된 것이다 | SSL/TLS is a standard technical term |

## Fix Strategies Applied

### Strategy 1: Keep one term (synonym pairs)
When two synonymous Korean terms are separated by `/`, keep the more commonly used or concise one.

| Before | After | Rationale |
|--------|-------|-----------|
| 잔업/야근 | 야근 | More commonly used |
| 지급/긴급 | 긴급 | Better matches 至急 meaning |
| 안건/프로젝트 | 안건 | More precise Korean equivalent |
| 중요함 / 핵심 | 핵심 | More concise |
| 회의 / 미팅 | 회의 | Korean-native term preferred |
| 면접 / 인터뷰 | 면접 | Korean-native term preferred |
| 발표 / 프레젠테이션 | 발표 | Korean-native term preferred |
| 연수 / 트레이닝 | 연수 | Korean-native term preferred |
| 버그 / 결함 | 버그 | More commonly used in IT |
| 사양 / 스펙 | 사양 | Korean-native term preferred |
| 검수/수령 확인 | 검수 확인 | Keep key concept, remove secondary |
| 미착수 작업/요건 목록 | 미착수 작업 목록 | Keep primary description |
| 단위 테스트 / 유닛 테스트 | 단위 테스트 | Korean-native term |
| 성능 테스트 / 부하 테스트 | 성능 테스트 | More general term |
| 결합 테스트 / 통합 테스트 | 결합 테스트 | Direct translation of 結合テスト |
| 회귀 테스트 / 리그레션 테스트 | 회귀 테스트 | Korean-native term |
| 최적화 / 튜닝 | 최적화 | Korean-native term |
| 간소화 / 경량화 | 간소화 | More general term |
| 자동화 / 스크립트화 | 자동화 | More general term |
| 이중화 / 다중화 | 이중화 | Direct translation of 冗長化 |
| 프로젝트의 주요 이정표 / 목표 지점 | 프로젝트의 주요 이정표 | Keep primary description |
| 생사 감시 / 헬스 체크 | 생사 감시 | Korean-native term |
| 진척 / 진행 상황 | 진척 | Direct translation of 進捗 |
| 지연 / 일정 초과 | 지연 | More concise |
| 완료 / 종료 처리 | 완료 처리 | More concise |
| 보류 / 대기 상태 | 보류 | More concise |
| 영구 대응 / 근본적 해결 조치 | 영구 대응 | More concise |
| 임시 대응 / 워크어라운드 | 임시 대응 | Korean-native term |
| 긴급 배포 / 핫픽스 적용 | 긴급 배포 | Korean-native term |
| 롤백 처리 / 이전 버전 복원 | 롤백 처리 | More concise |
| 임시 대응 / 워크어라운드 적용 | 임시 대응 | Korean-native term |
| 긴급 패치 / 핫픽스 배포 | 긴급 패치 | Korean-native term |
| 영구 대응 / 근본 해결 | 영구 대응 | More concise |
| 장애 전파 / 에스컬레이션 처리 | 장애 전파 | Korean-native term |

### Strategy 2: Replace slash with middot (·) for enumerations/compounds
When the slash separates items in a list or components of a compound concept, replace `/` with `·`.

| Before | After | Rationale |
|--------|-------|-----------|
| 보고/연락/상담 | 보고·연락·상담 | 報連相 is a known compound |
| DB 스키마 변경 / 시스템 이행 관리 | DB 스키마 변경·시스템 이행 관리 | Two distinct meanings of migration |
| 자원 (인력/시간/예산/서버 등) | 자원 (인력·시간·예산·서버 등) | Enumeration in parentheses |
| 문제를 상위자에게 보고/인계하는 것 | 문제를 상위자에게 보고·인계하는 것 | Two-action compound |
| 공정 (작업 단계/절차) | 공정 (작업 단계·절차) | Enumeration in parentheses |
| 공수 (작업량/인월) | 공수 (작업량·인월) | Enumeration in parentheses |
| 공통 (공유 모듈/라이브러리) | 공통 (공유 모듈·라이브러리) | Enumeration in parentheses |
| 공개 (외부 공개/릴리스) | 공개 (외부 공개·릴리스) | Enumeration in parentheses |
| 외부 설계 (UI/UX 설계) | 외부 설계 (UI·UX 설계) | Enumeration in parentheses |
| 장애/프로젝트 후 원인 분석 및 재발 방지 회고 | 장애·프로젝트 후 원인 분석 및 재발 방지 회고 | Two-context compound |
| 빌드/테스트/배포를 자동화한 일련의 프로세스 | 빌드·테스트·배포를 자동화한 일련의 프로세스 | Enumeration (pipeline stages) |
| 비기능 요건 (성능/보안/가용성 등) | 비기능 요건 (성능·보안·가용성 등) | Enumeration in parentheses |
| 기능 요건 (업무 로직/화면 요건) | 기능 요건 (업무 로직·화면 요건) | Enumeration in parentheses |
| 업그레이드 (기능 개선/버전 향상) | 업그레이드 (기능 개선·버전 향상) | Enumeration in parentheses |
| 리팩토링 (코드 구조 개선/정리) | 리팩토링 (코드 구조 개선·정리) | Enumeration in parentheses |
