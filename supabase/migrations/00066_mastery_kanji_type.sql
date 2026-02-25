-- Add 'jlpt_kanji' to user_mastered_items item_type
-- The item_type column doesn't have a CHECK constraint (it's free text),
-- so we just need to ensure the application code handles the new type.
-- This migration serves as documentation that jlpt_kanji is now a valid item_type.

COMMENT ON TABLE user_mastered_items IS 'Valid item_type values: it_glossary, jlpt_vocabulary, jlpt_grammar, cs_term, security_manual, attitude_manual, culture_manual, jlpt_kanji';
