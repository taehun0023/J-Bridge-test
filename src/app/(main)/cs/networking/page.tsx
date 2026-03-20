import CsSubjectRoutePage from '@/components/cs/CsSubjectRoutePage'

export default async function NetworkingPage({
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
      slug="networking"
      pathname="/cs/networking"
      searchParams={searchParams}
    />
  )
}
