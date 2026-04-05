#!/usr/bin/env node
// Simulate parseListeningQuestion + parseDialogueScript on real DB data
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

// Copy of parseListeningQuestion from ExamClient.tsx
function parseListeningQuestion(text) {
  const normalized = text.replace(/\\n/g, '\n');
  const parts = normalized.split('\n\n');
  if (parts.length < 3) return null;
  const question = parts[parts.length - 1];
  const script = parts.slice(0, parts.length - 1).join('\n\n');
  return { script, question };
}

// Copy of parseDialogueScript from tts-utils.ts
function parseDialogueScript(text) {
  const lines = text.split('\n');
  const dialoguePattern = /^(.{1,15})：(.+)$/;
  let dialogueLineCount = 0;
  const segments = [];
  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed) continue;
    const match = trimmed.match(dialoguePattern);
    if (match) {
      dialogueLineCount++;
      segments.push({ speaker: match[1].trim(), text: match[2].trim() });
    } else {
      segments.push({ speaker: null, text: trimmed });
    }
  }
  if (dialogueLineCount >= 1) return { isDialogue: true, segments };
  return { isDialogue: false, segments: [{ speaker: null, text }] };
}

const { data } = await supabase
  .from('quiz_questions')
  .select('id, question_text')
  .eq('question_category', 'listening')
  .limit(1000);

let dialogueOk = 0, dialogueFail = 0, parseFail = 0;
for (const q of data) {
  const parsed = parseListeningQuestion(q.question_text);
  if (!parsed) { parseFail++; console.log(`PARSE_FAIL: ${q.id}`); continue; }
  const { isDialogue, segments } = parseDialogueScript(parsed.script);
  if (isDialogue) {
    dialogueOk++;
  } else {
    dialogueFail++;
    console.log(`\nNOT_DIALOGUE: ${q.id}`);
    console.log(`  script: ${JSON.stringify(parsed.script.slice(0, 150))}`);
    console.log(`  segments sent to TTS:`);
    for (const s of segments) {
      console.log(`    [${s.speaker || 'narrator'}] ${s.text.slice(0, 80)}`);
    }
  }
}
console.log(`\n=== Summary ===`);
console.log(`dialogueOk=${dialogueOk} dialogueFail=${dialogueFail} parseFail=${parseFail}`);
