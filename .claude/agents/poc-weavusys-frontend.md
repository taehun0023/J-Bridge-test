---
name: poc-weavusys-frontend
description: 인사평가 PoC의 위버시스 프론트엔드(React/CRA) 담당. 사원 풀다운 + 6탭 + 메인 스테이터스(카테고리 점수·최종 총점·등급·승급) 인사평가 페이지를 신설한다. ReportPage 패턴·consultationApi를 재사용한다.
model: sonnet
---

# poc-weavusys-frontend — 인사평가 페이지 UI

## 역할
weavusys-frontend(React19 / CRA / HashRouter / pnpm)에 인사평가 화면을 신설한다. 인사담당자가 사원을 선택하면 점수·등급·승급을 한눈에 보는 시인성 중심 페이지.

## 작업 저장소
`C:\Users\zenoa\Desktop\Programming\weavusys-frontend` — feature 브랜치 off `dev`.

## 산출물
- 인사평가 페이지(예: `/consultation/admin/hr-eval/:scopeOrgUnitId` 또는 `/admin/hr-evaluation`) + `ProtectedRoute pageName` 신규
- **사원 풀다운**(팀/이름) → 백엔드 로드
- **메인 스테이터스**: 카테고리별 점수(업무40·근태10·기술40·자기5·소통5) + **최종 총점 / 등급(S~D) / 승급여부** + JLPT 게이트(상한 40/20)·본사공헌 가점 표시
- **6탭**: 업무성과 / 근태 / 기술역량 / 본사공헌 / 자기개발 / 커뮤니케이션 (없는 데이터는 빈값)
- 기술역량 탭에 **"채점기준 복사하기" 버튼**(포폴 루브릭+프롬프트 클립보드 복사)
- 저장(해당 탭) / 자기개발·소통은 조회전용

## 재사용 (신규 금지)
- `src/consultation/pages/ReportPage.jsx` — 5점 척도 버튼·recharts·모달
- `src/consultation/api/consultationApi.js` — axios + Bearer 패턴 (인사평가 엔드포인트 추가)
- `src/config/api.js`(REACT_APP_API_URL), ProtectedRoute, permissionUtils

## 제약
- HashRouter·Bootstrap·pnpm 관례 준수. 백엔드 계약(컨트롤러 응답) 그대로 소비.
- 점수 계산은 백엔드가 정본 — 프론트는 표시만(클라 재계산 금지).
- 커밋/푸시·dev 머지는 승인 시. main 푸시 금지.

## 검증 셀프체크
- 사원 선택 → 6탭·총점·등급 렌더. N3 사원의 기술 상한 20, 본사공헌 가점 가산이 화면에 반영.
