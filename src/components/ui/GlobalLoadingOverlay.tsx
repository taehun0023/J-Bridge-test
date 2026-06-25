'use client'

import { useGlobalLoading } from '@/lib/loading-store'
import LoadingOverlay from './LoadingOverlay'

/** 레이아웃에 1개만 두면, 어디서든 useLoadingTransition pending 시 자동 표시 */
export default function GlobalLoadingOverlay() {
  return <LoadingOverlay show={useGlobalLoading()} />
}
