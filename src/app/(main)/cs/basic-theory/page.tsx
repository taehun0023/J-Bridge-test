import CsSubjectRoutePage from '@/components/cs/CsSubjectRoutePage'

export default async function BasicTheoryPage({
  searchParams,
}: {
  searchParams: Promise<{
    tab?: string
    difficulty?: string
    search?: string
    page?: string
    mastery?: string
  }>
}) {
  return (
    <CsSubjectRoutePage
      slug="basic-theory"
      pathname="/cs/basic-theory"
      searchParams={searchParams}
    />
  )
}
