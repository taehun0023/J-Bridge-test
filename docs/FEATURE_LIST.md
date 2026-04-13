# J-Bridge 전체 기능 목록

> 최종 업데이트: 2026-03-01
> 총 76개 페이지 | 105+ 서버 액션 | 86개 공유 컴포넌트/라이브러리

---

## 목차

1. [인증 & 온보딩](#1-인증--온보딩)
2. [대시보드](#2-대시보드)
3. [일본어 학습 (JLPT)](#3-일본어-학습-jlpt)
4. [비즈니스 일본어](#4-비즈니스-일본어)
5. [개발 과정 (Dev Courses)](#5-개발-과정-dev-courses)
6. [CS 지식](#6-cs-지식)
7. [비즈니스 리터러시](#7-비즈니스-리터러시)
8. [코딩 문제 & 등급 시험](#8-코딩-문제--등급-시험)
9. [종합시험 (Comprehensive Exam)](#9-종합시험-comprehensive-exam)
10. [퀴즈 시스템](#10-퀴즈-시스템)
11. [랭킹 시스템](#11-랭킹-시스템)
12. [개인 단어장 & 마스터리](#12-개인-단어장--마스터리)
13. [프로필 & 알림](#13-프로필--알림)
14. [피드백 시스템](#14-피드백-시스템)
15. [관리자 패널](#15-관리자-패널)
16. [API 엔드포인트](#16-api-엔드포인트)
17. [공통 인프라](#17-공통-인프라)

---

## 1. 인증 & 온보딩

### 로그인
| 항목 | 내용 |
|------|------|
| 경로 | `/login` |
| 설명 | Supabase 이메일/비밀번호 로그인 (셀프 가입 없음, 관리자가 계정 생성) |
| 액션 | `signIn()`, `signOut()` |

### 온보딩 (최초 로그인)
| 항목 | 내용 |
|------|------|
| 경로 | `/onboarding` → `/onboarding/assessment/[step]` → `/onboarding/results` |
| 설명 | JLPT 목표 레벨 + 코딩 분야 선택 → 5단계 평가 퀴즈 → 결과 확인 |
| 5단계 | ① 생활일본어 ② 비즈니스일본어 ③ CS지식 ④ 개발실무 ⑤ 비즈니스리터러시 |
| 시간제한 | 각 25~30분 |
| 액션 | `completeOnboarding()`, `savePreferences()`, `getAssessmentForStep()`, `submitAssessment()`, `requestRetake()`, `finalizeOnboarding()` |

---

## 2. 대시보드

| 항목 | 내용 |
|------|------|
| 경로 | `/dashboard` |
| 주요 기능 | 5축 레이더 차트, 최근 퀴즈/시험 결과, 미완료 과제, 태스크 목록, 랭킹 정보 |
| 멘토 뷰 | 담당 멘티 진행률 카드 (`MentorDashboardClient`) |
| 하위 페이지 | `/dashboard/assignments` (학습 과제), `/dashboard/history` (이력), `/dashboard/history/[attemptId]` (상세) |

### 5축 레이더 차트 (Dispatch Readiness)
| 축 | 구성 |
|----|------|
| 1. JLPT | 어휘 + 문법 + 독해 + 청해 |
| 2. IT 일본어 | IT 용어 + 비즈니스 표현 |
| 3. 코어 프로그래밍 | Java + JavaScript + 알고리즘 |
| 4. 프레임워크 | Spring Boot + React + DB + 프로젝트 |
| 5. 태도/문화 | 비즈니스 리터러시 퀴즈 결과 |

### 코딩 등급 뱃지 (Paiza 방식)
| 등급 | 설명 |
|------|------|
| S | 최상위 (사내 평가 + 파견처 매칭 참고) |
| A~D | 단계별 등급, 등급 시험으로 승급 |

---

## 3. 일본어 학습 (JLPT)

| 항목 | 내용 |
|------|------|
| 허브 경로 | `/japanese/jlpt` |
| 레벨 | N5 ~ N1 레벨별 진행률 추적 |

### 학습 콘텐츠
| 기능 | 경로 | 설명 |
|------|------|------|
| 어휘 | `/japanese/jlpt/vocabulary` | JLPT 레벨별 단어 목록, 플래시카드 모드 |
| 문법 | `/japanese/jlpt/grammar` | 문법 항목 + 예문, 플래시카드 |
| 한자 | `/japanese/jlpt/kanji` | JLPT 한자 목록 (검색 지원) |
| 독해 | `/japanese/jlpt/reading` | JLPT 독해 지문 |
| 청해 | `/japanese/jlpt/listening` | 청해 스크립트 + TTS 음성 재생 |
| 퀴즈 | `/japanese/jlpt/quiz`, `/japanese/jlpt/quiz/[quizId]` | JLPT 퀴즈 (80% 마스터리 시 잠금 해제) |

### 관련 액션
- `getKanjiList()`, `getKanjiCount()` — 한자 조회
- `generateVocabQuiz()` — 범위 기반 어휘 퀴즈 자동 생성

---

## 4. 비즈니스 일본어

| 항목 | 내용 |
|------|------|
| 허브 경로 | `/japanese/business` |

### 학습 콘텐츠
| 기능 | 경로 | 설명 |
|------|------|------|
| 비즈니스 표현 | `/japanese/business/expressions` | 비즈니스 표현 매뉴얼 |
| 문형 | `/japanese/business/sentence-patterns` | 비즈니스 문형 패턴 |
| IT 용어집 | `/japanese/business/glossary` | IT 용어 (일→영) 테이블 |
| 퀴즈 | `/japanese/business/quiz`, `quiz/[quizId]` | 비즈니스 일본어 퀴즈 |

---

## 5. 개발 과정 (Dev Courses)

| 항목 | 내용 |
|------|------|
| 허브 경로 | `/dev` |

### 지원 과목
| 과목 | 경로 |
|------|------|
| Java | `/dev/java` |
| JavaScript | `/dev/javascript` |
| React | `/dev/react` |
| Next.js | `/dev/nextjs` |
| Python | `/dev/python` |
| Spring Boot | `/dev/spring-boot` |
| SQL | `/dev/sql` (Bronze/Silver/Gold 실습) |

### 코스 & 레슨
| 기능 | 경로 | 설명 |
|------|------|------|
| 코스 상세 | `/courses/[id]` | 레슨 목록, 수강 등록, 진행률 |
| 레슨 플레이어 | `/courses/[id]/lessons/[lessonId]` | 비디오/텍스트/퀴즈/코딩 콘텐츠 |
| 레슨 내 퀴즈 | `/courses/[id]/lessons/[lessonId]/quiz/[quizId]` | 레슨에 포함된 퀴즈 |

---

## 6. CS 지식

| 항목 | 내용 |
|------|------|
| 허브 경로 | `/cs` |

### 학습 분야
| 분야 | 경로 |
|------|------|
| 기초 이론 | `/cs/basic-theory` |
| 알고리즘 | `/cs/algorithms` |
| 자료 구조 | `/cs/data-structures` |
| 컴퓨터 아키텍처 | `/cs/computer-architecture` |
| 데이터베이스 | `/cs/database` |
| 네트워킹 | `/cs/networking` |
| 보안 | `/cs/security` |
| 퀴즈 | `/cs/quiz`, `/cs/quiz/[quizId]` |

### 관련 액션
- `generateCsTermQuiz()` — CS 용어 범위 퀴즈 자동 생성

---

## 7. 비즈니스 리터러시

| 항목 | 내용 |
|------|------|
| 허브 경로 | `/business-literacy` |

### 학습 콘텐츠
| 분야 | 경로 | 퀴즈 |
|------|------|------|
| 태도 & 문화 | `/business-literacy/attitude-culture` | `/business-literacy/attitude-culture/quiz/[quizId]` |
| 보안 & 컴플라이언스 | `/business-literacy/security` | `/business-literacy/security/quiz/[quizId]` |

---

## 8. 코딩 문제 & 등급 시험

### 코딩 문제
| 항목 | 내용 |
|------|------|
| 목록 | `/coding/problems` — 난이도/언어별 필터 + 페이지네이션 |
| 풀이 | `/coding/problems/[problemId]` — Monaco 에디터 + Judge0 자동 채점 |
| 액션 | `submitCode()` (제출 + 채점), `runCode()` (실행만) |

### 코딩 등급 시험 (Paiza 방식)
| 항목 | 내용 |
|------|------|
| 목록 | `/coding/exams` — D/C/B/A/S 등급 시험 (현재 등급에 따라 게이트) |
| 응시 | `/coding/exams/[examId]` — 시험 인터페이스 |
| 등급 체계 | S > A > B > C > D (사내 인사 평가 + 파견처 매칭 참고) |

### AI 코드 리뷰
- `code-review/analyzer.ts` — 일본 코딩 컨벤션 기준 자동 피드백

---

## 9. 종합시험 (Comprehensive Exam)

| 항목 | 내용 |
|------|------|
| 경로 | `/exam/[examId]` |
| 형식 | 객관식 + 서술형 (재시험 시) |
| 워크플로 | 요청 → 승인 → 응시 → 채점 → 결과 |

### 액션
| 액션 | 설명 |
|------|------|
| `requestExam()` | 종합시험 요청 |
| `approveExam()` / `denyExam()` | 승인/거부 (관리자+멘토) |
| `startExam()` | 시험 시작 + 문제 로드 |
| `submitExam()` | 제출 + 자동 채점 |
| `requestRetakeExam()` | 재시험 요청 |
| `getExamStatus()` | 상태 조회 |

---

## 10. 퀴즈 시스템

### 퀴즈 유형
| 유형 | 설명 |
|------|------|
| 코스 퀴즈 | 레슨 내 퀴즈 |
| JLPT 퀴즈 | 레벨별 어휘/문법/독해/청해/한자 |
| 비즈니스 퀴즈 | IT 용어 + 비즈니스 표현 |
| CS 퀴즈 | CS 지식 확인 |
| 태도/보안 퀴즈 | 비즈니스 리터러시 |
| 범위 퀴즈 | 동적 범위 선택 자동 생성 |
| 온보딩 평가 | 5단계 초기 레벨 테스트 |
| 종합시험 | 카테고리별 종합 평가 |

### 핵심 액션
| 액션 | 설명 |
|------|------|
| `startQuizAttempt()` | 퀴즈 시도 생성 |
| `submitQuizAnswers()` | 제출 + 자동 채점 |
| `getQuizAttemptReview()` | 결과 리뷰 (7일 제한) |

### 범위 퀴즈 생성기
- `generateGlossaryQuiz()` — IT 용어 퀴즈
- `generateCsTermQuiz()` — CS 용어 퀴즈
- `generateVocabQuiz()` — JLPT 어휘 퀴즈

---

## 11. 랭킹 시스템

| 항목 | 내용 |
|------|------|
| 경로 | `/ranking` |
| 시즌 | 3개월 단위 |
| 카테고리 | 전체, JLPT, IT일본어, 코어프로그래밍, 프레임워크, 비즈니스리터러시 |
| 산출 | `computeRankingEntry()` — 종합/일본어/프로그래밍 점수 계산 |

---

## 12. 개인 단어장 & 마스터리

### 개인 단어장
| 항목 | 내용 |
|------|------|
| 경로 | `/personal-vocab` |
| 기능 | 단어 추가/편집/삭제, 검색, 우클릭 컨텍스트 메뉴 |
| 액션 | `addPersonalVocab()`, `getPersonalVocab()`, `updatePersonalVocab()`, `deletePersonalVocab()` |

### 마스터리 추적
| 액션 | 설명 |
|------|------|
| `toggleMastery()` | 학습 항목 마스터리 토글 |
| `getMasteredIds()` | 단일 유형 마스터 목록 |
| `getMasteredIdsMultiple()` | 복수 유형 마스터 목록 |

---

## 13. 프로필 & 알림

### 프로필
| 항목 | 내용 |
|------|------|
| 경로 | `/profile` |
| 기능 | 프로필 편집, 스킬 요약, 퀴즈/코딩 이력 |
| 액션 | `uploadAvatar()`, `removeAvatar()` |

### 알림
| 액션 | 설명 |
|------|------|
| `getUnreadNotificationCount()` | 미읽음 수 |
| `getNotifications()` | 알림 목록 |
| `markAsRead()` / `markAllAsRead()` | 읽음 처리 |
| `deleteNotification()` / `deleteAllNotifications()` | 삭제 |
| UI | `NotificationBell` 컴포넌트 (헤더) |

---

## 14. 피드백 시스템

| 항목 | 내용 |
|------|------|
| 경로 | `/feedback` |
| 역할별 뷰 | 멘티: 받은 피드백 / 멘토: 자신+멘티 / 관리자: 전체 |
| 피드백 CRUD | `createFeedback()`, `updateFeedback()`, `deleteFeedback()` (관리자+멘토) |
| 답글 | `createFeedbackReply()`, `updateFeedbackReply()`, `deleteFeedbackReply()` |
| 문제 신고 | `submitQuestionClaim()` — 퀴즈 문제 오류 신고 |
| 콘텐츠 접근 요청 | `requestContentAccess()` — 제한 콘텐츠 접근 요청 |

---

## 15. 관리자 패널

| 경로 | 기능 | 권한 |
|------|------|------|
| `/admin/users` | 계정 생성, 역할 변경, 멘토 전문 분야 설정, 멘토-멘티 배정 | admin |
| `/admin/courses` | 퀴즈 문제 CRUD, 문제 공개/비공개, 클레임 관리 | admin + tech mentor |
| `/admin/tasks` | 학습 과제 배정, 종합시험 요청 승인, 재시험 승인/거부 | admin (배정) / admin+mentor (승인) |
| `/admin/reports` | 분석/리포팅 대시보드 | admin |
| `/admin/mentors` | 멘토 관리 | admin |
| `/admin/audit-log` | 감사 로그 (23개 리소스 타입, 6+ 필터) | admin |
| `/admin/backup` | CSV 백업 (7개 테이블) | admin |
| `/admin/tts-cache` | TTS 사전 캐싱 관리 | admin |

### 학습 과제 (Learning Assignments)
| 액션 | 설명 |
|------|------|
| `createLearningAssignment()` | 과제 생성 (관리자+멘토) |
| `confirmAssignment()` | 완료 확인 |
| `detectAndMarkOverdue()` | 기한 초과 자동 표시 |
| `submitOverdueReason()` | 지연 사유 제출 |
| `reassignAssignment()` | 기한 연장 |
| `cancelAssignment()` | 과제 취소 |

### 감사 로그
| 기능 | 설명 |
|------|------|
| 23개 액션 추적 | 퀴즈/유저/과제/피드백/재시험/단어장/학습과제 |
| 6개 리소스 필터 | quiz_questions, profiles, task_assignments, admin_feedbacks, quiz_attempts, learning_assignments |
| 복원 | `restoreResource()` — 삭제 리소스 복원 |
| CSV 내보내기 | `exportAuditLogCsv()` |

### CSV 백업 대상 테이블
profiles, quiz_questions, learning_assignments, task_assignments, admin_feedbacks, coding_problems

---

## 16. API 엔드포인트

| 엔드포인트 | 메서드 | 설명 | 권한 |
|-----------|--------|------|------|
| `/api/tts` | POST | Google Cloud TTS 음성 합성 (대화 감지, 4인 보이스, 캐싱) | 로그인 사용자 |
| `/api/admin/tts-precache` | GET | TTS 캐시 대상 항목 수 조회 | admin |
| `/api/admin/tts-precache` | POST | 배치 TTS 사전 캐싱 (10건씩) | admin |

### TTS 상세
- 최대 5000자, 속도 0.5x~2.0x
- SHA256 해시 기반 Supabase Storage 캐싱
- 대화체 감지: 화자별 다른 음성 자동 할당 (4종 Neural/Standard 보이스)

---

## 17. 공통 인프라

### 인증 헬퍼 (`auth-helpers.ts`)
| 함수 | 설명 |
|------|------|
| `requireAuth()` | 인증 필수 |
| `requireAdmin()` | 관리자 전용 (service role client 반환) |
| `requireAdminOrMentor()` | 관리자 또는 멘토 |
| `requireAdminOrJpMentor()` | 관리자 또는 JP 멘토 |
| `requireAdminOrTechMentor()` | 관리자 또는 기술 멘토 |

### 스코어링 모듈 (`modules/scoring/`)
- 순수 함수 기반 5축 계산 → DB fetch → DB write
- 75개 유닛 테스트 (axis 계산기 + 유틸리티)
- `recalculateUserScores()` — 개별 재계산
- `recalculateAllScores()` — 전체 배치 재계산

### 알림 헬퍼 (`notification-helpers.ts`)
- `notifyMentorsOf()` — 담당 멘토에게 알림
- `notifyAdmins()` — 전체 관리자에게 알림

### Judge0 연동 (`judge0/client.ts`)
- Java (62), JavaScript (63), SQL (82) 지원
- RapidAPI + 자체 호스팅 모드

### 데이터 정규화 (`normalize.ts`)
- 전각→반각, 가타카나→히라가나, 공백 축소, 소문자화, 구두점 제거

---

## 통계 요약

| 항목 | 수치 |
|------|------|
| 전체 페이지 | 76개 |
| 서버 액션 함수 | 105+ |
| 공유 컴포넌트 | 44개 |
| 라이브러리 파일 | 29개 |
| 스코어링 모듈 | 13개 |
| API 엔드포인트 | 3개 (2 route 파일) |
| DB 테이블 | 42개 |
| 마이그레이션 | 49개 |
| 유닛 테스트 | 75개 |
| 사용자 역할 | 3종 (admin / mentor / mentee) |
| 멘토 전문분야 | 3종 (null / jp / technical) |
