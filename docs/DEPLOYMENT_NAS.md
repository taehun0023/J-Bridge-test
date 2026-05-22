# J-Bridge — Synology NAS + Docker 이전 가이드

> 이 문서는 **인프라 입문자**를 대상으로 작성되었습니다.
> "왜 이걸 하는지" 개념을 짚으면서 단계별 명령까지 따라갈 수 있도록 구성했습니다.
>
> 전제 환경:
> - NAS: **Synology DSM 7.2 이상** (Container Manager 패키지 사용)
> - 외부 공개: **HTTPS 필요** (DSM 내장 리버스 프록시 + Let's Encrypt)
> - Judge0: **별도 서버 유지** — 이번 작업 범위 밖
> - 컨테이너화 대상: **Next.js 앱 1개**

---

## 목차

1. [전체 그림 — 무엇을 어디에 두는가](#1-전체-그림--무엇을-어디에-두는가)
2. [사전 개념 정리](#2-사전-개념-정리)
3. [프로젝트 측 준비 (로컬)](#3-프로젝트-측-준비-로컬)
4. [NAS 측 준비 (Synology DSM)](#4-nas-측-준비-synology-dsm)
5. [이미지 빌드 & 배포](#5-이미지-빌드--배포)
6. [환경변수 안전하게 두기](#6-환경변수-안전하게-두기)
7. [도메인 + HTTPS 설정](#7-도메인--https-설정)
8. [운영 체크리스트 & 트러블슈팅](#8-운영-체크리스트--트러블슈팅)

부록: [A. GitHub Actions 자동 배포](#부록-a-github-actions-자동-배포-다음-단계) · [B. 백업/마이그레이션](#부록-b-백업--마이그레이션) · [C. 모니터링 한 단계 더](#부록-c-모니터링-한-단계-더)

---

## 1장. 전체 그림 — 무엇을 어디에 두는가

### 1-1. 아키텍처 한눈에

```
┌──────────────────┐
│   外部ユーザー    │  사용자는 https://j-bridge.example.com 으로 접속
│   (인터넷 사용자) │
└────────┬─────────┘
         │ HTTPS (443)
         ▼
┌─────────────────────────────────────────────────────┐
│   공유기 (포트포워딩 80/443 → NAS)                  │
└────────┬────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────┐
│   Synology NAS                                       │
│                                                      │
│   ┌──────────────────────────────┐                  │
│   │ DSM 내장 리버스 프록시        │                  │
│   │ - Let's Encrypt 인증서        │                  │
│   │ - https(443) → http(3000)     │                  │
│   └──────────┬───────────────────┘                  │
│              │                                       │
│              ▼                                       │
│   ┌──────────────────────────────┐                  │
│   │ Container Manager             │                  │
│   │ ┌─────────────────────────┐  │                  │
│   │ │ j-bridge-web (Next.js)  │  │                  │
│   │ │  - 포트: 3000           │  │                  │
│   │ │  - 볼륨: audio-cache    │  │                  │
│   │ └─────────────────────────┘  │                  │
│   └──────────────────────────────┘                  │
└──────┬──────────────┬─────────────┬─────────────────┘
       │              │             │
       ▼              ▼             ▼
┌──────────────┐ ┌──────────┐ ┌────────────────┐
│ Supabase     │ │ Judge0   │ │ Google Cloud   │
│ (클라우드)    │ │ (별도서버)│ │ TTS API        │
│ Auth/DB/     │ │ 코드 채점 │ │ 음성합성        │
│ Storage      │ └──────────┘ └────────────────┘
└──────────────┘
```

### 1-2. "NAS 안" vs "NAS 밖" 정리

| 구성요소 | 위치 | 비고 |
|---|---|---|
| Next.js 앱 (J-Bridge) | **NAS 컨테이너** | 이번 작업으로 옮김 |
| TTS 오디오 캐시 | **NAS 볼륨** | `/volume1/docker/j-bridge/audio-cache` |
| 리버스 프록시 + 인증서 | **NAS (DSM 내장)** | Container Manager가 아닌 DSM 제어판에서 설정 |
| Supabase (DB / Auth / Storage) | NAS 밖 (클라우드) | 변경 없음 |
| Judge0 | NAS 밖 (별도 서버) | 변경 없음. `JUDGE0_API_URL` 환경변수로 연결만 |
| Google Cloud TTS | NAS 밖 (Google) | API 키만 환경변수에 |

> 💡 **포인트**: 데이터(Supabase, Judge0)는 그대로 두고, **앱 실행 자리만** NAS로 옮기는 작업입니다.
> 그래서 다운타임이 매우 짧고 롤백도 쉽습니다.

---

## 2장. 사전 개념 정리

처음 보는 용어가 많을 수 있어서, 이 가이드에서 나오는 핵심 단어를 짧게 정리합니다.

### 2-1. Docker (도커)
앱과 그 앱이 돌아가는 환경(Node 버전, 시스템 라이브러리 등)을 **하나의 통(컨테이너)**에 담아두는 도구입니다.
"내 컴퓨터에서는 됐는데 서버에선 안 돼"를 없애주는 게 핵심 장점이에요.

### 2-2. 이미지(イメージ) vs 컨테이너(コンテナ)
- **이미지** = 설계도 (앱 + 의존성을 묶은 파일)
- **컨테이너** = 설계도로 만들어 실행 중인 인스턴스

→ 이미지 1개 만들어두면, 같은 NAS에서 여러 개 컨테이너로 띄울 수도 있습니다.

### 2-3. Dockerfile
이미지를 만드는 **레시피 파일**입니다.
"Node 20 위에 → 코드 복사 → npm ci → next build → 실행"같은 절차가 위에서 아래로 적혀 있어요.
이 프로젝트의 Dockerfile은 [`/Dockerfile`](../Dockerfile)에 있습니다.

### 2-4. docker compose (도커 컴포즈)
"컨테이너 어떻게 실행할지"를 YAML 파일로 적어두는 도구입니다.
포트, 환경변수, 볼륨, 재시작 정책 등을 한 번에 정의해서 `docker compose up -d` 한 줄로 띄울 수 있어요.
이 프로젝트의 정의는 [`/docker-compose.yml`](../docker-compose.yml)에 있습니다.

### 2-5. 볼륨(ボリューム)
컨테이너는 **죽으면 안에 있던 파일이 다 사라집니다**. 그래서 영구 보존이 필요한 파일은 NAS의 폴더를 컨테이너 안의 폴더에 "마운트"해서 씁니다.
이 프로젝트에서는 TTS 캐시 폴더(`/app/public/audio`)를 NAS 폴더에 마운트합니다.

### 2-6. 포트 매핑
컨테이너 안의 3000번 포트를 NAS의 3000번 포트와 연결하는 작업입니다.
`docker-compose.yml`의 `ports: ["3000:3000"]` 부분이 이걸 하고 있어요.

### 2-7. 리버스 프록시 / HTTPS
- 컨테이너는 **http(3000)**으로만 떠 있습니다.
- 외부 사용자는 **https(443)**로 들어와야 합니다 (Supabase Auth, OAuth 등 모두 https 요구).
- 그 사이를 중계하면서 SSL 인증서를 처리해주는 게 **리버스 프록시**입니다.
- Synology는 이걸 **DSM 내장 기능**으로 클릭 몇 번에 해줍니다 (Nginx Proxy Manager 같은 별도 도구가 필요 없음).

### 2-8. Synology Container Manager
DSM 7.2부터 기존 "Docker" 패키지를 대체한 GUI 패키지입니다.
내부는 그대로 `docker` + `docker compose` 라서 **터미널 명령어가 그대로 통합니다**.
GUI 만으로 작업할 수도 있지만, 이 가이드는 **SSH 명령어 방식**을 메인으로 설명합니다 (재현성과 학습 효율이 좋음).

---

## 3장. 프로젝트 측 준비 (로컬)

> 이 장의 작업은 **이미 완료**되어 있습니다. 어떤 파일이 어떤 역할인지만 이해해주세요.

### 3-1. `next.config.ts` — standalone 출력 활성화

```ts
const nextConfig: NextConfig = {
  output: 'standalone',
};
```

`output: 'standalone'`을 켜면 `next build` 결과물이 **자기 자신 + 꼭 필요한 node_modules**만 추려서 `.next/standalone` 폴더에 들어갑니다.
이 폴더만 Docker 이미지에 복사하면 되니까 **이미지 크기가 1GB → 200MB 수준**으로 줄어요.

### 3-2. `Dockerfile` — 멀티스테이지 빌드

[`/Dockerfile`](../Dockerfile)을 확인하세요. 3단계 구조입니다:

| 단계 | 역할 | 결과물 |
|---|---|---|
| `deps` | `npm ci`로 의존성만 설치 | `node_modules` |
| `builder` | `next build` 실행 | `.next/standalone` |
| `runner` | 최종 실행 이미지 (가장 작음) | 200MB대 이미지 |

핵심 포인트 3가지:
- **non-root 사용자**(`nextjs`)로 실행 — 컨테이너 탈취 시 권한 최소화
- **`sharp` 별도 설치** — `next/image` 최적화에 필수
- **HEALTHCHECK** — `/api/health`를 30초마다 호출해서 죽었는지 감지

### 3-3. `.dockerignore`

Docker는 "빌드 컨텍스트"라는 이름으로 현재 폴더 전체를 빌드 시 읽어들입니다.
`.dockerignore`로 불필요한 파일을 제외해서 빌드 속도와 보안을 챙깁니다.
특히 다음은 **꼭 제외**됩니다:
- `.env*` (`.env.example` 제외) — 비밀이 이미지에 박히지 않게
- `BRIEFING_NOTES.md` — 개인 메모
- `docs/`, `judge0/` — 런타임에 불필요

### 3-4. `/api/health` — 헬스체크 엔드포인트

[`src/app/api/health/route.ts`](../src/app/api/health/route.ts) — 단순히 `{ status: 'ok', uptime }`만 반환합니다.
- **Supabase에는 ping 하지 않습니다** (Supabase 장애가 헬스체크 실패로 전파되면 컨테이너가 무한 재시작됨)
- 컨테이너 자체가 살아있는지만 보는 용도

### 3-5. `docker-compose.yml`

[`/docker-compose.yml`](../docker-compose.yml) — 단일 `web` 서비스를 정의합니다.
주요 설정:
- `env_file: .env.production` — 비밀은 별도 파일에서 읽음
- `volumes: ./audio-cache:/app/public/audio` — TTS 캐시 영속화
- `healthcheck` — 컨테이너 상태 자동 감시
- `restart: unless-stopped` — NAS 재부팅 / 컨테이너 크래시 시 자동 재시작
- `logging.max-size: 10m` — 로그가 디스크를 잠식하지 않게 제한

---

## 4장. NAS 측 준비 (Synology DSM)

### 4-1. DSM 버전 확인

DSM **7.2 이상**이 필요합니다 (Container Manager 패키지 요구사항).
확인: `제어판 → 정보 센터 → DSM 버전`

### 4-2. Container Manager 설치

1. **패키지 센터** 열기
2. 검색창에 `Container Manager` 입력
3. **설치** 클릭
4. 설치 완료 후 메인 메뉴에서 실행 가능

> 옛날 DSM(7.1 이하)에서는 패키지명이 그냥 "Docker"였습니다. 동일한 기능입니다.

### 4-3. SSH 활성화 (명령어 작업용)

1. `제어판 → 터미널 및 SNMP`
2. **SSH 서비스 활성화** 체크 → 적용
3. 포트는 기본 22 그대로 두거나, 보안을 위해 다른 포트로 변경 가능

> ⚠️ **보안 주의**: SSH는 **사내 LAN에서만** 열어두세요. 외부에서 SSH 접속이 필요하다면 **반드시 키 인증(비밀번호 금지) + 비표준 포트 + fail2ban**.

### 4-4. 폴더 구조 만들기

DSM의 **File Station** 또는 SSH로:

```
/volume1/docker/j-bridge/
  ├─ docker-compose.yml      ← 5장에서 git pull 시 자동 생성
  ├─ Dockerfile              ← 5장에서 git pull 시 자동 생성
  ├─ .env.production         ← 6장에서 직접 작성 (chmod 600 필수)
  └─ audio-cache/            ← TTS 캐시 볼륨 (빈 폴더로 미리 생성)
```

SSH로 만든다면:

```bash
ssh your-user@NAS_IP
sudo mkdir -p /volume1/docker/j-bridge/audio-cache
sudo chown -R your-user:users /volume1/docker/j-bridge
cd /volume1/docker/j-bridge
```

---

## 5장. 이미지 빌드 & 배포

3가지 방법이 있습니다. 처음에는 **방법 A를 권장**합니다.

### 방법 A (권장) — NAS에서 직접 git pull + build

가장 단순하고 학습 효과가 좋습니다.

**1단계: NAS에 코드 받기**

```bash
ssh your-user@NAS_IP
cd /volume1/docker/j-bridge

# 처음 한 번만:
git clone https://github.com/your-org/j-bridge.git .
# 또는 SSH 키 등록 후:
git clone git@github.com:your-org/j-bridge.git .
```

이후 업데이트는 `git pull`만 하면 됩니다.

**2단계: 환경변수 파일 준비**

→ **6장**으로 이동해서 `.env.production` 파일을 먼저 만든 다음 돌아오세요.

**3단계: 이미지 빌드**

```bash
cd /volume1/docker/j-bridge
docker compose build
```

> ⏱️ 처음 빌드는 5~15분 정도 걸립니다 (Node 이미지 다운로드 + npm ci + next build).
> 두 번째부터는 캐시 덕에 1~3분이면 끝.

**4단계: 컨테이너 실행**

```bash
docker compose up -d
```

`-d` 옵션은 "백그라운드 실행"입니다. 터미널을 닫아도 계속 실행돼요.

**5단계: 동작 확인**

```bash
docker compose ps          # 상태 확인 (Up (healthy) 이면 정상)
docker compose logs -f web # 로그 확인 (Ctrl+C로 종료)
curl http://localhost:3000/api/health
```

다음 응답이 나오면 성공:
```json
{"status":"ok","uptime":12.34,"timestamp":"2026-..."}
```

---

### 방법 B (대안) — 로컬에서 빌드 → 이미지 파일 전송

NAS 메모리가 부족해서 빌드가 OOM 에러로 죽는다면 이 방법을 씁니다.

```powershell
# Windows 로컬에서:
docker build -t j-bridge:latest `
  --build-arg NEXT_PUBLIC_SUPABASE_URL=https://xxx.supabase.co `
  --build-arg NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ... .

docker save j-bridge:latest -o j-bridge.tar

# NAS로 복사 (SCP 또는 File Station)
scp j-bridge.tar your-user@NAS_IP:/volume1/docker/j-bridge/
```

NAS에서:
```bash
cd /volume1/docker/j-bridge
docker load -i j-bridge.tar
docker compose up -d   # build 단계 건너뛰고 바로 실행
```

---

### 방법 C (자동화) — GitHub Container Registry (GHCR)

GitHub Actions에서 빌드 → GHCR에 push → NAS에서 pull 하는 방식.
이 가이드 범위 밖이지만, [부록 A](#부록-a-github-actions-자동-배포-다음-단계)에 워크플로 예시를 적어두었습니다.

---

## 6장. 환경변수 안전하게 두기

### 6-1. `.env.production` 파일 작성

NAS의 `/volume1/docker/j-bridge/.env.production`에 직접 작성합니다.

```bash
cd /volume1/docker/j-bridge
vi .env.production
```

내용 (값은 실제 값으로 교체):

```bash
# ---------- Supabase ----------
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...
SUPABASE_SERVICE_ROLE_KEY=eyJ...   # ⚠️ 치명적 비밀 — 절대 외부 노출 금지

# ---------- Judge0 (별도 서버) ----------
JUDGE0_API_URL=http://your-judge0-host:2358
JUDGE0_API_KEY=

# ---------- Google Cloud TTS ----------
GOOGLE_CLOUD_TTS_API_KEY=AIza...

# ---------- Node 런타임 ----------
NODE_ENV=production
```

### 6-2. 파일 권한 잠그기

```bash
chmod 600 .env.production
ls -la .env.production
# -rw------- 1 your-user users ... .env.production
```

소유자만 읽고 쓸 수 있도록 합니다. 다른 사용자, 그룹은 일절 못 봅니다.

### 6-3. 환경변수 종류 이해하기

| 변수 | 노출되는가? | 어디서 사용? |
|---|---|---|
| `NEXT_PUBLIC_*` | **클라이언트 번들에 박힘** | 브라우저 코드. 빌드 시점에 inline |
| `SUPABASE_SERVICE_ROLE_KEY` | **서버 전용 (절대 노출 금지)** | Server Actions에서 RLS 우회 시 |
| `JUDGE0_*` | 서버 전용 | Judge0 API 호출 |
| `GOOGLE_CLOUD_TTS_API_KEY` | 서버 전용 | TTS API 라우트 |

> 💡 **왜 빌드 시점에 PUBLIC 변수를 넣어야 하나?**
> Next.js는 `NEXT_PUBLIC_*` 변수를 **빌드할 때** JavaScript 번들에 문자열로 끼워넣습니다.
> 그래서 `docker compose build` 단계에서 `args`로 전달해야 합니다. 런타임 env 만으로는 클라이언트에서 `undefined`가 됩니다.

### 6-4. 키 회전 시 절차

Supabase service_role key를 새로 발급했다면:

```bash
vi .env.production       # 키 값만 교체
docker compose up -d     # 자동으로 컨테이너 재생성
```

PUBLIC 변수가 바뀌었다면 빌드도 다시:
```bash
docker compose up -d --build
```

---

## 7장. 도메인 + HTTPS 설정

### 7-1. DDNS 설정 (Synology 무료 도메인)

자체 도메인이 없다면 Synology가 무료로 `xxx.synology.me`를 줍니다.

1. `제어판 → 외부 액세스 → DDNS` 탭
2. **추가** 클릭
3. 서비스 공급자: **Synology**
4. 호스트 이름: `j-bridge-mycompany` → `j-bridge-mycompany.synology.me`
5. 이메일 입력, **약관 동의** → 확인

자체 도메인을 쓸 거라면 도메인 DNS에서 A 레코드를 NAS의 공인 IP로 향하게 설정하세요.

### 7-2. 공유기 포트포워딩

공유기 관리 화면(보통 `192.168.0.1` 또는 `192.168.1.1`)에서:

| 외부 포트 | 내부 IP | 내부 포트 | 용도 |
|---|---|---|---|
| 80 | NAS IP | 80 | Let's Encrypt 인증서 발급 (HTTP-01 검증) |
| 443 | NAS IP | 443 | HTTPS 본 서비스 |

> ⚠️ 3000번 포트는 **외부로 열지 마세요**. 리버스 프록시를 거치지 않으면 HTTPS 보호가 안 됩니다.

### 7-3. Let's Encrypt 인증서 발급

1. `제어판 → 보안 → 인증서` 탭
2. **추가 → 새 인증서 추가 → Let's Encrypt로 인증서 가져오기**
3. 도메인 이름: `j-bridge-mycompany.synology.me`
4. 이메일 입력 → 완료
5. 발급되면 인증서 목록에 표시됩니다 (90일마다 자동 갱신)

### 7-4. 리버스 프록시 규칙 추가

1. `제어판 → 로그인 포털 → 고급` 탭
2. **리버스 프록시 → 만들기**

**일반 탭:**
| 항목 | 값 |
|---|---|
| 설명 | `j-bridge` |
| 소스 프로토콜 | `HTTPS` |
| 소스 호스트 이름 | `j-bridge-mycompany.synology.me` |
| 소스 포트 | `443` |
| **HSTS 활성화** | ✅ 체크 |
| **HTTP/2 활성화** | ✅ 체크 |
| 대상 프로토콜 | `HTTP` |
| 대상 호스트 이름 | `localhost` |
| 대상 포트 | `3000` |

**사용자 정의 헤더 탭** → **만들기 → WebSocket**:
```
Upgrade        $http_upgrade
Connection     $connection_upgrade
```
(Next.js의 RSC 스트리밍과 HMR 안정성을 위해 권장)

**확인** 클릭.

### 7-5. Supabase 측 설정 동기화

새 도메인으로 OAuth/이메일 인증 리다이렉트가 동작하려면:

1. Supabase 대시보드 → 프로젝트 → `Authentication → URL Configuration`
2. **Site URL**: `https://j-bridge-mycompany.synology.me`
3. **Redirect URLs**에 다음 추가:
   - `https://j-bridge-mycompany.synology.me/**`
   - (개발용 `http://localhost:3000/**`는 그대로 둬도 됨)

### 7-6. 첫 접속 확인

브라우저로 `https://j-bridge-mycompany.synology.me` 접속:
- 자물쇠 아이콘이 정상이면 HTTPS OK
- J-Bridge 로그인 화면이 떠야 함

```bash
# CLI로도 확인
curl https://j-bridge-mycompany.synology.me/api/health
```

---

## 8장. 운영 체크리스트 & 트러블슈팅

### 8-1. 일상 운영 명령어

| 작업 | 명령어 |
|---|---|
| 상태 확인 | `docker compose ps` |
| 로그 실시간 보기 | `docker compose logs -f web` |
| 최근 로그 100줄만 | `docker compose logs --tail=100 web` |
| 재시작 | `docker compose restart web` |
| 정지 + 컨테이너 제거 | `docker compose down` |
| 컨테이너 안 쉘 진입 | `docker compose exec web sh` |
| 디스크 사용량 정리 | `docker system prune -a` (⚠️ 안 쓰는 이미지 전부 삭제) |

### 8-2. 코드 업데이트 워크플로

```bash
cd /volume1/docker/j-bridge
git pull                       # 새 코드 가져오기
docker compose up -d --build   # 다시 빌드하고 무중단 교체
docker compose logs -f web     # 정상 기동 확인
```

> `--build` 없이 `up -d`만 하면 기존 이미지를 다시 쓰니, **코드가 바뀌었다면 반드시 `--build`**.

### 8-3. 자주 발생하는 문제

#### ❌ 502 Bad Gateway
- 원인: 컨테이너가 죽었거나 헬스체크 실패
- 확인: `docker compose ps`에서 상태가 `unhealthy` 또는 `exited`
- 조치: `docker compose logs --tail=50 web`로 에러 원인 파악

#### ❌ 환경변수 누락 (`Environment validation failed`)
- 원인: `src/lib/env.ts`의 Zod 검증 실패 — 컨테이너가 부팅 즉시 죽음
- 조치: `.env.production`의 필수 변수 (`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`) 확인

#### ❌ Supabase OAuth 리다이렉트 실패
- 원인: Supabase Auth → URL Configuration에 새 도메인 미등록
- 조치: 7-5 단계 다시 수행

#### ❌ TTS 401 Unauthorized
- 원인: Google API 키 IP 제한이 NAS의 공인 IP를 막고 있음
- 조치: Google Cloud Console → API 자격 증명 → IP 제한에 NAS 공인 IP 추가

#### ❌ 빌드 OOM (`Killed`)
- 원인: NAS 메모리 부족 (특히 RAM 2GB 모델)
- 조치: **방법 B**(로컬 빌드)로 전환. 또는 빌드 시 swap 일시 확장.

#### ❌ 포트 3000 충돌
- 원인: 다른 컨테이너가 이미 3000번 사용 중
- 확인: `docker ps | grep 3000`
- 조치: `docker-compose.yml`의 ports를 `"3001:3000"` 등으로 변경 후 리버스 프록시 대상 포트도 3001로 수정

### 8-4. 정기 점검 권장 항목 (월 1회)

- [ ] DSM 보안 업데이트 (제어판 → 업데이트 및 복원)
- [ ] Let's Encrypt 인증서 자동 갱신 상태 (제어판 → 보안 → 인증서)
- [ ] 디스크 사용량 (`df -h /volume1`)
- [ ] Docker 이미지 정리 (`docker image prune -a`)
- [ ] 백업 — `audio-cache/`, `.env.production` 보존 (부록 B)

---

## 부록 A. GitHub Actions 자동 배포 (다음 단계)

수동 `git pull && docker compose up -d --build`가 익숙해진 후 도전하세요.

**핵심 아이디어**: GitHub Actions에서 이미지 빌드 → GHCR에 push → NAS는 cron으로 주기적 pull (또는 webhook).

`.github/workflows/docker-publish.yml` 예시:

```yaml
name: Build and Push Docker Image
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    steps:
      - uses: actions/checkout@v4
      - uses: docker/setup-buildx-action@v3
      - uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ghcr.io/${{ github.repository_owner }}/j-bridge:latest
          build-args: |
            NEXT_PUBLIC_SUPABASE_URL=${{ secrets.NEXT_PUBLIC_SUPABASE_URL }}
            NEXT_PUBLIC_SUPABASE_ANON_KEY=${{ secrets.NEXT_PUBLIC_SUPABASE_ANON_KEY }}
```

NAS 측은 `docker-compose.yml`의 `build:` 블록을 `image: ghcr.io/...:latest`로 바꾸고:
```bash
docker compose pull && docker compose up -d
```

---

## 부록 B. 백업 / 마이그레이션

### 백업

```bash
cd /volume1/docker
tar czf j-bridge-backup-$(date +%Y%m%d).tar.gz \
  j-bridge/.env.production \
  j-bridge/audio-cache
```

이 파일을 별도 저장소(외장 USB / 다른 NAS / 클라우드)에 보관.

### 다른 NAS로 이전

```bash
# 새 NAS에서:
cd /volume1/docker/j-bridge
tar xzf j-bridge-backup-20260522.tar.gz --strip-components=1
git clone https://github.com/your-org/j-bridge.git tmp
mv tmp/{Dockerfile,docker-compose.yml,...} .
docker compose up -d --build
```

---

## 부록 C. 모니터링 한 단계 더

[Uptime Kuma](https://github.com/louislam/uptime-kuma)를 같은 NAS에 추가로 띄우면 외부에서 보이는 형태로 헬스를 감시할 수 있습니다.

```yaml
# /volume1/docker/uptime-kuma/docker-compose.yml
services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    container_name: uptime-kuma
    restart: unless-stopped
    ports:
      - "3001:3001"
    volumes:
      - ./data:/app/data
```

브라우저로 `http://NAS_IP:3001` 접속해서 `https://j-bridge-mycompany.synology.me/api/health` 모니터링 추가.

---

## 마치며

이 문서는 **첫 배포까지의 가이드**입니다. 운영하면서 발생하는 새 시나리오(예: 다중 환경, 블루/그린 배포, 모니터링 강화)는 별도 문서로 추가하는 것을 권장합니다.

질문이나 막힌 부분이 생기면:
- 로그를 먼저: `docker compose logs --tail=100 web`
- 환경변수 검증 실패 메시지는 그 자체로 어떤 변수가 빠졌는지 알려줍니다 (`src/lib/env.ts`)
- 그래도 모르겠다면 로그 전문과 함께 팀에 공유
