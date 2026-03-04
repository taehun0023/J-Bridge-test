'use client'

import { useEffect, useRef, useState, useCallback, Suspense } from 'react'
import { usePathname, useSearchParams } from 'next/navigation'

function NavigationProgressInner() {
  const pathname = usePathname()
  const searchParams = useSearchParams()
  const [isNavigating, setIsNavigating] = useState(false)
  const [progress, setProgress] = useState(0)
  const prevPath = useRef(pathname + searchParams.toString())
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null)

  const stopProgress = useCallback(() => {
    if (timerRef.current) {
      clearInterval(timerRef.current)
      timerRef.current = null
    }
    setProgress(100)
    setTimeout(() => {
      setIsNavigating(false)
      setProgress(0)
    }, 300)
  }, [])

  const startProgress = useCallback(() => {
    setIsNavigating(true)
    setProgress(13)
    if (timerRef.current) clearInterval(timerRef.current)
    timerRef.current = setInterval(() => {
      setProgress(p => {
        if (p >= 90) return p
        const increment = p < 30 ? 8 : p < 60 ? 4 : 2
        return Math.min(p + increment, 90)
      })
    }, 300)
  }, [])

  // Detect navigation completion
  useEffect(() => {
    const current = pathname + searchParams.toString()
    if (prevPath.current !== current) {
      stopProgress()
      prevPath.current = current
    }
  }, [pathname, searchParams, stopProgress])

  // Intercept clicks on internal links
  useEffect(() => {
    const handleClick = (e: MouseEvent) => {
      const anchor = (e.target as HTMLElement).closest('a')
      if (!anchor) return
      // Skip external, hash, mailto, download links
      if (anchor.target === '_blank' || anchor.hasAttribute('download')) return
      const href = anchor.getAttribute('href')
      if (!href || href.startsWith('http') || href.startsWith('#') || href.startsWith('mailto:')) return

      // Skip same-page links
      try {
        const url = new URL(href, window.location.origin)
        const current = pathname + searchParams.toString()
        const next = url.pathname + url.searchParams.toString()
        if (current === next) return
      } catch {
        return
      }

      startProgress()
    }

    document.addEventListener('click', handleClick, true)
    return () => document.removeEventListener('click', handleClick, true)
  }, [pathname, searchParams, startProgress])

  // Toggle navigating class on body (cursor handled via CSS)
  useEffect(() => {
    document.body.classList.toggle('navigating', isNavigating)
    return () => { document.body.classList.remove('navigating') }
  }, [isNavigating])

  // Cleanup timer on unmount
  useEffect(() => {
    return () => {
      if (timerRef.current) clearInterval(timerRef.current)
    }
  }, [])

  if (!isNavigating && progress === 0) return null

  return (
    <div className="fixed top-0 left-0 right-0 z-[9999] h-[3px]" aria-hidden="true">
      <div
        className="h-full rounded-r-full bg-indigo-500 shadow-[0_0_8px_rgba(99,102,241,0.6)] transition-all ease-out"
        style={{
          width: `${progress}%`,
          transitionDuration: progress >= 100 ? '200ms' : '400ms',
          opacity: progress >= 100 ? 0 : 1,
        }}
      />
    </div>
  )
}

export default function NavigationProgress() {
  return (
    <Suspense>
      <NavigationProgressInner />
    </Suspense>
  )
}
