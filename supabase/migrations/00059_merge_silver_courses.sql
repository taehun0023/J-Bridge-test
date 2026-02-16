-- Merge JAVA-SILVER-04 (例外処理) into JAVA-SILVER-01 (オブジェクト指向と例外処理)
DO $$ DECLARE silver01_id UUID; silver04_id UUID;
BEGIN
  SELECT id INTO silver01_id FROM courses WHERE subcategory='java' AND sort_order=20;
  SELECT id INTO silver04_id FROM courses WHERE subcategory='java' AND sort_order=40;
  IF silver01_id IS NOT NULL AND silver04_id IS NOT NULL THEN
    -- Move lessons from SILVER-04 to SILVER-01 (offset sort_order to avoid collision)
    UPDATE lessons SET course_id=silver01_id, sort_order=sort_order+5 WHERE course_id=silver04_id;
    -- Migrate enrollments
    INSERT INTO enrollments(user_id, course_id)
      SELECT user_id, silver01_id FROM enrollments WHERE course_id=silver04_id
      ON CONFLICT DO NOTHING;
    DELETE FROM enrollments WHERE course_id=silver04_id;
    -- Update course metadata
    UPDATE courses
      SET title='オブジェクト指向と例外処理',
          description='クラス定義、継承、ポリモーフィズム、インタフェース、例外処理の基本を理解し実務で使いこなす。'
      WHERE id=silver01_id;
    -- Soft-delete old course
    UPDATE courses SET is_published=FALSE WHERE id=silver04_id;
  END IF;
END $$;
