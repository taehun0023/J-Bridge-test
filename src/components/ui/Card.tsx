interface CardProps {
  children: React.ReactNode
  title?: string
  className?: string
}

export default function Card({ children, title, className = '' }: CardProps) {
  return (
    <div className={`rounded-2xl border border-gray-200 bg-white/80 p-6 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03] ${className}`}>
      {title && (
        <h3 className="mb-4 text-lg font-semibold text-zinc-900 dark:text-zinc-100">{title}</h3>
      )}
      {children}
    </div>
  )
}
