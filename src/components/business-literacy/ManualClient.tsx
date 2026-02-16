'use client'

import { useState, useMemo, useTransition } from 'react'
import Link from 'next/link'
import {
  UserCheck, Shield, Monitor, Handshake, MessageSquare, Clock, Users,
  ChevronDown, ChevronRight, CheckCircle2, Circle, BookOpen, Lock,
} from 'lucide-react'
import { toggleMastery } from '@/app/actions/mastery'
import type { ManualSection, ManualSubsection, ManualItemType } from '@/lib/manual-types'

const ICON_MAP: Record<string, React.ComponentType<{ className?: string }>> = {
  UserCheck, Shield, Monitor, Handshake, MessageSquare, Clock, Users,
}

interface Props {
  sections: ManualSection[]
  masteredIds: string[]
  allSubsectionIds: string[]
  title: string
  subtitle: string
  quizUrl: string
  quizLocked?: boolean
}

export default function ManualClient({
  sections,
  masteredIds: initialMasteredIds,
  allSubsectionIds,
  title,
  subtitle,
  quizUrl,
  quizLocked = false,
}: Props) {
  const [masteredIds, setMasteredIds] = useState<Set<string>>(new Set(initialMasteredIds))
  const [expandedSection, setExpandedSection] = useState<string | null>(
    sections.length === 1 ? sections[0].id : null
  )
  const [expandedSubs, setExpandedSubs] = useState<Set<string>>(new Set())
  const [isPending, startTransition] = useTransition()

  const itemTypeMap = useMemo(() => {
    const map = new Map<string, ManualItemType>()
    for (const section of sections) {
      for (const sub of section.subsections) {
        map.set(sub.id, section.itemType)
      }
    }
    return map
  }, [sections])

  const progress = allSubsectionIds.filter(id => masteredIds.has(id)).length
  const total = allSubsectionIds.length
  const progressPct = total > 0 ? Math.round((progress / total) * 100) : 0

  function toggleSection(sectionId: string) {
    setExpandedSection(prev => prev === sectionId ? null : sectionId)
  }

  function toggleSub(subId: string) {
    setExpandedSubs(prev => {
      const next = new Set(prev)
      if (next.has(subId)) next.delete(subId)
      else next.add(subId)
      return next
    })
  }

  function handleMastery(subId: string) {
    const sectionItemType = itemTypeMap.get(subId)
    if (!sectionItemType) return
    startTransition(async () => {
      const result = await toggleMastery(sectionItemType, subId)
      if ('error' in result) return
      setMasteredIds(prev => {
        const next = new Set(prev)
        if (result.mastered) next.add(subId)
        else next.delete(subId)
        return next
      })
    })
  }

  function sectionProgress(section: ManualSection) {
    const done = section.subsections.filter(s => masteredIds.has(s.id)).length
    return { done, total: section.subsections.length }
  }

  return (
    <div className="mx-auto max-w-4xl">
      {/* Header */}
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">
          {title}
        </h1>
        <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">
          {subtitle}
        </p>
      </div>

      {/* Progress bar */}
      <div className="mb-6 rounded-lg border border-zinc-200 bg-white p-4 dark:border-zinc-700 dark:bg-zinc-800">
        <div className="mb-2 flex items-center justify-between text-sm">
          <span className="font-medium text-zinc-700 dark:text-zinc-300">
            読了進捗
          </span>
          <span className="text-zinc-500 dark:text-zinc-400">
            {progress} / {total} ({progressPct}%)
          </span>
        </div>
        <div className="h-2 overflow-hidden rounded-full bg-zinc-200 dark:bg-zinc-700">
          <div
            className="h-full rounded-full bg-blue-600 transition-all duration-300"
            style={{ width: `${progressPct}%` }}
          />
        </div>
      </div>

      {/* Sections */}
      <div className="space-y-4">
        {sections.map(section => {
          const Icon = ICON_MAP[section.icon] ?? BookOpen
          const isExpanded = expandedSection === section.id
          const sp = sectionProgress(section)

          return (
            <div
              key={section.id}
              className="overflow-hidden rounded-xl border border-zinc-200 bg-white dark:border-zinc-700 dark:bg-zinc-800"
            >
              {/* Section header card */}
              <button
                onClick={() => toggleSection(section.id)}
                className="flex w-full items-center gap-4 p-5 text-left transition-colors hover:bg-zinc-50 dark:hover:bg-zinc-700/80"
              >
                <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-blue-50 text-blue-600 dark:bg-blue-900/30 dark:text-blue-400">
                  <Icon className="h-5 w-5" />
                </div>
                <div className="min-w-0 flex-1">
                  <h2 className="font-semibold text-zinc-900 dark:text-zinc-100">
                    {section.title}
                  </h2>
                  <p className="text-sm text-zinc-500 dark:text-zinc-400">
                    {section.titleKo}
                  </p>
                </div>
                <div className="flex items-center gap-3">
                  <span className="text-xs text-zinc-400 dark:text-zinc-500">
                    {sp.done}/{sp.total}
                  </span>
                  {isExpanded
                    ? <ChevronDown className="h-5 w-5 text-zinc-400" />
                    : <ChevronRight className="h-5 w-5 text-zinc-400" />
                  }
                </div>
              </button>

              {/* Subsections accordion */}
              {isExpanded && (
                <div className="border-t border-zinc-200 dark:border-zinc-700">
                  {section.subsections.map(sub => (
                    <SubsectionItem
                      key={sub.id}
                      sub={sub}
                      isExpanded={expandedSubs.has(sub.id)}
                      isMastered={masteredIds.has(sub.id)}
                      isPending={isPending}
                      onToggle={() => toggleSub(sub.id)}
                      onMastery={() => handleMastery(sub.id)}
                    />
                  ))}
                </div>
              )}
            </div>
          )
        })}
      </div>

      {/* Quiz link section */}
      <div className="mt-8 rounded-xl border border-zinc-200 bg-white p-6 dark:border-zinc-700 dark:bg-zinc-800">
        <h2 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">
          理解度テスト
        </h2>
        <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">
          マニュアルの内容を理解できたか、テストで確認しましょう。
        </p>
        {quizLocked ? (
          <div className="mt-4">
            <span className="inline-flex items-center gap-2 rounded-lg bg-zinc-100 px-4 py-2 text-sm font-medium text-zinc-400 dark:bg-zinc-700 dark:text-zinc-500">
              <Lock className="h-4 w-4" />
              テストに挑戦する
            </span>
            <p className="mt-2 text-xs text-zinc-400 dark:text-zinc-500">
              全項目を読了するとテストを受けられます
            </p>
          </div>
        ) : (
          <Link
            href={quizUrl}
            className="mt-4 inline-flex items-center gap-2 rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-blue-700"
          >
            <BookOpen className="h-4 w-4" />
            テストに挑戦する
          </Link>
        )}
      </div>
    </div>
  )
}

function SubsectionItem({
  sub,
  isExpanded,
  isMastered,
  isPending,
  onToggle,
  onMastery,
}: {
  sub: ManualSubsection
  isExpanded: boolean
  isMastered: boolean
  isPending: boolean
  onToggle: () => void
  onMastery: () => void
}) {
  return (
    <div className="border-b border-zinc-100 last:border-b-0 dark:border-zinc-700/50">
      <button
        onClick={onToggle}
        className="flex w-full items-center gap-3 px-5 py-3 text-left transition-colors hover:bg-zinc-50 dark:hover:bg-zinc-700/80"
      >
        {isMastered
          ? <CheckCircle2 className="h-4 w-4 shrink-0 text-green-500" />
          : <Circle className="h-4 w-4 shrink-0 text-zinc-300 dark:text-zinc-600" />
        }
        <span className="flex-1 text-sm font-medium text-zinc-800 dark:text-zinc-200">
          {sub.title}
        </span>
        {isExpanded
          ? <ChevronDown className="h-4 w-4 text-zinc-400" />
          : <ChevronRight className="h-4 w-4 text-zinc-400" />
        }
      </button>

      {isExpanded && (
        <div className="px-5 pb-4 pl-12">
          <ul className="space-y-2">
            {sub.content.map((item, i) => (
              <li key={i} className="flex gap-2 text-sm leading-relaxed text-zinc-700 dark:text-zinc-300">
                <span className="mt-1.5 h-1.5 w-1.5 shrink-0 rounded-full bg-zinc-400 dark:bg-zinc-500" />
                <span>{item}</span>
              </li>
            ))}
          </ul>

          {sub.noteKo && (
            <div className="mt-3 rounded-lg bg-amber-50 p-3 text-sm text-amber-800 dark:bg-amber-900/20 dark:text-amber-300">
              <span className="font-medium">韓国語メモ: </span>
              {sub.noteKo}
            </div>
          )}

          <button
            onClick={onMastery}
            disabled={isPending}
            className={`mt-3 inline-flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-xs font-medium transition-colors ${
              isMastered
                ? 'bg-green-100 text-green-700 hover:bg-green-200 dark:bg-green-900/30 dark:text-green-400 dark:hover:bg-green-900/50'
                : 'bg-zinc-100 text-zinc-600 hover:bg-zinc-200 dark:bg-zinc-700 dark:text-zinc-400 dark:hover:bg-zinc-600'
            }`}
          >
            {isMastered ? <CheckCircle2 className="h-3.5 w-3.5" /> : <Circle className="h-3.5 w-3.5" />}
            {isMastered ? '読了済み' : '読了にする'}
          </button>
        </div>
      )}
    </div>
  )
}
