const JUDGE0_API_URL = process.env.JUDGE0_API_URL ?? 'http://localhost:2358'
const JUDGE0_API_KEY = process.env.JUDGE0_API_KEY ?? ''
const IS_RAPIDAPI = JUDGE0_API_URL.includes('rapidapi.com')

// Judge0 language IDs
const LANGUAGE_IDS: Record<string, number> = {
  java: 62,       // Java (OpenJDK 13.0.1)
  javascript: 63, // JavaScript (Node.js 12.14.0)
  sql: 82,        // SQL (SQLite 3.27.2)
}

interface Judge0Submission {
  source_code: string
  language_id: number
  stdin: string
  expected_output?: string
  cpu_time_limit?: number
  memory_limit?: number
}

interface Judge0Result {
  token: string
  status: {
    id: number
    description: string
  }
  stdout: string | null
  stderr: string | null
  compile_output: string | null
  time: string | null
  memory: number | null
}

export function getLanguageId(language: string): number {
  return LANGUAGE_IDS[language] ?? 62
}

function getHeaders(includeContentType = false): Record<string, string> {
  const headers: Record<string, string> = {}

  if (includeContentType) {
    headers['Content-Type'] = 'application/json'
  }

  if (IS_RAPIDAPI) {
    // RapidAPI hosted Judge0
    headers['X-RapidAPI-Key'] = JUDGE0_API_KEY
    headers['X-RapidAPI-Host'] = 'judge0-ce.p.rapidapi.com'
  } else if (JUDGE0_API_KEY) {
    // Self-hosted Judge0 with authentication
    headers['X-Auth-Token'] = JUDGE0_API_KEY
  }

  return headers
}

export async function createSubmission(submission: Judge0Submission): Promise<string> {
  const res = await fetch(`${JUDGE0_API_URL}/submissions?base64_encoded=false&wait=false`, {
    method: 'POST',
    headers: getHeaders(true),
    body: JSON.stringify(submission),
  })

  if (!res.ok) {
    const body = await res.text().catch(() => '')
    console.error(`[Judge0] createSubmission failed: ${res.status} ${res.statusText}`, body)
    throw new Error(`Judge0 submission failed (${res.status}): ${body || res.statusText}`)
  }
  const data = await res.json()
  return data.token
}

export async function getSubmissionResult(token: string): Promise<Judge0Result> {
  const res = await fetch(
    `${JUDGE0_API_URL}/submissions/${token}?base64_encoded=false&fields=status,stdout,stderr,compile_output,time,memory,token`,
    {
      headers: getHeaders(),
    }
  )

  if (!res.ok) {
    const body = await res.text().catch(() => '')
    console.error(`[Judge0] getSubmissionResult failed: ${res.status} ${res.statusText}`, body)
    throw new Error(`Failed to get submission result (${res.status}): ${body || res.statusText}`)
  }
  return res.json()
}

export async function pollSubmissionResult(token: string, maxAttempts = 20): Promise<Judge0Result> {
  for (let i = 0; i < maxAttempts; i++) {
    const result = await getSubmissionResult(token)
    // Status IDs: 1=In Queue, 2=Processing, 3=Accepted, 4+=various errors
    if (result.status.id > 2) return result
    await new Promise((resolve) => setTimeout(resolve, 1000))
  }
  throw new Error('Submission timed out')
}

// Map Judge0 status to our SubmissionStatus
export function mapJudge0Status(statusId: number): string {
  switch (statusId) {
    case 3: return 'accepted'
    case 4: return 'wrong_answer'
    case 5: return 'time_limit'
    case 6: return 'compile_error'
    case 7: case 8: case 9: case 10: case 11: case 12: return 'runtime_error'
    case 13: case 14: return 'memory_limit'
    default: return 'runtime_error'
  }
}
