-- ============================================================
-- Set 3 聴解 3問 コンテンツ型不一致修正
-- 対象: sort_order 6 (課題理解), 12 (ポイント理解), 13 (ポイント理解)
-- 実行環境: ローカル DB (jpjvzlmwzeiyukqqbdit) のみ
-- 作成: 2026-06-29
-- ============================================================

BEGIN;

-- ────────────────────────────────────────────────────────────
-- sort 6 (question_id: 7efd6356-7f5f-4fa3-acf2-83ada5dbf3b4)
-- 旧: ポイント理解スタイル (NPO活動資金)
-- 新: 課題理解 — ITシステム障害、エンジニアが次に何をすべきか
-- ────────────────────────────────────────────────────────────

UPDATE quiz_questions
SET question_text = $Q$社内のシステム部長と担当エンジニアが話しています。

質問：担当エンジニアはこの後、まず何をしなければなりませんか。

部長：本番環境での障害報告が顧客から届いています。現在の復旧見込みはどうですか。
エンジニア：原因はすでに特定できました。設定ファイルの誤りで、修正自体は30分以内に完了できます。ただ、本番への適用は承認フローを経る必要があります。
部長：わかりました。承認フローの前に、まず顧客への一報を入れてください。現状と復旧予定時刻を今すぐ伝えること。
エンジニア：でも、承認を先に取ってから確定的な時刻をお伝えした方がよくないですか。
部長：顧客はまず状況説明を待っています。「原因が特定でき、30分以内に対応可能」と伝えるだけで十分です。その後すぐに承認手続きを進めてください。
エンジニア：承知しました。すぐに顧客へご連絡します。$Q$
WHERE id = '7efd6356-7f5f-4fa3-acf2-83ada5dbf3b4';

-- 選択肢テキスト更新 (sort 6 / opt_sort 1〜4)
UPDATE quiz_question_options SET option_text = $Q$修正内容の承認フローを開始する$Q$
WHERE id = '334f271e-b129-48be-9910-1e014779d70b';  -- opt_sort 1

UPDATE quiz_question_options SET option_text = $Q$顧客に現状と復旧見込みを報告する$Q$
WHERE id = '3308e2a4-e37d-40cb-891e-f8012b37b3c8';  -- opt_sort 2

UPDATE quiz_question_options SET option_text = $Q$設定ファイルの修正作業を完了させる$Q$
WHERE id = 'f8fb8934-3cf3-4d8a-ad52-4dafea6f68dc';  -- opt_sort 3

UPDATE quiz_question_options SET option_text = $Q$障害報告書の作成に取りかかる$Q$
WHERE id = '687405dd-f0d2-4502-a07d-c67af2d7d219';  -- opt_sort 4

-- is_correct 再設定 (uq制約: 全false→正答set の2段階)
UPDATE quiz_question_options SET is_correct = false
WHERE question_id = '7efd6356-7f5f-4fa3-acf2-83ada5dbf3b4';

UPDATE quiz_question_options SET is_correct = true
WHERE id = '3308e2a4-e37d-40cb-891e-f8012b37b3c8';  -- opt_sort 2 が正答


-- ────────────────────────────────────────────────────────────
-- sort 12 (question_id: 633a8c1c-4343-416d-b89d-cd7be3056541)
-- 旧: 概要理解スタイル (CO2削減率 数値読み取り、単一発話者)
-- 新: ポイント理解 — コーポレートガバナンス改革、田中の見解
-- ────────────────────────────────────────────────────────────

UPDATE quiz_questions
SET question_text = $Q$コーポレートガバナンスの改革について、二人が話しています。

質問：田中さんは社外取締役の増員についてどのような問題点があると言っていますか。

田中：今回の取締役会改革案ですが、社外取締役の比率を過半数にする提案には懸念があります。
佐々木：でも、形式的な独立性が確保されるのはよいことではないですか。
田中：社外取締役が増えれば独立性が高まるというのは表面的な見方です。事業への理解が不十分な人材が過半数を占めると、意思決定の質がかえって低下しかねません。
佐々木：外部の視点が不正の抑止になるという面は認めますか。
田中：その点は否定しません。ただ、独立性と専門性のバランスをどう確保するかという議論が抜けています。単に人数を増やすだけでは実効性は担保されません。$Q$
WHERE id = '633a8c1c-4343-416d-b89d-cd7be3056541';

-- 選択肢テキスト更新 (sort 12 / opt_sort 1〜4)
UPDATE quiz_question_options SET option_text = $Q$社外取締役の増員は不正抑止効果がないこと$Q$
WHERE id = '2ec3b390-4466-44da-abc5-8f35a525bacf';  -- opt_sort 1

UPDATE quiz_question_options SET option_text = $Q$社外取締役の選任プロセスに透明性がないこと$Q$
WHERE id = 'e473f481-5264-43b0-96c6-61664fce129b';  -- opt_sort 2

UPDATE quiz_question_options SET option_text = $Q$社外取締役が増えても事業理解が不十分だと意思決定の質が下がること$Q$
WHERE id = 'bcecf0fe-9154-4dd9-9558-37fa93082ca6';  -- opt_sort 3

UPDATE quiz_question_options SET option_text = $Q$独立性を高めるには人数より報酬体系の見直しが重要なこと$Q$
WHERE id = '484d015d-b682-4848-8b22-8af439155207';  -- opt_sort 4

-- is_correct 再設定 (sort 12)
UPDATE quiz_question_options SET is_correct = false
WHERE question_id = '633a8c1c-4343-416d-b89d-cd7be3056541';

UPDATE quiz_question_options SET is_correct = true
WHERE id = 'bcecf0fe-9154-4dd9-9558-37fa93082ca6';  -- opt_sort 3 が正答


-- ────────────────────────────────────────────────────────────
-- sort 13 (question_id: 37b646c9-200d-4e01-9569-0cc74db79f30)
-- 旧: 概要理解スタイル (インフォームドコンセント、単一発話者モノローグ)
-- 新: ポイント理解 — リスキリング施策の課題、山田の見解
-- ────────────────────────────────────────────────────────────

UPDATE quiz_questions
SET question_text = $Q$人事部の担当者二人がリスキリング施策の課題について話しています。

質問：山田さんはリスキリング推進において最も重要な課題は何だと言っていますか。

山田：今期からリスキリング支援を本格的に始めたのですが、参加率がなかなか上がらないんです。
中川：費用の問題ですか。プログラムは無償で提供していますよね。
山田：費用は問題ないんですが、現場のマネージャーが「業務に支障が出る」という理由で、部下の受講を認めないケースが多くて。
中川：管理職の理解を得ることが先決ですね。経営層からトップダウンで指示すれば解決しませんか。
山田：表面的には動くかもしれませんが、マネージャー自身が意義を理解して主体的に促さないと形だけになってしまいます。制度の設計よりも、学習時間を業務の一部として認める文化を根付かせる方が、実はずっと難しい。
中川：確かに、意識改革は時間がかかりますね。$Q$
WHERE id = '37b646c9-200d-4e01-9569-0cc74db79f30';

-- 選択肢テキスト更新 (sort 13 / opt_sort 1〜4)
UPDATE quiz_question_options SET option_text = $Q$リスキリングプログラムの内容が実務と乖離していること$Q$
WHERE id = '070c4550-706a-4686-b428-ff6c7b27852d';  -- opt_sort 1

UPDATE quiz_question_options SET option_text = $Q$受講にかかるコスト負担が大きいこと$Q$
WHERE id = 'ab540a75-106c-4dd4-a538-1cc85c317f78';  -- opt_sort 2

UPDATE quiz_question_options SET option_text = $Q$経営層がリスキリングの優先度を低く見ていること$Q$
WHERE id = 'cbdba737-dc37-4047-ab20-1dba039aa36a';  -- opt_sort 3

UPDATE quiz_question_options SET option_text = $Q$現場マネージャーが学習時間を業務の一部と認めない文化的問題$Q$
WHERE id = '7475b147-da8f-40d5-a27f-a4c43ef0e81a';  -- opt_sort 4

-- is_correct 再設定 (sort 13)
UPDATE quiz_question_options SET is_correct = false
WHERE question_id = '37b646c9-200d-4e01-9569-0cc74db79f30';

UPDATE quiz_question_options SET is_correct = true
WHERE id = '7475b147-da8f-40d5-a27f-a4c43ef0e81a';  -- opt_sort 4 が正答

COMMIT;
