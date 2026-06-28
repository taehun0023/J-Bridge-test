'use client'

import { useState, useRef, useCallback, useEffect } from 'react'
import Badge from '@/components/ui/Badge'
import MasteryCheck from './MasteryCheck'
import { emitMastery } from './MasteryProgress'
import { logStudyAttempt } from '@/app/actions/study-log'
import type { JlptLevel, JlptListeningScript, ListeningScriptType } from '@/lib/supabase/types'

interface Props {
  items: JlptListeningScript[]
  level: JlptLevel
  masteredIds?: string[]
  onToggleMastery?: (id: string) => void
}

const typeLabels: Record<ListeningScriptType, string> = {
  dialogue: '会話',
  monologue: '独話',
  announcement: 'アナウンス',
  instruction: '説明',
  meeting: '会議',
  phone_call: '電話',
}

type PlayState = 'idle' | 'loading' | 'playing' | 'paused'

// 話者ごとの色（登場順に循環）
const SPEAKER_STYLES = [
  { avatar: 'bg-blue-500', name: 'text-blue-700 dark:text-blue-300', bubble: 'bg-blue-50 text-gray-800 dark:bg-blue-900/30 dark:text-blue-50' },
  { avatar: 'bg-emerald-500', name: 'text-emerald-700 dark:text-emerald-300', bubble: 'bg-emerald-50 text-gray-800 dark:bg-emerald-900/30 dark:text-emerald-50' },
  { avatar: 'bg-amber-500', name: 'text-amber-700 dark:text-amber-300', bubble: 'bg-amber-50 text-gray-800 dark:bg-amber-900/30 dark:text-amber-50' },
  { avatar: 'bg-purple-500', name: 'text-purple-700 dark:text-purple-300', bubble: 'bg-purple-50 text-gray-800 dark:bg-purple-900/30 dark:text-purple-50' },
  { avatar: 'bg-rose-500', name: 'text-rose-700 dark:text-rose-300', bubble: 'bg-rose-50 text-gray-800 dark:bg-rose-900/30 dark:text-rose-50' },
  { avatar: 'bg-cyan-500', name: 'text-cyan-700 dark:text-cyan-300', bubble: 'bg-cyan-50 text-gray-800 dark:bg-cyan-900/30 dark:text-cyan-50' },
]

type DialogueLine = { speaker: string | null; text: string }

// "話者：セリフ" 形式をパース。コロン無し行は地の文として speaker=null
function parseDialogue(script: string): DialogueLine[] {
  return script
    .replace(/\\n/g, '\n')
    .split('\n')
    .map((raw) => {
      const line = raw.trim()
      if (!line) return null
      const m = line.match(/^([^：:]{1,12})[：:]\s*(.*)$/)
      if (m && m[2]) return { speaker: m[1].trim(), text: m[2].trim() }
      return { speaker: null, text: line }
    })
    .filter((l): l is DialogueLine => l !== null)
}

export default function ListeningScriptList({ items, level, masteredIds = [], onToggleMastery }: Props) {
  const [expandedId, setExpandedId] = useState<string | null>(null)
  const [modalTrans, setModalTrans] = useState(false)
  const [playingId, setPlayingId] = useState<string | null>(null)
  const [playState, setPlayState] = useState<PlayState>('idle')
  const [speed, setSpeed] = useState(1.0)
  const [errorId, setErrorId] = useState<string | null>(null)
  const audioRef = useRef<HTMLAudioElement | null>(null)
  const audioBlobUrlRef = useRef<string | null>(null)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))

  const [answers, setAnswers] = useState<Record<string, number>>({})
  const [results, setResults] = useState<Record<string, 'correct' | 'wrong'>>({})
  const [revealed, setRevealed] = useState<Record<string, boolean>>({})
  const [scriptModalId, setScriptModalId] = useState<string | null>(null)
  const shownAtRef = useRef<Record<string, number>>({})

  useEffect(() => {
    setLocalMastered(new Set(masteredIds))
  }, [masteredIds])

  useEffect(() => {
    setModalTrans(false)
    if (!scriptModalId) return
    const onKey = (e: KeyboardEvent) => { if (e.key === 'Escape') setScriptModalId(null) }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [scriptModalId])

  function submitQuiz(item: JlptListeningScript) {
    const sel = answers[item.id]
    if (sel == null || !item.comprehension || results[item.id]) return
    const ok = sel === item.comprehension.answer
    setResults(prev => ({ ...prev, [item.id]: ok ? 'correct' : 'wrong' }))
    const start = shownAtRef.current[item.id]
    void logStudyAttempt({ contentType: 'jlpt_listening', itemId: item.id, isCorrect: ok, answerText: item.comprehension.options[sel], durationMs: start ? Date.now() - start : undefined })
    if (!ok) setRevealed(prev => ({ ...prev, [item.id]: true }))
    if (ok && !localMastered.has(item.id)) {
      setLocalMastered(prev => { const n = new Set(prev); n.add(item.id); return n })
      onToggleMastery?.(item.id); emitMastery(1)
    } else if (!ok && localMastered.has(item.id)) {
      // 暗記済みを再テストして不正解 → リアルタイムでチェック解除
      setLocalMastered(prev => { const n = new Set(prev); n.delete(item.id); return n })
      onToggleMastery?.(item.id); emitMastery(-1)
    }
  }

  const cleanupAudio = useCallback(() => {
    if (audioRef.current) {
      audioRef.current.pause()
      audioRef.current.removeAttribute('src')
      audioRef.current = null
    }
    if (audioBlobUrlRef.current) {
      URL.revokeObjectURL(audioBlobUrlRef.current)
      audioBlobUrlRef.current = null
    }
  }, [])

  const handlePlay = useCallback(async (id: string, text: string) => {
    // If same item is playing, toggle pause/resume
    if (playingId === id && audioRef.current) {
      if (playState === 'playing') {
        audioRef.current.pause()
        setPlayState('paused')
        return
      }
      if (playState === 'paused') {
        audioRef.current.play()
        setPlayState('playing')
        return
      }
    }

    // Stop any current playback
    cleanupAudio()
    setPlayingId(id)
    setPlayState('loading')
    setErrorId(null)

    try {
      const res = await fetch('/api/tts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ text, speed }),
      })

      if (!res.ok) {
        setErrorId(id)
        throw new Error('TTS request failed')
      }

      const blob = await res.blob()
      const url = URL.createObjectURL(blob)
      audioBlobUrlRef.current = url

      const audio = new Audio(url)
      audioRef.current = audio

      audio.onended = () => {
        setPlayState('idle')
        setPlayingId(null)
        cleanupAudio()
      }

      audio.onerror = () => {
        setPlayState('idle')
        setPlayingId(null)
        cleanupAudio()
      }

      await audio.play()
      setPlayState('playing')
    } catch {
      setPlayState('idle')
      setPlayingId(null)
      cleanupAudio()
    }
  }, [playingId, playState, speed, cleanupAudio])

  const handleStop = useCallback(() => {
    cleanupAudio()
    setPlayState('idle')
    setPlayingId(null)
  }, [cleanupAudio])

  return (
    <div className="divide-y divide-gray-100 dark:divide-gray-700">
      {items.map((item) => (
        <div key={item.id} className="py-3">
          <div
            role="button"
            tabIndex={0}
            onClick={() => { const opening = expandedId !== item.id; setExpandedId(opening ? item.id : null); if (opening && !shownAtRef.current[item.id]) shownAtRef.current[item.id] = Date.now() }}
            onKeyDown={(e) => { if (e.key === 'Enter' || e.key === ' ') { const opening = expandedId !== item.id; setExpandedId(opening ? item.id : null); if (opening && !shownAtRef.current[item.id]) shownAtRef.current[item.id] = Date.now() } }}
            className="flex w-full cursor-pointer items-center gap-4 text-left"
          >
            {onToggleMastery && (
              <MasteryCheck done={localMastered.has(item.id)} title={localMastered.has(item.id) ? '学習完了' : '未完了（聴解チェックに正解で完了）'} />
            )}
            <div className="min-w-0 flex-1">
              <div className="flex items-center gap-2">
                <span className="text-lg font-semibold text-gray-900 dark:text-white">{item.title}</span>
                <span className="rounded-full bg-purple-50 px-2 py-0.5 text-xs text-purple-700 dark:bg-purple-900/30 dark:text-purple-300">
                  {typeLabels[item.script_type]}
                </span>
              </div>
              {item.situation && (
                <span className="text-xs text-gray-400 dark:text-gray-500">{item.situation}</span>
              )}
            </div>
            <Badge label={level} variant="jlpt" />
            <svg
              className={`h-5 w-5 shrink-0 text-gray-400 transition-transform ${expandedId === item.id ? 'rotate-180' : ''}`}
              fill="none" viewBox="0 0 24 24" stroke="currentColor"
            >
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
            </svg>
          </div>

          {expandedId === item.id && (
            <div className="mt-3 space-y-3 rounded-lg bg-gray-50 p-4 dark:bg-gray-700">
              {/* TTS Playback Controls */}
              <div className="flex flex-wrap items-center gap-2 sm:gap-3">
                {playingId === item.id && playState === 'loading' ? (
                  <button
                    disabled
                    className="flex items-center gap-2 rounded-lg bg-blue-100 px-3 py-1.5 text-sm font-medium text-blue-400 dark:bg-blue-900/30 dark:text-blue-300"
                  >
                    <svg className="h-4 w-4 animate-spin" viewBox="0 0 24 24" fill="none">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                    </svg>
                    読み込み中...
                  </button>
                ) : playingId === item.id && playState === 'playing' ? (
                  <>
                    <button
                      onClick={() => handlePlay(item.id, item.script)}
                      className="flex items-center gap-2 rounded-lg bg-blue-600 px-3 py-1.5 text-sm font-medium text-white hover:bg-blue-700"
                    >
                      <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                        <rect x="6" y="4" width="4" height="16" />
                        <rect x="14" y="4" width="4" height="16" />
                      </svg>
                      一時停止
                    </button>
                    <button
                      onClick={handleStop}
                      className="flex items-center gap-2 rounded-lg bg-gray-200 px-3 py-1.5 text-sm font-medium text-gray-700 hover:bg-gray-300 dark:bg-gray-600 dark:text-gray-200 dark:hover:bg-gray-500"
                    >
                      <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                        <rect x="6" y="6" width="12" height="12" />
                      </svg>
                      停止
                    </button>
                  </>
                ) : playingId === item.id && playState === 'paused' ? (
                  <>
                    <button
                      onClick={() => handlePlay(item.id, item.script)}
                      className="flex items-center gap-2 rounded-lg bg-blue-600 px-3 py-1.5 text-sm font-medium text-white hover:bg-blue-700"
                    >
                      <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                        <polygon points="5,3 19,12 5,21" />
                      </svg>
                      再開
                    </button>
                    <button
                      onClick={handleStop}
                      className="flex items-center gap-2 rounded-lg bg-gray-200 px-3 py-1.5 text-sm font-medium text-gray-700 hover:bg-gray-300 dark:bg-gray-600 dark:text-gray-200 dark:hover:bg-gray-500"
                    >
                      <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                        <rect x="6" y="6" width="12" height="12" />
                      </svg>
                      停止
                    </button>
                  </>
                ) : (
                  <button
                    onClick={() => handlePlay(item.id, item.script)}
                    className="flex items-center gap-2 rounded-lg bg-blue-600 px-3 py-1.5 text-sm font-medium text-white hover:bg-blue-700"
                  >
                    <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                      <polygon points="5,3 19,12 5,21" />
                    </svg>
                    再生
                  </button>
                )}

                <select
                  value={speed}
                  onChange={(e) => setSpeed(Number(e.target.value))}
                  className="rounded-lg border border-gray-300 bg-white px-2 py-1.5 text-sm text-gray-700 dark:border-gray-600 dark:bg-gray-600 dark:text-gray-200"
                >
                  <option value={0.75}>0.75x</option>
                  <option value={1.0}>1.0x</option>
                  <option value={1.25}>1.25x</option>
                </select>

                {/* 스크립트 보기 — 오른쪽 상단 */}
                <button
                  onClick={() => setScriptModalId(item.id)}
                  className="ml-auto inline-flex items-center gap-1.5 rounded-lg border border-purple-300 bg-white px-3 py-1.5 text-sm font-medium text-purple-700 hover:bg-purple-50 dark:border-purple-700 dark:bg-gray-800 dark:text-purple-300 dark:hover:bg-gray-700"
                >
                  <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 4v-4z" />
                  </svg>
                  スクリプトを見る
                </button>
              </div>

              {/* Error message */}
              {errorId === item.id && (
                <p className="text-sm text-red-600 dark:text-red-400">音声の読み込みに失敗しました。しばらくしてからもう一度お試しください。</p>
              )}

              {/* Situation */}
              {item.situation && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">場面</p>
                  <p className="mt-0.5 text-sm text-gray-700 dark:text-gray-300">{item.situation}</p>
                </div>
              )}

              {/* 聴解チェック(객관식) — 제일 아래 */}
              {item.comprehension && (
                <div className="border-t border-gray-200 pt-3 dark:border-gray-600">
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">聴解チェック</p>
                  <p className="mt-1 text-sm font-medium text-gray-900 dark:text-white">{item.comprehension.question}</p>
                  <div className="mt-2 space-y-1.5">
                    {item.comprehension.options.map((opt, i) => {
                      const sel = answers[item.id] === i
                      const r = results[item.id]
                      let cls = 'border-gray-200 dark:border-gray-600'
                      if (r === 'correct') {
                        if (i === item.comprehension!.answer) cls = 'border-emerald-500 bg-emerald-50 dark:bg-emerald-900/20'
                      } else if (r === 'wrong') {
                        if (sel) cls = 'border-red-500 bg-red-50 dark:bg-red-900/20'
                      } else if (sel) cls = 'border-indigo-500 bg-indigo-50 dark:bg-indigo-900/20'
                      return (
                        <button key={i} disabled={r === 'correct'}
                          onClick={() => { if (results[item.id] === 'wrong') setResults(prev => { const n = { ...prev }; delete n[item.id]; return n }); setAnswers(prev => ({ ...prev, [item.id]: i })) }}
                          className={`block w-full rounded-lg border px-3 py-2 text-left text-sm text-gray-800 dark:text-gray-200 ${cls}`}>
                          {i + 1}. {opt}
                        </button>
                      )
                    })}
                  </div>
                  {!results[item.id] ? (
                    <button onClick={() => submitQuiz(item)} disabled={answers[item.id] == null}
                      className="mt-2 rounded-lg bg-indigo-600 px-4 py-1.5 text-sm font-semibold text-white hover:bg-indigo-500 disabled:opacity-50">確認</button>
                  ) : results[item.id] === 'correct' ? (
                    <p className="mt-2 text-sm font-semibold text-emerald-600">正解！完了チェックが付きました</p>
                  ) : (
                    <p className="mt-2 text-sm font-semibold text-red-600">不正解です。下のスクリプトを確認して選び直してください。</p>
                  )}
                </div>
              )}
            </div>
          )}
        </div>
      ))}

      {/* 스크립트 팝업(모달) — 대화형식 */}
      {(() => {
        const modalItem = items.find((i) => i.id === scriptModalId)
        if (!modalItem) return null
        const lines = parseDialogue(modalItem.script)
        const transLines = modalItem.translation_ko ? parseDialogue(modalItem.translation_ko) : []
        const speakerOrder = [...new Set(lines.map((l) => l.speaker).filter((s): s is string => !!s))]
        const styleOf = (speaker: string) => SPEAKER_STYLES[Math.max(0, speakerOrder.indexOf(speaker)) % SPEAKER_STYLES.length]
        return (
          <div
            className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4"
            onClick={() => setScriptModalId(null)}
          >
            <div
              className="flex max-h-[85vh] w-full max-w-lg flex-col overflow-hidden rounded-2xl bg-white shadow-xl dark:bg-gray-800"
              onClick={(e) => e.stopPropagation()}
            >
              {/* 헤더 */}
              <div className="flex items-center justify-between border-b border-gray-100 px-5 py-3 dark:border-gray-700">
                <div className="flex items-center gap-2">
                  <span className="text-base font-semibold text-gray-900 dark:text-white">{modalItem.title}</span>
                  <span className="rounded-full bg-purple-50 px-2 py-0.5 text-xs text-purple-700 dark:bg-purple-900/30 dark:text-purple-300">
                    {typeLabels[modalItem.script_type]}
                  </span>
                </div>
                <div className="flex items-center gap-1.5">
                  {transLines.length > 0 && (
                    <button
                      onClick={() => setModalTrans((v) => !v)}
                      className={`rounded-lg border px-2.5 py-1 text-xs font-medium ${modalTrans
                        ? 'border-indigo-500 bg-indigo-50 text-indigo-700 dark:border-indigo-400 dark:bg-indigo-900/30 dark:text-indigo-300'
                        : 'border-gray-300 bg-white text-gray-600 hover:bg-gray-50 dark:border-gray-600 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600'}`}
                    >
                      {modalTrans ? '日本語のみ' : '한글 번역'}
                    </button>
                  )}
                  <button
                    onClick={() => setScriptModalId(null)}
                    className="rounded-lg p-1 text-gray-400 hover:bg-gray-100 hover:text-gray-600 dark:hover:bg-gray-700 dark:hover:text-gray-200"
                    aria-label="閉じる"
                  >
                    <svg className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>
              </div>

              {/* 대화 본문 */}
              <div className="space-y-3 overflow-y-auto px-5 py-4">
                {lines.map((line, i) => {
                  const trans = modalTrans ? transLines[i]?.text : null
                  if (!line.speaker) {
                    return (
                      <div key={i}>
                        <p className="text-sm leading-relaxed text-gray-700 dark:text-gray-200">{line.text}</p>
                        {trans && <p className="mt-0.5 text-sm leading-relaxed text-indigo-600 dark:text-indigo-300">{trans}</p>}
                      </div>
                    )
                  }
                  const st = styleOf(line.speaker)
                  return (
                    <div key={i} className="flex gap-2.5">
                      <div className={`flex h-8 w-8 shrink-0 items-center justify-center rounded-full text-sm font-bold text-white ${st.avatar}`}>
                        {line.speaker.charAt(0)}
                      </div>
                      <div className="min-w-0 flex-1">
                        <p className={`mb-0.5 text-xs font-medium ${st.name}`}>{line.speaker}</p>
                        <div className={`inline-block rounded-2xl rounded-tl-sm px-3 py-2 text-sm leading-relaxed ${st.bubble}`}>
                          {line.text}
                        </div>
                        {trans && (
                          <p className="mt-1 text-sm leading-relaxed text-indigo-600 dark:text-indigo-300">{trans}</p>
                        )}
                      </div>
                    </div>
                  )
                })}
              </div>
            </div>
          </div>
        )
      })()}
    </div>
  )
}
