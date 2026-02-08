Project Name: J-Bridge (Japan IT Engineer Dispatch Platform)
1. Project Goal & Business Objective
목표: 한국인 IT 엔지니어를 교육하여 일본 기업에 성공적으로 파견(Haken) 및 정착시킨다.

핵심 가치: "단순한 코딩 실력이 아니라, 일본 현장에서 '통하는' 실무 능력을 기른다."

수익 모델: 교육 수료생의 일본 파견 계약 체결 시 발생하는 수수료 수익.

2. User Persona
Target User (Mentee):

일본 취업을 희망하는 한국인 개발자 (신입 ~ 경력 3년 차).
일본어는 초급이나 코딩은 좀 하는 경우, 혹은 그 반대.

자신의 현재 실력이 일본 시장에서 어느 정도 연봉을 받을 수 있는지 궁금해함.

3. Key Features (Functional Requirements)
A. Main Dashboard (The "Readiness" Monitor)
단순한 학습 진도율이 아닌 **'일본 파견 준비도(Dispatch Readiness Score)'**를 시각화하여 보여준다.

Radar Chart (5축):

JLPT/기초 일본어: 자격증 점수 기반.

IT/비즈니스 일본어: 설계서 독해, 회화 능력.

Core Programming: Java/JS 기초 문법 및 알고리즘.

Framework/Practical: Spring Boot, React, DB 설계 능력.

Attitude/Culture: 근태, 호렌소(보고) 이해도 (퀴즈로 측정).

B. Japanese Curriculum (Dual-Track)
Track 1: JLPT Exam Prep

N5 ~ N1 단어/문법/독해/청해 문제 은행.

모의고사 기능.

Track 2: Survival IT Japanese (Business)

용어집: 변수명 짓기(일본어 발음), 현장 용어(테스트 사양서, 요건 정의서 등).

Role-Play: "납기가 지연될 것 같을 때 상사에게 보고하는 법" 등을 시나리오 퀴즈로 제공.

C. Programming Curriculum (Job-Simulated)
Language: Java (Primary), React (Secondary), SQL (Essential).

Algorithm Section:

기본적인 자료구조/알고리즘 (코딩 테스트용).

백준 스타일의 문제 풀이 및 자동 채점 시스템.

Project Section (Practical):

"게시판 만들기"가 아니라 "사내 근태 관리 시스템 만들기" 등 실제 SI 업무와 유사한 주제.

Unit Test: 작성한 코드에 대해 JUnit 테스트 통과 여부 검증.

Code Review: AI 에이전트가 변수명(일본어 스타일 권장)과 주석 등을 리뷰.

4. Technical Stack Strategy
Frontend: Next.js (React), Tailwind CSS, Chart.js (레이더 차트용).

Backend: Supabase (Auth, DB) or Spring Boot (if aiming to simulate usage).

AI Integration:

사용자의 코드를 분석하여 "일본 현장에서 선호하는 코딩 스타일"로 피드백.

일본어 작문(비즈니스 메일) 자동 교정.