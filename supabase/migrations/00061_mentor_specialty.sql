-- Add mentor_specialty column to profiles for role-based content access
ALTER TABLE profiles
  ADD COLUMN mentor_specialty TEXT
  CHECK (mentor_specialty IN ('japanese', 'technical') OR mentor_specialty IS NULL);

COMMENT ON COLUMN profiles.mentor_specialty IS 'Mentor specialization: japanese (日本語メンター) or technical (技術メンター). NULL means unset (full access for backward compatibility).';
