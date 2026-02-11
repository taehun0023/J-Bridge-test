'use client'

interface PaginationProps {
  currentPage: number
  totalPages: number
  onPageChange: (page: number) => void
}

export default function Pagination({ currentPage, totalPages, onPageChange }: PaginationProps) {
  if (totalPages <= 1) return null

  const pages: (number | '...')[] = []
  for (let i = 1; i <= totalPages; i++) {
    if (i === 1 || i === totalPages || (i >= currentPage - 1 && i <= currentPage + 1)) {
      pages.push(i)
    } else if (pages[pages.length - 1] !== '...') {
      pages.push('...')
    }
  }

  return (
    <nav className="flex items-center justify-center gap-1 py-4">
      <button
        onClick={() => onPageChange(currentPage - 1)}
        disabled={currentPage === 1}
        className="rounded-lg px-3 py-2 text-sm font-medium text-zinc-400 hover:bg-white/5 dark:text-zinc-400 dark:hover:bg-white/5 hover:bg-zinc-100 disabled:opacity-40 disabled:cursor-not-allowed"
      >
        前へ
      </button>
      {pages.map((page, i) =>
        page === '...' ? (
          <span key={`ellipsis-${i}`} className="px-2 text-zinc-500 font-mono">...</span>
        ) : (
          <button
            key={page}
            onClick={() => onPageChange(page)}
            className={`rounded-lg px-3 py-2 text-sm font-mono font-medium ${
              page === currentPage
                ? 'bg-indigo-600 text-white'
                : 'text-zinc-400 hover:bg-white/5 dark:text-zinc-400 dark:hover:bg-white/5 hover:bg-zinc-100'
            }`}
          >
            {page}
          </button>
        )
      )}
      <button
        onClick={() => onPageChange(currentPage + 1)}
        disabled={currentPage === totalPages}
        className="rounded-lg px-3 py-2 text-sm font-medium text-zinc-400 hover:bg-white/5 dark:text-zinc-400 dark:hover:bg-white/5 hover:bg-zinc-100 disabled:opacity-40 disabled:cursor-not-allowed"
      >
        次へ
      </button>
    </nav>
  )
}
