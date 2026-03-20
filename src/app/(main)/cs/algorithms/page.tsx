import CsSubjectRoutePage from '@/components/cs/CsSubjectRoutePage'

export default async function AlgorithmsPage({
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
      slug="algorithms"
      pathname="/cs/algorithms"
      searchParams={searchParams}
    />
  )
}
