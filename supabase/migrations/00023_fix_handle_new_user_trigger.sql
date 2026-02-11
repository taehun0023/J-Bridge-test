-- ============================================
-- Fix handle_new_user trigger
-- 1. SET search_path = public (SECURITY DEFINER 함수에서 테이블 못 찾는 문제 해결)
-- 2. 테이블명에 public. 스키마 명시
-- 3. EXCEPTION 블록에서 에러를 삼키지 않고 RAISE하도록 변경
-- ============================================

CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(NEW.email, 'user_' || LEFT(NEW.id::text, 8) || '@unknown.com'),
    COALESCE(
      NEW.raw_user_meta_data->>'full_name',
      NEW.raw_user_meta_data->>'name',
      'User_' || floor(random() * 90000 + 10000)::text
    ),
    COALESCE(NEW.raw_user_meta_data->>'avatar_url', '')
  );

  INSERT INTO public.japanese_skills (user_id) VALUES (NEW.id);
  INSERT INTO public.coding_skills (user_id) VALUES (NEW.id);
  INSERT INTO public.attitude_culture_skills (user_id) VALUES (NEW.id);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;
