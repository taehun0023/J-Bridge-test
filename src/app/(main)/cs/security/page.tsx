import CsSubjectRoutePage from '@/components/cs/CsSubjectRoutePage'

export default async function SecurityPage({
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
      slug="security"
      pathname="/cs/security"
      searchParams={searchParams}
    />
  )
}
