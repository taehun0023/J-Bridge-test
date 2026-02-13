/**
 * 모든 seed 파일을 하나로 합치는 스크립트
 * 
 * 사용법: node scripts/merge-seeds.js
 * 결과: supabase/all_seeds.sql 파일 생성
 */

const fs = require('fs');
const path = require('path');

const supabaseDir = path.join(__dirname, '..', 'supabase');
const outputFile = path.join(supabaseDir, 'all_seeds.sql');

const seedFiles = [
  { file: 'seed.sql', comment: '기본 seed (courses, 샘플 데이터)' },
  { file: 'seed_jlpt_n5.sql', comment: 'JLPT N5 단어 (280개)' },
  { file: 'seed_jlpt_n4.sql', comment: 'JLPT N4 단어' },
  { file: 'seed_jlpt_n3.sql', comment: 'JLPT N3 단어' },
  { file: 'seed_jlpt_n2.sql', comment: 'JLPT N2 단어' },
  { file: 'seed_jlpt_n1.sql', comment: 'JLPT N1 단어 (200개)' },
  { file: 'seed_it_glossary_v2.sql', comment: 'IT 용어집 v2 (166개, reading 완전 보완)' },
  { file: 'seed_it_passport_security.sql', comment: 'IT 패스포트: セキュリティ (~35개)' },
  { file: 'seed_it_passport_network.sql', comment: 'IT 패스포트: ネットワーク (~30개)' },
  { file: 'seed_it_passport_database.sql', comment: 'IT 패스포트: データベース (~30개)' },
  { file: 'seed_it_passport_strategy.sql', comment: 'IT 패스포트: 経営・戦略 (~50개)' },
  { file: 'seed_it_passport_fundamentals.sql', comment: 'IT 패스포트: IT基礎 (~35개)' },
  { file: 'seed_business_expressions.sql', comment: 'ビジネス表現 (~60개)' },
  { file: 'seed_sentence_patterns.sql', comment: '文章パターン (~35개)' },
  { file: 'seed_employee_vocabulary.sql', comment: '사내 스프레드시트 데이터' },
  { file: 'seed_it_passport_quizzes.sql', comment: 'IT 패스포트 퀴즈 (55문항)' },
];

let mergedContent = `-- ============================================
-- J-Bridge All Seed Data (통합 파일)
-- 생성일: ${new Date().toISOString()}
-- 
-- 이 파일은 다음 seed 파일들을 합친 것입니다:
${seedFiles.map(f => `--   - ${f.file} (${f.comment})`).join('\n')}
-- ============================================

-- 중복 방지: 기존 데이터 삭제 (선택사항 - 주석 해제하여 사용)
-- TRUNCATE TABLE jlpt_vocabulary CASCADE;
-- TRUNCATE TABLE it_glossary CASCADE;
-- TRUNCATE TABLE courses CASCADE;
-- TRUNCATE TABLE coding_problems CASCADE;
-- TRUNCATE TABLE coding_skill_exams CASCADE;
-- TRUNCATE TABLE ranking_seasons CASCADE;

`;

seedFiles.forEach(({ file, comment }, index) => {
  const filePath = path.join(supabaseDir, file);
  
  if (!fs.existsSync(filePath)) {
    console.log(`⚠️  ${file} 파일을 찾을 수 없습니다. 건너뜁니다.`);
    mergedContent += `\n-- ⚠️ ${file} 파일을 찾을 수 없습니다.\n\n`;
    return;
  }

  const content = fs.readFileSync(filePath, 'utf8');
  
  mergedContent += `\n-- ============================================\n`;
  mergedContent += `-- ${index + 1}. ${file} - ${comment}\n`;
  mergedContent += `-- ============================================\n\n`;
  mergedContent += content;
  mergedContent += `\n\n`;
  
  console.log(`✅ ${file} 추가됨`);
});

// 실행 후 확인 쿼리 추가
mergedContent += `\n-- ============================================\n`;
mergedContent += `-- 데이터 확인 쿼리\n`;
mergedContent += `-- ============================================\n`;
mergedContent += `-- SELECT COUNT(*) as jlpt_total FROM jlpt_vocabulary;\n`;
mergedContent += `-- SELECT jlpt_level, COUNT(*) FROM jlpt_vocabulary GROUP BY jlpt_level ORDER BY jlpt_level;\n`;
mergedContent += `-- SELECT COUNT(*) as it_glossary_total FROM it_glossary;\n`;
mergedContent += `-- SELECT category, COUNT(*) FROM it_glossary GROUP BY category ORDER BY category;\n`;
mergedContent += `-- SELECT COUNT(*) FROM it_glossary WHERE reading IS NULL; -- 0이어야 함\n`;
mergedContent += `-- SELECT subcategory, COUNT(*) FROM it_glossary WHERE category = 'expression' GROUP BY subcategory;\n`;
mergedContent += `-- SELECT subcategory, COUNT(*) FROM it_glossary WHERE category = 'sentence_pattern' GROUP BY subcategory;\n`;
mergedContent += `-- SELECT COUNT(*) as courses_total FROM courses;\n`;
mergedContent += `-- SELECT COUNT(*) as coding_problems_total FROM coding_problems;\n`;
mergedContent += `-- SELECT COUNT(*) as coding_exams_total FROM coding_skill_exams;\n`;

fs.writeFileSync(outputFile, mergedContent, 'utf8');

console.log(`\n✅ 통합 완료: ${outputFile}`);
console.log(`\n📋 다음 단계:`);
console.log(`1. Supabase Dashboard (https://supabase.com/dashboard) 접속`);
console.log(`2. 프로젝트 선택 → SQL Editor 열기`);
console.log(`3. ${outputFile} 파일의 내용을 복사하여 실행`);
console.log(`\n⚠️  주의: 기존 데이터가 있다면 중복 방지 쿼리를 먼저 실행하세요.`);







