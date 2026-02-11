'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'

export default function EnrollButton({ courseId }: { courseId: string }) {
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  async function handleEnroll() {
    setLoading(true)
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return

    await supabase
      .from('enrollments')
      .insert({ user_id: user.id, course_id: courseId })

    router.refresh()
    setLoading(false)
  }

  return (
    <button
      onClick={handleEnroll}
      disabled={loading}
      className="mb-6 rounded-lg bg-blue-600 px-6 py-3 text-sm font-semibold text-white hover:bg-blue-700 disabled:opacity-50"
    >
      {loading ? '登録中...' : '受講申請'}
    </button>
  )
}
