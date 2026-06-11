import { describe, it, expect, vi, beforeEach } from 'vitest'

// Mock chain builders
function createChainMock() {
  const chain: Record<string, ReturnType<typeof vi.fn>> = {}
  chain.delete = vi.fn(() => chain)
  chain.eq = vi.fn(() => chain)
  chain.insert = vi.fn(() => chain)
  chain.update = vi.fn(() => chain)
  chain.select = vi.fn(() => chain)
  chain.order = vi.fn(() => chain)
  chain.limit = vi.fn(() => ({ data: [], error: null }))
  chain.single = vi.fn(() => ({ data: null, error: null }))
  return chain
}

const mockChain = createChainMock()
const mockServiceClient = {
  from: vi.fn(() => mockChain),
}

const mockAuthChain = createChainMock()
const mockAuthSupabase = {
  auth: {
    getUser: vi.fn().mockResolvedValue({ data: { user: { id: 'user-1' } } }),
  },
  from: vi.fn(() => mockAuthChain),
}

vi.mock('@/lib/supabase/server', () => ({
  createClient: vi.fn(async () => mockAuthSupabase),
  createServiceRoleClient: vi.fn(() => mockServiceClient),
}))

let deleteNotificationsByRelatedId: typeof import('./notification-helpers').deleteNotificationsByRelatedId

beforeEach(async () => {
  vi.clearAllMocks()
  // Reset chain mocks
  Object.values(mockChain).forEach(fn => fn.mockClear())
  mockChain.delete.mockReturnValue(mockChain)
  mockChain.eq.mockReturnValue(mockChain)

  const mod = await import('./notification-helpers')
  deleteNotificationsByRelatedId = mod.deleteNotificationsByRelatedId
})

describe('deleteNotificationsByRelatedId', () => {
  it('should delete notifications matching relatedId and type', async () => {
    await deleteNotificationsByRelatedId('exam-123', 'exam_requested')

    expect(mockServiceClient.from).toHaveBeenCalledWith('notifications')
    expect(mockChain.delete).toHaveBeenCalled()
    expect(mockChain.eq).toHaveBeenCalledWith('related_id', 'exam-123')
    expect(mockChain.eq).toHaveBeenCalledWith('type', 'exam_requested')
  })

  it('should work with retake_requested type', async () => {
    await deleteNotificationsByRelatedId('attempt-456', 'retake_requested')

    expect(mockServiceClient.from).toHaveBeenCalledWith('notifications')
    expect(mockChain.eq).toHaveBeenCalledWith('related_id', 'attempt-456')
    expect(mockChain.eq).toHaveBeenCalledWith('type', 'retake_requested')
  })

  it('should not throw when service client is available', async () => {
    await expect(
      deleteNotificationsByRelatedId('exam-789', 'exam_requested')
    ).resolves.not.toThrow()
  })

  it('should silently return when service client is unavailable', async () => {
    const { createServiceRoleClient } = await import('@/lib/supabase/server')
    vi.mocked(createServiceRoleClient).mockReturnValueOnce(null)

    await expect(
      deleteNotificationsByRelatedId('exam-000', 'exam_requested')
    ).resolves.not.toThrow()

    // from() should NOT be called since serviceClient is null
    expect(mockServiceClient.from).not.toHaveBeenCalled()
  })
})
