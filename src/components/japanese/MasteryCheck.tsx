/** 학습 완료(습득) 표시 — 읽기 전용 통일 아이콘(원형 체크). 정답을 맞히면 켜진다. */
export default function MasteryCheck({ done, title }: { done: boolean; title?: string }) {
  return (
    <span className="shrink-0" title={title ?? (done ? '学習完了' : '未完了')}>
      {done ? (
        <svg className="h-5 w-5 text-emerald-500" fill="currentColor" viewBox="0 0 20 20">
          <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
        </svg>
      ) : (
        <svg className="h-5 w-5 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 20 20" stroke="currentColor">
          <circle cx="10" cy="10" r="7" strokeWidth="2" />
        </svg>
      )}
    </span>
  )
}
