interface CardProps {
  children: React.ReactNode
  title?: string
  className?: string
}

export default function Card({ children, title, className = '' }: CardProps) {
  return (
    <div className={`rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-700 dark:bg-gray-800 ${className}`}>
      {title && (
        <h3 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">{title}</h3>
      )}
      {children}
    </div>
  )
}
