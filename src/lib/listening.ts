/**
 * 청해 question_text에서 TTS 스크립트와 표시용 질문을 분리하는 파서들.
 *
 * 두 포맷/계약이 공존한다:
 * - 종합시험(ExamClient): "지시문\n\n대화...\n\n질문" — \n\n 분할
 * - 연습 풀(QuizTaker):   "대화...\n質問：질문"      — 質問： 마커
 *
 * 같은 question_text라도 화면에 따라 다른 스크립트(=다른 TTS 캐시 키)가
 * 나올 수 있으므로 tts-precache는 두 변형을 모두 캐시한다. 과거 두 화면이
 * 같은 이름의 로컬 파서를 서로 다른 계약으로 갖고 있어 시험에서 상시
 * 캐시 미스가 났던 사고의 재발 방지를 위해 여기로 단일화했다.
 */

/** 종합시험 화면 계약: \n\n 분할, 마지막 단락이 질문.
 *  3단락 미만이면 null — 그 경우 화면은 전문을 표시하고 플레이어를 띄우지 않는다. */
export function parseExamListeningQuestion(text: string): { script: string; question: string } | null {
  const normalized = text.replace(/\\n/g, '\n')
  const parts = normalized.split('\n\n')
  if (parts.length < 3) return null
  const question = parts[parts.length - 1]
  const script = parts.slice(0, parts.length - 1).join('\n\n')
  return { script, question }
}

/** 연습 풀(QuizTaker) 계약: 마지막 質問： 마커 앞이 스크립트.
 *  마커가 없으면 script는 빈 문자열, 전문이 질문으로 표시된다. */
export function parsePoolListeningQuestion(text: string): { script: string; question: string } {
  const cleaned = text.replace(/\\n/g, '\n')
  const marker = '質問：'
  const idx = cleaned.lastIndexOf(marker)
  if (idx === -1) return { script: '', question: cleaned }
  return {
    script: cleaned.substring(0, idx).trim(),
    question: marker + cleaned.substring(idx + marker.length),
  }
}
