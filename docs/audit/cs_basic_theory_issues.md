# CS basic_theory カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 76
**Rubric**: docs/exam_quality_rubric.md v2

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 5건    | 6.6% |
| Medium  | 44건    | 57.9% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 49 / 76 (64.5%)
**A2-exempt (필터링됨)**: 1건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|
| a0000003... | 22 | 15 | 68.2% | 2 | 9.1% | **FAIL** |
| 0c498260... | 14 | 11 | 78.6% | 0 | 0.0% | **FAIL** |
| a6cfb45b... | 8 | 6 | 75.0% | 2 | 25.0% | **FAIL** |
| 3714c842... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |
| 4828dbf5... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |

**B5-b 위반 퀴즈**: 5개 — 정답 길이 분포 재조정 필요

## High 우선순위 이슈

### Q-5d33ac3c-17e1-45f7-95dd-b22feb3f0fa3
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [A2]
- question_text: "2進数「1011」と「0110」のXOR演算の結果はどれか。"
- options:
  1. "1111" (4자)
  2. "0010" (4자)
  3. [정답] "1101" (4자)
  4. "0100" (4자)
- 자동감지 근거:
  - **A2** (High): answer-leak bigram ratio = 100%
---
### Q-f5548667-9877-4757-8137-1a5db7db21c5
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [A2]
- question_text: "16進数の「A」は10進数でいくつか。"
- options:
  1. [정답] "10" (2자)
  2. "11" (2자)
  3. "15" (2자)
  4. "16" (2자)
- 자동감지 근거:
  - **A2** (High): answer-leak bigram ratio = 100%
---
### Q-8b463bf0-dddc-439d-bd1e-414e8a2ea6fc
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [A2]
- question_text: "2進数の加算 1011 + 0110 の結果はどれか。"
- options:
  1. [정답] "10001" (5자)
  2. "10010" (5자)
  3. "1111" (4자)
  4. "10000" (5자)
- 자동감지 근거:
  - **A2** (High): answer-leak bigram ratio = 67%
---
### Q-36d95ad4-54b4-4527-88b7-64d72ce8486b
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, A2]
- question_text: "集合A={1,2,3}と集合B={2,3,4}の積集合（A∩B）はどれか。"
- options:
  1. [정답] "{2, 3}" (6자)
  2. "{1, 2, 3, 4}" (12자)
  3. "{1, 4}" (6자)
  4. "{1, 2, 3}" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=12, min=6)
  - **B5-a** (Medium): correct is shortest (6 vs others 12,9)
  - **A2** (High): answer-leak bigram ratio = 100%
---
### Q-c67b80a7-a638-4d2f-aae0-720adb6968d4
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, A2]
- question_text: "集合A={1,2,3}と集合B={2,3,4}の和集合（A∪B）はどれか。"
- options:
  1. [정답] "{1, 2, 3, 4}" (12자)
  2. "{2, 3}" (6자)
  3. "{1, 4}" (6자)
  4. "{1, 2, 3}" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=12, min=6)
  - **B5-a** (Medium): correct is longest (12 vs others 6,6,9)
  - **A2** (High): answer-leak bigram ratio = 100%
---

## Medium 우선순위 이슈

### Q-bee1b5b9-2014-498d-ab06-0a2f21c4c5ed
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "コンパイラの説明として正しいものはどれか。"
- options:
  1. "ソースコードを1行ずつ逐次実行する" (17자)
  2. "ソースコードの文法エラーだけをチェックする" (21자)
  3. [정답] "ソースコード全体を一括して機械語に変換する" (21자)
  4. "ソースコードをバイトコードに変換して仮想マシンで実行する" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.65x (max=28, min=17)
---
### Q-03c38d21-da2c-4340-9717-aff1bb589080
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "メモリ領域のスタックの特徴として正しいものはどれか。"
- options:
  1. "プログラマが明示的に確保・解放するメモリ領域" (22자)
  2. "FIFO方式で管理される領域" (14자)
  3. [정답] "LIFO方式で管理され関数のローカル変数が格納される" (26자)
  4. "ガベージコレクションによって管理される領域" (21자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.86x (max=26, min=14)
  - **B5-a** (Medium): correct is longest (26 vs others 22,14,21)
---
### Q-c145cc09-a347-4014-82ec-8c25ad4a769f
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ASCIIコードの説明として正しいものはどれか。"
- options:
  1. "日本語を含む多言語対応の文字コード" (17자)
  2. [정답] "7ビットで128種類の文字を表現する文字コード" (23자)
  3. "16ビットで世界中の文字を表現する文字コード" (22자)
  4. "可変長エンコーディングを使用する文字コード" (21자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.35x (max=23, min=17)
  - **B5-a** (Medium): correct is longest (23 vs others 17,22,21)
---
### Q-a0d403c6-03af-43f8-aaeb-8de4ee4f1562
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ポリモーフィズム（多態性）の説明として正しいものはどれか。"
- options:
  1. "クラスの内部実装を外部から隠蔽すること" (19자)
  2. "親クラスの属性やメソッドを子クラスが引き継ぐこと" (24자)
  3. [정답] "同じインターフェースで異なる実装を呼び出せること" (24자)
  4. "オブジェクトの状態を永続化すること" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.41x (max=24, min=17)
  - **B5-a** (Medium): correct is longest (24 vs others 19,17)
---
### Q-17e9f0e4-2272-4d42-bccf-5f8fd0c9e394
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "UTF-8の特徴として正しいものはどれか。"
- options:
  1. "すべての文字を2バイト固定で表現する" (18자)
  2. [정답] "可変長エンコーディングでASCII互換性がある" (23자)
  3. "すべての文字を4バイト固定で表現する" (18자)
  4. "日本語を1バイトで表現できる" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=23, min=14)
  - **B5-a** (Medium): correct is longest (23 vs others 18,18,14)
---
### Q-4d2f9f7c-5a9c-4ccc-ae02-d497f37f3ac9
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "Singletonパターンの目的として正しいものはどれか。"
- options:
  1. "オブジェクトの生成を工場クラスに委譲する" (20자)
  2. "オブジェクト間の1対多の依存関係を定義する" (21자)
  3. [정답] "クラスのインスタンスを1つだけに制限する" (20자)
  4. "アルゴリズムをカプセル化して交換可能にする" (21자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (20 vs others 21,21)
---
### Q-50354b4f-073b-4d87-a3b0-8650846d8ac9
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SOLID原則の「S」（単一責任の原則）の説明として正しいものはどれか。"
- options:
  1. [정답] "クラスは変更する理由がただ1つであるべき" (20자)
  2. "クラスは拡張に対して開き、修正に対して閉じるべき" (24자)
  3. "サブクラスは親クラスと置換可能であるべき" (20자)
  4. "クライアントに不要なインターフェースへの依存を強制すべきでない" (31자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.55x (max=31, min=20)
  - **B5-a** (Medium): correct is shortest (20 vs others 24,31)
---
### Q-28439954-98ae-4972-ba3c-8ca1249eab97
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "関数型プログラミングの特徴として正しいものはどれか。"
- options:
  1. "クラスとオブジェクトを中心に設計する" (18자)
  2. "手続きの順序を明示的に記述する" (15자)
  3. [정답] "副作用を避け不変データと純粋関数を重視する" (21자)
  4. "goto文を積極的に使用する" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=21, min=14)
  - **B5-a** (Medium): correct is longest (21 vs others 18,15,14)
---
### Q-461c52a9-1796-4b59-947b-0dc5b97bd0e8
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ヒープ領域の特徴として正しいものはどれか。"
- options:
  1. "関数呼び出し時に自動的に確保・解放される" (20자)
  2. [정답] "動的にメモリを確保でき、明示的またはGCで解放される" (26자)
  3. "コンパイル時にサイズが決定される固定領域" (20자)
  4. "読み取り専用のメモリ領域" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.17x (max=26, min=12)
  - **B5-a** (Medium): correct is longest (26 vs others 20,20,12)
---
### Q-597a4594-efb0-47d6-addc-28b9b7126c11
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "Observerパターンの説明として正しいものはどれか。"
- options:
  1. "オブジェクトの生成を専門のクラスに委譲する" (21자)
  2. "アルゴリズムの骨格を定義し詳細をサブクラスに委ねる" (25자)
  3. "複雑なサブシステムへの統一インターフェースを提供する" (26자)
  4. [정답] "オブジェクトの状態変化を依存オブジェクトに自動通知する" (27자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=27, min=21)
  - **B5-a** (Medium): correct is longest (27 vs others 21,25,26)
---
### Q-9b6b2816-65da-4754-8684-68bd2d0942a8
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "IEEE 754浮動小数点数で0.1+0.2が0.3にならない原因として正しいものはどれか。"
- options:
  1. "CPUの演算精度が不足しているため" (17자)
  2. [정답] "0.1や0.2が2進数で無限小数となり丸め誤差が生じるため" (29자)
  3. "コンパイラの最適化によるバグのため" (17자)
  4. "メモリアライメントのずれにより計算結果が変わるため" (25자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=29, min=17)
  - **B5-a** (Medium): correct is longest (29 vs others 17,17,25)
---
### Q-5d4b2862-70a2-4c68-9cd7-59d43a031aa8
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "リスコフの置換原則（LSP）に違反する例として最も適切なものはどれか。"
- options:
  1. "Animalクラスを継承したDogクラスがbarkメソッドを追加する" (34자)
  2. [정답] "RectangleクラスをSquareが継承しsetWidthで高さも変更される" (40자)
  3. "Listインターフェースを実装したArrayListクラス" (29자)
  4. "Vehicleクラスを継承したCarクラスがdriveメソッドをオーバーライドする" (41자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.41x (max=41, min=29)
---
### Q-83da4fb2-9cf9-42e1-8a47-a08ad2ce9f9e
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "マーク・アンド・スイープ方式のガベージコレクションの説明として正しいものはどれか。"
- options:
  1. "参照カウントが0になったオブジェクトを即座に解放する" (26자)
  2. "メモリプールを世代別に分けて若い世代を頻繁に回収する" (26자)
  3. [정답] "ルートから到達可能なオブジェクトをマークし、未マークを解放する" (31자)
  4. "オブジェクトのスコープ終了時に自動的にデストラクタを呼ぶ" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (31 vs others 26,26,28)
---
### Q-3e509652-1e69-4d09-b535-de845b5a8ac9
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SOLID原則の「D」（依存性逆転の原則）の説明として正しいものはどれか。"
- options:
  1. "クラスは1つの責任だけを持つべき" (16자)
  2. [정답] "上位モジュールは下位モジュールに依存せず両者とも抽象に依存すべき" (32자)
  3. "サブクラスは親クラスと置換可能であるべき" (20자)
  4. "ソフトウェアは拡張に対して開き修正に対して閉じるべき" (26자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=32, min=16)
  - **B5-a** (Medium): correct is longest (32 vs others 16,20,26)
---
### Q-1c054534-6690-4e34-9a0a-9ddd7bbfd011
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "Strategyパターンを適用すべき状況として最も適切なものはどれか。"
- options:
  1. "オブジェクトの生成過程が複雑で段階的に構築したい" (24자)
  2. [정답] "複数のソートアルゴリズムを実行時に切り替えたい" (23자)
  3. "サブシステムへのアクセスを統一インターフェースで提供したい" (29자)
  4. "オブジェクトの状態に応じて振る舞いを変えたい" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.32x (max=29, min=22)
---
### Q-311e4b47-af7e-42b5-84b6-3d2c6c7ef71d
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "Javaのジェネリクスにおける型消去（Type Erasure）の説明として正しいものはどれか。"
- options:
  1. "実行時に型パラメータの情報が保持され動的型チェックが行われる" (30자)
  2. [정답] "コンパイル時に型チェック後、実行時には型パラメータ情報が消去される" (33자)
  3. "ジェネリック型はコンパイル時にプリミティブ型に変換される" (28자)
  4. "型パラメータはリフレクションで常に取得可能" (21자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=33, min=21)
  - **B5-a** (Medium): correct is longest (33 vs others 30,28,21)
---
### Q-18754247-bf1a-4fd0-abcc-19c827097d34
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "GC対応言語（Java等）でメモリリークが発生するケースとして正しいものはどれか。"
- options:
  1. "ローカル変数を大量に宣言した場合" (16자)
  2. [정답] "staticフィールドのリストに不要なオブジェクトを追加し続ける場合" (34자)
  3. "メソッドの再帰呼び出しが深い場合" (16자)
  4. "プリミティブ型の配列を確保した場合" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.13x (max=34, min=16)
  - **B5-a** (Medium): correct is longest (34 vs others 16,16,17)
---
### Q-b36238e3-4d76-4693-8a1b-8242a3830a54
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "クロージャ（closure）の説明として正しいものはどれか。"
- options:
  1. "関数が自身を再帰的に呼び出す仕組み" (17자)
  2. [정답] "関数と定義時の環境（自由変数の束縛）を一体化したもの" (26자)
  3. "関数をコンパイル時にインライン展開する最適化手法" (24자)
  4. "関数の実行結果をキャッシュして再利用する仕組み" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=26, min=17)
  - **B5-a** (Medium): correct is longest (26 vs others 17,24,23)
---
### Q-e2d9532f-95cd-449b-b98e-96eca6cd81f4
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "末尾再帰最適化（Tail Call Optimization）の説明として正しいものはどれか。"
- options:
  1. "再帰を並列処理に変換してCPUコアを活用する最適化" (25자)
  2. "再帰の結果をメモ化してキャッシュする最適化" (21자)
  3. [정답] "末尾位置の再帰呼び出しをループに変換しスタック消費を抑える最適化" (32자)
  4. "再帰の深さに上限を設けてスタックオーバーフローを防ぐ仕組み" (29자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.52x (max=32, min=21)
  - **B5-a** (Medium): correct is longest (32 vs others 25,21,29)
---
### Q-1f781b40-67d7-4cd3-9dbc-00fbd2077b70
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "Abstract Factoryパターンの目的として正しいものはどれか。"
- options:
  1. "1つのオブジェクトの生成手順を段階的に定義する" (23자)
  2. "既存オブジェクトのクローンを作成する" (18자)
  3. [정답] "関連するオブジェクト群を具象クラスを指定せず生成する" (26자)
  4. "オブジェクトの生成をサブクラスに委譲する" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=26, min=18)
  - **B5-a** (Medium): correct is longest (26 vs others 23,18,20)
---
### Q-deb455ec-6b98-4132-a3a2-c5273e14a137
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: basic_theory, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "不変オブジェクト（Immutable Object）の利点として正しくないものはどれか。"
- options:
  1. "スレッドセーフであり同期処理が不要" (17자)
  2. "ハッシュマップのキーとして安全に使用できる" (21자)
  3. [정답] "状態変更時に常にメモリ効率が向上する" (18자)
  4. "副作用がなく予測可能な動作をする" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.31x (max=21, min=16)
---
### Q-0337b18c-cdee-42d7-a2cc-6a4f4f8377ab
- quiz_id: 3714c842-5507-4f99-a185-7c5dba98a90b
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "NAND回路は何と何の組み合わせで構成されるか。"
- options:
  1. [정답] "AND + NOT" (9자)
  2. "OR + NOT" (8자)
  3. "XOR + NOT" (9자)
  4. "AND + OR" (8자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (9 vs others 8,8)
---
### Q-6c4bac5c-b390-4599-aa0b-190cee700067
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "文字コードの説明として正しいものはどれか。"
- options:
  1. [정답] "文字をコンピュータで扱うために割り当てた番号の体系" (25자)
  2. "プログラムのソースコードのこと" (15자)
  3. "暗号化のためのアルゴリズム" (13자)
  4. "ファイルの拡張子のこと" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.27x (max=25, min=11)
  - **B5-a** (Medium): correct is longest (25 vs others 15,13,11)
---
### Q-3a3bbd78-5b2c-40f4-9a6c-ca3cd7bdf33f
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ビット（bit）の説明として正しいものはどれか。"
- options:
  1. [정답] "コンピュータが扱う情報の最小単位" (16자)
  2. "8桁の2進数のこと" (9자)
  3. "データの転送速度の単位" (11자)
  4. "メモリの容量の単位" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.78x (max=16, min=9)
  - **B5-a** (Medium): correct is longest (16 vs others 9,11,9)
---
### Q-55999ca6-81d3-4643-ba6f-ae4aa3668c76
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "けた落ちの説明として正しいものはどれか。"
- options:
  1. [정답] "ほぼ等しい数の差を求めたとき有効桁数が減る現象" (23자)
  2. "計算結果が表現可能な最大値を超える現象" (19자)
  3. "小数点以下の桁が切り捨てられる現象" (17자)
  4. "整数部分が失われる現象" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.09x (max=23, min=11)
  - **B5-a** (Medium): correct is longest (23 vs others 19,17,11)
---
### Q-bf37936c-74e8-4c90-a4f2-180285c9c603
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "丸め誤差の説明として正しいものはどれか。"
- options:
  1. [정답] "有限ビットで数値を表現する際に端数処理で生じる誤差" (25자)
  2. "プログラムの論理ミスによる計算誤差" (17자)
  3. "ハードウェアの故障による誤差" (14자)
  4. "ネットワーク通信中のデータ化けによる誤差" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.79x (max=25, min=14)
  - **B5-a** (Medium): correct is longest (25 vs others 17,14,20)
---
### Q-1b2e3149-beec-4026-bcdd-9ca597ed07ca
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "誤り検出符号であるパリティビットの説明として正しいものはどれか。"
- options:
  1. [정답] "データに1ビット付加して1の数の偶奇で誤りを検出する方式" (28자)
  2. "データを二重に送信して比較する方式" (17자)
  3. "データを暗号化して改ざんを検出する方式" (19자)
  4. "データのハッシュ値を比較する方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.75x (max=28, min=16)
  - **B5-a** (Medium): correct is longest (28 vs others 17,19,16)
---
### Q-60a3b184-f68c-4e97-b557-decb5c748b42
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "オーバーフローの説明として正しいものはどれか。"
- options:
  1. [정답] "演算結果が表現可能な範囲を超える現象" (18자)
  2. "メモリが不足してプログラムが停止する現象" (20자)
  3. "有効桁数が減少する現象" (11자)
  4. "小数点以下が丸められる現象" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.82x (max=20, min=11)
---
### Q-07c97caf-5d45-44b7-a89e-16d4ff35febf
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "Unicodeの説明として正しいものはどれか。"
- options:
  1. [정답] "世界中の文字を統一的に扱う文字コード規格" (20자)
  2. "日本語専用の文字コード規格" (13자)
  3. "ASCII文字のみを扱う規格" (14자)
  4. "バイナリデータの圧縮規格" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.67x (max=20, min=12)
  - **B5-a** (Medium): correct is longest (20 vs others 13,14,12)
---
### Q-1e0725d7-ea3a-4faa-a68b-92be9abb9ea8
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "情報エントロピーの説明として正しいものはどれか。"
- options:
  1. [정답] "情報源の不確実さ（あいまいさ）の尺度" (18자)
  2. "データの圧縮率を表す指標" (12자)
  3. "通信速度を表す単位" (9자)
  4. "メモリ使用量を表す指標" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=18, min=9)
  - **B5-a** (Medium): correct is longest (18 vs others 12,9,11)
---
### Q-0e0fb076-2dc8-4a5b-8777-a2cff715a534
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "補数の説明として正しいものはどれか。"
- options:
  1. [정답] "ある数に足すと基数のべき乗になる数" (17자)
  2. "小数点以下を切り捨てた数" (12자)
  3. "絶対値が等しい正の数" (10자)
  4. "2で割った余りの数" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.89x (max=17, min=9)
  - **B5-a** (Medium): correct is longest (17 vs others 12,10,9)
---
### Q-e58af6ac-5194-4a77-b121-57838777521d
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "浮動小数点数の表現において、仮数部と指数部の説明として正しいものはどれか。"
- options:
  1. [정답] "仮数部は有効数字を、指数部は小数点の位置を表す" (23자)
  2. "仮数部は小数点の位置を、指数部は有効数字を表す" (23자)
  3. "仮数部は符号を、指数部は絶対値を表す" (18자)
  4. "仮数部と指数部は同じ役割を持つ" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 18,15)
---
### Q-0c56564b-33b7-4bb1-8307-0c096c826c77
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B6]
- question_text: "確率において、サイコロを1回振って偶数が出る確率はどれか。"
- options:
  1. [정답] "1/2" (3자)
  2. "1/3" (3자)
  3. "1/6" (3자)
  4. "2/3" (3자)
- 자동감지 근거:
  - **B6** (Medium): slash in option: "1/2"
---
### Q-2c1e4c0d-75be-4d35-a8f3-fa84f8b002b0
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "バッファオーバーフロー攻撃の説明として正しいものはどれか。"
- options:
  1. [정답] "バッファ領域を超えるデータを送り不正なコードを実行させる攻撃" (30자)
  2. "バッファの容量を縮小する攻撃" (14자)
  3. "ネットワークのバッファを消費する攻撃" (18자)
  4. "バッファ内のデータを暗号化する攻撃" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.14x (max=30, min=14)
  - **B5-a** (Medium): correct is longest (30 vs others 14,18,17)
---
### Q-2095d558-7ff1-4d26-a905-a6aedfc7f5ac
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B6]
- question_text: "アナログデータをデジタルデータに変換する処理を何というか。"
- options:
  1. [정답] "A/D変換" (5자)
  2. "D/A変換" (5자)
  3. "エンコード" (5자)
  4. "デコード" (4자)
- 자동감지 근거:
  - **B6** (Medium): slash in option: "A/D変換"
---
### Q-21e286a8-e6ef-4c2b-a9cb-8b6327c15ed6
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "NOT演算について正しい説明はどれか。"
- options:
  1. [정답] "入力の真偽を反転させる演算" (13자)
  2. "二つの入力の論理積を求める演算" (15자)
  3. "二つの入力の論理和を求める演算" (15자)
  4. "入力値をそのまま出力する演算" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (13 vs others 15,15,14)
---
### Q-66ee5a44-2476-4988-89b7-9cc72d208c80
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ベン図とは何か。"
- options:
  1. [정답] "集合の関係を図形で表現した図" (14자)
  2. "データの流れを表現した図" (12자)
  3. "プログラムの構造を表現した図" (14자)
  4. "ネットワーク構成を表現した図" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (14 vs others 12)
---
### Q-d72790df-21ad-482b-b3ee-c86fea3ce9ad
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "真理値表とは何か。"
- options:
  1. [정답] "論理演算の入出力をすべて一覧にした表" (18자)
  2. "データベースのテーブル構造を示す図" (17자)
  3. "プログラムの実行結果を記録した表" (16자)
  4. "ネットワークの接続状況を示す表" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 17,16,15)
---
### Q-fe46d70d-535a-4111-8a6a-816d2dc877f2
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "BCD（2進化10進数）の説明として正しいものはどれか。"
- options:
  1. [정답] "10進数の各桁を4ビットの2進数で表す方式" (21자)
  2. "2進数を10進数に変換するアルゴリズム" (19자)
  3. "16進数を2進数で表す方式" (13자)
  4. "8進数の各桁を3ビットで表す方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.62x (max=21, min=13)
  - **B5-a** (Medium): correct is longest (21 vs others 19,13,16)
---
### Q-204f8eb2-d46b-4c4c-90d6-951efd01f333
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "カルノー図の用途として正しいものはどれか。"
- options:
  1. [정답] "論理式を視覚的に簡略化する" (13자)
  2. "データの流れを可視化する" (12자)
  3. "ネットワーク構成を表現する" (13자)
  4. "データベースのテーブル関係を示す" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.33x (max=16, min=12)
---
### Q-8d11029c-4937-47cf-b923-e6bd9c11079b
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "加算器において、全加算器（Full Adder）が半加算器（Half Adder）と異なる点はどれか。"
- options:
  1. [정답] "下位桁からの繰り上がりを入力として扱える" (20자)
  2. "減算も同時に行える" (9자)
  3. "浮動小数点数を扱える" (10자)
  4. "3つ以上の数の加算を同時に行える" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.22x (max=20, min=9)
  - **B5-a** (Medium): correct is longest (20 vs others 9,10,16)
---
### Q-8e45c7af-f720-4347-99f4-f41ff9e35374
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "オートマトンの説明として正しいものはどれか。"
- options:
  1. [정답] "入力に応じて状態が遷移する抽象的な計算モデル" (22자)
  2. "自動的にプログラムを生成するツール" (17자)
  3. "データベースを自動管理するシステム" (17자)
  4. "ネットワークを自動監視するソフトウェア" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=22, min=17)
  - **B5-a** (Medium): correct is longest (22 vs others 17,17,19)
---
### Q-a1ad5301-2c99-40bb-b7d0-5ac169fba845
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ド・モルガンの法則として正しいものはどれか。"
- options:
  1. [정답] "¬(A∧B) = ¬A∨¬B" (14자)
  2. "¬(A∧B) = ¬A∧¬B" (14자)
  3. "¬(A∨B) = ¬A∨¬B" (14자)
  4. "¬(A∧B) = A∨B" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (14 vs others 12)
---
### Q-c1a7574e-21c9-4f9c-a806-70e66179e4aa
- quiz_id: 0c498260-8162-48c7-a198-d563a1c4d536
- question_category: basic_theory, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "状態遷移図の説明として正しいものはどれか。"
- options:
  1. [정답] "システムの状態と遷移を図で表したもの" (18자)
  2. "データの流れを表した図" (11자)
  3. "クラスの継承関係を表した図" (13자)
  4. "プロセスのスケジューリングを表した図" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 11,13)
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
