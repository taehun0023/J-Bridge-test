-- 00146_fix_jlpt_reading_quality.sql
-- JLPT Reading Quality Fixes
-- 생성일: 2026-04-05
-- 근거: docs/audit/jlpt_reading_validated.md + jlpt_reading_issues.md
-- Rubric: docs/exam_quality_rubric.md
--
-- 수정 범위 (Validator 결정):
--   P0 Block 1 — CLAIM FIX 6건 (rubric: A2 답안누설, A3 단일정답, B5 길이편향)
--   P0 Block 2 — B8 한국어→일본어 번역 48문항 (quiz_id a0000002, 192 options)
--   P1 Block   — B5 REAL_BIAS 상위 ~60문항 rebalance (ratio ≥ 2.0)
--   P2 Block   — B6 slash 표기 통일 1건 (Q-78e26c1c: 1/3 → 3分の1)
--
-- 수정 정책:
--   1. UPDATE만 사용. DELETE/INSERT 금지. ID/quiz_id/difficulty/category/선택지 수 불변.
--   2. Q-3e99aa2c (N5, NEEDS_HUMAN_REVIEW) 는 보류 — 본 migration 제외.
--   3. UNAVOIDABLE 45건은 수정하지 않음 (콘텐츠 자연스러움 우선).
--   4. B8 번역 시 본문 핵심어와 1:1 매칭을 피해 A2 재발 방지.
--
-- 해소 Rubric 매핑:
--   A2: 답안누설 (질문의 핵심어가 정답 선택지에 그대로 노출)
--   A3: 단일정답 보장
--   B5: 선택지 길이 균등 (목표: 60~130% of mean option length)
--   B6: 표기 통일
--   B8: 선택지 언어 일치 (일본어 본문 → 일본어 선택지)

-- ============================================================
-- P0 Block 1 — CLAIM FIX (6 questions, rubric: A2/A3/B5)
-- ============================================================

-- Q-0a49374b (N5): B5 오답 길이 균등화 (5時→5時00分, 6時→6時00分)
-- Rubric 해소: B5 (length ratio 2.50 → 1.00)
UPDATE quiz_question_options SET option_text = '6時00分' WHERE id = 'e20f0cd1-4253-4ed8-b888-4bb6aa173204';
UPDATE quiz_question_options SET option_text = '5時00分' WHERE id = 'e68344fc-45d2-4105-b2e7-c1546d0ecfba';

-- Q-d52572dc (N5): A3 + B6 — 정답을 "한자표기"가 아닌 "뜻풀이"로 교체
-- Before: 정답 "天気予報" (한자표기) vs 오답 "天気のニュース" 등 (의미서술) → 프레이밍 불일치
-- After:  전 선택지 의미서술형으로 통일, 정답은 "天気の予想" (예보=예상의 의미)
-- Rubric 해소: A3 (단일정답 명확화), B5
UPDATE quiz_question_options SET option_text = '天気のニュース番組' WHERE id = '966b7752-19f8-4a43-9981-ff11270b9342';
UPDATE quiz_question_options SET option_text = '天気の予想' WHERE id = '081a2bc5-dbb4-48bd-b4fb-3ad00718d469';
UPDATE quiz_question_options SET option_text = '気温の記録表' WHERE id = '5de53ef9-c1b7-4df7-995e-fdc7329d3cbb';
UPDATE quiz_question_options SET option_text = '季節の行事予定' WHERE id = '013aae89-5f75-455d-9661-5d4e1388b9cf';

-- Q-b5614289 (N5): A2 답안누설 — 정답 "だめだ"가 본문 "だめです"와 동형
-- Before: 정답 "だめだ" (본문 그대로) → 의미 테스트 실패
-- After:  의미 뜻풀이형으로 교체 "禁止だ"
-- Rubric 해소: A2 (답안누설 제거), B5
UPDATE quiz_question_options SET option_text = 'いいですよ' WHERE id = 'd34de5b9-94a7-4ff3-92d9-bda33258cb1d';
UPDATE quiz_question_options SET option_text = '禁止です' WHERE id = 'f91d4b2e-2495-4569-bf78-6a9526a70879';
UPDATE quiz_question_options SET option_text = '必要です' WHERE id = '1f6c364d-c0b8-4f8b-933e-9f88ce21b292';
UPDATE quiz_question_options SET option_text = 'できます' WHERE id = '2e85a7ae-7921-4017-9277-5a9932dc9e14';

-- Q-4c5311f4 (N2): A2 답안누설 — 정답 "淘汰される"가 본문 그대로
-- Before: 정답 "淘汰される" → 의미 테스트 실패
-- After:  의미 뜻풀이형으로 교체 "競争に負けて排除される"
-- Rubric 해소: A2 (답안누설 제거), B5
UPDATE quiz_question_options SET option_text = '急成長する' WHERE id = 'a44226f9-4f17-4df7-a7a6-d9cbeb2b0ef5';
UPDATE quiz_question_options SET option_text = '競争に負けて排除される' WHERE id = '36657a1e-0f1b-4fd8-b1f3-5bd6fbd37d78';
UPDATE quiz_question_options SET option_text = '他社に吸収合併される' WHERE id = 'e4c16df4-8beb-4972-9dc4-7b68b5638bbc';
UPDATE quiz_question_options SET option_text = '株式市場に上場される' WHERE id = '62bfb16f-ea2c-4764-adb9-3cd0790f6393';

-- Q-ffeb9909 (N1): A2 답안누설 — 정답 "喚起する"가 본문 그대로
-- Before: 정답 "喚起する" → 의미 테스트 실패
-- After:  의미 뜻풀이형으로 교체 "呼び起こして刺激する"
-- Rubric 해소: A2 (답안누설 제거), B5
UPDATE quiz_question_options SET option_text = '抑え込んで鎮める' WHERE id = '2f3c4644-a933-41ea-8d74-d65cccfbbddc';
UPDATE quiz_question_options SET option_text = '呼び起こして刺激する' WHERE id = 'cffac368-2663-494d-9468-47618319cc53';
UPDATE quiz_question_options SET option_text = 'まったく気づかずにいる' WHERE id = 'bac20595-3652-4364-af06-94771886421c';
UPDATE quiz_question_options SET option_text = '範囲を狭めて制限する' WHERE id = 'e8196183-d2fc-47b7-b3fc-36873ddb5c8b';

-- Q-15572e16 (N3): 독해문제로 리프레이즈 — 어휘질문을 본문의존형으로
-- Before: 「お見積もり」の意味は何ですか？ (어휘문제)
-- After:  メールの送信者が確認してほしいと言っているのは何ですか？ (독해문제)
-- Rubric 해소: A1(범위일치), B5 (자동해소)
UPDATE quiz_questions
SET question_text = '次の文章を読んで、質問に答えてください。

お世話になっております。先日お送りしたお見積もりについて、ご検討いただけましたでしょうか。ご不明な点がございましたら、お気軽にお問い合わせください。何卒よろしくお願いいたします。

質問：メールの送信者は相手に何をしてほしいと言っていますか？',
    explanation = '送信者は「お見積もりについてご検討いただけましたでしょうか」と書き、見積もりの検討状況を確認しています。견적에 대한 검토 상황을 확인하는 메일입니다。'
WHERE id = '15572e16-9daa-4a81-a145-b1997f945ca2';
UPDATE quiz_question_options SET option_text = '見積書を新しく作り直してほしい' WHERE id = 'e42959d9-1129-4ec7-b386-08a5d30a3dab';
UPDATE quiz_question_options SET option_text = '見積もりの検討状況を教えてほしい' WHERE id = '1b4ae7f3-c296-4424-a545-6f7e71069b1b';
UPDATE quiz_question_options SET option_text = '支払いをすぐに済ませてほしい' WHERE id = '3270f47d-741a-46b0-922d-abd05323abff';
UPDATE quiz_question_options SET option_text = '商品をすぐに発送してほしい' WHERE id = '29496614-e1ed-4407-9129-778ef17ad489';

-- ============================================================
-- P0 Block 2 — B8 한국어→일본어 번역 (48문항 × 4옵션 = 192 options)
-- Rubric 해소: B8 (언어 일치), B5 (동시)
-- quiz_id: a0000002 (Dev/BJ reading — 初級/中級/上級)
-- ============================================================

-- Q-903cf59e (初級): デプロイメール
UPDATE quiz_question_options SET option_text = '本番環境にデプロイを実行してほしい' WHERE id = '791d2314-b769-4eb3-bb07-f73325417ddf';
UPDATE quiz_question_options SET option_text = 'ステージング環境で動作確認をしてほしい' WHERE id = 'c7bce08b-d61c-4d35-83fd-5cbcd0b5b4e8';
UPDATE quiz_question_options SET option_text = 'Slackチャンネルを新しく作ってほしい' WHERE id = '744adba3-52d4-4560-9299-01439155da33';
UPDATE quiz_question_options SET option_text = 'デプロイ作業を中止してほしい' WHERE id = '55e66fb5-21de-402d-a4f7-33619f29e060';

-- Q-0eb85a7e (初級): メンテナンス通知
UPDATE quiz_question_options SET option_text = '平日午後に実施されシステムは通常利用できる' WHERE id = '6114e5a0-bef1-4750-977b-c7dabf9a23f5';
UPDATE quiz_question_options SET option_text = '3月15日の午前2時から6時までシステムが使えない' WHERE id = 'f77600d7-66f8-4390-82cb-0ab1b941e391';
UPDATE quiz_question_options SET option_text = '毎週土曜日に定期的に実施される' WHERE id = 'ef9549e0-30de-4508-b686-bd97d3fd16f7';
UPDATE quiz_question_options SET option_text = 'メンテナンス中も一部機能は利用可能' WHERE id = '2f09ce27-4f82-40ad-92d8-54fdb47697ba';

-- Q-99a31aeb (初級): Slack依頼
UPDATE quiz_question_options SET option_text = 'ログイン画面のデザインを変更してほしい' WHERE id = '35637911-89a1-484e-b80f-4db2e8bc1af2';
UPDATE quiz_question_options SET option_text = 'バリデーションエラーメッセージ5件を日本語に訳してほしい' WHERE id = '3223d623-27e6-4967-9831-69abbd7698d1';
UPDATE quiz_question_options SET option_text = '金曜日までにログイン機能を新規開発してほしい' WHERE id = 'a5513867-8db5-40e3-8f96-7e810fd863e1';
UPDATE quiz_question_options SET option_text = 'フロントエンドのテストコードを書いてほしい' WHERE id = '4d13c70b-5e4d-4f4b-9f1c-68441c31f786';

-- Q-ce6ab5be (初級): リリースノート修正バグ
UPDATE quiz_question_options SET option_text = 'ダッシュボードのグラフ表示エラー' WHERE id = '4411af91-b81c-4520-81a8-da475bccf057';
UPDATE quiz_question_options SET option_text = 'パスワード再設定時のメール送信バグ' WHERE id = '35fde00c-c710-4eaf-bb74-b174967268c7';
UPDATE quiz_question_options SET option_text = 'ページ読み込み速度の低下問題' WHERE id = 'e679eae0-d304-46d2-b1c3-5f3e63346233';
UPDATE quiz_question_options SET option_text = 'ログイン認証の失敗エラー' WHERE id = 'ace2df49-8a7c-4fc2-b424-e2af8b1b945a';

-- Q-af712624 (初級): ログイン手順説明
UPDATE quiz_question_options SET option_text = 'パスワード再設定方法の説明' WHERE id = '5750be9a-6cad-48cc-938c-df19d846a449';
UPDATE quiz_question_options SET option_text = 'ログイン方法の説明' WHERE id = '439a35d7-496d-463d-858e-759ded32a47d';
UPDATE quiz_question_options SET option_text = '会員登録手順の説明' WHERE id = 'c82ed9ef-2c3d-4e89-9374-d1a15c3b8f14';
UPDATE quiz_question_options SET option_text = 'ログアウト手順の説明' WHERE id = '82c044fe-d7e5-44c8-8e11-a440495aa8f9';

-- Q-68222ed7 (初級): ボタンクリック
UPDATE quiz_question_options SET option_text = 'データが保存され確認メッセージが表示される' WHERE id = '65c2b000-914b-4107-b3ba-bd7e061ec022';
UPDATE quiz_question_options SET option_text = 'データが削除され警告メッセージが表示される' WHERE id = '223a3407-4418-4aab-8574-eda1116b6a40';
UPDATE quiz_question_options SET option_text = '画面が閉じてメイン画面に戻る' WHERE id = '47b63133-c421-43f2-8b75-7ddc5dba6453';
UPDATE quiz_question_options SET option_text = 'エラーが発生し再試行メッセージが出る' WHERE id = 'ae0ed477-2dcb-41e3-ad05-6f9ad11b69d7';

-- Q-e72fbbb2 (初級): エラー対応
UPDATE quiz_question_options SET option_text = 'システムを再起動して作業をやり直す' WHERE id = '494cc294-ef26-44e2-97f8-97b5619b06b0';
UPDATE quiz_question_options SET option_text = 'エラーを無視して次の作業を進める' WHERE id = '5d8bb470-8278-4f16-b948-e60a89ecd67c';
UPDATE quiz_question_options SET option_text = 'エラー内容を確かめて担当者に連絡する' WHERE id = 'feb21cc5-2d41-407c-b9c1-35fa6786e27e';
UPDATE quiz_question_options SET option_text = 'ブラウザを閉じて新しいセッションを始める' WHERE id = 'ef617bbe-3753-45de-b829-f8f5e8e8ecfb';

-- Q-e89362af (初級): バックアップ
UPDATE quiz_question_options SET option_text = '毎日9時から18時まで実施され処理が遅くなることがある' WHERE id = '1bbbddd8-39fb-4d0f-a0db-0fc5326764fe';
UPDATE quiz_question_options SET option_text = '週1回夜間のみ実施されサービスに影響はない' WHERE id = '08afc930-0941-49f0-9c14-8f80c6123893';
UPDATE quiz_question_options SET option_text = 'バックアップ中はシステムが全く使えない' WHERE id = '7808b34b-3d9e-43ab-8e7a-921161f3638f';
UPDATE quiz_question_options SET option_text = 'バックアップ完了後データが自動削除される' WHERE id = 'a18f04e3-8c0b-4c51-826e-54e1855bcc11';

-- Q-b41e220b (初級): アップデート内容
UPDATE quiz_question_options SET option_text = '決済機能の新規追加とUIの変更' WHERE id = '2cc91cb0-a0e0-42f3-9ac4-0986ec417880';
UPDATE quiz_question_options SET option_text = 'データベース移行とサーバー入れ替え' WHERE id = 'f778452f-a7fa-483f-ad78-d9ed323aa357';
UPDATE quiz_question_options SET option_text = 'セキュリティパッチ適用とデザイン変更' WHERE id = 'e3dc67d0-d329-4c3e-82e2-0f38cdf5f4e7';
UPDATE quiz_question_options SET option_text = 'ログインの不具合修正と検索速度の改善' WHERE id = 'bd164274-01d6-4ed1-8f62-a5f9a85f16fb';

-- Q-62ff4bc5 (初級): パスワード条件
UPDATE quiz_question_options SET option_text = '4文字以上で数字のみ含めばよい' WHERE id = 'b81fbe63-1cc6-457e-8b11-056fb6af8f3b';
UPDATE quiz_question_options SET option_text = '6文字以上で英字のみ含めばよい' WHERE id = '71b73090-da19-4118-864d-10f7f4ee3c1d';
UPDATE quiz_question_options SET option_text = '8文字以上で英字・数字・記号を含める' WHERE id = '76c8f314-86d2-40a5-aaba-3718d93d17f5';
UPDATE quiz_question_options SET option_text = '10文字以上で大文字のみ含めばよい' WHERE id = 'f76f5383-c47c-447d-9f90-e781b3549125';

-- Q-3961a264 (初級): ミーティング時間変更
UPDATE quiz_question_options SET option_text = '明日のミーティング時間が10時から14時に変わった' WHERE id = 'ac6d965a-475a-4b52-8f7e-f231176d8567';
UPDATE quiz_question_options SET option_text = '明日のミーティング場所が会議室Aに変わった' WHERE id = '73a55b47-c574-481b-8855-da054338403a';
UPDATE quiz_question_options SET option_text = '明日のミーティング参加者が追加で変わった' WHERE id = '0cf5ed6a-52e8-48b8-a8a7-11674a44a471';
UPDATE quiz_question_options SET option_text = '明日のミーティング議題が別の話題に変わった' WHERE id = 'd785417d-8368-46b2-b05f-d8a652233a7b';

-- Q-3ad2efc9 (初級): テストデプロイ依頼
UPDATE quiz_question_options SET option_text = '本番環境にすぐにデプロイする' WHERE id = '3d330ca1-fe4d-4d28-8406-0eadad4f0661';
UPDATE quiz_question_options SET option_text = 'テストコードを新しく書き直す' WHERE id = '385c01fc-fa50-478b-b146-2daaa7e8b2c4';
UPDATE quiz_question_options SET option_text = 'コードレビューを実施して承認する' WHERE id = '6c2d6880-cce2-42a7-a88f-724042ab4332';
UPDATE quiz_question_options SET option_text = '動作を確認し問題があればチケットを作る' WHERE id = '40977d26-1be7-40d1-9470-f01bd4b51ad1';

-- Q-d7019552 (初級): リリース延期
UPDATE quiz_question_options SET option_text = 'サーバー保守が終わったのでリリースを進める' WHERE id = '579d8295-020f-41f3-ae7d-45b13ea08616';
UPDATE quiz_question_options SET option_text = 'サーバー保守のためリリースが明日に延期される' WHERE id = '479d3995-08a7-411b-ad08-50ecee7c4682';
UPDATE quiz_question_options SET option_text = 'リリースは中止となり来週に再調整される' WHERE id = '4f88b4d9-e017-4cab-b498-c38d941bf21c';
UPDATE quiz_question_options SET option_text = 'リリースは今日予定通り通常進行される' WHERE id = '293a745d-291c-4d0b-aa64-fc798f2bd0c1';

-- Q-5178e817 (初級): アップロード前確認
UPDATE quiz_question_options SET option_text = 'ファイル名が命名規則に合うかを確認する' WHERE id = '7e4ae4d2-8eae-4497-9435-be0c8a3b510d';
UPDATE quiz_question_options SET option_text = 'ファイル形式が対応フォーマットか確認する' WHERE id = '426746b2-bd19-48c0-b9ae-6e9830cf3e6b';
UPDATE quiz_question_options SET option_text = 'ファイルをZIP形式に圧縮して用意する' WHERE id = '6f2c9415-925a-45bc-9228-19862ebd2743';
UPDATE quiz_question_options SET option_text = 'ファイルサイズが10MB以下か確認する' WHERE id = '9bab610b-70c2-4513-939d-9e593ef3517b';

-- Q-808001a6 (中級): 佐藤さんアクション
UPDATE quiz_question_options SET option_text = 'コードレビュー速度をさらに向上させる' WHERE id = '339f1c92-03e8-4bd6-b894-029758ab6cf7';
UPDATE quiz_question_options SET option_text = '来週までにテストケーステンプレートを作成する' WHERE id = 'e5eac2e5-3414-4de5-9839-e7f7710d1196';
UPDATE quiz_question_options SET option_text = 'スプリント振り返り日程を調整する' WHERE id = 'ec60580a-4296-4522-9bba-db239ec9bc6a';
UPDATE quiz_question_options SET option_text = '新しいチームメンバーをオンボーディングする' WHERE id = 'c8278866-e7c4-490d-8f77-f719f56edbdb';

-- Q-6ca63ee6 (中級): name検索方式
UPDATE quiz_question_options SET option_text = '完全一致検索' WHERE id = '0c3922e4-98bd-47e6-ac7f-22002a695c3b';
UPDATE quiz_question_options SET option_text = '部分一致検索' WHERE id = '8a606033-d23b-46e9-8611-b26458d45f4d';
UPDATE quiz_question_options SET option_text = '前方一致検索' WHERE id = 'd9fa3deb-87cc-404a-8c41-9748851549ae';
UPDATE quiz_question_options SET option_text = '正規表現検索' WHERE id = '22c3f2b7-2d5f-4908-8c6b-9e2fd69ecea4';

-- Q-73503edc (中級): 暫定対応
UPDATE quiz_question_options SET option_text = '決済APIのタイムアウト値を変更した' WHERE id = 'cdacb2ef-53a9-4a4f-87fc-16a2a188cbd6';
UPDATE quiz_question_options SET option_text = 'リトライ回数を3回から5回に変更した' WHERE id = '133ef915-ea7c-4bea-896f-2609a6baaa53';
UPDATE quiz_question_options SET option_text = '外部決済APIを他サービスに切り替えた' WHERE id = '76d3ca5d-cb3c-448a-a6a4-406e7fafd4ad';
UPDATE quiz_question_options SET option_text = '決済処理機能を一時停止した' WHERE id = '55c58314-f62c-4e1c-8c9f-0bff84a6b68b';

-- Q-eb547d42 (中級): 認証方式変更理由
UPDATE quiz_question_options SET option_text = 'セキュリティ脆弱性が見つかったため' WHERE id = '41fe564b-9ed3-4236-971e-1fd75ab018c5';
UPDATE quiz_question_options SET option_text = 'マイクロサービス対応と拡張性向上のため' WHERE id = '7bafca30-8ac9-48e2-8a34-f30b0007b932';
UPDATE quiz_question_options SET option_text = 'ライセンス費用を削減するため' WHERE id = 'c1ba5e30-0e6e-4ba3-b0c7-a2eea74a61c3';
UPDATE quiz_question_options SET option_text = '顧客から変更要望があったため' WHERE id = '6616daf1-6dd3-4cb5-9537-ccf1855f011b';

-- Q-7c5550cc (中級): デプロイ通知種類
UPDATE quiz_question_options SET option_text = 'メール通知' WHERE id = '87612ca8-66d7-47ba-8d55-a5c2e19b175e';
UPDATE quiz_question_options SET option_text = 'プッシュ通知' WHERE id = '0ea9badf-73ad-4af9-bd98-261a7f74359c';
UPDATE quiz_question_options SET option_text = 'Slack通知' WHERE id = '16cee699-2277-4b0b-8ba8-be42b36833bc';
UPDATE quiz_question_options SET option_text = 'メールとプッシュ通知' WHERE id = '07191073-fc69-46d4-b1fd-ceadf053c559';

-- Q-1aa5f58c (中級): 障害根本原因
UPDATE quiz_question_options SET option_text = 'サーバーCPUの物理的な故障' WHERE id = 'aaa0729d-d1e3-4e34-8fd3-e32b3ca70f79';
UPDATE quiz_question_options SET option_text = 'ネットワーク帯域の不足' WHERE id = '535b60d1-397f-4834-ab26-d2c8f9ad0d6b';
UPDATE quiz_question_options SET option_text = 'バッチクエリがテーブルフルスキャンしていた' WHERE id = '4d9afdaa-2004-4c5e-8e17-0d5a3a3b6f4a';
UPDATE quiz_question_options SET option_text = '同時接続ユーザー数の急増' WHERE id = '331dd93f-91b2-4ce3-a2b2-dca812c0c285';

-- Q-b2f30e78 (中級): 修正箇所数
UPDATE quiz_question_options SET option_text = '1箇所' WHERE id = '206941ef-654c-475f-b455-a09a39888519';
UPDATE quiz_question_options SET option_text = '2箇所' WHERE id = 'e33a256f-a39e-4b94-869f-74780a28a30d';
UPDATE quiz_question_options SET option_text = '3箇所' WHERE id = 'd5a3fdf3-3ecc-4edb-a2af-c56437bb15cd';
UPDATE quiz_question_options SET option_text = '4箇所' WHERE id = '845ec0b6-8847-44c1-b76f-11cdbf0f56be';

-- Q-1fb5734f (中級): PDF動作
UPDATE quiz_question_options SET option_text = 'サムネイルが自動生成される' WHERE id = '31cb58b3-da45-4340-a070-a55e08157dd2';
UPDATE quiz_question_options SET option_text = '1ページ目がプレビュー画像として生成される' WHERE id = '258aae21-6463-4edd-b1f5-c0c2b61c245d';
UPDATE quiz_question_options SET option_text = '全ページが画像に変換される' WHERE id = 'cdd10aa4-2979-430d-9793-62d2d4741e4d';
UPDATE quiz_question_options SET option_text = 'PDFビューアが自動で起動される' WHERE id = '72e9c167-89ee-41d1-8955-21d9b43170f2';

-- Q-32898307 (中級): ログイン失敗条件
UPDATE quiz_question_options SET option_text = '3回連続失敗時に30分間ロックする' WHERE id = '4f2ee1f0-f9a3-44d6-8020-61d25fe6f4c9';
UPDATE quiz_question_options SET option_text = '5回連続失敗時に永久的にロックする' WHERE id = 'f1ad28e1-6dd2-454b-ba73-c5e00341922f';
UPDATE quiz_question_options SET option_text = '1回失敗時に10分間ロックする' WHERE id = 'a1eafb8f-89da-4415-a091-7bbfd0aaf7fc';
UPDATE quiz_question_options SET option_text = '3回連続失敗時にパスワードを初期化する' WHERE id = 'd55db0b1-107d-47a8-a836-b77f48ed7856';

-- Q-de9e294e (中級): フィルタ不具合
UPDATE quiz_question_options SET option_text = '検索機能そのものが全く動作しない不具合' WHERE id = '9141fbe1-9475-4508-b32a-596c89cfa17f';
UPDATE quiz_question_options SET option_text = 'ページ遷移時にカテゴリーフィルターが初期化される不具合' WHERE id = '0f65543e-9c67-4a8f-95f1-81e8120ba37e';
UPDATE quiz_question_options SET option_text = 'ページネーションボタンが表示されない不具合' WHERE id = '161b85ce-a0f8-4bdd-b412-e9a6407b05db';
UPDATE quiz_question_options SET option_text = 'カテゴリ一覧がDBから読み込まれない不具合' WHERE id = 'd36e91b4-c7a8-4e8e-a6e7-08d6de9f2a89';

-- Q-35d7ca1a (中級): 改修目標
UPDATE quiz_question_options SET option_text = '新しいAPIエンドポイントを追加して機能を拡張する' WHERE id = '69566eeb-95fa-4285-ac8b-4a73ee6f4b4d';
UPDATE quiz_question_options SET option_text = 'データベースを別製品に完全に入れ替える' WHERE id = '84a3b083-e589-487f-8e9e-9ca1c722ce7e';
UPDATE quiz_question_options SET option_text = 'APIレスポンスタイムを500msから200ms以下に短縮する' WHERE id = 'c5391372-b1cd-4135-899d-fc599c50e939';
UPDATE quiz_question_options SET option_text = 'サーバー台数を増やしてトラフィック分散を最適化する' WHERE id = 'c45058a2-580c-44e6-8426-f4d58f0c8b33';

-- Q-ac5fb056 (中級): 田中さん担当
UPDATE quiz_question_options SET option_text = 'テストケースの追加作成を担当する' WHERE id = '8eae08c7-6754-4506-a0c9-68611f57d035';
UPDATE quiz_question_options SET option_text = '障害対応手順書の作成を担当する' WHERE id = '03dccca7-ef8e-45f6-b1c6-38aa9cd50454';
UPDATE quiz_question_options SET option_text = 'リリース日程の調整と管理を担当する' WHERE id = 'e0a0fd76-8cec-4790-ac42-9d095611a79a';
UPDATE quiz_question_options SET option_text = '本番環境へのデプロイ実行を担当する' WHERE id = '38106487-f323-488c-8cd0-4eb1a17c3ce4';

-- Q-4e2acf6c (中級): コードレビュー指摘
UPDATE quiz_question_options SET option_text = 'SQLインジェクションによるセキュリティ脆弱性問題' WHERE id = '62050628-f4b4-4347-b4dc-6bd376d9939a';
UPDATE quiz_question_options SET option_text = 'メモリリークによるリソース枯渇問題' WHERE id = 'b21cd197-26eb-4822-9f8a-d9aad9311608';
UPDATE quiz_question_options SET option_text = 'N+1問題（ループ内でDBクエリが繰り返し発生）' WHERE id = 'd22c4252-8d2d-4646-af61-9e773399d250';
UPDATE quiz_question_options SET option_text = '無限ループによるプロセス停止問題' WHERE id = '451a7988-efc6-4794-ae9e-fcbc7bc4ab6b';

-- Q-52b16cb3 (中級): CPU障害原因
UPDATE quiz_question_options SET option_text = 'ハードディスク容量不足によるI/Oエラー' WHERE id = 'c2331ab4-3fd0-4fce-abaf-016413bf2c7d';
UPDATE quiz_question_options SET option_text = 'ネットワーク機器の故障による通信断' WHERE id = '5182403a-52f0-455e-9080-d890b79ff3a2';
UPDATE quiz_question_options SET option_text = 'メモリ不足によるOut of Memoryエラー' WHERE id = 'bbaad404-6aa9-4eb1-90ca-800bdbef59e1';
UPDATE quiz_question_options SET option_text = 'バッチ処理がピーク時間と重なってCPUが100%になった' WHERE id = 'd60822cc-f244-455b-9f12-497ab86aa70e';

-- Q-8cf47f79 (中級): 認証方式
UPDATE quiz_question_options SET option_text = 'セッションベース認証（サーバー側で状態管理）' WHERE id = 'ce98dabf-07a9-4bc9-80c4-8008c0bbe6ea';
UPDATE quiz_question_options SET option_text = 'OAuth 2.0認証（外部プロバイダー連携）' WHERE id = 'c437eae5-9044-4197-aced-4821bda8a93c';
UPDATE quiz_question_options SET option_text = 'JWTトークン認証（有効期限1時間の設定）' WHERE id = '0b5dee8e-a8ec-4a80-ab5c-1b6597b432a4';
UPDATE quiz_question_options SET option_text = 'Basic認証（ID/パスワードを直接送信）' WHERE id = 'ed56595e-0eef-4e18-8ea3-106805411840';

-- Q-0a2bf680 (中級): PRテスト内容
UPDATE quiz_question_options SET option_text = '同時接続1000名時の応答速度を確認した' WHERE id = 'b0d32c12-c104-46c0-a8ed-64e54f87b571';
UPDATE quiz_question_options SET option_text = '0件の場合の表示と1ページ以下でページネーション非表示を確認した' WHERE id = '150cf5b8-deb8-4fe7-bbbb-32bbf400e2c3';
UPDATE quiz_question_options SET option_text = 'XSSとSQLインジェクションのセキュリティ検証を行った' WHERE id = '8c86b1eb-41dc-460a-88e6-dbf984ab8270';
UPDATE quiz_question_options SET option_text = '大量データ10万件以上の負荷テストを行った' WHERE id = '01546686-a223-4140-85aa-2ffb4314c090';

-- Q-b1615bcd (中級): mainマージ時期
UPDATE quiz_question_options SET option_text = '作業完了のたびに随時マージを実行する' WHERE id = 'b243a743-5420-4d5b-a7f6-2cd70e881fed';
UPDATE quiz_question_options SET option_text = 'コードレビュー完了直後にマージを実行する' WHERE id = '1c9490d3-0be0-47b0-a196-f0383e2ba01a';
UPDATE quiz_question_options SET option_text = '毎日決まった時間に自動でマージを実行する' WHERE id = '2e6e90a3-345c-442f-9a08-1cf567dced6b';
UPDATE quiz_question_options SET option_text = 'リリース時のみマージして必ずタグを付ける' WHERE id = '2df84648-3656-419a-8837-d18a18992d94';

-- Q-729f87f9 (上級): L1キャッシュ不整合原因
UPDATE quiz_question_options SET option_text = 'RedisのTTLが1時間と長いため' WHERE id = 'c356aaa0-580a-455b-8eef-c31a3bb15fd1';
UPDATE quiz_question_options SET option_text = 'L1キャッシュがインスタンスごとに独立しているため' WHERE id = 'b1a71334-255e-4083-8cac-64542b1d569a';
UPDATE quiz_question_options SET option_text = 'キャッシュ無効化が非同期で処理されるため' WHERE id = '1b1caf6e-d768-44cc-9bc7-ae3d56faefdb';
UPDATE quiz_question_options SET option_text = 'DBからのデータ取得に時間がかかるため' WHERE id = '152862a9-e042-472f-8160-09a2888d0b2f';

-- Q-79282caf (上級): ストラングラーフィグパターン理由
UPDATE quiz_question_options SET option_text = '開発費用が最も安く済むため' WHERE id = 'bb58d2ca-3fbd-4a0c-96d9-c36478a9ed29';
UPDATE quiz_question_options SET option_text = 'ビッグバン移行のリスクが高く段階的に切り出せるため' WHERE id = '04d93873-5a79-45f2-a832-c6b45077176e';
UPDATE quiz_question_options SET option_text = 'マイクロサービスの業界標準となっているため' WHERE id = '8414b6c7-d60b-40c9-a1b2-093d9c447f6c';
UPDATE quiz_question_options SET option_text = '顧客からの要請で決定されたため' WHERE id = '434956a3-fd9f-442e-85a9-8f0ccd9249b1';

-- Q-49833202 (上級): PostgreSQLメリット
UPDATE quiz_question_options SET option_text = '運用コストが安くライセンスが無料である' WHERE id = '1b156056-4640-45c5-9951-f01698052eaf';
UPDATE quiz_question_options SET option_text = 'JSONBカラムとウィンドウ関数/CTEの充実' WHERE id = 'f91f242e-6993-4cfa-8939-6fe48e3cb00f';
UPDATE quiz_question_options SET option_text = 'MySQLと完全互換で移行作業が不要' WHERE id = 'cea8dd63-0d96-45cf-84d3-c2f4c5595651';
UPDATE quiz_question_options SET option_text = 'クラウドネイティブ環境に最適化されている' WHERE id = 'a821edce-4a0c-471b-b26f-f26c752f2372';

-- Q-69fbeb03 (上級): スプリント対応項目
UPDATE quiz_question_options SET option_text = '4項目すべてを今スプリントで対応する' WHERE id = '2cf9c072-7577-4f51-9a43-7cc6f69040ae';
UPDATE quiz_question_options SET option_text = 'SQLインジェクションとXSS（Critical/Highのみ）' WHERE id = '782e2bef-f5c7-4d54-870a-9113cda5a27c';
UPDATE quiz_question_options SET option_text = 'SQLインジェクションのみ（Criticalのみ）' WHERE id = 'a061d4d3-dfb6-4113-990c-fb0368f46eec';
UPDATE quiz_question_options SET option_text = 'CORS設定とサーバーバージョン露出のみ（Medium/Low）' WHERE id = 'f55b46c6-b5fb-4bf1-9814-15e4493a506f';

-- Q-01fe3cc5 (上級): 429リトライ方針
UPDATE quiz_question_options SET option_text = '5秒後に1回リトライする' WHERE id = '92d09f6a-3f77-40ae-b647-6b9977a99a6d';
UPDATE quiz_question_options SET option_text = 'リトライしない' WHERE id = '4dc85871-ebc3-4cf5-b03b-caa7ec33a171';
UPDATE quiz_question_options SET option_text = 'Exponential Backoffで最大3回リトライする' WHERE id = 'b8e274aa-18e8-4258-b328-c54f430163ff';
UPDATE quiz_question_options SET option_text = '即座に3回リトライする' WHERE id = '8e4d4581-8308-4590-8b4b-5088d27c68cf';

-- Q-ac0076b8 (上級): リフレッシュトークン有効期限
UPDATE quiz_question_options SET option_text = '15分' WHERE id = 'afab8ab1-9874-4400-99bd-243925b27a97';
UPDATE quiz_question_options SET option_text = '1時間' WHERE id = '94390490-0e05-4a20-9fd0-c75f86048f0a';
UPDATE quiz_question_options SET option_text = '24時間' WHERE id = '91d2ce96-67d5-44e3-8f15-fb2dd0aa0cbb';
UPDATE quiz_question_options SET option_text = '7日' WHERE id = '3c103f0c-d43e-4ee9-b752-0eaf3ccfdd56';

-- Q-184e6654 (上級): WBS追加作業手続き
UPDATE quiz_question_options SET option_text = '担当者が自身の判断で実施する' WHERE id = '6da18c58-04da-4c73-880b-45009dcb15eb';
UPDATE quiz_question_options SET option_text = 'プロジェクトマネージャに口頭で報告すればよい' WHERE id = 'f6d6e0f6-142e-4929-a355-b7cdc46bd6bb';
UPDATE quiz_question_options SET option_text = '変更管理プロセスを経て承認を得る必要がある' WHERE id = '69f66f88-0e93-4794-b4de-ceef0eaea72f';
UPDATE quiz_question_options SET option_text = '次のプロジェクトで反映するよう記録だけ残す' WHERE id = 'c3925015-2dee-44e4-807e-baf034c6e8c5';

-- Q-a51b4699 (上級): クリティカルパス遅延
UPDATE quiz_question_options SET option_text = 'プロジェクト全体の完了日に直接影響する' WHERE id = '884ebaef-f543-4d33-989f-680ffdea0bee';
UPDATE quiz_question_options SET option_text = 'フロートの範囲内なら影響はない' WHERE id = '59d5cc8d-9f33-46cb-accf-367e754bba1e';
UPDATE quiz_question_options SET option_text = '該当タスクのみスケジュールが変わる' WHERE id = '57ae7391-3d45-4347-ac33-e27716fadb45';
UPDATE quiz_question_options SET option_text = '別経路のタスクにのみ影響を及ぼす' WHERE id = 'd9719063-136c-4f20-ac12-cc7421bb17ab';

-- Q-b9718b94 (上級): 次工程必要条件
UPDATE quiz_question_options SET option_text = 'すべての指摘事項15件を完全に修正する必要がある' WHERE id = '0d59aac4-e946-49c1-b34d-45fe9e495974';
UPDATE quiz_question_options SET option_text = '軽微な指摘事項のみ修正すればよい' WHERE id = '38b7cea0-6563-4e13-8509-c7326d563047';
UPDATE quiz_question_options SET option_text = '重大な指摘を0件にし軽微分は対応計画を策定する' WHERE id = '35760dc5-911b-4de5-a6c0-c0916f647339';
UPDATE quiz_question_options SET option_text = '課題管理表に登録するだけで次工程へ進める' WHERE id = 'b1e1d975-198f-4ceb-8106-f7fa512cd652';

-- Q-30a5fe5c (上級): SES契約
UPDATE quiz_question_options SET option_text = '受注者が成果物の完成責任を負う' WHERE id = 'affab3a2-fba8-4b83-a095-f3a8d97cd5f4';
UPDATE quiz_question_options SET option_text = '発注者が作業の進め方に直接指示できない' WHERE id = '124c16c5-f7f0-46bf-8ba0-20d1d04e0bcc';
UPDATE quiz_question_options SET option_text = '技術者の雇用関係は発注者にある' WHERE id = '0d118784-ce02-4088-ae21-aea4dbc34ee7';
UPDATE quiz_question_options SET option_text = '成果物の完成責任は発注者側にあり雇用は所属会社にある' WHERE id = 'a977be61-2826-451a-bc47-f9e401c0b88f';

-- Q-d1597235 (上級): 社外秘メール送信
UPDATE quiz_question_options SET option_text = '文書を暗号化した上でメール送信する' WHERE id = '37edb239-0379-4d58-96a1-818f360673d4';
UPDATE quiz_question_options SET option_text = '情報セキュリティ管理者の承認を得てUSBで渡す' WHERE id = 'bd75bb24-ffc9-400c-b32f-b7a405fadfbf';
UPDATE quiz_question_options SET option_text = 'パスワード設定済みのPCからのみ送信する' WHERE id = '3b9cd3f5-d9c8-47da-a939-57b541dcc0f4';
UPDATE quiz_question_options SET option_text = '社外秘文書のメール送信は一切禁止されている' WHERE id = '0817b92f-efa1-48a9-b8c9-ac63f092f98d';

-- Q-bcab4541 (上級): 重大インシデント復旧時間
UPDATE quiz_question_options SET option_text = '発生から30分以内' WHERE id = '6e8a2740-d09c-46ee-b67e-1acbb5fe17a8';
UPDATE quiz_question_options SET option_text = '発生から4時間以内' WHERE id = 'c820187d-7c6c-4443-aeb0-29970270a3a3';
UPDATE quiz_question_options SET option_text = '翌営業日まで' WHERE id = 'ceaf7267-4394-424f-b737-cc16f197d43f';
UPDATE quiz_question_options SET option_text = '24時間以内' WHERE id = '13f48bdb-a0da-46ed-b398-f8439caab2ed';

-- Q-0edfc708 (上級): 検収完了条件
UPDATE quiz_question_options SET option_text = '単体テストでバグ密度基準値を満たすこと' WHERE id = 'd8358cbc-1bd8-4970-9994-8aa0757d0cb7';
UPDATE quiz_question_options SET option_text = '結合テストでインターフェースの正常性が検証されること' WHERE id = '98a9540c-974a-4ac6-941e-2ca0d210cbe2';
UPDATE quiz_question_options SET option_text = 'テストチームがすべてのテストを完了すること' WHERE id = '7e5528cb-97f1-4a94-bf04-3c1d50855ff8';
UPDATE quiz_question_options SET option_text = '発注者が実施する受入テストに合格すること' WHERE id = '63a4695b-a171-436f-ac4c-621981dc9b16';

-- Q-7d1b21a8 (上級): 個人情報保管期間終了後
UPDATE quiz_question_options SET option_text = '本人に通知し保管延長の同意を得る' WHERE id = '80192ae6-e54c-44b8-b2e9-c2f4e489cd98';
UPDATE quiz_question_options SET option_text = '速やかに削除する' WHERE id = '404067c2-4e53-4ca7-8200-bc8159b0ec07';
UPDATE quiz_question_options SET option_text = '暗号化して別サーバーに保管する' WHERE id = 'b56c0c30-357f-4a4a-963a-6cad0d8c6e3b';
UPDATE quiz_question_options SET option_text = '匿名化処理をして引き続き保管する' WHERE id = '457424b4-e4a9-4cf5-804d-8b7860d5de35';

-- Q-98960576 (上級): ベンダー選定
UPDATE quiz_question_options SET option_text = 'A社とC社が選定対象でA社が最高得点となる' WHERE id = 'e465919c-b9d5-4b51-a320-f549b0361281';
UPDATE quiz_question_options SET option_text = 'A社・B社・C社すべてが選定対象である' WHERE id = 'b2d9a0e1-dd07-4d77-91a0-b9bb3dc21651';
UPDATE quiz_question_options SET option_text = 'B社は技術力低いが総合78点なので選定対象' WHERE id = '228006e3-cf9d-480f-b03c-6ba9bc98e735';
UPDATE quiz_question_options SET option_text = 'C社が技術力基準を満たすのでC社のみ選定対象' WHERE id = '85860195-42b1-4bd5-bce4-12c983141b3e';

-- Q-5959553e (上級): 緊急変更相違点
UPDATE quiz_question_options SET option_text = 'テスト環境での検証を省略できる' WHERE id = '52f3edec-3adc-4f17-8f64-88274c16edb9';
UPDATE quiz_question_options SET option_text = '変更依頼書の作成を省略できる' WHERE id = 'bcfef82d-c140-49ba-8912-19e23f9f4496';
UPDATE quiz_question_options SET option_text = 'CABの事後承認を条件に事前審査を省略できる' WHERE id = '7d79ddf3-fe73-484a-8f4a-165c3236611e';
UPDATE quiz_question_options SET option_text = '正常性確認とロールバック手順を省略できる' WHERE id = '2ae0d876-7ff4-4668-8012-6b7d986a0a33';

-- Q-f97edf01 (上級): ポストモーテム根本原因
UPDATE quiz_question_options SET option_text = 'コードにバグが存在していたため' WHERE id = '0139d539-4aa4-498c-a9c2-81d4c35bf763';
UPDATE quiz_question_options SET option_text = 'サーバーリソースが不足していたため' WHERE id = '551b8e46-a9e2-4ba5-9fe8-f193725dd598';
UPDATE quiz_question_options SET option_text = '環境変数の設定漏れ' WHERE id = 'eb4dbdb8-beb6-449f-9ace-046198f23061';
UPDATE quiz_question_options SET option_text = 'ロールバック手順に問題があったため' WHERE id = '427dc98c-a3b6-40d8-b5c6-d3d14327b2e0';

-- ============================================================
-- P1 Block — B5 REAL_BIAS rebalance (상위 ~60 문항, ratio ≥ 2.0)
-- 전략: 정답이 너무 길거나 짧으면 정답을 적절히 조정, 또는 오답을 확장/축약
-- Rubric 해소: B5 (길이 균등 ±30%)
-- ============================================================

-- Q-10a3bf0a (N4): 정답 9자 vs 오답 1~2자 — 오답 보강
UPDATE quiz_question_options SET option_text = '同じ本' WHERE id = '614a5fa3-6b51-4a59-88fb-a968deaf71c8';
UPDATE quiz_question_options SET option_text = '現金のみ' WHERE id = '87762763-779f-47aa-8622-0e7267e89e31';
UPDATE quiz_question_options SET option_text = '花束' WHERE id = 'efd2e8fe-c0e9-4b8e-bded-12a510aafb5c';

-- Q-0c5e2f2e (N4): 전 선택지를 "〜を飼うこと" 포맷으로 통일 (B5 ratio 8.00x → 1.33x)
UPDATE quiz_question_options SET option_text = '大型犬を飼うこと' WHERE id = '8036ef00-3148-4182-b578-0c3f6dd28bdc';
UPDATE quiz_question_options SET option_text = '小型犬を飼うこと' WHERE id = 'cf73f8c5-f77b-47d0-8842-e485e90e4050';
UPDATE quiz_question_options SET option_text = '猫を飼うこと' WHERE id = '5aa0b129-7355-45e9-a496-e324d28bc327';

-- Q-f2a86c22 (N3): correct 8 vs min 2 — 오답 확장
UPDATE quiz_question_options SET option_text = '忍耐と我慢' WHERE id = '55144eb5-d0bd-4787-873d-584fb1dc3b82';
UPDATE quiz_question_options SET option_text = '勇気ある行動' WHERE id = '1d5b4e5e-a9e7-4e52-a425-1e025e443369';

-- Q-70dc4b72 (N4): 정답 4자 vs 오답 최대 10 — 오답 축약
UPDATE quiz_question_options SET option_text = '英語に変更' WHERE id = 'f71f9466-bc65-4835-8a28-0351d65d72fc';
UPDATE quiz_question_options SET option_text = '他の先生が担当' WHERE id = 'f708fb23-aedd-4dd9-a4fc-e0f2c462a961';
UPDATE quiz_question_options SET option_text = '自習になる' WHERE id = '938a588b-85bd-4a4c-bd44-4aae051ee795';

-- Q-deb60bb1 (N3): 정답 19자 vs 최단 5자 — 오답 보강
UPDATE quiz_question_options SET option_text = '給料が大幅に減額される' WHERE id = '3090a735-1eaa-4d50-a5e3-e70a911cee97';
UPDATE quiz_question_options SET option_text = '通勤時間が長くなってしまう' WHERE id = 'beb2c480-16c5-4fd1-b04d-bbb2a1778df5';

-- Q-3fb89001 (N5): 정답 18자 vs 최단 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = '一緒に勉強だけして帰る' WHERE id = 'c8e6d118-8dd7-4795-a6d7-0e4dcdcdfb6a';
UPDATE quiz_question_options SET option_text = '学校で映画を一緒に見る' WHERE id = 'a533f66f-a545-4e28-9280-9ac62dca60b1';

-- Q-3ec761e0 (N4): 정답 18자 vs 최단 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = '薬局で睡眠薬を買って飲む' WHERE id = '7334c0cc-b33e-4d5f-9b99-a75468089da2';
UPDATE quiz_question_options SET option_text = '専門の病院で相談する' WHERE id = '6df0ed95-69c1-45f3-8d04-96fc8c1e51aa';

-- Q-815f13ee (N3): 정답 7자 vs 최단 2자 — 오답 확장
UPDATE quiz_question_options SET option_text = '完全自由勤務' WHERE id = '2983e929-f913-40d6-88dd-7f7e89318b0e';

-- Q-b3cd6304 (N2): 정답 7자 vs 최단 2자 — 오답 확장
UPDATE quiz_question_options SET option_text = 'すぐに疑ってみる' WHERE id = '91875099-f680-4f36-a471-8b42376de944';
UPDATE quiz_question_options SET option_text = '完全に無視する' WHERE id = 'cfc32e05-06f6-4dc1-a2df-9b2a8de44749';
UPDATE quiz_question_options SET option_text = 'すぐに共有する' WHERE id = 'c7322751-fd30-4e58-b38a-e8aa4a7202bc';

-- Q-23cc0fe7 (N4): 정답 24자 vs 최단 7자 — 오답 확장
UPDATE quiz_question_options SET option_text = '教科書や参考書だけで勉強する' WHERE id = 'd4c1f2a6-bbf0-4cfe-8016-3605efc684b6';
UPDATE quiz_question_options SET option_text = '平日に日本語学校に通って学ぶ' WHERE id = '1bde01d5-df2b-4664-8843-6f24aa293e16';
UPDATE quiz_question_options SET option_text = '毎日日本語で日記を書き続ける' WHERE id = '8bf84377-b317-4dc6-88e9-9ec956d3d23f';

-- Q-d4d12a4e (N4): 정답 3자 (料費) → 균형 위해 오답 축약
UPDATE quiz_question_options SET option_text = 'レンタル代' WHERE id = '11f1cf32-b45e-428f-aaa2-048d2b77c487';

-- Q-71e9f4fd (N1): 정답 23자 vs 최단 7자 — 오답 확장
UPDATE quiz_question_options SET option_text = '既存業務を単にIT化すること' WHERE id = '2119bba2-e38c-44ff-9965-4ac75c569bc8';
UPDATE quiz_question_options SET option_text = '紙業務のデジタル化に留まること' WHERE id = '2fb84bc0-8f49-4c50-8434-21663a19b4a6';
UPDATE quiz_question_options SET option_text = '最新技術を次々と導入すること' WHERE id = 'b41cdabe-21f5-4a1a-8d46-24ab23b15f92';

-- Q-11d71e2b (N5): 정답 4자 vs 최장 13자 — 오답 축약
UPDATE quiz_question_options SET option_text = '小動物だけ飼える' WHERE id = '0d92c01b-6728-4d81-b3d7-989e2c49db16';
UPDATE quiz_question_options SET option_text = '管理人の許可が必要' WHERE id = 'faa7208e-83b9-4d4f-8f30-5b3de9e65397';

-- Q-d4cb4d3a (N2): 정답 26자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = '人件費を大幅に削減する経営戦略' WHERE id = '0272912b-3648-4352-85fd-0a0fa4fc8f37';
UPDATE quiz_question_options SET option_text = '海外進出のためだけの取り組みだ' WHERE id = 'db4df9f1-45c5-4335-a834-ac48f7384269';
UPDATE quiz_question_options SET option_text = '法的義務を満たすためのものだ' WHERE id = 'd44b5f8a-4674-4c97-b4f7-dbec514ae577';

-- Q-5c26389f (N2): 정답 25자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = '残業時間の削減だけで根本的に解決する' WHERE id = '06430b2b-07d7-4991-aba8-d948491164aa';
UPDATE quiz_question_options SET option_text = '社員の数をひたすら増やしていく' WHERE id = '1f30e7e2-5368-4107-b745-32d641b6a2d3';
UPDATE quiz_question_options SET option_text = 'テレワークを全面的に導入する' WHERE id = '79fc663c-3311-4e09-9b08-c82650631c8d';

-- Q-a6d4dd96 (N4): 정답 15자 vs 오답 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = '血圧の数値が少し高い' WHERE id = '5d808eea-95d5-4dd0-81eb-0b24e15a862d';
UPDATE quiz_question_options SET option_text = '視力の数値が少し悪い' WHERE id = '74a086f5-ac68-4c3e-b21a-2fce1d402742';
UPDATE quiz_question_options SET option_text = '体重の数値が少し多い' WHERE id = '78a233ec-3dcf-4da5-bbd7-05858a929430';

-- Q-99882223 (N2): 정답 12자 vs 최단 4자 — 오답 확장
UPDATE quiz_question_options SET option_text = '古い悪い習慣' WHERE id = 'ff00a1c1-9e72-4411-8030-407a157c072c';
UPDATE quiz_question_options SET option_text = '企業の法的義務' WHERE id = '179a710c-60b3-4c71-8519-456f13488b58';

-- Q-803d9db7 (N2): 정답 15자 vs 최단 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = '起きた事実を隠して対応する' WHERE id = '23639c94-7c05-4a3a-b0fb-75175aab39b8';
UPDATE quiz_question_options SET option_text = '即座にシステムを停止する' WHERE id = '13a1c692-7994-421b-a941-5626564991bc';
UPDATE quiz_question_options SET option_text = '担当者を直ちに解雇する' WHERE id = '166fa6b0-7420-4725-b62c-ec322e1fcfba';

-- Q-93102c7f (N2): 정답 18자 vs 최단 6자 — 오답 확장
UPDATE quiz_question_options SET option_text = '先輩社員の給与が上がる' WHERE id = 'aca03ed4-4782-44b1-aef4-259917f053a6';
UPDATE quiz_question_options SET option_text = '先輩社員の業務量が減る' WHERE id = 'c871381c-8fab-42d3-90cd-65706437b51c';
UPDATE quiz_question_options SET option_text = '先輩社員の昇進が保証される' WHERE id = 'd51f4928-bbf3-4ea3-930a-a9dcebbc72b0';

-- Q-ad40a7ab (N1): 정답 26자 vs 최단 9자 — 오답 확장
UPDATE quiz_question_options SET option_text = '研究開発費が慢性的に不足している' WHERE id = '364d42e8-7c05-4350-a59d-4372038e3fe4';
UPDATE quiz_question_options SET option_text = '競合他社が市場に多すぎる状況' WHERE id = '91e0123f-20a4-4618-a621-5c56a5268af3';
UPDATE quiz_question_options SET option_text = '消費者の好みが全く変わらない' WHERE id = '016f1252-454b-4833-a065-54fe65333e57';

-- Q-a0d048f9 (N2): 정답 25자 vs 최단 9자 — 오답 확장
UPDATE quiz_question_options SET option_text = 'リーダーが部下に強く指示する' WHERE id = 'ada61ee0-9914-4cac-bd8a-97e68426c339';
UPDATE quiz_question_options SET option_text = 'リーダーがすべてを決めていく' WHERE id = '782e73a3-b610-4f9e-b495-df62e28f56a7';
UPDATE quiz_question_options SET option_text = 'リーダー自体が必要なくなる' WHERE id = 'a4882d52-dd73-4d7d-bb4f-843328950ce2';

-- Q-2fe179e0 (N4): 정답 19자 vs 최단 7자 — 오답 확장
UPDATE quiz_question_options SET option_text = '洗わずにそのまま出す' WHERE id = 'b5a64644-8726-402f-9024-df47ef6a2596';
UPDATE quiz_question_options SET option_text = '細かく切ってから出す' WHERE id = 'f0f3009e-90b6-4cc2-a4f5-93c0466fb4fe';
UPDATE quiz_question_options SET option_text = '紙袋にまとめて捨てる' WHERE id = '4d095e5c-379f-4417-a78e-90d22507eff4';

-- Q-d1bfe4a0 (N2): 정답 16자 vs 최단 6자 — 오답 확장
UPDATE quiz_question_options SET option_text = '人員をすぐに増やす' WHERE id = 'f7f6f2ca-d6d2-456f-a60f-acaf444ae884';
UPDATE quiz_question_options SET option_text = '納期を大幅に延長する' WHERE id = 'c3b122eb-2feb-4689-8b99-964937703e79';
UPDATE quiz_question_options SET option_text = 'すべての要望を受け入れる' WHERE id = '26e914f4-cb57-4aa5-a15a-8a3ca8c42646';

-- Q-06f01eed (N1): 정답 21자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = '同額でも利益を大きく感じる傾向' WHERE id = '376701f6-6cb0-47d6-bc29-e6a0c88c0ab5';
UPDATE quiz_question_options SET option_text = 'リスクを好んで行動する傾向' WHERE id = 'bafa6ec2-066f-46e5-bdcd-18b4417c5ae9';
UPDATE quiz_question_options SET option_text = '将来の利益を軽視する傾向' WHERE id = '77c69e41-244f-4131-a43e-54fc4bed4078';

-- Q-25d88338 (N3): 정답 15자 vs 최단 6자 — 오답 확장
UPDATE quiz_question_options SET option_text = '温かい食べ物の配達サービス' WHERE id = '56e42270-f9b0-4b72-b3a3-fd80e0f53489';
UPDATE quiz_question_options SET option_text = '薬局の医療サービス' WHERE id = 'a26d9c73-5511-461a-ad86-86dc9a837f4d';

-- Q-aa3d5f56 (N1): 정답 15자 vs 최단 6자 — 오답 확장
UPDATE quiz_question_options SET option_text = '株主の短期利益だけ' WHERE id = 'c4f005ff-2462-49c5-84e8-375450764af8';
UPDATE quiz_question_options SET option_text = '経営者の報酬だけ' WHERE id = 'be745928-55d3-4eb2-9438-c99f67ac71ee';
UPDATE quiz_question_options SET option_text = '短期的な利益だけ' WHERE id = '6ef09174-bdf5-4c04-824d-acf85312f6d5';

-- Q-856c1af3 (N1): 정답 25자 vs 최단 10자 — 오답 확장
UPDATE quiz_question_options SET option_text = '多数決が常に正義であるという原則' WHERE id = '7399f5a4-64a0-4cac-a833-9068eb48cbfd';
UPDATE quiz_question_options SET option_text = '個人の自由が絶対的だという考え方' WHERE id = 'd0f89439-2b2f-4ce4-b724-2139fb487026';
UPDATE quiz_question_options SET option_text = 'すべての人に同じ量を分配する原則' WHERE id = '8d881e7f-2a8b-47d0-a760-f166776ad6eb';

-- Q-ad20986a (N2): 정답 17자 vs 최단 7자 — 오답 확장
UPDATE quiz_question_options SET option_text = 'レジ袋の使用がさらに増えた' WHERE id = 'aa00b7fa-d214-4c6d-89a4-0776da42e166';
UPDATE quiz_question_options SET option_text = 'スーパーの売上が減った' WHERE id = '308c9205-935d-47b2-be32-443a8a0ece2e';
UPDATE quiz_question_options SET option_text = '紙袋の利用が主流になった' WHERE id = '1608497f-273b-45a1-82c9-ce064d358ecc';

-- Q-8c65771f (N3): 오답 하나 축약 — 균형
UPDATE quiz_question_options SET option_text = '読み終わったらメモする' WHERE id = 'ed47dd2b-c42a-447a-8de4-5cda04875525';
UPDATE quiz_question_options SET option_text = '半分に折って保管する' WHERE id = '0f4cb77d-71de-4dff-ac42-672c7af9ebb8';

-- Q-f76f9a10 (N1): 정답 12자 vs 최단 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = 'メンバー個人間の競争' WHERE id = '481cc813-4ea0-4d3e-85b5-bb3b4084ff2d';
UPDATE quiz_question_options SET option_text = '管理者からの指示' WHERE id = '86d8fd57-e59f-48cd-9270-8fe6e17fd26a';

-- Q-d596143d (N1): 정답 19자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = '所有消費が再び増加している' WHERE id = 'aa825ba4-6b08-46c6-8db0-ae6f7a637e58';

-- Q-aa8367db (N2): 정답 19자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = 'すべて信頼する前提' WHERE id = 'f8528b0d-1380-499e-902f-593bae34ff1a';
UPDATE quiz_question_options SET option_text = '外部アクセスのみ遮断する' WHERE id = '28bb6166-19fb-4684-b051-3c2ebc3c01a8';

-- Q-054b840b (N3): 정답 28자 vs 최단 12자 — 오답 확장
UPDATE quiz_question_options SET option_text = '外国人に日本文化だけ一方的に教える' WHERE id = 'fe6f808a-3b85-4f6c-b07e-15eb237c1cb0';
UPDATE quiz_question_options SET option_text = '同じ国の人同士だけでまとめて働く' WHERE id = 'af9df61e-31fe-47f9-990a-2c6c499cfd38';
UPDATE quiz_question_options SET option_text = 'ルールをさらに厳格化していく' WHERE id = '80c2469a-8985-424b-b57a-7754bd55a889';

-- Q-bd1a3850 (N2): 정답 7자 (correct shortest) vs avg 12.7 — 정답 확장
UPDATE quiz_question_options SET option_text = '開発スピードの向上' WHERE id = '81fe9dba-05d5-439d-97cb-efd1cdf5fe15';

-- Q-184a5c81 (N3): 정답 18자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = '人が直接手作業で行うこと' WHERE id = '59936a93-aae8-49d3-a918-c8566183232e';
UPDATE quiz_question_options SET option_text = '作業速度を急激に上げること' WHERE id = '7f7b06dc-d400-45a5-ab8e-0c67ea0e1f5d';
UPDATE quiz_question_options SET option_text = 'コストを大幅に減らすこと' WHERE id = 'c8bbf372-1d48-4627-b547-425816300cb0';

-- Q-989c6c10 (N1): 정답 29자 vs 최단 13자 — 오답 확장
UPDATE quiz_question_options SET option_text = '曖昧な表現を完全になくしていくべきだ' WHERE id = '5da2a67f-9a44-4bdb-873b-0382c70f4b20';
UPDATE quiz_question_options SET option_text = '曖昧な表現は日本語固有の長所だ' WHERE id = '2472d52d-4800-4a23-8d6a-0112627e4abe';

-- Q-5a93d478 (N5): 정답 11자 vs 최단 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = '友達と映画を見た' WHERE id = '2c4b3eed-10f9-4979-a5d1-1642ace83ea6';
UPDATE quiz_question_options SET option_text = '友達と買い物をした' WHERE id = 'd8afe454-ef26-4f63-a88f-5d5a31705ee2';

-- Q-59c01561 (N3): 정답 11자 vs 최단 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = '紙の手書き記録' WHERE id = '92e65aff-d3d8-4494-9811-498e7d54f64e';

-- Q-64498aee (N1): 정답 22자 vs 최단 10자 — 오답 확장
UPDATE quiz_question_options SET option_text = '思考は言語とは無関係である' WHERE id = 'ea63fed6-4582-4fd4-9aad-da4f46f51b71';

-- Q-a63b5f6d (N1): 정답 22자 vs 최단 10자 — 오답 확장
UPDATE quiz_question_options SET option_text = '高齢者にスマホを無料配布する' WHERE id = 'fbb99c1a-5bd7-4c11-a47b-5eb3def9201a';
UPDATE quiz_question_options SET option_text = 'デジタル化自体を中止する' WHERE id = 'ca5fe615-16d6-450f-ae38-ff9191a3907d';

-- Q-18ffa6bf (N4): 정답 19자 vs 최단 9자 — 오답 확장
UPDATE quiz_question_options SET option_text = '不動産の契約を勧誘するため' WHERE id = 'ef844448-d343-4751-8532-e6843313d605';

-- Q-65d65ddf (N5): 정답 19자 vs 최단 9자 — 오답 확장
UPDATE quiz_question_options SET option_text = '先生の授業に不満を伝える' WHERE id = '99f50831-6ee0-4e89-a2cd-49b4c30d3a79';
UPDATE quiz_question_options SET option_text = '日本語を全部覚えたと報告' WHERE id = '295a65a4-9462-4497-a4d1-08d14f0df135';

-- Q-a167b64b (N3): 정답 19자 vs 최단 9자 — 오답 확장
UPDATE quiz_question_options SET option_text = '人口が急激に増加すること' WHERE id = '283b1b0a-31c4-4a6b-89b9-9586f845fc93';

-- Q-590a7e10 (N1): 정답 5자 correct-ties — 문항 자연. 오답 "軍事力" 변경으로 명확화
UPDATE quiz_question_options SET option_text = '伝統文化' WHERE id = 'cf834d7e-5667-4470-ae02-0d2ebb2c7b04';
UPDATE quiz_question_options SET option_text = '日本食の魅力' WHERE id = '073bc8fe-00c0-4b2e-8ad9-6aec4640f4cd';
UPDATE quiz_question_options SET option_text = 'もてなしの精神' WHERE id = '9cfc64bb-4781-4da6-ac54-77acde398f3e';

-- Q-f4bc3bf1 (中級): 정답 5자 vs 최장 10자 — 오답 축약
UPDATE quiz_question_options SET option_text = 'Shift-JIS' WHERE id = '1cbfb404-98c9-4d7e-a435-77972f4ea5e3';
UPDATE quiz_question_options SET option_text = 'Latin-1' WHERE id = '444314d0-015e-48fc-9c52-e20a7ccc042c';

-- Q-1d068e59 (N2): 정답 22자 vs 최단 11자 — 오답 확장
UPDATE quiz_question_options SET option_text = '外国人労働者を増やせば一気に解決' WHERE id = '2e6cdb6f-65a6-4e6f-80b9-d25bc53d24ee';
UPDATE quiz_question_options SET option_text = '年金制度そのものを廃止すべきだ' WHERE id = '0dd46fe4-4260-483e-add3-4edc38214426';
UPDATE quiz_question_options SET option_text = '高齢者がもっと長く働けば解決' WHERE id = '653d383d-be82-4f83-b714-7bbb8b1fec7a';

-- Q-d0983cd6 (N3): 정답 24자 vs 최단 12자 — 오답 확장 (미세조정 불필요하지만 길이 차)
UPDATE quiz_question_options SET option_text = '一人で問題を抱え込んで解決すること' WHERE id = '5dfc8323-ecf0-4834-a201-c6a683391f7c';
UPDATE quiz_question_options SET option_text = '上司の指示にだけ黙って従うこと' WHERE id = 'fd4c6821-0a02-405d-8605-e0656bc463c3';
UPDATE quiz_question_options SET option_text = '報告書を大量に書いて残すこと' WHERE id = 'b6153338-d69a-439d-85be-34bf90be96ab';

-- Q-e050ed2b (N3): correct shortest - ties (10자) — BORDERLINE, skip

-- Q-6709a342 (N2): 정답 12자 vs 최단 6자 — 오답 확장
UPDATE quiz_question_options SET option_text = 'テストを毎回省略する' WHERE id = 'a368bcc4-c09e-4c02-b457-59f96be93998';
UPDATE quiz_question_options SET option_text = '全作業を外注に任せる' WHERE id = 'b899bf37-6a05-449c-beda-24c4b6b38ab0';

-- Q-373859b2 (N1): 정답 6자 vs 최단 3자 — 오답 확장
UPDATE quiz_question_options SET option_text = 'ささやかな' WHERE id = '44f5ec55-a791-4724-ba5b-41e7f46c3102';

-- Q-ee2f5c20 (N3): correct shortest 6 vs avg 8.7 — 균형 위해 오답 축약
UPDATE quiz_question_options SET option_text = '夜道が暗い' WHERE id = '70977f2e-0a3f-4fbf-b1df-7062e01d1803';
UPDATE quiz_question_options SET option_text = '子供の遊び場不足' WHERE id = 'ed65afc5-d29e-4dd0-b58d-91ddd5b0c65d';

-- Q-443f0133 (N2): 정답 14자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = '社員の数が大幅に減ったから' WHERE id = '26595225-c29d-4c35-89ef-380ffd7a66d4';

-- Q-bc7b95fb (N2): 정답 14자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = '開発コストが大幅に減る' WHERE id = '318943e6-f08e-4f14-9bf5-f1f3150f13a9';

-- Q-5168521a (N3): 정답 19자 vs 최단 11자 — 오답 확장
UPDATE quiz_question_options SET option_text = '失敗を絶対しないことが最重要だ' WHERE id = 'eb61a28d-662c-4c34-a965-8d146a404056';

-- Q-c1e95ab8 (N3): 정답 20자 vs 최단 12자 — 오답 확장
UPDATE quiz_question_options SET option_text = '外国料理が人気となっていること' WHERE id = '6187550f-8d20-4201-a20b-f7153c58f92f';

-- Q-2d64407c (N1): 정답 12자 vs 최단 6자 — 오답 확장
UPDATE quiz_question_options SET option_text = '計算速度が従来より遅い' WHERE id = '62ba1aef-f2b3-42f4-b5e6-e08331d5da43';
UPDATE quiz_question_options SET option_text = 'コストが非常に安く済む' WHERE id = 'd38be197-392c-4dec-894a-aba4db267dbf';

-- Q-89dc4665 (N2): 정답 13자 vs 최단 7자 — 오답 확장
UPDATE quiz_question_options SET option_text = 'セキュリティが常に完璧' WHERE id = 'fc396cbf-c136-4f54-a759-f254b3830171';
UPDATE quiz_question_options SET option_text = '速度が常時一貫して速い' WHERE id = '48bed432-d14d-45dc-b12a-9417ab0836b4';

-- Q-fc07514f (N2): 정답 13자 vs 최단 8자 — 오답 확장
UPDATE quiz_question_options SET option_text = '会議そのものを省略できる' WHERE id = 'b63f4dbf-a8a9-44a6-a705-99fcaa015a2a';
UPDATE quiz_question_options SET option_text = '運用コストを節約できる' WHERE id = 'ce8fc70e-ed16-422b-bc84-f4abff5d3757';

-- Q-4b3afd14 (N4): 정답 8자 vs 최단 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = '中止になって終わる' WHERE id = 'f995ab02-0ffb-4b95-acb3-ea66fd2ef33c';
UPDATE quiz_question_options SET option_text = '室内会場で行う' WHERE id = 'add93073-f88e-4874-84de-07b911cefc2c';
UPDATE quiz_question_options SET option_text = 'そのまま公園で行う' WHERE id = 'aec2b75d-8d9e-4f44-a298-5bcba0039b55';

-- Q-ec639dc3 (N2): 정답 8자 vs 최단 5자 — 오답 확장
UPDATE quiz_question_options SET option_text = '最近減ってきている' WHERE id = 'b84bd911-1f18-4cad-aeb5-5150a402f9bb';
UPDATE quiz_question_options SET option_text = '突然始まったばかり' WHERE id = '2cf42a98-e199-41fb-a85f-1374bbfe81e6';

-- Q-a2021117 (N3): 정답 19자 vs 최단 12자 — 오답 확장
UPDATE quiz_question_options SET option_text = '大きな声で電話しても構わない' WHERE id = '52efae2d-1355-423d-b4f5-92ec8da71963';
UPDATE quiz_question_options SET option_text = '優先席の近くでのみ静かにする' WHERE id = '131af2f7-61e8-40f4-aa84-a56eac0fef97';
UPDATE quiz_question_options SET option_text = '音楽を大きく聞いても構わない' WHERE id = '9827a1e1-1f1d-43ec-8cff-4934bc3817c6';

-- Q-384a8bbb (N5): 정답 11자 vs 최단 7자 — 미세조정 (N5에서 OK)
UPDATE quiz_question_options SET option_text = '料理を教えてもらう' WHERE id = 'f1f8ed01-5fed-4baa-ba50-ee275bf994c8';

-- Q-a6305dc9 (N3): 정답 11자 (ties with distractor) vs 최단 7자 — 미세조정
UPDATE quiz_question_options SET option_text = '改まって丁寧に話す表現' WHERE id = '4b22e223-4091-41e5-8b13-253194a0a7b7';

-- Q-ca7a2346 (N2): 정답 22자 vs 최단 14자 — 미세조정
UPDATE quiz_question_options SET option_text = '能力に応じて給与が決まる制度' WHERE id = '4c528510-6495-4da1-9eec-c7e996ca9fdf';

-- Q-e62b557f (N1): 정답 17자 vs 최단 11자 — 미세조정
UPDATE quiz_question_options SET option_text = '行政の支援だけで十分に対応できる' WHERE id = '59b72746-22be-4b3d-afb5-90dc5b25f91f';

-- ============================================================
-- P2 Block — B6 표기 통일 (Q-78e26c1c: 1/3 → 3分の1)
-- Rubric 해소: B6 (표기 일관성)
-- ============================================================

-- Q-78e26c1c (N2): 전 선택지 「1/3」 → 「3分の1」 통일
UPDATE quiz_question_options SET option_text = '商品の3分の1を割引するルール' WHERE id = 'e3b67bc4-42a2-4d40-9a84-a880ab3ee487';
UPDATE quiz_question_options SET option_text = '賞味期限の3分の1が過ぎると納品できないルール' WHERE id = '0f7555e3-d765-4bab-9185-cb316eccc9df';
UPDATE quiz_question_options SET option_text = '食品の3分の1は捨ててもいいルール' WHERE id = '39bd21c5-13c3-4236-9b14-5583f3d2db38';
UPDATE quiz_question_options SET option_text = '価格の3分の1を寄付するルール' WHERE id = '3c11cd97-cbeb-4185-9f21-74a564ce1f31';
