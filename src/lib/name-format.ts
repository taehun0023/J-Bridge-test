// full_name 표기 헬퍼.
// 데이터 규칙: full_name 은 "漢字名 (カタカナ名)" 형식으로 저장됨.
//   - 카타카나가 없는 계정(한국 이름 등)은 그냥 단일 문자열.
//   - 일부 옛 데이터는 전각 괄호(（ ）) 또는 공백 변형이 있을 수 있음.

export interface ParsedName {
  /** 화면 본체에 표시할 본명 (한자/한국어 등) */
  kanji: string
  /** 위에 furigana 처럼 얹을 카타카나. 없으면 null */
  kana: string | null
}

const PAREN_RE = /^\s*(.+?)\s*[(（]\s*([^()（）]+?)\s*[)）]\s*$/

export function parseFullName(name: string | null | undefined): ParsedName {
  if (!name) return { kanji: '', kana: null }
  const m = name.match(PAREN_RE)
  if (m) return { kanji: m[1]!, kana: m[2]! }
  return { kanji: name, kana: null }
}

/** 헤더 등 ruby 미적용 영역에서 사용. 카타카나 부분을 제거하고 본명만 반환 */
export function kanjiOnly(name: string | null | undefined): string | null {
  if (!name) return null
  return parseFullName(name).kanji || null
}

/** 아바타 이니셜 등 첫 글자 추출 */
export function initialOf(name: string | null | undefined): string {
  const k = kanjiOnly(name)
  return k?.charAt(0) ?? '?'
}
