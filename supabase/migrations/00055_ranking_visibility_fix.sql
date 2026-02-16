-- Fix ranking visibility: allow all authenticated users to read profiles and
-- skill tables, and fix get_user_rank RPC to filter by actual scores.

-- 1) Allow all authenticated users to read profiles / japanese_skills / coding_skills
--    (needed for ranking page — mentees previously couldn't see other users' data)
--    profiles had "Users can view own profile" (auth.uid() = id) → only self visible
CREATE POLICY "Authenticated can view all profiles"
  ON profiles FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated can view all japanese_skills"
  ON japanese_skills FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated can view all coding_skills"
  ON coding_skills FOR SELECT USING (auth.role() = 'authenticated');

-- 2) Fix get_user_rank RPC: replace "updated_at IS NOT NULL" (always true due to
--    handle_new_user trigger) with actual score > 0 check
CREATE OR REPLACE FUNCTION get_user_rank(target_user_id uuid)
RETURNS TABLE(
  overall_rank bigint,
  total_ranked bigint,
  overall_score int,
  japanese_score int,
  programming_score int
) LANGUAGE sql STABLE AS $$
  WITH scored AS (
    SELECT
      p.id,
      CASE WHEN p.is_japanese THEN 200
           ELSE COALESCE(js.jlpt_normalized, 0) + COALESCE(js.it_japanese_normalized, 0)
      END AS jp_score,
      COALESCE(cs.core_normalized, 0) + COALESCE(cs.framework_normalized, 0) AS prog_score
    FROM profiles p
    LEFT JOIN japanese_skills js ON js.user_id = p.id
    LEFT JOIN coding_skills cs  ON cs.user_id = p.id
    WHERE p.role IN ('mentee', 'mentor')
      AND (
        COALESCE(js.jlpt_normalized, 0) > 0
        OR COALESCE(js.it_japanese_normalized, 0) > 0
        OR COALESCE(cs.core_normalized, 0) > 0
        OR COALESCE(cs.framework_normalized, 0) > 0
      )
  )
  SELECT
    (SELECT COUNT(*) + 1 FROM scored WHERE (jp_score + prog_score) > s.jp_score + s.prog_score)::bigint AS overall_rank,
    (SELECT COUNT(*)     FROM scored)::bigint AS total_ranked,
    (s.jp_score + s.prog_score) AS overall_score,
    s.jp_score     AS japanese_score,
    s.prog_score   AS programming_score
  FROM scored s
  WHERE s.id = target_user_id;
$$;
