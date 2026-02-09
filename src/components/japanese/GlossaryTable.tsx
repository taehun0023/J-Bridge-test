'use client'

import { useState } from 'react'

interface GlossaryItem {
  id: string
  term_ja: string
  reading: string | null
  term_ko: string
  term_en: string | null
  category: string
  description: string | null
  example_sentence: string | null
}

interface GlossaryTableProps {
  items: GlossaryItem[]
}

export default function GlossaryTable({ items }: GlossaryTableProps) {
  const [expandedId, setExpandedId] = useState<string | null>(null)

  return (
    <div className="overflow-x-auto">
      <table className="min-w-full divide-y divide-gray-200">
        <thead className="bg-gray-50">
          <tr>
            <th className="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">일본어</th>
            <th className="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">읽기</th>
            <th className="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">한국어</th>
            <th className="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">English</th>
            <th className="w-10 px-4 py-3"></th>
          </tr>
        </thead>
        <tbody className="divide-y divide-gray-100 bg-white">
          {items.map((item) => (
            <>
              <tr key={item.id} className="hover:bg-gray-50">
                <td className="whitespace-nowrap px-4 py-3 text-sm font-medium text-gray-900">
                  {item.term_ja}
                </td>
                <td className="whitespace-nowrap px-4 py-3 text-sm text-gray-500">
                  {item.reading ?? '-'}
                </td>
                <td className="whitespace-nowrap px-4 py-3 text-sm text-gray-700">
                  {item.term_ko}
                </td>
                <td className="whitespace-nowrap px-4 py-3 text-sm text-gray-500">
                  {item.term_en ?? '-'}
                </td>
                <td className="px-4 py-3">
                  <button
                    onClick={() => setExpandedId(expandedId === item.id ? null : item.id)}
                    className="text-gray-400 hover:text-gray-600"
                  >
                    <svg
                      className={`h-4 w-4 transition-transform ${expandedId === item.id ? 'rotate-180' : ''}`}
                      fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    >
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  </button>
                </td>
              </tr>
              {expandedId === item.id && (
                <tr key={`${item.id}-detail`}>
                  <td colSpan={5} className="bg-gray-50 px-4 py-3">
                    {item.description && (
                      <p className="text-sm text-gray-700">{item.description}</p>
                    )}
                    {item.example_sentence && (
                      <p className="mt-2 text-sm text-gray-600 italic">
                        &ldquo;{item.example_sentence}&rdquo;
                      </p>
                    )}
                  </td>
                </tr>
              )}
            </>
          ))}
        </tbody>
      </table>
    </div>
  )
}
