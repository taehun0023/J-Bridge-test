-- ============================================
-- Quiz 4 追加: SQLコード読解問題 (30 questions)
-- Category: sql
-- Subtype: code_reading
-- sort_order: 211-240
-- Difficulty: easy 9, medium 15, hard 6
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== sql code_reading - EASY (9) =====

  -- Q211: 基本SELECT（WHERE条件）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【usersテーブル】\n| id | name   | age |\n|----|--------|-----|\n| 1  | 田中   | 25  |\n| 2  | 佐藤   | 30  |\n| 3  | 鈴木   | 25  |\n| 4  | 高橋   | 35  |\n\nSELECT name FROM users WHERE age = 25;\n\nこのクエリの結果として正しいものはどれか。',
    'WHERE age = 25 の条件に該当するのは田中(25)と鈴木(25)の2行である。佐藤(30)と高橋(35)は条件に合致しない。',
    1, 211, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中のみ', FALSE, 1),
    (gen_random_uuid(), q_id, '田中、鈴木', TRUE, 2),
    (gen_random_uuid(), q_id, '田中、佐藤、鈴木', FALSE, 3),
    (gen_random_uuid(), q_id, '全行が返る', FALSE, 4);

  -- Q212: COUNT集約関数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【ordersテーブル】\n| id | user_id | amount |\n|----|---------|--------|\n| 1  | 1       | 1000   |\n| 2  | 2       | 2000   |\n| 3  | 1       | 1500   |\n| 4  | 3       | 3000   |\n| 5  | 1       | 500    |\n\nSELECT COUNT(*) FROM orders WHERE user_id = 1;\n\nこのクエリの結果は何か。',
    'user_id = 1 の行はid=1, id=3, id=5 の3行であるため、COUNT(*)は3を返す。',
    1, 212, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, '2', FALSE, 2),
    (gen_random_uuid(), q_id, '3', TRUE, 3),
    (gen_random_uuid(), q_id, '5', FALSE, 4);

  -- Q213: ORDER BYの動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【productsテーブル】\n| id | name    | price |\n|----|---------|-------|\n| 1  | リンゴ  | 150   |\n| 2  | バナナ  | 100   |\n| 3  | ミカン  | 200   |\n\nSELECT name FROM products ORDER BY price DESC;\n\n結果の1行目に表示されるnameはどれか。',
    'ORDER BY price DESC は価格の降順で並び替える。最も高いのはミカン(200)なので、1行目はミカンとなる。',
    1, 213, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リンゴ', FALSE, 1),
    (gen_random_uuid(), q_id, 'バナナ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ミカン', TRUE, 3),
    (gen_random_uuid(), q_id, '結果は不定', FALSE, 4);

  -- Q214: DISTINCT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【salesテーブル】\n| id | category |\n|----|----------|\n| 1  | 食品     |\n| 2  | 衣料     |\n| 3  | 食品     |\n| 4  | 雑貨     |\n| 5  | 食品     |\n\nSELECT COUNT(DISTINCT category) FROM sales;\n\nこのクエリの結果は何か。',
    'DISTINCTによりcategoryの重複が除去される。食品、衣料、雑貨の3種類なので結果は3となる。',
    1, 214, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2', FALSE, 1),
    (gen_random_uuid(), q_id, '3', TRUE, 2),
    (gen_random_uuid(), q_id, '4', FALSE, 3),
    (gen_random_uuid(), q_id, '5', FALSE, 4);

  -- Q215: NULLとCOUNT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【employeesテーブル】\n| id | name   | dept   |\n|----|--------|--------|\n| 1  | 田中   | 営業   |\n| 2  | 佐藤   | NULL   |\n| 3  | 鈴木   | 開発   |\n| 4  | 高橋   | NULL   |\n\nSELECT COUNT(dept) FROM employees;\n\nこのクエリの結果は何か。',
    'COUNT(列名) はNULLを除外してカウントする。deptがNULLでない行は田中(営業)と鈴木(開発)の2行なので結果は2となる。COUNT(*)とは異なりNULLを含まない。',
    1, 215, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2', TRUE, 1),
    (gen_random_uuid(), q_id, '3', FALSE, 2),
    (gen_random_uuid(), q_id, '4', FALSE, 3),
    (gen_random_uuid(), q_id, '0', FALSE, 4);

  -- Q216: LIKE演算子
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【customersテーブル】\n| id | name     |\n|----|----------|\n| 1  | 山田太郎 |\n| 2  | 山本花子 |\n| 3  | 田中次郎 |\n| 4  | 山口一郎 |\n\nSELECT COUNT(*) FROM customers WHERE name LIKE ''山%'';\n\nこのクエリの結果は何か。',
    'LIKE ''山%'' は「山」で始まる文字列に一致する。山田太郎、山本花子、山口一郎の3行が該当するため結果は3となる。',
    1, 216, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, '2', FALSE, 2),
    (gen_random_uuid(), q_id, '3', TRUE, 3),
    (gen_random_uuid(), q_id, '4', FALSE, 4);

  -- Q217: BETWEEN演算子
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【scoresテーブル】\n| id | student | score |\n|----|---------|-------|\n| 1  | A       | 60    |\n| 2  | B       | 75    |\n| 3  | C       | 80    |\n| 4  | D       | 90    |\n| 5  | E       | 70    |\n\nSELECT COUNT(*) FROM scores WHERE score BETWEEN 70 AND 80;\n\nこのクエリの結果は何か。',
    'BETWEENは両端を含む。score >= 70 AND score <= 80 と同じで、B(75)、C(80)、E(70)の3行が該当する。',
    1, 217, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, '2', FALSE, 2),
    (gen_random_uuid(), q_id, '3', TRUE, 3),
    (gen_random_uuid(), q_id, '4', FALSE, 4);

  -- Q218: SUMとNULL
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【paymentsテーブル】\n| id | amount |\n|----|--------|\n| 1  | 100    |\n| 2  | NULL   |\n| 3  | 200    |\n| 4  | 300    |\n\nSELECT SUM(amount) FROM payments;\n\nこのクエリの結果は何か。',
    'SUM関数はNULLを無視して計算する。100 + 200 + 300 = 600 となる。NULLは0として扱われるのではなく、計算から除外される。',
    1, 218, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NULL', FALSE, 1),
    (gen_random_uuid(), q_id, '600', TRUE, 2),
    (gen_random_uuid(), q_id, '0', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q219: IN演算子
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【itemsテーブル】\n| id | type   | price |\n|----|--------|-------|\n| 1  | A      | 100   |\n| 2  | B      | 200   |\n| 3  | C      | 150   |\n| 4  | A      | 300   |\n| 5  | D      | 250   |\n\nSELECT SUM(price) FROM items WHERE type IN (''A'', ''C'');\n\nこのクエリの結果は何か。',
    'typeが''A''または''C''の行はid=1(100), id=3(150), id=4(300)の3行。SUM(price) = 100 + 150 + 300 = 550。',
    1, 219, 'easy', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '400', FALSE, 1),
    (gen_random_uuid(), q_id, '550', TRUE, 2),
    (gen_random_uuid(), q_id, '250', FALSE, 3),
    (gen_random_uuid(), q_id, '1000', FALSE, 4);

  -- ===== sql code_reading - MEDIUM (15) =====

  -- Q220: INNER JOIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【usersテーブル】\n| id | name |\n|----|------|\n| 1  | 田中 |\n| 2  | 佐藤 |\n| 3  | 鈴木 |\n\n【ordersテーブル】\n| id | user_id | product |\n|----|---------|----------|\n| 1  | 1       | りんご   |\n| 2  | 1       | みかん   |\n| 3  | 4       | バナナ   |\n\nSELECT u.name, o.product\nFROM users u\nINNER JOIN orders o ON u.id = o.user_id;\n\nこのクエリの結果は何行返るか。',
    'INNER JOINは両方のテーブルに一致するデータのみ返す。user_id=1は田中と一致し2行、user_id=4はusersに存在しないため除外。結果は2行。',
    1, 220, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1行', FALSE, 1),
    (gen_random_uuid(), q_id, '2行', TRUE, 2),
    (gen_random_uuid(), q_id, '3行', FALSE, 3),
    (gen_random_uuid(), q_id, '5行', FALSE, 4);

  -- Q221: LEFT JOIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【departmentsテーブル】\n| id | name   |\n|----|--------|\n| 1  | 営業   |\n| 2  | 開発   |\n| 3  | 人事   |\n\n【employeesテーブル】\n| id | name | dept_id |\n|----|------|----------|\n| 1  | 田中 | 1        |\n| 2  | 佐藤 | 1        |\n| 3  | 鈴木 | 2        |\n\nSELECT d.name, e.name\nFROM departments d\nLEFT JOIN employees e ON d.id = e.dept_id;\n\nこのクエリの結果は何行返るか。',
    'LEFT JOINは左テーブル(departments)の全行を返す。営業→田中,佐藤の2行、開発→鈴木の1行、人事→従業員なしのためNULLで1行。計4行。',
    1, 221, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3行', FALSE, 1),
    (gen_random_uuid(), q_id, '4行', TRUE, 2),
    (gen_random_uuid(), q_id, '5行', FALSE, 3),
    (gen_random_uuid(), q_id, '6行', FALSE, 4);

  -- Q222: GROUP BY + HAVING
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【salesテーブル】\n| id | product | amount |\n|----|---------|--------|\n| 1  | A       | 100    |\n| 2  | B       | 200    |\n| 3  | A       | 150    |\n| 4  | C       | 300    |\n| 5  | B       | 250    |\n| 6  | A       | 200    |\n\nSELECT product, SUM(amount) AS total\nFROM sales\nGROUP BY product\nHAVING SUM(amount) >= 400;\n\nこのクエリの結果として返るproductはどれか。',
    'GROUP BYでproduct別に集計: A=100+150+200=450, B=200+250=450, C=300。HAVING SUM(amount) >= 400 により、AとBが返る。Cは300なので除外。',
    1, 222, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Aのみ', FALSE, 1),
    (gen_random_uuid(), q_id, 'AとB', TRUE, 2),
    (gen_random_uuid(), q_id, 'A、B、C全て', FALSE, 3),
    (gen_random_uuid(), q_id, 'Bのみ', FALSE, 4);

  -- Q223: CASE式
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【studentsテーブル】\n| id | name | score |\n|----|------|-------|\n| 1  | 田中 | 85    |\n| 2  | 佐藤 | 60    |\n| 3  | 鈴木 | 45    |\n\nSELECT name,\n  CASE\n    WHEN score >= 80 THEN ''優''\n    WHEN score >= 60 THEN ''良''\n    ELSE ''不可''\n  END AS grade\nFROM students;\n\n佐藤のgradeはどれか。',
    '佐藤のscoreは60。CASE式は上から順に評価され、score >= 80 はfalse、score >= 60 はtrueなので''良''が返る。',
    1, 223, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '優', FALSE, 1),
    (gen_random_uuid(), q_id, '良', TRUE, 2),
    (gen_random_uuid(), q_id, '不可', FALSE, 3),
    (gen_random_uuid(), q_id, 'NULL', FALSE, 4);

  -- Q224: COALESCE
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【employeesテーブル】\n| id | name | nickname |\n|----|------|----------|\n| 1  | 田中 | たな     |\n| 2  | 佐藤 | NULL     |\n\nSELECT COALESCE(nickname, name) AS display_name\nFROM employees\nWHERE id = 2;\n\nこのクエリの結果は何か。',
    'COALESCEは引数を左から順に評価し、最初のNULLでない値を返す。id=2の佐藤はnicknameがNULLなので、次の引数のname=''佐藤''が返る。',
    1, 224, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NULL', FALSE, 1),
    (gen_random_uuid(), q_id, 'たな', FALSE, 2),
    (gen_random_uuid(), q_id, '佐藤', TRUE, 3),
    (gen_random_uuid(), q_id, '空文字列', FALSE, 4);

  -- Q225: UNION vs UNION ALL
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次の2つのクエリがある。\n\nSELECT name FROM table_a\nUNION ALL\nSELECT name FROM table_b;\n\n【table_a】\n| name |\n|------|\n| 田中 |\n| 佐藤 |\n\n【table_b】\n| name |\n|------|\n| 佐藤 |\n| 鈴木 |\n\nこのクエリの結果は何行返るか。',
    'UNION ALLは重複を排除せずに全行を結合する。table_aの2行 + table_bの2行 = 4行。UNIONなら重複する佐藤が1行になり3行となるが、UNION ALLでは4行。',
    1, 225, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2行', FALSE, 1),
    (gen_random_uuid(), q_id, '3行', FALSE, 2),
    (gen_random_uuid(), q_id, '4行', TRUE, 3),
    (gen_random_uuid(), q_id, '5行', FALSE, 4);

  -- Q226: サブクエリ（IN句）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【ordersテーブル】\n| id | user_id | amount |\n|----|---------|--------|\n| 1  | 1       | 5000   |\n| 2  | 2       | 3000   |\n| 3  | 3       | 8000   |\n\n【usersテーブル】\n| id | name |\n|----|------|\n| 1  | 田中 |\n| 2  | 佐藤 |\n| 3  | 鈴木 |\n\nSELECT name FROM users\nWHERE id IN (SELECT user_id FROM orders WHERE amount > 4000);\n\nこのクエリの結果はどれか。',
    'サブクエリでamount > 4000のuser_idは1(5000)と3(8000)。外側のクエリでid IN (1, 3)に該当するのは田中と鈴木。',
    1, 226, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中のみ', FALSE, 1),
    (gen_random_uuid(), q_id, '田中、鈴木', TRUE, 2),
    (gen_random_uuid(), q_id, '田中、佐藤、鈴木', FALSE, 3),
    (gen_random_uuid(), q_id, '鈴木のみ', FALSE, 4);

  -- Q227: UPDATE文の結果
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルに対してUPDATE文を実行する。\n\n【productsテーブル（実行前）】\n| id | name   | price |\n|----|--------|-------|\n| 1  | りんご | 100   |\n| 2  | バナナ | 150   |\n| 3  | みかん | 100   |\n| 4  | ぶどう | 300   |\n\nUPDATE products SET price = price * 1.1 WHERE price <= 150;\n\n実行後、id=2(バナナ)のpriceはいくらか。',
    'WHERE price <= 150 にバナナ(150)は該当する（<=は以下なので150を含む）。price = 150 * 1.1 = 165 となる。',
    1, 227, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '150（変更なし）', FALSE, 1),
    (gen_random_uuid(), q_id, '160', FALSE, 2),
    (gen_random_uuid(), q_id, '165', TRUE, 3),
    (gen_random_uuid(), q_id, '110', FALSE, 4);

  -- Q228: DELETE文の影響行数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルに対してDELETE文を実行する。\n\n【logsテーブル】\n| id | level   | created_at |\n|----|---------|------------|\n| 1  | ERROR   | 2024-01-01 |\n| 2  | WARNING | 2024-01-02 |\n| 3  | ERROR   | 2024-01-03 |\n| 4  | INFO    | 2024-01-04 |\n| 5  | ERROR   | 2024-01-05 |\n\nDELETE FROM logs WHERE level = ''ERROR'' AND created_at < ''2024-01-04'';\n\n削除される行数はいくつか。',
    'WHERE条件: level=''ERROR'' かつ created_at < ''2024-01-04''。id=1(ERROR, 2024-01-01)とid=3(ERROR, 2024-01-03)が該当。id=5はERRORだがcreated_at=2024-01-05で条件外。削除は2行。',
    1, 228, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1行', FALSE, 1),
    (gen_random_uuid(), q_id, '2行', TRUE, 2),
    (gen_random_uuid(), q_id, '3行', FALSE, 3),
    (gen_random_uuid(), q_id, '4行', FALSE, 4);

  -- Q229: ORDER BYとNULL
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある（PostgreSQLの場合）。\n\n【dataテーブル】\n| id | value |\n|----|-------|\n| 1  | 30    |\n| 2  | NULL  |\n| 3  | 10    |\n| 4  | 20    |\n\nSELECT id FROM data ORDER BY value ASC;\n\nPostgreSQLにおいて、結果の最後の行のidはどれか。',
    'PostgreSQLのORDER BY ASCではNULLは最後に配置される（NULLS LAST がデフォルト）。昇順で10, 20, 30の後にNULLが来るため、最後はid=2。',
    1, 229, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'id = 1', FALSE, 1),
    (gen_random_uuid(), q_id, 'id = 2', TRUE, 2),
    (gen_random_uuid(), q_id, 'id = 3', FALSE, 3),
    (gen_random_uuid(), q_id, 'id = 4', FALSE, 4);

  -- Q230: EXISTS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【usersテーブル】\n| id | name |\n|----|------|\n| 1  | 田中 |\n| 2  | 佐藤 |\n| 3  | 鈴木 |\n\n【ordersテーブル】\n| id | user_id |\n|----|----------|\n| 1  | 1        |\n| 2  | 3        |\n\nSELECT name FROM users u\nWHERE EXISTS (SELECT 1 FROM orders o WHERE o.user_id = u.id);\n\nこのクエリの結果はどれか。',
    'EXISTSは相関サブクエリが少なくとも1行返すかを評価する。user_id=1(田中)とuser_id=3(鈴木)に注文があるため、田中と鈴木が返る。佐藤は注文がないため除外。',
    1, 230, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中のみ', FALSE, 1),
    (gen_random_uuid(), q_id, '田中、佐藤', FALSE, 2),
    (gen_random_uuid(), q_id, '田中、鈴木', TRUE, 3),
    (gen_random_uuid(), q_id, '佐藤、鈴木', FALSE, 4);

  -- Q231: CTE（WITH句）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【salesテーブル】\n| id | product | amount |\n|----|---------|--------|\n| 1  | A       | 100    |\n| 2  | B       | 200    |\n| 3  | A       | 300    |\n| 4  | B       | 100    |\n\nWITH product_totals AS (\n  SELECT product, SUM(amount) AS total\n  FROM sales\n  GROUP BY product\n)\nSELECT product FROM product_totals WHERE total > 250;\n\nこのクエリの結果はどれか。',
    'CTEでproduct別合計を算出: A=100+300=400, B=200+100=300。WHERE total > 250 にはA(400)とB(300)の両方が該当する。',
    1, 231, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Aのみ', FALSE, 1),
    (gen_random_uuid(), q_id, 'Bのみ', FALSE, 2),
    (gen_random_uuid(), q_id, 'AとB', TRUE, 3),
    (gen_random_uuid(), q_id, '結果なし', FALSE, 4);

  -- Q232: GROUP BYとCOUNT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【access_logテーブル】\n| id | user_id | page     |\n|----|---------|----------|\n| 1  | 1       | /home    |\n| 2  | 2       | /about   |\n| 3  | 1       | /about   |\n| 4  | 3       | /home    |\n| 5  | 1       | /home    |\n| 6  | 2       | /home    |\n\nSELECT page, COUNT(*) AS cnt\nFROM access_log\nGROUP BY page\nORDER BY cnt DESC;\n\n結果の1行目に表示されるpageはどれか。',
    'page別にCOUNT: /home=3行(id=1,4,5 → 実際はid=1,4,5,6で/homeが4... いや、id=1=/home, id=4=/home, id=5=/home, id=6=/home → 4行。/about=2行(id=2,3)。ORDER BY cnt DESC で最も多い/homeが1行目。',
    1, 232, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '/about', FALSE, 1),
    (gen_random_uuid(), q_id, '/home', TRUE, 2),
    (gen_random_uuid(), q_id, '/home と /about が同数のため不定', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q233: INSERT...SELECT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【sourceテーブル】\n| id | name | active |\n|----|------|--------|\n| 1  | A    | true   |\n| 2  | B    | false  |\n| 3  | C    | true   |\n| 4  | D    | false  |\n\n【targetテーブル】（空のテーブル、id, nameカラムあり）\n\nINSERT INTO target (id, name)\nSELECT id, name FROM source WHERE active = true;\n\n実行後、targetテーブルには何行あるか。',
    'WHERE active = true に該当するのはid=1(A)とid=3(C)の2行。これらがtargetに挿入されるため結果は2行。',
    1, 233, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1行', FALSE, 1),
    (gen_random_uuid(), q_id, '2行', TRUE, 2),
    (gen_random_uuid(), q_id, '3行', FALSE, 3),
    (gen_random_uuid(), q_id, '4行', FALSE, 4);

  -- Q234: NULL比較の落とし穴
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【dataテーブル】\n| id | value |\n|----|-------|\n| 1  | 10    |\n| 2  | NULL  |\n| 3  | 20    |\n| 4  | NULL  |\n\nSELECT COUNT(*) FROM data WHERE value <> 10;\n\nこのクエリの結果は何か。',
    'NULLとの比較演算（<>を含む）の結果はUNKNOWNとなり、WHERE句ではFALSE扱い。value <> 10 でTRUEなのはid=3(20)のみ。NULLの行は除外される。結果は1。',
    1, 234, 'medium', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', TRUE, 1),
    (gen_random_uuid(), q_id, '2', FALSE, 2),
    (gen_random_uuid(), q_id, '3', FALSE, 3),
    (gen_random_uuid(), q_id, '0', FALSE, 4);

  -- ===== sql code_reading - HARD (6) =====

  -- Q235: ウィンドウ関数 ROW_NUMBER
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【salesテーブル】\n| id | dept | amount |\n|----|------|--------|\n| 1  | A    | 300    |\n| 2  | A    | 500    |\n| 3  | B    | 400    |\n| 4  | B    | 200    |\n| 5  | A    | 100    |\n\nSELECT id, dept, amount,\n  ROW_NUMBER() OVER (PARTITION BY dept ORDER BY amount DESC) AS rn\nFROM sales;\n\nrn = 1 となる行のidの組み合わせはどれか。',
    'PARTITION BY deptで部署ごとにグループ化し、amount DESCで降順にROW_NUMBERを付与。dept=A: 500(id=2)→rn=1, 300(id=1)→rn=2, 100(id=5)→rn=3。dept=B: 400(id=3)→rn=1, 200(id=4)→rn=2。rn=1はid=2とid=3。',
    1, 235, 'hard', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'id = 1 と id = 3', FALSE, 1),
    (gen_random_uuid(), q_id, 'id = 2 と id = 3', TRUE, 2),
    (gen_random_uuid(), q_id, 'id = 2 と id = 4', FALSE, 3),
    (gen_random_uuid(), q_id, 'id = 1 と id = 4', FALSE, 4);

  -- Q236: RANK vs DENSE_RANK
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【scoresテーブル】\n| id | name | score |\n|----|------|-------|\n| 1  | A    | 100   |\n| 2  | B    | 90    |\n| 3  | C    | 90    |\n| 4  | D    | 80    |\n\nSELECT name, RANK() OVER (ORDER BY score DESC) AS rank_val,\n  DENSE_RANK() OVER (ORDER BY score DESC) AS dense_val\nFROM scores;\n\nDのrank_valとdense_valの値はそれぞれ何か。',
    'RANK: 同順位の後は順位を飛ばす。A=1, B=2, C=2, D=4。DENSE_RANK: 同順位の後も連番。A=1, B=2, C=2, D=3。よってDはrank_val=4, dense_val=3。',
    1, 236, 'hard', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'rank_val=3, dense_val=3', FALSE, 1),
    (gen_random_uuid(), q_id, 'rank_val=4, dense_val=3', TRUE, 2),
    (gen_random_uuid(), q_id, 'rank_val=4, dense_val=4', FALSE, 3),
    (gen_random_uuid(), q_id, 'rank_val=3, dense_val=4', FALSE, 4);

  -- Q237: LAG/LEAD ウィンドウ関数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【monthly_salesテーブル】\n| month | revenue |\n|-------|----------|\n| 1     | 1000     |\n| 2     | 1500     |\n| 3     | 1200     |\n| 4     | 1800     |\n\nSELECT month, revenue,\n  revenue - LAG(revenue) OVER (ORDER BY month) AS diff\nFROM monthly_sales;\n\nmonth = 3 の diff の値は何か。',
    'LAG(revenue)は1つ前の行のrevenueを返す。month=3の前の行はmonth=2(revenue=1500)。diff = 1200 - 1500 = -300。',
    1, 237, 'hard', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '200', FALSE, 1),
    (gen_random_uuid(), q_id, '-300', TRUE, 2),
    (gen_random_uuid(), q_id, '300', FALSE, 3),
    (gen_random_uuid(), q_id, 'NULL', FALSE, 4);

  -- Q238: インデックスの使用判断
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルにインデックスが存在する。\n\nCREATE TABLE orders (\n  id SERIAL PRIMARY KEY,\n  user_id INT NOT NULL,\n  status VARCHAR(20),\n  created_at TIMESTAMP\n);\nCREATE INDEX idx_orders_user_status ON orders (user_id, status);\n\n次のうち、このインデックス idx_orders_user_status を効率的に利用できるクエリはどれか。',
    '複合インデックス(user_id, status)は左端の列(user_id)を含むクエリで利用可能。Aはuser_idで検索するため利用可能。Bはstatusのみで検索するためインデックスの先頭列がないため効率的に利用できない。',
    1, 238, 'hard', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SELECT * FROM orders WHERE status = ''completed''', FALSE, 1),
    (gen_random_uuid(), q_id, 'SELECT * FROM orders WHERE user_id = 1 AND status = ''completed''', TRUE, 2),
    (gen_random_uuid(), q_id, 'SELECT * FROM orders WHERE created_at > ''2024-01-01''', FALSE, 3),
    (gen_random_uuid(), q_id, 'SELECT * FROM orders ORDER BY created_at DESC', FALSE, 4);

  -- Q239: トランザクション分離レベル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のシナリオを考える。\n\n-- トランザクション1\nBEGIN;\nSELECT balance FROM accounts WHERE id = 1; -- 結果: 1000\n-- （ここでトランザクション2がbalanceを1500に更新しCOMMITする）\nSELECT balance FROM accounts WHERE id = 1; -- 結果: ???\nCOMMIT;\n\nトランザクション分離レベルが READ COMMITTED の場合、2回目のSELECTの結果はどれか。',
    'READ COMMITTEDでは、他のトランザクションがCOMMITした変更は読み取れる。トランザクション2がCOMMIT済みなので2回目のSELECTでは1500が返る。REPEATABLE READなら1000のままだが、READ COMMITTEDでは最新のコミット済みデータを読む。',
    1, 239, 'hard', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1000（変更前の値）', FALSE, 1),
    (gen_random_uuid(), q_id, '1500（コミット後の値）', TRUE, 2),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ロック待ちになる', FALSE, 4);

  -- Q240: FULL OUTER JOIN + ウィンドウ関数の複合
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice',
    '次のテーブルとクエリがある。\n\n【team_aテーブル】\n| id | name |\n|----|------|\n| 1  | 田中 |\n| 2  | 佐藤 |\n\n【team_bテーブル】\n| id | name |\n|----|------|\n| 2  | 佐藤 |\n| 3  | 鈴木 |\n\nSELECT\n  COALESCE(a.id, b.id) AS id,\n  COALESCE(a.name, b.name) AS name,\n  CASE\n    WHEN a.id IS NOT NULL AND b.id IS NOT NULL THEN ''両方''\n    WHEN a.id IS NOT NULL THEN ''Aのみ''\n    ELSE ''Bのみ''\n  END AS belong\nFROM team_a a\nFULL OUTER JOIN team_b b ON a.id = b.id;\n\nこのクエリの結果は何行返り、belongが''両方''の行は何行か。',
    'FULL OUTER JOINは両テーブルの全行を返す。id=1は左のみ→Aのみ, id=2は両方→両方, id=3は右のみ→Bのみ。計3行、''両方''は1行。',
    1, 240, 'hard', 'sql', 'code_reading', TRUE);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2行返り、''両方''は1行', FALSE, 1),
    (gen_random_uuid(), q_id, '3行返り、''両方''は1行', TRUE, 2),
    (gen_random_uuid(), q_id, '3行返り、''両方''は2行', FALSE, 3),
    (gen_random_uuid(), q_id, '4行返り、''両方''は2行', FALSE, 4);

END $$;
