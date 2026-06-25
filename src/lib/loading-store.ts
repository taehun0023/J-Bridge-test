'use client'

import { useTransition, useEffect, useSyncExternalStore, type TransitionStartFunction } from 'react'

// ─── 전역 로딩 카운터 (동시 다발 처리 지원) ───
let activeCount = 0
const listeners = new Set<() => void>()
function notify() { for (const l of listeners) l() }

function subscribe(cb: () => void) {
  listeners.add(cb)
  return () => { listeners.delete(cb) }
}
function getSnapshot() { return activeCount > 0 }
function getServerSnapshot() { return false }

/** 전역 로딩 여부 (오버레이 컴포넌트용) */
export function useGlobalLoading(): boolean {
  return useSyncExternalStore(subscribe, getSnapshot, getServerSnapshot)
}

/**
 * `useTransition` 드롭인 대체. pending 동안 전역 로딩 카운트를 올려
 * 화면 전체에 반투명 로딩 오버레이가 표시되게 한다.
 * 반환값/사용법은 useTransition과 100% 동일: const [pending, startTransition] = useLoadingTransition()
 */
export function useLoadingTransition(): [boolean, TransitionStartFunction] {
  const [pending, startTransition] = useTransition()
  useEffect(() => {
    if (!pending) return
    activeCount++; notify()
    return () => { activeCount--; notify() }
  }, [pending])
  return [pending, startTransition]
}
