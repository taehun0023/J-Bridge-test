-- Expand CS subject understanding tests to 3-set structure.
-- Reuse existing final pool quiz ids where available.
-- Add check-1/check-2 pools for all subjects.
-- Add a dedicated computer_architecture source bank and pools.

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  ('60000001-0000-0000-0000-000000000001', 'CS Knowledge Algorithms Final', 'cs_knowledge', 70, 20, false, true, 12),
  ('60000001-0000-0000-0000-000000000002', 'CS Knowledge Data Structures Final', 'cs_knowledge', 70, 20, false, true, 12),
  ('60000001-0000-0000-0000-000000000004', 'CS Knowledge Database Final', 'cs_knowledge', 70, 20, false, true, 12),
  ('60000001-0000-0000-0000-000000000005', 'CS Knowledge Networking Final', 'cs_knowledge', 70, 20, false, true, 12),
  ('60000001-0000-0000-0000-000000000006', 'CS Knowledge OS Final', 'cs_knowledge', 70, 20, false, true, 12),
  ('60000001-0000-0000-0000-000000000007', 'CS Knowledge Security Final', 'cs_knowledge', 70, 20, false, true, 12),
  ('60000001-0000-0000-0000-000000000010', 'CS Knowledge Computer Architecture Final', 'cs_knowledge', 70, 20, false, true, 12),
  ('60000001-0000-0000-0000-000000000011', 'CS Knowledge Data Structures Check 1', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000012', 'CS Knowledge Data Structures Check 2', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000013', 'CS Knowledge Algorithms Check 1', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000014', 'CS Knowledge Algorithms Check 2', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000015', 'CS Knowledge Computer Architecture Check 1', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000016', 'CS Knowledge Computer Architecture Check 2', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000017', 'CS Knowledge Database Check 1', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000018', 'CS Knowledge Database Check 2', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000019', 'CS Knowledge Networking Check 1', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000020', 'CS Knowledge Networking Check 2', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000021', 'CS Knowledge OS Check 1', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000022', 'CS Knowledge OS Check 2', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000023', 'CS Knowledge Security Check 1', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000024', 'CS Knowledge Security Check 2', 'cs_knowledge', 70, 12, false, true, 8),
  ('61000001-0000-0000-0000-000000000006', 'CS Knowledge Computer Architecture Source', 'cs_knowledge', 70, 0, false, false, NULL)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  passing_score = EXCLUDED.passing_score,
  time_limit_minutes = EXCLUDED.time_limit_minutes,
  is_assessment = EXCLUDED.is_assessment,
  is_pool = EXCLUDED.is_pool,
  questions_per_attempt = EXCLUDED.questions_per_attempt;

DO $$
DECLARE q_id UUID;
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM quiz_questions
    WHERE quiz_id = '61000001-0000-0000-0000-000000000006'
      AND question_category = 'computer_architecture'
  ) THEN
    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', '命令を主に実行する装置はどれか。', 'CPUは命令を取り出し、解読し、実行する中心的な装置である。', 1, 1, 'easy', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, 'CPU', true, 1),
      (gen_random_uuid(), q_id, 'SSD', false, 2),
      (gen_random_uuid(), q_id, 'ディスプレイ', false, 3),
      (gen_random_uuid(), q_id, 'プリンタ', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', 'RAMの主な役割はどれか。', 'RAMはCPUがすぐ使う作業中のデータを保持する。', 1, 2, 'easy', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, '実行中の処理に必要なデータを一時的に保持する', true, 1),
      (gen_random_uuid(), q_id, 'インターネット接続を提供する', false, 2),
      (gen_random_uuid(), q_id, '文字を画像に変換する', false, 3),
      (gen_random_uuid(), q_id, 'すべてのファイルを自動で暗号化する', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', 'キャッシュメモリは主に何を減らそうとするか。', 'キャッシュは平均的なメモリアクセス時間を短くするために使われる。', 1, 3, 'easy', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, 'メモリアクセスの遅延', true, 1),
      (gen_random_uuid(), q_id, '画面の明るさ', false, 2),
      (gen_random_uuid(), q_id, 'ファイル数', false, 3),
      (gen_random_uuid(), q_id, 'LANケーブルの長さ', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', '割込みを最も適切に説明しているものはどれか。', '割込みにより、CPUは常に待ち続けなくても発生したイベントに対応できる。', 1, 4, 'medium', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, 'CPUにイベント処理を要求する信号', true, 1),
      (gen_random_uuid(), q_id, 'ファイルを圧縮する方式', false, 2),
      (gen_random_uuid(), q_id, 'データベースのロック方式', false, 3),
      (gen_random_uuid(), q_id, 'ネットワークの経路表', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', '補助記憶装置が主記憶装置と異なる点として適切なものはどれか。', '補助記憶装置は主記憶より遅いが、電源を切ってもデータを保持できる。', 1, 5, 'medium', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, '電源を切ってもデータを保持できる', true, 1),
      (gen_random_uuid(), q_id, '常にRAMより容量が小さい', false, 2),
      (gen_random_uuid(), q_id, '命令を直接実行する', false, 3),
      (gen_random_uuid(), q_id, 'CPUキャッシュを置き換える', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', 'コンピュータ構成におけるバスとは何か。', 'バスは、データ・アドレス・制御信号をやり取りするための共通経路である。', 1, 6, 'medium', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, 'データや制御信号をやり取りする共通経路', true, 1),
      (gen_random_uuid(), q_id, '予備電池', false, 2),
      (gen_random_uuid(), q_id, 'パスワード管理ソフト', false, 3),
      (gen_random_uuid(), q_id, '表計算ソフトの関数', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', '命令実行の流れとして自然な順序はどれか。', 'CPUは一般に、命令を取り出し、解読し、実行する。', 1, 7, 'medium', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, '取り出し → 解読 → 実行', true, 1),
      (gen_random_uuid(), q_id, '保存 → 印刷 → 暗号化', false, 2),
      (gen_random_uuid(), q_id, 'コンパイル → 経路選択 → 保管', false, 3),
      (gen_random_uuid(), q_id, '解読 → 停止 → 取り出し', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', 'キャッシュミスが起こりやすい状況はどれか。', '必要なデータがキャッシュ内になく、より遅い層から取り出す必要があるときにキャッシュミスが起こる。', 1, 8, 'hard', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, '必要なデータがキャッシュ内にない', true, 1),
      (gen_random_uuid(), q_id, 'ディスプレイケーブルが抜けている', false, 2),
      (gen_random_uuid(), q_id, 'テーブルに主キーがない', false, 3),
      (gen_random_uuid(), q_id, 'DNS名が解決できない', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', 'I/O装置に対して割込みが有効な理由として適切なものはどれか。', '割込みを使うと、装置が処理を必要とするまでCPUは別の仕事を進められる。', 1, 9, 'hard', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, 'CPUによる常時監視を減らせる', true, 1),
      (gen_random_uuid(), q_id, 'すべてのプログラムを単一スレッド化する', false, 2),
      (gen_random_uuid(), q_id, 'RAMをSSDに変える', false, 3),
      (gen_random_uuid(), q_id, 'OSを不要にする', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', '大きなファイルを読み込むときだけアプリが遅い場合、まず疑うべきものはどれか。', '大きなファイルの読み込み遅延は、補助記憶装置のスループットやメモリ階層のボトルネックを示すことが多い。', 1, 10, 'hard', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, '補助記憶装置またはメモリ階層のボトルネック', true, 1),
      (gen_random_uuid(), q_id, 'キーボード配列の誤り', false, 2),
      (gen_random_uuid(), q_id, 'CSS命名規則の不統一', false, 3),
      (gen_random_uuid(), q_id, 'HTTPメソッドの不一致', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', 'ボトルネックの解釈として最も適切なものはどれか。', 'ボトルネックとは、全体の処理量を制約している最も遅い部分を指す。', 1, 11, 'hard', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, 'システム全体の性能を制約している部分', true, 1),
      (gen_random_uuid(), q_id, '最もボタン数の多い機能', false, 2),
      (gen_random_uuid(), q_id, '最も新しい部品', false, 3),
      (gen_random_uuid(), q_id, 'ネットワーク名にだけ影響する不具合', false, 4);

    q_id := gen_random_uuid();
    INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
    VALUES (q_id, '61000001-0000-0000-0000-000000000006', 'multiple_choice', 'クロック周波数が高いことから直接読み取れることはどれか。', 'クロック周波数は1秒あたりの基本周期数を示すが、実際の性能は他の要素にも左右される。', 1, 12, 'hard', 'computer_architecture', true);
    INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
      (gen_random_uuid(), q_id, '1秒あたりの周期数が多いが、総合性能が自動的に高いとは限らない', true, 1),
      (gen_random_uuid(), q_id, 'メモリ容量が無限になる', false, 2),
      (gen_random_uuid(), q_id, 'キャッシュミスが起こらなくなる', false, 3),
      (gen_random_uuid(), q_id, 'すべてのプログラムが1手順で終わる', false, 4);
  END IF;
END $$;
