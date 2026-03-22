-- ============================================================
-- Dev Practice Quiz: 共通業務基礎 理解度テスト問題 (40 questions)
-- Source quiz for pool quiz e0000001-0000-0000-0000-000000000007
-- 8 topic areas × 5 questions each
-- Difficulty: easy 12, medium 20, hard 8 (30/50/20 ratio)
-- ============================================================

-- 1) Source quiz record (non-pool, non-assessment)
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('e1000001-0000-0000-0000-000000000007', '共通業務基礎 理解度テスト問題', 'core_programming', 70, NULL, false, false, NULL)
ON CONFLICT (id) DO NOTHING;

-- 2) 40 questions
DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Topic 1: エラーレポートの読み方 (DEV-CWF-01) — 5 questions
  -- ============================================================

  -- T1-Q1 (easy): エラーレポートの必須要素
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'エラーレポートに含めるべき情報として最も重要なものはどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  '良いエラーレポートには「何が起きたか（症状）」「いつ・どこで・どの入力で（再現条件）」「環境・バージョン情報」の3つが最低限必要です。実際に観察された症状と再現条件があれば、調査者が問題を再現・特定できます。',
  1, 1, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '症状・再現条件・環境情報', true, 1),
    (gen_random_uuid(), q_id, '修正方法の提案', false, 2),
    (gen_random_uuid(), q_id, 'エラーが発生したコードの行番号', false, 3),
    (gen_random_uuid(), q_id, '類似エラーの過去事例', false, 4);

  -- T1-Q2 (easy): 症状と原因の区別
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '「ログインできない」というエラーレポートにおいて、「症状」に該当するのはどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  '症状とは実際に観察される現象です。「ログインボタンを押すと500エラーが返る」は観察可能な事実です。一方、「セッション管理の設定が間違っている」は原因の推測であり、初期レポートでは事実と推測を分けて記述すべきです。',
  1, 2, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ログインボタンを押すと500エラーが返る', true, 1),
    (gen_random_uuid(), q_id, 'セッション管理の設定が間違っている', false, 2),
    (gen_random_uuid(), q_id, '認証モジュールのバグである', false, 3),
    (gen_random_uuid(), q_id, 'デプロイ時にDBマイグレーションが失敗した', false, 4);

  -- T1-Q3 (medium): 不十分なエラーレポート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '「会員登録ができません。至急対応お願いします。」というエラーレポートの最大の問題点はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'このレポートには再現手順、環境情報、エラーメッセージの記載がありません。調査者は「いつ」「どの環境で」「どの操作で」「何が起きたか」を確認するところから始める必要があり、調査コストが大幅に増加します。',
  2, 3, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '再現手順・環境情報・エラーメッセージが一切記載されていない', true, 1),
    (gen_random_uuid(), q_id, '敬語が不足している', false, 2),
    (gen_random_uuid(), q_id, '修正方法が提案されていない', false, 3),
    (gen_random_uuid(), q_id, '優先度の指定がない', false, 4);

  -- T1-Q4 (medium): 事実と推測の分離
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'エラーレポートで「事実」と「推測」を分けて記述すべき理由はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '最初のレポートで原因を断定すると、調査者がその方向にだけ調査を進めてしまい、真の原因を見逃す可能性があります。「NullPointerExceptionが記録された（事実）」と「セッション設定が原因だと思う（推測）」を分けることで、バイアスのない調査が可能になります。',
  2, 4, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '原因の決めつけにより調査方向が限定され、真の原因を見逃す恐れがあるため', true, 1),
    (gen_random_uuid(), q_id, '推測はレポートに含めてはいけない社内ルールだから', false, 2),
    (gen_random_uuid(), q_id, 'レポートの文字数を減らすため', false, 3),
    (gen_random_uuid(), q_id, '推測部分は自動翻訳が難しいため', false, 4);

  -- T1-Q5 (hard): 良いレポートの判定
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '次のうち、最も良いエラーレポートはどれですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  '良いレポートには環境、時刻、再現手順、エラー内容が具体的に記載され、事実と推測が分離されています。「prod環境」「09:20」「メール認証→完了ボタン」「500レスポンス」は全て検証可能な事実であり、調査者がすぐに再現・調査を開始できます。',
  3, 5, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2026-03-18 09:20 prod環境。メール認証→完了ボタン押下で500。直近デプロイ後初の発生。サーバーログにNullPointerException記録あり。', true, 1),
    (gen_random_uuid(), q_id, '会員登録が壊れています。認証モジュールのバグだと思います。すぐ直してください。', false, 2),
    (gen_random_uuid(), q_id, '会員登録でエラーが出ました。多分サーバー側の問題です。', false, 3),
    (gen_random_uuid(), q_id, '昨日から会員登録ができないようです。確認をお願いします。', false, 4);

  -- ============================================================
  -- Topic 2: バージョン管理 (DEV-CWF-02) — 5 questions
  -- ============================================================

  -- T2-Q1 (easy): Gitコマンドの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'git addコマンドの役割として正しいものはどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  'git addは変更したファイルをステージングエリアに追加するコマンドです。コミットに含める変更を選択する役割があります。git commitはスナップショットの作成、git pushはリモートへの送信、git pullはリモートからの取得を行います。',
  1, 6, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変更したファイルをステージングエリアに追加する', true, 1),
    (gen_random_uuid(), q_id, '変更をリモートリポジトリに送信する', false, 2),
    (gen_random_uuid(), q_id, '変更のスナップショットを作成する', false, 3),
    (gen_random_uuid(), q_id, 'リモートの変更をローカルに取得する', false, 4);

  -- T2-Q2 (medium): コミットメッセージの構造
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '次のコミットメッセージのうち、最も適切なものはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '良いコミットメッセージにはプレフィックス（変更種別）、具体的な変更内容、影響範囲が含まれます。「fix:」で種別を示し、「何を」「どう変えたか」が具体的に分かる記述が理想的です。「修正」「更新」だけでは後から変更内容を追跡できません。',
  2, 7, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'fix: 会員登録メール認証トークンの有効期限を30分から60分に変更 (#142)', true, 1),
    (gen_random_uuid(), q_id, '修正', false, 2),
    (gen_random_uuid(), q_id, 'バグを直した', false, 3),
    (gen_random_uuid(), q_id, 'update files', false, 4);

  -- T2-Q3 (medium): ブランチ戦略
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'featureブランチを使用する主な理由はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'featureブランチは各機能やバグ修正を独立した作業空間で行うための仕組みです。mainブランチに未完成のコードが入ることを防ぎ、複数人が同時に異なる機能を開発できます。完成後にレビューを経てmainにマージします。',
  2, 8, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'mainブランチに未完成コードが入ることを防ぎ、並行開発を可能にする', true, 1),
    (gen_random_uuid(), q_id, 'コードの自動テストを高速化するため', false, 2),
    (gen_random_uuid(), q_id, 'リポジトリのストレージ容量を節約するため', false, 3),
    (gen_random_uuid(), q_id, 'コミット数を減らしてログを見やすくするため', false, 4);

  -- T2-Q4 (medium): コンフリクトの原因
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'Gitのコンフリクト（競合）が発生する最も一般的な原因はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'コンフリクトは複数の人が同じファイルの同じ行を別々に変更した場合に発生します。Gitはどちらの変更を採用すべきか判断できないため、手動での解決が必要です。作業前にgit pullで最新の状態を取得することで、コンフリクトの発生を減らせます。',
  2, 9, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '複数人が同じファイルの同じ箇所を別々に変更した', true, 1),
    (gen_random_uuid(), q_id, '異なるブランチで異なるファイルを変更した', false, 2),
    (gen_random_uuid(), q_id, 'git pushの回数が多すぎた', false, 3),
    (gen_random_uuid(), q_id, 'コミットメッセージが重複した', false, 4);

  -- T2-Q5 (hard): コミット単位の考え方
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '「ログイン機能の修正」と「メール送信テンプレートの変更」を同時に行った場合、コミットの仕方として最も適切なものはどれですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  '論理的に異なる変更は別々のコミットに分けるべきです。1つのコミットに複数の無関係な変更を含めると、レビューが困難になり、特定の変更だけをrevert（取り消し）することもできなくなります。git addで対象ファイルを選択して個別にコミットします。',
  3, 10, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2つの変更を別々のコミットに分ける', true, 1),
    (gen_random_uuid(), q_id, '1つのコミットにまとめて効率化する', false, 2),
    (gen_random_uuid(), q_id, '大きい方の変更だけコミットし、小さい方は次回に回す', false, 3),
    (gen_random_uuid(), q_id, 'ブランチを2つ作成して同時にプッシュする', false, 4);

  -- ============================================================
  -- Topic 3: イシューとタスク (DEV-CWF-03) — 5 questions
  -- ============================================================

  -- T3-Q1 (easy): イシューの構成要素
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'イシュートラッカーのイシューにおいて、作業完了の判断基準を示すものはどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  '受入条件（Acceptance Criteria）は「何をもって完了とするか」を明確に定義します。これがないと作業者と依頼者の間で完了の認識がずれ、手戻りが発生します。',
  1, 11, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '受入条件（Acceptance Criteria）', true, 1),
    (gen_random_uuid(), q_id, 'ラベル（Label）', false, 2),
    (gen_random_uuid(), q_id, 'マイルストーン（Milestone）', false, 3),
    (gen_random_uuid(), q_id, '担当者（Assignee）', false, 4);

  -- T3-Q2 (medium): 優先度ラベル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '優先度ラベルP0/Criticalが付与されたイシューの特徴として正しいものはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'P0/Criticalはサービスダウンやデータ損失など、即座に対応が必要な最緊急の問題を示します。ワークアラウンドがなく、ビジネスへの影響が重大です。P1（主要機能に影響、回避策あり）とは緊急度が異なります。',
  2, 12, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サービスダウン・データ損失レベルで即時対応が必要', true, 1),
    (gen_random_uuid(), q_id, '主要機能に影響があるが回避策が存在する', false, 2),
    (gen_random_uuid(), q_id, '改善すべきだが緊急ではない', false, 3),
    (gen_random_uuid(), q_id, '余裕があれば対応する程度のUI改善', false, 4);

  -- T3-Q3 (medium): イシューとPRの連携
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'PRの説明文に「Closes #123」と記述する目的はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'GitHubでPRに「Closes #123」を記述すると、PRがマージされた時点でイシュー#123が自動的にクローズされます。これによりイシューとPRの対応関係が明確になり、作業の追跡が容易になります。',
  2, 13, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'PRマージ時にイシュー#123を自動クローズし、対応関係を明確にする', true, 1),
    (gen_random_uuid(), q_id, 'イシュー#123のコメント欄にPRリンクを自動投稿する', false, 2),
    (gen_random_uuid(), q_id, 'イシュー#123の担当者をPR作成者に変更する', false, 3),
    (gen_random_uuid(), q_id, 'イシュー#123に関連するコードを自動テストする', false, 4);

  -- T3-Q4 (hard): 曖昧な受入条件
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'イシューの受入条件が「ユーザー一覧の表示を修正する」のように曖昧な場合、最初に取るべきアクションはどれですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  '曖昧な受入条件で作業を進めると、完了後に「想定と違う」として手戻りが発生する可能性が高いです。作業開始前に依頼者に「何が壊れているか」「どうなれば完了か」を確認し、具体的な条件を合意すべきです。',
  3, 14, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '依頼者に具体的な完了条件を確認してから作業を開始する', true, 1),
    (gen_random_uuid(), q_id, '自分の判断で修正して完了報告する', false, 2),
    (gen_random_uuid(), q_id, 'ラベルを参考にして作業範囲を推測する', false, 3),
    (gen_random_uuid(), q_id, 'とりあえず着手して途中で確認する', false, 4);

  -- T3-Q5 (medium): スコープの読み取り
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'イシューの作業スコープを判断するために最も重要な情報はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '受入条件（Acceptance Criteria）が作業スコープの境界を定義します。タイトルは概要を示すだけで詳細は不十分であり、ラベルは分類用です。受入条件に記載されていない追加機能は別イシューで対応すべきです。',
  2, 15, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '受入条件（何をもって完了とするかの具体的な条件）', true, 1),
    (gen_random_uuid(), q_id, 'イシューのタイトル', false, 2),
    (gen_random_uuid(), q_id, '担当者のコメント', false, 3),
    (gen_random_uuid(), q_id, 'マイルストーンの期日', false, 4);

  -- ============================================================
  -- Topic 4: 環境と設定 (DEV-CWF-04) — 5 questions
  -- ============================================================

  -- T4-Q1 (easy): 環境分離の目的
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '開発環境・ステージング環境・本番環境を分離する最も重要な理由はどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  '環境を分離することで、テスト中の変更やテストデータが本番サービスとユーザーのデータに影響を与えることを防ぎます。開発環境ではテストデータを自由に操作し、本番環境では実データを安全に保護します。',
  1, 16, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本番データとサービスをテストの影響から保護するため', true, 1),
    (gen_random_uuid(), q_id, 'サーバーの負荷を分散するため', false, 2),
    (gen_random_uuid(), q_id, 'チームメンバーごとに専用環境を提供するため', false, 3),
    (gen_random_uuid(), q_id, 'コードのバージョン管理を簡略化するため', false, 4);

  -- T4-Q2 (medium): .envファイルの管理
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '.envファイルをGitリポジトリにコミットすべきでない理由はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '.envファイルにはデータベースパスワード、APIキーなどの秘密情報が含まれることが多いです。Gitにコミットすると履歴に永続的に残り、リポジトリにアクセスできる全員に秘密情報が露出します。.gitignoreに追加して管理対象外にすべきです。',
  2, 17, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '秘密情報（パスワード、APIキー）がGit履歴に残り、全員に露出するため', true, 1),
    (gen_random_uuid(), q_id, '.envファイルはGitが処理できないフォーマットだから', false, 2),
    (gen_random_uuid(), q_id, 'ファイルサイズが大きくリポジトリを圧迫するから', false, 3),
    (gen_random_uuid(), q_id, '環境ごとに.envの内容が同じで重複するから', false, 4);

  -- T4-Q3 (medium): 設定の優先順位
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '設定ファイルにPORT=3000、環境変数にPORT=8080が設定されている場合、アプリケーションが使用するポートはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '一般的に設定の優先順位は、コマンドライン引数 > 環境変数 > .envファイル > 設定ファイル > コードのデフォルト値です。環境変数は設定ファイルより優先されるため、8080が使用されます。',
  2, 18, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8080（環境変数が設定ファイルより優先される）', true, 1),
    (gen_random_uuid(), q_id, '3000（設定ファイルが環境変数より優先される）', false, 2),
    (gen_random_uuid(), q_id, 'エラーで起動しない（設定の競合）', false, 3),
    (gen_random_uuid(), q_id, 'どちらが使用されるかは実行環境による', false, 4);

  -- T4-Q4 (hard): 環境差異のトラブルシューティング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'ローカル環境では正常に動作するがステージング環境でエラーが発生する場合、最初に確認すべきことはどれですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  '環境差異による問題の多くは環境変数の設定漏れが原因です。ローカルの.envに設定した変数が、ステージング環境のプラットフォーム（クラウド設定画面等）に登録されていないケースが頻繁に発生します。',
  3, 19, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '環境変数がステージング環境のプラットフォームに正しく設定されているか', true, 1),
    (gen_random_uuid(), q_id, 'ステージング環境のCPUとメモリが十分か', false, 2),
    (gen_random_uuid(), q_id, 'ローカルとステージングのOSバージョンが一致しているか', false, 3),
    (gen_random_uuid(), q_id, 'ステージング環境のネットワーク帯域幅が十分か', false, 4);

  -- T4-Q5 (medium): 本番環境のログレベル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '本番環境のログレベルをdebugに設定した場合のリスクはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'debugレベルでは詳細な内部情報がログに記録されます。本番環境ではユーザーの個人情報やセッションID等がログに出力される可能性があり、セキュリティインシデントにつながります。本番ではerrorまたはwarnレベルが適切です。',
  2, 20, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ユーザーの個人情報等がログに出力され、セキュリティインシデントにつながる', true, 1),
    (gen_random_uuid(), q_id, 'ログファイルのサイズが大きくなりディスクが不足する', false, 2),
    (gen_random_uuid(), q_id, 'アプリケーションの処理速度が大幅に低下する', false, 3),
    (gen_random_uuid(), q_id, 'ログの出力でデータベース接続数が増加する', false, 4);

  -- ============================================================
  -- Topic 5: APIリクエストとレスポンス (DEV-CWF-05) — 5 questions
  -- ============================================================

  -- T5-Q1 (easy): HTTPメソッドの使い分け
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '新しいユーザーを作成するAPIリクエストに使用すべきHTTPメソッドはどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  'POST（新規リソース作成）、GET（取得）、PUT（全体更新）、DELETE（削除）がRESTfulの基本です。新規作成にはPOSTを使用し、リクエストボディにユーザー情報を含めます。',
  1, 21, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'POST', true, 1),
    (gen_random_uuid(), q_id, 'GET', false, 2),
    (gen_random_uuid(), q_id, 'PUT', false, 3),
    (gen_random_uuid(), q_id, 'DELETE', false, 4);

  -- T5-Q2 (medium): 401と403の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'APIリクエストで401 Unauthorizedが返された場合の意味はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '401は認証（Authentication）の失敗を示します。トークンの未送信、期限切れ、無効なトークン等が原因です。403 Forbiddenは認証済みだが権限不足（Authorization）を示します。この2つは混同しやすいですが対処が異なります。',
  2, 22, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '認証が必要だがトークンが未送信・無効・期限切れである', true, 1),
    (gen_random_uuid(), q_id, '認証済みだがリソースへのアクセス権限がない', false, 2),
    (gen_random_uuid(), q_id, '要求したリソースが存在しない', false, 3),
    (gen_random_uuid(), q_id, 'リクエストの形式が不正である', false, 4);

  -- T5-Q3 (medium): ステータスコードの分類
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'APIレスポンスで500 Internal Server Errorが返された場合、クライアント側で行うべきことはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '5xxエラーはサーバー側の問題を示します。クライアント側のリクエストを修正しても解決しません。サーバーチームへの報告やサーバーログの確認が必要です。4xxエラー（クライアント側の問題）とは対処方法が根本的に異なります。',
  2, 23, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバー側の問題のため、サーバーチームに報告する', true, 1),
    (gen_random_uuid(), q_id, 'リクエストのパラメータを修正して再送する', false, 2),
    (gen_random_uuid(), q_id, '認証トークンを更新して再リクエストする', false, 3),
    (gen_random_uuid(), q_id, 'リクエストボディのJSONフォーマットを確認する', false, 4);

  -- T5-Q4 (hard): 422ステータスコード
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'APIリクエストで422 Unprocessable Entityが返された場合の意味はどれですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  '422はリクエストのフォーマットは正しい（JSONとして有効）が、含まれるデータがバリデーションルールに違反していることを示します。例えばメールアドレスの形式が不正、必須フィールドの値が空文字などです。400 Bad Requestとは「フォーマット自体は正しいがデータが不正」という点で区別されます。',
  3, 24, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエストの形式は正しいが、データがバリデーションルールに違反している', true, 1),
    (gen_random_uuid(), q_id, 'リクエストのJSON形式が不正で解析できない', false, 2),
    (gen_random_uuid(), q_id, 'サーバーの処理能力を超えたリクエストが送信された', false, 3),
    (gen_random_uuid(), q_id, 'リクエスト先のエンドポイントが存在しない', false, 4);

  -- T5-Q5 (medium): Content-Type
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'JSON形式のデータをAPIに送信する際に設定すべきHTTPヘッダーはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'Content-Typeヘッダーはリクエストボディのデータ形式をサーバーに伝えます。JSON送信時はapplication/jsonを指定します。Content-Typeの不一致はサーバーがデータを正しく解析できない原因になります。',
  2, 25, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Content-Type: application/json', true, 1),
    (gen_random_uuid(), q_id, 'Accept: application/json', false, 2),
    (gen_random_uuid(), q_id, 'Authorization: application/json', false, 3),
    (gen_random_uuid(), q_id, 'Content-Length: application/json', false, 4);

  -- ============================================================
  -- Topic 6: コードレビュー (DEV-CWF-06) — 5 questions
  -- ============================================================

  -- T6-Q1 (easy): コードレビューの観点
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'コードレビューで確認すべき5つの観点に含まれないものはどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  'コードレビューの5つの観点は、正確性（ロジックが仕様通りか）、可読性（命名・構造の明確さ）、保守性（重複・適切な粒度）、セキュリティ（入力検証・脆弱性）、パフォーマンス（不要なループ・N+1）です。UIデザインの美しさはコードレビューの対象外です。',
  1, 26, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'UIデザインの美しさ', true, 1),
    (gen_random_uuid(), q_id, '正確性（ロジックが仕様通りか）', false, 2),
    (gen_random_uuid(), q_id, 'セキュリティ（入力検証、脆弱性）', false, 3),
    (gen_random_uuid(), q_id, 'パフォーマンス（不要なループ、N+1）', false, 4);

  -- T6-Q2 (medium): 建設的なコメント
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '建設的なレビューコメントに含まれるべき要素はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '建設的なコメントには「何が問題か（事実）」「なぜ問題か（理由）」「どう改善するか（提案）」の3要素が必要です。「ここが間違っている。直して。」では何をどう直すべきか分からず、対処が遅れます。',
  2, 27, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '何が問題か・なぜ問題か・どう改善するか', true, 1),
    (gen_random_uuid(), q_id, 'エラーの発生箇所のみ', false, 2),
    (gen_random_uuid(), q_id, '修正後の完全なコード', false, 3),
    (gen_random_uuid(), q_id, '問題の緊急度のみ', false, 4);

  -- T6-Q3 (medium): [must]と[nit]の区別
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'レビューコメントの[must]と[nit]の違いとして正しいものはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '[must]は修正が必須の指摘（バグ、セキュリティ問題等）、[nit]は軽微な提案（命名改善、フォーマット等）で修正しなくてもApproveできます。この区別がないと全ての指摘が同じ重要度に見え、レビュー対応の優先順位が付けられません。',
  2, 28, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[must]は修正必須の問題、[nit]は修正しなくてもApprove可能な軽微な提案', true, 1),
    (gen_random_uuid(), q_id, '[must]は現在のPRで対応、[nit]は次のPRで対応', false, 2),
    (gen_random_uuid(), q_id, '[must]はバグのみ、[nit]はバグ以外の全て', false, 3),
    (gen_random_uuid(), q_id, '[must]はシニアの指摘、[nit]はジュニアの指摘', false, 4);

  -- T6-Q4 (hard): フィードバックへの対応
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'レビューで自分のコードに対する指摘を受けた際の対応として最も不適切なものはどれですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  'レビュー指摘を無視してそのままマージすることは最も不適切です。全ての指摘に返信し対応する（修正する、理由を説明して議論する）ことがレビュープロセスの基本です。指摘を個人攻撃と捉えず、コードの改善として受け止めるべきです。',
  3, 29, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '指摘を無視してそのままマージする', true, 1),
    (gen_random_uuid(), q_id, '指摘の理由が分からない場合に質問する', false, 2),
    (gen_random_uuid(), q_id, '意見が異なる場合に理由を添えて議論する', false, 3),
    (gen_random_uuid(), q_id, '指摘をコードの改善として受け止める', false, 4);

  -- T6-Q5 (hard): レビューの責務
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'PRの説明文に変更の背景や目的が記載されていない場合、レビュアーにとっての問題はどれですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  '背景情報がないと、レビュアーは「なぜこの変更が必要か」を理解できず、設計判断の妥当性を評価できません。コードの正確性は確認できても、そもそもの方向性が正しいかを判断する材料がなく、表面的なレビューにとどまります。',
  3, 30, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変更の意図が分からず、設計判断の妥当性を評価できない', true, 1),
    (gen_random_uuid(), q_id, 'コードの文法エラーを見つけられない', false, 2),
    (gen_random_uuid(), q_id, 'レビューの所要時間が短くなりすぎる', false, 3),
    (gen_random_uuid(), q_id, 'PRがマージできなくなる', false, 4);

  -- ============================================================
  -- Topic 7: ドキュメントの読み方 (DEV-CWF-07) — 5 questions
  -- ============================================================

  -- T7-Q1 (easy): ドキュメントの種類
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'APIのエンドポイント仕様やパラメータ、レスポンス形式を確認する場合に参照すべきドキュメントはどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  'APIリファレンスはエンドポイントの仕様（パス、パラメータ、レスポンス形式）を体系的に記載したドキュメントです。SwaggerやOpenAPIで生成されることが多く、コードと同期して最新の状態を保ちます。',
  1, 31, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'APIリファレンス（Swagger/OpenAPI等）', true, 1),
    (gen_random_uuid(), q_id, 'README', false, 2),
    (gen_random_uuid(), q_id, 'チュートリアル', false, 3),
    (gen_random_uuid(), q_id, 'CHANGELOG', false, 4);

  -- T7-Q2 (medium): バージョン確認の重要性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '技術ドキュメントを読む際にバージョンを確認すべき理由はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'ライブラリやフレームワークはバージョンごとにAPIが変わることがあります。古いバージョンのドキュメントを参照すると、現在は廃止されたAPIを使用したり、新しい推奨APIを見逃す可能性があります。',
  2, 32, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バージョンごとにAPIが変わり、廃止されたAPIを使用する恐れがあるため', true, 1),
    (gen_random_uuid(), q_id, 'バージョンが古いドキュメントは文章の品質が低いため', false, 2),
    (gen_random_uuid(), q_id, 'ドキュメントのライセンスがバージョンごとに異なるため', false, 3),
    (gen_random_uuid(), q_id, '新しいバージョンのドキュメントは読み込み速度が速いため', false, 4);

  -- T7-Q3 (medium): 効率的な読み方
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '初めて使うライブラリのドキュメントを効率的に読む方法として最も適切なものはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '効率的な読み方は、まず目次で全体構造を把握し、必要なセクションに直接移動することです。コード例を先に見てから説明文を読むと理解が早くなります。ドキュメントを最初から最後まで通読するのは非効率です。',
  2, 33, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '目次で構造を把握し、必要なセクションのコード例を先に確認する', true, 1),
    (gen_random_uuid(), q_id, 'ドキュメントを最初から最後まで通読する', false, 2),
    (gen_random_uuid(), q_id, 'StackOverflowの回答のみを参照する', false, 3),
    (gen_random_uuid(), q_id, 'ChatGPTに全文を入力して要約させる', false, 4);

  -- T7-Q4 (hard): ドキュメントが古い場合の対処
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  'ドキュメントの記述が古く、現在のコードと一致しない場合に最も信頼すべき情報源はどれですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  '最も正確な「ドキュメント」はソースコード自体です。コードは常に現在の動作を正確に反映しています。Gitのコミット履歴やPRを確認すれば変更の経緯も把握できます。コミュニティの記事は便利ですが古い情報を含む可能性があります。',
  3, 34, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソースコード（最も正確に現在の動作を反映している）', true, 1),
    (gen_random_uuid(), q_id, '公式ドキュメントの旧バージョン', false, 2),
    (gen_random_uuid(), q_id, 'Stack Overflowの人気回答', false, 3),
    (gen_random_uuid(), q_id, '技術ブログの解説記事', false, 4);

  -- T7-Q5 (easy): 公式vs非公式
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '技術情報のソースとして公式ドキュメントを優先すべき理由はどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  '公式ドキュメントは開発元が管理しており、コードの状態と同期して更新されます。コミュニティの記事やブログは便利ですが、執筆時点の情報であり、古い内容や不正確な情報を含む可能性があります。',
  1, 35, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発元が管理し、コードと同期して更新されるため正確性が高い', true, 1),
    (gen_random_uuid(), q_id, '公式ドキュメントは必ず日本語に翻訳されているため', false, 2),
    (gen_random_uuid(), q_id, '公式ドキュメントは検索エンジンでの表示順位が高いため', false, 3),
    (gen_random_uuid(), q_id, '公式ドキュメントは無料で利用できるため', false, 4);

  -- ============================================================
  -- Topic 8: 納品と報告 (DEV-CWF-08) — 5 questions
  -- ============================================================

  -- T8-Q1 (easy): 完了報告の必須要素
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '作業完了報告に含めるべき5つの要素として不適切なものはどれですか？',
  'multiple_choice', 'easy', 'cwf', 'concept',
  '完了報告の5要素は「何を完了したか」「どう実装したか」「テスト結果」「残課題・制限事項」「参考リンク」です。作業にかかった時間は報告書のフォーマットによっては含めますが、必須の5要素には含まれません。',
  1, 36, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '作業にかかった時間', true, 1),
    (gen_random_uuid(), q_id, '何を完了したか（タスク名・イシュー番号）', false, 2),
    (gen_random_uuid(), q_id, 'テスト結果（検証方法・カバレッジ）', false, 3),
    (gen_random_uuid(), q_id, '残課題・制限事項', false, 4);

  -- T8-Q2 (medium): 進捗報告と完了報告の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '進捗報告で最も重視すべき内容はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  '進捗報告の主目的は計画とのずれやブロッカーの早期検知です。「予定通り」だけでなく、「何が遅れているか」「何で詰まっているか」を共有することで、チームが早期に支援やスケジュール調整を行えます。',
  2, 37, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '計画とのずれやブロッカー（障害要因）の早期共有', true, 1),
    (gen_random_uuid(), q_id, '完了したタスクの技術的な詳細', false, 2),
    (gen_random_uuid(), q_id, '作業時間と生産性の報告', false, 3),
    (gen_random_uuid(), q_id, '次のスプリントの計画提案', false, 4);

  -- T8-Q3 (medium): 引き継ぎ文書
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '引き継ぎ文書に含めるべき情報としてコードからは読み取れないものはどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'コードは「何を」「どう」実装しているかは示しますが、「なぜ技術Xでなく技術Yを選んだか」というアーキテクチャ判断の理由は示しません。後任者がコードを見ても、判断の背景やトレードオフを理解できないため、引き継ぎ文書で明示する必要があります。',
  2, 38, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'なぜ技術Xでなく技術Yを選択したかの設計判断理由', true, 1),
    (gen_random_uuid(), q_id, 'クラス構成とファイルの配置場所', false, 2),
    (gen_random_uuid(), q_id, '使用しているライブラリのバージョン', false, 3),
    (gen_random_uuid(), q_id, '関数のパラメータと戻り値の型', false, 4);

  -- T8-Q4 (hard): 事実と推測の分離
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '完了報告で「テストは全て通過しました。パフォーマンスへの影響は小さいと思います。」と書いた場合の問題は何ですか？',
  'multiple_choice', 'hard', 'cwf', 'concept',
  '「テストは全て通過」は事実ですが、「パフォーマンスへの影響は小さいと思う」は計測データに基づかない推測です。レポートでは事実と推測を明確に分ける必要があります。推測に基づいて判断が行われると、後からパフォーマンス問題が発覚するリスクがあります。',
  3, 39, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '事実（テスト通過）と推測（パフォーマンス影響）が混在し、誤判断のリスクがある', true, 1),
    (gen_random_uuid(), q_id, '文末に「思います」を使うのはビジネス文書として不適切', false, 2),
    (gen_random_uuid(), q_id, 'テスト結果の具体的な数値が記載されていない', false, 3),
    (gen_random_uuid(), q_id, 'パフォーマンスに関する記述が完了報告に含まれるべきではない', false, 4);

  -- T8-Q5 (medium): 不十分な完了報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000007',
  '「ログイン機能を修正しました。レビューお願いします。」という完了報告の問題点はどれですか？',
  'multiple_choice', 'medium', 'cwf', 'concept',
  'この報告には「何を修正したか」の具体的内容、検証方法、副作用の有無、残課題が一切記載されていません。レビュアーは何を確認すべきか分からず、レビューの質が低下します。「ケース不一致のメールアドレスでログイン可能に修正（PR #456）。test@Example.comとtest@example.comで同一ユーザーとして認証される検証済み。」のように具体的に書くべきです。',
  2, 40, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '修正内容の詳細・検証方法・残課題が記載されておらず、何を確認すべきか分からない', true, 1),
    (gen_random_uuid(), q_id, '敬語表現が不十分', false, 2),
    (gen_random_uuid(), q_id, 'レビュー依頼の宛先が指定されていない', false, 3),
    (gen_random_uuid(), q_id, '修正の期日が記載されていない', false, 4);

END $$;
