interface SkeletonProps {
  variant?: 'line' | 'card' | 'table-row'
  count?: number
  className?: string
}

function SkeletonLine({ className = '' }: { className?: string }) {
  return <div className={`h-4 animate-pulse rounded bg-gray-200 ${className}`} />
}

function SkeletonCard() {
  return (
    <div className="rounded-xl border border-gray-200 bg-white p-6">
      <div className="h-5 w-1/3 animate-pulse rounded bg-gray-200" />
      <div className="mt-4 space-y-3">
        <div className="h-4 animate-pulse rounded bg-gray-200" />
        <div className="h-4 w-5/6 animate-pulse rounded bg-gray-200" />
      </div>
    </div>
  )
}

function SkeletonTableRow() {
  return (
    <div className="flex items-center gap-4 border-b border-gray-100 py-3">
      <div className="h-4 w-1/4 animate-pulse rounded bg-gray-200" />
      <div className="h-4 w-1/3 animate-pulse rounded bg-gray-200" />
      <div className="h-4 w-1/6 animate-pulse rounded bg-gray-200" />
    </div>
  )
}

export default function Skeleton({ variant = 'line', count = 1, className = '' }: SkeletonProps) {
  const items = Array.from({ length: count })

  if (variant === 'card') {
    return (
      <div className={`grid gap-4 sm:grid-cols-2 lg:grid-cols-3 ${className}`}>
        {items.map((_, i) => <SkeletonCard key={i} />)}
      </div>
    )
  }

  if (variant === 'table-row') {
    return (
      <div className={className}>
        {items.map((_, i) => <SkeletonTableRow key={i} />)}
      </div>
    )
  }

  return (
    <div className={`space-y-3 ${className}`}>
      {items.map((_, i) => <SkeletonLine key={i} />)}
    </div>
  )
}
