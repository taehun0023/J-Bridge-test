-- Set 2, 3 聴解 daimon/subtype 강제 수정
-- 고정 규격: 課題理解 sort1-6 / ポイント理解 sort7-13 / 概要理解 sort14-16 / 即時応答 sort17-27 / 統合理解 sort28-30

UPDATE jlpt_mock_set_questions msq
SET
  daimon = CASE
    WHEN msq.sort_order BETWEEN 1 AND 6  THEN 1
    WHEN msq.sort_order BETWEEN 7 AND 13 THEN 2
    WHEN msq.sort_order BETWEEN 14 AND 16 THEN 3
    WHEN msq.sort_order BETWEEN 17 AND 27 THEN 4
    WHEN msq.sort_order BETWEEN 28 AND 30 THEN 5
  END,
  subtype = CASE
    WHEN msq.sort_order BETWEEN 1 AND 6  THEN '課題理解'
    WHEN msq.sort_order BETWEEN 7 AND 13 THEN 'ポイント理解'
    WHEN msq.sort_order BETWEEN 14 AND 16 THEN '概要理解'
    WHEN msq.sort_order BETWEEN 17 AND 27 THEN '即時応答'
    WHEN msq.sort_order BETWEEN 28 AND 30 THEN '統合理解'
  END
FROM jlpt_mock_sets ms
WHERE msq.set_id = ms.id
  AND ms.level = 'N1' AND ms.set_no IN (2, 3)
  AND msq.section = 'choukai';

-- 결과 확인
SELECT ms.set_no, msq.daimon, msq.subtype, COUNT(*) AS cnt,
  MIN(msq.sort_order) AS sort_min, MAX(msq.sort_order) AS sort_max
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no IN (2, 3) AND msq.section = 'choukai'
GROUP BY ms.set_no, msq.daimon, msq.subtype
ORDER BY ms.set_no, msq.daimon;
