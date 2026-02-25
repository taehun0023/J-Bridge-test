'use client'

import { useState, useRef, useCallback, useEffect } from 'react'
import Badge from '@/components/ui/Badge'
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

export default function ListeningScriptList({ items, level, masteredIds = [], onToggleMastery }: Props) {
  const [expandedId, setExpandedId] = useState<string | null>(null)
  const [showTranslation, setShowTranslation] = useState<Record<string, boolean>>({})
  const [playingId, setPlayingId] = useState<string | null>(null)
  const [playState, setPlayState] = useState<PlayState>('idle')
  const [speed, setSpeed] = useState(1.0)
  const [errorId, setErrorId] = useState<string | null>(null)
  const audioRef = useRef<HTMLAudioElement | null>(null)
  const audioBlobUrlRef = useRef<string | null>(null)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))

  useEffect(() => {
    setLocalMastered(new Set(masteredIds))
  }, [masteredIds])

  function handleToggle(e: React.MouseEvent, itemId: string) {
    e.stopPropagation()
    e.preventDefault()
    const next = new Set(localMastered)
    if (next.has(itemId)) {
      next.delete(itemId)
    } else {
      next.add(itemId)
    }
    setLocalMastered(next)
    onToggleMastery?.(itemId)
  }

  function toggleTranslation(id: string) {
    setShowTranslation(prev => ({ ...prev, [id]: !prev[id] }))
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
            onClick={() => setExpandedId(expandedId === item.id ? null : item.id)}
            onKeyDown={(e) => { if (e.key === 'Enter' || e.key === ' ') setExpandedId(expandedId === item.id ? null : item.id) }}
            className="flex w-full cursor-pointer items-center gap-4 text-left"
          >
            {onToggleMastery && (
              <button
                onClick={(e) => handleToggle(e, item.id)}
                title={localMastered.has(item.id) ? '学習完了' : '未完了'}
                className="shrink-0"
              >
                {localMastered.has(item.id) ? (
                  <svg className="h-5 w-5 text-emerald-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                  </svg>
                ) : (
                  <svg className="h-5 w-5 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 20 20" stroke="currentColor">
                    <circle cx="10" cy="10" r="7" strokeWidth="2" />
                  </svg>
                )}
              </button>
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
              <div className="flex items-center gap-3">
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

              {/* Speakers */}
              {item.speakers && item.speakers.length > 0 && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">話者</p>
                  <div className="mt-1 flex flex-wrap gap-1">
                    {item.speakers.map((s, i) => (
                      <span key={i} className="rounded-full bg-purple-50 px-2 py-0.5 text-xs text-purple-700 dark:bg-purple-900/30 dark:text-purple-300">
                        {s}
                      </span>
                    ))}
                  </div>
                </div>
              )}

              {/* Script text — fix \n literal bug */}
              <div>
                <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">スクリプト</p>
                <p className="mt-1 whitespace-pre-line text-sm leading-relaxed text-gray-900 dark:text-white">{item.script.replace(/\\n/g, '\n')}</p>
              </div>

              {/* Vocabulary notes */}
              {item.vocabulary_notes.length > 0 && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">語彙ノート</p>
                  <div className="mt-1 overflow-x-auto">
                    <table className="w-full text-sm">
                      <tbody>
                        {item.vocabulary_notes.map((v, i) => (
                          <tr key={i} className="border-b border-gray-200 last:border-0 dark:border-gray-600">
                            <td className="py-1 pr-3 font-medium text-gray-900 dark:text-white">{v.word}</td>
                            <td className="py-1 pr-3 text-gray-500 dark:text-gray-400">{v.reading}</td>
                            <td className="py-1 text-gray-600 dark:text-gray-300">{v.meaning_ko}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              )}

              {/* Korean translation toggle — fix \n literal bug */}
              {item.translation_ko && (
                <div>
                  <button
                    onClick={() => toggleTranslation(item.id)}
                    className="text-xs font-medium text-blue-600 hover:text-blue-700 dark:text-blue-400 dark:hover:text-blue-300"
                  >
                    {showTranslation[item.id] ? '翻訳を隠す' : '韓国語翻訳を見る'}
                  </button>
                  {showTranslation[item.id] && (
                    <p className="mt-1 whitespace-pre-line text-sm text-gray-600 dark:text-gray-300">{item.translation_ko.replace(/\\n/g, '\n')}</p>
                  )}
                </div>
              )}
            </div>
          )}
        </div>
      ))}
    </div>
  )
}
