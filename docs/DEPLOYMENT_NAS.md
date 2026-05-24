# J-Bridge — Synology NAS + Docker 이전 가이드

> 이 문서는 **인프라 입문자**를 대상으로 작성되었습니다.
> "왜 이걸 하는지" 개념을 짚으면서 단계별 명령까지 따라갈 수 있도록 구성했습니다.
>
> 전제 환경:
> - NAS: **Synology DS223j** (DSM 7.2 이상, ARM64, RAM 1GB 고정)
> - 외부 공개: **Cloudflare Tunnel** 사용 (포트포워딩 불필요, Let's Encrypt 불필요)
> - DB / Auth / Storage: **Supabase Cloud 유지** — NAS에 두지 않음 (1GB RAM에서 셀프호스팅 불가)
> - Judge0: **별도 서버 유지** — 이번 작업 범위 밖
> - 컨테이너화 대상: **Next.js 앱 1개 + cloudflared 사이드카**
>
> 다른 모델 / 다른 사양을 쓰는 경우 본문의 메모리 관련 경고만 참고로 보고 그 외 절차는 동일합니다.

---

## 목차

1. [전체 그림 — 무엇을 어디에 두는가](#1장-전체-그림--무엇을-어디에-두는가)
2. [사전 개념 정리](#2장-사전-개념-정리)
3. [프로젝트 측 준비 (로컬)](#3장-프로젝트-측-준비-로컬)
4. [NAS 측 준비 (Synology DSM)](#4장-nas-측-준비-synology-dsm)
5. [이미지 빌드 & 배포](#5장-이미지-빌드--배포)
6. [환경변수 안전하게 두기](#6장-환경변수-안전하게-두기)
7. [도메인 + Cloudflare Tunnel 설정](#7장-도메인--cloudflare-tunnel-설정)
8. [운영 체크리스트 & 트러블슈팅](#8장-운영-체크리스트--트러블슈팅)

부록: [A. GitHub Actions 자동 배포](#부록-a-github-actions-자동-배포-다음-단계) · [B. 백업/마이그레이션](#부록-b-백업--마이그레이션) · [C. 모니터링 한 단계 더](#부록-c-모니터링-한-단계-더) · [D. 성능 & 배포 워크플로 FAQ](#부록-d-성능--배포-워크플로-faq) · [E. 실배포 진행 기록 (2026-05-24~25)](#부록-e-실배포-진행-기록-2026-05-2425-1차-시도)

---

## 1장. 전체 그림 — 무엇을 어디에 두는가

### 1-1. 아키텍처 한눈에

```
┌──────────────────┐
│   外部ユーザー    │  사용자는 https://app.your-domain.com 으로 접속
│   (인터넷 사용자) │
└────────┬─────────┘
         │ HTTPS (443)
         ▼
┌─────────────────────────────────────────────────────┐
│   Cloudflare 글로벌 엣지 (300+ POP)                 │
│   - TLS 종단 (인증서 자동 발급/갱신)                │
│   - /_next/static/* 등 immutable 자산 캐싱          │
│   - DDoS / 봇 차단                                  │
└────────┬────────────────────────────────────────────┘
         │ (cloudflared 아웃바운드 터널, HTTPS over QUIC)
         │ 공유기 포트포워딩 0개. NAS 공인 IP 노출 0회.
         ▼
┌─────────────────────────────────────────────────────┐
│   Synology NAS                                       │
│                                                      │
│   ┌──────────────────────────────────────────────┐  │
│   │ Container Manager                             │  │
│   │ ┌─────────────────────┐ ┌─────────────────┐ │  │
│   │ │ web (Next.js 3000)  │ │ cloudflared     │ │  │
│   │ │ - 127.0.0.1만 바인드│ │ - 아웃바운드만   │ │  │
│   │ └─────────────────────┘ └─────────────────┘ │  │
│   │       ↑ Docker network (내부 통신)           │  │
│   └──────────────────────────────────────────────┘  │
└──────┬──────────────┬─────────────┬─────────────────┘
       │              │             │
       ▼              ▼             ▼
┌──────────────────┐ ┌──────────┐ ┌────────────────┐
│ Supabase Cloud   │ │ Judge0   │ │ Google Cloud   │
│ - PostgreSQL DB  │ │ (별도서버)│ │ TTS API        │
│ - Auth           │ │ 코드 채점 │ │ 음성합성        │
│ - Storage (TTS   │ └──────────┘ └────────────────┘
│   캐시 + 아바타) │
└──────────────────┘
```

### 1-2. "NAS 안" vs "NAS 밖" 정리

| 구성요소 | 위치 | 비고 |
|---|---|---|
| Next.js 앱 (J-Bridge) | **NAS 컨테이너** | 이번 작업으로 옮김 |
| cloudflared | **NAS 컨테이너** | 외부 노출 담당 (사이드카) |
| TLS 인증서 + 리버스 프록시 | **Cloudflare 엣지** | NAS에서는 인증서 관리 안 함 |
| Supabase (DB / Auth / Storage / TTS 캐시) | NAS 밖 (클라우드) | 변경 없음. URL만 환경변수로 연결 |
| Judge0 | NAS 밖 (별도 서버) | 변경 없음. `JUDGE0_API_URL` 환경변수로 연결만 |
| Google Cloud TTS | NAS 밖 (Google) | API 키만 환경변수에 |

> 💡 **포인트 1**: 데이터(Supabase, Judge0)는 그대로 두고, **앱 실행 자리만** NAS로 옮기는 작업입니다.
> 그래서 다운타임이 매우 짧고 롤백도 쉽습니다.
>
> 💡 **포인트 2**: TTS 음성 파일도 **NAS가 아닌 Supabase Storage**에 저장됩니다. NAS에 TTS 캐시 폴더를 만들 필요가 없습니다. (예전 `docker-compose.yml`의 `audio-cache` 볼륨 마운트는 현재 사용되지 않는 잔재입니다.)

### 1-3. 왜 DB는 NAS에 안 두는가? (DS223j 1GB의 한계)

처음 보면 "이왕이면 DB도 NAS 안에 두면 좋지 않나?" 싶습니다. 결론부터 말하면 **DS223j 1GB로는 불가능**입니다.

| 시나리오 | 필요 RAM | DS223j(1GB)에서? |
|---|---|---|
| DSM 시스템 자체 | ~400MB 상시 점유 | — |
| Next.js 런타임 (단일 컨테이너) | 150~400MB | 🟡 빠듯하지만 가능 |
| 셀프호스팅 Supabase (postgres+auth+storage+postgrest+kong+studio+realtime+meta, **8개 컨테이너**) | **최소 2GB, 권장 4GB+** | ❌ 부팅 자체 불가 |

→ Supabase Cloud(무료/유료) 그대로 쓰고, **앱만 NAS로** 옮기는 게 이 사양에서 유일하게 동작하는 조합입니다.
하드웨어 업그레이드를 할 거라면 RAM 4GB+ x86 모델(DS224+ 등)로 가야 셀프호스팅이 의미 있어집니다.

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
> 이 프로젝트는 **로컬 볼륨에 보존할 파일이 없습니다**. TTS 음성 캐시도 Supabase Storage에 저장하기 때문에, NAS 측에는 영속 볼륨이 사실상 필요 없어요.

### 2-6. 포트 매핑
컨테이너 안의 3000번 포트를 NAS의 3000번 포트와 연결하는 작업입니다.
이번 구성에서는 **`127.0.0.1:3000`** 으로만 바인딩합니다 (사내 LAN에서도 직접 접근 불가, Cloudflare Tunnel 경유만 허용).

### 2-7. ARM64 vs x86
DS223j는 **ARM64** CPU(Realtek RTD1619B)를 씁니다. 개발 PC는 보통 **x86**.
→ Docker 이미지는 아키텍처별로 다릅니다. PC에서 빌드한 이미지를 그냥 NAS로 옮기면 "exec format error"로 죽어요.
→ 해결: **buildx + QEMU 에뮬레이션**으로 PC에서 ARM64 전용 이미지를 만들어 NAS로 보냅니다. (5장에서 절차 설명)

### 2-8. Synology Container Manager
DSM 7.2부터 기존 "Docker" 패키지를 대체한 GUI 패키지입니다.
내부는 그대로 `docker` + `docker compose` 라서 **터미널 명령어가 그대로 통합니다**.
GUI 만으로 작업할 수도 있지만, 이 가이드는 **SSH 명령어 방식**을 메인으로 설명합니다 (재현성과 학습 효율이 좋음).

### 2-9. Cloudflare Tunnel (cloudflared)
NAS 안에서 `cloudflared` 라는 작은 데몬을 띄우면, **NAS → Cloudflare 방향으로만** 연결을 수립합니다 (아웃바운드).
사용자가 도메인에 접속하면 Cloudflare 엣지가 그 터널을 통해 NAS로 요청을 전달합니다.

- **공유기 포트포워딩 0개** (80/443 모두 닫힌 채 운영)
- **NAS 공인 IP 노출 0회** (외부에서 직접 NAS 못 봄)
- **NAT 뒤, 가정용 회선에서도 동작** (공유기 설정 권한 필요 없음)
- 터널 자체가 HTTPS/QUIC로 암호화되므로 **NAS 측 TLS 인증서가 필요 없음**

### 2-10. CDN과 엣지 캐싱
Cloudflare는 전 세계 300+ 데이터센터에 트래픽을 분산시키는 CDN입니다. Next.js의 `/_next/static/*` 같은 파일들은 **빌드 후 절대 안 바뀌는 immutable 자산**이라서 Cloudflare가 엣지에 캐싱해두면 두 번째 사용자부터는 NAS까지 안 오고 가까운 엣지에서 즉시 받아요. → **정적 자산 응답속도 향상**.

다만 주의:
- **동적 응답(RSC, Server Actions)은 캐싱 안 됨** — 캐싱하면 다른 사용자에게 남의 데이터가 보이거나 Auth가 깨집니다.
- Cloudflare 대시보드에서 **"Cache Everything" 같은 page rule을 추가하지 마세요**. Next.js의 `Cache-Control` 헤더 기본 동작을 그대로 두는 것이 정답입니다.

### 2-11. DNS와 도메인
Cloudflare Tunnel은 **실제 도메인이 필요합니다**. (Synology가 주는 `xxx.synology.me` 같은 서브도메인은 못 씀.)

두 가지 경로:
- **(a) Cloudflare Registrar에서 신규 등록** — `.com` 기준 약 $10/년, 마진 없는 원가 판매. DNS도 자동으로 Cloudflare 위에 올라옵니다. **가장 단순한 경로.**
- **(b) 기존 등록업체(Gabia, Hosting.kr, GoDaddy, Namecheap 등)에서 네임서버만 Cloudflare로 변경** — 기존 도메인을 유지하면서 Cloudflare 기능만 쓸 수 있음. 단, **NS 전파 1~48시간**이 걸리고, 기존 DNS 레코드(특히 MX 메일)를 Cloudflare에 먼저 복제 후 변경해야 합니다.

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

> 참고: 베이스 이미지 `node:20-alpine`은 multi-arch 매니페스트라서 buildx로 `--platform linux/arm64` 지정 시 자동으로 ARM64 변종을 가져옵니다. Dockerfile 수정 불필요.

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

[`/docker-compose.yml`](../docker-compose.yml) — 현재 단일 `web` 서비스를 정의합니다.
7장에서 **`cloudflared` 서비스를 추가**하게 됩니다.
주요 설정:
- `env_file: .env.production` — 비밀은 별도 파일에서 읽음
- `healthcheck` — 컨테이너 상태 자동 감시
- `restart: unless-stopped` — NAS 재부팅 / 컨테이너 크래시 시 자동 재시작
- `logging.max-size: 10m` — 로그가 디스크를 잠식하지 않게 제한

> 현재 `docker-compose.yml`에 있는 `./audio-cache:/app/public/audio` 볼륨 마운트는 **사용되지 않는 잔재**입니다. TTS 캐시가 Supabase Storage로 옮겨졌기 때문이에요. 제거해도 무방하지만, 코드 변경은 이번 배포 작업 범위 밖이므로 그대로 둡니다.

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

> ⚠️ **보안 주의 (중요)**:
> - SSH는 **사내 LAN 안에서만** 사용하세요.
> - Cloudflare Tunnel을 쓰면 **외부 포트를 단 하나도 열 필요가 없습니다**. SSH(22)도 외부로 포트포워딩 절대 금지.
> - 외부에서 SSH가 정말 필요하다면 **Cloudflare Access SSH**(zero-trust)를 별도로 설정하세요. 본 가이드 범위 밖입니다.

### 4-4. 폴더 구조 만들기

DSM의 **File Station** 또는 SSH로:

```
/volume1/docker/j-bridge/
  ├─ docker-compose.yml      ← 5장에서 git pull 또는 직접 작성
  ├─ Dockerfile              ← 5장에서 git pull 또는 빌드 컨텍스트
  └─ .env.production         ← 6장에서 직접 작성 (chmod 600 필수)
```

SSH로 만든다면:

```bash
ssh your-user@NAS_IP
sudo mkdir -p /volume1/docker/j-bridge
sudo chown -R your-user:users /volume1/docker/j-bridge
cd /volume1/docker/j-bridge
```

> 💡 예전 버전 가이드에는 `audio-cache/` 폴더가 있었지만, **현재는 필요 없습니다** (TTS 캐시가 Supabase Storage에 저장됨).

### 4-5. DS223j 메모리 절약 셋업

DS223j는 RAM 1GB 고정(증설 불가). 평상시 약 700~850MB까지 차므로, **불필요한 DSM 서비스를 끄고 swap을 늘려둬야** 안정적으로 운영됩니다.

**(1) 불필요한 DSM 패키지/기능 끄기**

`패키지 센터` 또는 `제어판`에서:
- Universal Search 인덱싱 → 정지 (안 쓸 거면 패키지 제거)
- Synology Photos / Drive / Note Station — 미사용 시 정지
- 인덱싱 서비스 (`제어판 → 인덱싱 서비스`) → 음악/사진/비디오 폴더 인덱싱 끄기

각각 30~100MB씩 회수됩니다.

**(2) 2GB swap 파일 추가**

기본 DSM swap은 작으므로, `/volume1`에 swap 파일을 만들어 비상용 메모리를 확보합니다.

```bash
ssh your-user@NAS_IP
sudo dd if=/dev/zero of=/volume1/swapfile bs=1M count=2048
sudo chmod 600 /volume1/swapfile
sudo mkswap /volume1/swapfile
sudo swapon /volume1/swapfile

# 부팅 후에도 유지되도록
echo '/volume1/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# 확인
free -m
```

`Swap` 열의 `total`이 2GB 이상으로 늘어났으면 성공.

> ⚠️ swap은 **HDD에 있는 가짜 메모리**입니다. 디스크 액세스가 잦아져서 응답이 느려질 수는 있지만, OOM으로 컨테이너가 죽는 것보다는 훨씬 낫습니다.

---

## 5장. 이미지 빌드 & 배포

### 5-0. DS223j는 NAS에서 직접 빌드 불가

`next build`는 피크에서 1.5~2GB의 RAM을 잡습니다. 1GB NAS에서는 **반드시 OOM으로 죽습니다**.
→ **로컬 PC에서 ARM64 이미지를 만들어 NAS로 전송**하는 방법(Method A)을 사용합니다. NAS에서 `docker compose build`를 시도하지 마세요.

(RAM 4GB+ NAS를 쓰는 경우에만 NAS 직접 빌드를 시도할 수 있으며, 이 가이드 범위에서는 다루지 않습니다.)

### Method A (권장) — 로컬에서 ARM64 빌드 → NAS로 전송

전제: 개발 PC에 **Docker Desktop** 설치되어 있고 실행 중.

**1단계: 멀티 아키텍처 빌더 준비 (PC에서 1회만)**

```powershell
# QEMU 에뮬레이터 설치 (ARM64 이미지를 x86 PC에서 만들 수 있게 해줌)
docker run --privileged --rm tonistiigi/binfmt --install arm64

# buildx 빌더 생성
docker buildx create --name multiarch --use --bootstrap
```

확인:
```powershell
docker buildx ls
# multiarch * docker  (linux/amd64, linux/arm64, ...) 로 표시되면 OK
```

**2단계: 환경변수 값 미리 손에 들기**

Supabase Cloud 프로젝트의 다음 값들이 빌드 인자로 들어갑니다. 미리 확인:
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`

> 💡 왜 빌드 시점에 필요? Next.js는 `NEXT_PUBLIC_*` 변수를 빌드 단계에 JavaScript 번들에 **문자열로 박아넣습니다**. 런타임 env로는 클라이언트에서 `undefined`가 됩니다.

**3단계: ARM64 이미지 빌드 (PC에서)**

프로젝트 루트(`Dockerfile`이 있는 폴더)에서:

```powershell
docker buildx build --platform linux/arm64 `
  --build-arg NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co `
  --build-arg NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ... `
  -t j-bridge:latest `
  --load .
```

> ⏱️ **8~15분 소요**. QEMU 에뮬레이션이라 평소보다 3~5배 느립니다. 특히 `sharp` 설치 단계가 길어요. 정상이니 끊지 마세요.

**4단계: 이미지 압축 & NAS로 전송**

```powershell
# tar로 저장하면서 gzip 압축 (250~400MB → 100~150MB로 줄어듦)
docker save j-bridge:latest | gzip > j-bridge.tar.gz

# NAS로 복사 (SCP)
scp j-bridge.tar.gz your-user@NAS_IP:/volume1/docker/j-bridge/
```

> File Station을 통한 GUI 업로드도 가능하지만, 큰 파일은 SCP가 안정적입니다.

**5단계: `docker-compose.yml`과 `.env.production` 준비**

NAS에서 (SSH 접속 후):
```bash
cd /volume1/docker/j-bridge

# git에서 docker-compose.yml만 받기 (또는 SCP로 별도 전송)
# 옵션 a) 전체 클론
git clone https://github.com/your-org/j-bridge.git .  
# 또는 옵션 b) 필요한 파일만 직접 작성/SCP

# .env.production은 6장에서 작성
```

**6단계: NAS에서 이미지 로드 & 기동**

```bash
cd /volume1/docker/j-bridge
gunzip -c j-bridge.tar.gz | docker load
# Loaded image: j-bridge:latest 메시지 확인

docker compose up -d
```

`-d` 옵션은 "백그라운드 실행"입니다.

> 주의: 이 시점에서는 아직 **Cloudflare Tunnel을 설정하지 않은 상태**라서 외부 도메인으로는 접속할 수 없습니다. 동작 확인은 NAS 내부 → 7장에서 Tunnel 연결 → 외부 접속 순서입니다.

**7단계: 동작 확인 (NAS 내부)**

```bash
docker compose ps          # Up (healthy) 확인
docker compose logs -f web # 정상 기동 로그 확인 (Ctrl+C로 종료)
curl http://localhost:3000/api/health
```

다음 응답이 나오면 성공:
```json
{"status":"ok","uptime":12.34,"timestamp":"..."}
```

---

### Method B (대안) — GitHub Container Registry (GHCR)

GitHub Actions에서 ARM64 이미지를 빌드 → GHCR에 push → NAS에서 pull 하는 방식.
이 가이드 범위 밖이지만, [부록 A](#부록-a-github-actions-자동-배포-다음-단계)에 워크플로 예시를 적어두었습니다.

CI를 굳이 안 만들고도 매번 Method A로 배포가 가능하므로, 처음에는 Method A로 시작하고 자동화는 이후 단계에 맡기는 것을 권장합니다.

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
# ---------- Supabase Cloud ----------
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...
SUPABASE_SERVICE_ROLE_KEY=eyJ...   # ⚠️ 치명적 비밀 — 절대 외부 노출 금지

# ---------- Judge0 (별도 서버) ----------
JUDGE0_API_URL=http://your-judge0-host:2358
JUDGE0_API_KEY=

# ---------- Google Cloud TTS ----------
GOOGLE_CLOUD_TTS_API_KEY=AIza...

# ---------- Cloudflare Tunnel ----------
CLOUDFLARE_TUNNEL_TOKEN=eyJ...     # ⚠️ 7장에서 발급. 노출 시 도메인 탈취 가능

# ---------- Node 런타임 ----------
NODE_ENV=production
NODE_OPTIONS=--max-old-space-size=384   # DS223j 1GB 환경에서 V8 힙 제한
```

`NODE_OPTIONS` 설명: V8(Node 엔진)은 기본적으로 호스트 RAM의 ~75%까지 힙으로 잡으려고 합니다. 1GB 호스트에서는 700MB까지 잡을 수 있다는 뜻인데, 그러면 DSM이나 cloudflared가 메모리를 못 받게 됩니다. **384MB로 캡**을 두면 Node가 그 안에서 GC를 자주 돌리며 동작합니다.

### 6-2. 파일 권한 잠그기

```bash
chmod 600 .env.production
ls -la .env.production
# -rw------- 1 your-user users ... .env.production
```

소유자만 읽고 쓸 수 있도록 합니다. 다른 사용자, 그룹은 일절 못 봅니다.

### 6-3. 환경변수 종류 이해하기

| 변수 | 노출되는가? | 어디서 사용? | 설정 시점 |
|---|---|---|---|
| `NEXT_PUBLIC_*` | **클라이언트 번들에 박힘** | 브라우저 코드 | **PC에서 빌드 시 `--build-arg`로 전달** |
| `SUPABASE_SERVICE_ROLE_KEY` | **서버 전용 (절대 노출 금지)** | Server Actions에서 RLS 우회 시 | NAS의 `.env.production` (런타임) |
| `JUDGE0_*` | 서버 전용 | Judge0 API 호출 | NAS의 `.env.production` (런타임) |
| `GOOGLE_CLOUD_TTS_API_KEY` | 서버 전용 | TTS API 라우트 | NAS의 `.env.production` (런타임) |
| `CLOUDFLARE_TUNNEL_TOKEN` | cloudflared 컨테이너 전용 | `cloudflared` 서비스가 읽음 | NAS의 `.env.production` (런타임) |

> 💡 **PUBLIC 변수가 바뀌면 빌드부터 다시**:
> Supabase 프로젝트를 새로 만들거나 URL이 바뀌면, PC에서 `docker buildx build` 다시 → `docker save` → NAS 전송 → `docker compose up -d` 사이클을 다시 돌아야 합니다.

### 6-4. 키 회전 시 절차

서버 전용 키만 바뀌었다면 (예: Supabase service_role, Google TTS):

```bash
vi .env.production       # 키 값만 교체
docker compose up -d     # 자동으로 컨테이너 재생성
```

PUBLIC 변수 또는 Tunnel 토큰이 바뀌었다면:
- PUBLIC 변수 → PC에서 이미지 재빌드 + 재전송 (6-3 표 참고)
- Tunnel 토큰 → `.env.production` 수정 후 `docker compose up -d` (cloudflared만 재생성됨)

---

## 7장. 도메인 + Cloudflare Tunnel 설정

> 이 장은 기존 가이드의 "DSM 리버스 프록시 + Let's Encrypt + 포트포워딩" 방식을 **완전히 대체**합니다.
> 공유기 80/443 포트포워딩, DSM 인증서 발급, DSM 리버스 프록시 룰 모두 **하지 마세요**.

### 7-1. 도메인 준비

Cloudflare Tunnel은 실제 도메인이 필요합니다. (synology.me 같은 무료 서브도메인 사용 불가.)

#### 옵션 1 (권장): Cloudflare Registrar에서 신규 등록

1. [https://dash.cloudflare.com/](https://dash.cloudflare.com/) 가입 후 로그인
2. 좌측 메뉴 **도메인 등록 → 도메인 등록**
3. 원하는 도메인 검색 → 결제 (`.com` 기준 약 $10/년, 마진 없는 원가)
4. 등록 완료 시 자동으로 Cloudflare DNS 위에 올라옵니다 — NS 변경 불필요

#### 옵션 2: 기존 도메인 NS만 Cloudflare로 변경

이미 Gabia / Hosting.kr / GoDaddy 등에 도메인이 있다면:

1. Cloudflare 대시보드 → **사이트 추가** → 기존 도메인 입력 → Free 플랜
2. Cloudflare가 **현재 DNS 레코드를 자동 스캔** → 화면에 표시되는 레코드 확인
3. 빠진 레코드가 있으면 추가 (특히 **MX 레코드**가 있다면 메일이 끊기지 않게 반드시 복제)
4. Cloudflare가 안내하는 2개의 네임서버를 메모
5. 기존 등록업체 관리 페이지에서 네임서버를 그 2개로 변경
6. **전파 대기 1~48시간** — `dig NS your-domain.com` 명령으로 Cloudflare NS가 응답하기 시작하면 완료

### 7-2. Cloudflare Zero Trust에서 터널 생성

1. [https://one.dash.cloudflare.com/](https://one.dash.cloudflare.com/) (Zero Trust 대시보드 — 일반 Cloudflare 대시보드와 **다른 URL**)
2. 좌측 **Networks → Tunnels** → **Create a tunnel**
3. **Cloudflared** 선택 → Next
4. 터널 이름: `j-bridge-nas` (자유) → Save tunnel
5. 다음 화면에 "Install and run a connector" 안내가 나옵니다 → **Docker** 탭 선택
6. 명령어가 표시됩니다:
   ```
   docker run cloudflare/cloudflared:latest tunnel --no-autoupdate run --token eyJ...
   ```
   → **명령어 자체는 실행하지 마세요**. 안에 들어있는 **`eyJ...` 토큰**만 복사합니다.
7. 복사한 토큰을 `.env.production`의 `CLOUDFLARE_TUNNEL_TOKEN`에 붙여넣기 → 저장
8. 일단 그 화면을 그대로 둔 채 7-3으로 이동 (Public Hostname 설정은 7-4에서 이어서 함)

### 7-3. `docker-compose.yml`에 cloudflared 서비스 추가

NAS의 `/volume1/docker/j-bridge/docker-compose.yml`을 열고, **`web` 서비스 옆에 `cloudflared` 서비스를 추가**합니다.

```yaml
services:
  web:
    # ... 기존 설정 ...
    # ports 줄을 아래처럼 수정 (LAN 노출 차단, 터널 경유만 허용)
    ports:
      - "127.0.0.1:3000:3000"
    # (선택) DS223j 1GB 안정성을 위한 메모리 제한
    mem_limit: 600m
    memswap_limit: 1g

  cloudflared:
    image: cloudflare/cloudflared:2026.1.0   # 버전 핀 권장 (:latest 비추천)
    container_name: j-bridge-cloudflared
    restart: unless-stopped
    command: tunnel --no-autoupdate run
    environment:
      - TUNNEL_TOKEN=${CLOUDFLARE_TUNNEL_TOKEN}
    depends_on:
      web:
        condition: service_healthy
    logging:
      driver: json-file
      options:
        max-size: "10m"
        max-file: "3"
```

저장 후 적용:
```bash
docker compose up -d
docker compose logs -f cloudflared
```

로그에 다음과 같은 줄이 보이면 터널이 Cloudflare 엣지에 정상적으로 등록된 것:
```
Registered tunnel connection ... 
Connection registered
```

> 💡 cloudflared 이미지 태그는 [공식 페이지](https://hub.docker.com/r/cloudflare/cloudflared/tags)에서 최신 안정 버전 확인 후 핀하세요. `:latest`는 운영 환경에서 권장하지 않습니다.

### 7-4. Public Hostname 연결

7-2에서 띄워둔 Zero Trust 대시보드 화면으로 돌아갑니다 (또는 Networks → Tunnels → 방금 만든 터널 클릭).

1. 터널 상세 화면에서 **Public Hostname** 탭
2. **Add a public hostname** 클릭
3. 다음과 같이 입력:

| 필드 | 값 |
|---|---|
| Subdomain | `app` (또는 원하는 것) |
| Domain | 7-1에서 준비한 도메인 (드롭다운에서 선택) |
| Path | (비워둠) |
| Service: Type | `HTTP` |
| **Service: URL** | **`web:3000`** ← ⚠️ 중요. `localhost:3000`, `127.0.0.1:3000` 절대 아님. |

→ Service URL은 **Docker Compose 서비스명**을 써야 합니다. 같은 compose 안의 `web` 서비스가 Docker 내부 DNS로 해석돼서 cloudflared 컨테이너가 접근합니다.

4. **Save hostname** → DNS 레코드는 자동 생성됨

### 7-5. SSL/TLS 모드 확인

1. Cloudflare 일반 대시보드(`dash.cloudflare.com`) → 해당 도메인 선택
2. 좌측 **SSL/TLS → Overview**
3. **Full (strict)** 로 설정

> 왜 Full (strict)? — Tunnel을 쓰면 traffic이 어차피 터널 안에서 암호화되므로 이 설정 자체가 사실상 무의미합니다. 하지만 만일 누가 실수로 비-터널 경로를 통해 들어오려 해도 strict가 차단하므로 **defense-in-depth**로 설정해두는 것이 안전합니다.
> ⚠️ **Flexible로 두지 마세요** — 무한 리다이렉트 발생 가능.

### 7-6. Supabase 측 URL 동기화

새 도메인으로 인증 흐름이 동작하려면 Supabase 대시보드에서:

1. **Authentication → URL Configuration**
   - **Site URL**: `https://app.your-domain.com`
   - **Redirect URLs**에 추가: `https://app.your-domain.com/**`
2. **(OAuth 사용 시) 각 공급자 콘솔에서도 콜백 URL 갱신** — 가장 자주 빠뜨리는 항목.
   - Google: Google Cloud Console → APIs & Services → Credentials → OAuth 2.0 Client → Authorized redirect URIs에 `https://app.your-domain.com/auth/callback` 추가
   - GitHub: GitHub Settings → Developer settings → OAuth Apps → Authorization callback URL 갱신
3. **Email Templates** 확인 — 도메인이 하드코딩돼 있다면(`{{ .SiteURL }}` 변수가 아닌 직접 URL) 갱신. 기본 템플릿은 `.SiteURL`을 쓰므로 자동 반영됩니다.

> J-Bridge는 현재 이메일+비밀번호 로그인만 사용 중이므로 OAuth 콜백은 해당 없음. 향후 OAuth를 도입할 때 이 단계를 잊지 마세요.

### 7-7. 첫 접속 확인

브라우저로 `https://app.your-domain.com` 접속:
- 자물쇠 아이콘 정상 → HTTPS OK (Cloudflare가 자동 발급한 인증서)
- J-Bridge 로그인 화면 표시

```bash
# CLI로도 확인
curl https://app.your-domain.com/api/health
# {"status":"ok","uptime":...,"timestamp":"..."}
```

### 7-8. 컷오버 체크리스트

- [ ] `docker compose ps`에서 `web`, `cloudflared` 모두 `Up (healthy)` 또는 `Up`
- [ ] `docker compose logs cloudflared`에서 `Registered tunnel connection` 확인
- [ ] `curl http://localhost:3000/api/health` (NAS 내부) 성공
- [ ] `curl https://app.your-domain.com/api/health` (외부) 성공
- [ ] 브라우저에서 로그인 성공 → 대시보드 로딩 확인
- [ ] Supabase Auth → URL Configuration의 Site URL/Redirect URLs 갱신
- [ ] (OAuth 도입 시) 공급자 콘솔의 콜백 URL 갱신
- [ ] (기존 DDNS/포트포워딩이 있었다면) 일정 기간 병행 운영 후 **공유기 포트포워딩 80/443/3000 모두 제거**, DDNS 비활성화

---

## 8장. 운영 체크리스트 & 트러블슈팅

### 8-1. 일상 운영 명령어

| 작업 | 명령어 |
|---|---|
| 상태 확인 | `docker compose ps` |
| 로그 실시간 보기 | `docker compose logs -f web` / `docker compose logs -f cloudflared` |
| 최근 로그 100줄만 | `docker compose logs --tail=100 web` |
| 재시작 | `docker compose restart web` |
| 정지 + 컨테이너 제거 | `docker compose down` |
| 컨테이너 안 쉘 진입 | `docker compose exec web sh` |
| 메모리 사용 확인 | `docker stats --no-stream` |
| 디스크 사용량 정리 | `docker system prune -a` (⚠️ 안 쓰는 이미지 전부 삭제) |

### 8-2. 코드 업데이트 워크플로

DS223j는 NAS에서 빌드를 못 하므로 항상 **PC에서 빌드 → NAS로 전송**입니다.

```powershell
# 1) PC에서 새 이미지 빌드
docker buildx build --platform linux/arm64 `
  --build-arg NEXT_PUBLIC_SUPABASE_URL=... `
  --build-arg NEXT_PUBLIC_SUPABASE_ANON_KEY=... `
  -t j-bridge:latest --load .

# 2) 저장 + 압축
docker save j-bridge:latest | gzip > j-bridge.tar.gz

# 3) NAS로 전송
scp j-bridge.tar.gz your-user@NAS_IP:/volume1/docker/j-bridge/
```

```bash
# 4) NAS에서 로드 + 재기동
cd /volume1/docker/j-bridge
gunzip -c j-bridge.tar.gz | docker load
docker compose up -d
docker compose logs -f web
```

> `compose up -d`는 이미지가 바뀐 컨테이너만 자동으로 교체합니다. cloudflared는 그대로 유지돼서 터널이 끊기지 않아요 (다운타임 거의 0).

### 8-3. 자주 발생하는 문제

#### ❌ 502 Bad Gateway (Cloudflare 경유)
- 원인 1: `web` 컨테이너가 죽음 → `docker compose ps` 확인
- 원인 2 (가장 흔함): 터널 Service URL이 `localhost:3000`/`127.0.0.1:3000`로 잡혀 있음 → **반드시 `web:3000`** (Docker Compose 서비스명)
- 조치: 7-4 단계 다시 확인

#### ❌ Cloudflare Error 1033 (Argo Tunnel error)
- 원인: `cloudflared` 컨테이너 다운 또는 Cloudflare에 연결 못 함
- 확인: `docker compose ps`에서 cloudflared 상태, `docker compose logs cloudflared`
- 조치: `docker compose restart cloudflared`. 그래도 안 되면 토큰 만료/회전 확인

#### ❌ Too many redirects
- 원인: SSL/TLS 모드가 `Flexible`로 잘못 설정됨
- 조치: 7-5 단계로 가서 **Full (strict)** 로 변경

#### ❌ 정적 자산이 옛 버전 (배포했는데 화면 안 바뀜)
- Next.js immutable 파일명(`/_next/static/<hash>/...`)은 자동 무효화되지만, Cloudflare가 캐시해놨을 수 있음
- 조치: Cloudflare 대시보드 → Caching → Configuration → **Purge Everything**

#### ❌ WebSocket 끊김 / RSC 스트리밍 불안정
- 보통 없음. Tunnel 자체는 WebSocket과 HTTP/2 스트리밍 모두 지원
- 조치: `docker compose restart cloudflared`. 그래도 안 되면 cloudflared 이미지 버전 업데이트 검토

#### ❌ 환경변수 누락 (`Environment validation failed`)
- 원인: `src/lib/env.ts`의 Zod 검증 실패 — 컨테이너가 부팅 즉시 죽음
- 조치: `.env.production`의 필수 변수 (`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`) 확인. PUBLIC 변수는 빌드 시점에 박혀야 한다는 점 주의.

#### ❌ Supabase Auth 콜백 실패
- 원인: Supabase URL Configuration 또는 OAuth 공급자 콘솔에 새 도메인 미등록
- 조치: 7-6 단계 다시 수행

#### ❌ TTS 401 Unauthorized
- 원인: Google API 키 IP 제한이 NAS의 공인 IP를 막고 있음
- 조치: Google Cloud Console → API 자격 증명 → IP 제한에 NAS 공인 IP 추가 (또는 IP 제한 자체를 해제하고 API 제한으로만 가둠)

#### ❌ 빌드 OOM (`Killed`) — NAS에서 실수로 빌드 시도한 경우
- 원인: DS223j 1GB에서는 `next build`가 100% OOM
- 조치: **NAS에서 절대 빌드하지 마세요**. PC에서 빌드 → 전송 (Method A)

#### ❌ 컨테이너가 swap을 너무 많이 쓰고 느림
- 확인: `docker stats --no-stream` + `free -m`
- 조치: `NODE_OPTIONS=--max-old-space-size=384` 적용 확인, DSM 불필요 서비스 정지 (4-5 단계), 메모리 점유가 큰 동영상/사진 인덱싱 끄기

### 8-4. 정기 점검 권장 항목 (월 1회)

- [ ] DSM 보안 업데이트 (제어판 → 업데이트 및 복원)
- [ ] cloudflared 이미지 버전 확인 (분기 1회는 갱신) — `docker pull cloudflare/cloudflared:신버전` 후 compose의 태그 수정 → `docker compose up -d`
- [ ] Cloudflare Tunnel 토큰 회전 (반기 1회) — Zero Trust 대시보드에서 터널 → ... → Refresh token
- [ ] 디스크 사용량 (`df -h /volume1`)
- [ ] Docker 이미지 정리 (`docker image prune -a`)
- [ ] swap 사용 추세 (`free -m`로 swap이 항상 가득 차면 RAM 부족 — DSM 패키지 추가 정리 필요)
- [ ] 백업 — `.env.production` 보존 (부록 B)
- [ ] Supabase 무료 플랜 사용량 확인 (DB 용량, 월간 활성 사용자, Storage 용량)

---

## 부록 A. GitHub Actions 자동 배포 (다음 단계)

수동 `docker buildx → save → scp → load`가 익숙해진 후 도전하세요.

**핵심 아이디어**: GitHub Actions에서 ARM64 이미지 빌드 → GHCR에 push → NAS는 cron으로 주기적 pull (또는 webhook).

`.github/workflows/docker-publish.yml` 예시:

```yaml
name: Build and Push Docker Image (ARM64)
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
      - uses: docker/setup-qemu-action@v3
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
          platforms: linux/arm64
          tags: ghcr.io/${{ github.repository_owner }}/j-bridge:latest
          build-args: |
            NEXT_PUBLIC_SUPABASE_URL=${{ secrets.NEXT_PUBLIC_SUPABASE_URL }}
            NEXT_PUBLIC_SUPABASE_ANON_KEY=${{ secrets.NEXT_PUBLIC_SUPABASE_ANON_KEY }}
```

NAS 측은 `docker-compose.yml`의 `build:` 블록을 `image: ghcr.io/...:latest`로 바꾸고:
```bash
docker login ghcr.io   # GHCR private 패키지일 경우 1회
docker compose pull && docker compose up -d
```

---

## 부록 B. 백업 / 마이그레이션

DS223j의 NAS 측에 보존해야 할 상태는 사실상 **`.env.production` 하나**입니다.
(코드는 git, 이미지는 PC/GHCR에서 재생성 가능, TTS 캐시는 Supabase Storage)

### 백업

```bash
cd /volume1/docker
tar czf j-bridge-backup-$(date +%Y%m%d).tar.gz \
  j-bridge/.env.production \
  j-bridge/docker-compose.yml
```

이 파일을 별도 저장소(외장 USB / 다른 NAS / 암호화된 클라우드)에 보관.
**Cloudflare Tunnel 설정 자체는 Cloudflare 측에 보존**되므로 NAS 백업에 포함시킬 필요 없음.

### 다른 NAS로 이전

```bash
# 새 NAS에서:
cd /volume1/docker/j-bridge
tar xzf j-bridge-backup-20260524.tar.gz --strip-components=1
# 이미지를 새 NAS로 전송 (PC에서 build → save → scp)
gunzip -c j-bridge.tar.gz | docker load
docker compose up -d
```

> 새 NAS에서 cloudflared가 같은 토큰으로 다시 연결되면 기존 도메인이 그대로 동작합니다. DNS 변경 불필요.

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
      - "127.0.0.1:3001:3001"
    volumes:
      - ./data:/app/data
```

DS223j 메모리 여유가 빠듯하면 같은 NAS 대신 **다른 머신(VPS, 회사 사내 서버)에서** Uptime Kuma를 띄우는 것을 권장합니다. NAS 본체가 죽으면 같이 죽기 때문에 모니터로서 의미가 적어요.

모니터링 대상: `https://app.your-domain.com/api/health`

---

## 부록 D. 성능 & 배포 워크플로 FAQ

### D-1. NAS에서 돌리면 DB 속도가 느려지나?

**짧은 답**: 약간 느려질 수 있음. Supabase region이 한국/일본이면 견딜만한 수준, US/EU면 명백히 느려짐.

#### 왜 느려지나

```
[ 클라우드 환경 (Vercel 등) ]
앱 ─── 같은 지역 데이터센터 내부 ──→ Supabase
       RTT ~1-5ms, 매 쿼리

[ NAS 환경 (현재 구성) ]
NAS ── 사무실 회선 → ISP → 인터넷 → Supabase
       RTT 30~250ms, 매 쿼리
```

J-Bridge는 한 페이지에 DB 쿼리를 5~10개씩 부르는 페이지가 많아서(예: 대시보드, 시험 화면), 한 번의 round-trip 지연이 누적됩니다.

#### Supabase region별 한국 NAS 기준 예상 RTT

| Supabase region | RTT | 체감 |
|---|---|---|
| `ap-northeast-2` (Seoul) | 5~15ms | 거의 모름 |
| `ap-northeast-1` (Tokyo) | 30~50ms | 약간 느림 |
| `ap-southeast-1` (Singapore) | 80~120ms | 체감 가능 |
| `us-east-1` (Virginia) | 200~250ms | 명백히 느림 |
| `eu-west-1` (Ireland) | 250~300ms | 명백히 느림 |

#### Supabase region 확인 방법

1. https://supabase.com/dashboard 로그인 → 프로젝트 선택
2. 좌측 **Project Settings (톱니바퀴) → General**
3. **Region** 항목 확인 (예: `Northeast Asia (Seoul) — ap-northeast-2`)

#### 페이지 1개 로딩 시나리오 (대시보드처럼 쿼리 10개 사용)

| 환경 | 쿼리 합산 | 렌더 | 합계 |
|---|---|---|---|
| 클라우드 (Vercel + Seoul Supabase) | ~50ms (병렬) | ~30ms | **~80ms** |
| NAS + Seoul Supabase | ~20ms (병렬) | ~100ms | **~120ms** |
| NAS + Tokyo Supabase | ~60ms (병렬) | ~100ms | **~160ms** |
| NAS + US Supabase | ~250ms+ | ~100ms | **~350ms+** |

사용자가 느림을 명백히 인지하는 임계는 보통 **300ms부터**. 한국/일본 region이면 견딜 만하지만, 미주/유럽이면 운영 전에 region 마이그레이션을 고려해야 합니다.

#### NAS가 클라우드보다 자체적으로 느린 이유 (DB 지연과 별개)

- **DS223j CPU**: 1.7GHz ARM 4코어. Vercel 서버보다 SSR 자체가 2~5배 느림
- **RAM 1GB**: GC가 자주 발생, 큰 페이지에서 swap 사용 가능성
- **사무실 회선 업로드**: 가정용 광랜은 보통 100~500Mbps 업로드. 다중 동시 접속 시 응답 전송 자체가 병목 가능

#### 완화 방법

코드에 **이미 적용된 것들**:
- 쿼리 병렬화 (`Promise.all`)
- DB 인덱스 (Phase 3에서 추가)
- React Query 클라이언트 캐시
- Cloudflare 정적 자산 엣지 캐싱 (`/_next/static/*` 자동)

확인이 필요한 것:
- **Supabase region을 한국/일본으로** (위 절차로 확인)
- 다르면 새 Supabase 프로젝트 생성 → pg_dump로 데이터 이전 → 환경변수 갱신 → 재빌드

> 💡 region 마이그레이션은 한 번 결단해야 하는 작업이라 운영 데이터가 쌓이기 전에 결정하는 게 좋습니다.

#### 결론

| Supabase region | 권장 사항 |
|---|---|
| Seoul / Tokyo | 그대로 운영 — 거의 문제 없음 |
| Singapore | 그대로 운영 가능, 느낌은 있음 |
| US / EU | **운영 전 region 마이그레이션 권장** |

---

### D-2. 코드 수정 후 배포는 어떻게?

**짧은 답**: PC에서 빌드 → 이미지를 NAS로 전송 → `docker compose up -d`. git push는 배포에 필수가 아님.

#### 전체 절차 (8단계)

```
[PC에서]
1. 코드 수정
2. (선택) git push                    ← 배포 트리거가 아니라 코드 백업/협업용
3. docker buildx build --platform linux/arm64 ... -t j-bridge:latest --load .
4. docker save j-bridge:latest | gzip > j-bridge.tar.gz
5. scp j-bridge.tar.gz nas:/volume1/docker/j-bridge/

[NAS에서 SSH로]
6. gunzip -c j-bridge.tar.gz | docker load
7. docker compose up -d
8. docker compose logs -f web         ← 정상 기동 확인
```

#### "Container Manager에서 이미지 갈아 끼우기"는 굳이 안 해도 됨

GUI에서 컨테이너 정지 → 이미지 교체 → 재시작을 클릭으로도 할 수 있지만, **7번의 `docker compose up -d` 한 줄이 이걸 자동으로** 처리합니다:

- 새 이미지가 로드된 걸 감지
- 기존 컨테이너 정지
- 새 이미지로 컨테이너 재생성
- 기동
- cloudflared 같은 다른 서비스는 그대로 유지 (다운타임 거의 0)

CLI 방식이 재현 가능하고 실수가 적어서 권장됩니다.

#### 컨테이너가 안 갈아끼워질 때

같은 태그(`j-bridge:latest`)로 덮어썼는데 compose가 "이미지 같음"이라고 판단해서 컨테이너를 안 갈아끼울 때가 있어요. 두 가지 방법:

**방법 1**: 강제 재생성
```bash
docker compose up -d --force-recreate web
```

**방법 2**: 빌드마다 날짜 태그 사용 (더 깔끔)
```powershell
docker buildx build --platform linux/arm64 ... -t j-bridge:2026-05-24 --load .
```
그리고 `docker-compose.yml`의 `image:` 줄을 그 태그로 갱신.

#### git push와의 관계

| 시나리오 | git push 필요? |
|---|---|
| 혼자 작업, 백업 불필요 | ❌ 불필요 — 로컬 빌드만 하면 NAS에 반영됨 |
| 팀 협업 / 코드 백업 | ⭕ 필요 (배포와 별개로 항상 권장) |
| GitHub Actions 자동 배포 도입 시 (부록 A) | ⭕ **트리거** — push가 곧 배포 |

→ **현재 구성에서 git push는 배포 트리거가 아닌 코드 관리 도구**입니다.
→ 푸시를 잊어도 NAS 배포는 됩니다 (반대로 푸시만 하고 빌드 안 하면 NAS는 옛 코드 그대로).

#### 자동화 단계 (GitHub Actions, 부록 A 참고)

매번 5~15분짜리 빌드+전송이 번거로워지면 부록 A의 워크플로 도입:

```
코드 수정 → git push → GitHub Actions ARM64 빌드 → GHCR push
                                                       ↓
NAS에서 cron 또는 webhook → docker compose pull && up -d  (자동)
```

이 단계로 가면 **git push = 배포**가 됩니다. 다만 처음에는 수동 사이클로 익숙해진 다음 도입하는 것을 권장.

#### 잘 잊어버리는 함정

- ❌ **NAS에서 직접 `docker compose build`** — 1GB RAM에선 100% OOM. PC에서만 빌드.
- ❌ **PUBLIC 변수만 바꾸고 환경변수 파일만 수정** — `NEXT_PUBLIC_*`는 빌드 시점에 박힘. **이미지 재빌드 필요**.
- ❌ **git push 후 NAS에서 git pull만 하고 끝** — NAS에는 빌드 환경이 없음. 이미지 전송이 필수.

---

## 부록 E. 실배포 진행 기록 (2026-05-24~25, 1차 시도)

> 가이드 따라 실제로 배포해 본 첫 시도의 진행 기록. 어디까지 됐고 어디서 막혔는지, 어떤 우회로를 썼는지, 다음에 무엇을 해야 하는지 정리.

### E-1. 진행 환경

| 항목 | 값 |
|---|---|
| NAS 모델 | DS223j (ARM64, RAM 1GB) |
| DSM 버전 | 7.2.2-72806 Update 8 |
| 사내 IP | 192.168.1.10 (정적) |
| DDNS | weavusIT.synology.me |
| 작업자 위치 | 집 (사내 LAN 외부) |
| NAS 접속 수단 | DSM 웹 (QuickConnect 경유) |
| SSH 접근 | ❌ 불가 (포트포워딩 안 함 + Tailscale 설치 중단) |
| 도메인 | weavus.dpdns.org / weavus2026.dpdns.org (무료 DDNS, Cloudflare 등록 완료) |
| 운영 비교 | J-Bridge는 Vercel 에 이미 정상 배포·운영 중. NAS는 학습/사내 인프라 용 추가 배포 |

### E-2. 완료한 단계 ✅

- [x] **DSM 설치 및 Container Manager 패키지 설치**
- [x] **DSM에서 SSH 서비스 활성화** (실제로는 외부 접근 불가 — 사내 LAN 안에서만 의미)
- [x] **NAS에 폴더 생성** — `/volume1/docker/j-bridge/` (File Station GUI 사용)
- [x] **`.env.production` 작성 및 업로드**
  - Supabase URL/anon/service_role 키
  - TUNNEL_TOKEN
  - NODE_ENV / NODE_OPTIONS
  - **LF 줄바꿈으로 저장** (Notepad CRLF 문제 우회)
- [x] **PC에서 ARM64 Docker 이미지 빌드** — `docker buildx build --platform linux/arm64`
  - `tonistiigi/binfmt` + `docker buildx create multiarch` 사전 작업 1회
  - 빌드 시간 약 10분
  - 이미지 크기 92.8MB (예상보다 작음)
- [x] **이미지 파일 전송** — `docker save -o j-bridge.tar` (89MB) → File Station 업로드
- [x] **NAS 전용 `docker-compose.nas.yml` 작성** — build 블록 제거, audio-cache 볼륨 제거
- [x] **Container Manager에서 이미지 로드 + 프로젝트 생성**
- [x] **Cloudflare 도메인 추가** — Active 상태 확인
- [x] **Cloudflare Tunnel 생성** + 토큰 발급
- [x] **docker-compose에 cloudflared 사이드카 추가**
- [x] **Public Hostname 연결** — Service URL `web:3000`
- [x] **SSL/TLS 모드** — Full (strict)
- [x] **외부 도메인 → /api/health 200 OK** 확인
- [x] **로그인 화면까지 도달**

### E-3. 막혔던 부분과 해결책 (학습 포인트)

| 막힌 부분 | 원인 | 해결책 |
|---|---|---|
| **집에서 SSH 안 됨** | NAS 사설 IP는 사내 LAN 안에서만 접근 가능. SSH 포트포워딩은 보안상 비권장 | DSM 웹(QuickConnect) GUI만으로 진행. Tailscale은 QuickConnect로 실행 불가했음 |
| **PowerShell에 gzip 없음** | gzip은 PowerShell 기본 내장 아님 | `docker save -o j-bridge.tar` 로 압축 안 하고 그대로 저장. 파일 크기 89MB라 업로드 큰 부담 없었음 |
| **cloudflared가 계속 restart 루프** | compose의 `${CLOUDFLARE_TUNNEL_TOKEN}` 변수가 `.env.production`에서 안 읽힘 — compose는 `.env` 만 자동 로드 | 변수명을 `TUNNEL_TOKEN` 으로 변경 + cloudflared 서비스에 `env_file: .env.production` 추가. compose 치환 대신 컨테이너 환경 주입 방식 |
| **`.env.production`이 CRLF 줄바꿈** | Windows 메모장이 CRLF로 저장 → 토큰 끝에 `\r` 붙음 → cloudflared 인증 실패 | LF 줄바꿈으로 새로 생성. VS Code 또는 외부에서 작성 후 검증 (29줄 LF only 확인) |
| **Container Manager 로그 UI 빈 화면** | 원인 미상. 컨테이너는 정상 동작 중 (/api/health 200) 인데 로그 탭은 "사용 가능한 로그 없음" | 미해결. 로그 파일 직접 다운로드 시도했으나 `@docker` 폴더 위치 못 찾음 |
| **로그인 후 server-side exception** | 미해결. Digest `34288151` | 미해결 — E-4 참고 |

### E-4. 미해결 / 다음 액션 ❌

#### (1) 로그인 후 서버 사이드 예외 (`Digest: 34288151`)

- **증상**: 로그인 자체는 성공(브라우저가 직접 Supabase Auth 호출). 그 다음 대시보드 SSR에서 "Application error: a server-side exception has occurred" 표시.
- **분석 중**: Supabase API Gateway 로그를 보니 들어오는 요청들이 모두 **Vercel Edge / Vercel Serverless (Amazon US/SG IP)** 에서 온 것. NAS(한국 ISP IP)에서 온 요청이 보이지 않음.
- **가설**: NAS → Supabase 아웃바운드가 막혀있거나, NAS 요청이 다른 경로로 가서 Vercel처럼 보이거나, 또는 NAS 요청 자체가 만들어지지 않음.
- **다음 조치 후보**:
  1. **사내 공인 IP 확보** — 회사 가서 NAS 또는 사내 PC에서 `curl https://ifconfig.me` 로 확인. Supabase Logs에서 그 IP로 필터해 NAS 요청 식별
  2. **Supabase Logs Explorer에서 Amazon 제외 SQL 필터** 로 한국 ISP 요청 찾기
  3. **Vercel 배포 일시 중지** 후 트래픽 분리 (단, 운영 영향 있어 신중)
  4. **회사 가서 SSH로 컨테이너 안에서 직접 `wget https://wxhyczlwdmeelcshqgci.supabase.co/rest/v1/` 시도** — 가장 확실한 진단

#### (2) Container Manager 로그 UI 빈 화면 문제

- 원인 미상. Container Manager 자체의 UI 버그 가능성, 로그 드라이버 관련 가능성.
- 다음 시도: docker-compose의 `logging:` 블록 제거 후 재기동 → Container Manager 기본 드라이버 사용 → UI에서 보이는지 확인.

#### (3) Tailscale 미설치 → 집에서 SSH 못 함

- QuickConnect 경유로 패키지 센터에서 Tailscale을 실행하려 했으나 차단됨 (DSM 보안 정책).
- **회사에 직접 가서**: DSM 데스크톱 화면 → 패키지 센터 또는 수동 .spk 설치 (https://pkgs.tailscale.com/stable/#synology, ARMv8/DSM 7)
- 설치 후엔 집에서도 `ssh user@100.x.y.z` 로 NAS 접근 가능 → 로그 직접 확인 / 컨테이너 셸 진입 / swap 조정 등 가능

#### (4) (선택) DS223j 메모리 절약 셋업 미완

- 가이드 4-5의 swap 2GB 추가, DSM 패키지 정리 등 미실시
- SSH가 없으면 swap 설정 불가. Tailscale 설치 후 회사 안 가도 되도록 만든 다음 진행

### E-5. 알게 된 운영 환경 사실

- **J-Bridge는 이미 Vercel에 정상 배포·운영 중**. Supabase Gateway 로그에 Vercel Edge Functions (싱가포르) + Vercel Serverless (Virginia, US) 양쪽에서 트래픽이 들어오고 있음.
- 즉 **NAS 배포는 운영용이 아니라 사내 인프라 학습 / 백업 환경 / 정책 대비** 용도로 자리매김 가능.
- 상사와 의사결정 시 참고: "운영은 Vercel에서 잘 돌고 있다 → NAS 배포는 학습/실험 / 사내 인프라 정책 학습 목적"으로 정리 가능.

### E-6. 다음 세션 시작 시 체크리스트

회사에서 또는 Tailscale 설치 후 이어서 할 일:

- [ ] 회사 LAN에서 NAS SSH 접속 확인 (또는 Tailscale 설치 → 집에서 SSH 가능하게)
- [ ] cloudflared 로그 확인 — 실제 메시지 (`Registered tunnel connection` 등)
- [ ] j-bridge-web 로그 확인 — server-side exception의 진짜 stack trace
- [ ] 컨테이너 안에서 `wget https://wxhyczlwdmeelcshqgci.supabase.co/rest/v1/` 직접 호출해 NAS → Supabase 통신 가능 여부 확정
- [ ] (필요시) DNS 설정 / 방화벽 / Docker 네트워크 조정
- [ ] 해결되면 컷오버 체크리스트 (7-8) 완수
- [ ] swap 2GB 추가 + DSM 패키지 정리 (4-5)
- [ ] 백업 절차 한 번 시연 (부록 B)

---

### E-7. DS223j로 운영 서버를 돌리면? — 성능 평가 / 이점 / 권장

오늘 실배포를 진행하면서 확인된 사실들을 토대로, **DS223j (현재 모델)로 J-Bridge 운영 서버 (Next.js + DB)를 돌리는 것이 적절한가**에 대한 정리.

#### (1) 성능 불이익 — 큰 그림

| 항목 | DS223j 한계 | 운영 영향 |
|---|---|---|
| **RAM 1GB 고정** (납땜, 증설 불가) | DSM ~400MB + Next.js ~150~400MB + cloudflared ~30~50MB + Docker 데몬 ~80MB | 평상시 800MB+ 점유, 피크에 swap 의존. 다중 사용자/큰 요청 시 응답 지연 |
| **셀프호스팅 Supabase 불가** | postgres+auth+storage+postgrest+kong+studio+realtime+meta = 8개 컨테이너, 최소 2GB | DB는 무조건 외부 클라우드 의존 → 데이터 주권 깨짐 |
| **NAS에서 직접 빌드 불가** | `next build` 피크 1.5~2GB RAM 필요 | 매 코드 수정마다 PC에서 cross-build → tar 전송 → load 라는 8단계 사이클. 자동화 안 하면 매번 10~20분 |
| **ARM 1.7GHz 4코어** | Realtek RTD1619B (저전력 SoC) | SSR 자체가 Vercel 대비 2~5배 느림. 한 페이지 100~300ms 추가 |
| **HDD 기반 (NVMe 캐시 없음)** | DB I/O가 디스크 의존 | 셀프호스팅 DB 했더라도 응답 지연 |
| **사무실 회선 의존** | 가정용/소규모 사무실 광랜은 업로드 100~500Mbps. 정전·인터넷 끊김 시 즉시 중단 | 다중 동시 접속 시 응답 전송 자체가 병목 |
| **DB → 앱 거리** | NAS(한국 사무실) → Supabase Cloud (Seoul ~5ms / Tokyo ~30~50ms / US ~200ms+) | Vercel 같은 동일 리전 호스팅 대비 매 쿼리 RTT 누적. 페이지당 5~10ms~수백ms 추가 |

#### (2) 이점 (한정적)

| 이점 | 실제 가치 |
|---|---|
| **이미 보유한 하드웨어 = 추가 비용 0원** | 사무실에 이미 있다면 추가 투자 없음 |
| **사내 인프라 학습 자산** | Docker / Cloudflare / Linux 운영 노하우가 사내에 쌓임. 인계 시 가치 있음 |
| **재해 대비 백업 환경 (이론적)** | 운영(Vercel) 다운 시 비상용으로 NAS 환경 가동 가능 — 단, DB는 그대로 Supabase Cloud 의존이라 부분 이점에 그침 |
| **데이터 주권 — 단, 한계 있음** | 앱 코드는 사내에 두지만 **DB는 외부(Supabase Cloud) 그대로** → 진짜 데이터 주권은 미달성 |

→ **이점은 대부분 "학습" + "있던 하드웨어 활용"** 에 머무름. 운영 본격 사용에는 부족.

#### (3) 시나리오별 권장

| 시나리오 | 추천 환경 | 이유 |
|---|---|---|
| 🥇 **현 운영 그대로 (실제 사용자에게 서비스)** | **Vercel + Supabase Cloud** (이미 동작 중) | Next.js 만든 회사가 호스팅. 글로벌 엣지. `git push` = 배포. 무료 시작 가능. 오늘 진행한 NAS 배포와 무관하게 이미 동작 중. |
| 🥈 **사내 인프라 학습 / 실험 / 인계 자산** | **DS223j + Cloudflare Tunnel** (오늘 진행한 것) | 운영 트래픽 받지 않고 학습용. 같은 코드를 NAS에서도 띄울 수 있음을 보여주는 것 자체가 자산. |
| 🥉 **DB까지 사내에 두고 싶음 (진짜 데이터 주권)** | **NAS 업그레이드 (DS224+ 6GB)** 또는 **Oracle Cloud Free (24GB)** | 셀프호스팅 Supabase 가능. 단, 백업/업데이트/장애 대응 책임 본인. |
| 🚫 **운영 + DS223j** | **권장 안 함** | RAM 1GB + 사무실 회선 의존 + 셀프호스팅 불가 + 빌드 불가. 운영 SLA 의미 없음. |

#### (4) 권장 — 결론

**현재 가장 합리적인 그림**:

```
운영 (실사용)      →  Vercel + Supabase Cloud  (이미 동작 중. 손대지 말 것)
사내 인프라 학습   →  DS223j + Cloudflare Tunnel  (오늘 진행. 학습용으로 완성)
미래 셀프호스팅    →  필요해지면 DS224+ 또는 Oracle Cloud 로 이동
```

**상사/이해관계자에게 설명할 때 한 줄**:
> "운영은 Vercel + Supabase Cloud 그대로 두고, NAS는 사내 인프라 학습/백업 환경으로 분리하는 게 가장 합리적입니다. DS223j 1GB로는 DB까지 사내로 가져올 수 없고, 운영 SLA를 받을 만한 사양이 안 됩니다. 데이터 주권이 필수 조건이라면 NAS는 DS224+ 이상으로 업그레이드(약 $330)하거나 사내 별도 서버를 검토해야 합니다."

#### (5) 의사결정 트리

```
J-Bridge 운영 서버를 어디서 돌릴까?
│
├─ 운영 사용자에게 서비스 제공이 목적?
│   ├─ 예 → Vercel + Supabase Cloud  (현재 그대로)
│   └─ 아니오(학습/사내용) ↓
│
├─ DB도 사내에 두어야 하나?
│   ├─ 아니오 → DS223j + Cloudflare Tunnel  (오늘 진행한 형태)
│   ├─ 예 ↓
│
└─ 예산 / 정책?
    ├─ 외부 클라우드 OK + 무료 선호 → Oracle Cloud Free (ARM 24GB)
    ├─ 사내 하드웨어 고집 → DS224+ 6GB 업그레이드 (~$330)
    └─ 둘 다 안 됨 → 운영 요건을 재검토 (현 사양으로 불가능)
```

#### (6) 메모

오늘 진행한 NAS 배포는 **🥈 사내 인프라 학습** 시나리오에 정확히 해당. 부록 E-4의 미해결 항목(server-side exception)을 해결하면 **NAS에서도 동일한 코드가 떠 있는 환경**이 완성됨. 그 자체가 학습 산출물.

운영을 NAS로 옮길 필요는 **없음** (그리고 권장하지 않음). 운영은 Vercel을 유지.

---

## 마치며

이 문서는 **첫 배포까지의 가이드**입니다. 운영하면서 발생하는 새 시나리오(예: 다중 환경, 블루/그린 배포, 모니터링 강화)는 별도 문서로 추가하는 것을 권장합니다.

질문이나 막힌 부분이 생기면:
- 로그를 먼저: `docker compose logs --tail=100 web` / `docker compose logs --tail=100 cloudflared`
- 환경변수 검증 실패 메시지는 그 자체로 어떤 변수가 빠졌는지 알려줍니다 (`src/lib/env.ts`)
- Cloudflare Tunnel 관련은 Zero Trust 대시보드 → Networks → Tunnels → 해당 터널 → Connectors 탭에서 연결 상태 확인
- 그래도 모르겠다면 로그 전문과 함께 팀에 공유
