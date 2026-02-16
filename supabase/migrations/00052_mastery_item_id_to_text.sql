-- item_id を UUID から TEXT に変更
-- マニュアル系 (security_manual, attitude_manual, culture_manual) は
-- テキストID（例: 'work-attitude-sincerity'）を使うため
ALTER TABLE user_mastered_items ALTER COLUMN item_id TYPE TEXT USING item_id::TEXT;
