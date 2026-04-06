-- 00160_fix_cs_database_b5a.sql
-- CS database B5-a 길이편향 수정
-- 생성일: 2026-04-06
-- CONFIRMED: 74건 / DISMISSED: 0건 / UPDATE: 71건
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 패딩으로 정답=최장 패턴 해소.

BEGIN;

-- Q-87b1cb20: SQLのINSERT文の用途として正しいものはどれか。
-- correct=16, dist=[14,13,9] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'テーブルからデータを検索することを目的とした手法である'
WHERE id = 'c6f51b26-a641-4990-b155-cf790ca9274f';

-- Q-41a92946: SQLでテーブルの全カラムを取得する文として正しいものはどれか。 [ratio fix]
-- ratio=1.25, min=16→30, max=20
UPDATE quiz_question_options SET option_text = 'GET * FROM usersとして知られている手法である'
WHERE id = 'd63481d2-bc98-4893-a2af-b3cc63d2a007';

-- Q-e913fe04: SQLのWHERE句の役割として正しいものはどれか。
-- correct=13, dist=[12,10,9] → pad longest dist 12→25
UPDATE quiz_question_options SET option_text = 'カラムの表示順を指定することを目的とした手法である'
WHERE id = 'dcbeea90-c340-4a76-bf9b-7586c17efb4a';

-- Q-f3c51c4d: 主キー（PRIMARY KEY）の制約として正しいものはどれか。
-- correct=19, dist=[16,16,14] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'NULL値を許容するが重複は不可として知られている手法である'
WHERE id = '6f84c360-819b-4bad-a262-a1221f3d91d1';

-- Q-c7cfae02: RDBMSの説明として正しいものはどれか。 [ratio fix]
-- ratio=1.44, min=18→32, max=26
UPDATE quiz_question_options SET option_text = 'データをグラフ構造で管理するシステムとして知られている手法である'
WHERE id = 'dca6f3c0-ce9f-4ea6-9bb6-d3d9a8eade8e';

-- Q-9e215d8e: INNER JOINの説明として正しいものはどれか。 [ratio fix]
-- ratio=1.35, min=17→30, max=23
UPDATE quiz_question_options SET option_text = '両テーブルの全行の組み合わせを返すことを目的とした手法である'
WHERE id = '0b33701e-ad4f-4ddd-bb98-e211911bc53e';

-- Q-1d73bdc1: LEFT JOINの説明として正しいものはどれか。
-- correct=24, dist=[24,15,11] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = '右テーブルの全行を返し左に一致がなければNULLとして知られている手法である'
WHERE id = 'fdb4ad4a-f8c1-4c3c-9392-afafe3843475';

-- Q-f229fb60: 第1正規形（1NF）の条件として正しいものはどれか。 [ratio fix]
-- ratio=2.08, min=12→25, max=25
UPDATE quiz_question_options SET option_text = '推移的関数従属がないことが前提条件として必要である'
WHERE id = '4fa02a83-6de5-49ca-b4c8-fe5f291bee39';

-- Q-c223885f: トランザクションのACID特性のうち「A（原子性）」の説明として正しいものはどれ
-- correct=26, dist=[25,24,17] → pad longest dist 25→38
UPDATE quiz_question_options SET option_text = 'トランザクション完了後のデータが永続的に保存されることを目的とした手法である'
WHERE id = '30aff99d-a878-4a8e-acd1-a9e6c2a661ac';

-- Q-6f6cce07: データベースインデックスの一般的なデメリットとして正しいものはどれか。
-- correct=29, dist=[17,15,14] → pad longest dist 17→30
UPDATE quiz_question_options SET option_text = 'トランザクションが使用できなくなることを目的とした手法である'
WHERE id = 'c50b268a-75fc-4055-a43c-396f15bb37c4';

-- Q-fcc61e64: NoSQLデータベースの特徴として正しいものはどれか。 [ratio fix]
-- ratio=1.92, min=12→22, max=23
UPDATE quiz_question_options SET option_text = '固定スキーマが必須であることが主な特徴である'
WHERE id = '1c0ca5e3-db5d-4e13-8cfa-59778a30fa4e';

-- Q-25c340c5: SQLのサブクエリ（副問合せ）の説明として正しいものはどれか。
-- correct=25, dist=[19,15,15] → pad longest dist 19→28
UPDATE quiz_question_options SET option_text = 'データベースのバックアップを作成する文であるとされている'
WHERE id = '71fb5fba-9f6e-4c56-b1f3-b8b8d7ad6d36';

-- Q-265224dc: SQLのHAVING句とWHERE句の違いとして正しいものはどれか。
-- correct=30, dist=[24,21,12] → pad longest dist 24→34
UPDATE quiz_question_options SET option_text = 'WHERE句はGROUP BY後に条件を適用することが主な目的である'
WHERE id = '79b97da4-a15c-4a2b-b7db-b62cec7c3ec0';

-- Q-6cba31c0: 外部キー（FOREIGN KEY）の役割として正しいものはどれか。 [ratio fix]
-- ratio=1.33, min=15→28, max=20
UPDATE quiz_question_options SET option_text = 'テーブル内の行を一意に識別することを目的とした手法である'
WHERE id = '7e728943-e35d-41c2-aa28-9e01f73c11a5';

-- Q-3d2dce99: データベースのVIEW（ビュー）の説明として正しいものはどれか。
-- correct=18, dist=[16,14,9] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'データを物理的に複製したテーブルとして知られている手法である'
WHERE id = 'c7d8bb81-9988-4685-92db-5a2ecb6eeafd';

-- Q-bfff1ab2: データベースの説明として正しいものはどれか。
-- correct=25, dist=[16,15,15] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = 'ファイルを保存するフォルダのことが前提条件として必要である'
WHERE id = '16f3adf8-5425-43bb-b726-ce43ac2cb0fc';

-- Q-ecd89fad: 第3正規形（3NF）の条件として正しいものはどれか。
-- correct=19, dist=[17,15,11] → pad longest dist 17→30
UPDATE quiz_question_options SET option_text = 'すべての決定子が候補キーであることが前提条件として必要である'
WHERE id = '1e8cd983-1612-4b6f-8692-665cf354e5b3';

-- Q-ab99be6a: データベースのデッドロックの説明として正しいものはどれか。
-- correct=29, dist=[27,27,24] → pad longest dist 27→41
UPDATE quiz_question_options SET option_text = '1つのトランザクションが長時間ロックを保持している状態として知られている手法である'
WHERE id = '3083af7a-c856-4b87-be23-bf5f4233dcd0';

-- Q-c9ea982a: マスター・スレーブレプリケーションの一般的な構成として正しいものはどれか。 [ratio fix]
-- ratio=1.33, min=18→31, max=24
UPDATE quiz_question_options SET option_text = 'スレーブがマスターにデータを送信することを目的とした手法である'
WHERE id = 'e41c8560-16b2-405f-8841-91201b79b320';

-- Q-186e585e: SQLインジェクション対策として最も効果的なものはどれか。 [ratio fix]
-- ratio=1.73, min=11→19, max=19
UPDATE quiz_question_options SET option_text = '入力値の長さを制限する処理のことである'
WHERE id = 'ada02a12-9796-45f6-b589-f27f2427a191';

-- Q-12ab343c: トランザクション分離レベルで「ファントムリード」を防止できるレベルはどれか。 [MANUAL: correct=shortest]
-- correct=12, dist=[16,15,14]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-4e3b0c93: ストアドプロシージャの利点として正しくないものはどれか。
-- correct=13, dist=[12,10,9] → pad longest dist 12→26
UPDATE quiz_question_options SET option_text = 'ネットワーク通信量の削減として知られている手法である'
WHERE id = '790a0475-cd96-40af-b320-f55cb7bc4ab3';

-- Q-f323032c: 楽観的ロック（Optimistic Locking）の実装方法として一般的なもの [ratio fix]
-- ratio=2.14, min=14→27, max=30
UPDATE quiz_question_options SET option_text = 'テーブル全体にロックをかけることを目的とした手法である'
WHERE id = 'eb1e65a8-450d-4319-9658-afd44d482870';

-- Q-bc91ec19: SQLのEXPLAIN文の用途として正しいものはどれか。 [ratio fix]
-- ratio=1.50, min=12→25, max=18
UPDATE quiz_question_options SET option_text = 'テーブルの構造を表示することを目的とした手法である'
WHERE id = 'cf9dc589-fb3d-4c98-8faf-364640a20bad';

-- Q-3d56c6b3: データベースシャーディングの説明として正しいものはどれか。
-- correct=24, dist=[23,21,20] → pad longest dist 23→36
UPDATE quiz_question_options SET option_text = 'データを同じサーバー内の複数テーブルに分割することを目的とした手法である'
WHERE id = 'e056015e-379f-47c8-a1c5-1dd619fd96eb';

-- Q-660bc9ed: 第1正規形の条件として正しいものはどれか。
-- correct=22, dist=[17,14,13] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'すべての属性が主キーに依存していることが主な特徴である'
WHERE id = '11fd2bef-48f3-49e4-94a8-edb62e537ff9';

-- Q-a82cbd81: 第2正規形の条件として正しいものはどれか。
-- correct=20, dist=[13,13,12] → pad longest dist 13→23
UPDATE quiz_question_options SET option_text = 'すべての属性が原子値を持つことが主な特徴である'
WHERE id = 'd6de3077-c6d2-4aad-bf81-c2d8e37c529e';

-- Q-aba2293d: CAP定理の説明として正しいものはどれか。 [MANUAL: correct=shortest]
-- correct=25, dist=[30,30,28]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-0126f794: MVCC（Multi-Version Concurrency Control）の
-- correct=32, dist=[24,23,20] → pad longest dist 24→36
UPDATE quiz_question_options SET option_text = 'タイムスタンプ順にトランザクションを実行する方式の一種として知られている'
WHERE id = '6f250d98-17b0-470b-a7a5-f8a4670bc065';

-- Q-39e82e53: N+1問題の説明と対策として正しいものはどれか。
-- correct=44, dist=[36,35,28] → pad longest dist 36→48
UPDATE quiz_question_options SET option_text = 'インデックスが未設定で全件スキャンが発生する問題。インデックス作成で解決に該当する処理方式である'
WHERE id = 'd102bc61-22e5-4336-9610-b46a5238d4b4';

-- Q-00f25bd9: HAVING句の用途として正しいものはどれか。
-- correct=22, dist=[18,16,10] → pad longest dist 18→26
UPDATE quiz_question_options SET option_text = '個別のレコードに対して条件を指定する処理のことである'
WHERE id = 'b2b5526c-939d-4f85-8d22-6f8cc693e4e8';

-- Q-2600ac0d: 正規化の目的として正しいものはどれか。
-- correct=18, dist=[14,10,9] → pad longest dist 14→23
UPDATE quiz_question_options SET option_text = 'データの検索速度を向上させることが一般的である'
WHERE id = '0ca5c97d-763b-4a72-85b7-17295044e36c';

-- Q-2b5cac44: 楽観的ロックと悲観的ロックの違いとして正しいものはどれか。
-- correct=27, dist=[27,23,17] → pad longest dist 27→40
UPDATE quiz_question_options SET option_text = '楽観的は取得時にロックし、悲観的はコミット時に検証することを目的とした手法である'
WHERE id = '9e1e6f1e-dd9e-490b-b857-2703e99a1468';

-- Q-5af87677: ハッシュテーブルの特徴として最も適切なものはどれか。
-- correct=19, dist=[14,14,13] → pad longest dist 14→24
UPDATE quiz_question_options SET option_text = 'データを順番に並べて管理することが主な目的である'
WHERE id = 'a1c93371-f2f3-4857-ad82-db17a47330cb';

-- Q-5638d061: 配列の特徴として正しいものはどれか。
-- correct=20, dist=[15,15,11] → pad longest dist 15→25
UPDATE quiz_question_options SET option_text = '要素数を後から自由に変更できることが主な特徴である'
WHERE id = '937e4d98-ee8e-4caf-a211-4698cf652cf0';

-- Q-d10a8984: オープンアドレス法の説明として正しいものはどれか。
-- correct=25, dist=[18,15,12] → pad longest dist 18→28
UPDATE quiz_question_options SET option_text = '衝突時にデータを連結リストで管理することが主な目的である'
WHERE id = 'e921167a-8bb2-460f-81c7-8f6475c4ba84';

-- Q-32f98074: 主キー（プライマリキー）の説明として正しいものはどれか。
-- correct=20, dist=[12,12,10] → pad longest dist 12→24
UPDATE quiz_question_options SET option_text = '他のテーブルを参照する列に該当する処理方式である'
WHERE id = '28ef4049-f2bc-4a8c-b874-1287d186d46a';

-- Q-2fb8ea21: 関係データベース（リレーショナルデータベース）の特徴として正しいものはどれか。
-- correct=18, dist=[16,14,14] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = 'データをキーと値のペアで管理することを目的とした手法である'
WHERE id = 'b639a2f1-fcc3-4510-bf72-66c5318e472f';

-- Q-8cefc3cf: テーブルの列（カラム）の説明として正しいものはどれか。
-- correct=16, dist=[11,10,10] → pad longest dist 11→21
UPDATE quiz_question_options SET option_text = 'テーブル間の関係を表すことが主な特徴である'
WHERE id = '7ff5a4db-7b0f-40db-8675-a242d1cfee03';

-- Q-c9dd6414: テーブルの行（レコード）の説明として正しいものはどれか。
-- correct=11, dist=[9,7,7] → pad longest dist 9→22
UPDATE quiz_question_options SET option_text = 'テーブル全体のことが前提条件として必要である'
WHERE id = '6c11ea7a-7eab-49ae-97d0-98de6515e0da';

-- Q-1833c5be: ACID特性のうち「原子性（Atomicity）」の説明として正しいものはどれか
-- correct=32, dist=[23,22,21] → pad longest dist 23→36
UPDATE quiz_question_options SET option_text = 'トランザクション前後でデータの整合性が保たれることを目的とした手法である'
WHERE id = '768fd113-6929-4c20-8b19-de119cc1f407';

-- Q-07584d8a: B+木インデックスの特徴として正しいものはどれか。
-- correct=24, dist=[18,14,12] → pad longest dist 18→28
UPDATE quiz_question_options SET option_text = 'ハッシュ値を使って高速にアクセスすることが主な目的である'
WHERE id = 'b690f24b-e1b9-4e42-9551-54f60d57a414';

-- Q-0f2afa04: 結合（JOIN）の種類のうち、内部結合（INNER JOIN）の説明として正しい [ratio fix]
-- ratio=1.50, min=18→26, max=27
UPDATE quiz_question_options SET option_text = '両方のテーブルの全レコードを取得する処理のことである'
WHERE id = 'a12fdc27-3492-494c-bc30-425a7baca28a';

-- Q-10f7e87c: 左外部結合（LEFT OUTER JOIN）の説明として正しいものはどれか。
-- correct=31, dist=[31,23,18] → pad longest dist 31→44
UPDATE quiz_question_options SET option_text = '右テーブルの全レコードと左テーブルの一致するレコードを取得することを目的とした手法である'
WHERE id = '3cd4a4dc-16a0-4105-b394-b2ab1ca29aba';

-- Q-21e6ec52: NoSQLデータベースの特徴として正しいものはどれか。
-- correct=17, dist=[17,15,11] → pad longest dist 17→30
UPDATE quiz_question_options SET option_text = '必ずテーブル形式でデータを管理することを目的とした手法である'
WHERE id = 'd79b960c-e515-4063-8ae5-b429529df1fe';

-- Q-ec0e87f1: 2相コミットプロトコルの目的として正しいものはどれか。
-- correct=24, dist=[16,14,14] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = 'データのバックアップを自動化することを目的とした手法である'
WHERE id = '4939ce1a-0a08-4f47-99eb-e90093c522ea';

-- Q-a1d1e1c7: WAF（Web Application Firewall）の説明として正しいもの
-- correct=32, dist=[23,16,15] → pad longest dist 23→37
UPDATE quiz_question_options SET option_text = 'ネットワーク層の通信を制御するファイアウォールとして知られている手法である'
WHERE id = 'fbbba9ef-76d1-4663-9421-a0fc5e0b5ef5';

-- Q-4dcd913d: B+木インデックスの利点として正しいものはどれか。
-- correct=19, dist=[17,13,11] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = 'ハッシュ値による高速な等値検索のみとして知られている手法である'
WHERE id = 'fda43ea7-5e83-44f2-a24e-611e01f1b9f0';

-- Q-5229f0fb: WAL（Write-Ahead Logging）の説明として正しいものはどれか。
-- correct=27, dist=[21,18,16] → pad longest dist 21→31
UPDATE quiz_question_options SET option_text = 'ログを書き込まずにデータを直接変更する方式として分類されている'
WHERE id = 'd7c5b025-1b52-4e1b-a8f9-02a23bc839dc';

-- Q-1d5c7995: NULL値の説明として正しいものはどれか。
-- correct=18, dist=[8,7,7] → pad longest dist 8→21
UPDATE quiz_question_options SET option_text = '空の文字列のことが前提条件として必要である'
WHERE id = '86fd49a1-ccc7-4058-a831-c1a4d63c5512';

-- Q-69b0cd82: データベースの排他制御の目的として正しいものはどれか。
-- correct=16, dist=[14,13,13] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'データの検索速度を向上させることを目的とした手法である'
WHERE id = '5ed68f2f-505a-4b0a-9603-882de11b916a';

-- Q-c40a5c68: インデックスの説明として正しいものはどれか。
-- correct=26, dist=[16,16,12] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'テーブル間の関連を定義する仕組みとして知られている手法である'
WHERE id = '5d2b1626-aae2-420b-ba5a-ea20825b936a';

-- Q-cb2a06ec: トランザクションの説明として正しいものはどれか。
-- correct=28, dist=[16,15,14] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'テーブル間の関係を定義する仕組みとして知られている手法である'
WHERE id = 'aab277fd-a84f-4923-9006-1d0fb32a887a';

-- Q-16604894: SQLのDELETE文の用途として正しいものはどれか。 [ratio fix]
-- ratio=2.00, min=8→18, max=16
UPDATE quiz_question_options SET option_text = 'データを検索することが主な目的である'
WHERE id = 'cae64309-e41b-4b0e-bc19-dd446916d67f';

-- Q-1893de19: ORDER BY句の用途として正しいものはどれか。
-- correct=18, dist=[9,9,9] → pad longest dist 9→22
UPDATE quiz_question_options SET option_text = '検索条件を指定することを目的とした手法である'
WHERE id = '69e8c8cb-3ca0-468b-88fc-d4e898b3d26f';

-- Q-5f7efa04: SQLのSELECT文の用途として正しいものはどれか。
-- correct=19, dist=[14,13,12] → pad longest dist 14→24
UPDATE quiz_question_options SET option_text = 'テーブルからデータを削除することが主な目的である'
WHERE id = '61fcb5b1-19bf-4a6c-857b-f0d94a805329';

-- Q-94b6bae9: 外部キー（フォーリンキー）の説明として正しいものはどれか。
-- correct=27, dist=[19,18,13] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'テーブル内のレコードを一意に識別する列に該当する処理方式である'
WHERE id = '3a8f5430-6f62-49a0-ab53-68137f3802b8';

-- Q-c5ba65ff: GROUP BY句の用途として正しいものはどれか。
-- correct=19, dist=[10,9,9] → pad longest dist 10→23
UPDATE quiz_question_options SET option_text = '検索結果を並べ替えることを目的とした手法である'
WHERE id = 'cb0e0942-477c-4aca-bb9f-7a19059f6939';

-- Q-e3df37ee: SQLのUPDATE文の用途として正しいものはどれか。 [ratio fix]
-- ratio=1.45, min=11→24, max=16
UPDATE quiz_question_options SET option_text = 'データベースを作成することを目的とした手法である'
WHERE id = 'fa774114-89e9-435b-b895-563a3b169171';

-- Q-e9b83c3d: WHERE句の用途として正しいものはどれか。
-- correct=15, dist=[14,12,10] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'データのグループ化を指定することを目的とした手法である'
WHERE id = 'fd6df990-9912-4288-8f60-1d2eecb009a1';

-- Q-3290312f: 関係代数演算の「射影」の説明として正しいものはどれか。
-- correct=18, dist=[17,15,14] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = '2つのテーブルの積集合を求める演算として知られている手法である'
WHERE id = 'b258c611-a9d2-4c88-b8c8-1d889860c051';

-- Q-3326e74e: Webアプリケーションの入力欄に不正なSQL文を挿入する攻撃を何というか。 [MANUAL: correct=shortest]
-- correct=11, dist=[14,12,11]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-705e1061: ストアドプロシージャの利点として正しいものはどれか。
-- correct=22, dist=[17,16,14] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'クライアント側のメモリ消費を増やすことが主な特徴である'
WHERE id = '91cbbd42-e42c-4cc4-b524-6936319564e2';

-- Q-79b6c58a: SQLインジェクション攻撃の説明として正しいものはどれか。
-- correct=31, dist=[21,15,15] → pad longest dist 21→35
UPDATE quiz_question_options SET option_text = 'ネットワークに大量のデータを送りつける攻撃として知られている手法である'
WHERE id = '18066c3d-bf4f-4db8-8c57-5a446ed6626f';

-- Q-b951374a: サブクエリ（副問い合わせ）の説明として正しいものはどれか。
-- correct=17, dist=[16,14,13] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = '複数のテーブルを結合するSQL文として知られている手法である'
WHERE id = '7e8e324b-d4f9-4642-b470-ae7a993fc935';

-- Q-d2d04afb: バックアップの目的として正しいものはどれか。
-- correct=20, dist=[14,13,9] → pad longest dist 14→24
UPDATE quiz_question_options SET option_text = 'データの検索速度を向上させることが主な特徴である'
WHERE id = '9477989e-15ec-493d-9eaf-6526ef46e7dc';

-- Q-d54c38e8: 関係代数演算の「選択」の説明として正しいものはどれか。
-- correct=20, dist=[18,17,17] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = '指定した属性（列）のみを取り出す演算として知られている手法である'
WHERE id = 'ce2ad7e6-6dfa-4f64-8c86-4b15ac4f57b2';

-- Q-dab80a3d: ビュー（VIEW）の説明として正しいものはどれか。
-- correct=26, dist=[14,13,9] → pad longest dist 14→28
UPDATE quiz_question_options SET option_text = 'テーブルのバックアップコピーとして知られている手法である'
WHERE id = '1c85e636-1190-400f-a697-9cb412a1cd96';

-- Q-eea7cb24: 第3正規形の条件として正しいものはどれか。
-- correct=21, dist=[20,17,17] → pad longest dist 20→26
UPDATE quiz_question_options SET option_text = '第1正規形であり部分関数従属が存在しないとされている'
WHERE id = '37aaad40-6de4-469c-b353-7a01c7c10112';

-- Q-ed2b4706: 配列のインデックスの説明として正しいものはどれか。
-- correct=14, dist=[13,12,10] → pad longest dist 13→27
UPDATE quiz_question_options SET option_text = '配列に格納されたデータの値として知られている手法である'
WHERE id = 'fd63bc3f-70c6-4855-93ac-3ab18abe3949';

-- Q-1cfb75bc: ロールバックの説明として正しいものはどれか。
-- correct=23, dist=[18,18,14] → pad longest dist 18→28
UPDATE quiz_question_options SET option_text = 'トランザクションの結果を確定する処理として分類されている'
WHERE id = 'ca981d46-45c4-48bb-829d-bd028ee19483';

-- Q-796fdcf5: ACID特性の「一貫性（Consistency）」の説明として正しいものはどれか
-- correct=23, dist=[23,20,19] → pad longest dist 23→36
UPDATE quiz_question_options SET option_text = 'トランザクションがすべて成功かすべて失敗になることを目的とした手法である'
WHERE id = 'e25c87c4-e4a4-41a0-b6b3-f46e4bca6039';

-- Q-f71f52ef: テーブルの各行を一意に識別するための列を何というか。 [ratio fix]
-- ratio=4.33, min=3→15, max=13
UPDATE quiz_question_options SET option_text = 'ビューに該当する処理方式である'
WHERE id = 'd9ed072b-927e-4bae-abf0-0b1affa0b6a7';

-- Q-5491da64: ACID特性の「持続性（Durability）」の説明として正しいものはどれか。 [ratio fix]
-- ratio=1.30, min=20→26, max=26
UPDATE quiz_question_options SET option_text = '複数のトランザクションが互いに影響しないとされている'
WHERE id = '776828c9-fbc7-4c11-9f39-1aa98eee9902';

COMMIT;