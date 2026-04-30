#!/usr/bin/env node
// Replicate TTS precache logic and surface actual errors
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const apiKey = getEnv('GOOGLE_CLOUD_TTS_API_KEY');
console.log(`API key present: ${!!apiKey} (length=${apiKey?.length || 0})`);

// Replicate parseDialogueScript from tts-utils.ts
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

const voicePool = [
  { name: 'ja-JP-Neural2-B', ssmlGender: 'FEMALE' },
  { name: 'ja-JP-Neural2-C', ssmlGender: 'MALE' },
  { name: 'ja-JP-Neural2-D', ssmlGender: 'MALE' },
  { name: 'ja-JP-Standard-A', ssmlGender: 'FEMALE' },
];
const narratorVoice = { name: 'ja-JP-Neural2-B', ssmlGender: 'FEMALE' };

async function synthesize(text, voice, speakingRate = 1.0) {
  const response = await fetch(
    'https://texttospeech.googleapis.com/v1/text:synthesize',
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': apiKey,
      },
      body: JSON.stringify({
        input: { text },
        voice: { languageCode: 'ja-JP', ...voice },
        audioConfig: { audioEncoding: 'MP3', speakingRate },
      }),
    }
  );
  if (!response.ok) {
    const err = await response.text();
    throw new Error(`TTS API ${response.status}: ${err.slice(0, 300)}`);
  }
  const data = await response.json();
  return Buffer.from(data.audioContent, 'base64').length;
}

// Test 1: simple vocab word
console.log('\n=== Test 1: Simple vocabulary word ===');
try {
  const bytes = await synthesize('食べる', narratorVoice);
  console.log(`OK - ${bytes} bytes`);
} catch (e) {
  console.log(`FAIL - ${e.message}`);
}

// Test 2: listening_quiz sample
console.log('\n=== Test 2: listening_quiz (2-speaker dialogue) ===');
const { data: samples } = await supabase
  .from('quiz_questions')
  .select('id, question_text')
  .eq('question_category', 'listening')
  .limit(3);

for (const q of samples) {
  // Extract script (before 質問：)
  const cleaned = q.question_text.replace(/\\n/g, '\n');
  const markerIdx = cleaned.lastIndexOf('質問：');
  const script = markerIdx !== -1 ? cleaned.substring(0, markerIdx).trim() : cleaned;

  const { isDialogue, segments } = parseDialogueScript(script);
  console.log(`\nQ-${q.id.slice(0,8)}: isDialogue=${isDialogue}, segments=${segments.length}`);
  for (let i = 0; i < segments.length; i++) {
    const s = segments[i];
    console.log(`  [${i}] speaker=${s.speaker || 'narrator'} text="${s.text.slice(0, 50)}..." (len=${s.text.length})`);
  }

  // Try to synthesize each segment
  try {
    let totalBytes = 0;
    const speakerVoiceMap = new Map();
    let voiceIndex = 0;
    for (const seg of segments) {
      let voice = narratorVoice;
      if (seg.speaker) {
        if (!speakerVoiceMap.has(seg.speaker)) {
          speakerVoiceMap.set(seg.speaker, voicePool[voiceIndex % voicePool.length]);
          voiceIndex++;
        }
        voice = speakerVoiceMap.get(seg.speaker);
      }
      const bytes = await synthesize(seg.text, voice);
      totalBytes += bytes;
    }
    console.log(`  ✓ Total ${totalBytes} bytes`);
  } catch (e) {
    console.log(`  ✗ FAIL: ${e.message}`);
  }
}

// Test 3: jlpt_listening_scripts table
console.log('\n=== Test 3: jlpt_listening_scripts ===');
const { data: jlptScripts } = await supabase
  .from('jlpt_listening_scripts')
  .select('id, script')
  .limit(3);

if (!jlptScripts) {
  console.log('Table not accessible or empty');
} else {
  for (const row of jlptScripts) {
    const script = row.script.replace(/\\n/g, '\n');
    const { isDialogue, segments } = parseDialogueScript(script);
    console.log(`\nScript ${row.id}: isDialogue=${isDialogue}, segments=${segments.length}, total len=${script.length}`);
    for (let i = 0; i < Math.min(segments.length, 5); i++) {
      const s = segments[i];
      console.log(`  [${i}] speaker=${s.speaker || 'narrator'} text="${s.text.slice(0, 80)}" (len=${s.text.length})`);
    }
    if (segments.length > 5) console.log(`  ... (${segments.length - 5} more)`);

    try {
      let totalBytes = 0;
      const speakerVoiceMap = new Map();
      let voiceIndex = 0;
      for (const seg of segments) {
        let voice = narratorVoice;
        if (seg.speaker) {
          if (!speakerVoiceMap.has(seg.speaker)) {
            speakerVoiceMap.set(seg.speaker, voicePool[voiceIndex % voicePool.length]);
            voiceIndex++;
          }
          voice = speakerVoiceMap.get(seg.speaker);
        }
        const bytes = await synthesize(seg.text, voice);
        totalBytes += bytes;
      }
      console.log(`  ✓ Total ${totalBytes} bytes`);
    } catch (e) {
      console.log(`  ✗ FAIL: ${e.message}`);
    }
  }
}
