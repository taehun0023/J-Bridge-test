'use client'

import { useEffect, useRef, useState } from 'react'
import { ChevronDown } from 'lucide-react'
import NameRuby from './NameRuby'

interface NameOption {
  id: string
  full_name: string | null
  email?: string
}

interface Props {
  value: string
  onChange: (id: string) => void
  options: NameOption[]
  placeholder?: string
  /** form submission 용 hidden input name */
  name?: string
  required?: boolean
  className?: string
  buttonClassName?: string
}

/**
 * 네이티브 <select> 대신 사용하는 dropdown.
 * <option> 안에는 ruby 태그가 렌더링되지 않기 때문에,
 * 한자+카타카나 furigana 가 필요한 사용자 선택 UI는 이 컴포넌트로 대체한다.
 *
 * - 폼 제출은 hidden input 으로 지원 (name 지정 시)
 * - 키보드 접근성은 최소한만 (ESC 닫기, 외부 클릭 닫기). 향후 필요시 listbox 패턴 보강
 */
export default function NameSelect({
  value,
  onChange,
  options,
  placeholder = '選択...',
  name,
  required = false,
  className = '',
  buttonClassName = '',
}: Props) {
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement>(null)
  const selected = options.find(o => o.id === value) ?? null

  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false)
    }
    function handleKey(e: KeyboardEvent) {
      if (e.key === 'Escape') setOpen(false)
    }
    if (open) {
      document.addEventListener('mousedown', handleClickOutside)
      document.addEventListener('keydown', handleKey)
    }
    return () => {
      document.removeEventListener('mousedown', handleClickOutside)
      document.removeEventListener('keydown', handleKey)
    }
  }, [open])

  return (
    <div className={`relative ${className}`} ref={ref}>
      {name && (
        <input type="hidden" name={name} value={value} required={required} />
      )}
      <button
        type="button"
        onClick={() => setOpen(o => !o)}
        className={`flex w-full items-center justify-between gap-2 rounded-xl border border-gray-200 bg-white px-3 py-2 text-left text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-gray-700 dark:text-white ${buttonClassName}`}
      >
        <span className="min-w-0 flex-1 truncate">
          {selected ? (
            <NameRuby name={selected.full_name} fallback={selected.email ?? ''} />
          ) : (
            <span className="text-zinc-400 dark:text-zinc-500">{placeholder}</span>
          )}
        </span>
        <ChevronDown className="h-4 w-4 shrink-0 opacity-50" />
      </button>
      {open && (
        <div className="absolute left-0 right-0 z-20 mt-1 max-h-60 overflow-y-auto rounded-xl border border-gray-200 bg-white py-1 shadow-lg dark:border-white/[0.08] dark:bg-zinc-800">
          {options.length === 0 ? (
            <div className="px-3 py-2 text-sm text-zinc-400">候補がありません</div>
          ) : (
            options.map(o => (
              <button
                key={o.id}
                type="button"
                onClick={() => {
                  onChange(o.id)
                  setOpen(false)
                }}
                className={`block w-full px-3 py-2 text-left text-sm leading-tight hover:bg-gray-100 dark:hover:bg-white/5 ${
                  value === o.id
                    ? 'bg-indigo-50 text-indigo-700 dark:bg-indigo-500/10 dark:text-indigo-300'
                    : 'text-zinc-900 dark:text-zinc-100'
                }`}
              >
                <NameRuby name={o.full_name} fallback={o.email ?? ''} />
              </button>
            ))
          )}
        </div>
      )}
    </div>
  )
}
