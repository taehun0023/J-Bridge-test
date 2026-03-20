-- Force-classify remaining legacy CS questions that still appear as
-- "未分類(旧データ)" in admin after heuristic text-based cleanup.

WITH invalid_cs_questions AS (
  SELECT qq.id, qq.quiz_id, qq.sort_order, q.title
  FROM quiz_questions qq
  JOIN quizzes q ON q.id = qq.quiz_id
  WHERE q.quiz_type = 'cs_knowledge'
    AND (
      qq.question_category IS NULL
      OR qq.question_category NOT IN (
        'basic_theory', 'basic_theory_check_1', 'basic_theory_check_2', 'basic_theory_final',
        'data_structure', 'data_structure_check_1', 'data_structure_check_2', 'data_structure_final',
        'algorithm', 'algorithm_check_1', 'algorithm_check_2', 'algorithm_final',
        'computer_architecture', 'computer_architecture_check_1', 'computer_architecture_check_2', 'computer_architecture_final',
        'database', 'database_check_1', 'database_check_2', 'database_final',
        'network', 'network_check_1', 'network_check_2', 'network_final',
        'os', 'os_check_1', 'os_check_2', 'os_final',
        'security', 'security_check_1', 'security_check_2', 'security_final'
      )
    )
),
title_mapped AS (
  SELECT
    id,
    CASE
      WHEN title LIKE '%基礎理論%' THEN 'basic_theory'
      WHEN title LIKE '%アルゴリズム%' THEN 'algorithm'
      WHEN title LIKE '%データ構造%' THEN 'data_structure'
      WHEN title LIKE '%コンピュータシステム%' OR title LIKE '%コンピュータ構成%' THEN 'computer_architecture'
      WHEN title LIKE '%データベース%' THEN 'database'
      WHEN title LIKE '%ネットワーク%' THEN 'network'
      WHEN title LIKE '%セキュリティ%' THEN 'security'
      ELSE NULL
    END AS target_category
  FROM invalid_cs_questions
),
comprehensive_mapped AS (
  SELECT
    id,
    CASE
      -- legacy IT passport comprehensive
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order BETWEEN 1 AND 3 THEN 'basic_theory'
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order BETWEEN 4 AND 6 THEN 'algorithm'
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order BETWEEN 7 AND 9 THEN 'data_structure'
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order BETWEEN 10 AND 12 THEN 'computer_architecture'
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order BETWEEN 13 AND 15 THEN 'database'
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order BETWEEN 16 AND 19 THEN 'network'
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order BETWEEN 20 AND 23 THEN 'security'
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order = 24 THEN 'computer_architecture'
      WHEN title LIKE '%CS知識%ITパスポート%総合テスト%' AND sort_order = 25 THEN 'algorithm'

      -- legacy FE comprehensive
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order BETWEEN 1 AND 3 THEN 'basic_theory'
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order BETWEEN 4 AND 6 THEN 'algorithm'
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order BETWEEN 7 AND 9 THEN 'data_structure'
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order BETWEEN 10 AND 13 THEN 'computer_architecture'
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order BETWEEN 14 AND 16 THEN 'database'
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order BETWEEN 17 AND 19 THEN 'network'
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order BETWEEN 20 AND 23 THEN 'security'
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order = 24 THEN 'database'
      WHEN title LIKE '%CS知識%基本情報%総合テスト%' AND sort_order = 25 THEN 'algorithm'
      ELSE NULL
    END AS target_category
  FROM invalid_cs_questions
),
resolved AS (
  SELECT id, target_category
  FROM title_mapped
  WHERE target_category IS NOT NULL
  UNION
  SELECT id, target_category
  FROM comprehensive_mapped
  WHERE target_category IS NOT NULL
)
UPDATE quiz_questions qq
SET question_category = resolved.target_category
FROM resolved
WHERE qq.id = resolved.id;
