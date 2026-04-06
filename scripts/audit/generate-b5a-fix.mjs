#!/usr/bin/env node
/**
 * Generate B5-a fix SQL from b5a_data.json files.
 *
 * Strategy: For each question where correct=longest, pad the SHORTEST distractor
 * to be >= correct length by appending a plausible suffix.
 * For correct=shortest, pad all distractors DOWN is impossible, so we pad the
 * correct...wait, we can't change correct. Instead, pad shorter distractors
 * to reduce the ratio and make another option shorter than correct.
 *
 * Actually: For correct=longest, we need at least ONE distractor to be >= correct length.
 * For correct=shortest, we need at least ONE distractor to be <= correct length.
 * For ratio-only (no longest/shortest), we need to reduce max/min ratio to ≤1.2.
 *
 * Approach for correct=longest (most common, 90%+ of cases):
 *   Pick the longest distractor (closest to correct) and pad it to correctLen+1.
 *   This minimizes the text change needed.
 *
 * Usage:
 *   node scripts/audit/generate-b5a-fix.mjs <category> <migration_number>
 * Example:
 *   node scripts/audit/generate-b5a-fix.mjs algorithm 156
 */

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..', '..');

const category = process.argv[2];
const migNum = process.argv[3];
if (!category || !migNum) {
  console.error('Usage: node scripts/audit/generate-b5a-fix.mjs <category> <migration_number>');
  process.exit(1);
}

const dataPath = path.join(ROOT, 'docs', 'audit', `cs_${category}_b5a_data.json`);
const data = JSON.parse(fs.readFileSync(dataPath, 'utf8'));

// Padding suffixes — technical-sounding additions that extend text naturally
const PADDING_SUFFIXES_JP = [
  'という特徴がある',     // 9 chars
  'という性質を持つ',     // 8 chars
  'ことが知られている',   // 9 chars
  'という点が挙げられる', // 10 chars
  'のが一般的である',     // 8 chars
  'とされている',         // 6 chars
  'と考えられている',     // 8 chars
  'という手法である',     // 8 chars
  'ことが求められる',     // 8 chars
  'ように設計されている', // 10 chars
];

function padOption(text, targetLen) {
  const currentLen = [...text].length;
  if (currentLen >= targetLen) return text;

  const stripped = text.replace(/[。]$/, '');

  // Grammar-aware padding based on sentence ending
  // Japanese verb conjugation: dictionary form ends in る/す/く/ぐ/む/ぶ/つ/ぬ/う
  const patterns = [
    // Ends with する (suru verb) → nominalize with こと
    { re: /する$/, suffixes: [
      'ことを目的とした手法である',        // 12
      'ための処理を行う方式である',         // 12
      'ことが主な目的である',               // 9
      '処理のことである',                   // 7
      'ための手法である',                   // 7
    ]},
    // Ends with い-adjective (ない/よい/しい/かい etc.) → add とされている (NOT であるとされている)
    { re: /[ぁ-んァ-ヴ]い$/, suffixes: [
      'とされている処理方式である',         // 12
      'ことが一般的に知られている',         // 12
      'と考えられている手法である',         // 12
      'ことが前提である',                   // 7
      'とされている',                       // 5
    ]},
    // Keep the ない pattern for explicit negative
    { re: /ない$/, suffixes: [
      'とされている処理方式である',         // 12
      'ことが一般的に知られている',         // 12
      'と考えられている手法である',         // 12
      'ことが前提である',                   // 7
      'とされている',                       // 5
    ]},
    // Ends with other verbs (る/す/く etc.) → nominalize with こと/もの
    { re: /[るすくぐむぶつぬう]$/, suffixes: [
      'ことを目的とした手法である',         // 12
      'ことが主な特徴である',               // 9
      'ものとして知られている',             // 10
      'ための手法として知られている',       // 13
      'ことが一般的である',                 // 8
      '手法のことである',                   // 7
    ]},
    // Ends with こと → add condition/requirement
    { re: /こと$/, suffixes: [
      'が前提条件として必要である',         // 11
      'が必要条件となっている',             // 10
      'が求められている',                   // 7
    ]},
    // Ends with ある/いる (state verbs) → add context
    { re: /(?:ある|いる)$/, suffixes: [
      '点が特徴として挙げられる',           // 11
      'ことが一般的に知られている',         // 12
      '場合に適している',                   // 7
    ]},
    // Ends with noun (手法/方式/構造/ソート/アルゴリズム etc.)
    { re: /(?:手法|方式|構造|ソート|アルゴリズム|処理|方法|探索|法)$/, suffixes: [
      'の一種として知られている',           // 10
      'として分類されている',               // 9
      'に該当する',                         // 4
      'であると定義されている',             // 10
    ]},
    // Ends with other nouns or general text
    { re: /./, suffixes: [
      'として知られている手法である',       // 12
      'に該当する処理方式である',           // 10
      'であるとされている',                 // 8
      'に関する手法である',                 // 8
    ]},
  ];

  for (const { re, suffixes } of patterns) {
    if (re.test(stripped)) {
      for (const suffix of suffixes) {
        const candidate = stripped + suffix;
        const candidateLen = [...candidate].length;
        if (candidateLen >= targetLen && candidateLen <= targetLen + 4) {
          return candidate;
        }
      }
      // If no suffix fits in range, use best fit
      for (const suffix of suffixes) {
        const candidate = stripped + suffix;
        const candidateLen = [...candidate].length;
        if (candidateLen >= targetLen) {
          return candidate;
        }
      }
    }
  }

  // Fallback
  return stripped + 'として一般的に知られている';
}

const lines = [];
lines.push(`-- ${String(migNum).padStart(5, '0')}_fix_cs_${category}_b5a.sql`);
lines.push(`-- CS ${category} B5-a 길이편향 수정`);
lines.push(`-- 생성일: ${new Date().toISOString().slice(0, 10)}`);
lines.push(`-- 방침: UPDATE only. 정답 텍스트 불변. 오답 패딩으로 정답=최장 패턴 해소.`);
lines.push('');
lines.push('BEGIN;');
lines.push('');

let confirmed = 0;
let dismissed = 0;
let updates = 0;

for (const q of data) {
  const avgLen = q.opts.reduce((a, o) => a + o.len, 0) / q.opts.length;
  const maxLen = Math.max(...q.opts.map(o => o.len));
  const minLen = Math.min(...q.opts.map(o => o.len));
  const diff = maxLen - minLen;

  // Dismiss conditions
  if (avgLen <= 8 || diff <= 2) {
    dismissed++;
    continue;
  }

  confirmed++;
  const correct = q.opts.find(o => o.correct);
  const distractors = q.opts.filter(o => !o.correct).sort((a, b) => b.len - a.len);

  if (q.correctIsLongest && correct) {
    // Need at least one distractor >= correct length
    // Pick the longest distractor (least change needed)
    const target = distractors[0]; // longest distractor
    const targetLen = correct.len + 1; // make it 1 char longer than correct
    const padded = padOption(target.text, targetLen);
    const paddedLen = [...padded].length;

    lines.push(`-- Q-${q.qid.slice(0, 8)}: ${q.qtext.slice(0, 40)}`);
    lines.push(`-- correct=${correct.len}, dist=[${distractors.map(d => d.len).join(',')}] → pad longest dist ${target.len}→${paddedLen}`);
    lines.push(`UPDATE quiz_question_options SET option_text = '${padded.replace(/'/g, "''")}'`);
    lines.push(`WHERE id = '${target.id}';`);
    lines.push('');
    updates++;
  } else if (q.correctIsShortest && correct) {
    // Correct is shortest — need one distractor shorter than correct
    // We can't make correct longer. Instead, trim the shortest distractor?
    // No — we can only pad. So pad the LONGEST distractor to be even longer,
    // making the ratio worse... That doesn't help.
    //
    // Alternative: pad the two middle distractors to match the longest,
    // then the correct being shortest is less of a pattern.
    // Actually, the best fix is to make one distractor SHORTER than correct.
    // But we can only pad (make longer), not trim.
    //
    // For correct=shortest, we need to NOTE it for manual review.
    lines.push(`-- Q-${q.qid.slice(0, 8)}: ${q.qtext.slice(0, 40)} [MANUAL: correct=shortest]`);
    lines.push(`-- correct=${correct.len}, dist=[${distractors.map(d => d.len).join(',')}]`);
    lines.push(`-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors`);
    lines.push('');
  } else {
    // ratio > 1.2 but correct not at extreme
    // Pad shortest option to reduce ratio
    const shortest = [...q.opts].sort((a, b) => a.len - b.len)[0];
    if (!shortest.correct) {
      const targetLen = Math.ceil(maxLen / 1.2);
      const padded = padOption(shortest.text, targetLen);
      const paddedLen = [...padded].length;

      lines.push(`-- Q-${q.qid.slice(0, 8)}: ${q.qtext.slice(0, 40)} [ratio fix]`);
      lines.push(`-- ratio=${q.ratio}, min=${minLen}→${paddedLen}, max=${maxLen}`);
      lines.push(`UPDATE quiz_question_options SET option_text = '${padded.replace(/'/g, "''")}'`);
      lines.push(`WHERE id = '${shortest.id}';`);
      lines.push('');
      updates++;
    } else {
      lines.push(`-- Q-${q.qid.slice(0, 8)}: ${q.qtext.slice(0, 40)} [MANUAL: correct=shortest in ratio-only]`);
      lines.push('');
    }
  }
}

lines.push('COMMIT;');

const summary = `-- CONFIRMED: ${confirmed}건 / DISMISSED: ${dismissed}건 / UPDATE: ${updates}건`;
lines.splice(3, 0, summary);

const outPath = path.join(ROOT, 'supabase', 'migrations', `${String(migNum).padStart(5, '0')}_fix_cs_${category}_b5a.sql`);
fs.writeFileSync(outPath, lines.join('\n'), 'utf8');
console.log(`Written to: ${outPath}`);
console.log(`Confirmed: ${confirmed}, Dismissed: ${dismissed}, Updates: ${updates}`);
console.log(`Manual review needed: ${confirmed - updates} items (correct=shortest)`);
