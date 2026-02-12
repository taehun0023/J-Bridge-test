/**
 * Supabase Seed Data 적용 스크립트
 * 
 * 사용법:
 * 1. Supabase CLI 설치: npm install -g supabase
 * 2. Supabase 로그인: supabase login
 * 3. 프로젝트 링크: supabase link --project-ref your-project-ref
 * 4. 이 스크립트 실행: node scripts/apply-seeds.js
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const supabaseDir = path.join(__dirname, '..', 'supabase');

const seedFiles = [
  'seed.sql',           // 기본 seed (courses, 샘플 데이터)
  'seed_jlpt_n5.sql',   // N5 단어
  'seed_jlpt_n4.sql',   // N4 단어
  'seed_jlpt_n3.sql',   // N3 단어
  'seed_jlpt_n2.sql',   // N2 단어
  'seed_jlpt_n1.sql',   // N1 단어
  'seed_it_glossary.sql', // IT 용어집
  'seed_assessment_quizzes.sql', // 초기 등급 테스트 (390문항)
];

console.log('🌱 Supabase Seed Data 적용 시작...\n');

seedFiles.forEach((file, index) => {
  const filePath = path.join(supabaseDir, file);
  
  if (!fs.existsSync(filePath)) {
    console.log(`⚠️  ${file} 파일을 찾을 수 없습니다. 건너뜁니다.`);
    return;
  }

  console.log(`[${index + 1}/${seedFiles.length}] ${file} 실행 중...`);
  
  try {
    // Supabase CLI를 사용하여 SQL 실행
    // 주의: Supabase CLI가 설치되어 있고 프로젝트가 링크되어 있어야 합니다
    const sql = fs.readFileSync(filePath, 'utf8');
    
    // psql을 통한 직접 실행 (Supabase 연결 정보 필요)
    // 또는 Supabase Dashboard SQL Editor에 복사하여 실행
    console.log(`✅ ${file} 준비 완료`);
    console.log(`   → Supabase Dashboard SQL Editor에서 이 파일을 실행하세요: ${filePath}\n`);
  } catch (error) {
    console.error(`❌ ${file} 처리 중 오류:`, error.message);
  }
});

console.log('📋 실행 순서:');
console.log('1. Supabase Dashboard (https://supabase.com/dashboard) 접속');
console.log('2. 프로젝트 선택 → SQL Editor 열기');
console.log('3. 위의 파일들을 순서대로 복사하여 실행');
console.log('\n또는 각 파일의 내용을 하나의 SQL 파일로 합쳐서 실행할 수 있습니다.');






