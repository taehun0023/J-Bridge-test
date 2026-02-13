-- Rename assessment quiz titles: ランク試験 → 総合試験
UPDATE quizzes SET title = REPLACE(title, 'ランク試験', '総合試験')
WHERE is_assessment = TRUE AND title LIKE '%ランク試験';
