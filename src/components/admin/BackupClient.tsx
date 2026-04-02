'use client'

import { useState, useTransition } from 'react'
import { Download, FolderArchive, ChevronDown } from 'lucide-react'
import JSZip from 'jszip'
import { exportTableCsv, exportQuizQuestionsCsv, exportCoursesCsv } from '@/app/actions/admin/backup'
import {
  getExportGroups,
  GROUP_LABELS,
  GROUP_FOLDER_NAMES,
  GROUP_ORDER,
  QUIZ_TYPE_GROUPS,
  COURSE_CATEGORY_GROUPS,
  type BackupGroup,
} from '@/lib/backup-config'

const groups = getExportGroups()

function downloadBlob(blob: Blob, filename: string) {
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = filename
  a.click()
  URL.revokeObjectURL(url)
}

function csvBlob(csv: string) {
  return new Blob(['\uFEFF' + csv], { type: 'text/csv;charset=utf-8;' })
}

function today() {
  return new Date().toISOString().split('T')[0]
}

export default function BackupClient() {
  const [pending, startTransition] = useTransition()
  const [downloading, setDownloading] = useState<string | null>(null)
  const [expandedGroups, setExpandedGroups] = useState<Set<BackupGroup>>(new Set(['user']))
  const [progress, setProgress] = useState<string | null>(null)

  function toggleGroup(g: BackupGroup) {
    setExpandedGroups(prev => {
      const next = new Set(prev)
      if (next.has(g)) next.delete(g)
      else next.add(g)
      return next
    })
  }

  // Single table CSV download
  function handleDownloadTable(tableKey: string) {
    setDownloading(tableKey)
    startTransition(async () => {
      const result = await exportTableCsv(tableKey)
      if (result.csv) {
        downloadBlob(csvBlob(result.csv), `${tableKey}_${today()}.csv`)
      }
      setDownloading(null)
    })
  }

  // Quiz questions download (2 files)
  function handleDownloadQuiz(groupKey: string) {
    setDownloading(`quiz_${groupKey}`)
    startTransition(async () => {
      const result = await exportQuizQuestionsCsv(groupKey)
      if (result.questionsCsv) {
        downloadBlob(csvBlob(result.questionsCsv), `${groupKey}_quiz_questions_${today()}.csv`)
      }
      if (result.optionsCsv) {
        setTimeout(() => {
          downloadBlob(csvBlob(result.optionsCsv), `${groupKey}_quiz_options_${today()}.csv`)
        }, 500)
      }
      setDownloading(null)
    })
  }

  // Courses/lessons download (2 files)
  function handleDownloadCourses(groupKey: string) {
    setDownloading(`course_${groupKey}`)
    startTransition(async () => {
      const result = await exportCoursesCsv(groupKey)
      if (result.coursesCsv) {
        downloadBlob(csvBlob(result.coursesCsv), `${groupKey}_courses_${today()}.csv`)
      }
      if (result.lessonsCsv) {
        setTimeout(() => {
          downloadBlob(csvBlob(result.lessonsCsv), `${groupKey}_lessons_${today()}.csv`)
        }, 500)
      }
      setDownloading(null)
    })
  }

  // Group ZIP download
  function handleDownloadGroup(groupKey: BackupGroup) {
    setDownloading(`group_${groupKey}`)
    startTransition(async () => {
      const zip = new JSZip()
      const folder = zip.folder(GROUP_FOLDER_NAMES[groupKey])!
      const group = groups[groupKey]

      for (const table of group.tables) {
        const result = await exportTableCsv(table.key)
        if (result.csv) folder.file(`${table.key}.csv`, '\uFEFF' + result.csv)
      }

      if (group.hasQuizExport && QUIZ_TYPE_GROUPS[groupKey]) {
        const qResult = await exportQuizQuestionsCsv(groupKey)
        if (qResult.questionsCsv) folder.file('quiz_questions.csv', '\uFEFF' + qResult.questionsCsv)
        if (qResult.optionsCsv) folder.file('quiz_question_options.csv', '\uFEFF' + qResult.optionsCsv)
      }

      if (group.hasCourseExport && COURSE_CATEGORY_GROUPS[groupKey]) {
        const cResult = await exportCoursesCsv(groupKey)
        if (cResult.coursesCsv) folder.file('courses.csv', '\uFEFF' + cResult.coursesCsv)
        if (cResult.lessonsCsv) folder.file('lessons.csv', '\uFEFF' + cResult.lessonsCsv)
      }

      const blob = await zip.generateAsync({ type: 'blob' })
      downloadBlob(blob, `${GROUP_FOLDER_NAMES[groupKey]}_${today()}.zip`)
      setDownloading(null)
    })
  }

  // Full backup ZIP
  function handleFullBackup() {
    setDownloading('full')
    setProgress('準備中...')
    startTransition(async () => {
      const zip = new JSZip()
      let completed = 0
      const totalTables = Object.values(groups).reduce((s, g) => s + g.tables.length, 0)
      const totalQuiz = Object.keys(QUIZ_TYPE_GROUPS).length
      const totalCourses = Object.keys(COURSE_CATEGORY_GROUPS).length
      const total = totalTables + totalQuiz + totalCourses

      for (const groupKey of GROUP_ORDER) {
        const group = groups[groupKey]
        const folder = zip.folder(GROUP_FOLDER_NAMES[groupKey])!

        for (const table of group.tables) {
          setProgress(`${++completed}/${total} — ${table.label}`)
          const result = await exportTableCsv(table.key)
          if (result.csv) folder.file(`${table.key}.csv`, '\uFEFF' + result.csv)
        }

        if (group.hasQuizExport && QUIZ_TYPE_GROUPS[groupKey]) {
          setProgress(`${++completed}/${total} — ${GROUP_LABELS[groupKey]} 試験問題`)
          const qResult = await exportQuizQuestionsCsv(groupKey)
          if (qResult.questionsCsv) folder.file('quiz_questions.csv', '\uFEFF' + qResult.questionsCsv)
          if (qResult.optionsCsv) folder.file('quiz_question_options.csv', '\uFEFF' + qResult.optionsCsv)
        }

        if (group.hasCourseExport && COURSE_CATEGORY_GROUPS[groupKey]) {
          setProgress(`${++completed}/${total} — ${GROUP_LABELS[groupKey]} コース`)
          const cResult = await exportCoursesCsv(groupKey)
          if (cResult.coursesCsv) folder.file('courses.csv', '\uFEFF' + cResult.coursesCsv)
          if (cResult.lessonsCsv) folder.file('lessons.csv', '\uFEFF' + cResult.lessonsCsv)
        }
      }

      setProgress('ZIP生成中...')
      const blob = await zip.generateAsync({ type: 'blob' })
      downloadBlob(blob, `jbridge_backup_${today()}.zip`)
      setDownloading(null)
      setProgress(null)
    })
  }

  return (
    <div className="mt-6 space-y-6">
      {/* Full backup button */}
      <button
        onClick={handleFullBackup}
        disabled={pending}
        className="flex w-full items-center justify-center gap-3 rounded-xl bg-indigo-600 px-6 py-4 text-base font-semibold text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
      >
        <FolderArchive className="h-5 w-5" />
        {downloading === 'full' ? (progress ?? 'バックアップ中...') : '全データ一括バックアップ（ZIP）'}
      </button>

      {/* Groups */}
      {GROUP_ORDER.map(groupKey => {
        const group = groups[groupKey]
        const isExpanded = expandedGroups.has(groupKey)
        const quizGroup = QUIZ_TYPE_GROUPS[groupKey]
        const itemCount = group.tables.length + (group.hasQuizExport ? 1 : 0) + (group.hasCourseExport ? 1 : 0)

        return (
          <div key={groupKey} className="rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-900">
            {/* Group header */}
            <div className="flex items-center justify-between px-5 py-4">
              <button
                onClick={() => toggleGroup(groupKey)}
                className="flex items-center gap-3 text-left"
              >
                <ChevronDown className={`h-4 w-4 text-gray-400 transition-transform ${isExpanded ? '' : '-rotate-90'}`} />
                <div>
                  <h2 className="text-base font-semibold text-gray-900 dark:text-white">
                    {GROUP_LABELS[groupKey]}
                  </h2>
                  <p className="text-xs text-gray-400 dark:text-gray-500">{itemCount}件</p>
                </div>
              </button>
              <button
                onClick={() => handleDownloadGroup(groupKey)}
                disabled={pending}
                className="inline-flex items-center gap-2 rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 disabled:opacity-50 dark:bg-gray-800 dark:text-gray-300 dark:hover:bg-gray-700 transition-colors"
              >
                <FolderArchive className="h-4 w-4" />
                {downloading === `group_${groupKey}` ? '...' : 'ZIP'}
              </button>
            </div>

            {/* Expanded content */}
            {isExpanded && (
              <div className="border-t border-gray-200 dark:border-gray-700">
                {/* Content tables */}
                {group.tables.length > 0 && (
                  <div className="divide-y divide-gray-100 dark:divide-gray-800">
                    {group.tables.map(table => (
                      <div key={table.key} className="flex items-center justify-between px-5 py-3">
                        <div>
                          <span className="text-sm font-medium text-gray-900 dark:text-white">{table.label}</span>
                          <span className="ml-2 text-xs text-gray-400 font-mono">{table.key}</span>
                        </div>
                        <button
                          onClick={() => handleDownloadTable(table.key)}
                          disabled={pending}
                          className="inline-flex items-center gap-1.5 rounded-lg bg-indigo-50 px-3 py-1.5 text-xs font-medium text-indigo-600 hover:bg-indigo-100 disabled:opacity-50 dark:bg-indigo-900/20 dark:text-indigo-400 dark:hover:bg-indigo-900/30 transition-colors"
                        >
                          <Download className="h-3.5 w-3.5" />
                          {downloading === table.key ? '...' : 'CSV'}
                        </button>
                      </div>
                    ))}
                  </div>
                )}

                {/* Course/lesson export */}
                {group.hasCourseExport && COURSE_CATEGORY_GROUPS[groupKey] && (
                  <div className="border-t border-gray-200 dark:border-gray-700">
                    <div className="flex items-center justify-between px-5 py-3 bg-emerald-50/50 dark:bg-emerald-900/10">
                      <div>
                        <span className="text-sm font-medium text-emerald-800 dark:text-emerald-300">コース・レッスン</span>
                        <span className="ml-2 text-xs text-emerald-600/70 dark:text-emerald-400/60">
                          コース + レッスン（2ファイル）
                        </span>
                      </div>
                      <button
                        onClick={() => handleDownloadCourses(groupKey)}
                        disabled={pending}
                        className="inline-flex items-center gap-1.5 rounded-lg bg-emerald-100 px-3 py-1.5 text-xs font-medium text-emerald-700 hover:bg-emerald-200 disabled:opacity-50 dark:bg-emerald-900/30 dark:text-emerald-400 dark:hover:bg-emerald-900/40 transition-colors"
                      >
                        <Download className="h-3.5 w-3.5" />
                        {downloading === `course_${groupKey}` ? '...' : 'CSV'}
                      </button>
                    </div>
                  </div>
                )}

                {/* Quiz questions export */}
                {group.hasQuizExport && quizGroup && (
                  <div className="border-t border-gray-200 dark:border-gray-700">
                    <div className="flex items-center justify-between px-5 py-3 bg-amber-50/50 dark:bg-amber-900/10">
                      <div>
                        <span className="text-sm font-medium text-amber-800 dark:text-amber-300">試験問題</span>
                        <span className="ml-2 text-xs text-amber-600/70 dark:text-amber-400/60">
                          問題 + 選択肢（2ファイル）
                        </span>
                      </div>
                      <button
                        onClick={() => handleDownloadQuiz(groupKey)}
                        disabled={pending}
                        className="inline-flex items-center gap-1.5 rounded-lg bg-amber-100 px-3 py-1.5 text-xs font-medium text-amber-700 hover:bg-amber-200 disabled:opacity-50 dark:bg-amber-900/30 dark:text-amber-400 dark:hover:bg-amber-900/40 transition-colors"
                      >
                        <Download className="h-3.5 w-3.5" />
                        {downloading === `quiz_${groupKey}` ? '...' : 'CSV'}
                      </button>
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>
        )
      })}
    </div>
  )
}
