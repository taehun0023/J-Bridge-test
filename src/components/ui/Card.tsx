interface CardProps {
  children: React.ReactNode
  title?: React.ReactNode
  className?: string
  headerAction?: React.ReactNode
}

export default function Card({ children, title, className = '', headerAction }: CardProps) {
  return (
    <div className={`rounded-2xl border border-gray-200 bg-white/80 p-6 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03] ${className}`}>
      {(title || headerAction) && (
        <div className="mb-4 flex items-center justify-between gap-3">
          {title ? (
            <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">{title}</h3>
          ) : (
            <span />
          )}
          {headerAction}
        </div>
      )}
      {children}
    </div>
  )
}
