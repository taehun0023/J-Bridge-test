import CsSubjectRoutePage from '@/components/cs/CsSubjectRoutePage'

export default async function ComputerArchitecturePage({
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
      slug="computer-architecture"
      pathname="/cs/computer-architecture"
      searchParams={searchParams}
    />
  )
}
