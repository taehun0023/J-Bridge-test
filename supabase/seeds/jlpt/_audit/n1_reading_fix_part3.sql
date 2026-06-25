-- n1_reading_fix_part3.sql
-- 検査対象: 111語 (seq 2993–3103)
-- 訂正対象: 1語

UPDATE jlpt_vocabulary SET reading='おくぶか' WHERE word='奥深' AND jlpt_level='N1';
