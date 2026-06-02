import { parseFullName } from '@/lib/name-format'

/**
 * 본명 위에 카타카나 furigana 를 얹어 표시한다.
 *   - "鈴木太郎 (スズキタロウ)" → <ruby>鈴木太郎<rt>スズキタロウ</rt></ruby>
 *   - "홍길동"                  → 홍길동 (rt 미표시)
 *   - null/undefined             → fallback ('—')
 *
 * 폰트 사이즈는 부모를 따르며, rt 는 0.55em 정도로 표시된다.
 * inline-block 으로 줄바꿈을 막아 셀 안에서 깔끔하게 정렬되도록 함.
 */
export default function NameRuby({
  name,
  fallback = '—',
  className = '',
}: {
  name: string | null | undefined
  fallback?: string
  className?: string
}) {
  const { kanji, kana } = parseFullName(name)
  if (!kanji) return <span className={className}>{fallback}</span>

  if (!kana) {
    return <span className={className}>{kanji}</span>
  }

  return (
    <ruby className={`leading-tight ${className}`}>
      {kanji}
      <rt className="text-[0.55em] font-normal tracking-tight text-zinc-500 dark:text-zinc-400">
        {kana}
      </rt>
    </ruby>
  )
}
