/** 반투명 회색 전체 화면 로딩 오버레이 (백엔드 처리 중 표시 + 조작 차단) */
export default function LoadingOverlay({ show }: { show: boolean }) {
  if (!show) return null
  return (
    <div
      className="fixed inset-0 z-[200] flex items-center justify-center bg-gray-500/20 backdrop-blur-[1px]"
      role="status"
      aria-live="polite"
      aria-busy="true"
    >
      <div className="h-9 w-9 animate-spin rounded-full border-4 border-white/70 border-t-indigo-500 shadow-sm" />
      <span className="sr-only">処理中...</span>
    </div>
  )
}
