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
    <div className="flex gap-1 overflow-x-auto border-b border-gray-200 dark:border-gray-700 pb-px">
      {tabs.map((tab) => (
        <button
          key={tab.key}
          onClick={() => onChange(tab.key)}
          className={`whitespace-nowrap border-b-2 px-4 py-2.5 text-sm font-medium transition-colors ${
            tab.key === activeKey
              ? 'border-blue-600 text-blue-600 dark:border-blue-400 dark:text-blue-400'
              : 'border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 dark:text-gray-400 dark:hover:border-gray-600 dark:hover:text-gray-200'
          }`}
        >
          {tab.label}
          {tab.count !== undefined && (
            <span className="ml-1.5 rounded-full bg-gray-100 px-2 py-0.5 text-xs text-gray-600 dark:bg-gray-700 dark:text-gray-400">
              {tab.count}
            </span>
          )}
        </button>
      ))}
    </div>
  )
}
