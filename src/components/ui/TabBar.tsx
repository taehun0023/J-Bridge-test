'use client'

interface Tab {
  key: string
  label: string
  count?: number
}

interface TabBarProps {
  tabs: Tab[]
  activeKey: string
  onChange: (key: string) => void
}

export default function TabBar({ tabs, activeKey, onChange }: TabBarProps) {
  return (
    <div className="flex gap-1 overflow-x-auto border-b border-white/[0.06] dark:border-white/[0.06] border-gray-200 pb-px">
      {tabs.map((tab) => (
        <button
          key={tab.key}
          onClick={() => onChange(tab.key)}
          className={`whitespace-nowrap border-b-2 px-4 py-2.5 text-sm font-medium transition-colors ${
            tab.key === activeKey
              ? 'border-indigo-500 text-indigo-400 dark:border-indigo-500 dark:text-indigo-400 border-indigo-600 text-indigo-700'
              : 'border-transparent text-zinc-500 hover:border-zinc-700 hover:text-zinc-300 dark:text-zinc-400 dark:hover:border-zinc-600 dark:hover:text-zinc-200'
          }`}
        >
          {tab.label}
          {tab.count !== undefined && (
            <span className="ml-1.5 rounded-full bg-white/10 px-2 py-0.5 text-xs text-zinc-400 dark:bg-white/10 dark:text-zinc-400 bg-zinc-100 text-zinc-600">
              {tab.count}
            </span>
          )}
        </button>
      ))}
    </div>
  )
}
