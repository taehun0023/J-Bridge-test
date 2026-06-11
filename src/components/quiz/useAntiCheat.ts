'use client'

import { useEffect } from 'react'

const PREVENTED_EVENTS = ['dragstart', 'drop', 'copy', 'cut', 'selectstart', 'contextmenu'] as const

/** Prevent copy/drag/select/right-click while an exam or quiz is active.
 *  Shared by ExamClient and QuizTaker — pass false to detach (e.g. review mode). */
export function useAntiCheat(active: boolean) {
  useEffect(() => {
    if (!active) return
    const prevent = (e: Event) => e.preventDefault()
    for (const eventName of PREVENTED_EVENTS) document.addEventListener(eventName, prevent)
    return () => {
      for (const eventName of PREVENTED_EVENTS) document.removeEventListener(eventName, prevent)
    }
  }, [active])
}
