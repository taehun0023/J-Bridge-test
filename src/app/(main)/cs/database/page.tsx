import CsSubjectRoutePage from '@/components/cs/CsSubjectRoutePage'

export default async function DatabasePage({
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
      slug="database"
      pathname="/cs/database"
      searchParams={searchParams}
    />
  )
}
