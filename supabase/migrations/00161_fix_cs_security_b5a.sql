-- 00161_fix_cs_security_b5a.sql
-- CS security B5-a 길이편향 수정
-- 생성일: 2026-04-06
-- CONFIRMED: 100건 / DISMISSED: 2건 / UPDATE: 93건
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 패딩으로 정답=최장 패턴 해소.

BEGIN;

-- Q-e3a0d5f6: 重要な情報を識別するために最初に行うべきことは何か。 [MANUAL: correct=shortest]
-- correct=27, dist=[31,29,27]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-b3272efb: 私用PC等の電子機器を作業場所に持ち込むことについて正しいものはどれか。 [ratio fix]
-- ratio=1.28, min=18→31, max=23
UPDATE quiz_question_options SET option_text = '上司に口頭で伝えれば自由に持ち込めることを目的とした手法である'
WHERE id = 'e76e5d4c-952b-44e3-8f69-8febf1fa2d6d';

-- Q-3d4a0758: 公衆Wi-Fiの利用に関するルールとして正しいものはどれか。 [ratio fix]
-- ratio=2.11, min=9→18, max=19
UPDATE quiz_question_options SET option_text = '緊急時のみ利用可能であるとされている'
WHERE id = '4f2c5095-8943-4079-aa1e-9336ea8f4b96';

-- Q-32300579: AIシステムのプロンプトに入力してはいけない情報はどれか。 [ratio fix]
-- ratio=1.67, min=9→23, max=15
UPDATE quiz_question_options SET option_text = '公開情報の翻訳依頼として知られている手法である'
WHERE id = '25500c2a-e124-4781-aaca-ec147ae24a9c';

-- Q-896f9b06: 重要な情報をメールで送信する際の正しい方法はどれか。
-- correct=24, dist=[18,15,12] → pad longest dist 18→26
UPDATE quiz_question_options SET option_text = 'CCに上司を入れれば本文に書いてよいことが前提である'
WHERE id = '3f92d74a-ad0a-4cc8-a94c-a09063a3888c';

-- Q-4de43b00: 重要な情報を持ち出す場合に必要な手続きはどれか。
-- correct=16, dist=[16,14,12] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = '翌日に返却すれば自由に持ち出せることを目的とした手法である'
WHERE id = '6204e130-8c3e-4761-b932-3cc155d157cd';

-- Q-3a949e0b: PC等の電子機器に重要な情報を格納する場合に必要な措置はどれか。
-- correct=16, dist=[14,14,11] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'ファイル名を分かりにくくすることを目的とした手法である'
WHERE id = 'f8c861b2-9922-4a97-83f5-06e72e919598';

-- Q-d3bd93c4: 業務で使用するデバイスのローカルディスクに関するルールはどれか。 [ratio fix]
-- ratio=1.73, min=11→19, max=19
UPDATE quiz_question_options SET option_text = '一時的な保管は問題ないことが前提である'
WHERE id = 'e54862a8-73e5-45ae-95e9-e72633fc280b';

-- Q-056634a9: メールのプレビューウィンドウ機能について正しいものはどれか。
-- correct=18, dist=[18,16,14] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = '信頼できる送信者のメールのみ利用することを目的とした手法である'
WHERE id = '5726229a-c285-4d1a-8037-7efa6474f39a';

-- Q-6c9fdaf2: メールの形式として推奨されるものはどれか。 [MANUAL: correct=shortest]
-- correct=6, dist=[13,12,9]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-41baa4cb: 受信したメールの添付ファイルに対する正しい対応はどれか。 [MANUAL: correct=shortest]
-- correct=16, dist=[22,19,17]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-408cfd99: 重要な情報が入ったPCを廃棄する際の正しい手順はどれか。
-- correct=36, dist=[22,16,16] → pad longest dist 22→35
UPDATE quiz_question_options SET option_text = 'ハードディスクを取り出してから本体を廃棄するとして一般的に知られている'
WHERE id = '64d8cd34-971d-4904-9fe6-1426899db838';

-- Q-4bcd0bb9: 重要な情報を発送する際に守るべきルールとして正しいものはどれか。
-- correct=27, dist=[21,16,13] → pad longest dist 21→29
UPDATE quiz_question_options SET option_text = '受取人に発送を事前連絡すれば普通郵便でよいことが前提である'
WHERE id = '2b5a511b-f3b3-4ba3-844b-024e9a0c15b7';

-- Q-50264220: 電車内で重要な情報の入ったバッグの取り扱いとして正しいものはどれか。
-- correct=20, dist=[13,10,10] → pad longest dist 13→23
UPDATE quiz_question_options SET option_text = 'チャックを閉めて足元に置くことが主な特徴である'
WHERE id = '18130bc5-fc6a-4d9b-b339-66ec45036871';

-- Q-c38f5b95: 会社が指定していないAIシステムの業務利用について正しいものはどれか。
-- correct=24, dist=[17,17,13] → pad longest dist 17→25
UPDATE quiz_question_options SET option_text = '個人情報を入力しなければ使ってよいことが前提である'
WHERE id = 'e5e1dc52-ce3e-4c86-91a1-e1573f37b2fc';

-- Q-e701c690: AIシステムの出力結果を利用する際に確認すべき事項はどれか。
-- correct=23, dist=[13,13,12] → pad longest dist 13→27
UPDATE quiz_question_options SET option_text = '出力されたコードの実行速度として知られている手法である'
WHERE id = 'b4dd3c33-73b9-4635-8393-19be2e969fb1';

-- Q-a11c2464: 情報インフラの「不正使用」に該当する行為はどれか。 [ratio fix]
-- ratio=1.78, min=9→18, max=16
UPDATE quiz_question_options SET option_text = '業務メールの送受信であるとされている'
WHERE id = '500e1741-7e5f-4e3b-b9c6-a1784db0f3c0';

-- Q-772974b9: お客様より貸与されていた資産（身分証、PC等）の取り扱いとして正しいものはどれか [MANUAL: correct=shortest]
-- correct=7, dist=[16,13,13]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-d89f3f87: 業務遂行上、情報を持ち帰る必要がある場合の正しい手順はどれか。
-- correct=21, dist=[17,17,14] → pad longest dist 17→25
UPDATE quiz_question_options SET option_text = '翌朝までに返却すれば持ち帰ってよいことが前提である'
WHERE id = '4a4cde25-41dc-483a-8f37-48dee45d4cda';

-- Q-015424a4: 指定されたメール・ブラウザ以外のソフトウェアの使用について正しいものはどれか。
-- correct=20, dist=[16,16,13] → pad longest dist 16→24
UPDATE quiz_question_options SET option_text = '業務効率が上がるなら使用してよいことが前提である'
WHERE id = '7cc238d4-e4b1-4012-9702-09384556f789';

-- Q-cf1bef42: 電子データを記憶媒体に保管して発送する場合に必要な措置はどれか。 [ratio fix]
-- ratio=2.00, min=11→19, max=22
UPDATE quiz_question_options SET option_text = '配達記録だけ残せばよいことが前提である'
WHERE id = '92b4388c-dd34-4c6e-9457-904094fa16ab';

-- Q-41b5ba22: 重要な情報の入ったPC等を飛行機で運ぶ場合の正しい取り扱いはどれか。 [ratio fix]
-- ratio=1.42, min=12→25, max=17
UPDATE quiz_question_options SET option_text = '事前に宅配便で送っておくことを目的とした手法である'
WHERE id = '1373dea6-a819-497f-a392-9a7cf63fae28';

-- Q-5adf8758: 「チェーンメール」を受信した場合の正しい対応はどれか。 [MANUAL: correct=shortest]
-- correct=10, dist=[14,13,12]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-80cddb7b: 貸与されたメールアドレスの取り扱いとして正しいものはどれか。
-- correct=21, dist=[19,15,15] → pad longest dist 19→25
UPDATE quiz_question_options SET option_text = '個人のSNSプロフィールに記載してよいとされている'
WHERE id = 'd4576949-6019-4bb8-ba84-bf8d22312579';

-- Q-527fb0c7: 駅やホテルのロビーでバッグを扱う際の正しい行動はどれか。 [ratio fix]
-- ratio=2.00, min=8→18, max=16
UPDATE quiz_question_options SET option_text = 'フロントに預けることが主な特徴である'
WHERE id = '2c1c45ad-9ead-4f4b-a2a4-d79ed4298a10';

-- Q-4a489dcb: 情報の取扱いに関する「あらかじめ認められた情報以外にはアクセスしない」ルールの意
-- correct=31, dist=[20,20,19] → pad longest dist 20→33
UPDATE quiz_question_options SET option_text = '自分の部署の情報には自由にアクセスできることを目的とした手法である'
WHERE id = '76acfeb4-3197-4209-a3ac-cacff0709b0e';

-- Q-c9405ffe: 業務で発生したデータや書類の無断廃棄について正しいものはどれか。 [MANUAL: correct=shortest]
-- correct=15, dist=[19,19,18]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-15627f2c: 情報インフラの「私的使用」に該当するものはどれか。
-- correct=18, dist=[17,13,11] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = '業務に必要な技術資料のダウンロードとして知られている手法である'
WHERE id = '6a2c771a-0b5d-4328-bf67-2631f2c57041';

-- Q-969e8830: 重要な情報に関する「バックアップ」の保管場所として正しいものはどれか。
-- correct=21, dist=[17,12,9] → pad longest dist 17→26
UPDATE quiz_question_options SET option_text = 'デスクトップPCのローカルディスクであるとされている'
WHERE id = '5f23eff8-ca5a-426b-82ec-a122008a7912';

-- Q-7c4f9483: 業務上不要となった情報の書類・電子データの正しい処理はどれか。 [ratio fix]
-- ratio=1.60, min=10→18, max=16
UPDATE quiz_question_options SET option_text = '自分で判断して捨てる手法のことである'
WHERE id = '6c9221fd-7f9f-4239-b189-e8c9495ba086';

-- Q-0c55e93c: 重要な情報を業務遂行に必要な範囲を超えて複製することについて正しいものはどれか。 [ratio fix]
-- ratio=1.25, min=12→25, max=15
UPDATE quiz_question_options SET option_text = '社内なら自由に複製できることを目的とした手法である'
WHERE id = '6a86a29c-933d-4853-8f95-f9691fa1bb18';

-- Q-b6391d66: お客様の情報を取り扱う際の基本ルールとして正しいものはどれか。 [MANUAL: correct=shortest]
-- correct=12, dist=[15,12,12]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-53e0dbcd: 共通鍵暗号方式の特徴として正しいものはどれか。 [ratio fix]
-- ratio=1.45, min=11→24, max=16
UPDATE quiz_question_options SET option_text = '一方向にのみ変換できることを目的とした手法である'
WHERE id = 'ff57defc-eedd-4b23-ba8f-96b0646707b1';

-- Q-c24e0038: HTTPSの説明として正しいものはどれか。
-- correct=25, dist=[22,13,9] → pad longest dist 22→36
UPDATE quiz_question_options SET option_text = 'HTTPにキャッシュ機能を追加したプロトコルとして知られている手法である'
WHERE id = '7e7dbf74-e6c8-4232-a384-4e52ebab282c';

-- Q-5295ae37: ハッシュ関数の特徴として正しいものはどれか。
-- correct=24, dist=[18,18,15] → pad longest dist 18→28
UPDATE quiz_question_options SET option_text = '入力の長さに応じて出力の長さが変わることが主な特徴である'
WHERE id = '17bd8047-0c32-4ddb-bff4-823d99aea20f';

-- Q-77ffee90: ファイアウォールの基本的な役割として正しいものはどれか。
-- correct=25, dist=[14,13,13] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'データを暗号化して送受信することを目的とした手法である'
WHERE id = '93a0dcf2-ae43-44c8-8fd7-0b06f71ec38d';

-- Q-b97ded89: パスワードの安全な保存方法として正しいものはどれか。
-- correct=23, dist=[17,13,9] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'Base64エンコードして保存することが主な目的である'
WHERE id = 'd9e99a7e-423b-41e5-a6a0-938255ad4f13';

-- Q-bfd2aa49: VPN（Virtual Private Network）の主な目的として正しいも
-- correct=24, dist=[19,17,17] → pad longest dist 19→29
UPDATE quiz_question_options SET option_text = 'データベースのバックアップを自動化することが主な目的である'
WHERE id = '79557a47-13e4-4032-b3f5-b8b8ec0313df';

-- Q-1983a585: 公開鍵暗号方式でデータを暗号化して送信する場合、使用する鍵の組み合わせとして正し
-- correct=22, dist=[22,22,16] → pad longest dist 22→36
UPDATE quiz_question_options SET option_text = '送信者の公開鍵で暗号化、受信者の秘密鍵で復号として知られている手法である'
WHERE id = '64cc2706-40ea-42e6-9689-5168d89fb2e6';

-- Q-e6c3468b: SSL/TLSハンドシェイクの過程で行われないものはどれか。
-- correct=15, dist=[10,9,9] → pad longest dist 10→19
UPDATE quiz_question_options SET option_text = 'サーバー証明書の検証であるとされている'
WHERE id = 'a6c518e4-1f65-457d-b4da-08c6385322ac';

-- Q-a1c79dd5: クロスサイトスクリプティング（XSS）の対策として最も基本的なものはどれか。 [ratio fix]
-- ratio=1.80, min=10→18, max=18
UPDATE quiz_question_options SET option_text = 'HTTPSを使用する処理のことである'
WHERE id = '12c9c07d-c5d1-490a-b337-761689ea0cc2';

-- Q-84311e32: CSRF（Cross-Site Request Forgery）の対策として正し
-- correct=22, dist=[17,15,14] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'プリペアドステートメントを使用することが主な目的である'
WHERE id = 'c7c59847-78eb-4f20-bd60-dd679ba0f969';

-- Q-17f32ec7: OAuth 2.0の説明として正しいものはどれか。
-- correct=33, dist=[20,20,16] → pad longest dist 20→34
UPDATE quiz_question_options SET option_text = 'パスワードを暗号化して保存するための規格として知られている手法である'
WHERE id = '448ea9d6-6cd8-4670-a534-bef4bcaa8092';

-- Q-ec3880a5: JWT（JSON Web Token）の構造として正しいものはどれか。 [ratio fix]
-- ratio=1.60, min=15→24, max=24
UPDATE quiz_question_options SET option_text = '公開鍵 + 秘密鍵 + 証明書であるとされている'
WHERE id = '8b8274ef-cbfe-4679-9e50-4d2672331475';

-- Q-d700383b: デジタル署名の目的として正しいものはどれか。 [ratio fix]
-- ratio=1.31, min=13→26, max=17
UPDATE quiz_question_options SET option_text = 'パスワードを安全に保存することを目的とした手法である'
WHERE id = '86aab032-51f4-435f-9e05-df7030395e52';

-- Q-411ca18b: 二要素認証（2FA）の「二要素」に含まれない組み合わせはどれか。 [ratio fix]
-- ratio=1.92, min=12→24, max=23
UPDATE quiz_question_options SET option_text = 'パスワード + 指紋認証に該当する処理方式である'
WHERE id = 'e4a05120-adcf-47ed-913a-1ce0de4c2518';

-- Q-390a4b30: Content-Security-Policy（CSP）ヘッダーの目的として正し
-- correct=21, dist=[16,15,15] → pad longest dist 16→26
UPDATE quiz_question_options SET option_text = 'CORSの許可ドメインを指定することが主な目的である'
WHERE id = 'f1cd62fc-886b-44f1-b4b4-1951820941e7';

-- Q-7b3a4ca8: SHA-256の説明として正しいものはどれか。
-- correct=26, dist=[22,20,19] → pad longest dist 22→27
UPDATE quiz_question_options SET option_text = '最大256文字のパスワードに対応する認証方式に該当する'
WHERE id = 'f0ae436d-b5ed-4eca-8ad5-81a907eea835';

-- Q-8a681a12: CORS（Cross-Origin Resource Sharing）の説明とし
-- correct=26, dist=[19,19,17] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'SQLインジェクションを防止する仕組みに該当する処理方式である'
WHERE id = '8178fa59-99db-42e6-96ce-d72305decbb1';

-- Q-c20a4e11: セッション固定攻撃（Session Fixation）の対策として正しいものはど
-- correct=19, dist=[17,13,10] → pad longest dist 17→30
UPDATE quiz_question_options SET option_text = 'パスワードをハッシュ化して保存することを目的とした手法である'
WHERE id = '007e3d05-e555-492c-ad1a-52217ad49808';

-- Q-f3925d7b: PKI（Public Key Infrastructure）における認証局（CA
-- correct=23, dist=[16,15,12] → pad longest dist 16→26
UPDATE quiz_question_options SET option_text = 'ファイアウォールの設定を管理することが主な目的である'
WHERE id = '3c4a5eaa-e2de-4cc1-9ca3-5f13948c4fc0';

-- Q-18e107e1: TLS 1.3における改善点として正しいものはどれか。
-- correct=33, dist=[20,19,13] → pad longest dist 20→34
UPDATE quiz_question_options SET option_text = 'SSL 3.0との後方互換性が追加されたとして知られている手法である'
WHERE id = '5debb042-21a2-4f50-aece-8f9fb87d3626';

-- Q-2ff05045: Stored XSS（格納型XSS）の説明として正しいものはどれか。 [ratio fix]
-- ratio=1.50, min=22→31, max=33
UPDATE quiz_question_options SET option_text = 'CSSを悪用してページの表示を改ざんする攻撃であるとされている'
WHERE id = '3ff5eeb0-f8a9-41fe-87c2-544f2c8c4774';

-- Q-eaec6198: レインボーテーブル攻撃の対策として最も効果的なものはどれか。 [ratio fix]
-- ratio=2.08, min=12→25, max=25
UPDATE quiz_question_options SET option_text = 'ハッシュを複数回繰り返すことを目的とした手法である'
WHERE id = 'bf78a03d-7a6b-46bd-8615-66a9992789d2';

-- Q-b2cd85ba: パスワードの管理方法として最も適切なものはどれか。 [ratio fix]
-- ratio=1.44, min=18→26, max=26
UPDATE quiz_question_options SET option_text = '短くて覚えやすいパスワードを設定する処理のことである'
WHERE id = '168650f5-84e7-45e3-a5b1-46022476f0ac';

-- Q-e7beab20: OAuth 2.0の認可コードフロー（Authorization Code Fl
-- correct=18, dist=[12,12,10] → pad longest dist 12→21
UPDATE quiz_question_options SET option_text = 'リフレッシュトークンのみであるとされている'
WHERE id = 'cdbc9587-b547-4e3c-9add-89a62551d75f';

-- Q-c265d98b: ゼロデイ脆弱性の説明として正しいものはどれか。
-- correct=19, dist=[17,15,14] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = '発見から0日以内に修正された脆弱性として知られている手法である'
WHERE id = '0400c724-d2fe-49f0-abb4-34df8532ae3e';

-- Q-92886d09: セキュアコーディングにおける入力検証の原則として正しいものはどれか。
-- correct=32, dist=[22,17,16] → pad longest dist 22→35
UPDATE quiz_question_options SET option_text = 'ブラックリスト方式で危険な文字をフィルタすることを目的とした手法である'
WHERE id = '9cec2c65-ce00-4008-a76f-41320f4d095e';

-- Q-d8252931: HSTS（HTTP Strict Transport Security）の説明と
-- correct=34, dist=[23,21,14] → pad longest dist 23→37
UPDATE quiz_question_options SET option_text = 'HTTPとHTTPSを自動的に切り替える仕組みとして知られている手法である'
WHERE id = '505ea279-da84-4f25-af53-f63f8721a4b6';

-- Q-f2d54c4d: OWASP Top 10に含まれないカテゴリはどれか。
-- correct=13, dist=[11,8,5] → pad longest dist 11→25
UPDATE quiz_question_options SET option_text = 'セキュリティの設定ミスとして知られている手法である'
WHERE id = '4dfa2b3f-e358-4c56-9d9d-41530d71536d';

-- Q-b36737da: 中間者攻撃（Man-in-the-Middle）を防ぐための技術として最も効果的
-- correct=19, dist=[14,12,11] → pad longest dist 14→23
UPDATE quiz_question_options SET option_text = 'IPアドレスのフィルタリングであるとされている'
WHERE id = '4595b49b-24ea-47f7-b0e3-0204a1077e4f';

-- Q-72e29209: JWTの「alg: none」脆弱性の説明として正しいものはどれか。
-- correct=29, dist=[29,27,20] → pad longest dist 29→43
UPDATE quiz_question_options SET option_text = 'ペイロードに大量のデータを含めてサーバーを過負荷にする攻撃として知られている手法である'
WHERE id = 'c21e917a-4393-422d-a2f8-7b4c75041e9b';

-- Q-dd2cb0d8: 脆弱性スキャンとペネトレーションテストの違いとして正しいものはどれか。
-- correct=38, dist=[35,31,13] → pad longest dist 35→49
UPDATE quiz_question_options SET option_text = '脆弱性スキャンはネットワーク、ペネトレーションテストはアプリのみが対象として知られている手法である'
WHERE id = '8406f96d-69ec-48f3-912e-fdf69ee65b1d';

-- Q-2881d971: ソーシャルエンジニアリングの説明として正しいものはどれか。
-- correct=24, dist=[17,14,11] → pad longest dist 17→29
UPDATE quiz_question_options SET option_text = 'ソフトウェアの脆弱性を攻撃する手法の一種として知られている'
WHERE id = 'f605e545-ecc3-4b0f-95b9-25233031b5fb';

-- Q-67d77013: 情報セキュリティポリシーの説明として正しいものはどれか。
-- correct=25, dist=[16,10,9] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'ウイルス対策ソフトの設定ファイルとして知られている手法である'
WHERE id = '65ea79d3-fb1d-4b91-a844-95aaa0985934';

-- Q-900d752c: スパムメールの説明として正しいものはどれか。
-- correct=21, dist=[12,10,9] → pad longest dist 12→26
UPDATE quiz_question_options SET option_text = 'ウイルスに感染したメールとして知られている手法である'
WHERE id = 'e39e5b5e-543e-45c7-8807-cfebe1c7c0c5';

-- Q-b30fae2a: 個人情報保護法の目的として正しいものはどれか。
-- correct=27, dist=[15,15,15] → pad longest dist 15→28
UPDATE quiz_question_options SET option_text = 'コンピュータウイルスを規制することを目的とした手法である'
WHERE id = 'eae05687-b69c-456f-9e66-23769a1afc40';

-- Q-0a324bcd: 情報セキュリティにおける「機密性」の説明として正しいものはどれか。
-- correct=21, dist=[18,17,16] → pad longest dist 18→26
UPDATE quiz_question_options SET option_text = '誰が情報にアクセスしたか記録することが求められている'
WHERE id = '32d47941-a83c-4eed-8382-8e43ea690e59';

-- Q-283e8893: ファイアウォールの役割として正しいものはどれか。
-- correct=26, dist=[14,13,12] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'ネットワーク速度を向上させることを目的とした手法である'
WHERE id = 'fd9c37c0-2f5c-471b-929b-28460de41470';

-- Q-e2c26b96: ハッシュ法の衝突解決方法であるチェイン法の説明として正しいものはどれか。
-- correct=22, dist=[22,20,19] → pad longest dist 22→35
UPDATE quiz_question_options SET option_text = '空いているハッシュ値の場所にデータを格納することを目的とした手法である'
WHERE id = '9b9ea8c9-6b76-44dd-962c-9042adfb26bc';

-- Q-12e83a12: 暗号化の説明として正しいものはどれか。
-- correct=21, dist=[17,16,16] → pad longest dist 17→26
UPDATE quiz_question_options SET option_text = 'データのバックアップを作成する技術であるとされている'
WHERE id = 'c6752719-c151-45ab-b73c-bb74bce011bb';

-- Q-5f414647: VPNの説明として正しいものはどれか。
-- correct=30, dist=[15,12,11] → pad longest dist 15→28
UPDATE quiz_question_options SET option_text = '物理的な専用回線を敷設する技術として一般的に知られている'
WHERE id = 'fcced1f1-d958-40c1-8cd9-7d7384e59ab0';

-- Q-1e97a90c: デジタル署名の目的として正しいものはどれか。
-- correct=16, dist=[11,7,6] → pad longest dist 11→20
UPDATE quiz_question_options SET option_text = 'ネットワーク速度の向上であるとされている'
WHERE id = '99635edd-c122-4834-8029-e98c13dc9487';

-- Q-072a76df: AES暗号の特徴として正しいものはどれか。 [ratio fix]
-- ratio=2.50, min=6→15, max=15
UPDATE quiz_question_options SET option_text = 'ハッシュ関数であるとされている'
WHERE id = '40d21d28-1872-4570-a1a3-9887ba22e9ee';

-- Q-158ddbe8: RSA暗号の特徴として正しいものはどれか。
-- correct=20, dist=[9,7,6] → pad longest dist 9→21
UPDATE quiz_question_options SET option_text = 'ストリーム暗号方式の一種として知られている'
WHERE id = 'f755f394-6e15-41be-96bf-3f873a31b7c0';

-- Q-c0d9eec2: フィッシング攻撃の説明として正しいものはどれか。
-- correct=24, dist=[21,17,17] → pad longest dist 21→35
UPDATE quiz_question_options SET option_text = 'ネットワークに大量のデータを送りつける攻撃として知られている手法である'
WHERE id = 'ed478efd-b3e4-4d74-a172-fb9382195c6a';

-- Q-57e29061: 二要素認証の説明として正しいものはどれか。
-- correct=23, dist=[19,16,14] → pad longest dist 19→24
UPDATE quiz_question_options SET option_text = '2つのデバイスで同時にログインする方式に該当する'
WHERE id = 'bff61b57-6fa8-40dc-97a3-2d4934e71ace';

-- Q-58d639e2: クロスサイトスクリプティング（XSS）の説明として正しいものはどれか。
-- correct=35, dist=[20,18,13] → pad longest dist 20→33
UPDATE quiz_question_options SET option_text = 'ファイルを暗号化して身代金を要求する攻撃として一般的に知られている'
WHERE id = '12b0efb9-29c6-4c7a-ac0f-5a76ef90a684';

-- Q-bb973153: CSRF（クロスサイトリクエストフォージェリ）の説明として正しいものはどれか。
-- correct=29, dist=[19,15,14] → pad longest dist 19→33
UPDATE quiz_question_options SET option_text = 'Webサイトにスクリプトを埋め込む攻撃として知られている手法である'
WHERE id = '8218fe45-0f0e-4293-815c-036469208cd9';

-- Q-0909aee6: 不正アクセス禁止法で禁止されている行為はどれか。
-- correct=30, dist=[20,15,11] → pad longest dist 20→34
UPDATE quiz_question_options SET option_text = '公開されているWebサイトを閲覧する行為として知られている手法である'
WHERE id = '4e901a05-6b95-4a8d-a8a5-3a94468b5e40';

-- Q-09f21c86: ウイルス対策ソフトの機能として正しいものはどれか。
-- correct=17, dist=[17,13,12] → pad longest dist 17→30
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度を向上させることを目的とした手法である'
WHERE id = '6eb654bb-8c6d-4481-9b9d-56df41223f7e';

-- Q-17689073: ゼロデイ攻撃の説明として正しいものはどれか。
-- correct=19, dist=[14,9,9] → pad longest dist 14→23
UPDATE quiz_question_options SET option_text = '0時ちょうどに実行される攻撃であるとされている'
WHERE id = '6369b978-e284-4d63-93fd-16a2b44269a2';

-- Q-1ad64e11: セキュリティパッチの説明として正しいものはどれか。
-- correct=22, dist=[12,11,10] → pad longest dist 12→26
UPDATE quiz_question_options SET option_text = 'ウイルス対策ソフトの名称として知られている手法である'
WHERE id = '1a4b6083-d380-4f8c-b997-181bcd6aca3c';

-- Q-4777a3e5: トロイの木馬の説明として正しいものはどれか。
-- correct=27, dist=[24,23,16] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = '自己複製して他のコンピュータに感染するマルウェアとして知られている手法である'
WHERE id = 'b7fe4809-0595-424a-a3c7-9175d498c0e7';

-- Q-50f3c0f0: SSLサーバー証明書の役割として正しいものはどれか。
-- correct=28, dist=[14,10,9] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'ファイルのバックアップを取るとして一般的に知られている'
WHERE id = 'f25f1745-eafc-4770-b523-fec9cbc0c56a';

-- Q-665d43f9: マルウェアの説明として正しいものはどれか。
-- correct=26, dist=[14,11,8] → pad longest dist 14→28
UPDATE quiz_question_options SET option_text = 'セキュリティ対策ソフトの総称として知られている手法である'
WHERE id = '829512c4-7da9-42e6-8808-8e948558cf82';

-- Q-829ec65f: アクセス権の設定の目的として正しいものはどれか。
-- correct=23, dist=[18,16,14] → pad longest dist 18→28
UPDATE quiz_question_options SET option_text = 'すべてのユーザーに同じ権限を付与することが主な目的である'
WHERE id = '1cb1541e-ef02-4d8f-959c-35b5496c7621';

-- Q-5190d26a: DDoS攻撃の説明として正しいものはどれか。
-- correct=34, dist=[19,18,17] → pad longest dist 19→32
UPDATE quiz_question_options SET option_text = 'USBメモリでウイルスを感染させる攻撃として一般的に知られている'
WHERE id = '18e2c751-f060-490a-b631-f59cde6fa450';

-- Q-77949c87: IDS（侵入検知システム）の説明として正しいものはどれか。
-- correct=23, dist=[23,17,13] → pad longest dist 23→37
UPDATE quiz_question_options SET option_text = '不正アクセスを検知して自動的に遮断するシステムとして知られている手法である'
WHERE id = 'e9c1142c-0da5-477a-b418-414f56fec2cf';

-- Q-8b19f193: ペネトレーションテストの説明として正しいものはどれか。
-- correct=28, dist=[18,16,16] → pad longest dist 18→30
UPDATE quiz_question_options SET option_text = 'ハードウェアの耐久性をテストする手法の一種として知られている'
WHERE id = 'e759f03c-06aa-4a06-9f86-6d185f425ef2';

-- Q-a2bf76e6: セッションハイジャックの説明として正しいものはどれか。
-- correct=24, dist=[17,17,15] → pad longest dist 17→29
UPDATE quiz_question_options SET option_text = 'セッション中の通信を暗号化する技術に該当する処理方式である'
WHERE id = '0efa5c57-26ed-4c9e-8bb2-6b0336658072';

-- Q-e40a6bcb: ブルートフォース攻撃の説明として正しいものはどれか。
-- correct=21, dist=[17,15,13] → pad longest dist 17→26
UPDATE quiz_question_options SET option_text = '辞書に載っている単語だけを試す攻撃であるとされている'
WHERE id = '8411851a-23a7-4ccb-87f9-e3282256d105';

-- Q-e82bacc7: ISMS（情報セキュリティマネジメントシステム）の国際規格はどれか。
-- correct=13, dist=[13,9,8] → pad longest dist 13→27
UPDATE quiz_question_options SET option_text = 'ISO/IEC 20000として知られている手法である'
WHERE id = '4eb2248b-88fd-4301-9c54-41079d61a873';

-- Q-f4cae4c3: ランサムウェアの説明として正しいものはどれか。
-- correct=22, dist=[21,20,15] → pad longest dist 21→35
UPDATE quiz_question_options SET option_text = 'データを自動でバックアップするソフトウェアとして知られている手法である'
WHERE id = '3c399ff8-9c6c-4724-b3ec-9760e43d8500';

-- Q-896270d4: ハッシュ関数の特徴として正しいものはどれか。
-- correct=26, dist=[19,18,12] → pad longest dist 19→29
UPDATE quiz_question_options SET option_text = '入力データの長さに応じて出力長が変わることが主な特徴である'
WHERE id = '0ee72f1e-2cc5-4ec2-a270-df0af5dfed2a';

-- Q-af76b081: SSL/TLSにおけるハイブリッド暗号方式の説明として正しいものはどれか。
-- correct=26, dist=[17,17,16] → pad longest dist 17→30
UPDATE quiz_question_options SET option_text = '公開鍵暗号のみでデータを暗号化することを目的とした手法である'
WHERE id = 'd46f8b29-8bd8-4bd7-99c3-79d1891381f5';

-- Q-d8d4b83b: PKI（公開鍵基盤）の説明として正しいものはどれか。
-- correct=19, dist=[16,14,12] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'ファイアウォールを管理する仕組みとして知られている手法である'
WHERE id = 'bc602aad-bd9e-46c8-a463-e9515dced874';

-- Q-e4d2a050: 公開鍵暗号方式の特徴として正しいものはどれか。
-- correct=19, dist=[15,15,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = '暗号化と復号に同じ鍵を使用する処理のことである'
WHERE id = 'fd9917fc-6bdf-4ed2-a5bd-0aa11ea04485';

-- Q-50993547: ハッシュ法における衝突（コリジョン）の説明として正しいものはどれか。
-- correct=18, dist=[18,16,15] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = 'ハッシュ関数の計算に時間がかかることが前提条件として必要である'
WHERE id = '00596048-7e05-41d2-91b2-b3b21e444efc';

-- Q-bbdb80a4: テレワーク時に禁止されている行為として正しくないものはどれか。
-- correct=14, dist=[12,10,10] → pad longest dist 12→25
UPDATE quiz_question_options SET option_text = '公衆Wi-Fiに接続することを目的とした手法である'
WHERE id = '59012ff6-174b-4bd6-81eb-bc9748c8c684';

COMMIT;