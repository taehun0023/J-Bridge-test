-- ============================================
-- ビジネス表現 subcategory 再編 (7個→3個)
-- confirm → request, apology → report, greeting/interview/phone → manner
-- ============================================

-- confirm → request (依頼・確認)
UPDATE it_glossary SET subcategory = 'request'
WHERE category = 'expression' AND subcategory = 'confirm';

-- apology → report (報告・連絡)
UPDATE it_glossary SET subcategory = 'report'
WHERE category = 'expression' AND subcategory = 'apology';

-- greeting, interview, phone → manner (挨拶・応対)
UPDATE it_glossary SET subcategory = 'manner'
WHERE category = 'expression' AND subcategory IN ('greeting', 'interview', 'phone');
