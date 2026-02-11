-- ============================================
-- 1. Fix handle_new_user trigger: restore EXCEPTION handler
--    Without it, any INSERT failure crashes user creation entirely
-- 2. Add admin UPDATE policy on profiles
--    Without it, admin role changes via RLS are silently rejected
-- ============================================

-- Fix trigger: add EXCEPTION block so auth.users INSERT isn't rolled back on failure
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
EXCEPTION
  WHEN unique_violation THEN
    -- Profile already exists (e.g. re-confirmation), skip silently
    RETURN NEW;
  WHEN OTHERS THEN
    -- Log but don't block user creation
    RAISE WARNING 'handle_new_user trigger failed for user %: %', NEW.id, SQLERRM;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- Add admin UPDATE policy on profiles (was missing — only SELECT existed)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'profiles'
      AND policyname = 'Admins can update all profiles'
  ) THEN
    EXECUTE 'CREATE POLICY "Admins can update all profiles" ON profiles FOR UPDATE USING (is_admin())';
  END IF;
END $$;
