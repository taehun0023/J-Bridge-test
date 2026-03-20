import Link from 'next/link'
import { notFound, redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { getMasteredIds } from '@/app/actions/mastery'
import { getCsSubjectContent, type CsSubjectSlug } from '@/lib/cs-content'
import { getCsTermCategoryForSubject, getCsTermsIntro, type CsTermItem } from '@/lib/cs-terms'
import { ensureCsCourseStarted, getCsCourseById } from '@/lib/cs-course'
import CsStaticSubjectPage from './CsStaticSubjectPage'

const ITEMS_PER_PAGE = 30

interface SearchParams {
  tab?: string
  difficulty?: string
  search?: string
  page?: string
  mastery?: string
}

export default async function CsSubjectRoutePage({
  slug,
  pathname,
  searchParams,
}: {
  slug: CsSubjectSlug
  pathname: string
  searchParams: Promise<SearchParams>
}) {
  const params = await searchParams
  const tab = params.tab === 'terms' ? 'terms' : 'learn'
  const difficulty = params.difficulty ?? ''
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1', 10) || 1)
  const mastery = params.mastery ?? ''
  const offset = (page - 1) * ITEMS_PER_PAGE

  const subject = await getCsSubjectContent(slug)
  if (!subject) notFound()

  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()
  const isAdmin = profile?.role === 'admin'

  const termsCategory = getCsTermCategoryForSubject(slug)
  const termsIntro = getCsTermsIntro(subject.title)
  const course = await getCsCourseById(supabase, `cs-${slug}`, user.id, isAdmin)
  if (!course) notFound()

  if (course.isLocked && !isAdmin) {
    redirect('/cs')
  }

  await ensureCsCourseStarted(supabase, user.id, course.id)

  let termsItems: CsTermItem[] = []
  let termsTotalCount = 0
  let termsTotalPages = 0
  let masteredIds: string[] = []

  if (termsCategory) {
    masteredIds = await getMasteredIds('cs_term')

    let query = supabase
      .from('cs_terms')
      .select('*', { count: 'exact' })
      .eq('category', termsCategory)
      .order('sort_order', { ascending: true })

    if (difficulty) {
      query = query.eq('difficulty_level', difficulty)
    }
    if (search) {
      query = query.or(`term_ja.ilike.%${search}%,term_ko.ilike.%${search}%,term_en.ilike.%${search}%`)
    }

    if (mastery === 'mastered' && masteredIds.length > 0) {
      query = query.in('id', masteredIds)
    } else if (mastery === 'mastered' && masteredIds.length === 0) {
      query = query.in('id', ['00000000-0000-0000-0000-000000000000'])
    } else if (mastery === 'unmastered' && masteredIds.length > 0) {
      query = query.not('id', 'in', `(${masteredIds.join(',')})`)
    }

    query = query.range(offset, offset + ITEMS_PER_PAGE - 1)

    const { data: items, count } = await query
    termsItems = (items ?? []) as CsTermItem[]
    termsTotalCount = count ?? 0
    termsTotalPages = Math.ceil(termsTotalCount / ITEMS_PER_PAGE)
  }

  return (
    <CsStaticSubjectPage
      subject={subject}
      course={course}
      pathname={pathname}
      activeTab={tab}
      termsCategory={termsCategory}
      termsIntro={termsIntro}
      termsItems={termsItems}
      termsDifficulty={difficulty}
      termsSearch={search}
      termsPage={page}
      termsTotalPages={termsTotalPages}
      termsTotalCount={termsTotalCount}
      termsOffset={offset}
      termsMasteredIds={masteredIds}
      termsMastery={mastery}
    />
  )
}
