import CsSubjectRoutePage from '@/components/cs/CsSubjectRoutePage'

export default async function DataStructuresPage({
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
      slug="data-structures"
      pathname="/cs/data-structures"
      searchParams={searchParams}
    />
  )
}
