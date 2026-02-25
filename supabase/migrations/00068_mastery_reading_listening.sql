ALTER TABLE user_mastered_items DROP CONSTRAINT IF EXISTS user_mastered_items_item_type_check;
ALTER TABLE user_mastered_items ADD CONSTRAINT user_mastered_items_item_type_check
  CHECK (item_type IN ('it_glossary','jlpt_vocabulary','jlpt_grammar','cs_term',
         'security_manual','attitude_manual','culture_manual','jlpt_kanji',
         'shared_vocab','jlpt_reading','jlpt_listening'));
