import { Inbox, FileQuestion, Search, AlertCircle } from 'lucide-react'

const iconMap: Record<string, React.ReactNode> = {
  '📭': <Inbox className="h-10 w-10" />,
  '📋': <FileQuestion className="h-10 w-10" />,
  '🔍': <Search className="h-10 w-10" />,
  '⚠️': <AlertCircle className="h-10 w-10" />,
}

interface EmptyStateProps {
  title: string
  description?: string
  icon?: string
}

export default function EmptyState({ title, description, icon = '📭' }: EmptyStateProps) {
  const lucideIcon = iconMap[icon]

  return (
    <div className="flex flex-col items-center justify-center py-16 text-center">
      <div className="text-zinc-500 dark:text-zinc-500">
        {lucideIcon ?? <Inbox className="h-10 w-10" />}
      </div>
      <h3 className="mt-4 text-lg font-medium text-zinc-900 dark:text-zinc-100">{title}</h3>
      {description && (
        <p className="mt-2 text-sm text-zinc-500 dark:text-zinc-400">{description}</p>
      )}
    </div>
  )
}
