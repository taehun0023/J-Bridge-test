/**
 * Code Review Analyzer
 * Provides automated code review feedback based on Japanese IT coding conventions.
 * This is a rule-based system that can be extended with AI integration later.
 */

interface ReviewItem {
  review_type: 'style' | 'logic' | 'performance' | 'japan_convention'
  feedback: string
  severity: 'info' | 'warning' | 'error'
  line_number: number | null
}

export function analyzeJavaCode(sourceCode: string): ReviewItem[] {
  const reviews: ReviewItem[] = []
  const lines = sourceCode.split('\n')

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i]
    const lineNum = i + 1

    // Japanese convention: Variable naming should be descriptive (not single chars except loops)
    const singleVarMatch = line.match(/\b(int|String|long|double|float|boolean)\s+([a-z])\s*[=;]/)
    if (singleVarMatch && !['i', 'j', 'k', 'n', 'm'].includes(singleVarMatch[2])) {
      reviews.push({
        review_type: 'japan_convention',
        feedback: `変数名「${singleVarMatch[2]}」は短すぎます。日本の開発現場では、意味が分かる変数名を使用してください。`,
        severity: 'warning',
        line_number: lineNum,
      })
    }

    // Style: Indentation consistency
    if (line.match(/^\t/) && sourceCode.includes('    ')) {
      reviews.push({
        review_type: 'style',
        feedback: 'タブとスペースが混在しています。統一してください。',
        severity: 'warning',
        line_number: lineNum,
      })
    }

    // Japanese convention: Comments should be in Japanese in JP workplace
    const commentMatch = line.match(/\/\/\s*(.+)/)
    if (commentMatch && /^[a-zA-Z\s]+$/.test(commentMatch[1].trim()) && commentMatch[1].trim().length > 3) {
      reviews.push({
        review_type: 'japan_convention',
        feedback: `コメントは日本語で記述することが推奨されます。`,
        severity: 'info',
        line_number: lineNum,
      })
    }

    // Performance: String concatenation in loop
    if (line.match(/\+\s*=\s*"/) && isInsideLoop(lines, i)) {
      reviews.push({
        review_type: 'performance',
        feedback: 'ループ内での文字列結合は非効率です。StringBuilderの使用を検討してください。',
        severity: 'warning',
        line_number: lineNum,
      })
    }

    // Logic: Empty catch block
    if (line.match(/catch\s*\(/) && i + 1 < lines.length && lines[i + 1].trim() === '}') {
      reviews.push({
        review_type: 'logic',
        feedback: '空のcatchブロックはバグの原因になります。最低限ログ出力を追加してください。',
        severity: 'error',
        line_number: lineNum,
      })
    }

    // Japanese convention: Magic numbers
    const magicMatch = line.match(/[=<>!]+\s*(\d+)/)
    if (magicMatch && !['0', '1', '2', '-1', '100'].includes(magicMatch[1]) && !line.includes('const') && !line.includes('final')) {
      reviews.push({
        review_type: 'japan_convention',
        feedback: `マジックナンバー「${magicMatch[1]}」を定数に置き換えてください。`,
        severity: 'info',
        line_number: lineNum,
      })
    }

    // Style: Line too long (Japanese teams often use 120 char limit)
    if (line.length > 120) {
      reviews.push({
        review_type: 'style',
        feedback: '1行が120文字を超えています。可読性のため、行を分割してください。',
        severity: 'info',
        line_number: lineNum,
      })
    }
  }

  // General checks
  if (!sourceCode.includes('try') && sourceCode.includes('Scanner')) {
    reviews.push({
      review_type: 'logic',
      feedback: 'Scannerの使用時にはtry-with-resourcesまたはclose()を検討してください。',
      severity: 'info',
      line_number: null,
    })
  }

  // Limit reviews to most important ones
  return reviews.slice(0, 10)
}

export function analyzeJavaScriptCode(sourceCode: string): ReviewItem[] {
  const reviews: ReviewItem[] = []
  const lines = sourceCode.split('\n')

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i]
    const lineNum = i + 1

    // var usage
    if (line.match(/\bvar\s+/)) {
      reviews.push({
        review_type: 'style',
        feedback: 'varの代わりにconstまたはletを使用してください。',
        severity: 'warning',
        line_number: lineNum,
      })
    }

    // == instead of ===
    if (line.match(/[^=!]==[^=]/) && !line.includes('null')) {
      reviews.push({
        review_type: 'logic',
        feedback: '厳密等価演算子(===)の使用を推奨します。',
        severity: 'warning',
        line_number: lineNum,
      })
    }

    // console.log left in code
    if (line.match(/console\.log/)) {
      reviews.push({
        review_type: 'japan_convention',
        feedback: '本番コードにconsole.logを残さないでください。',
        severity: 'warning',
        line_number: lineNum,
      })
    }
  }

  return reviews.slice(0, 10)
}

function isInsideLoop(lines: string[], index: number): boolean {
  for (let i = index; i >= Math.max(0, index - 10); i--) {
    if (lines[i].match(/\b(for|while)\s*\(/)) return true
  }
  return false
}

export function analyzeCode(sourceCode: string, language: string): ReviewItem[] {
  switch (language.toLowerCase()) {
    case 'java':
      return analyzeJavaCode(sourceCode)
    case 'javascript':
      return analyzeJavaScriptCode(sourceCode)
    default:
      return []
  }
}
