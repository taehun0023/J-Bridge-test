# =============================================================================
# J-Bridge — Next.js 16 Production Dockerfile (standalone build)
# =============================================================================
# 사용법:
#   docker compose build
#   docker compose up -d
#
# 이미지 구조:
#   deps     : 의존성만 설치 (캐시 최적화)
#   builder  : next build → .next/standalone 생성
#   runner   : 최소 런타임만 포함 (Node + standalone 출력)
# =============================================================================

# ---------- Stage 1: 의존성 설치 ----------
FROM node:20-alpine AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

# package.json + lock 만 먼저 복사 → 의존성 변경 없을 때 Docker 레이어 캐시 활용
COPY package.json package-lock.json* ./
RUN npm ci


# ---------- Stage 2: 빌드 ----------
FROM node:20-alpine AS builder
RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Supabase URL/anon key는 빌드 시점에 NEXT_PUBLIC_* 으로 클라이언트 번들에 inline 된다.
# docker-compose.yml 의 build.args 로 전달.
ARG NEXT_PUBLIC_SUPABASE_URL
ARG NEXT_PUBLIC_SUPABASE_ANON_KEY
ENV NEXT_PUBLIC_SUPABASE_URL=$NEXT_PUBLIC_SUPABASE_URL
ENV NEXT_PUBLIC_SUPABASE_ANON_KEY=$NEXT_PUBLIC_SUPABASE_ANON_KEY

ENV NEXT_TELEMETRY_DISABLED=1
RUN npm run build


# ---------- Stage 3: 실행 ----------
FROM node:20-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

# 보안: root 가 아닌 전용 사용자로 실행
RUN addgroup --system --gid 1001 nodejs \
 && adduser  --system --uid 1001 nextjs

# next/image 최적화에 필요한 네이티브 모듈
RUN apk add --no-cache libc6-compat \
 && npm install --omit=dev --no-save sharp \
 && chown -R nextjs:nodejs /app

# Next.js standalone 출력만 복사 (이미지 크기 최소화)
COPY --from=builder --chown=nextjs:nodejs /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs
EXPOSE 3000

# /api/health 헬스체크 (컨테이너 헬스 상태에 반영)
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
  CMD wget -qO- http://127.0.0.1:3000/api/health || exit 1

# standalone 빌드는 server.js 진입점을 자동 생성한다
CMD ["node", "server.js"]
