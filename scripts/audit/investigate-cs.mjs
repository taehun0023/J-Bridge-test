#!/usr/bin/env node
/**
 * Investigator audit script for CS Knowledge (CS知識) quiz_questions quality.
 *
 * Usage:
 *   node scripts/audit/investigate-cs.mjs <category>
 * Example:
 *   node scripts/audit/investigate-cs.mjs algorithm
 *
 * Categories: algorithm, data_structure, basic_theory, computer_architecture,
 *             database, network, os, security
 *
 * Rubric reference: docs/exam_quality_rubric.md (v2)
 */

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createClient } from '@supabase/supabase-js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, '..', '..');

// ─── Config ──────────────────────────────────────────────────────────────────

const VALID_CATEGORIES = [
  'algorithm', 'data_structure', 'basic_theory', 'computer_architecture',
  'database', 'network', 'os', 'security',
];

const category = process.argv[2];
if (!category || !VALID_CATEGORIES.includes(category)) {
  console.error('Usage: node scripts/audit/investigate-cs.mjs <category>');
  console.error(`Categories: ${VALID_CATEGORIES.join(', ')}`);
  process.exit(1);
}

// CS pool quiz IDs (60000001-0000-0000-0000-00000000000X)
const CS_QUIZ_IDS = {
  algorithm:              ['60000001-0000-0000-0000-000000000001'],
  data_structure:         ['60000001-0000-0000-0000-000000000002'],
  basic_theory:           ['60000001-0000-0000-0000-000000000003'],
  database:               ['60000001-0000-0000-0000-000000000004'],
  network:                ['60000001-0000-0000-0000-000000000005'],
  os:                     ['60000001-0000-0000-0000-000000000006'],
  security:               ['60000001-0000-0000-0000-000000000007'],
  computer_architecture:  ['60000001-0000-0000-0000-000000000010'],
};

const ASSESSMENT_QUIZ_ID = 'a0000003-0000-0000-0000-000000000003';
const quizIdSet = CS_QUIZ_IDS[category] || [];

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

// A2 exempt patterns (same as BJ — applies to grammar-style questions)
const A2_EXEMPT_PATTERNS = [
  /ます形|て形|た形|辞書形|受身|使役|可能形|命令形|意向形|仮定形|[一-龥ぁ-んァ-ヴー]形|活用/,
  /に変える|に変換|に直|言い換え|書き換え|にしなさい|に直しなさい/,
  /尊敬語|謙譲語|丁寧語|敬語に|敬語で|の丁寧形|の尊敬|の謙譲/,
  /読み方|ふりがな|読み仮名|漢字|読みは|読みで/,
  /意味|類義語|対義語|反対語|同じ意味|近い意味|同義語/,
  /何を表|表現|役割|用法|ニュアンス|機能|働き|使い方/,
];

const BLANK_RE = /（　*）|\(\s*\)|＿＿+|___+|（\s*）/;

function isA2Exempt(questionText) {
  if (!questionText) return { exempt: false };
  for (const re of A2_EXEMPT_PATTERNS) {
    const m = questionText.match(re);
    if (m) return { exempt: true, kind: m[0] };
  }
  if (BLANK_RE.test(questionText)) {
    const stripped = questionText.replace(BLANK_RE, '').replace(/\s+/g, '');
    if (strLen(stripped) >= 10) return { exempt: true, kind: '（　）穴埋め' };
  }
  return { exempt: false };
}

function strLen(s) {
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
  // Resolve quiz UUIDs
  const allQuizIds = [...quizIdSet, ASSESSMENT_QUIZ_ID];
  const { data: quizRows } = await supabase
    .from('quizzes')
    .select('id, title')
    .in('id', allQuizIds);

  const resolvedQuizIds = (quizRows || []).map((r) => r.id);
  console.log(`Resolved ${resolvedQuizIds.length} quiz rows`);

  // Fetch questions: by category OR quiz_id
  let query = supabase
    .from('quiz_questions')
    .select('id, quiz_id, question_text, explanation, difficulty, question_category, question_subtype, points, sort_order');

  if (resolvedQuizIds.length > 0) {
    const inList = resolvedQuizIds.map((id) => `"${id}"`).join(',');
    query = query.or(`question_category.eq.${category},quiz_id.in.(${inList})`);
  } else {
    query = query.eq('question_category', category);
  }

  // Paginate
  const questions = [];
  let offset = 0;
  const PAGE = 1000;
  while (true) {
    const { data, error } = await query.range(offset, offset + PAGE - 1);
    if (error) throw error;
    if (!data || data.length === 0) break;
    questions.push(...data);
    if (data.length < PAGE) break;
    offset += data.length;
    query = supabase
      .from('quiz_questions')
      .select('id, quiz_id, question_text, explanation, difficulty, question_category, question_subtype, points, sort_order');
    if (resolvedQuizIds.length > 0) {
      const inList2 = resolvedQuizIds.map((id) => `"${id}"`).join(',');
      query = query.or(`question_category.eq.${category},quiz_id.in.(${inList2})`);
    } else {
      query = query.eq('question_category', category);
    }
  }

  // Filter to only questions matching this category
  const filtered = questions.filter((q) => (q.question_category || '').toLowerCase() === category);
  console.log(`Fetched ${questions.length} quiz_questions, ${filtered.length} matching category "${category}"`);

  if (filtered.length === 0) return { questions: [], options: [], claims: [], quizRows: quizRows || [] };

  const qIds = filtered.map((q) => q.id);

  // Batch fetch options
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

  // Fetch claims
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

  return { questions: filtered, options, claims, quizRows: quizRows || [] };
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
  const quizStats = new Map();

  for (const q of questions) {
    const opts = optByQ.get(q.id) || [];
    const issues = [];

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
      const correct = correctOpts[0];
      const correctLen = correct ? strLen(correct.option_text) : 0;

      // B5 skip conditions
      const UNIT_RE = /[0-9０-９%％円時人回分秒時間日月年歳件個本枚]/;
      const isNumericShortAnswer =
        lengths.every((l) => l <= 4) && opts.some((o) => UNIT_RE.test(o.option_text || ''));
      const avgL = lengths.reduce((a, b) => a + b, 0) / lengths.length;
      const isWordLevel = avgL <= 8;

      // B5-a: individual question length bias
      if (!isNumericShortAnswer && !isWordLevel) {
        if (maxL / minL > 1.2) {
          issues.push({
            code: 'B5-a',
            prio: 'Medium',
            note: `length ratio ${(maxL / minL).toFixed(2)}x (max=${maxL}, min=${minL})`,
          });
        }
        if (correct && maxL !== minL) {
          if (correctLen === maxL) {
            issues.push({
              code: 'B5-a',
              prio: 'Medium',
              note: `correct is longest (${correctLen} vs others ${lengths.filter((l) => l !== correctLen).join(',')})`,
            });
          } else if (correctLen === minL) {
            issues.push({
              code: 'B5-a',
              prio: 'Medium',
              note: `correct is shortest (${correctLen} vs others ${lengths.filter((l) => l !== correctLen).join(',')})`,
            });
          }
        }
      }

      // B5-b: quiz-level stats
      if (correct && q.quiz_id && !isNumericShortAnswer && !isWordLevel) {
        if (!quizStats.has(q.quiz_id)) quizStats.set(q.quiz_id, { total: 0, correctIsLongest: 0, correctIsShortest: 0 });
        const s = quizStats.get(q.quiz_id);
        s.total++;
        if (correctLen === maxL && maxL !== minL) s.correctIsLongest++;
        if (correctLen === minL && maxL !== minL) s.correctIsShortest++;
      }

      // B6 slash
      for (const o of opts) {
        if ((o.option_text || '').includes('/')) {
          issues.push({ code: 'B6', prio: 'Medium', note: `slash in option: "${o.option_text}"` });
          break;
        }
      }

      // B8: Korean hangul in CS (should be all Japanese)
      for (const o of opts) {
        if (HANGUL_RE.test(o.option_text || '')) {
          issues.push({ code: 'B8', prio: 'Medium', note: `Korean hangul in option: "${o.option_text}"` });
          break;
        }
      }
      if (HANGUL_RE.test(q.question_text || '')) {
        issues.push({ code: 'B8', prio: 'Medium', note: 'Korean hangul in question_text' });
      }

      // A2 answer leak
      if (correct) {
        const leak = answerLeakRatio(q.question_text || '', correct.option_text || '');
        if (leak > 0.5) {
          const exempt = isA2Exempt(q.question_text || '');
          if (exempt.exempt) {
            if (exempt.kind === '（　）穴埋め') {
              const qtext = q.question_text || '';
              const ans = (correct.option_text || '').trim();
              const quoteMatch = qtext.match(/「([^」]*)」/);
              const hasQuote = !!quoteMatch;
              const quote = hasQuote ? quoteMatch[1] : qtext;
              const frame = hasQuote ? qtext.replace(/「[^」]*」/, '') : '';
              const blankMatch = quote.match(BLANK_RE);
              const predecessor = blankMatch
                ? quote.slice(Math.max(0, blankMatch.index - 2), blankMatch.index)
                : '';
              const quoteNoBlank = quote.replace(BLANK_RE, '\u0000');

              let realLeak = false;
              let reason = '';
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
                  note: `coincidental char overlap (${(leak * 100).toFixed(0)}%)`,
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

    // D-a difficulty (CS: easy/medium/hard)
    const validDiff = ['easy', 'medium', 'hard'];
    if (!q.difficulty) {
      issues.push({ code: 'D-a', prio: 'Governance', note: 'difficulty is NULL' });
    } else if (!validDiff.includes(q.difficulty)) {
      issues.push({ code: 'D-a', prio: 'Governance', note: `difficulty="${q.difficulty}" (expected easy/medium/hard)` });
    }

    // D-b category validation
    if (!q.question_category || !VALID_CATEGORIES.includes(q.question_category)) {
      issues.push({ code: 'D-b', prio: 'Governance', note: `category="${q.question_category}" not in CS enum` });
    }

    // Claims
    const qClaims = claimsByQ.get(q.id) || [];
    if (qClaims.length > 0) {
      issues.push({ code: 'CLAIM', prio: 'High', note: `${qClaims.length} claim(s): ${qClaims.map(c => c.claim_reason || '').join('; ').slice(0, 200)}` });
    }

    if (issues.length > 0) {
      results.push({ q, opts, claims: qClaims, issues, quiz: quizById.get(q.quiz_id) });
    }
  }

  return { results, quizStats };
}

// ─── Report ──────────────────────────────────────────────────────────────────

function buildReport(category, totalQuestions, results, quizStats) {
  const priorityRank = (p) => ({ High: 0, Medium: 1, Low: 2, Governance: 3, Info: 4 }[p] ?? 5);

  const govOnly = [];
  const highList = [];
  const medList = [];
  const lowList = [];
  let exemptCount = 0;
  for (const r of results) {
    exemptCount += r.issues.filter((i) => i.prio === 'Info').length;
    const nonGov = r.issues.filter((i) => i.prio !== 'Governance' && i.prio !== 'Info');
    if (nonGov.length === 0) {
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
  lines.push(`# CS ${category} カテゴリ 감사 리포트`);
  lines.push('');
  lines.push(`**감사일**: ${today}`);
  lines.push(`**대상 문제 수**: ${totalQuestions}`);
  lines.push(`**Rubric**: docs/exam_quality_rubric.md v2`);
  lines.push('');
  lines.push('## 요약');
  lines.push('');
  lines.push('| 우선순위 | 이슈 수 | 비율 |');
  lines.push('|---------|--------|------|');
  lines.push(`| High    | ${highList.length}건    | ${pct(highList.length)}% |`);
  lines.push(`| Medium  | ${medList.length}건    | ${pct(medList.length)}% |`);
  lines.push(`| Low     | ${lowList.length}건    | ${pct(lowList.length)}% |`);
  lines.push(`| Governance (별도) | ${govOnly.length}건 | — |`);
  lines.push('');
  lines.push(`**총 이슈 문제 수**: ${totalIssues} / ${totalQuestions} (${pct(totalIssues)}%)`);
  lines.push(`**A2-exempt (필터링됨)**: ${exemptCount}건`);
  lines.push('');

  // B5-b quiz-level stats
  lines.push('## B5-b 퀴즈별 길이 편향 통계');
  lines.push('');
  lines.push('| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |');
  lines.push('|---------|--------|----------|------|----------|------|------|');
  const flaggedQuizzes = [];
  for (const [qid, s] of [...quizStats.entries()].sort((a, b) => b[1].total - a[1].total)) {
    const longPct = s.total ? (s.correctIsLongest / s.total * 100).toFixed(1) : '0.0';
    const shortPct = s.total ? (s.correctIsShortest / s.total * 100).toFixed(1) : '0.0';
    const longFlag = parseFloat(longPct) > 30;
    const shortFlag = parseFloat(shortPct) > 30;
    const verdict = longFlag || shortFlag ? 'FAIL' : 'OK';
    if (longFlag || shortFlag) flaggedQuizzes.push({ qid, ...s, longPct, shortPct });
    lines.push(`| ${qid.slice(0, 8)}... | ${s.total} | ${s.correctIsLongest} | ${longPct}% | ${s.correctIsShortest} | ${shortPct}% | **${verdict}** |`);
  }
  lines.push('');
  if (flaggedQuizzes.length > 0) {
    lines.push(`**B5-b 위반 퀴즈**: ${flaggedQuizzes.length}개 — 정답 길이 분포 재조정 필요`);
  } else {
    lines.push('**B5-b 위반 퀴즈**: 없음');
  }
  lines.push('');

  const renderItem = (r, short = false) => {
    const out = [];
    out.push(`### Q-${r.q.id}`);
    out.push(`- quiz_id: ${r.q.quiz_id}${r.quiz ? ` (${r.quiz.title || ''})` : ''}`);
    out.push(`- question_category: ${r.q.question_category || '-'}, difficulty: ${r.q.difficulty || 'NULL'}`);
    out.push(`- 클레임: ${r.claims.length > 0 ? `있음(${r.claims.length}건)` : '없음'}`);
    out.push(`- 위반 항목: [${r.issues.map((i) => i.code).join(', ')}]`);
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
      lines.push(`- Q-${r.q.id}: ${govIssues.map((i) => `${i.code} ${i.note}`).join(' / ')}`);
    }
  }
  lines.push('');

  lines.push('## 자동감지 불가 항목 (수동 판단 필요)');
  lines.push('');
  lines.push('- **A1 학습범위 준수**: CS 카테고리 내 다른 카테고리 지식 요구하는지 수동 확인');
  lines.push('- **A3 단일정답 보장**: 오답이 맥락상 정답이 될 가능성 수동 검토');
  lines.push('- **B4 오답지 범위**: 오답 선택지가 해당 카테고리 학습 범위 내인지 확인');
  lines.push('- **B6 상호배타 (동의어/포함관계)**: 슬래시 외 동의어·포함관계는 자동감지 불가');
  lines.push('');

  return lines.join('\n');
}

// ─── Main ────────────────────────────────────────────────────────────────────

(async () => {
  console.log(`\n=== CS Investigator: category="${category}" ===\n`);
  const data = await fetchAll();
  const { results, quizStats } = analyze(data);

  console.log(`\nAnalyzed ${data.questions.length} questions -> ${results.length} with issues`);

  // B5-b summary
  console.log('\n=== B5-b Quiz-level length bias ===');
  for (const [qid, s] of [...quizStats.entries()].sort((a, b) => b[1].total - a[1].total)) {
    const longPct = s.total ? (s.correctIsLongest / s.total * 100).toFixed(1) : '0.0';
    const shortPct = s.total ? (s.correctIsShortest / s.total * 100).toFixed(1) : '0.0';
    const flag = parseFloat(longPct) > 30 || parseFloat(shortPct) > 30 ? ' *** FAIL ***' : '';
    console.log(`  ${qid.slice(0, 8)}: ${s.total} qs, longest=${s.correctIsLongest} (${longPct}%), shortest=${s.correctIsShortest} (${shortPct}%)${flag}`);
  }

  const report = buildReport(category, data.questions.length, results, quizStats);
  const outPath = path.join(ROOT, 'docs', 'audit', `cs_${category}_issues.md`);
  fs.writeFileSync(outPath, report, 'utf8');
  console.log(`\nReport written to: ${outPath}`);

  // Quick summary
  const counts = { High: 0, Medium: 0, Low: 0, Governance: 0 };
  for (const r of results) {
    const nonGov = r.issues.filter((i) => i.prio !== 'Governance' && i.prio !== 'Info');
    if (nonGov.length === 0) {
      if (r.issues.some((i) => i.prio === 'Governance')) counts.Governance++;
      continue;
    }
    const topPrio = nonGov.map((i) => i.prio).sort((a, b) => ({ High: 0, Medium: 1, Low: 2 }[a] ?? 9) - ({ High: 0, Medium: 1, Low: 2 }[b] ?? 9))[0];
    counts[topPrio]++;
    if (r.issues.some((i) => i.prio === 'Governance')) counts.Governance++;
  }
  console.log(`\nSummary: High=${counts.High}, Medium=${counts.Medium}, Low=${counts.Low}, Governance=${counts.Governance}`);
})().catch((e) => {
  console.error('FATAL:', e);
  process.exit(1);
});
