-- Comprehensive sync: BJ pattern & expression option texts from balanced seed data
-- Overwrites ALL option texts to match the balanced seed file, fixing length bias
BEGIN;

UPDATE quiz_question_options SET option_text = 'ミーティングの日程を変更させていただけますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 1)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ミーティングの日程を変更してくださいますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 1)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ミーティングの日程を変更のほうさせていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 1)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'ミーティングの日程を変更させてもらってよろしいですか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 1)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '資料をご確認してくださいますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 2)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '資料をご確認いただけますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 2)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '資料をお確認いただけますようお願いします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 2)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '資料のご確認をされていただけますか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 2)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '私の考えですが、〜とお考えしております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 3)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '私の意見ですが、〜と考えております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 3)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '私の所見ですが、〜と存じ上げております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 3)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '私の見解ですが、〜とお思いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 3)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '弊社で対応させていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 4)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '弊社にて対応してさしあげます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 4)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '弊社で対応のほういたしますね。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 4)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '弊社が対応をさせてもらいます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 4)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'お知りしておりませんでした。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 5)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ご存じしかねております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 5)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '存じ上げておりません。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 5)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '存じておられませんでした。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 5)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '少々お待ちになられますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 6)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '少々お待ちしていただけますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 6)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '少々お待ちくださいますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 6)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '少々お待ちいただけますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 6)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '了解いたしました。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 7)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'かしこまりました。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 7)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '承知させていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 7)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お受けいたしました。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 7)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'ご面会をさせていただきたく存じます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 8)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お会いさせていただきたく思います。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 8)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'お目にかかりたく存じます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 8)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お目にかからせていただきたいです。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 8)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'この方法で進めさせてもらってよろしいですか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 9)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'この方法で進めてもよろしいでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 9)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'この方法で進めさせていただいてよろしいですか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 9)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'この方法で進行のほうしてもよろしいですか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 9)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '田中がご説明させていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 10)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '田中がご説明いたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 10)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '田中がご説明申し上げます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 10)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '田中がお説明をして差し上げます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000001-0000-0000-0000-000000000001' AND sort_order = 10)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本番環境のシステム障害について報告いたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 1)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本番環境のシステム障害についてご報告されます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 1)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本番環境のシステム障害をお報告申し上げます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 1)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '本番環境のシステム障害について報告してあげます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 1)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'API設計を完了させていただき、結合テストを着手いたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 2)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'API設計が完了し、現在結合テストに着手しております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 2)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'API設計が完了されまして、結合テストに着手されております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 2)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'API設計のほうが完了となり、結合テストを着手中でございます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 2)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '納期に遅延が生じさせていただく可能性がございます。ご報告いたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 3)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '納期に遅延が生じるかもしれません。原因と対策をお報告させていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 3)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '納期に遅延が生じる可能性がございます。原因と対策をご報告いたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 3)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '納期に遅延が生じる見込みでございます。原因と対策を報告してあげます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 3)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本システムは社内の勤怠管理を目的として設計されており、出退勤記録の機能を提供する。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 4)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本システムは社内の勤怠管理を目的として設計いたしましたので、出退勤記録の機能を提供します。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 4)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本システムは社内の勤怠管理を目的としており、出退勤記録の機能を提供させていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 4)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '本システムは社内における勤怠管理を目的に作成されていて、出退勤記録機能があります。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 4)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'テスト項目150件中、おおよそ合格であり、5件ほどが不合格でした。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 5)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'テスト項目150件中、145件が合格、5件が不合格となりました。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 5)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'テスト項目150件の実施結果、145件は問題なく、5件は不合格です。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 5)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'テスト項目150件を実施させていただき、145件合格で5件が不合格です。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 5)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '3月10日14時35分、受注処理において入力データの不備が発生いたしました。注文番号の重複が原因で、番号の再採番にて対応させていただきました。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 6)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '3月10日14時35分、受注処理にて入力データの不備が発生。原因は注文番号の重複であり、番号の再採番にて対応完了。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 6)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '3月10日の14時35分頃に受注処理の入力データに不備が発生されました。注文番号の重複が原因となり、番号を再採番して対応しました。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 6)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '3月10日14時35分、受注処理で入力データの不備が起きてしまいました。注文番号の重複が原因でございまして、番号の再採番にて対応済みです。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 6)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日の決定事項をご報告させていただきます。①認証方式はOAuth2.0に決定されました。次回までにAPI設計書のドラフトを作成してあげます（田中、3/15）。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 7)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本日の決定事項は以下の通りです。①認証方式はOAuth2.0を採用。次回までにAPI設計書のドラフトを作成いたします（担当：田中、期限：3/15）。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 7)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本日の決定事項は以下となります。①認証方式はOAuth2.0を採用させていただきます。次回までにAPI設計書のドラフトを作成します（担当：田中、3/15）。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 7)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '本日決定されました事項は以下でございます。①認証方式はOAuth2.0になります。次回までにAPI設計書のドラフトを作成する予定です（田中、期限3/15）。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 7)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '変更内容：出張申請書に承認欄を追加させていただきます。理由：承認フローの明確化に必要でございます。影響範囲：出張申請等。対応日：3月20日。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 8)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '変更内容：出張申請書に承認欄を追加。変更理由：承認フローの明確化に必要。影響範囲：出張申請・経費精算フォーム。対応予定日：3月20日。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 8)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '変更内容：出張申請書への承認欄追加。変更理由：承認フローの明確化のため。影響範囲：出張申請や経費精算フォームになります。対応日：3月20日。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 8)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '変更をさせていただく内容：出張申請書に承認欄を追加。理由：承認フロー明確化に必要。影響：出張申請・経費精算フォーム。予定日：3月20日。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 8)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '手順1: 社内システムにログインいたします。手順2: 勤怠管理メニューから出退勤一覧を選択いたします。手順3: 対象日を選択し、「申請」をクリックいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 9)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '手順1: 社内システムにログインしてください。手順2: 勤怠管理メニューから出退勤一覧をお選びください。手順3: 対象日を選択して、「申請」を押してください。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 9)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '手順1: 社内システムにログインする。手順2: 勤怠管理メニューから出退勤一覧を選択する。手順3: 対象日を選択し、「申請」をクリックする。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 9)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '手順1: 社内システムにログインされる。手順2: 勤怠管理メニューより出退勤一覧をご選択される。手順3: 対象日を選択し、「申請」をクリックされる。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 9)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '指摘事項：経費精算の承認漏れがございます。理由：月末処理で未承認の申請が残り、決算に影響するかもしれません。改善案：二重チェック体制を導入させていただき、承認漏れを防止する。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 10)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '指摘事項：経費精算の承認漏れ。指摘理由：月末処理で未承認の申請が残り、決算に影響する可能性がある。改善案：二重チェック体制を導入し、承認漏れを防止する。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 10)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '指摘させていただく事項：経費精算の承認漏れです。理由：月末処理で未承認の申請が残った場合、決算に影響いたします。改善案：二重チェック体制を導入し、承認漏れを防止いたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 10)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '指摘事項：経費精算の承認漏れについて。指摘理由：月末処理で未承認の申請が残り、決算に影響される可能性がございます。改善案：二重チェック体制にて承認漏れを防止。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000002-0000-0000-0000-000000000002' AND sort_order = 10)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '突然のご連絡失礼いたします。株式会社ABCシステムの金と申します。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 1)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'いつもお世話になっております。株式会社ABCシステムの金と申します。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 1)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '初めてご連絡させていただきます。ABCシステムの金でございます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 1)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お忙しいところ失礼します。株式会社ABCシステムの金と言います。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 1)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'お疲れ様でございます。受注管理システムプロジェクトの進捗状況につきまして、ご報告させていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 2)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'いつもお世話になっております。受注管理システムプロジェクトの進捗状況につきまして、ご報告いたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 2)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'いつもお世話になっております。受注管理システムプロジェクトの進捗状況について、報告してさしあげます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 2)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '平素よりお世話になっております。受注管理システムプロジェクトの進捗について、ご報告されていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 2)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'この度はシステム障害の件でご迷惑をおかけしまして、深くお詫びいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 3)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'この度はシステム障害の件でご迷惑をおかけし、誠に申し訳ございません。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 3)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'この度はシステム障害の件でご迷惑をおかけされ、大変申し訳ございません。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 3)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'この度のシステム障害でご不便をおかけしまして、お詫び申させていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 3)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '下記日程でご都合のよい日時をお知らせしてくださいませんか。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 4)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '下記日程でご都合のよい日時をお知らせいただけますでしょうか。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 4)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '下記日程でご都合をお聞かせいただけますと幸いでございます。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 4)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '下記日程でお都合のよい日時をお教えいただけますでしょうか。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 4)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '先日はお忙しい中、お時間をいただきありがとうございました。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 5)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '先日はお忙しい中、お時間を頂戴してくださりありがとうございます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 5)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '先日はご多忙の中、お時間をいただけまして感謝申させていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 5)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '先日はお忙しいところ、お時間を取らせてしまいありがとうございます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 5)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '先日お送りした設計書について、ご確認のほうされましたでしょうか。修正点がございましたら、今週中にご連絡くださいますと幸いです。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 6)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '先日お送りいたしました設計書について、ご確認いただけましたでしょうか。修正点がありましたら、今週中にお知らせしてくださいませんか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 6)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '先日お送りした設計書について、ご確認いただけましたでしょうか。修正点がございましたら、今週中にご連絡いただけますと幸いです。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 6)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '先日お送りさせていただいた設計書について、確認いただけたでしょうか。修正点がございましたら、今週中にご連絡いただけると幸いです。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 6)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'ご不明な点がございましたら、お気軽にお申し付けしてください。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 7)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ご不明な点がおありでしたら、遠慮なくご質問してくださいませ。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 7)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ご不明な点がございましたら、お気軽にお問い合わせください。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 7)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'ご不明な点がございましたら、お気軽にご連絡のほどお願いします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 7)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '3月15日に有給休暇を取得いたしたく、ご連絡させていただきます。当日の対応事項は佐藤さんにお引き継ぎ済みです。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 8)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '3月15日に有給休暇を取得させていただきたく、ご連絡いたします。当日の対応事項は佐藤さんに引き継ぎ済みです。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 8)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '3月15日に有給休暇を取らせてもらいたく存じます。当日の対応事項につきましては佐藤さんに引き継ぎしております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 8)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '3月15日に有給休暇をいただきたく、ご報告させていただきます。当日の対応事項を佐藤さんへ引き継ぎ済みです。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 8)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'お疲れ様です。フレームワークのセキュリティアップデートに関する情報をご共有させていただきます。ご確認お願いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 9)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お疲れ様です。フレームワークのセキュリティアップデートに関する情報を共有いたします。ご確認のほどよろしくお願いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 9)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'お疲れ様でございます。フレームワークのセキュリティアップデートの情報を共有してさしあげます。ご確認よろしくお願いします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 9)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お疲れ様です。フレームワークのセキュリティアップデートに関しまして、情報をお知らせいたします。ご確認をお願い申し上げます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 9)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'お忙しいところ恐縮でございますが、添付資料をご確認してくださいますようお願いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 10)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ご多忙のところ申し訳ございませんが、添付資料のご確認をしていただけますと幸いでございます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 10)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'お忙しいところ恐れ入りますが、添付資料のご確認のほどよろしくお願いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 10)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お忙しいところ恐れ入りますが、添付資料の確認のほうをよろしくお願いさせていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 10)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'ご返信が遅れまして、誠に失礼させていただきました。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 11)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ご返信が遅くなり、大変申し訳ございません。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 11)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'お返事が遅くなられまして、大変申し訳ございません。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 11)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'ご返信のほうが遅くなりまして、申し訳なく存じます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 11)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'CCにて部長の田中にもご共有してくださっております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 12)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'CCにて部長の田中にも共有のほうさせてもらっています。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 12)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'CCにて部長の田中にも共有させていただいております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 12)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'CCにて部長の田中様にも情報を共有いたしております。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 12)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '添付ファイルにてお送りさせていただきますので、ご査収してくださいますようお願いします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 13)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '添付ファイルにてお送りいたしますので、ご査収のほどよろしくお願いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 13)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '添付ファイルにてお送りいたしますので、ご査収のほうをよろしくお願い申し上げます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 13)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '添付ファイルにてお送りいたしますので、お目通しいただけますようお願いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 13)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'お手すきの際に、資料の確認をしてくださいますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 14)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お手すきの際に、資料の確認をお願いできますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 14)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'お手すきの際に、資料の確認をさせていただけますでしょうか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 14)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'ご都合のよい際に、資料の確認をお願いしてよろしいですか。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 14)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '今後ともご指導ご鞭撻のほどお願いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 15)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '今後とも何卒よろしくお願いさせていただきます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 15)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '今後とも何卒よろしくお願い申し上げます。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 15)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '今後とも変わらぬお引き立てのほどお願いいたします。'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b2000003-0000-0000-0000-000000000003' AND sort_order = 15)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日のアジェンダですが、画面共有させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 1)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '前回の議事録について、修正点をお伝えいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 1)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本日の進捗状況につきまして、詳しくご報告申し上げます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 1)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '皆様のご意見を伺いたく、お時間をいただきました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 1)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本件につきまして、ご確認をお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 2)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '私の意見を申し上げてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 2)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '先ほどの議題に関して、補足がございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 2)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、資料の訂正をお願いします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 2)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '次の議題に移らせていただいてよろしいですか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 3)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本件の結論をまとめさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 3)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'この点について補足させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 3)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '皆様のご意見を確認させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 3)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日の決定事項を改めて共有させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 4)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ここまでの内容を整理させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 4)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '次回までの宿題事項を確認いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 4)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '各担当者の作業状況をお聞かせください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 4)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日の議事録は後日メールにてお送りいたしますので、ご確認のほどよろしくお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 5)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '次回の打ち合わせ日程につきましては、改めてメールにてご連絡させていただきますので'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 5)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本日の会議は以上とさせていただきます。お忙しい中ご参加いただきありがとうございました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 5)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '残りの議題に関しましては、お手数ですが各自でご確認いただけますようお願い申し上げます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 5)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本件について補足させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 6)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '一点確認させていただきたいのですが'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 6)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '別の議題をご提案させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 6)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '先ほどの件は承知いたしましたので'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 6)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、別の観点からぜひご提案させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 7)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'おっしゃる通りだと思います。その方向で進めさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 7)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本件につきましては、早急に社内にて改めて検討させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 7)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'ご提案の内容を踏まえて、議事録にまとめさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 7)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'おっしゃる通りかと存じます。ぜひその方向で進めさせていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 8)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本件につきましては、一度社内に持ち帰らせていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 8)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ご提案の趣旨は理解いたしました。詳細を改めて確認させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 8)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、別の観点からご提案させていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 8)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日の決定事項を改めて確認いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 9)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '議事録は後ほど共有させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 9)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '次回の会議日程を調整させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 9)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '各担当者のタスクを整理させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 9)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'ここまでの内容を改めて整理させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 10)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '皆様のご意見をぜひ伺いたいと存じますが'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 10)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'それでは、次の議題に移らせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 10)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '本日の会議は以上とさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 10)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '会議室の予約が完了いたしましたので改めてご連絡いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 11)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ご都合のよろしい日時をお知らせいただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 11)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '前回の打ち合わせ内容を踏まえてご報告いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 11)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '日程変更のご連絡をいただきありがとうございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 11)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日の議題について補足がございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 12)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '先ほどの件で一点ご報告がございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 12)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '確認させていただきたい点がございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 12)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '次の議題に移らせていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 12)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '先ほどの決定事項について、一点補足させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 13)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '一つご提案がございますが、ご検討いただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 13)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本件の進捗につきまして、改めて詳しくご報告させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 13)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '前回のご指摘を踏まえまして、内容を修正いたしました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 13)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、優先順位をご確認いただけますか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 14)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お手数ですが、詳細な仕様書をいただけますか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 14)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '承知いたしました。金曜日までに対応いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 14)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '申し訳ございませんが、現在対応が難しい状況です'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 14)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'ここまでの決定事項を確認させていただきます。なお、議事録は後日メールにてお送りいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 15)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お時間が迫っておりますので、残りの議題は次回に持ち越させていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 15)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本日の会議は以上でございます。皆様、お忙しい中ご参加いただき誠にありがとうございました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 15)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '次回の日程につきましては、改めてメールにてご連絡させていただきますのでご確認ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 15)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '〇〇さん、先ほどの資料について補足をお願いします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 16)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '〇〇さん、次回までの進捗状況をぜひご報告ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 16)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '〇〇さん、この件について何かご意見はございますか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 16)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '〇〇さん、本件のスケジュールをご確認ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 16)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '画面共有の準備ができましたので、こちらの資料をご覧いただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 17)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、音声が途切れておりましたので、もう一度お願いできますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 17)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ネットワークの接続状況を確認いたしますので、少々お待ちいただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 17)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'チャット機能にて補足資料を共有させていただきますので、ぜひご確認をお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 17)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '次回の打ち合わせ日程を改めて調整いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 18)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本日の決定事項を確認させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 18)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '議事録を後ほど共有させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 18)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '各自のタスク期限をご報告ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 18)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日の議題につきまして、早速ご報告させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 19)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '先日いただいたご質問に対して、回答を準備いたしました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 19)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '画面を共有させていただきます。資料の3ページをご覧ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 19)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '前回の打ち合わせ内容を踏まえまして、修正案を作成いたしました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 19)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日の議事録は後日メールにてお送りさせていただきますので、ご確認ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 20)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '次回の打ち合わせは来週水曜日を予定しておりますが、ご都合いかがでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 20)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本日の決定事項を踏まえまして、各担当者はタスクの対応をお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 20)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お忙しい中ご参加いただきありがとうございました。引き続きよろしくお願いします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000001-0000-0000-0000-000000000001' AND sort_order = 20)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日はお時間をいただき、誠にありがとうございます。株式会社〇〇の△△と申します'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 1)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '弊社の新サービスについてご説明させていただきたく、本日お時間を頂戴いたしました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 1)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '先日ご依頼いただきました件につきまして、本日お見積書を持参させていただきました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 1)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '御社のプロジェクトにつきまして、現在の進捗状況を詳しくご報告させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 1)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、その内容につきましては対応が難しい状況でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 2)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ご要望を承りました。社内で検討の上、改めてご回答させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 2)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本件につきましては、担当者から改めて折り返しご連絡させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 2)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'ご提案の趣旨は理解いたしました。早急に代替案をご用意いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 2)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '進捗状況についてご報告がございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 3)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '納期についてご相談がございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 3)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '仕様変更について確認させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 3)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '追加費用のお見積もりを提出いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 3)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '現時点での進捗状況をご報告いたします。全体の80%が完了しており、残りの作業につきましても予定通り進めてまいります'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 4)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '大変申し訳ございませんが、当初の納期より3日ほど遅れる見込みでございます。リカバリー策として増員を実施いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 4)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '仕様変更について承知いたしました。影響範囲を詳細に調査の上、追加工数のお見積もりを早急にご提出させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 4)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'テスト結果についてご報告いたします。全テストケース200件中、198件が合格しており大変順調に推移しております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 4)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '納期につきましてご相談がございます。一部機能の仕様変更に伴い、スケジュールの見直しが必要です'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 5)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '現時点での進捗状況をご報告いたします。全体の70%が完了しており、予定通りに進んでおります'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 5)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '追加機能のご要望について承知いたしました。工数とスケジュールへの影響を確認させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 5)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'テスト工程に入りましたので、万が一不具合が見つかった場合は速やかにご報告させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 5)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'ご要望いただきました機能につきましては、現在の技術スタックでは実装が困難でございますので代替案をご提示いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 6)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '大変申し訳ございませんが、当初のスケジュールより遅延が発生する見込みでございます。具体的な対策をご説明いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 6)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '仕様変更について承知いたしました。影響範囲を調査の上、工数とスケジュールへの影響をお見積もりさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 6)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'テスト完了後の結果につきまして詳細にご報告いたします。全体として品質基準を十分に満たしている状況でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 6)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '仕様変更に伴う追加費用について、影響範囲を整理いたしましたので、詳細をご説明させていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 7)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お見積書を作成いたしましたので、ご確認いただけますでしょうか。ご不明な点がございましたら、お気軽にお問い合わせください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 7)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '納品スケジュールにつきまして、段階的なリリース計画を詳細に作成いたしましたので、ご検討いただけますと大変幸いでございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 7)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '先日ご依頼いただきました要件定義書を作成いたしました。内容にお気づきの点がございましたら何なりとご指摘くださいませ'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 7)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本件につきましては、仕様書に記載の通りの動作となっておりますので、ご確認をお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 8)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '再現手順をお教えいただけますでしょうか。開発環境にて事象の確認を進めさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 8)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ご不便をおかけして大変申し訳ございません。早急に原因を調査し、対応させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 8)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '次回のリリースにて改修対応を予定しておりますので、今しばらくお待ちいただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 8)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '設計書の変更点につきまして、ご報告させていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 9)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '要件について認識に相違がないか確認させていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 9)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'テスト計画書を作成いたしましたので、ご確認いただけますか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 9)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '開発スケジュールの見直しにつきまして、ご提案がございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 9)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'セキュリティの観点から、現在の実装方針について一点確認させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 10)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'パフォーマンス改善のために、インフラ構成の見直しを検討しております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 10)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ユーザビリティの観点から、一点ご提案させていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 10)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '要件定義書に記載のない仕様につきまして、確認させていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 10)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '開発工程が予定通り完了いたしましたので、次のフェーズへスムーズに進めさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 11)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'テスト結果についてご報告いたします。全テストケース150件中、148件が合格しております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 11)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本番環境へのリリース準備が整いましたので、具体的なリリース日程をご相談させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 11)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '不具合の修正が完了いたしましたので、再テストの結果をぜひご確認いただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 11)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'リリーススケジュールについてご提案させていただきます。段階的なリリースを推奨いたしますが、いかがでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 12)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本番環境での障害対応マニュアルを作成いたしましたので、お手すきの際にぜひご確認いただけますと幸いでございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 12)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '保守運用についての体制を整備いたしました。なお、月次の定例会議を設けさせていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 12)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'テスト完了後の品質レポートを作成いたしましたので、改めて詳細をご説明させていただければ幸いに存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 12)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '先日ご依頼いただきました追加機能について、お見積書を添付いたしましたのでご査収ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 13)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本日はお忙しい中、お打ち合わせのお時間をいただき、誠にありがとうございました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 13)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '次回の打ち合わせにつきましては、来週中に改めて日程を調整させていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 13)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '議事録を添付いたしましたので、内容にご不明な点がございましたらお気軽にご連絡ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 13)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、その件は私の担当外でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 14)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '確認の上、本日中にご回答させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 14)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '社内の技術チームに確認を取らせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 14)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'ご質問いただきありがとうございます。即答は控えます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 14)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'ご報告が遅くなりまして大変申し訳ございません。先日のテスト工程において一部不具合が発見されましたので、修正対応を進めております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 15)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '定期メンテナンスのご案内でございます。来週末にサーバーの更新作業を実施いたしますので、一時的にサービスが停止する予定でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 15)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '緊急のご連絡でございます。現在、受注管理システムにおいて障害が発生しております。現在、原因の特定と復旧に全力で取り組んでおります'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 15)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'セキュリティアップデートの適用が完了いたしましたので、ご報告させていただきます。なお、システムへの影響はございませんでした'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 15)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'ご要望の機能につきましては、次期バージョンでの対応を前向きに検討させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 16)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本件の対応に伴いまして、スケジュールと納期の変更が必要となりますがご了承いただけますか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 16)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、こちらの追加機能については別途お見積もりとなりますが、よろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 16)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '技術的な制約もございまして、代替案としてこちらの方法をご提案させていただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 16)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '保守契約の更新時期が近づいてまいりましたので、次年度の契約内容につきましてご相談させていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 17)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '成果物を納品させていただきます。ご確認の上、ご不明な点やご要望がございましたら、お知らせいただけますと幸いです'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 17)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '運用マニュアルを作成いたしましたので、具体的な操作方法について改めて詳しくご説明させていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 17)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'プロジェクトの最終報告書を作成いたしました。つきましては振り返りのミーティングをぜひ設けさせていただけますか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 17)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '先日の障害対応につきまして、原因調査の結果をご報告させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 18)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '保守契約の更新時期が近づいてまいりましたので、ご連絡させていただきました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 18)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '来月のシステムアップデートにつきまして、事前にご確認いただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 18)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '年末年始の運用体制について、ご案内をお送りさせていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 18)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '仕様変更について承知いたしました。影響範囲を調査の上、スケジュールへの影響をお見積もりさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 19)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ご依頼の追加機能につきましては、次期リリースにて対応させていただく方向で前向きに検討させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 19)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本件のお見積もりを作成いたしましたので、ぜひご確認のうえご不明な点がございましたらお気軽にお問い合わせください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 19)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'ご要望の実装は技術的に難しい状況でございますが、代替案としてこちらの方法をご提案させていただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 19)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '保守運用の体制が整いましたので、今後のサポート内容につきまして詳しくご説明させていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 20)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'プロジェクトが無事完了いたしましたことをご報告申し上げます。ご支援いただき、誠にありがとうございました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 20)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '最終的な成果物一式を納品させていただきましたので、ご確認のうえお気づきの点がございましたらご連絡ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 20)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '本プロジェクトの振り返りレポートを作成いたしましたので、次回の打ち合わせにて詳細をご共有いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000002-0000-0000-0000-000000000002' AND sort_order = 20)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'お先に失礼します'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 1)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お疲れ様でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 1)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ご苦労様でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 1)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'いつもお世話になります'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 1)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '報告（ほうこく）'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 2)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '放送（ほうそう）'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 2)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '方法（ほうほう）'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 2)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '訪問（ほうもん）'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 2)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'API実装の件、ご報告いたします。現在、認証機能まで完了しております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 3)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お忙しいところ大変恐れ入りますが、一点ご相談させていただきたく存じます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 3)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '先ほどの件について、補足説明をさせていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 3)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '本件につきましては、改めてメールにてご連絡をさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 3)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '先日の件につきまして、現在の進捗状況をご報告させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 4)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お忙しいところ恐れ入りますが、一点ご教示いただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 4)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '承知いたしました。早急に確認の上、対応させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 4)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '資料のご確認をいただきまして、誠にありがとうございました'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 4)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '資料の差し替えが完了いたしました。修正箇所は3ページ目となっておりますのでご確認ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 5)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '申し訳ございません。私の確認不足により書類に誤りがございました。現在修正対応中でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 5)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ご指摘いただいた箇所の修正が完了いたしましたので、お手数ですが再度ご確認をお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 5)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '本日の作業予定でございますが、見積書の作成と提出資料の整理を優先的に進めてまいります'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 5)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '来週金曜日の打ち合わせにつきまして、議題を事前にお送りさせていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 6)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、来週金曜日にお休みをいただきたく存じますが、よろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 6)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '来週金曜日のスケジュールでございますが、午後から客先への外出をする予定がございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 6)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '来週金曜日までに資料を完成させますので、ご確認のほどよろしくお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 6)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、担当者はただいま外出しております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 7)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '少々お待ちいただけますでしょうか。担当の者に代わります'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 7)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'お電話ありがとうございます。ご用件を改めてお伺いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 7)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '折り返しのお電話をさせていただいてもよろしいですか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 7)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日は少し体調がすぐれないため、在宅勤務に切り替えさせていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 8)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、本日は通院のため午前中お休みをいただきまして、午後から出社させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 8)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '申し訳ございません。電車の遅延により、30分ほど遅れる見込みです。到着後すぐに業務に入ります'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 8)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お疲れ様です。本日の業務予定をお送りいたしますので、ご確認のほどよろしくお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 8)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'お疲れ様です'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 9)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'こんにちは'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 9)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ご苦労様です'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 9)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'どうも'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 9)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '大変お疲れ様でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 10)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'いつもお世話になっております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 10)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ご無沙汰しておりますが'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 10)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '平素より大変お世話になっております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 10)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、現在別件を対応しております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 11)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '申し訳ございませんが、少しお時間をいただけますか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 11)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '承知いたしました。優先的に対応いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 11)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お手数ですが、詳細をメールでお送りください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 11)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、明日の午前中にお休みをいただきたく存じますが、よろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 12)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '申し訳ございませんが、体調がすぐれないため、早退させていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 12)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '本日の残りの作業につきましては、明朝優先的に対応させていただきますので、ご了承ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 12)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'お忙しいところ恐れ入りますが、本日の午後に通院の予定がございますのでご報告します'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 12)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '会議室の空き状況を確認いたしましたので、候補日時をご連絡させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 13)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お手数ですが、来週月曜日の14時から会議室Aの予約をお願いできますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 13)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '来週月曜日の打ち合わせにつきまして、参加者の出欠を事前にぜひご確認いただけますか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 13)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'オンライン会議のURLを発行いたしましたので、招待メールをご確認ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 13)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、修正箇所を赤字でハイライトしております'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 14)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'ご多忙のところ恐縮ですが、本日中にご回答をお願いします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 14)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'お手すきの際に、こちらの資料をご確認いただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 14)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '先日いただいたフィードバックを反映した修正版をお送りいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 14)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '承知いたしました。本日中にAPI開発の作業を完了させまして、明日からはテスト作成に着手いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 15)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '現在、API開発とテスト作成のタスクを抱えておりますが、優先順位についてご指示いただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 15)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、確実に納期に間に合わせるために追加のリソースをいただくことは可能でございましょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 15)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = 'API開発とテスト作成の進捗状況をご報告いたします。現在どちらも50%ほど完了しており順調でございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 15)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '先ほどの件、承知いたしました。早速確認の上、対応いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 16)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '本日の作業報告をさせていただきたいのですが、よろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 16)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'お時間をいただけますでしょうか。ご相談したいことがございます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 16)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、一点だけご確認をお願いできますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 16)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'いただいたご指摘を反映いたしましたので、お手数ですが再度ご確認をお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 17)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'お忙しいところ恐縮ですが、企画書のご確認をお願いできますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 17)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '報告書の修正が完了いたしましたので、お手すきの際にご確認いただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 17)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '見積書の内容が確定いたしましたので、お手すきの際にご承認をお願いいたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 17)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = 'お忙しいところ大変恐縮でございますが、追加でもう一件ご確認をお願いできますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 18)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '丁寧にご確認いただき、ありがとうございます。いただいたフィードバックを反映いたします'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 18)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = 'ご指摘の箇所について確認いたしましたが、意図的にこの表現としておりますのでご了承ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 18)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '社内規定に基づいて修正いたしましたので、再度お送りさせていただきます。ご確認ください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 18)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '本日のタスクは予定通り完了いたしましたので、何かご指示がなければ退社させていただきます'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 19)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = 'バグ修正の対応が残っておりますので、本日残業させていただいてもよろしいでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 19)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '明日の朝一で対応いたしますので、本日の残りのタスクは持ち越しとさせてください'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 19)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '恐れ入りますが、明日の午前中にお打ち合わせのお時間をいただけますでしょうか'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 19)
AND sort_order = 4;

UPDATE quiz_question_options SET option_text = '「連絡」は事実を伝えること、「相談」は意見を求めること'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 20)
AND sort_order = 1;

UPDATE quiz_question_options SET option_text = '「連絡」は結果を報告すること、「相談」は経過を説明すること'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 20)
AND sort_order = 2;

UPDATE quiz_question_options SET option_text = '「連絡」は口頭で行うもので、「相談」は書面で行うもの'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 20)
AND sort_order = 3;

UPDATE quiz_question_options SET option_text = '「連絡」は上司に対して行い、「相談」は同僚に対して行う'
WHERE question_id IN (SELECT id FROM quiz_questions WHERE quiz_id = 'b3000003-0000-0000-0000-000000000003' AND sort_order = 20)
AND sort_order = 4;

COMMIT;
