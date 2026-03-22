-- CWF (共通業務基礎) concept questions for dev assessment quiz
-- 30 questions: easy 9 (301-309), medium 15 (310-324), hard 6 (325-330)
-- question_category = 'cwf', question_subtype = 'concept'
-- For understanding test only (not included in comprehensive exam)

-- ===== EASY (9) =====

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'ビジネスメールでCCとBCCの違いについて正しい説明はどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    'CCは受信者全員にアドレスが見え、BCCは他の受信者にアドレスが見えません。', 1, 301, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CCもBCCも受信者全員にアドレスが表示される', false, 1),
    (gen_random_uuid(), q_id, 'CCは受信者全員にアドレスが見えるが、BCCは他の受信者にアドレスが見えない', true, 2),
    (gen_random_uuid(), q_id, 'BCCに入れた人だけがメールを受信できる', false, 3),
    (gen_random_uuid(), q_id, 'CCに入れた人はメールに返信できない', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '「報連相」の「相」が意味するものはどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    '報連相は報告・連絡・相談の略です。', 1, 302, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '相互確認', false, 1),
    (gen_random_uuid(), q_id, '相談', true, 2),
    (gen_random_uuid(), q_id, '相違点の指摘', false, 3),
    (gen_random_uuid(), q_id, '相手への連絡', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '日本のオフィスで名刺交換をする際の基本マナーとして正しいものはどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    '名刺は両手で受け取り、すぐにしまわずテーブルの上に置くのがマナーです。', 1, 303, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '片手で受け取ってすぐにポケットに入れる', false, 1),
    (gen_random_uuid(), q_id, '両手で受け取り、会議中はテーブルの上に置く', true, 2),
    (gen_random_uuid(), q_id, '名刺にメモを書き込んで記憶する', false, 3),
    (gen_random_uuid(), q_id, '相手より先に自分の名刺を出さない', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '議事録に必ず含めるべき項目として最も適切でないものはどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    '議事録には日時、参加者、議題、決定事項、アクションアイテムを含めます。参加者の私的な感想は不要です。', 1, 304, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議の日時と参加者', false, 1),
    (gen_random_uuid(), q_id, '決定事項とアクションアイテム', false, 2),
    (gen_random_uuid(), q_id, '各参加者の私的な感想', true, 3),
    (gen_random_uuid(), q_id, '次回会議の予定', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'チーム内でカレンダーを共有する主な目的として最も適切なものはどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    'カレンダー共有の主な目的は、メンバーの予定を把握し会議調整を効率化することです。', 1, 305, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '個人の勤務時間を監視するため', false, 1),
    (gen_random_uuid(), q_id, 'メンバーの予定を把握し会議調整を効率化するため', true, 2),
    (gen_random_uuid(), q_id, '上司に自分の忙しさをアピールするため', false, 3),
    (gen_random_uuid(), q_id, 'プライベートの予定を共有するため', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'プロジェクトのファイル命名規則として最も適切なものはどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    '日付、プロジェクト名、バージョンを含む一貫した命名規則が望ましいです。', 1, 306, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '好きな名前を自由につける', false, 1),
    (gen_random_uuid(), q_id, '日付_プロジェクト名_バージョン番号の形式で統一する', true, 2),
    (gen_random_uuid(), q_id, 'ファイル名にスペースと日本語を多用する', false, 3),
    (gen_random_uuid(), q_id, 'すべてのファイルを「最終版」と名付ける', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Slackなどの社内チャットツールの利用マナーとして適切なものはどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    '業務連絡はチャンネルで行い、検索可能な形で情報共有することが重要です。', 1, 307, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全ての連絡をDMで個別に送る', false, 1),
    (gen_random_uuid(), q_id, '適切なチャンネルを選んで業務連絡を投稿する', true, 2),
    (gen_random_uuid(), q_id, '既読をつけたくないのでメッセージを開かない', false, 3),
    (gen_random_uuid(), q_id, '長文の議論はチャットで行い議事録を残さない', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '勤怠管理において、遅刻する場合の対応として最も適切なものはどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    '遅刻が判明した時点で速やかに上司に連絡し、到着予定時刻を伝えるのが基本です。', 1, 308, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '到着してから上司に報告する', false, 1),
    (gen_random_uuid(), q_id, '遅刻が分かった時点で速やかに上司に連絡する', true, 2),
    (gen_random_uuid(), q_id, '同僚に代わりに伝えてもらう', false, 3),
    (gen_random_uuid(), q_id, '翌日まとめて報告する', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '情報セキュリティにおけるパスワード管理の基本として正しいものはどれですか？',
    'multiple_choice', 'easy', 'cwf', 'concept',
    '推測されにくい複雑なパスワードを使い、サービスごとに異なるパスワードを設定するのが基本です。', 1, 309, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '覚えやすいように全サービスで同じパスワードを使う', false, 1),
    (gen_random_uuid(), q_id, '英大小文字・数字・記号を含む複雑なパスワードをサービスごとに設定する', true, 2),
    (gen_random_uuid(), q_id, 'パスワードを付箋に書いてモニターに貼る', false, 3),
    (gen_random_uuid(), q_id, '誕生日や電話番号をパスワードに使う', false, 4);
END $$;

-- ===== MEDIUM (15) =====

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Gitで「git pull」コマンドが内部的に行う操作の組み合わせとして正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'git pullはgit fetch（リモートの変更を取得）とgit merge（ローカルに統合）を組み合わせた操作です。', 1, 310, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'git add + git commit', false, 1),
    (gen_random_uuid(), q_id, 'git fetch + git merge', true, 2),
    (gen_random_uuid(), q_id, 'git clone + git checkout', false, 3),
    (gen_random_uuid(), q_id, 'git stash + git apply', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'JiraやBacklogなどのタスク管理ツールで「ステータス」を適切に更新する主な理由はどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'ステータス更新によりチーム全体の進捗が可視化され、ボトルネックの早期発見につながります。', 1, 311, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '上司が個人の仕事量を監視するため', false, 1),
    (gen_random_uuid(), q_id, 'チーム全体の進捗を可視化しボトルネックを早期発見するため', true, 2),
    (gen_random_uuid(), q_id, '完了タスクの数を競うため', false, 3),
    (gen_random_uuid(), q_id, '年末の人事評価の証拠にするため', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'コードレビューの主な目的として最も適切なものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'コードレビューは品質向上と知識共有の両方を目的とし、チーム全体の技術力向上に寄与します。', 1, 312, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードの書き方が社内規約に合っているか確認するだけ', false, 1),
    (gen_random_uuid(), q_id, 'コード品質の向上とチーム内の知識共有', true, 2),
    (gen_random_uuid(), q_id, 'バグを見つけた人を評価するため', false, 3),
    (gen_random_uuid(), q_id, '新人のスキルレベルを測定するため', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'スクラム開発における「スプリントレトロスペクティブ」の目的はどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'レトロスペクティブはスプリントの振り返りを行い、プロセス改善の機会を見つけるための会議です。', 1, 313, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次のスプリントのタスクを計画する', false, 1),
    (gen_random_uuid(), q_id, 'スプリントを振り返りプロセスの改善点を議論する', true, 2),
    (gen_random_uuid(), q_id, '完成した機能をステークホルダーにデモする', false, 3),
    (gen_random_uuid(), q_id, '各メンバーの日次進捗を報告する', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'ソフトウェアテストの工程で「結合テスト」が検証する対象として正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    '結合テストは複数のモジュールを組み合わせた際のインターフェースや連携の動作を検証します。', 1, 314, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '個々の関数やメソッドの動作', false, 1),
    (gen_random_uuid(), q_id, '複数モジュール間のインターフェースと連携動作', true, 2),
    (gen_random_uuid(), q_id, 'ユーザーの操作シナリオ全体', false, 3),
    (gen_random_uuid(), q_id, '本番環境でのパフォーマンス', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '障害報告書に必ず記載すべき項目として最も適切でないものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    '障害報告書には発生日時、影響範囲、原因、対処内容、再発防止策を記載します。担当者の反省文は不要です。', 1, 315, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '障害の発生日時と影響範囲', false, 1),
    (gen_random_uuid(), q_id, '原因分析と対処内容', false, 2),
    (gen_random_uuid(), q_id, '担当者の個人的な反省文', true, 3),
    (gen_random_uuid(), q_id, '再発防止策', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'ソフトウェア開発の見積もり手法「ファンクションポイント法」の特徴として正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'ファンクションポイント法はシステムの機能量に基づいて開発規模を見積もる手法です。', 1, 316, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソースコードの行数から開発規模を見積もる', false, 1),
    (gen_random_uuid(), q_id, 'システムの機能量に基づいて開発規模を見積もる', true, 2),
    (gen_random_uuid(), q_id, '過去のプロジェクトの期間をそのまま適用する', false, 3),
    (gen_random_uuid(), q_id, '開発者の経験年数から工数を計算する', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '基本設計書と詳細設計書の違いとして正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    '基本設計はシステム全体の構造を定義し、詳細設計は各モジュールの内部ロジックを定義します。', 1, 317, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '基本設計はクライアント向け、詳細設計は社内向けの文書', false, 1),
    (gen_random_uuid(), q_id, '基本設計はシステム全体構造、詳細設計はモジュール内部ロジックを定義する', true, 2),
    (gen_random_uuid(), q_id, '基本設計は日本語、詳細設計は英語で書く', false, 3),
    (gen_random_uuid(), q_id, '基本設計はPM、詳細設計はテスターが作成する', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'CI/CDパイプラインの「CD」が意味するものとして正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'CDはContinuous Delivery（継続的デリバリー）またはContinuous Deployment（継続的デプロイ）の略です。', 1, 318, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Code Development（コード開発）', false, 1),
    (gen_random_uuid(), q_id, 'Continuous Delivery（継続的デリバリー）', true, 2),
    (gen_random_uuid(), q_id, 'Critical Debugging（重大バグ修正）', false, 3),
    (gen_random_uuid(), q_id, 'Centralized Database（中央データベース）', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '品質管理における「QA」と「QC」の違いとして正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'QA（品質保証）はプロセス全体の品質を保証し、QC（品質管理）は成果物の品質を検査します。', 1, 319, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'QAはテスト実行、QCはテスト計画を担当する', false, 1),
    (gen_random_uuid(), q_id, 'QAはプロセス全体の品質保証、QCは成果物の品質検査を行う', true, 2),
    (gen_random_uuid(), q_id, 'QAは開発チーム、QCは運用チームの略称', false, 3),
    (gen_random_uuid(), q_id, 'QAとQCは同じ意味で互換的に使われる', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'WBS（Work Breakdown Structure）の主な目的として正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'WBSはプロジェクトの作業を階層的に分解し、全体像と各タスクの関係を可視化します。', 1, 320, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メンバーの勤務スケジュールを管理する', false, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの作業を階層的に分解し全体像を可視化する', true, 2),
    (gen_random_uuid(), q_id, '開発ツールのバージョンを管理する', false, 3),
    (gen_random_uuid(), q_id, 'テストケースの一覧を作成する', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '日本のSES（システムエンジニアリングサービス）契約の特徴として正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'SES契約では技術者の労働力を提供し、作業時間に対して報酬が支払われます。', 1, 321, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '成果物の納品に対して報酬が支払われる', false, 1),
    (gen_random_uuid(), q_id, '技術者の労働力を提供し作業時間に対して報酬が支払われる', true, 2),
    (gen_random_uuid(), q_id, '発注元が技術者に直接指揮命令できる', false, 3),
    (gen_random_uuid(), q_id, '契約期間中の技術者の変更は一切できない', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '個人情報保護法において「個人情報」に該当するものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    '個人情報保護法では、生存する個人を識別できる情報が個人情報に該当します。', 1, 322, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '企業の売上データ', false, 1),
    (gen_random_uuid(), q_id, '氏名とメールアドレスの組み合わせ', true, 2),
    (gen_random_uuid(), q_id, '匿名化された統計データ', false, 3),
    (gen_random_uuid(), q_id, '公開されている企業の住所', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'VPN（Virtual Private Network）を使用する主な目的として正しいものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'VPNは暗号化された通信経路を作り、リモートから社内ネットワークに安全にアクセスするために使用します。', 1, 323, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インターネットの通信速度を向上させる', false, 1),
    (gen_random_uuid(), q_id, '暗号化された通信経路で社内ネットワークに安全にアクセスする', true, 2),
    (gen_random_uuid(), q_id, 'ウイルス対策ソフトの代わりに使用する', false, 3),
    (gen_random_uuid(), q_id, 'メールの添付ファイルを自動で暗号化する', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '新しい開発環境をセットアップする際に最初に確認すべきこととして最も適切なものはどれですか？',
    'multiple_choice', 'medium', 'cwf', 'concept',
    'チームの開発環境構築手順書やREADMEを確認し、統一された環境で開発することが重要です。', 1, 324, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自分の好みのエディタとプラグインをインストールする', false, 1),
    (gen_random_uuid(), q_id, 'チームの環境構築手順書やREADMEを確認する', true, 2),
    (gen_random_uuid(), q_id, '最新バージョンの全ツールをインストールする', false, 3),
    (gen_random_uuid(), q_id, '本番環境のデータをローカルにコピーする', false, 4);
END $$;

-- ===== HARD (6) =====

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'ITILにおける「インシデント管理」と「問題管理」の違いとして正しいものはどれですか？',
    'multiple_choice', 'hard', 'cwf', 'concept',
    'インシデント管理はサービスの迅速な復旧を目的とし、問題管理は根本原因の特定と恒久対策を目的とします。', 1, 325, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インシデント管理は予防、問題管理は事後対応を行う', false, 1),
    (gen_random_uuid(), q_id, 'インシデント管理はサービスの迅速な復旧、問題管理は根本原因の特定を行う', true, 2),
    (gen_random_uuid(), q_id, 'インシデント管理は開発チーム、問題管理は運用チームが担当する', false, 3),
    (gen_random_uuid(), q_id, 'インシデント管理と問題管理は同じプロセスの別名称', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'PMBOKの知識エリアに含まれないものはどれですか？',
    'multiple_choice', 'hard', 'cwf', 'concept',
    'PMBOKの知識エリアはスコープ、スケジュール、コスト、品質、資源、コミュニケーション、リスク、調達、ステークホルダー、統合の10領域です。', 1, 326, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リスクマネジメント', false, 1),
    (gen_random_uuid(), q_id, 'ステークホルダーマネジメント', false, 2),
    (gen_random_uuid(), q_id, 'テクノロジーマネジメント', true, 3),
    (gen_random_uuid(), q_id, 'コミュニケーションマネジメント', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'セキュリティインシデント発生時の対応手順として正しい順序はどれですか？',
    'multiple_choice', 'hard', 'cwf', 'concept',
    '検知→初動対応(封じ込め)→調査分析→復旧→再発防止の順序が基本です。', 1, 327, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '調査分析 → 検知 → 復旧 → 封じ込め → 再発防止', false, 1),
    (gen_random_uuid(), q_id, '検知 → 封じ込め → 調査分析 → 復旧 → 再発防止', true, 2),
    (gen_random_uuid(), q_id, '復旧 → 検知 → 封じ込め → 再発防止 → 調査分析', false, 3),
    (gen_random_uuid(), q_id, '封じ込め → 復旧 → 検知 → 調査分析 → 再発防止', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    '「準委任契約」と「請負契約」の最も大きな違いはどれですか？',
    'multiple_choice', 'hard', 'cwf', 'concept',
    '請負契約は成果物の完成責任があり、準委任契約は業務の遂行自体に対する責任があります。', 1, 328, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '準委任は短期、請負は長期の契約形態', false, 1),
    (gen_random_uuid(), q_id, '請負は成果物の完成責任があり、準委任は業務遂行の責任がある', true, 2),
    (gen_random_uuid(), q_id, '準委任は個人、請負は法人向けの契約', false, 3),
    (gen_random_uuid(), q_id, '請負は国内、準委任は海外案件で使用する', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'IT内部統制において「職務分掌」が重要とされる理由として正しいものはどれですか？',
    'multiple_choice', 'hard', 'cwf', 'concept',
    '職務分掌は一人に権限が集中することを防ぎ、不正やミスの早期発見を可能にするため重要です。', 1, 329, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '作業効率を最大化するため', false, 1),
    (gen_random_uuid(), q_id, '権限の集中を防ぎ不正やミスの早期発見を可能にするため', true, 2),
    (gen_random_uuid(), q_id, 'メンバー間の公平な作業分担を実現するため', false, 3),
    (gen_random_uuid(), q_id, '組織図を明確にするため', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'ISO 27001の情報セキュリティマネジメントシステム（ISMS）におけるPDCAサイクルの「C」が意味するものはどれですか？',
    'multiple_choice', 'hard', 'cwf', 'concept',
    'PDCAのCはCheck（点検・評価）で、実施した対策の有効性を評価し改善点を見つけます。', 1, 330, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Control（統制）', false, 1),
    (gen_random_uuid(), q_id, 'Check（点検・評価）', true, 2),
    (gen_random_uuid(), q_id, 'Compliance（法令遵守）', false, 3),
    (gen_random_uuid(), q_id, 'Certification（認証取得）', false, 4);
END $$;
