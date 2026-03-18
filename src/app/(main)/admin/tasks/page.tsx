import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import AdminTasksClient from './AdminTasksClient'
import { detectAndMarkOverdue, updateLearningStatuses, resolveQuizIdsForAssignment } from '@/app/actions/learning-assignments'
import { getReadingTotalCount } from '@/lib/assignment-categories'

export default async function AdminTasksPage() {
  await detectAndMarkOverdue()
  await updateLearningStatuses()

  const supabase = await createClient()
  const serviceClient = createServiceRoleClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: currentProfile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user!.id)
    .single()

  const currentRole = currentProfile?.role ?? 'mentee'

  // Fetch learning assignments
  const { data: learningAssignments } = await supabase
    .from('learning_assignments')
    .select('*, assignee:profiles!learning_assignments_assigned_to_fkey(full_name, email)')
    .order('created_at', { ascending: false })
    .limit(100)

  // Fetch comprehensive exam requests (mentee only — exclude admin/mentor self-requests)
  const { data: examRequests } = await supabase
    .from('comprehensive_exams')
    .select('*, user:profiles!comprehensive_exams_user_id_fkey(full_name, email, role)')
    .in('status', ['requested', 'approved', 'in_progress'])
    .order('requested_at', { ascending: false })
    .limit(50)
    .then(res => ({
      ...res,
      data: (res.data ?? []).filter(e => {
        const role = (e.user as unknown as { role: string } | null)?.role
        return role === 'mentee'
      }),
    }))

  // Fetch quiz retake requests
  const { data: rawRetakeRequests } = await supabase
    .from('quiz_attempts')
    .select('id, user_id, quiz_id, score, retake_request_status, retake_requested_at, quizzes(title)')
    .eq('retake_request_status', 'requested')
    .order('retake_requested_at', { ascending: false })
    .limit(50)

  // Fetch user profiles for retake requests
  const retakeUserIds = [...new Set((rawRetakeRequests ?? []).map(r => r.user_id))]
  let retakeProfileMap: Record<string, string> = {}
  if (retakeUserIds.length > 0) {
    const { data: retakeProfiles } = await supabase
      .from('profiles')
      .select('id, full_name')
      .in('id', retakeUserIds)
    retakeProfiles?.forEach(p => {
      retakeProfileMap[p.id] = p.full_name ?? '-'
    })
  }

  const quizRetakeRequests = (rawRetakeRequests ?? []).map(r => ({
    id: r.id,
    user_id: r.user_id,
    user_name: retakeProfileMap[r.user_id] ?? '-',
    quiz_title: (r.quizzes as unknown as { title: string } | null)?.title ?? '-',
    score: r.score,
    retake_request_status: r.retake_request_status,
    retake_requested_at: r.retake_requested_at,
  }))

  // For mentors: only show their assigned mentees
  let users: { id: string; full_name: string | null; email: string; role: string }[] = []
  if (currentRole === 'mentor') {
    const { data: menteeAssignments } = await supabase
      .from('mentor_mentee_assignments')
      .select('mentee:profiles!mentor_mentee_assignments_mentee_id_fkey(id, full_name, email, role)')
      .eq('mentor_id', user!.id)

    users = (menteeAssignments ?? [])
      .map(a => a.mentee as unknown as { id: string; full_name: string | null; email: string; role: string })
      .filter(Boolean)
  } else {
    const { data } = await supabase
      .from('profiles')
      .select('id, full_name, email, role')
      .in('role', ['mentee', 'mentor'])
      .order('full_name')
    users = data ?? []
  }

  // ─── Learning progress calculation ───
  const learningProgress: Record<string, { mastered: number; total: number; pct: number }> = {}

  if (serviceClient && (learningAssignments ?? []).length > 0) {
    const allUserIds = [...new Set((learningAssignments ?? []).map(a => a.assigned_to))]

    // Fetch all mastered items for all relevant users (paginated to bypass 1000-row default limit)
    const allMastered: { user_id: string; item_type: string; item_id: string }[] = []
    const PAGE_SIZE = 1000
    for (const uid of allUserIds) {
      let offset = 0
      while (true) {
        const { data: batch } = await serviceClient
          .from('user_mastered_items')
          .select('user_id, item_type, item_id')
          .eq('user_id', uid)
          .range(offset, offset + PAGE_SIZE - 1)
        if (!batch || batch.length === 0) break
        allMastered.push(...batch)
        if (batch.length < PAGE_SIZE) break
        offset += PAGE_SIZE
      }
    }

    // Build user mastery lookup: userId → item_type → Set<item_id>
    const userMastery = new Map<string, Map<string, Set<string>>>()
    for (const m of allMastered ?? []) {
      if (!userMastery.has(m.user_id)) userMastery.set(m.user_id, new Map())
      const typeMap = userMastery.get(m.user_id)!
      if (!typeMap.has(m.item_type)) typeMap.set(m.item_type, new Set())
      typeMap.get(m.item_type)!.add(m.item_id)
    }

    // JLPT item sets per level (for seikatsu assignments)
    const seikatsuLevels = [...new Set(
      (learningAssignments ?? [])
        .filter(a => a.category === 'seikatsu' && a.content_level)
        .map(a => a.content_level as string)
    )]

    const jlptItemSets: Record<string, { vocab: Set<string>; grammar: Set<string>; reading: Set<string>; listening: Set<string>; total: number }> = {}

    for (const level of seikatsuLevels) {
      const [vocabRes, grammarRes, readingRes, listeningRes] = await Promise.all([
        serviceClient.from('jlpt_vocabulary').select('id').eq('jlpt_level', level),
        serviceClient.from('jlpt_grammar').select('id').eq('jlpt_level', level),
        serviceClient.from('jlpt_reading_passages').select('id').eq('jlpt_level', level),
        serviceClient.from('jlpt_listening_scripts').select('id').eq('jlpt_level', level),
      ])
      const vocab = new Set((vocabRes.data ?? []).map(v => v.id))
      const grammar = new Set((grammarRes.data ?? []).map(g => g.id))
      const reading = new Set((readingRes.data ?? []).map(r => r.id))
      const listening = new Set((listeningRes.data ?? []).map(l => l.id))
      jlptItemSets[level] = { vocab, grammar, reading, listening, total: vocab.size + grammar.size + reading.size + listening.size }
    }

    // Business JP item sets per subcategory
    const bizSubcatDbMap: Record<string, string[]> = {
      glossary: ['business', 'it', 'dev'],
      'sentence-patterns': ['sentence_pattern'],
      expressions: ['expression'],
      keigo: ['keigo'],
    }
    const neededBizSubcats = [...new Set(
      (learningAssignments ?? [])
        .filter(a => a.category === 'business-jp')
        .map(a => a.subcategory)
    )]
    const bizJpInfo: Record<string, { ids: Set<string>; total: number }> = {}

    for (const subcat of neededBizSubcats) {
      const cats = bizSubcatDbMap[subcat]
      if (!cats) continue
      const { data: items } = await serviceClient
        .from('it_glossary')
        .select('id')
        .in('category', cats)
      const ids = new Set((items ?? []).map(i => i.id))
      bizJpInfo[subcat] = { ids, total: ids.size }
    }

    // Calculate per-assignment
    for (const la of learningAssignments ?? []) {
      const typeMap = userMastery.get(la.assigned_to)
      let mastered = 0
      let total = 0

      if (la.category === 'seikatsu' && la.content_level) {
        const sets = jlptItemSets[la.content_level]
        if (sets) {
          total = sets.total
          for (const [type, idSet] of [
            ['jlpt_vocabulary', sets.vocab],
            ['jlpt_grammar', sets.grammar],
            ['jlpt_reading', sets.reading],
            ['jlpt_listening', sets.listening],
          ] as const) {
            const masteredIds = typeMap?.get(type)
            if (masteredIds) {
              for (const id of masteredIds) {
                if ((idSet as Set<string>).has(id)) mastered++
              }
            }
          }
        }
      } else if (la.category === 'business-jp') {
        const info = bizJpInfo[la.subcategory]
        if (info) {
          total = info.total
          const masteredIds = typeMap?.get('it_glossary')
          if (masteredIds) {
            for (const id of masteredIds) {
              if (info.ids.has(id)) mastered++
            }
          }
        }
      } else if (la.category === 'business-lit') {
        total = getReadingTotalCount(la.category, la.subcategory)
        const types = la.subcategory === 'attitude-culture'
          ? ['attitude_manual', 'culture_manual']
          : la.subcategory === 'security' ? ['security_manual'] : []
        for (const t of types) {
          mastered += typeMap?.get(t)?.size ?? 0
        }
      }

      learningProgress[la.id] = {
        mastered,
        total,
        pct: total > 0 ? (mastered > 0 ? Math.max(1, Math.round((mastered / total) * 100)) : 0) : 0,
      }
    }
  }

  // Re-resolve empty required_quiz_ids + sync passed_quiz_ids for all non-completed assignments
  if (serviceClient && (learningAssignments ?? []).length > 0) {
    // Step 1: Re-resolve empty required_quiz_ids
    const emptyQuizAssignments = (learningAssignments ?? []).filter(
      a => !a.required_quiz_ids || a.required_quiz_ids.length === 0
    )
    for (const a of emptyQuizAssignments) {
      const resolved = await resolveQuizIdsForAssignment(a.category, a.subcategory, a.content_level, serviceClient)
      if (resolved.length > 0) {
        a.required_quiz_ids = resolved
      }
    }

    // Step 2: Sync passed_quiz_ids using each quiz's actual passing_score
    const needsSync = (learningAssignments ?? []).filter(
      a => a.required_quiz_ids && a.required_quiz_ids.length > 0 && a.status !== 'completed'
    )

    // Collect all quiz IDs to fetch passing_score in one query
    const allQuizIds = [...new Set(needsSync.flatMap(a => a.required_quiz_ids ?? []))]
    const passingScoreMap = new Map<string, number>()
    if (allQuizIds.length > 0) {
      const { data: quizScores } = await serviceClient
        .from('quizzes')
        .select('id, passing_score')
        .in('id', allQuizIds)
      for (const q of quizScores ?? []) {
        passingScoreMap.set(q.id, q.passing_score ?? 70)
      }
    }

    for (const a of needsSync) {
      // Fetch best score per quiz for this user
      const { data: attempts } = await serviceClient
        .from('quiz_attempts')
        .select('quiz_id, score')
        .eq('user_id', a.assigned_to)
        .in('quiz_id', a.required_quiz_ids)

      // Group by quiz_id, take max score
      const bestScores = new Map<string, number>()
      for (const att of attempts ?? []) {
        const cur = bestScores.get(att.quiz_id) ?? 0
        if (att.score > cur) bestScores.set(att.quiz_id, att.score)
      }

      // Check pass using each quiz's passing_score
      const passedIds = [...bestScores.entries()]
        .filter(([qid, score]) => score >= (passingScoreMap.get(qid) ?? 70))
        .map(([qid]) => qid)

      const currentPassed = a.passed_quiz_ids ?? []
      const needsUpdate = passedIds.length !== currentPassed.length ||
        passedIds.some(id => !currentPassed.includes(id))

      // Check if all quizzes are now passed
      const allCompleted = a.required_quiz_ids.length > 0 &&
        a.required_quiz_ids.every((id: string) => passedIds.includes(id))

      if (needsUpdate || emptyQuizAssignments.includes(a) || allCompleted) {
        const updateData: Record<string, unknown> = {
          required_quiz_ids: a.required_quiz_ids,
          passed_quiz_ids: passedIds,
        }
        if (allCompleted && a.status !== 'completed') {
          updateData.status = 'completed'
          updateData.completed_at = new Date().toISOString()
        }
        await serviceClient
          .from('learning_assignments')
          .update(updateData)
          .eq('id', a.id)
        a.passed_quiz_ids = passedIds
        if (allCompleted) a.status = 'completed'
      }
    }
  }

  const awaitingConfirmation = learningAssignments?.filter(t => t.status === 'awaiting_confirmation').length ?? 0
  const taskStats = {
    total: learningAssignments?.length ?? 0,
    pending: learningAssignments?.filter(t => t.status === 'pending').length ?? 0,
    inProgress: learningAssignments?.filter(t => t.status === 'in_progress').length ?? 0,
    completed: learningAssignments?.filter(t => t.status === 'completed').length ?? 0,
    overdue: learningAssignments?.filter(t => t.status === 'overdue').length ?? 0,
    approvals: (examRequests?.filter(e => e.status === 'requested').length ?? 0) + awaitingConfirmation + quizRetakeRequests.length,
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">課題配信</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">課題作成及び進捗状況管理</p>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-6">
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">全体</p>
          <p className="text-2xl font-bold text-gray-900 dark:text-white">{taskStats.total}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">待機</p>
          <p className="text-2xl font-bold text-yellow-600">{taskStats.pending}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">進行中</p>
          <p className="text-2xl font-bold text-blue-600">{taskStats.inProgress}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">完了</p>
          <p className="text-2xl font-bold text-green-600">{taskStats.completed}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">期限超過</p>
          <p className="text-2xl font-bold text-red-600">{taskStats.overdue}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">承認待ち</p>
          <p className="text-2xl font-bold text-orange-600">{taskStats.approvals}</p>
        </Card>
      </div>

      <AdminTasksClient
        learningAssignments={learningAssignments ?? []}
        examRequests={examRequests ?? []}
        quizRetakeRequests={quizRetakeRequests}
        users={users}
        currentRole={currentRole}
        learningProgress={learningProgress}
      />
    </div>
  )
}
