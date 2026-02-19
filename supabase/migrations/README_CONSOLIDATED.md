# 통합 마이그레이션 파일 가이드

## 개요

`00000_consolidated_all.sql` 파일은 모든 개별 마이그레이션 파일(00001-00059)을 순서대로 통합한 파일입니다.

## 파일 정보

- **통합 파일**: `00000_consolidated_all.sql`
- **포함된 마이그레이션**: 00001 ~ 00059 (총 59개)
- **파일 크기**: 약 89KB
- **생성일**: 2026-02-19

## 사용 시나리오

### ✅ 새 데이터베이스 초기화 시 사용

새로운 데이터베이스 환경을 설정할 때:
- 개별 마이그레이션 파일 59개를 순차적으로 실행하는 대신
- 통합 파일 하나만 실행하면 모든 스키마가 한 번에 생성됩니다

```sql
-- Supabase Dashboard SQL Editor에서 실행
-- 또는 Supabase CLI 사용
supabase db reset
```

### ⚠️ 기존 데이터베이스에서는 사용하지 않음

이미 마이그레이션이 적용된 데이터베이스에서는:
- **통합 파일을 실행하지 마세요**
- 개별 마이그레이션 파일을 계속 사용하세요
- Supabase는 `supabase_migrations.schema_migrations` 테이블에서 실행된 마이그레이션을 추적합니다

## 주의사항

1. **기존 마이그레이션 파일은 삭제하지 마세요**
   - 다른 개발자나 프로덕션 환경에서 필요합니다
   - 마이그레이션 추적 시스템이 개별 파일을 참조합니다

2. **통합 파일은 참조용으로 사용**
   - 새 환경 초기화 시에만 사용
   - 기존 환경에서는 개별 파일 사용

3. **새 마이그레이션 추가 시**
   - 개별 마이그레이션 파일로 추가 (00060_xxx.sql)
   - 통합 파일은 수동으로 업데이트하거나 재생성 필요

## 통합 파일 재생성

필요시 다음 명령으로 통합 파일을 재생성할 수 있습니다:

```bash
node -e "const fs = require('fs'); const path = require('path'); const files = fs.readdirSync('supabase/migrations').filter(f => f.endsWith('.sql') && f.match(/^\d+_/)).sort(); let content = '-- ============================================\n-- Consolidated Migration File\n-- This file contains all migrations consolidated in order\n-- Created: ' + new Date().toISOString().split('T')[0] + '\n--\n-- Usage:\n--   - For new database setups: Use this file instead of running individual migrations\n--   - For existing databases: Continue using individual migration files\n--   - This file is for reference and new environment initialization only\n-- ============================================\n\n'; files.forEach((file) => { const filePath = path.join('supabase/migrations', file); const fileContent = fs.readFileSync(filePath, 'utf8'); content += '-- ============================================\n-- ' + file + '\n-- ============================================\n'; content += fileContent.trim() + '\n\n'; }); fs.writeFileSync('supabase/migrations/00000_consolidated_all.sql', content, 'utf8'); console.log('Consolidated migration file regenerated: ' + files.length + ' migrations');"
```

## 마이그레이션 순서

통합 파일에는 다음 순서로 마이그레이션이 포함되어 있습니다:

1. Extensions (UUID)
2. Core Tables (profiles, skills, courses, lessons, etc.)
3. Quiz System
4. Coding System
5. Assessment System
6. Admin Features
7. RLS Policies
8. Indexes and Performance
9. Content Management
10. Recent Updates

각 마이그레이션은 원본 파일명으로 명확히 구분되어 있습니다.

