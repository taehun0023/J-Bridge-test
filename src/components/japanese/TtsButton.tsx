'use client'

import { useState, useRef, useCallback } from 'react'

interface TtsButtonProps {
  text: string
  className?: string
}

export default function TtsButton({ text, className = '' }: TtsButtonProps) {
  const [state, setState] = useState<'idle' | 'loading' | 'playing'>('idle')
  const audioRef = useRef<HTMLAudioElement | null>(null)
  const blobUrlRef = useRef<string | null>(null)

  const cleanup = useCallback(() => {
    if (audioRef.current) {
      audioRef.current.pause()
      audioRef.current.removeAttribute('src')
      audioRef.current = null
    }
    if (blobUrlRef.current) {
      URL.revokeObjectURL(blobUrlRef.current)
      blobUrlRef.current = null
    }
  }, [])

  const handleClick = useCallback(async (e: React.MouseEvent) => {
    e.stopPropagation()

    if (state === 'playing') {
      cleanup()
      setState('idle')
      return
    }

    cleanup()
    setState('loading')

    try {
      const res = await fetch('/api/tts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ text }),
      })

      if (!res.ok) throw new Error('TTS failed')

      const blob = await res.blob()
      const url = URL.createObjectURL(blob)
      blobUrlRef.current = url

      const audio = new Audio(url)
      audioRef.current = audio

      audio.onended = () => {
        setState('idle')
        cleanup()
      }
      audio.onerror = () => {
        setState('idle')
        cleanup()
      }

      await audio.play()
      setState('playing')
    } catch {
      setState('idle')
      cleanup()
    }
  }, [state, text, cleanup])

  return (
    <button
      onClick={handleClick}
      className={`inline-flex items-center justify-center rounded p-1 text-gray-400 hover:text-blue-500 dark:text-gray-500 dark:hover:text-blue-400 ${className}`}
      title="発音を聞く"
    >
      {state === 'loading' ? (
        <svg className="h-4 w-4 animate-spin" viewBox="0 0 24 24" fill="none">
          <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
          <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
        </svg>
      ) : state === 'playing' ? (
        <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
          <rect x="6" y="6" width="12" height="12" />
        </svg>
      ) : (
        <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
          <path strokeLinecap="round" strokeLinejoin="round" d="M15.536 8.464a5 5 0 010 7.072M17.95 6.05a8 8 0 010 11.9M6.5 8.788v6.424a.5.5 0 00.757.429l4.964-3.212a.5.5 0 000-.858L7.257 8.36a.5.5 0 00-.757.429z" />
        </svg>
      )}
    </button>
  )
}
