/**
 * J-Bridge Manual Screenshot Capture Script
 *
 * Usage:
 *   node scripts/capture-manual-screenshots.mjs
 *
 * Requires:
 *   - Dev server running at localhost:3000
 *   - Three test accounts (mentee / mentor / admin)
 *   - Playwright installed (npm install -D playwright)
 *
 * Prompts for credentials interactively at startup.
 */

import { chromium } from 'playwright'
import * as readline from 'readline'
import * as fs from 'fs'
import * as path from 'path'

const BASE_URL = 'http://localhost:3000'
const OUTPUT_DIR = path.resolve('docs/manual/images')

// ─── Interactive credential input ───

function createRL() {
  return readline.createInterface({ input: process.stdin, output: process.stdout })
}

function ask(rl, question) {
  return new Promise(resolve => rl.question(question, resolve))
}

async function getCredentials() {
  const rl = createRL()
  console.log('\n=== J-Bridge Manual Screenshot Capture ===\n')
  console.log('3개 역할의 테스트 계정 정보를 입력하세요.\n')

  const mentee = {
    email: await ask(rl, '[Mentee] Email: '),
    password: await ask(rl, '[Mentee] Password: '),
  }
  const mentor = {
    email: await ask(rl, '[Mentor] Email: '),
    password: await ask(rl, '[Mentor] Password: '),
  }
  const admin = {
    email: await ask(rl, '[Admin]  Email: '),
    password: await ask(rl, '[Admin]  Password: '),
  }

  rl.close()
  return { mentee, mentor, admin }
}

// ─── Helper: login and return authenticated page ───

async function login(browser, cred, role) {
  const context = await browser.newContext({
    viewport: { width: 1440, height: 900 },
    locale: 'ja-JP',
  })
  const page = await context.newPage()

  console.log(`  [${role}] Logging in as ${cred.email}...`)
  await page.goto(`${BASE_URL}/login`, { waitUntil: 'networkidle' })
  await page.fill('#email', cred.email)
  await page.fill('#password', cred.password)
  await page.click('button[type="submit"]')

  // Wait for redirect after login
  await page.waitForURL(url => !url.toString().includes('/login'), { timeout: 15000 })
  await page.waitForLoadState('networkidle')
  console.log(`  [${role}] Logged in. Current URL: ${page.url()}`)

  return { context, page }
}

// ─── Helper: navigate and screenshot ───

async function capture(page, urlPath, filename, opts = {}) {
  const { delay = 1500, fullPage = true, clickSelector, waitSelector } = opts
  const dir = path.dirname(path.join(OUTPUT_DIR, filename))
  fs.mkdirSync(dir, { recursive: true })

  const fullUrl = urlPath.startsWith('http') ? urlPath : `${BASE_URL}${urlPath}`
  console.log(`    Capturing ${filename} (${urlPath})...`)

  try {
    await page.goto(fullUrl, { waitUntil: 'networkidle', timeout: 20000 })
  } catch {
    // networkidle timeout — page may still be usable
    console.log(`    (networkidle timeout for ${urlPath}, proceeding anyway)`)
  }

  if (waitSelector) {
    try {
      await page.waitForSelector(waitSelector, { timeout: 5000 })
    } catch { /* element may not exist */ }
  }

  if (clickSelector) {
    try {
      await page.click(clickSelector, { timeout: 3000 })
      await page.waitForTimeout(800)
    } catch { /* element may not exist */ }
  }

  await page.waitForTimeout(delay)

  await page.screenshot({
    path: path.join(OUTPUT_DIR, filename),
    fullPage,
  })
}

// ─── Page definitions by role ───

const MENTEE_PAGES = [
  { path: '/login', file: 'mentee/01_login.png', preLogin: true },
  { path: '/dashboard', file: 'mentee/03_dashboard.png' },
  { path: '/japanese/jlpt', file: 'mentee/06_jlpt_main.png' },
  { path: '/japanese/jlpt/vocabulary', file: 'mentee/06_jlpt_detail.png' },
  { path: '/japanese/jlpt/grammar', file: 'mentee/06_jlpt_grammar.png' },
  { path: '/japanese/jlpt/reading', file: 'mentee/06_jlpt_reading.png' },
  { path: '/japanese/jlpt/listening', file: 'mentee/06_jlpt_listening.png' },
  { path: '/japanese/jlpt/kanji', file: 'mentee/06_jlpt_kanji.png' },
  { path: '/japanese/jlpt/quiz', file: 'mentee/07_jlpt_quiz_list.png' },
  { path: '/japanese/business', file: 'mentee/08_bj_main.png' },
  { path: '/japanese/business/glossary', file: 'mentee/08_bj_glossary.png' },
  { path: '/japanese/business/sentence-patterns', file: 'mentee/08_bj_patterns.png' },
  { path: '/japanese/business/expressions', file: 'mentee/08_bj_expressions.png' },
  { path: '/japanese/business/keigo', file: 'mentee/08_bj_keigo.png' },
  { path: '/japanese/business/quiz', file: 'mentee/09_bj_quiz.png' },
  { path: '/japanese/business/shared-vocab', file: 'mentee/10_shared_vocab.png' },
  { path: '/cs', file: 'mentee/11_cs_main.png' },
  { path: '/cs/basic-theory', file: 'mentee/11_cs_category.png' },
  { path: '/cs/quiz', file: 'mentee/12_cs_quiz.png' },
  { path: '/dev', file: 'mentee/13_dev_main.png' },
  { path: '/dev/java', file: 'mentee/13_dev_java.png' },
  { path: '/dev/java?tab=cert', file: 'mentee/14_java_cert.png' },
  { path: '/dev/quiz', file: 'mentee/15_dev_quiz.png' },
  { path: '/business-literacy', file: 'mentee/16_business_lit.png' },
  { path: '/business-literacy/attitude-culture', file: 'mentee/16_bl_attitude.png' },
  { path: '/business-literacy/security', file: 'mentee/16_bl_security.png' },
  { path: '/ranking', file: 'mentee/17_ranking.png' },
  { path: '/profile', file: 'mentee/18_profile.png' },
  { path: '/profile/feedback', file: 'mentee/18_feedback.png' },
  { path: '/dashboard/assignments', file: 'mentee/19_assignments.png' },
  { path: '/dashboard/history', file: 'mentee/20_history.png' },
  { path: '/personal-vocab', file: 'mentee/21_personal_vocab.png' },
]

const MENTOR_PAGES = [
  { path: '/mentor', file: 'mentor/01_mentor_dashboard.png' },
  { path: '/admin/tasks', file: 'mentor/03_tasks.png' },
  { path: '/admin/reports', file: 'mentor/04_reports.png' },
  { path: '/admin/courses', file: 'mentor/07_courses.png' },
]

const ADMIN_PAGES = [
  { path: '/admin', file: 'admin/01_admin_dashboard.png' },
  { path: '/admin/users', file: 'admin/02_users.png' },
  { path: '/admin/mentors', file: 'admin/03_mentors.png' },
  { path: '/admin/courses', file: 'admin/04_courses.png' },
  { path: '/admin/tasks', file: 'admin/05_tasks.png' },
  { path: '/admin/reports', file: 'admin/06_reports.png' },
  { path: '/admin/reports/cs-governance', file: 'admin/07_cs_governance.png' },
  { path: '/admin/tts-cache', file: 'admin/08_tts_cache.png' },
  { path: '/admin/audit-log', file: 'admin/09_audit_log.png' },
  { path: '/admin/backup', file: 'admin/10_backup.png' },
]

// ─── Main ───

async function main() {
  const creds = await getCredentials()

  console.log('\nLaunching browser...\n')
  const browser = await chromium.launch({ headless: false })

  // --- 1. Login page (before auth) ---
  console.log('[Pre-login] Capturing login page...')
  const preCtx = await browser.newContext({ viewport: { width: 1440, height: 900 }, locale: 'ja-JP' })
  const prePage = await preCtx.newPage()
  await capture(prePage, '/login', 'mentee/01_login.png')
  await preCtx.close()

  // --- 2. Mentee captures ---
  console.log('\n[Mentee] Starting captures...')
  const mentee = await login(browser, creds.mentee, 'Mentee')
  for (const p of MENTEE_PAGES) {
    if (p.preLogin) continue // already captured
    await capture(mentee.page, p.path, p.file)
  }
  await mentee.context.close()

  // --- 3. Mentor captures ---
  console.log('\n[Mentor] Starting captures...')
  const mentor = await login(browser, creds.mentor, 'Mentor')
  for (const p of MENTOR_PAGES) {
    await capture(mentor.page, p.path, p.file)
  }
  await mentor.context.close()

  // --- 4. Admin captures ---
  console.log('\n[Admin] Starting captures...')
  const admin = await login(browser, creds.admin, 'Admin')
  for (const p of ADMIN_PAGES) {
    await capture(admin.page, p.path, p.file)
  }
  await admin.context.close()

  await browser.close()

  // --- Summary ---
  const totalFiles = MENTEE_PAGES.length + MENTOR_PAGES.length + ADMIN_PAGES.length
  console.log(`\n=== Done! ${totalFiles} screenshots saved to docs/manual/images/ ===\n`)
}

main().catch(err => {
  console.error('Error:', err)
  process.exit(1)
})
