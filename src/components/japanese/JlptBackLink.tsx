import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'

/** JLPT 학습 화면용 공용 뒤로가기 링크(화살표). */
export default function JlptBackLink({ href, label }: { href: string; label: string }) {
  return (
    <Link
      href={href}
      className="mb-4 inline-flex items-center gap-1 text-sm text-zinc-500 hover:text-zinc-700 dark:text-zinc-400 dark:hover:text-zinc-200"
    >
      <ArrowLeft className="h-4 w-4" /> {label}
    </Link>
  )
}
