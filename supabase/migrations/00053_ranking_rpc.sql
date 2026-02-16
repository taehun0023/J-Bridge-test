-- Get a single user's rank efficiently within the DB
-- instead of fetching all profiles to the client.
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
    WHERE p.role = 'mentee'
      AND (js.updated_at IS NOT NULL OR cs.updated_at IS NOT NULL)
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
