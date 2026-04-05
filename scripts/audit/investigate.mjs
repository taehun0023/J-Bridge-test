#!/usr/bin/env node
/**
 * Investigator audit script for exam quiz_questions quality.
 *
 * Usage:
 *   node scripts/audit/investigate.mjs <category>
 * Example:
 *   node scripts/audit/investigate.mjs grammar
 *
 * Reads-only. Pulls quiz_questions matching a category/quiz_id set,
 * applies rubric auto-detection rules, and writes a markdown report to
 * docs/audit/jlpt_<category>_issues.md (category-agnostic path pattern).
 *
 * Rubric reference: docs/exam_quality_rubric.md
 */

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createClient } from '@supabase/supabase-js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, '..', '..');

// ─── Config ──────────────────────────────────────────────────────────────────

const category = process.argv[2];
if (!category) {
  console.error('Usage: node scripts/audit/investigate.mjs <category>');
  process.exit(1);
}

// Map categories to the relevant practice-quiz IDs (Step1 JLPT content).
// Matches MEMORY.md quiz ID scheme.
const CATEGORY_QUIZ_IDS = {
  grammar: ['b0000001', 'b0000002', 'b0000003', 'b0000004', 'b0000005'],
  reading: ['c0000001', 'c0000002', 'c0000003', 'c0000004', 'c0000005'],
  listening: ['d0000001', 'd0000002', 'd0000003', 'd0000004', 'd0000005'],
};

const quizIdSet = CATEGORY_QUIZ_IDS[category] || [];

// ─── Env loading ─────────────────────────────────────────────────────────────

const envPath = path.join(ROOT, '.env.local');
const envText = fs.readFileSync(envPath, 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();

const SUPABASE_URL = getEnv('NEXT_PUBLIC_SUPABASE_URL');
const SERVICE_ROLE_KEY = getEnv('SUPABASE_SERVICE_ROLE_KEY');

if (!SUPABASE_URL || !SERVICE_ROLE_KEY) {
  console.error('ERROR: Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
});

// ─── Helpers ─────────────────────────────────────────────────────────────────

const HANGUL_RE = /[\uAC00-\uD7A3]/;

// A2-exempt patterns: questions whose structure inherently requires overlap
// between question_text and the correct answer (conjugation, transformation,
// keigo, reading, synonyms/antonyms, fill-in-blank with context, sentence rewrites).
// Reference: docs/exam_quality_rubric.md A2 예외 (A2-exempt)
const A2_EXEMPT_PATTERNS = [
  // 활용형
  /ます形|て形|た形|辞書形|受身|使役|可能形|命令形|意向形|仮定形|[一-龥ぁ-んァ-ヴー]形|活用/,
  // 변환 / 문형 변환
  /に変える|に変換|に直|言い換え|書き換え|にしなさい|に直しなさい/,
  // 경어
  /尊敬語|謙譲語|丁寧語|敬語に|敬語で|の丁寧形|の尊敬|の謙譲/,
  // 읽기/한자
  /読み方|ふりがな|読み仮名|漢字|読みは|読みで/,
  // 의미/유의/반의
  /意味|類義語|対義語|反対語|同じ意味|近い意味|同義語/,
  // 문법표현 역할/기능/뉘앙스
  /何を表|表現|役割|用法|ニュアンス|機能|働き|使い方/,
];

// Fill-in-the-blank detection (parentheses/underscores as blanks).
const BLANK_RE = /（　*）|\(\s*\)|＿＿+|___+|（\s*）/;

function isA2Exempt(questionText) {
  if (!questionText) return { exempt: false };
  for (const re of A2_EXEMPT_PATTERNS) {
    const m = questionText.match(re);
    if (m) return { exempt: true, kind: m[0] };
  }
  // Fill-in-the-blank is exempt ONLY if there is surrounding context (more than
  // just the blank + answer keyword). Heuristic: blank present AND question
  // text length (excluding blank marker) >= 10 chars.
  if (BLANK_RE.test(questionText)) {
    const stripped = questionText.replace(BLANK_RE, '').replace(/\s+/g, '');
    if (strLen(stripped) >= 10) return { exempt: true, kind: '（　）穴埋め' };
  }
  return { exempt: false };
}

function strLen(s) {
  // Count Unicode code points (approximation for visual length).
  return [...(s || '')].length;
}

function bigrams(s) {
  const chars = [...(s || '').replace(/\s+/g, '')];
  const out = new Set();
  for (let i = 0; i < chars.length - 1; i++) {
    out.add(chars[i] + chars[i + 1]);
  }
  return out;
}

function answerLeakRatio(questionText, correctOptionText) {
  const bg = bigrams(correctOptionText);
  if (bg.size === 0) return 0;
  const qChars = [...questionText.replace(/\s+/g, '')];
  const qBigrams = new Set();
  for (let i = 0; i < qChars.length - 1; i++) qBigrams.add(qChars[i] + qChars[i + 1]);
  let hit = 0;
  for (const b of bg) if (qBigrams.has(b)) hit++;
  return hit / bg.size;
}

// ─── Fetch ───────────────────────────────────────────────────────────────────

async function fetchAll() {
  // Look up quizzes by string id (MEMORY.md shows b0000001 etc are quiz identifiers).
  // quizzes.id is UUID in schema; but these short IDs may be stored in a "code"/"slug" or
  // quizzes may actually use these as text primary keys via later migration. Fetch by trying
  // both: first resolve uuid list from quizzes table.
  const { data: quizRows, error: quizErr } = await supabase
    .from('quizzes')
    .select('id, title')
    .in('id', quizIdSet);

  if (quizErr) {
    console.warn('quizzes lookup by id failed:', quizErr.message);
  }

  const resolvedQuizIds = (quizRows || []).map((r) => r.id);
  console.log(`Resolved ${resolvedQuizIds.length} quiz rows from quiz_id set`);

  // Primary filter: question_category = <category> OR quiz_id IN resolved ids
  // quiz_questions.question_category is the category column (per schema v3).
  let query = supabase
    .from('quiz_questions')
    .select('id, quiz_id, question_text, explanation, difficulty, question_category, points, sort_order');

  if (resolvedQuizIds.length > 0) {
    const inList = resolvedQuizIds.map((id) => `"${id}"`).join(',');
    query = query.or(`question_category.eq.${category},quiz_id.in.(${inList})`);
  } else {
    query = query.eq('question_category', category);
  }

  const { data: questions, error: qErr } = await query;
  if (qErr) throw qErr;

  console.log(`Fetched ${questions.length} quiz_questions`);

  if (questions.length === 0) return { questions: [], options: [], claims: [], quizRows: quizRows || [] };

  const qIds = questions.map((q) => q.id);

  // Batch fetch options (chunk to avoid URL length issues).
  const options = [];
  for (let i = 0; i < qIds.length; i += 100) {
    const chunk = qIds.slice(i, i + 100);
    const { data: opts, error: oErr } = await supabase
      .from('quiz_question_options')
      .select('id, question_id, option_text, is_correct, sort_order')
      .in('question_id', chunk);
    if (oErr) throw oErr;
    options.push(...opts);
  }
  console.log(`Fetched ${options.length} quiz_question_options`);

  // Fetch claims.
  const claims = [];
  for (let i = 0; i < qIds.length; i += 100) {
    const chunk = qIds.slice(i, i + 100);
    const { data: cls, error: cErr } = await supabase
      .from('question_claims')
      .select('id, question_id, claim_reason, created_at')
      .in('question_id', chunk);
    if (cErr) throw cErr;
    claims.push(...cls);
  }
  console.log(`Fetched ${claims.length} question_claims`);

  return { questions, options, claims, quizRows: quizRows || [] };
}

// ─── Analysis ────────────────────────────────────────────────────────────────

function analyze({ questions, options, claims, quizRows }) {
  const optByQ = new Map();
  for (const o of options) {
    if (!optByQ.has(o.question_id)) optByQ.set(o.question_id, []);
    optByQ.get(o.question_id).push(o);
  }
  const claimsByQ = new Map();
  for (const c of claims) {
    if (!claimsByQ.has(c.question_id)) claimsByQ.set(c.question_id, []);
    claimsByQ.get(c.question_id).push(c);
  }
  const quizById = new Map(quizRows.map((r) => [r.id, r]));

  const results = [];
  for (const q of questions) {
    const opts = optByQ.get(q.id) || [];
    const issues = [];
    const details = [];

    // B7: exactly 4 options, 1 correct
    const correctOpts = opts.filter((o) => o.is_correct);
    if (opts.length !== 4) {
      issues.push({ code: 'B7', prio: 'Medium', note: `option count = ${opts.length} (expected 4)` });
    }
    if (correctOpts.length !== 1) {
      issues.push({ code: 'B7/A3', prio: 'High', note: `correct option count = ${correctOpts.length} (expected 1)` });
    }

    if (opts.length > 0) {
      const lengths = opts.map((o) => strLen(o.option_text));
      const maxL = Math.max(...lengths);
      const minL = Math.min(...lengths) || 1;
      const avgL = lengths.reduce((a, b) => a + b, 0) / lengths.length;
      const correct = correctOpts[0];
      const correctLen = correct ? strLen(correct.option_text) : 0;

      // B5 length bias
      if (maxL / minL > 1.5) {
        issues.push({
          code: 'B5',
          prio: 'Medium',
          note: `length ratio ${(maxL / minL).toFixed(2)}x (max=${maxL}, min=${minL})`,
        });
      }
      if (correct && (correctLen === maxL || correctLen === minL) && maxL !== minL) {
        issues.push({
          code: 'B5',
          prio: 'Medium',
          note: `correct is ${correctLen === maxL ? 'longest' : 'shortest'} (${correctLen} vs avg ${avgL.toFixed(1)})`,
        });
      }

      // B6 slash
      for (const o of opts) {
        if ((o.option_text || '').includes('/')) {
          issues.push({ code: 'B6', prio: 'Medium', note: `slash in option: "${o.option_text}"` });
          break;
        }
      }

      // B8 language mix (hangul in japanese-only context)
      for (const o of opts) {
        if (HANGUL_RE.test(o.option_text || '')) {
          issues.push({ code: 'B8', prio: 'Medium', note: `Korean hangul in option: "${o.option_text}"` });
          break;
        }
      }
      if (HANGUL_RE.test(q.question_text || '')) {
        issues.push({ code: 'B8', prio: 'Medium', note: 'Korean hangul in question_text' });
      }

      // A2 answer leak (with A2-exempt bypass)
      if (correct) {
        const leak = answerLeakRatio(q.question_text || '', correct.option_text || '');
        if (leak > 0.5) {
          const exempt = isA2Exempt(q.question_text || '');
          if (exempt.exempt) {
            // Special case: blank-fill where the correct answer appears verbatim
            // in the non-blank part of question_text (like sample 2 "傾向").
            // If the correct option text (full) appears as substring in stripped
            // question, still flag as A2 violation.
            if (exempt.kind === '（　）穴埋め') {
              // Structure-aware leak detection for fill-in-blank:
              // 1) Split into quote (inside 「」) vs frame (outside).
              // 2) If answer appears in frame → real leak.
              // 3) If answer appears only in quote, check whether predecessor
              //    chars (2 chars before blank) + answer forms a compound
              //    that appears elsewhere in the quote → real leak.
              //    Otherwise it's a coincidental char overlap → exempt.
              const qtext = q.question_text || '';
              const ans = (correct.option_text || '').trim();
              // Extract quote content if 「」 exists; otherwise treat entire
              // text as the "quote sentence" and skip frame check.
              const quoteMatch = qtext.match(/「([^」]*)」/);
              const hasQuote = !!quoteMatch;
              const quote = hasQuote ? quoteMatch[1] : qtext;
              const frame = hasQuote ? qtext.replace(/「[^」]*」/, '') : '';
              // Find blank position within quote
              const blankMatch = quote.match(BLANK_RE);
              const predecessor = blankMatch
                ? quote.slice(Math.max(0, blankMatch.index - 2), blankMatch.index)
                : '';
              // Remove blank marker for compound search
              const quoteNoBlank = quote.replace(BLANK_RE, '\u0000');

              let realLeak = false;
              let reason = '';
              // Frame check only when 「」 structure exists
              if (hasQuote && ans.length >= 2 && frame.includes(ans)) {
                realLeak = true;
                reason = `answer "${ans}" appears in question frame (outside 「」)`;
              } else if (ans.length >= 1 && predecessor && quoteNoBlank.includes(predecessor + ans)) {
                realLeak = true;
                reason = `compound "${predecessor}${ans}" appears elsewhere in sentence`;
              }
              if (realLeak) {
                issues.push({ code: 'A2', prio: 'High', note: `blank-fill leak: ${reason}` });
              } else {
                issues.push({
                  code: 'A2-exempt',
                  prio: 'Info',
                  note: `coincidental char overlap (${(leak * 100).toFixed(0)}%); predecessor "${predecessor}" + answer "${ans}" not found as compound`,
                });
              }
            } else {
              issues.push({
                code: 'A2-exempt',
                prio: 'Info',
                note: `exempt (${exempt.kind}), bigram overlap ${(leak * 100).toFixed(0)}%`,
              });
            }
          } else {
            issues.push({
              code: 'A2',
              prio: 'High',
              note: `answer-leak bigram ratio = ${(leak * 100).toFixed(0)}%`,
            });
          }
        }
      }
    }

    // C9 explanation
    const expl = (q.explanation || '').trim();
    if (!expl || strLen(expl) < 20) {
      issues.push({
        code: 'C9',
        prio: 'Low',
        note: expl ? `explanation only ${strLen(expl)} chars` : 'explanation is NULL/empty',
      });
    }

    // D-a difficulty
    if (!q.difficulty) {
      issues.push({ code: 'D-a', prio: 'Governance', note: 'difficulty is NULL' });
    }

    // Claims
    const qClaims = claimsByQ.get(q.id) || [];
    if (qClaims.length > 0) {
      issues.push({ code: 'CLAIM', prio: 'High', note: `${qClaims.length} claim(s) filed` });
    }

    if (issues.length > 0) {
      results.push({ q, opts, claims: qClaims, issues, details, quiz: quizById.get(q.quiz_id) });
    }
  }

  return results;
}

// ─── Report ──────────────────────────────────────────────────────────────────

function buildReport(category, totalQuestions, results) {
  const priorityRank = (p) => ({ High: 0, Medium: 1, Low: 2, Governance: 3, Info: 4 }[p] ?? 5);

  // Separate governance + info from actionable buckets
  const govOnly = [];
  const highList = [];
  const medList = [];
  const lowList = [];
  let exemptCount = 0;
  for (const r of results) {
    // Count info (A2-exempt) records for stats
    exemptCount += r.issues.filter((i) => i.prio === 'Info').length;
    const nonGov = r.issues.filter((i) => i.prio !== 'Governance' && i.prio !== 'Info');
    if (nonGov.length === 0) {
      // If only governance+info remain, either governance-only or pure-info (skip)
      if (r.issues.some((i) => i.prio === 'Governance')) govOnly.push(r);
      continue;
    }
    const topPrio = nonGov.map((i) => i.prio).sort((a, b) => priorityRank(a) - priorityRank(b))[0];
    if (topPrio === 'High') highList.push(r);
    else if (topPrio === 'Medium') medList.push(r);
    else lowList.push(r);
  }

  const totalIssues = highList.length + medList.length + lowList.length;
  const pct = (n) => (totalQuestions ? ((n / totalQuestions) * 100).toFixed(1) : '0.0');

  const today = new Date().toISOString().slice(0, 10);
  const lines = [];
  lines.push(`# JLPT ${capitalize(category)} 카테고리 감사 리포트`);
  lines.push('');
  lines.push(`**감사일**: ${today}`);
  lines.push(`**대상 문제 수**: ${totalQuestions}`);
  lines.push(`**DB 조회 기준**: quiz_questions.question_category='${category}' OR quiz_id IN (${CATEGORY_QUIZ_IDS[category].join(', ')})`);
  lines.push('');
  lines.push('## 요약');
  lines.push('');
  lines.push('| 우선순위 | 이슈 수 | 비율 |');
  lines.push('|---------|--------|------|');
  lines.push(`| High    | ${highList.length}건    | ${pct(highList.length)}% |`);
  lines.push(`| Medium  | ${medList.length}건    | ${pct(medList.length)}% |`);
  lines.push(`| Low     | ${lowList.length}건    | ${pct(lowList.length)}% |`);
  lines.push(`| Governance (별도) | ${govOnly.length + results.filter((r) => r.issues.some((i) => i.prio === 'Governance') && !govOnly.includes(r)).length}건 | — |`);
  lines.push('');
  lines.push(`**총 이슈 문제 수**: ${totalIssues} / ${totalQuestions} (${pct(totalIssues)}%)`);
  lines.push(`**A2-exempt (필터링됨)**: ${exemptCount}건`);
  lines.push('');

  const renderItem = (r, short = false) => {
    const out = [];
    out.push(`### Q-${r.q.id}`);
    out.push(`- quiz_id: ${r.q.quiz_id}${r.quiz ? ` (${r.quiz.title || ''})` : ''}`);
    out.push(`- question_category: ${r.q.question_category || '-'}, difficulty: ${r.q.difficulty || 'NULL'}`);
    out.push(`- 클레임: ${r.claims.length > 0 ? `있음(${r.claims.length}건)` : '없음'}`);
    out.push(`- 위반 항목: [${r.issues.map((i) => `${i.code}${i.prio !== 'Governance' ? '' : ''}`).join(', ')}]`);
    if (!short) {
      out.push(`- question_text: "${(r.q.question_text || '').replace(/\n/g, ' ').slice(0, 300)}"`);
      out.push(`- options:`);
      const sortedOpts = [...r.opts].sort((a, b) => (a.sort_order || 0) - (b.sort_order || 0));
      sortedOpts.forEach((o, idx) => {
        const mark = o.is_correct ? '[정답] ' : '';
        out.push(`  ${idx + 1}. ${mark}"${(o.option_text || '').replace(/\n/g, ' ')}" (${strLen(o.option_text)}자)`);
      });
      out.push(`- 자동감지 근거:`);
      for (const iss of r.issues) {
        out.push(`  - **${iss.code}** (${iss.prio}): ${iss.note}`);
      }
    } else {
      out.push(`  근거: ${r.issues.map((i) => `${i.code}:${i.note}`).join(' | ')}`);
    }
    out.push('---');
    return out.join('\n');
  };

  lines.push('## High 우선순위 이슈');
  lines.push('');
  if (highList.length === 0) lines.push('_없음_');
  else for (const r of highList) lines.push(renderItem(r));
  lines.push('');

  lines.push('## Medium 우선순위 이슈');
  lines.push('');
  if (medList.length === 0) lines.push('_없음_');
  else for (const r of medList) lines.push(renderItem(r));
  lines.push('');

  lines.push('## Low 우선순위 이슈');
  lines.push('');
  if (lowList.length === 0) lines.push('_없음_');
  else for (const r of lowList) lines.push(renderItem(r, true));
  lines.push('');

  lines.push('## 거버넌스 이슈 (별도 마이그레이션 대상)');
  lines.push('');
  const govAll = results.filter((r) => r.issues.some((i) => i.prio === 'Governance'));
  if (govAll.length === 0) lines.push('_없음_');
  else {
    lines.push(`거버넌스 위반 문제: ${govAll.length}건`);
    lines.push('');
    for (const r of govAll) {
      const govIssues = r.issues.filter((i) => i.prio === 'Governance');
      lines.push(`- Q-${r.q.id} (quiz_id=${r.q.quiz_id}): ${govIssues.map((i) => `${i.code} ${i.note}`).join(' / ')}`);
    }
  }
  lines.push('');

  lines.push('## 자동감지 불가 항목 (Fixer가 수동 판단 필요)');
  lines.push('');
  lines.push('- **A1 학습범위 준수**: 자동감지 불가. Fixer가 N-level 기준(N5~N1)으로 각 문제 난이도 대비 요구 지식 범위를 검토 필요.');
  lines.push('- **A3 단일정답 보장**: 자동감지 불가. 각 오답이 맥락상 정답이 될 가능성 수동 검토.');
  lines.push('- **B4 오답지 범위**: 자동감지 불가. 오답 선택지가 해당 lesson/N-level 학습 범위 내인지 수동 확인.');
  lines.push('- **B6 상호배타 (동의어/포함관계)**: 슬래시 외 동의어·포함관계는 자동감지 불가.');
  lines.push('');

  return lines.join('\n');
}

function capitalize(s) {
  return s[0].toUpperCase() + s.slice(1);
}

// ─── Main ────────────────────────────────────────────────────────────────────

(async () => {
  console.log(`\n=== Investigator: category="${category}" ===\n`);
  const { questions, options, claims, quizRows } = await fetchAll();
  const results = analyze({ questions, options, claims, quizRows });

  console.log(`\nAnalyzed ${questions.length} questions -> ${results.length} with issues`);

  const report = buildReport(category, questions.length, results);
  const outPath = path.join(ROOT, 'docs', 'audit', `jlpt_${category}_issues.md`);
  fs.writeFileSync(outPath, report, 'utf8');
  console.log(`\nReport written to: ${outPath}`);

  // Quick summary
  const counts = { High: 0, Medium: 0, Low: 0, Governance: 0 };
  for (const r of results) {
    const nonGov = r.issues.filter((i) => i.prio !== 'Governance');
    if (nonGov.length === 0) {
      if (r.issues.some((i) => i.prio === 'Governance')) counts.Governance++;
      continue;
    }
    const priorityRank = (p) => ({ High: 0, Medium: 1, Low: 2 }[p] ?? 9);
    const top = nonGov.map((i) => i.prio).sort((a, b) => priorityRank(a) - priorityRank(b))[0];
    counts[top]++;
    if (r.issues.some((i) => i.prio === 'Governance')) counts.Governance++;
  }
  console.log(`\nSummary: High=${counts.High}, Medium=${counts.Medium}, Low=${counts.Low}, Governance=${counts.Governance}`);
})().catch((e) => {
  console.error('FATAL:', e);
  process.exit(1);
});
