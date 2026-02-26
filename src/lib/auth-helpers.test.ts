import { describe, it, expect, vi, beforeEach } from 'vitest'
import { ERR } from './action-types'

// Mock Supabase client
const mockGetUser = vi.fn()
const mockSelect = vi.fn()
const mockEq = vi.fn()
const mockSingle = vi.fn()

const mockSupabase = {
  auth: { getUser: mockGetUser },
  from: vi.fn(() => ({
    select: mockSelect,
  })),
}

vi.mock('@/lib/supabase/server', () => ({
  createClient: vi.fn(async () => mockSupabase),
  createServiceRoleClient: vi.fn(() => null),
}))

// Helper to configure mock chain
function setupMocks(user: { id: string } | null, profile: { role: string; mentor_specialty: string | null } | null) {
  mockGetUser.mockResolvedValue({
    data: { user },
  })
  mockSelect.mockReturnValue({ eq: mockEq })
  mockEq.mockReturnValue({ single: mockSingle })
  mockSingle.mockResolvedValue({ data: profile })
}

// Import after mocks are set up
let requireAuth: typeof import('./auth-helpers').requireAuth
let requireAdmin: typeof import('./auth-helpers').requireAdmin
let requireAdminOrMentor: typeof import('./auth-helpers').requireAdminOrMentor
let requireAdminOrJpMentor: typeof import('./auth-helpers').requireAdminOrJpMentor
let requireAdminOrTechMentor: typeof import('./auth-helpers').requireAdminOrTechMentor

beforeEach(async () => {
  vi.clearAllMocks()
  // Dynamic import to pick up mocks each time
  const mod = await import('./auth-helpers')
  requireAuth = mod.requireAuth
  requireAdmin = mod.requireAdmin
  requireAdminOrMentor = mod.requireAdminOrMentor
  requireAdminOrJpMentor = mod.requireAdminOrJpMentor
  requireAdminOrTechMentor = mod.requireAdminOrTechMentor
})

describe('requireAuth()', () => {
  it('returns error when not authenticated', async () => {
    setupMocks(null, null)
    const result = await requireAuth()
    expect('error' in result).toBe(true)
    if ('error' in result) {
      expect(result.error).toBe(ERR.AUTH_REQUIRED)
    }
  })

  it('returns supabase and user when authenticated', async () => {
    setupMocks({ id: 'user-1' }, null)
    const result = await requireAuth()
    expect('error' in result).toBe(false)
    if (!('error' in result)) {
      expect(result.user.id).toBe('user-1')
      expect(result.supabase).toBeDefined()
    }
  })
})

describe('requireAdmin()', () => {
  it('returns error when not authenticated', async () => {
    setupMocks(null, null)
    const result = await requireAdmin()
    expect('error' in result).toBe(true)
    if ('error' in result) {
      expect(result.error).toBe(ERR.AUTH_REQUIRED)
    }
  })

  it('returns error when role is mentee', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentee', mentor_specialty: null })
    const result = await requireAdmin()
    expect('error' in result).toBe(true)
    if ('error' in result) {
      expect(result.error).toBe(ERR.FORBIDDEN)
    }
  })

  it('returns error when role is mentor', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentor', mentor_specialty: null })
    const result = await requireAdmin()
    expect('error' in result).toBe(true)
    if ('error' in result) {
      expect(result.error).toBe(ERR.FORBIDDEN)
    }
  })
})

describe('requireAdminOrMentor()', () => {
  it('returns error when role is mentee', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentee', mentor_specialty: null })
    const result = await requireAdminOrMentor()
    expect('error' in result).toBe(true)
    if ('error' in result) {
      expect(result.error).toBe(ERR.FORBIDDEN)
    }
  })

  it('succeeds for admin', async () => {
    setupMocks({ id: 'user-1' }, { role: 'admin', mentor_specialty: null })
    const result = await requireAdminOrMentor()
    expect('error' in result).toBe(false)
  })

  it('succeeds for mentor with any specialty', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentor', mentor_specialty: 'japanese' })
    const result = await requireAdminOrMentor()
    expect('error' in result).toBe(false)
  })
})

describe('requireAdminOrJpMentor()', () => {
  it('succeeds for admin', async () => {
    setupMocks({ id: 'user-1' }, { role: 'admin', mentor_specialty: null })
    const result = await requireAdminOrJpMentor()
    expect('error' in result).toBe(false)
  })

  it('succeeds for mentor with japanese specialty', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentor', mentor_specialty: 'japanese' })
    const result = await requireAdminOrJpMentor()
    expect('error' in result).toBe(false)
  })

  it('succeeds for mentor with null specialty (all access)', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentor', mentor_specialty: null })
    const result = await requireAdminOrJpMentor()
    expect('error' in result).toBe(false)
  })

  it('fails for mentor with technical specialty', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentor', mentor_specialty: 'technical' })
    const result = await requireAdminOrJpMentor()
    expect('error' in result).toBe(true)
    if ('error' in result) {
      expect(result.error).toBe(ERR.FORBIDDEN)
    }
  })

  it('fails for mentee', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentee', mentor_specialty: null })
    const result = await requireAdminOrJpMentor()
    expect('error' in result).toBe(true)
  })
})

describe('requireAdminOrTechMentor()', () => {
  it('succeeds for admin', async () => {
    setupMocks({ id: 'user-1' }, { role: 'admin', mentor_specialty: null })
    const result = await requireAdminOrTechMentor()
    expect('error' in result).toBe(false)
  })

  it('succeeds for mentor with technical specialty', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentor', mentor_specialty: 'technical' })
    const result = await requireAdminOrTechMentor()
    expect('error' in result).toBe(false)
  })

  it('succeeds for mentor with null specialty (all access)', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentor', mentor_specialty: null })
    const result = await requireAdminOrTechMentor()
    expect('error' in result).toBe(false)
  })

  it('fails for mentor with japanese specialty', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentor', mentor_specialty: 'japanese' })
    const result = await requireAdminOrTechMentor()
    expect('error' in result).toBe(true)
    if ('error' in result) {
      expect(result.error).toBe(ERR.FORBIDDEN)
    }
  })

  it('fails for mentee', async () => {
    setupMocks({ id: 'user-1' }, { role: 'mentee', mentor_specialty: null })
    const result = await requireAdminOrTechMentor()
    expect('error' in result).toBe(true)
  })
})
