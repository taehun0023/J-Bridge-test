'use client'

import React from 'react'

interface Option {
  id: string
  option_text: string
  sort_order: number
}

interface QuizQuestionProps {
  questionNumber: number
  totalQuestions: number
  questionText: string
  options: Option[]
  selectedOptionId: string | null
  onSelect: (optionId: string) => void
  explanation?: string | null
  showResult?: boolean
  isCorrect?: boolean
  /** 보기 라벨: 'letter'면 A·B·C·D, 기본 'number'면 1·2·3·4 */
  optionLabel?: 'number' | 'letter'
  /** 긴 지문 블록을 사각 박스로 감싼다(JLPT 모의시험 독해·文章の文法) */
  boxPassages?: boolean
  /** "問題 N / total" 메타 표기 숨김(모의시험은 상단 네비에 있음) */
  hideMeta?: boolean
  /** 같은 지문을 공유하는 문제 그룹 내 번호 (1-based). 있으면 질문 앞에 "問N：" 표시 */
  subQuestionNumber?: number
}

/** 지문으로 간주하는 블록 최소 길이 */
const PASSAGE_MIN_LEN = 70

/** 用法 질문의 타겟 단어를 선택지에서 밑줄 강조 */
function highlightWord(text: string, word: string): React.ReactNode {
  const idx = text.indexOf(word)
  if (idx === -1) return text
  return (
    <>
      {text.slice(0, idx)}
      <u className="underline underline-offset-4 decoration-2">{word}</u>
      {text.slice(idx + word.length)}
    </>
  )
}

/** 본문 내 <u>...</u> 마커를 밑줄로 렌더(漢字読み·言い換え類義). 그 외는 그대로 */
function renderUnderline(text: string, blankAsParen = false) {
  // <u>강조</u> 태그 + 빈칸(연속 언더스코어 _ / 전각 ＿)을 렌더
  const hasUnderTag = text.includes('<u>')
  const hasBlank = /[_＿]{2,}/.test(text)
  if (!hasUnderTag && !hasBlank) return text
  return text.split(/(<u>[\s\S]*?<\/u>|[_＿]{2,})/).map((part, i) => {
    if (part.startsWith('<u>') && part.endsWith('</u>')) {
      return <u key={i} className="underline underline-offset-4 decoration-2">{part.slice(3, -4)}</u>
    }
    if (/^[_＿]{2,}$/.test(part)) {
      // 並べ替え(★포함)는 밑줄 칸, 文法形式(blankAsParen)는 （　　）
      if (blankAsParen) return <span key={i}>（　　）</span>
      return <span key={i} aria-label="空欄" className="mx-1 inline-block w-24 translate-y-[-0.15em] border-b border-zinc-500 dark:border-zinc-300" />
    }
    return part
  })
}

const CODE_INDICATORS = ['{', 'class ', 'function ', 'console.', 'const ', 'import ', 'public ', 'static ', 'void ', 'System.', 'return ', 'int ', 'String ', 'SELECT ', 'UPDATE ', 'DELETE ', 'INSERT ', 'BEGIN;', 'def ', 'print(', 'for (', 'document.', 'useEffect(', 'useState(', 'async ', 'await ', 'Promise.']

/** Convert literal \n sequences (stored as two chars in DB) to actual newlines */
function normalizeNewlines(text: string): string {
  return text.replace(/\\n/g, '\n')
}

function splitQuestionText(text: string): { prompt: string; codeBlock: string | null } {
  // Try \n\n split first (explicit separator)
  const doubleIdx = text.indexOf('\n\n')
  if (doubleIdx !== -1) {
    const after = text.substring(doubleIdx + 2)
    if (CODE_INDICATORS.some(ind => after.includes(ind))) {
      return { prompt: text.substring(0, doubleIdx), codeBlock: after }
    }
  }

  // Fallback: find first line containing a code indicator
  const lines = text.split('\n')
  for (let i = 1; i < lines.length; i++) {
    if (CODE_INDICATORS.some(ind => lines[i].includes(ind))) {
      return { prompt: lines.slice(0, i).join('\n'), codeBlock: lines.slice(i).join('\n') }
    }
  }

  return { prompt: text, codeBlock: null }
}

/** \n\n로 나뉜 블록 중, 연속된 지문(장문) 블록을 하나로 합친다.
 *  독해 지문이 단락마다 개별 박스로 쪼개지는 것을 막고 하나의 박스로 묶기 위함. */
function groupBlocks(text: string): { isPassage: boolean; text: string }[] {
  const blocks = text.split('\n\n').filter(b => b.trim())
  const out: { isPassage: boolean; text: string }[] = []
  blocks.forEach((blk, idx) => {
    const trimmed = blk.trim()
    // 마지막 블록은 항상 질문 프롬프트 — 길이와 무관하게 박스 제외
    if (idx === blocks.length - 1) {
      out.push({ isPassage: false, text: blk })
      return
    }
    // 문장 중간에 빈칸 번호([41] / ［41］)가 있으면 지문 단락
    const hasEmbeddedBlank = /[^\[［][\[［]\d+[\]］]/.test(trimmed)
    const prev = out[out.length - 1]
    // 다음 블록이 장문이면, 짧은 현재 블록도 지문 헤더로 간주 (田中様・【文章A】 등)
    // 단, 지시문(。로 끝나는 것)은 제외
    const nextBlk = blocks[idx + 1]
    const isInstruction = /。$/.test(trimmed)
    const nextIsPassage = !isInstruction
      && nextBlk != null
      && idx + 1 < blocks.length - 1
      && nextBlk.trim().length >= PASSAGE_MIN_LEN
    // 앞 블록이 passage였으면 짧은 섹션도 같은 박스로 합침(문서형 지문 대응)
    const isPassage = trimmed.length >= PASSAGE_MIN_LEN || hasEmbeddedBlank || (prev?.isPassage ?? false) || nextIsPassage
    if (isPassage && prev?.isPassage) {
      prev.text += '\n\n' + blk
    } else {
      out.push({ isPassage, text: blk })
    }
  })
  return out
}

export default function QuizQuestion({
  questionNumber,
  totalQuestions,
  questionText,
  options,
  selectedOptionId,
  onSelect,
  showResult,
  isCorrect,
  optionLabel = 'number',
  boxPassages = false,
  hideMeta = false,
  subQuestionNumber,
}: QuizQuestionProps) {
  const { prompt: promptText, codeBlock } = splitQuestionText(normalizeNewlines(questionText))

  // ★ 없는 gengo 문제(文法形式 26-35번)만 빈칸을 （　　）로 표시
  const blankAsParen = boxPassages && !promptText.includes('★')

  // 用法(問題4)パターン検出: 最終ブロックが単語1語 → 選択肢内で下線ハイライト
  const usageTargetWord = React.useMemo(() => {
    if (!boxPassages) return null
    const blocks = groupBlocks(promptText)
    const last = blocks[blocks.length - 1]
    if (!last || last.isPassage) return null
    const t = last.text.trim()
    // 단어만 있는 블록: 짧고, 공백/문장부호 없음
    if (t.length <= 12 && !t.includes(' ') && !t.includes('　') && !t.includes('。') && !t.includes('？') && !t.includes('（') && !t.includes('\n')) {
      return t
    }
    return null
  }, [boxPassages, promptText])

  function handleClick(optionId: string) {
    if (showResult) return
    if (selectedOptionId === optionId) {
      onSelect('')
    } else {
      onSelect(optionId)
    }
  }

  return (
    <div>
      <div className={`mb-4 flex items-center justify-between ${hideMeta ? 'hidden' : ''}`}>
        <span className="text-sm font-medium text-zinc-500 dark:text-zinc-400">
          問題 {questionNumber} / {totalQuestions}
        </span>
        {showResult !== undefined && selectedOptionId && (
          <span className={`rounded-full px-3 py-1 text-xs font-medium ${
            isCorrect
              ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20 dark:bg-emerald-500/10 dark:text-emerald-400'
              : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20 dark:bg-red-500/10 dark:text-red-400'
          }`}>
            {isCorrect ? '正解' : '不正解'}
          </span>
        )}
      </div>

      {boxPassages && !codeBlock ? (
        <div className="space-y-3">
          {groupBlocks(promptText).map((blk, i, arr) => {
            const isLast = i === arr.length - 1
            const stripped = blk.text.trim().replace(/^問([0-9０-９]+|い)?[：　 ]\s*/, '')
            const text = isLast && subQuestionNumber
              ? `問${subQuestionNumber}：${stripped}`
              : blk.text
            return blk.isPassage ? (
              <div key={i} className="rounded-xl border border-gray-300 bg-zinc-50/80 p-4 text-sm leading-7 text-zinc-800 whitespace-pre-line dark:border-white/[0.14] dark:bg-white/[0.03] dark:text-zinc-200">
                {renderUnderline(text, blankAsParen)}
              </div>
            ) : (
              <h3 key={i} className="text-base font-semibold text-zinc-900 dark:text-zinc-100 whitespace-pre-line">{renderUnderline(text, blankAsParen)}</h3>
            )
          })}
        </div>
      ) : (
        <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100 whitespace-pre-line">{renderUnderline(promptText)}</h3>
      )}

      {codeBlock && (
        <pre className="mt-3 rounded-xl bg-zinc-50 border border-zinc-200 p-4 font-mono text-sm text-zinc-800 overflow-x-auto dark:bg-zinc-900 dark:border-white/[0.08] dark:text-zinc-300">
          <code>{codeBlock}</code>
        </pre>
      )}

      <div className="mt-4 space-y-2">
        {options
          .sort((a, b) => a.sort_order - b.sort_order)
          .map((option) => {
            const isSelected = selectedOptionId === option.id
            let borderClass = 'border-gray-200/60 hover:border-gray-300 dark:border-white/[0.08] dark:hover:border-white/[0.15]'
            if (isSelected && !showResult) {
              borderClass = 'border-indigo-500 bg-indigo-500/5 dark:border-indigo-500 dark:bg-indigo-500/10'
            } else if (showResult && isSelected) {
              borderClass = isCorrect
                ? 'border-emerald-500 bg-emerald-500/5 dark:border-emerald-500 dark:bg-emerald-500/10'
                : 'border-red-500 bg-red-500/5 dark:border-red-500 dark:bg-red-500/10'
            }

            return (
              <button
                key={option.id}
                onClick={() => handleClick(option.id)}
                disabled={showResult === true}
                className={`flex w-full items-center gap-3 rounded-xl border-2 px-4 py-3 text-left transition-colors backdrop-blur-md ${borderClass} disabled:cursor-default`}
              >
                <div className={`flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-xs font-bold ${
                  isSelected
                    ? 'bg-indigo-600 text-white'
                    : 'border border-gray-200 bg-gray-50 text-gray-500 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-400'
                }`}>
                  {optionLabel === 'letter' ? String.fromCharCode(64 + option.sort_order) : option.sort_order}
                </div>
                <span className="text-sm text-zinc-800 dark:text-zinc-200 whitespace-pre-line">
                  {usageTargetWord
                    ? highlightWord(normalizeNewlines(option.option_text), usageTargetWord)
                    : normalizeNewlines(option.option_text)}
                </span>
              </button>
            )
          })}
      </div>
    </div>
  )
}
