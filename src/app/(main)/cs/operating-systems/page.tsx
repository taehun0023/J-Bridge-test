import CsSubjectRoutePage from '@/components/cs/CsSubjectRoutePage'

export default async function OperatingSystemsPage({
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
      slug="operating-systems"
      pathname="/cs/operating-systems"
      searchParams={searchParams}
    />
  )
}
