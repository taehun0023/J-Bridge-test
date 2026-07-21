import { Fragment, type ReactNode } from 'react'

/**
 * 코드 문제(빈칸 채우기)의 "빈칸이 아닌" 코드 조각에 자바 문법 색을 입히는 경량 하이라이터.
 * 빈칸([[N]])마다 코드가 잘려 인터랙티브 요소가 끼므로 Prism 등 전체 문자열 방식을 못 써서,
 * 조각 단위로 토큰화해 색 span으로 감싼다. (빈칸은 코드 토큰 위에만 있어 문자열/주석을 가르지 않음)
 */

const KEYWORDS = new Set([
  'abstract', 'assert', 'break', 'case', 'catch', 'class', 'continue', 'default',
  'do', 'else', 'enum', 'extends', 'final', 'finally', 'for', 'if', 'implements',
  'import', 'instanceof', 'interface', 'new', 'package', 'private', 'protected',
  'public', 'return', 'static', 'super', 'switch', 'synchronized', 'this', 'throw',
  'throws', 'transient', 'try', 'void', 'volatile', 'while', 'var', 'record',
  'yield', 'true', 'false', 'null',
])
const PRIMITIVES = new Set(['int', 'long', 'short', 'byte', 'float', 'double', 'boolean', 'char'])

const COLOR = {
  keyword: '#c586c0', // 보라
  type: '#4ec9b0', // 청록
  string: '#ce9178', // 주황
  comment: '#6a9955', // 회록
  number: '#b5cea8', // 연두
  annotation: '#dcdcaa', // 노랑
} as const

// 우선순위: 주석 → 문자열/문자 → 애노테이션 → 숫자 → 식별어
const TOKEN =
  /(\/\*[\s\S]*?\*\/|\/\/[^\n]*)|("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')|(@\w+)|(\b\d[\d_]*(?:\.\d+)?[fFlLdD]?\b)|([A-Za-z_$][A-Za-z0-9_$]*)/g

/** 자바 코드 조각을 색 span 노드 배열로 변환한다. */
export function highlightJava(code: string): ReactNode {
  const out: ReactNode[] = []
  let last = 0
  let key = 0
  let m: RegExpExecArray | null
  TOKEN.lastIndex = 0
  while ((m = TOKEN.exec(code)) !== null) {
    if (m.index > last) out.push(<Fragment key={key++}>{code.slice(last, m.index)}</Fragment>)
    let color: string | undefined
    if (m[1]) color = COLOR.comment
    else if (m[2]) color = COLOR.string
    else if (m[3]) color = COLOR.annotation
    else if (m[4]) color = COLOR.number
    else if (m[5]) {
      const w = m[5]
      if (KEYWORDS.has(w)) color = COLOR.keyword
      else if (PRIMITIVES.has(w)) color = COLOR.type
      else if (/^[A-Z]/.test(w)) color = COLOR.type
    }
    out.push(
      color ? (
        <span key={key++} style={{ color }}>
          {m[0]}
        </span>
      ) : (
        <Fragment key={key++}>{m[0]}</Fragment>
      )
    )
    last = m.index + m[0].length
  }
  if (last < code.length) out.push(<Fragment key={key++}>{code.slice(last)}</Fragment>)
  return out
}
