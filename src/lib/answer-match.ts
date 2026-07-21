/**
 * 웹/타이핑 직접 입력 채점용 매칭.
 * - 앞뒤 공백 제거, 키워드 사이 연속 공백 정규화(else if 등)
 * - 숫자 리터럴의 L/l·F/f 접미사 대소문자와 밑줄(_) 유무 허용
 * - 문제별 복수 허용 답안(acceptedAnswers) 지원
 * - Java 키워드·메서드명 등 식별자 대소문자는 그대로 구분(String≠string, println≠Println)
 * (모바일 토큰 선택은 뱅크에서 고른 값이라 정규화 없이 정확 비교한다.)
 */
function normalizeSpace(s: string): string {
  return s.trim().replace(/\s+/g, ' ')
}

function litForm(s: string): string {
  // 숫자 리터럴에만 적용: 밑줄 제거 + L/F 접미사 대문자화 (식별자는 건드리지 않음)
  if (/^-?[0-9][0-9_]*[lLfF]?$/.test(s) || /^-?[0-9][0-9_]*\.[0-9_]+[fFdD]?$/.test(s)) {
    return s.replace(/_/g, '').replace(/l$/, 'L').replace(/f$/, 'F')
  }
  return s
}

export function matchAnswer(input: string, answer: string, accepted?: string[]): boolean {
  const candidates = [answer, ...(accepted ?? [])]
  const ni = normalizeSpace(input)
  const li = litForm(ni)
  return candidates.some((a) => {
    const na = normalizeSpace(a)
    return ni === na || li === litForm(na)
  })
}
