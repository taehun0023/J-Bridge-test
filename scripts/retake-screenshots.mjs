/**
 * Retake screenshots for updated pages.
 * - /admin/reports (now Japanese, cs-governance link removed)
 *
 * Usage: node scripts/retake-screenshots.mjs
 * Requires dev server running at localhost:3000
 */

import { chromium } from 'playwright'
import * as readline from 'readline'
import * as fs from 'fs'
import * as path from 'path'

const BASE_URL = 'http://localhost:3000'
const OUTPUT_DIR = path.resolve('docs/manual/images')

function createRL() {
  return readline.createInterface({ input: process.stdin, output: process.stdout })
}

function ask(rl, question) {
  return new Promise(resolve => rl.question(question, resolve))
}

async function capture(page, urlPath, filename, delay = 1500) {
  const dir = path.dirname(path.join(OUTPUT_DIR, filename))
  fs.mkdirSync(dir, { recursive: true })

  console.log(`  Capturing ${filename} (${urlPath})...`)
  try {
    await page.goto(`${BASE_URL}${urlPath}`, { waitUntil: 'networkidle', timeout: 20000 })
  } catch {
    console.log(`  (networkidle timeout, proceeding)`)
  }
  await page.waitForTimeout(delay)
  await page.screenshot({ path: path.join(OUTPUT_DIR, filename), fullPage: true })
}

async function main() {
  const rl = createRL()
  console.log('\n=== Retake Screenshots ===\n')

  // Admin account for /admin/reports
  const adminEmail = await ask(rl, '[Admin] Email: ')
  const adminPass = await ask(rl, '[Admin] Password: ')

  // Mentor account for /admin/reports (mentor view)
  const mentorEmail = await ask(rl, '[Mentor] Email: ')
  const mentorPass = await ask(rl, '[Mentor] Password: ')
  rl.close()

  const browser = await chromium.launch({ headless: false })

  // Admin: retake /admin/reports
  console.log('\n[Admin] Logging in...')
  const adminCtx = await browser.newContext({ viewport: { width: 1440, height: 900 }, locale: 'ja-JP' })
  const adminPage = await adminCtx.newPage()
  await adminPage.goto(`${BASE_URL}/login`, { waitUntil: 'networkidle' })
  await adminPage.fill('#email', adminEmail)
  await adminPage.fill('#password', adminPass)
  await adminPage.click('button[type="submit"]')
  await adminPage.waitForURL(url => !url.toString().includes('/login'), { timeout: 15000 })
  await adminPage.waitForLoadState('networkidle')

  await capture(adminPage, '/admin/reports', 'admin/06_reports.png')
  await adminCtx.close()

  // Mentor: retake /admin/reports
  console.log('\n[Mentor] Logging in...')
  const mentorCtx = await browser.newContext({ viewport: { width: 1440, height: 900 }, locale: 'ja-JP' })
  const mentorPage = await mentorCtx.newPage()
  await mentorPage.goto(`${BASE_URL}/login`, { waitUntil: 'networkidle' })
  await mentorPage.fill('#email', mentorEmail)
  await mentorPage.fill('#password', mentorPass)
  await mentorPage.click('button[type="submit"]')
  await mentorPage.waitForURL(url => !url.toString().includes('/login'), { timeout: 15000 })
  await mentorPage.waitForLoadState('networkidle')

  await capture(mentorPage, '/admin/reports', 'mentor/04_reports.png')
  await mentorCtx.close()

  await browser.close()
  console.log('\n=== Done! Screenshots updated. ===\n')
}

main().catch(err => {
  console.error('Error:', err)
  process.exit(1)
})
