\encoding UTF8
-- 컬럼 구조
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema='public' AND table_name='announcements'
ORDER BY ordinal_position;

-- 기존 공지 목록
SELECT id, title, left(content,40) AS content_head, created_at
FROM announcements ORDER BY created_at DESC;

-- 연관 테이블 행수
SELECT 'announcements' AS t, count(*) FROM announcements
UNION ALL SELECT 'announcement_reads', count(*) FROM announcement_reads
UNION ALL SELECT 'announcement_attachments', count(*) FROM announcement_attachments;
