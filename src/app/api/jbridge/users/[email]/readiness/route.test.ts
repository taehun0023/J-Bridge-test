/**
 * BFF 契約テスト (B-1): GET /api/jbridge/users/{email}/readiness
 *
 * weavusys-backend JBridgeClient が叩く service-to-service エンドポイントの契約を
 * 動的に検証する。実 Supabase / 実シークレットなしで動くよう、env と
 * service-role client をモックする。
 *
 * 検証シナリオ:
 *   (a) Authorization ヘッダなし / 不正キー  → 401
 *   (b) 正しいキー + 存在しない email        → 404 (User not found)
 *   (c) 正しいキー + email 有 + score 無      → 404 (No readiness score found)
 *   (d) 正しいキー + 正常データ              → 200 + B-1 契約 9 フィールド
 */
import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest } from 'next/server'

// vi.mock はファイル先頭へ巻き上げられるため、ファクトリ内ではローカル変数を参照せず
// リテラルを直接埋め込む。テスト本体では下の定数 TEST_API_KEY を使う。
const TEST_API_KEY = 'test-weavusys-key'

// --- env をモック (import 時 Zod 検証の throw を回避 + 既知キーを注入) ---
vi.mock('@/lib/env', () => ({
  env: {
    WEAVUSYS_API_KEY: 'test-weavusys-key',
    SUPABASE_SERVICE_ROLE_KEY: 'svc',
    NEXT_PUBLIC_SUPABASE_URL: 'http://localhost',
    NEXT_PUBLIC_SUPABASE_ANON_KEY: 'anon',
  },
}))

// --- assessment-config: getJlptLevel のみ実ロジックに準拠して固定 ---
vi.mock('@/lib/assessment-config', () => ({
  getJlptLevel: (score: number) => {
    if (score >= 90) return 'N1'
    if (score >= 80) return 'N2'
    if (score >= 70) return 'N3'
    if (score >= 50) return 'N4'
    return 'N5'
  },
}))

// --- service-role client モックの差し替え可能なハンドル ---
let mockClient: unknown = null
vi.mock('@/lib/supabase/server', () => ({
  createServiceRoleClient: () => mockClient,
}))

import { GET } from './route'

/**
 * Supabase クエリビルダーのチェーンを最小限モックする。
 * profiles → { data: profileResult }, dispatch_readiness_scores → { data: scoreResult }
 */
function buildClient(profileResult: unknown, scoreResult: unknown) {
  const makeChain = (finalData: unknown) => {
    const chain: Record<string, unknown> = {}
    const passthrough = () => chain
    chain.select = passthrough
    chain.eq = passthrough
    chain.order = passthrough
    chain.limit = passthrough
    chain.single = () => Promise.resolve({ data: finalData, error: null })
    return chain
  }
  return {
    from: (table: string) => {
      if (table === 'profiles') return makeChain(profileResult)
      if (table === 'dispatch_readiness_scores') return makeChain(scoreResult)
      throw new Error('unexpected table: ' + table)
    },
  }
}

function makeRequest(authHeader?: string) {
  const headers = new Headers()
  if (authHeader) headers.set('Authorization', authHeader)
  return new NextRequest('http://localhost/api/jbridge/users/x/readiness', { headers })
}

const params = (email: string) => Promise.resolve({ email })

describe('BFF 契約: GET /api/jbridge/users/{email}/readiness', () => {
  beforeEach(() => {
    mockClient = null
  })

  it('(a) Authorization ヘッダなし → 401', async () => {
    mockClient = buildClient(null, null)
    const res = await GET(makeRequest(), { params: params('user@example.com') })
    expect(res.status).toBe(401)
    expect(await res.json()).toEqual({ error: 'Unauthorized' })
  })

  it('(a) 不正なキー → 401', async () => {
    mockClient = buildClient(null, null)
    const res = await GET(makeRequest('Bearer wrong-key'), { params: params('user@example.com') })
    expect(res.status).toBe(401)
  })

  it('(b) 正しいキー + 存在しない email → 404 (User not found)', async () => {
    mockClient = buildClient(null, null) // profile が null
    const res = await GET(makeRequest(`Bearer ${TEST_API_KEY}`), {
      params: params('missing@example.com'),
    })
    expect(res.status).toBe(404)
    expect(await res.json()).toEqual({ error: 'User not found' })
  })

  it('(c) 正しいキー + score 無 → 404 (No readiness score found)', async () => {
    mockClient = buildClient({ id: 'profile-1' }, null) // profile 有, score null
    const res = await GET(makeRequest(`Bearer ${TEST_API_KEY}`), {
      params: params('user@example.com'),
    })
    expect(res.status).toBe(404)
    expect(await res.json()).toEqual({ error: 'No readiness score found' })
  })

  it('(d) 正常データ → 200 + B-1 契約 9 フィールド', async () => {
    const score = {
      jlpt_score: 85,
      it_japanese_score: 70,
      core_programming_score: 60,
      framework_score: 55,
      attitude_culture_score: 80,
      overall_score: 72,
      is_japanese: false,
      recorded_at: '2026-06-01T00:00:00Z',
    }
    mockClient = buildClient({ id: 'profile-1' }, score)

    const res = await GET(makeRequest(`Bearer ${TEST_API_KEY}`), {
      params: params('user@example.com'),
    })
    expect(res.status).toBe(200)
    const body = await res.json()

    // B-1 契約: 厳密に 9 フィールド (backend JBridgeReadinessDto @JsonProperty と一致)
    const EXPECTED_KEYS = [
      'jlpt_score',
      'it_japanese_score',
      'core_programming_score',
      'framework_score',
      'attitude_culture_score',
      'overall_score',
      'is_japanese',
      'jlpt_level',
      'recorded_at',
    ].sort()
    expect(Object.keys(body).sort()).toEqual(EXPECTED_KEYS)

    // 値の検証 (jlpt_score=85 → jlpt_level=N2)
    expect(body.jlpt_score).toBe(85)
    expect(body.jlpt_level).toBe('N2')
    expect(body.is_japanese).toBe(false)
    expect(body.recorded_at).toBe('2026-06-01T00:00:00Z')
  })

  it('(d-2) jlpt_score=60 → jlpt_level=N4 (境界導出の確認)', async () => {
    const score = {
      jlpt_score: 60,
      it_japanese_score: 0,
      core_programming_score: 0,
      framework_score: 0,
      attitude_culture_score: 0,
      overall_score: 0,
      is_japanese: true,
      recorded_at: '2026-06-01T00:00:00Z',
    }
    mockClient = buildClient({ id: 'profile-1' }, score)
    const res = await GET(makeRequest(`Bearer ${TEST_API_KEY}`), {
      params: params('jp@example.com'),
    })
    expect(res.status).toBe(200)
    const body = await res.json()
    expect(body.jlpt_level).toBe('N4')
    expect(body.is_japanese).toBe(true)
  })
})
