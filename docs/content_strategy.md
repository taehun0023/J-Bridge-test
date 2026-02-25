# J-Bridge Content Sourcing Strategy

콘텐츠 데이터 확보 전략. 저작권 안전성을 최우선으로 하며, 오픈 데이터 + AI 생성을 기본 방침으로 한다.

---

## 1. 핵심 원칙

### 저작권 안전 등급 분류

| 등급 | 설명 | 예시 |
|---|---|---|
| **SAFE** (직접 사용 가능) | 오픈 라이센스(CC, MIT 등)가 명시된 데이터. DB에 직접 INSERT 가능 | JMdict (CC-BY-SA), Tatoeba (CC) |
| **REFERENCE** (참조만 가능) | 사이트 내용을 **참조**하여 AI로 **새롭게 작성**. 원문 복사/번역 금지 | Qiita, AtCoder, Ping-t |
| **PROHIBITED** (사용 불가) | 기출문제, 유료 교재 등 저작권 보호 대상. 문제 지문 그대로 사용 불가 | JLPT 기출, Oracle Java Silver 기출, 백준/프로그래머스 문제 |

### 가공 원칙

- 참조 소스의 내용을 **그대로 번역하거나 복사하지 않는다**
- AI 에이전트에게 "참조 사이트를 보고 **새롭게 작성**해"라고 지시한다
- 오픈 라이센스 데이터도 **라이센스 표기 의무**를 준수한다 (CC-BY-SA 등)

---

## 2. 영역별 데이터 소스 및 전략

### 2-1. JLPT 단어/문법 (축1: 기초 일본어)

**대상 DB 테이블:**
- `jlpt_vocabulary` — 단어, 읽기, 한국어 뜻, JLPT 레벨, 품사, 예문
- `quizzes` (quiz_type: `jlpt_vocab`, `jlpt_grammar`, `jlpt_reading`, `jlpt_listening`)
- `quiz_questions` → `quiz_question_options`

#### SAFE: 직접 사용 가능

| 소스 | 라이센스 | 활용 방법 | URL |
|---|---|---|---|
| **JMdict / EDICT** | CC-BY-SA 3.0 | XML/JSON 다운로드 → `jlpt_vocabulary`에 word, reading, meaning 매핑. 대부분의 일본어 사전 앱(Jisho.org 등)의 원천 데이터 | http://www.edrdg.org/jmdict/j_jmdict.html |
| **Tatoeba** | CC-BY 2.0 | 오픈 소스 예문 DB. "비즈니스", "IT" 키워드로 검색하여 `example_sentence` 필드에 활용 | https://tatoeba.org/ko/ |

#### REFERENCE: 참조만 가능 (AI 가공 필요)

| 소스 | 활용 방법 | URL |
|---|---|---|
| **JLPT Resources (tanos.co.uk)** | N5~N1 급수별 단어 리스트가 정리됨. "어떤 단어가 N2급인가?" 분류 기준으로 참고 | http://www.tanos.co.uk/jlpt/ |

#### PROHIBITED

- JLPT 공식 기출문제 (일본국제교류기금 저작권)
- 시중 JLPT 교재의 문제/해설

#### DB 매핑 예시

```sql
-- jlpt_vocabulary 시드 데이터 형식
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
VALUES
  ('会議', 'かいぎ', '회의', 'N4', '명사', '午後から会議があります。', '오후부터 회의가 있습니다.'),
  ('提出', 'ていしゅつ', '제출', 'N3', '명사/する동사', '書類を提出してください。', '서류를 제출해 주세요.');
```

---

### 2-1-A. 생활일본어 콘텐츠 기준

#### 콘텐츠 성격 정의

생활일본어(seikatsu) 카테고리는 **일본에서의 일상생활에 필요한 실용적 일본어 능력**을 측정한다.
IT/비즈니스 일본어(business-jp)와 명확히 구분하며, 아래 원칙을 따른다.

#### 금지 테마 (생활일본어에서 다루지 않는 것)

- 프로그래밍·소프트웨어 개발
- IT 업계·IT 용어
- 시스템 설계·아키텍처
- 오피스 업무 (회의, 프로젝트 관리 등)
- 비즈니스 메일·비즈니스 매너

※ 위 테마는 비즈니스 일본어(business-jp) 카테고리에서 다룬다

#### 추천 테마 (레벨별 가이드라인)

| 레벨 | 테마 영역 | 구체적 예시 |
|---|---|---|
| N5 | 기본적인 일상 장면 | 쇼핑, 교통, 식사, 날씨, 자기소개, 가족 |
| N4 | 일상생활의 확장 | 병원, 구청, 이사, 취미, 여행, 계절 행사 |
| N3 | 사회생활·문화 | 매너, 방재, 봉사활동, 지역 이벤트, 식문화 |
| N2 | 사회 문제·심화 일상 | 저출산 고령화, 환경 문제, 교육, 의료 제도, 지방 이주 |
| N1 | 고급 사회론·문화론 | 경어 변천, 다문화 공생, 소비 행동 변화, 개호 문제 |

#### 독해 패시지 기준

- JLPT 각 레벨의 어휘·문법 범위 내에서 작성
- `vocabulary_notes`: 4-6개 (JSONB 형식, 한국어 번역 포함)
- `grammar_notes`: 2-4항목 (TEXT ARRAY)
- `translation_ko`: 전문 한국어 번역 필수
- `passage_type`: notice, email, article, instruction, report, essay 중 택1
- 각 레벨 9본, 합계 45본 유지

#### 청해 스크립트 기준

- 자연스러운 회화체로 작성 (서면체가 아닌 구어체)
- `speakers`: 2-4명 (이름은 일본의 일반적인 성씨)
- `situation`: 장면의 간결한 설명
- `script_type`: dialogue, announcement, phone_call, meeting 중 택1
- 각 레벨 5본, 합계 25본 유지

#### 퀴즈 기준

- 독해: 각 레벨 10문 (내용 이해 4, 세부 정보 3, 문맥 어휘 2, 추론 1)
- 청해: 각 레벨 10문 (내용 이해 4, 세부 정보 3, 화자 의도 2, 추론 1)
- 선택지: 한국어로 4지선다, 정답 위치는 랜덤 배치
- 해설: 일본어로 작성 (문법·어휘 보충 포함)

---

### 2-2. IT/비즈니스 일본어 (축2: IT 일본어)

**대상 DB 테이블:**
- `it_glossary` — 일본어 용어, 읽기, 한국어/영어 뜻, 카테고리, 설명, 예문
- `quizzes` (quiz_type: `it_terminology`, `role_play_scenario`)
- `quiz_questions` → `quiz_question_options`

#### REFERENCE: 참조만 가능 (AI 가공 필요)

| 소스 | 설명 | 활용 방법 | URL |
|---|---|---|---|
| **IT Yogo Jiten** | 초보자용 IT 용어 사전. 설명이 매우 쉬움 | 기본설계, 상세설계, 결합테스트 등 SI 필수 용어의 **카테고리와 범위 파악**용. 설명은 AI로 새로 작성 | https://wa3.i-3-i.info/ |
| **Qiita** | 일본 최대 개발자 커뮤니티 (한국의 Velog) | `Java`, `Spring`, `SI`, `要件定義` 태그 검색 → 현장에서 실제로 쓰이는 용어 키워드 수집 | https://qiita.com/ |
| **Zenn** | 모던 기술 블로그 플랫폼 | "IT용어", "SI 현장" 등 검색 → 최신 트렌드 용어 파악 | https://zenn.dev/ |

#### DB 매핑 예시

```sql
-- it_glossary 시드 데이터 형식 (카테고리: development, testing, design_doc, infrastructure, project_management, business)
INSERT INTO it_glossary (term_ja, reading, term_ko, term_en, category, description, example_sentence)
VALUES
  ('要件定義', 'ようけんていぎ', '요건 정의', 'Requirements Definition', 'design_doc',
   '시스템 개발의 최초 단계로, 고객의 요구사항을 문서화하는 과정',
   '要件定義書をお客様に確認していただきます。'),
  ('結合テスト', 'けつごうテスト', '결합 테스트', 'Integration Test', 'testing',
   '개별 모듈을 결합하여 인터페이스와 연동을 검증하는 테스트 단계',
   '結合テストで不具合が見つかりました。');
```

---

### 2-3. 코딩/알고리즘 (축3: Core Programming)

**대상 DB 테이블:**
- `coding_problems` — 제목, 설명, 난이도, 언어(java/javascript/sql), 시작 코드, 정답 코드
- `coding_test_cases` — 입력, 기대 출력, 샘플 여부
- `projects` → `project_requirements` — 프로젝트 과제 + JUnit 테스트

#### REFERENCE: 참조만 가능 (AI 가공 필요)

| 소스 | 설명 | 활용 방법 | URL |
|---|---|---|---|
| **Aizu Online Judge (AOJ)** | 일본 아이즈 대학 운영 온라인 저지. API 제공 | 교육 목적 활용에 관대. 일본 코딩 테스트 스타일 파악용. **문제 유형과 입출력 형식만 참고**하고, 문제 지문은 AI로 새로 작성 | https://judge.u-aizu.ac.jp/onlinejudge/ |
| **AtCoder** | 일본 최대 알고리즘 대회 사이트 | Beginner Contest (ABC)의 A, B번 문제가 신입 레벨. **출제 경향과 난이도 기준** 파악용 | https://atcoder.jp/ |

#### PROHIBITED

- 백준/프로그래머스 문제 지문 직접 복사
- AtCoder/AOJ 문제 지문 그대로 번역

#### 자체 제작 전략

코딩 문제는 **AI 생성 + 수동 검증**이 가장 효율적:

1. AI에게 "AOJ/AtCoder의 A~B급 난이도로, [배열 탐색] 유형의 Java 문제를 만들어줘" 지시
2. 테스트 케이스(input/expected_output)도 함께 생성
3. 실제로 코드를 돌려 정답 검증 후 DB INSERT

#### DB 매핑 예시

```sql
-- coding_problems + coding_test_cases 시드 데이터 형식
INSERT INTO coding_problems (title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  '配列の最大値',
  'N個の整数が与えられます。最大値を出力してください。\n\n入力: 1行目にN、2行目にN個の整数\n出力: 最大値',
  'easy', 'java',
  'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        // ここにコードを書いてください\n    }\n}',
  'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int max = Integer.MIN_VALUE;\n        for (int i = 0; i < n; i++) {\n            max = Math.max(max, sc.nextInt());\n        }\n        System.out.println(max);\n    }\n}',
  2000, 256
);

-- 해당 문제의 테스트 케이스
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('{problem_id}', '5\n3 1 4 1 5', '5', TRUE, 1),
  ('{problem_id}', '3\n-10 -20 -5', '-5', FALSE, 2);
```

---

### 2-4. Java 자격증 / 기술 면접 (축4: Framework/Practical)

**대상 DB 테이블:**
- `quizzes` (quiz_type: 자격증 관련은 기존 타입 중 적합한 것 활용)
- `quiz_questions` (question_type: `multiple_choice`)
- `quiz_question_options`

#### REFERENCE: 참조만 가능 (AI 가공 필요)

| 소스 | 설명 | 활용 방법 | URL |
|---|---|---|---|
| **Ping-t** | 일본 최대 IT 자격증 학습 사이트 (부분 유료) | 합격 후기와 무료 영역에서 **출제 범위(OOP, 람다식, 스트림 API 등)만 파악**. 문제 자체는 사용 불가 | https://ping-t.com/ |
| **Zenn** | 기술 블로그 플랫폼 | "Java Silver 합격 후기" 검색 → **핵심 개념 목록**과 자주 출제되는 토픽 파악 | https://zenn.dev/ |
| **Oracle 공식 시험 범위** | Java SE 시험 공식 토픽 목록 | 시험 범위(토픽 리스트)는 공개 정보이므로 참조 가능. 문제는 자체 제작 | https://education.oracle.com/ |

#### PROHIBITED

- Oracle Java Silver/Gold 기출문제 직접 사용
- Ping-t 유료 문제 크롤링
- 시중 자격증 교재 문제 복사

#### 자체 제작 전략

Oracle 공식 시험 범위를 기반으로 토픽별 문제를 AI로 생성:

```
출제 범위 예시 (Java Silver SE 11):
- Java 기본 데이터 타입과 변수
- 연산자와 의사 결정 구문
- 배열 사용
- 클래스 설계 및 메서드 사용
- 상속과 인터페이스
- 예외 처리
- 모듈 시스템
- 람다식과 함수형 인터페이스
```

---

### 2-5. 태도/문화 (축5: Attitude/Culture)

**대상 DB 테이블:**
- `quizzes` (quiz_type: `attitude_culture`, `role_play_scenario`)
- `quiz_questions` (question_type: `multiple_choice`, `ordering`)
- `quiz_question_options`
- `attitude_culture_skills` — 점수 반영 (punctuality, horenso, teamwork, business_manner)

#### REFERENCE: 참조만 가능 (AI 가공 필요)

| 소스 | 설명 | 활용 방법 | URL |
|---|---|---|---|
| **Doda (エンジニア)** | 일본 전직 사이트의 엔지니어 섹션 | 비즈니스 메일 예시, 면접 대본, 거절하는 방법 등 → **상황 설정과 패턴**만 참조하여 퀴즈 시나리오 자체 제작 | https://doda.jp/engineer/ |
| **Recruit Agent** | 일본 채용 에이전시 | 직무경력서 작성법, 면접 매너 등 → 비즈니스 매너 퀴즈의 **상황 설정** 참고 | https://www.r-agent.com/ |
| **일본 비즈니스 매너 서적 (참조)** | 호렌소, 명함 교환, 인사 예절 등 | 공통 지식(호렌소 등)은 AI로 시나리오 생성. 특정 서적 내용 복사 금지 | - |

#### 자체 제작 전략

Role-Play 시나리오는 일본 SI 현장 경험을 기반으로 직접 작성:

```
시나리오 카테고리:
- 호렌소 (報連相): 보고, 연락, 상담 상황
- 납기 관리: 지연 시 보고, 일정 조정 요청
- 비즈니스 메일: 사과, 확인, 의뢰 메일 작성
- 회의 참석: 발언, 의견 제시, 회의록 작성
- 동료 커뮤니케이션: 코드 리뷰 피드백, 질문하는 법
```

---

## 3. AI 기반 콘텐츠 생성 가이드

### 기본 원칙

1. 참조 사이트의 내용을 **그대로 번역하지 않는다**
2. **구조와 범위만 참고**하고, 텍스트는 AI가 **새롭게 작성**한다
3. 생성된 콘텐츠는 반드시 **전문가 검수**를 거친다

### 영역별 AI 프롬프트 템플릿

#### JLPT 단어 생성

```
JLPT {N5/N4/N3/N2/N1} 레벨의 {카테고리: 일상/비즈니스/IT} 관련 단어 20개를 생성해줘.

출력 형식 (JSON):
{
  "word": "漢字표기",
  "reading": "히라가나 읽기",
  "meaning_ko": "한국어 뜻",
  "jlpt_level": "N3",
  "part_of_speech": "명사/동사/형용사 등",
  "example_sentence": "일본어 예문",
  "example_sentence_ko": "한국어 해석"
}

주의: 기존 교재나 사이트의 예문을 그대로 사용하지 말고, 자연스러운 새 예문을 만들어줘.
```

#### IT 용어 생성

```
일본 SI 현장에서 {카테고리: development/testing/design_doc/infrastructure/project_management/business}
분야의 필수 용어 20개를 생성해줘.

출력 형식 (JSON):
{
  "term_ja": "일본어 용어 (한자 포함)",
  "reading": "요미가나 (히라가나)",
  "term_ko": "한국어 뜻",
  "term_en": "영어 용어",
  "category": "testing",
  "description": "용어 설명 (2-3문장)",
  "example_sentence": "현장에서 사용하는 예문 (일본어)"
}

참고 사이트: https://wa3.i-3-i.info/
단, 사이트의 설명을 그대로 번역하지 말고, 네가 이해해서 새롭게 요약해서 작성해줘.
```

#### 코딩 문제 생성

```
{언어: Java/JavaScript/SQL}로 풀 수 있는 {난이도: easy/medium/hard} 알고리즘 문제를 만들어줘.
주제: {배열 탐색/정렬/문자열 처리/스택 큐/DFS BFS 등}

출력 형식:
1. title: 문제 제목 (일본어)
2. description: 문제 설명 (입출력 형식 포함, 일본어)
3. starter_code: 시작 코드 (빈 메서드)
4. solution_code: 정답 코드
5. test_cases: [{input, expected_output, is_sample}] 최소 5개

AtCoder ABC의 {A/B/C}번 수준의 난이도로 만들어줘.
문제 지문을 기존 사이트에서 복사하지 말고 완전히 새로운 스토리로 작성해줘.
```

#### Role-Play 시나리오 생성

```
일본 SI 회사에서 발생할 수 있는 {호렌소/납기지연/비즈니스메일/회의} 상황의 퀴즈를 만들어줘.

출력 형식:
1. 상황 설명 (일본어 + 한국어 번역)
2. 질문: "이 상황에서 가장 적절한 대응은?"
3. 선택지 4개 (일본어)
4. 정답 및 해설 (왜 그것이 올바른 대응인지)

일본의 비즈니스 매너(敬語, 호렌소 등)를 반영해서 만들어줘.
```

---

## 4. 시드 데이터 목표량 (Phase 1)

MVP 런칭을 위한 최소 콘텐츠 수량:

| DB 테이블 | 목표 수량 | 설명 |
|---|---|---|
| `jlpt_vocabulary` | N5: 300, N4: 300, N3: 200 (총 800개) | JMdict 기반 추출 + AI 예문 생성 |
| `it_glossary` | 카테고리별 30개 (총 180개) | 6개 카테고리 x 30개 |
| `coding_problems` | easy: 15, medium: 10, hard: 5 (총 30문제) | Java 위주, JS/SQL 일부 |
| `coding_test_cases` | 문제당 5개 (총 150개) | 샘플 2개 + 히든 3개 |
| `quizzes` (JLPT) | N5: 5, N4: 5, N3: 3 (총 13세트) | 세트당 10~20문제 |
| `quizzes` (IT 용어) | 5세트 | 카테고리별 1세트 |
| `quizzes` (Role-Play) | 10세트 | 상황별 시나리오 |
| `quizzes` (Attitude) | 5세트 | 호렌소, 매너 등 |
| `projects` | 3개 | 근태관리, 재고관리, 게시판 |

### Phase 2 확장 (런칭 후)

- JLPT N2, N1 단어 추가
- 코딩 문제 100문제로 확장
- Java Silver 모의고사 세트 추가
- 청해(리스닝) 콘텐츠 (audio_url 활용)
- 관리자 페이지를 통한 지속적 콘텐츠 CRUD

---

## 5. 라이센스 표기

오픈 소스 데이터를 사용할 경우, 앱 내에 라이센스 표기를 포함해야 한다:

| 데이터 | 라이센스 | 표기 방법 |
|---|---|---|
| JMdict | CC-BY-SA 3.0 | 앱 하단 또는 About 페이지에 "This application uses JMdict dictionary files. These files are the property of the Electronic Dictionary Research and Development Group, and are used in conformance with the Group's licence." 표기 |
| Tatoeba | CC-BY 2.0 | 예문 사용 시 "Example sentences from Tatoeba (CC-BY 2.0)" 표기 |

