-- TTS音声キャッシュ用 Storage Bucket
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'tts-cache',
  'tts-cache',
  true,
  5242880, -- 5MB
  ARRAY['audio/mpeg']
)
ON CONFLICT (id) DO NOTHING;

-- 누구나 TTS 캐시 조회 가능 (public bucket)
CREATE POLICY "Public tts cache access"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'tts-cache');

-- 인증된 유저는 TTS 캐시 업로드 가능
CREATE POLICY "Authenticated users can upload tts cache"
  ON storage.objects FOR INSERT
  WITH CHECK (
    bucket_id = 'tts-cache'
    AND auth.role() = 'authenticated'
  );
