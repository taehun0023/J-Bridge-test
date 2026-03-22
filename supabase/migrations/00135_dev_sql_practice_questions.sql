-- ============================================================
-- Dev Practice Quiz: SQL 理解度テスト問題 (15 questions)
-- Source quiz for pool quiz e0000001-0000-0000-0000-000000000003
-- 3 topic areas × 5 questions each
-- Difficulty: easy 5, medium 7, hard 3 (33/47/20 ratio)
-- ============================================================

-- 1) Source quiz record (non-pool, non-assessment)
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('e1000001-0000-0000-0000-000000000003', 'SQL 理解度テスト問題', 'core_programming', 70, NULL, false, false, NULL)
ON CONFLICT (id) DO NOTHING;

-- 2) 15 questions
DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Topic 1: クエリ作成と結果の解釈 (DEV-SQL-01) — 5 questions
  -- ============================================================

  -- T1-Q1 (easy): SQLの論理的実行順序
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'SQLの論理的な実行順序として正しいものはどれですか？',
  'multiple_choice', 'easy', 'sql', 'concept',
  'SQLは記述順（SELECT → FROM → WHERE ...）とは異なり、FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT の順に論理的に処理されます。この順序を理解することで、WHERE句で集約関数が使えない理由やエイリアスの参照可能範囲が分かります。',
  1, 1, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY', true, 1),
    (gen_random_uuid(), q_id, 'SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY', false, 2),
    (gen_random_uuid(), q_id, 'FROM → SELECT → WHERE → GROUP BY → ORDER BY → HAVING', false, 3),
    (gen_random_uuid(), q_id, 'SELECT → WHERE → FROM → GROUP BY → ORDER BY → HAVING', false, 4);

  -- T1-Q2 (easy): WHEREとHAVINGの違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  '「部署ごとの従業員数が5人以上の部署のみ」を抽出する場合、正しい記述はどれですか？',
  'multiple_choice', 'easy', 'sql', 'concept',
  'HAVING句はGROUP BYの後に適用され、グループに対して集約関数を使ったフィルタリングができます。WHERE句はグルーピング前の行レベルのフィルタリングであり、集約関数は使用できません。',
  1, 2, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GROUP BY department HAVING COUNT(*) >= 5', true, 1),
    (gen_random_uuid(), q_id, 'WHERE COUNT(*) >= 5 GROUP BY department', false, 2),
    (gen_random_uuid(), q_id, 'GROUP BY department WHERE COUNT(*) >= 5', false, 3),
    (gen_random_uuid(), q_id, 'SELECT department HAVING COUNT(*) >= 5', false, 4);

  -- T1-Q3 (medium): COUNT(*)とCOUNT(column)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'employeesテーブルに10行あり、そのうちdepartment_idカラムが2行NULLの場合、COUNT(*)とCOUNT(department_id)の結果はそれぞれいくつですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  'COUNT(*)は全行数をカウントするためNULLに関係なく10を返します。COUNT(column)は指定カラムがNULLでない行のみをカウントするため8を返します。この違いはNULLが含まれるカラムで重要になります。',
  2, 3, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'COUNT(*) = 10、COUNT(department_id) = 8', true, 1),
    (gen_random_uuid(), q_id, 'COUNT(*) = 10、COUNT(department_id) = 10', false, 2),
    (gen_random_uuid(), q_id, 'COUNT(*) = 8、COUNT(department_id) = 8', false, 3),
    (gen_random_uuid(), q_id, 'COUNT(*) = 8、COUNT(department_id) = 10', false, 4);

  -- T1-Q4 (medium): GROUP BYとSELECT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  '次のSQLが正しく動作しない理由はどれですか？
SELECT department, name, COUNT(*) FROM employees GROUP BY department',
  'multiple_choice', 'medium', 'sql', 'concept',
  'GROUP BY句を使用する場合、SELECT句にはGROUP BYに指定したカラムか集約関数のみを記述できます。nameカラムはGROUP BYに含まれておらず、1つの部署に複数のnameが存在するため、どの値を表示すべきか決定できません。',
  2, 4, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'nameがGROUP BYに含まれておらず、集約関数でもないため', true, 1),
    (gen_random_uuid(), q_id, 'COUNT(*)とnameを同時にSELECTできないため', false, 2),
    (gen_random_uuid(), q_id, 'departmentカラムにインデックスがないため', false, 3),
    (gen_random_uuid(), q_id, 'GROUP BYの後にORDER BYがないため', false, 4);

  -- T1-Q5 (hard): 実行順序の応用
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  '次のSQLで「employee_count」というエイリアスをWHERE句で使用できない理由はどれですか？
SELECT department, COUNT(*) AS employee_count FROM employees WHERE employee_count > 5 GROUP BY department',
  'multiple_choice', 'hard', 'sql', 'concept',
  'SQLの論理実行順序でWHEREはSELECTより先に処理されます。エイリアス（employee_count）はSELECT句で定義されるため、WHERE句の時点ではまだ存在しません。この条件はHAVING COUNT(*) > 5として記述する必要があります。',
  3, 5, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'WHEREはSELECTより先に処理され、エイリアスがまだ定義されていないため', true, 1),
    (gen_random_uuid(), q_id, 'エイリアスはORDER BY句でのみ使用可能なため', false, 2),
    (gen_random_uuid(), q_id, 'COUNT関数のエイリアスは常に無効であるため', false, 3),
    (gen_random_uuid(), q_id, 'WHERE句では文字列型のカラムしか比較できないため', false, 4);

  -- ============================================================
  -- Topic 2: スキーマとJOIN (DEV-SQL-02) — 5 questions
  -- ============================================================

  -- T2-Q1 (easy): INNER JOINとLEFT JOINの違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'employeesテーブル（4行）とdepartmentsテーブル（3行）をdepartment_idでINNER JOINした場合、employeesのうち1行のdepartment_idがNULLであるとき、結果の行数はどうなりますか？',
  'multiple_choice', 'easy', 'sql', 'concept',
  'INNER JOINは両方のテーブルで条件が一致する行のみを返します。department_idがNULLの従業員は結合条件に一致しないため除外され、結果は最大3行になります。',
  1, 6, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NULLの行が除外され、一致する行のみ返される（最大3行）', true, 1),
    (gen_random_uuid(), q_id, 'NULLの行も含めて4行全て返される', false, 2),
    (gen_random_uuid(), q_id, 'NULLの行がエラーを引き起こす', false, 3),
    (gen_random_uuid(), q_id, 'departmentsの3行のみ返される', false, 4);

  -- T2-Q2 (easy): LEFT JOINの特徴
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'LEFT JOINの結果に関する説明として正しいものはどれですか？',
  'multiple_choice', 'easy', 'sql', 'concept',
  'LEFT JOINは左テーブルの全行を保持します。右テーブルに一致する行がない場合、右テーブル側のカラムはNULLで埋められます。「全ユーザーの情報を表示し、注文がないユーザーも含める」のようなケースで使用します。',
  1, 7, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '左テーブルの全行が返され、右テーブルに一致がない場合はNULLで埋められる', true, 1),
    (gen_random_uuid(), q_id, '右テーブルの全行が返され、左テーブルに一致がない場合はNULLで埋められる', false, 2),
    (gen_random_uuid(), q_id, '両テーブルの全行が返される（FULL JOINと同じ）', false, 3),
    (gen_random_uuid(), q_id, '一致する行のみ返される（INNER JOINと同じ）', false, 4);

  -- T2-Q3 (medium): 1対多のJOIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'departmentsテーブル（3行）とemployeesテーブル（10行、各従業員は必ず1部署に所属）をINNER JOINした場合、結果の行数はいくつですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  '1対多の関係でJOINすると、「1」側の行が「多」側の件数分に展開されます。3部署に合計10人の従業員が所属しているので、結果は10行になります。部署ごとに従業員の数だけ行が生成されます。',
  2, 8, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10行（従業員の行数に展開される）', true, 1),
    (gen_random_uuid(), q_id, '3行（部署の行数と同じ）', false, 2),
    (gen_random_uuid(), q_id, '13行（3 + 10）', false, 3),
    (gen_random_uuid(), q_id, '30行（3 × 10）', false, 4);

  -- T2-Q4 (medium): NULLの比較
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'SQLでNULL値を検索する場合の正しい構文はどれですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  'SQLではNULLは「値が不明」を意味し、通常の比較演算子（=, !=）ではNULLと比較できません。WHERE column = NULLは常にfalseを返します。NULLの判定にはIS NULLまたはIS NOT NULLを使用する必要があります。',
  2, 9, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'WHERE department_id IS NULL', true, 1),
    (gen_random_uuid(), q_id, 'WHERE department_id = NULL', false, 2),
    (gen_random_uuid(), q_id, 'WHERE department_id == NULL', false, 3),
    (gen_random_uuid(), q_id, 'WHERE ISNULL(department_id)', false, 4);

  -- T2-Q5 (hard): 外部キーとNULL許容
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'employeesテーブルのdepartment_idが外部キー(FK)として定義されているが、NOT NULL制約がない場合、このテーブルに関して正しい説明はどれですか？',
  'multiple_choice', 'hard', 'sql', 'concept',
  '外部キー制約はdepartment_idの値がdepartmentsテーブルに存在することを保証しますが、NOT NULL制約がなければNULLを許容します。つまり「どの部署にも所属しない従業員」を登録できます。INNER JOINではこの従業員は結果から除外されますが、LEFT JOINでは含まれます。',
  3, 10, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'department_idにNULLを挿入でき、INNER JOINではその行が除外される', true, 1),
    (gen_random_uuid(), q_id, '外部キーが定義されているため、NULLは挿入できない', false, 2),
    (gen_random_uuid(), q_id, 'NULLを挿入するとdepartmentsテーブルにも空行が追加される', false, 3),
    (gen_random_uuid(), q_id, 'NULLの行はLEFT JOINでも除外される', false, 4);

  -- ============================================================
  -- Topic 3: トランザクション・インデックス (DEV-SQL-03) — 5 questions
  -- ============================================================

  -- T3-Q1 (easy): ACID特性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'トランザクションのACID特性のうち、「口座Aからの出金と口座Bへの入金が必ず両方実行されるか、両方取り消される」ことを保証する特性はどれですか？',
  'multiple_choice', 'easy', 'sql', 'concept',
  '原子性（Atomicity）は「全て実行されるか、全て取り消されるか」のいずれかを保証する特性です。送金処理で出金だけ成功して入金が失敗するような中途半端な状態を防ぎます。',
  1, 11, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '原子性（Atomicity）', true, 1),
    (gen_random_uuid(), q_id, '一貫性（Consistency）', false, 2),
    (gen_random_uuid(), q_id, '独立性（Isolation）', false, 3),
    (gen_random_uuid(), q_id, '耐久性（Durability）', false, 4);

  -- T3-Q2 (medium): インデックスのメリットとデメリット
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'データベースインデックスに関する説明として正しいものはどれですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  'インデックスはSELECTクエリの検索速度を大幅に向上させますが、INSERT/UPDATE/DELETE時にはインデックスの更新が必要になるため書き込みが遅くなります。また、ストレージ容量も消費します。読み取りが多いカラムに作成するのが効果的です。',
  2, 12, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SELECT速度は向上するが、INSERT/UPDATE/DELETE速度は低下する', true, 1),
    (gen_random_uuid(), q_id, '全てのSQL操作が均等に高速化される', false, 2),
    (gen_random_uuid(), q_id, 'テーブルの全カラムにインデックスを作成すべきである', false, 3),
    (gen_random_uuid(), q_id, 'インデックスはストレージを消費しない', false, 4);

  -- T3-Q3 (medium): 危険なSQL
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  '本番環境でUPDATE文を実行する前に最初に行うべきことはどれですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  '本番環境での安全なSQL実行手順は、まず同じWHERE条件でSELECTを実行して対象行を確認し、次にBEGINでトランザクションを開始、UPDATEを実行、結果を確認してからCOMMITまたはROLLBACKを行うことです。',
  2, 13, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '同じWHERE条件でSELECTを実行して対象行を確認する', true, 1),
    (gen_random_uuid(), q_id, 'データベースのバックアップを取得する', false, 2),
    (gen_random_uuid(), q_id, '全テーブルにインデックスを追加する', false, 3),
    (gen_random_uuid(), q_id, 'ログレベルをDEBUGに変更する', false, 4);

  -- T3-Q4 (medium): LIKE句とインデックス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  'nameカラムにインデックスがある場合、インデックスが有効に使用されるLIKEパターンはどれですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  'B-Treeインデックスは先頭からの前方一致検索でのみ有効です。LIKE ''田中%''は先頭が固定されているためインデックスが使えますが、LIKE ''%田中%''や''%田中''は先頭がワイルドカードのためインデックスが使えず、フルテーブルスキャンになります。',
  2, 14, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'LIKE ''田中%''（前方一致）', true, 1),
    (gen_random_uuid(), q_id, 'LIKE ''%田中%''（部分一致）', false, 2),
    (gen_random_uuid(), q_id, 'LIKE ''%田中''（後方一致）', false, 3),
    (gen_random_uuid(), q_id, '全てのLIKEパターンでインデックスが使用される', false, 4);

  -- T3-Q5 (hard): トランザクションの複数テーブル更新
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  '注文キャンセル処理で、ordersテーブルのステータス更新とinventoryテーブルの在庫数復元を行う場合、トランザクションなしで実行すると何が起こり得ますか？',
  'multiple_choice', 'hard', 'sql', 'concept',
  'トランザクションなしで複数テーブルを更新すると、最初のUPDATE（注文ステータス変更）は成功し、2番目のUPDATE（在庫復元）が失敗した場合、データの不整合が発生します。注文はキャンセル済みなのに在庫が戻らない状態になります。BEGINとCOMMIT/ROLLBACKで原子性を保証する必要があります。',
  3, 15, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1つ目の更新だけ成功し、2つ目が失敗するとデータ不整合が発生する', true, 1),
    (gen_random_uuid(), q_id, 'データベースが自動的に両方をロールバックする', false, 2),
    (gen_random_uuid(), q_id, '両方のUPDATEが同時に実行されるため問題ない', false, 3),
    (gen_random_uuid(), q_id, '2つ目のUPDATEが失敗すると1つ目も自動取消される', false, 4);

END $$;
