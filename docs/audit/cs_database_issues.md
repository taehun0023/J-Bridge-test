# CS database カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 85
**Rubric**: docs/exam_quality_rubric.md v2

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 0건    | 0.0% |
| Medium  | 74건    | 87.1% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 74 / 85 (87.1%)
**A2-exempt (필터링됨)**: 0건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|
| a0000003... | 26 | 14 | 53.8% | 2 | 7.7% | **FAIL** |
| e63520ed... | 19 | 17 | 89.5% | 0 | 0.0% | **FAIL** |
| b69b76bc... | 19 | 18 | 94.7% | 0 | 0.0% | **FAIL** |
| 64f2db3f... | 3 | 1 | 33.3% | 1 | 33.3% | **FAIL** |
| ad4e3ca1... | 2 | 2 | 100.0% | 0 | 0.0% | **FAIL** |
| 3714c842... | 2 | 1 | 50.0% | 0 | 0.0% | **FAIL** |
| 4828dbf5... | 2 | 2 | 100.0% | 0 | 0.0% | **FAIL** |
| 40473700... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |

**B5-b 위반 퀴즈**: 8개 — 정답 길이 분포 재조정 필요

## High 우선순위 이슈

_없음_

## Medium 우선순위 이슈

### Q-87b1cb20-f875-4dc5-a513-e0428ef87727
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SQLのINSERT文の用途として正しいものはどれか。"
- options:
  1. [정답] "テーブルに新しいデータを追加する" (16자)
  2. "テーブルからデータを検索する" (14자)
  3. "テーブルのデータを更新する" (13자)
  4. "テーブルを削除する" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.78x (max=16, min=9)
  - **B5-a** (Medium): correct is longest (16 vs others 14,13,9)
---
### Q-41a92946-58fe-4881-8b78-56ffb826f034
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "SQLでテーブルの全カラムを取得する文として正しいものはどれか。"
- options:
  1. "GET * FROM users" (16자)
  2. [정답] "SELECT * FROM users" (19자)
  3. "FETCH ALL FROM users" (20자)
  4. "READ * FROM users" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.25x (max=20, min=16)
---
### Q-e913fe04-0858-4a8d-95f2-c85a664f505c
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SQLのWHERE句の役割として正しいものはどれか。"
- options:
  1. "カラムの表示順を指定する" (12자)
  2. [정답] "取得する行を条件で絞り込む" (13자)
  3. "結果をグループ化する" (10자)
  4. "テーブルを結合する" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=13, min=9)
  - **B5-a** (Medium): correct is longest (13 vs others 12,10,9)
---
### Q-f3c51c4d-d327-4006-9a5d-6194286f0115
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "主キー（PRIMARY KEY）の制約として正しいものはどれか。"
- options:
  1. "NULL値を許容し重複も可能" (14자)
  2. "NULL値を許容するが重複は不可" (16자)
  3. [정답] "NULL不可かつ一意でなければならない" (19자)
  4. "NULL不可だが重複は許容される" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.36x (max=19, min=14)
  - **B5-a** (Medium): correct is longest (19 vs others 14,16,16)
---
### Q-c7cfae02-9450-4da7-ab60-3c3d6bdfc53e
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "RDBMSの説明として正しいものはどれか。"
- options:
  1. "データをJSON形式のドキュメントで管理するシステム" (26자)
  2. "データをキーと値のペアで管理するシステム" (20자)
  3. "データをグラフ構造で管理するシステム" (18자)
  4. [정답] "データを表形式で管理しSQLで操作するシステム" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=26, min=18)
---
### Q-9e215d8e-9a03-4435-beec-57f24aca2a3f
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "INNER JOINの説明として正しいものはどれか。"
- options:
  1. "左テーブルの全行と一致する右テーブルの行を返す" (23자)
  2. [정답] "両テーブルで結合条件に一致する行のみを返す" (21자)
  3. "両テーブルの全行の組み合わせを返す" (17자)
  4. "右テーブルの全行と一致する左テーブルの行を返す" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.35x (max=23, min=17)
---
### Q-1d73bdc1-1112-46cd-ae2a-3ecca76a7180
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "LEFT JOINの説明として正しいものはどれか。"
- options:
  1. "両テーブルで一致する行のみ返す" (15자)
  2. "右テーブルの全行を返し左に一致がなければNULL" (24자)
  3. [정답] "左テーブルの全行を返し右に一致がなければNULL" (24자)
  4. "両テーブルの全行を返す" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.18x (max=24, min=11)
  - **B5-a** (Medium): correct is longest (24 vs others 15,11)
---
### Q-f229fb60-d945-4b94-936d-20975a87e5ff
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "第1正規形（1NF）の条件として正しいものはどれか。"
- options:
  1. "全ての非キー属性が主キーに完全関数従属していること" (25자)
  2. [정답] "各カラムの値が原子的で繰り返しグループがないこと" (24자)
  3. "推移的関数従属がないこと" (12자)
  4. "外部キーが設定されていること" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.08x (max=25, min=12)
---
### Q-c223885f-2b03-4838-8ee8-b033ce902b40
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "トランザクションのACID特性のうち「A（原子性）」の説明として正しいものはどれか。"
- options:
  1. "トランザクション完了後のデータが永続的に保存される" (25자)
  2. "同時実行されるトランザクションが互いに干渉しない" (24자)
  3. [정답] "トランザクション内の操作が全て成功するか全て失敗する" (26자)
  4. "データの整合性制約が常に満たされる" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=26, min=17)
  - **B5-a** (Medium): correct is longest (26 vs others 25,24,17)
---
### Q-6f6cce07-1af3-47c5-a817-95f1c71d52b3
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B6]
- question_text: "データベースインデックスの一般的なデメリットとして正しいものはどれか。"
- options:
  1. "SELECT文の実行が遅くなる" (15자)
  2. [정답] "INSERT/UPDATE/DELETE時の性能が低下する" (29자)
  3. "テーブルの行数に上限が生じる" (14자)
  4. "トランザクションが使用できなくなる" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.07x (max=29, min=14)
  - **B5-a** (Medium): correct is longest (29 vs others 15,14,17)
  - **B6** (Medium): slash in option: "INSERT/UPDATE/DELETE時の性能が低下する"
---
### Q-fcc61e64-c07e-48e3-8cd7-3b4d05f4e5d0
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "NoSQLデータベースの特徴として正しいものはどれか。"
- options:
  1. "常にACIDトランザクションを完全サポートする" (23자)
  2. "固定スキーマが必須である" (12자)
  3. [정답] "スキーマレスで水平スケーリングに優れる" (19자)
  4. "SQL言語でのみ操作可能" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=23, min=12)
---
### Q-25c340c5-6d26-4bf4-94b6-874efe183d9b
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SQLのサブクエリ（副問合せ）の説明として正しいものはどれか。"
- options:
  1. "テーブルを物理的に結合する操作" (15자)
  2. [정답] "SELECT文の中に埋め込まれた別のSELECT文" (25자)
  3. "データベースのバックアップを作成する文" (19자)
  4. "テーブルのスキーマを変更する文" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.67x (max=25, min=15)
  - **B5-a** (Medium): correct is longest (25 vs others 15,19,15)
---
### Q-265224dc-8f74-42c6-b6f2-af33d7848251
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SQLのHAVING句とWHERE句の違いとして正しいものはどれか。"
- options:
  1. [정답] "HAVING句はGROUP BY後のグループに条件を適用する" (30자)
  2. "WHERE句はGROUP BY後に条件を適用する" (24자)
  3. "HAVING句はインデックスを使用できない" (21자)
  4. "両者に機能的な違いはない" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.50x (max=30, min=12)
  - **B5-a** (Medium): correct is longest (30 vs others 24,21,12)
---
### Q-6cba31c0-3750-4642-b597-484c0628559f
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "外部キー（FOREIGN KEY）の役割として正しいものはどれか。"
- options:
  1. "テーブル内の行を一意に識別する" (15자)
  2. "検索速度を向上させるためのインデックス" (19자)
  3. [정답] "テーブル間の参照整合性を保証する" (16자)
  4. "カラムの値がNULLでないことを保証する" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.33x (max=20, min=15)
---
### Q-3d2dce99-c360-489f-a630-0e767487b2a2
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "データベースのVIEW（ビュー）の説明として正しいものはどれか。"
- options:
  1. "データを物理的に複製したテーブル" (16자)
  2. [정답] "SELECT文を保存した仮想テーブル" (18자)
  3. "テーブルのバックアップコピー" (14자)
  4. "インデックスの一種" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=18, min=9)
  - **B5-a** (Medium): correct is longest (18 vs others 16,14,9)
---
### Q-bfff1ab2-8dac-46f3-89a0-9f79b9e15c01
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "データベースの説明として正しいものはどれか。"
- options:
  1. [정답] "データを整理・統合して効率的に管理するデータの集合" (25자)
  2. "ファイルを保存するフォルダのこと" (16자)
  3. "プログラムのソースコードのこと" (15자)
  4. "ネットワーク上のサーバーのこと" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.67x (max=25, min=15)
  - **B5-a** (Medium): correct is longest (25 vs others 16,15,15)
---
### Q-ecd89fad-3390-4037-9988-9f9072977c51
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "第3正規形（3NF）の条件として正しいものはどれか。"
- options:
  1. "各カラムの値が原子的であること" (15자)
  2. "部分関数従属がないこと" (11자)
  3. [정답] "非キー属性間の推移的関数従属がないこと" (19자)
  4. "すべての決定子が候補キーであること" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=19, min=11)
  - **B5-a** (Medium): correct is longest (19 vs others 15,11,17)
---
### Q-ab99be6a-7a9b-43db-bc5f-b676964053ce
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "データベースのデッドロックの説明として正しいものはどれか。"
- options:
  1. "1つのトランザクションが長時間ロックを保持している状態" (27자)
  2. [정답] "2つ以上のトランザクションが互いのロック解放を待ち合う状態" (29자)
  3. "トランザクションがタイムアウトでロールバックされた状態" (27자)
  4. "テーブル全体にロックがかかりアクセスできない状態" (24자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.21x (max=29, min=24)
  - **B5-a** (Medium): correct is longest (29 vs others 27,27,24)
---
### Q-c9ea982a-6069-435f-b1c1-e0f8b7554b72
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "マスター・スレーブレプリケーションの一般的な構成として正しいものはどれか。"
- options:
  1. "マスターとスレーブの両方で書き込みを行う" (20자)
  2. "スレーブがマスターにデータを送信する" (18자)
  3. [정답] "マスターで書き込みスレーブで読み取りを分散する" (23자)
  4. "マスターは読み取り専用でスレーブが書き込みを行う" (24자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.33x (max=24, min=18)
---
### Q-186e585e-47f1-4f74-b280-b217cf1ba236
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "SQLインジェクション対策として最も効果的なものはどれか。"
- options:
  1. "入力値の長さを制限する" (11자)
  2. "エラーメッセージを非表示にする" (15자)
  3. [정답] "プリペアドステートメントを使用する" (17자)
  4. "データベースユーザーの権限を最小化する" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=19, min=11)
---
### Q-12ab343c-4016-4fdf-87be-11f9fd369c08
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "トランザクション分離レベルで「ファントムリード」を防止できるレベルはどれか。"
- options:
  1. "READ UNCOMMITTED" (16자)
  2. "READ COMMITTED" (14자)
  3. "REPEATABLE READ" (15자)
  4. [정답] "SERIALIZABLE" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.33x (max=16, min=12)
  - **B5-a** (Medium): correct is shortest (12 vs others 16,14,15)
---
### Q-4e3b0c93-73ea-4407-94e8-bca7138a4557
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ストアドプロシージャの利点として正しくないものはどれか。"
- options:
  1. "ネットワーク通信量の削減" (12자)
  2. "SQLの再利用性向上" (10자)
  3. [정답] "他のDBMSへの容易な移植" (13자)
  4. "セキュリティの向上" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=13, min=9)
  - **B5-a** (Medium): correct is longest (13 vs others 12,10,9)
---
### Q-f323032c-ca8c-4b89-ad7f-54774c83d3fd
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "楽観的ロック（Optimistic Locking）の実装方法として一般的なものはどれか。"
- options:
  1. "読み取り時にSELECT FOR UPDATEで行ロックする" (30자)
  2. [정답] "バージョン番号カラムで更新時に競合を検出する" (22자)
  3. "テーブル全体にロックをかける" (14자)
  4. "トランザクション分離レベルをSERIALIZABLEにする" (29자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.14x (max=30, min=14)
---
### Q-bc91ec19-bc81-4311-aa24-2be16ce58c26
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "SQLのEXPLAIN文の用途として正しいものはどれか。"
- options:
  1. "テーブルの構造を表示する" (12자)
  2. [정답] "クエリの実行計画を表示する" (13자)
  3. "データベースのバックアップを作成する" (18자)
  4. "テーブルの統計情報を更新する" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=18, min=12)
---
### Q-3d56c6b3-bcc1-475a-b3f1-62861d44de9b
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "データベースシャーディングの説明として正しいものはどれか。"
- options:
  1. "データを同じサーバー内の複数テーブルに分割する" (23자)
  2. "データベースの読み取りレプリカを作成する" (20자)
  3. [정답] "データをキーに基づいて複数サーバーに水平分散する" (24자)
  4. "テーブルを縦方向に分割して別テーブルにする" (21자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (24 vs others 23,20,21)
---
### Q-660bc9ed-d8ab-433c-af37-a36bfb37267c
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "第1正規形の条件として正しいものはどれか。"
- options:
  1. [정답] "すべての属性が原子値（分割不可能な値）を持つ" (22자)
  2. "部分関数従属を排除している" (13자)
  3. "推移的関数従属を排除している" (14자)
  4. "すべての属性が主キーに依存している" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=22, min=13)
  - **B5-a** (Medium): correct is longest (22 vs others 13,14,17)
---
### Q-a82cbd81-893e-40fa-b075-3ca9a9c57375
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "第2正規形の条件として正しいものはどれか。"
- options:
  1. [정답] "第1正規形であり部分関数従属が存在しない" (20자)
  2. "すべての属性が原子値を持つ" (13자)
  3. "推移的関数従属が存在しない" (13자)
  4. "候補キーが一つだけである" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.67x (max=20, min=12)
  - **B5-a** (Medium): correct is longest (20 vs others 13,13,12)
---
### Q-aba2293d-e452-4156-b12c-6e04eca7f2fa
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "CAP定理の説明として正しいものはどれか。"
- options:
  1. [정답] "分散システムではC・A・Pの3つを同時に満たせない" (25자)
  2. "データベースの容量・アクセス速度・価格は同時に最適化できない" (30자)
  3. "トランザクションの一貫性・原子性・永続性は同時に保証できない" (30자)
  4. "クエリの計算量・メモリ使用量・精度を同時に最適化できない" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (25 vs others 30,30,28)
---
### Q-0126f794-f963-4ac5-be0f-8802a0641703
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "MVCC（Multi-Version Concurrency Control）の説明として正しいものはどれか。"
- options:
  1. "排他ロックで読み取りと書き込みを直列化する方式" (23자)
  2. [정답] "データの複数バージョンを保持し読み書きが互いにブロックしない方式" (32자)
  3. "タイムスタンプ順にトランザクションを実行する方式" (24자)
  4. "テーブル全体をロックして一貫性を保つ方式" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=32, min=20)
  - **B5-a** (Medium): correct is longest (32 vs others 23,24,20)
---
### Q-39e82e53-36bd-4036-927e-7c737a1cb874
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "N+1問題の説明と対策として正しいものはどれか。"
- options:
  1. "インデックスが未設定で全件スキャンが発生する問題。インデックス作成で解決" (36자)
  2. [정답] "関連データ取得で大量のクエリが発行される問題。JOINやEager Loadingで対策" (44자)
  3. "トランザクションのロック競合で性能が低下する問題。分離レベル変更で対策" (35자)
  4. "テーブルの正規化不足でデータが重複する問題。正規化で対策" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=44, min=28)
  - **B5-a** (Medium): correct is longest (44 vs others 36,35,28)
---
### Q-00f25bd9-b6d1-4203-8bb6-644286cbf24f
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "HAVING句の用途として正しいものはどれか。"
- options:
  1. [정답] "GROUP BYの結果に対して条件を指定する" (22자)
  2. "個別のレコードに対して条件を指定する" (18자)
  3. "検索結果を並べ替える" (10자)
  4. "テーブルを結合する条件を指定する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.20x (max=22, min=10)
  - **B5-a** (Medium): correct is longest (22 vs others 18,10,16)
---
### Q-2600ac0d-c805-4d24-a1b6-e6625c8cd55f
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "正規化の目的として正しいものはどれか。"
- options:
  1. [정답] "データの冗長性を排除し更新異常を防ぐ" (18자)
  2. "データの検索速度を向上させる" (14자)
  3. "テーブルの数を減らす" (10자)
  4. "データを暗号化する" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=18, min=9)
  - **B5-a** (Medium): correct is longest (18 vs others 14,10,9)
---
### Q-2b5cac44-6a92-4d26-bde2-f19fe25abf06
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "楽観的ロックと悲観的ロックの違いとして正しいものはどれか。"
- options:
  1. [정답] "楽観的はコミット時に検証し、悲観的は取得時にロックする" (27자)
  2. "楽観的は取得時にロックし、悲観的はコミット時に検証する" (27자)
  3. "楽観的はデータを暗号化し、悲観的は暗号化しない" (23자)
  4. "両方とも同じタイミングでロックする" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.59x (max=27, min=17)
  - **B5-a** (Medium): correct is longest (27 vs others 23,17)
---
### Q-5af87677-c63b-4acb-b0a6-7875729f37d5
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ハッシュテーブルの特徴として最も適切なものはどれか。"
- options:
  1. [정답] "キーを使ってデータの検索を高速に行える" (19자)
  2. "データを順番に並べて管理する" (14자)
  3. "データの挿入と削除ができない" (14자)
  4. "データを暗号化して格納する" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.46x (max=19, min=13)
  - **B5-a** (Medium): correct is longest (19 vs others 14,14,13)
---
### Q-5638d061-57f1-487e-95f2-770e508b6dda
- quiz_id: 3714c842-5507-4f99-a185-7c5dba98a90b
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "配列の特徴として正しいものはどれか。"
- options:
  1. [정답] "インデックスによるランダムアクセスが高速" (20자)
  2. "要素の挿入・削除が高速" (11자)
  3. "要素数を後から自由に変更できる" (15자)
  4. "各要素が異なるデータ型を持てる" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.82x (max=20, min=11)
  - **B5-a** (Medium): correct is longest (20 vs others 11,15,15)
---
### Q-d10a8984-8f6d-478e-a203-21369e49033b
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "オープンアドレス法の説明として正しいものはどれか。"
- options:
  1. [정답] "衝突時にテーブル内の別の空き場所にデータを格納する" (25자)
  2. "衝突時にデータを連結リストで管理する" (18자)
  3. "衝突時にハッシュ関数を変更する" (15자)
  4. "衝突時にデータを破棄する" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.08x (max=25, min=12)
  - **B5-a** (Medium): correct is longest (25 vs others 18,15,12)
---
### Q-32f98074-6006-4e74-8214-0009521afc02
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "主キー（プライマリキー）の説明として正しいものはどれか。"
- options:
  1. [정답] "テーブル内の各レコードを一意に識別する列" (20자)
  2. "他のテーブルを参照する列" (12자)
  3. "データの並び順を決める列" (12자)
  4. "NULLを許容する列" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=20, min=10)
  - **B5-a** (Medium): correct is longest (20 vs others 12,12,10)
---
### Q-2fb8ea21-70ae-4bca-93b4-8437b461fa2e
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "関係データベース（リレーショナルデータベース）の特徴として正しいものはどれか。"
- options:
  1. [정답] "データを表（テーブル）形式で管理する" (18자)
  2. "データをツリー構造で管理する" (14자)
  3. "データをグラフ構造で管理する" (14자)
  4. "データをキーと値のペアで管理する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=18, min=14)
  - **B5-a** (Medium): correct is longest (18 vs others 14,14,16)
---
### Q-8cefc3cf-ffa4-4bff-b181-8778c9932b63
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "テーブルの列（カラム）の説明として正しいものはどれか。"
- options:
  1. [정답] "データの項目（フィールド）を表す" (16자)
  2. "1件分のデータを表す" (10자)
  3. "テーブル間の関係を表す" (11자)
  4. "データの並び順を表す" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=16, min=10)
  - **B5-a** (Medium): correct is longest (16 vs others 10,11,10)
---
### Q-c9dd6414-7e80-409e-9908-73016442b448
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "テーブルの行（レコード）の説明として正しいものはどれか。"
- options:
  1. [정답] "1件分のデータの集まり" (11자)
  2. "データの項目名" (7자)
  3. "テーブル全体のこと" (9자)
  4. "データの型定義" (7자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=11, min=7)
  - **B5-a** (Medium): correct is longest (11 vs others 7,9,7)
---
### Q-1833c5be-ffe5-4809-9a27-42785e45df6f
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ACID特性のうち「原子性（Atomicity）」の説明として正しいものはどれか。"
- options:
  1. [정답] "トランザクションの操作がすべて成功かすべて失敗かのどちらかになる" (32자)
  2. "トランザクション前後でデータの整合性が保たれる" (23자)
  3. "複数のトランザクションが互いに影響を与えない" (22자)
  4. "トランザクションの結果が永続的に保存される" (21자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.52x (max=32, min=21)
  - **B5-a** (Medium): correct is longest (32 vs others 23,22,21)
---
### Q-07584d8a-6ce0-470a-a52c-7020a0eab51b
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "B+木インデックスの特徴として正しいものはどれか。"
- options:
  1. [정답] "リーフノードがリンクで繋がり範囲検索に適している" (24자)
  2. "ハッシュ値を使って高速にアクセスする" (18자)
  3. "データを圧縮して格納する" (12자)
  4. "全文検索に特化した構造である" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=24, min=12)
  - **B5-a** (Medium): correct is longest (24 vs others 18,12,14)
---
### Q-0f2afa04-2f24-442c-87c9-80f9646e2e01
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "結合（JOIN）の種類のうち、内部結合（INNER JOIN）の説明として正しいものはどれか。"
- options:
  1. [정답] "結合条件に一致するレコードのみを取得する" (20자)
  2. "一方のテーブルの全レコードと一致するレコードを取得する" (27자)
  3. "両方のテーブルの全レコードを取得する" (18자)
  4. "結合条件に一致しないレコードのみを取得する" (21자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=27, min=18)
---
### Q-10f7e87c-2916-4a75-b9fe-2699b8461faf
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "左外部結合（LEFT OUTER JOIN）の説明として正しいものはどれか。"
- options:
  1. [정답] "左テーブルの全レコードと右テーブルの一致するレコードを取得する" (31자)
  2. "両方のテーブルの一致するレコードのみを取得する" (23자)
  3. "右テーブルの全レコードと左テーブルの一致するレコードを取得する" (31자)
  4. "両方のテーブルの全レコードを取得する" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.72x (max=31, min=18)
  - **B5-a** (Medium): correct is longest (31 vs others 23,18)
---
### Q-21e6ec52-718c-4af8-84b5-9deede0bcaa7
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "NoSQLデータベースの特徴として正しいものはどれか。"
- options:
  1. [정답] "柔軟なデータ構造と高い拡張性を持つ" (17자)
  2. "SQLのみで操作できる" (11자)
  3. "必ずテーブル形式でデータを管理する" (17자)
  4. "トランザクション処理ができない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.55x (max=17, min=11)
  - **B5-a** (Medium): correct is longest (17 vs others 11,15)
---
### Q-ec0e87f1-f2a3-4af2-b4c7-daad0986a714
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "2相コミットプロトコルの目的として正しいものはどれか。"
- options:
  1. [정답] "分散データベースでトランザクションの一貫性を保つ" (24자)
  2. "データの検索速度を向上させる" (14자)
  3. "データのバックアップを自動化する" (16자)
  4. "テーブルの正規化を自動で行う" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=24, min=14)
  - **B5-a** (Medium): correct is longest (24 vs others 14,16,14)
---
### Q-a1d1e1c7-e746-4016-b6de-a3822ba94402
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "WAF（Web Application Firewall）の説明として正しいものはどれか。"
- options:
  1. [정답] "Webアプリケーション特有の攻撃を検知・防御するファイアウォール" (32자)
  2. "ネットワーク層の通信を制御するファイアウォール" (23자)
  3. "メールのスパムを検出するフィルタ" (16자)
  4. "ウイルスを検出するソフトウェア" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.13x (max=32, min=15)
  - **B5-a** (Medium): correct is longest (32 vs others 23,16,15)
---
### Q-4dcd913d-1115-481d-8ac2-5283e177bc43
- quiz_id: 64f2db3f-c67f-4d9c-8827-147d133838db
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "B+木インデックスの利点として正しいものはどれか。"
- options:
  1. [정답] "リーフがリンクで繋がり範囲検索が効率的" (19자)
  2. "ハッシュ値による高速な等値検索のみ" (17자)
  3. "メモリ上でのみ使用可能" (11자)
  4. "挿入時のバランス調整が不要" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=19, min=11)
  - **B5-a** (Medium): correct is longest (19 vs others 17,11,13)
---
### Q-5229f0fb-e78e-4332-8dc4-073f1a3dd275
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "WAL（Write-Ahead Logging）の説明として正しいものはどれか。"
- options:
  1. [정답] "データ変更前にログを先に書き込み障害復旧を保証する方式" (27자)
  2. "データ変更後にログを書き込む方式" (16자)
  3. "ログを書き込まずにデータを直接変更する方式" (21자)
  4. "データのバックアップを自動で取る方式" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=27, min=16)
  - **B5-a** (Medium): correct is longest (27 vs others 16,21,18)
---
### Q-1d5c7995-c7a7-4fbb-8d44-9ec75dd14b24
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "NULL値の説明として正しいものはどれか。"
- options:
  1. [정답] "データが存在しないことを示す特別な値" (18자)
  2. "数値の0のこと" (7자)
  3. "空の文字列のこと" (8자)
  4. "エラーを示す値" (7자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.57x (max=18, min=7)
  - **B5-a** (Medium): correct is longest (18 vs others 7,8,7)
---
### Q-69b0cd82-b205-42c6-9581-7db9a6d2f8e2
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "データベースの排他制御の目的として正しいものはどれか。"
- options:
  1. [정답] "同時更新によるデータ不整合を防ぐ" (16자)
  2. "データの検索速度を向上させる" (14자)
  3. "データを暗号化して保護する" (13자)
  4. "データのバックアップを取る" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.23x (max=16, min=13)
  - **B5-a** (Medium): correct is longest (16 vs others 14,13,13)
---
### Q-c40a5c68-f357-4f3b-b4a5-a5292c314a4b
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "インデックスの説明として正しいものはどれか。"
- options:
  1. [정답] "データの検索を高速化するために列に作成するデータ構造" (26자)
  2. "テーブル間の関連を定義する仕組み" (16자)
  3. "データのバックアップを取る仕組み" (16자)
  4. "データを暗号化する仕組み" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.17x (max=26, min=12)
  - **B5-a** (Medium): correct is longest (26 vs others 16,16,12)
---
### Q-cb2a06ec-aee8-4c9b-b30f-7527346798b9
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "トランザクションの説明として正しいものはどれか。"
- options:
  1. [정답] "一連の操作をまとめて全て成功か全て取り消しにする処理単位" (28자)
  2. "データの検索を高速化する仕組み" (15자)
  3. "テーブル間の関係を定義する仕組み" (16자)
  4. "バックアップを作成する仕組み" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=28, min=14)
  - **B5-a** (Medium): correct is longest (28 vs others 15,16,14)
---
### Q-16604894-477a-4ffa-9793-0b233a716cac
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "SQLのDELETE文の用途として正しいものはどれか。"
- options:
  1. [정답] "テーブルからデータを削除する" (14자)
  2. "テーブルに新しいデータを追加する" (16자)
  3. "テーブルの構造を変更する" (12자)
  4. "データを検索する" (8자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=16, min=8)
---
### Q-1893de19-ef11-466b-9e84-a5ece87054c4
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ORDER BY句の用途として正しいものはどれか。"
- options:
  1. [정답] "検索結果を指定した列の値で並べ替える" (18자)
  2. "検索条件を指定する" (9자)
  3. "テーブルを結合する" (9자)
  4. "集計関数を適用する" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=18, min=9)
  - **B5-a** (Medium): correct is longest (18 vs others 9,9,9)
---
### Q-5f7efa04-3212-4683-9078-10cfd627efaa
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SQLのSELECT文の用途として正しいものはどれか。"
- options:
  1. [정답] "データベースからデータを検索・取得する" (19자)
  2. "テーブルにデータを追加する" (13자)
  3. "テーブルからデータを削除する" (14자)
  4. "テーブルの構造を変更する" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.58x (max=19, min=12)
  - **B5-a** (Medium): correct is longest (19 vs others 13,14,12)
---
### Q-94b6bae9-00c7-487b-bff9-1742711f625a
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "外部キー（フォーリンキー）の説明として正しいものはどれか。"
- options:
  1. [정답] "他のテーブルの主キーを参照してテーブル間の関連を表す列" (27자)
  2. "テーブル内のレコードを一意に識別する列" (19자)
  3. "外部のデータベースに接続するための列" (18자)
  4. "データの暗号化に使用する列" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.08x (max=27, min=13)
  - **B5-a** (Medium): correct is longest (27 vs others 19,18,13)
---
### Q-c5ba65ff-692f-4327-896e-a73fbf474320
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "GROUP BY句の用途として正しいものはどれか。"
- options:
  1. [정답] "指定した列の値でデータをグループ化する" (19자)
  2. "検索結果を並べ替える" (10자)
  3. "検索条件を指定する" (9자)
  4. "テーブルを結合する" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.11x (max=19, min=9)
  - **B5-a** (Medium): correct is longest (19 vs others 10,9,9)
---
### Q-e3df37ee-7f89-4384-b3d8-40d33036f830
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "SQLのUPDATE文の用途として正しいものはどれか。"
- options:
  1. [정답] "既存のデータを変更・修正する" (14자)
  2. "テーブルに新しいデータを追加する" (16자)
  3. "テーブルからデータを削除する" (14자)
  4. "データベースを作成する" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
---
### Q-e9b83c3d-14ab-44e0-93b4-eae0fb29d4b6
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "WHERE句の用途として正しいものはどれか。"
- options:
  1. [정답] "データの条件を指定して絞り込む" (15자)
  2. "データの並び順を指定する" (12자)
  3. "データのグループ化を指定する" (14자)
  4. "取得する列を指定する" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=15, min=10)
  - **B5-a** (Medium): correct is longest (15 vs others 12,14,10)
---
### Q-3290312f-a4ab-4b97-ac4c-7799cbd5ad91
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "関係代数演算の「射影」の説明として正しいものはどれか。"
- options:
  1. [정답] "指定した属性（列）のみを取り出す演算" (18자)
  2. "条件に合う行のみを取り出す演算" (15자)
  3. "2つのテーブルを結合する演算" (14자)
  4. "2つのテーブルの積集合を求める演算" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=18, min=14)
  - **B5-a** (Medium): correct is longest (18 vs others 15,14,17)
---
### Q-3326e74e-edaa-4e3c-8bdc-4889f71d72b0
- quiz_id: 64f2db3f-c67f-4d9c-8827-147d133838db
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "Webアプリケーションの入力欄に不正なSQL文を挿入する攻撃を何というか。"
- options:
  1. [정답] "SQLインジェクション" (11자)
  2. "クロスサイトスクリプティング" (14자)
  3. "バッファオーバーフロー" (11자)
  4. "ディレクトリトラバーサル" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.27x (max=14, min=11)
  - **B5-a** (Medium): correct is shortest (11 vs others 14,12)
---
### Q-705e1061-2fed-4942-a9bf-6ab54c79063c
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ストアドプロシージャの利点として正しいものはどれか。"
- options:
  1. [정답] "サーバー側実行によるネットワーク通信量の削減" (22자)
  2. "クライアント側のメモリ消費を増やす" (17자)
  3. "テーブル構造を自動的に最適化する" (16자)
  4. "データの暗号化を自動的に行う" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=22, min=14)
  - **B5-a** (Medium): correct is longest (22 vs others 17,16,14)
---
### Q-79b6c58a-96f8-4460-98f1-9c99cc87ea2c
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SQLインジェクション攻撃の説明として正しいものはどれか。"
- options:
  1. [정답] "入力欄に不正なSQL文を挿入してデータベースを不正操作する攻撃" (31자)
  2. "ネットワークに大量のデータを送りつける攻撃" (21자)
  3. "パスワードを総当たりで試す攻撃" (15자)
  4. "偽のWebサイトに誘導する攻撃" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.07x (max=31, min=15)
  - **B5-a** (Medium): correct is longest (31 vs others 21,15,15)
---
### Q-b951374a-7136-4903-b782-6b82bd38d1c6
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "サブクエリ（副問い合わせ）の説明として正しいものはどれか。"
- options:
  1. [정답] "SQL文の中に入れ子にしたSQL文" (17자)
  2. "複数のテーブルを結合するSQL文" (16자)
  3. "データを一括更新するSQL文" (14자)
  4. "テーブルを作成するSQL文" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.31x (max=17, min=13)
  - **B5-a** (Medium): correct is longest (17 vs others 16,14,13)
---
### Q-d2d04afb-fb4c-4240-b3c1-86cbe48321f1
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "バックアップの目的として正しいものはどれか。"
- options:
  1. [정답] "データの破損・消失に備えて複製を保存する" (20자)
  2. "データの検索速度を向上させる" (14자)
  3. "データを暗号化する" (9자)
  4. "データベースの容量を増やす" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.22x (max=20, min=9)
  - **B5-a** (Medium): correct is longest (20 vs others 14,9,13)
---
### Q-d54c38e8-1cd4-4247-b9b1-1e7d55c5cb13
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "関係代数演算の「選択」の説明として正しいものはどれか。"
- options:
  1. [정답] "条件に合うタプル（行）のみを取り出す演算" (20자)
  2. "指定した属性（列）のみを取り出す演算" (18자)
  3. "2つのテーブルの和集合を求める演算" (17자)
  4. "2つのテーブルの差集合を求める演算" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (20 vs others 18,17,17)
---
### Q-dab80a3d-5ff4-4834-84db-5b651e46d5ab
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ビュー（VIEW）の説明として正しいものはどれか。"
- options:
  1. [정답] "SELECT文の結果を仮想テーブルとして定義したもの" (26자)
  2. "テーブルのバックアップコピー" (14자)
  3. "インデックスの一種" (9자)
  4. "ストアドプロシージャの一種" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.89x (max=26, min=9)
  - **B5-a** (Medium): correct is longest (26 vs others 14,9,13)
---
### Q-eea7cb24-1363-43a1-9990-e2520d1eecca
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "第3正規形の条件として正しいものはどれか。"
- options:
  1. [정답] "第2正規形であり推移的関数従属が存在しない" (21자)
  2. "第1正規形であり部分関数従属が存在しない" (20자)
  3. "すべての属性が候補キーの一部である" (17자)
  4. "テーブルが3つ以下に分割されている" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.24x (max=21, min=17)
  - **B5-a** (Medium): correct is longest (21 vs others 20,17,17)
---
### Q-ed2b4706-f0ad-4318-8392-42d2147c80d9
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "配列のインデックスの説明として正しいものはどれか。"
- options:
  1. [정답] "配列の各要素の位置を示す番号" (14자)
  2. "配列に格納されたデータの値" (13자)
  3. "配列のデータ型を表す情報" (12자)
  4. "配列の要素数を示す値" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.40x (max=14, min=10)
  - **B5-a** (Medium): correct is longest (14 vs others 13,12,10)
---
### Q-1cfb75bc-dbbc-467a-ba3c-c376cf8f8567
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ロールバックの説明として正しいものはどれか。"
- options:
  1. [정답] "トランザクション開始前の状態にデータを戻す処理" (23자)
  2. "トランザクションの結果を確定する処理" (18자)
  3. "データベースのバックアップを取る処理" (18자)
  4. "インデックスを再構築する処理" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=23, min=14)
  - **B5-a** (Medium): correct is longest (23 vs others 18,18,14)
---
### Q-796fdcf5-824d-4897-9f92-b75c0aaade69
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ACID特性の「一貫性（Consistency）」の説明として正しいものはどれか。"
- options:
  1. [정답] "トランザクション前後でデータの整合性が保たれる" (23자)
  2. "トランザクションがすべて成功かすべて失敗になる" (23자)
  3. "複数のトランザクションが互いに影響しない" (20자)
  4. "コミット後のデータが永続的に保存される" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.21x (max=23, min=19)
  - **B5-a** (Medium): correct is longest (23 vs others 20,19)
---
### Q-f71f52ef-6dc6-42d2-a579-db3f5d864573
- quiz_id: 3714c842-5507-4f99-a185-7c5dba98a90b
- question_category: database, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "テーブルの各行を一意に識別するための列を何というか。"
- options:
  1. [정답] "主キー（プライマリキー）" (12자)
  2. "外部キー（フォーリンキー）" (13자)
  3. "インデックス" (6자)
  4. "ビュー" (3자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 4.33x (max=13, min=3)
---
### Q-5491da64-df68-41af-b769-876422d03607
- quiz_id: 64f2db3f-c67f-4d9c-8827-147d133838db
- question_category: database, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ACID特性の「持続性（Durability）」の説明として正しいものはどれか。"
- options:
  1. [정답] "コミット後のデータは障害発生後も失われない" (21자)
  2. "トランザクションの操作がすべて成功かすべて失敗になる" (26자)
  3. "トランザクション前後でデータの整合性が保たれる" (23자)
  4. "複数のトランザクションが互いに影響しない" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.30x (max=26, min=20)
---

## Low 우선순위 이슈

_없음_

## 거버넌스 이슈 (별도 마이그레이션 대상)

_없음_

## 자동감지 불가 항목 (수동 판단 필요)

- **A1 학습범위 준수**: CS 카테고리 내 다른 카테고리 지식 요구하는지 수동 확인
- **A3 단일정답 보장**: 오답이 맥락상 정답이 될 가능성 수동 검토
- **B4 오답지 범위**: 오답 선택지가 해당 카테고리 학습 범위 내인지 확인
- **B6 상호배타 (동의어/포함관계)**: 슬래시 외 동의어·포함관계는 자동감지 불가
