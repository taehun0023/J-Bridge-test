# CS os カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 127
**Rubric**: docs/exam_quality_rubric.md v2

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 4건    | 3.1% |
| Medium  | 96건    | 75.6% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 100 / 127 (78.7%)
**A2-exempt (필터링됨)**: 0건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|
| a0000003... | 43 | 29 | 67.4% | 3 | 7.0% | **FAIL** |
| bbae6864... | 35 | 35 | 100.0% | 0 | 0.0% | **FAIL** |
| a6cfb45b... | 8 | 8 | 100.0% | 0 | 0.0% | **FAIL** |
| e1afaf9c... | 8 | 7 | 87.5% | 0 | 0.0% | **FAIL** |
| b69b76bc... | 8 | 8 | 100.0% | 0 | 0.0% | **FAIL** |
| 60000001... | 2 | 2 | 100.0% | 0 | 0.0% | **FAIL** |
| 3ba24aae... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |

**B5-b 위반 퀴즈**: 7개 — 정답 길이 분포 재조정 필요

## High 우선순위 이슈

### Q-72000263-5fa1-449b-ae5b-416d7c030087
- quiz_id: 64f2db3f-c67f-4d9c-8827-147d133838db
- question_category: os, difficulty: easy
- 클레임: 있음(1건)
- 위반 항목: [CLAIM]
- question_text: "複数のプロセスが互いの資源を待ち合い進行できない状態を何というか。"
- options:
  1. [정답] "デッドロック" (6자)
  2. "スラッシング" (6자)
  3. "スタベーション" (7자)
  4. "ライブロック" (6자)
- 자동감지 근거:
  - **CLAIM** (High): 1 claim(s): 동일한 문제가 반복적으로 나오는 현상 확인.
---
### Q-21bfd1e6-633e-41f6-8266-dd239df78849
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: os, difficulty: hard
- 클레임: 있음(1건)
- 위반 항목: [B5-a, B5-a, B8, CLAIM]
- question_text: "OS運용ケース12: 標本化（サンプリング）の説明として正しいものはどれか。  実運用上の影響まで踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "アナログ信号を一定間隔で測定すること" (18자)
  2. "デジタルデータを圧縮すること" (14자)
  3. "データを暗号化すること" (11자)
  4. "ファイルをバックアップすること" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 14,11,15)
  - **B8** (Medium): Korean hangul in question_text
  - **CLAIM** (High): 1 claim(s): 문제에 한글 혼용.
---
### Q-5c4e9b76-c5c9-4a33-826e-38dbf08801fb
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: os, difficulty: easy
- 클레임: 있음(1건)
- 위반 항목: [B5-a, B5-a, B8, CLAIM]
- question_text: "OS運용ケース13: 次のメモリ管理の観点から、標本化（サンプリング）の説明として正しいものはどれか。 実装や運用上の含意まで含めて最も適切なものを選べ。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "アナログ信号を一定間隔で測定すること" (18자)
  2. "デジタルデータを圧縮すること" (14자)
  3. "データを暗号化すること" (11자)
  4. "ファイルをバックアップすること" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 14,11,15)
  - **B8** (Medium): Korean hangul in question_text
  - **CLAIM** (High): 1 claim(s): 동일한 문제가 반복기출되는 현상 확인.
---
### Q-e54f82dc-4134-47d9-bd38-a7628fea4075
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: os, difficulty: medium
- 클레임: 있음(1건)
- 위반 항목: [B5-a, B5-a, B8, CLAIM]
- question_text: "OS運용ケース14: 次のOS運用場面を想定するとき、標本化（サンプリング）の説明として正しいものはどれか。 実装や運用上の含意まで含めて最も適切なものを選べ。  原因と結果の関係を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "アナログ信号を一定間隔で測定すること" (18자)
  2. "デジタルデータを圧縮すること" (14자)
  3. "データを暗号化すること" (11자)
  4. "ファイルをバックアップすること" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 14,11,15)
  - **B8** (Medium): Korean hangul in question_text
  - **CLAIM** (High): 1 claim(s): 문제에 한글 혼용.
---

## Medium 우선순위 이슈

### Q-8fe9e9f4-956d-49bb-b0f5-f23c44bb2265
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "標本化（サンプリング）の説明として正しいものはどれか。"
- options:
  1. [정답] "アナログ信号を一定間隔で測定すること" (18자)
  2. "デジタルデータを圧縮すること" (14자)
  3. "データを暗号化すること" (11자)
  4. "ファイルをバックアップすること" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 14,11,15)
---
### Q-396be538-af4e-4103-921b-14004038089b
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "プロセスとスレッドの違いとして正しいものはどれか。"
- options:
  1. "スレッドはプロセスより多くのメモリを消費する" (22자)
  2. "プロセスは同一メモリ空間を共有する" (17자)
  3. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 22,17,15)
---
### Q-f25b5605-4acc-43ea-b062-07ce0e34d890
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OSのカーネルの役割として最も適切なものはどれか。"
- options:
  1. [정답] "ハードウェアやプロセス、メモリなどシステム全体を制御する" (28자)
  2. "ユーザーのGUIを描画する" (13자)
  3. "アプリケーションのインストールを行う" (18자)
  4. "ファイルの圧縮と暗号化を行う" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.15x (max=28, min=13)
  - **B5-a** (Medium): correct is longest (28 vs others 13,18,14)
---
### Q-93b5a028-148a-410d-a97e-e209c3e74f45
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ページングの説明として正しいものはどれか。"
- options:
  1. "メモリを可変サイズのセグメントに分割する" (20자)
  2. [정답] "メモリを固定サイズのページに分割し仮想アドレスを物理アドレスに変換する" (35자)
  3. "ディスク全体をメモリとして使用する" (17자)
  4. "CPUキャッシュの管理方式の一つ" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.19x (max=35, min=16)
  - **B5-a** (Medium): correct is longest (35 vs others 20,17,16)
---
### Q-619d316e-6cdb-426f-8ab6-6dad639294ef
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ラウンドロビンスケジューリングの説明として正しいものはどれか。"
- options:
  1. "最も短い実行時間のプロセスを優先する" (18자)
  2. [정답] "各プロセスに等しいタイムスライスを順番に割り当てる" (25자)
  3. "優先度の高いプロセスが常に先に実行される" (20자)
  4. "先に到着したプロセスが完了するまで実行される" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.39x (max=25, min=18)
  - **B5-a** (Medium): correct is longest (25 vs others 18,20,22)
---
### Q-e0437541-1751-4538-9afb-fec9d40c1f0d
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "仮想記憶方式におけるページテーブルの役割として正しいものはどれか。"
- options:
  1. "プロセス間の通信データを格納するための共有メモリ領域を管理する" (31자)
  2. [정답] "仮想アドレスから物理アドレスへの変換を行う対応表である" (27자)
  3. "ディスク上のファイルシステムのブロック割り当てを管理する" (28자)
  4. "CPUのレジスタ割り当てを最適化するためのテーブルである" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (27 vs others 31,28,28)
---
### Q-69eaec02-12cd-4d1e-90d4-98e54d8c16cc
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ページ置換アルゴリズムに関する説明として正しいものはどれか。"
- options:
  1. "FIFOは最も使用頻度の低いページを置換し、LRUは最も古いページを置換する" (38자)
  2. "LRUとFIFOは常に同じページフォールト率を示す" (25자)
  3. [정답] "FIFOではBéládyの異常が起こりうるが、LRUでは起こらない" (33자)
  4. "LRUの方がFIFOより実装コストが低く、常にすべての面で優れている" (34자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.52x (max=38, min=25)
---
### Q-f65dd1cb-0556-4d2f-9477-f8805a61db38
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "メモリ管理方式であるページングとセグメンテーションの比較として正しいものはどれか。"
- options:
  1. [정답] "ページングは固定サイズで外部フラグメンテーションがなく、セグメンテーションは可変サイズで外部フラグメンテーションが起こりうる" (62자)
  2. "セグメンテーションは固定サイズで外部フラグメンテーションがなく、ページングは可変サイズである" (46자)
  3. "両方とも固定サイズで管理され、フラグメンテーションの違いはない" (31자)
  4. "ページングは論理的な単位で分割し、セグメンテーションは物理的な単位で分割する" (38자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=62, min=31)
  - **B5-a** (Medium): correct is longest (62 vs others 46,31,38)
---
### Q-c8e08e15-66e8-4a54-89b3-c8d62d5b411b
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "プロセススケジューリングにおける優先度ベース方式とラウンドロビン方式の比較として正しいものはどれか。"
- options:
  1. "ラウンドロビンはスタベーションが発生するが、優先度ベースでは発生しない" (35자)
  2. [정답] "優先度ベースではスタベーションが起こりうるが、エージング技法で防止できる" (36자)
  3. "ラウンドロビンは非プリエンプティブであり、実行中のプロセスは完了まで中断されない" (40자)
  4. "優先度ベースは常にラウンドロビンより応答時間が短い" (25자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=40, min=25)
---
### Q-9badd323-59f9-44bf-96b2-31bb14635104
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "UNIX系ファイルシステムにおけるi-node（アイノード）の説明として正しいものはどれか。"
- options:
  1. "ファイル名とファイルの内容データを直接格納するデータ構造である" (31자)
  2. "ディレクトリの階層構造を表現するためのツリー構造である" (27자)
  3. [정답] "ファイルのメタデータとデータブロックへのポインタを格納し、ファイル名は含まない" (39자)
  4. "ファイルのバックアップ情報を保存するための補助構造である" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=39, min=27)
  - **B5-a** (Medium): correct is longest (39 vs others 31,27,28)
---
### Q-48685202-670a-4153-83b9-f08953cf6851
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ファイルシステムの主な役割として正しいものはどれか。"
- options:
  1. "CPUのタスクスケジューリング" (15자)
  2. "ネットワーク接続の管理" (11자)
  3. [정답] "ディスク上のデータを階層的に整理し管理する" (21자)
  4. "メモリの仮想アドレス変換" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.91x (max=21, min=11)
  - **B5-a** (Medium): correct is longest (21 vs others 15,11,12)
---
### Q-f1000001-0000-4000-a000-000000000121
- quiz_id: 60000001-0000-0000-0000-000000000006 (CS知識 オペレーティングシステム Final)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ページフォールトが発生するのはどのようなときか。"
- options:
  1. [정답] "必要なページが主記憶に存在しないとき" (18자)
  2. "CPUのクロック周波数が低下したとき" (18자)
  3. "同じロックを二重に取得したとき" (15자)
  4. "ファイル名が重複したとき" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=18, min=12)
  - **B5-a** (Medium): correct is longest (18 vs others 15,12)
---
### Q-a4659253-e40e-4e39-b40f-3757a5d1a81d
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "デッドロックの説明として正しいものはどれか。"
- options:
  1. [정답] "複数のプロセスが互いに資源を待ち合い進行不能になる状態" (27자)
  2. "プロセスが無限ループに入る状態" (15자)
  3. "メモリが不足してプロセスが停止する状態" (19자)
  4. "CPUの使用率が100%になる状態" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=27, min=15)
  - **B5-a** (Medium): correct is longest (27 vs others 15,19,17)
---
### Q-032c0b44-1678-4962-8c01-228d5316f647
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ファイルシステムの役割として正しいものはどれか。"
- options:
  1. [정답] "ストレージ上のデータを管理する仕組み" (18자)
  2. "CPUの処理速度を管理する仕組み" (16자)
  3. "ネットワーク接続を管理する仕組み" (16자)
  4. "ユーザーの認証を管理する仕組み" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 16,16,15)
---
### Q-433a7e3c-9770-426f-9455-2eb547c19619
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ページフォルトが発生する状況として正しいものはどれか。"
- options:
  1. "CPUキャッシュにデータが見つからなかった場合" (23자)
  2. [정답] "アクセスしたページが物理メモリ上に存在しない場合" (24자)
  3. "ファイルシステムのエラーが発生した場合" (19자)
  4. "プロセスの優先度が変更された場合" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=24, min=16)
  - **B5-a** (Medium): correct is longest (24 vs others 23,19,16)
---
### Q-416543ee-3456-4134-819a-905828f72b35
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "セマフォの説明として正しいものはどれか。"
- options:
  1. [정답] "カウンタ変数で共有資源へのアクセスを制御する同期機構" (26자)
  2. "プロセス間でデータを送受信する仕組み" (18자)
  3. "メモリを自動的に管理する仕組み" (15자)
  4. "ファイルのアクセス権を管理する仕組み" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=26, min=15)
  - **B5-a** (Medium): correct is longest (26 vs others 18,15,18)
---
### Q-8eed3b0e-44fb-479d-86d9-569cc8ca60b4
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ラウンドロビン方式のプロセススケジューリングの説明として正しいものはどれか。"
- options:
  1. [정답] "各プロセスに均等な時間を割り当て順番に実行する方式" (25자)
  2. "最も優先度の高いプロセスを常に実行する方式" (21자)
  3. "実行時間の短いプロセスを優先する方式" (18자)
  4. "先に到着したプロセスを先に実行する方式" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.39x (max=25, min=18)
  - **B5-a** (Medium): correct is longest (25 vs others 21,18,19)
---
### Q-50bba785-d14f-4526-a80c-9380918ef2fc
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ページングの説明として正しいものはどれか。"
- options:
  1. [정답] "メモリを固定サイズのページに分割して管理する方式" (24자)
  2. "メモリを可変サイズのセグメントに分割する方式" (22자)
  3. "メモリの使用量を監視する方式" (14자)
  4. "メモリ内のデータを暗号化する方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=24, min=14)
  - **B5-a** (Medium): correct is longest (24 vs others 22,14,16)
---
### Q-b530ec76-d8b0-4044-b7cf-38ea4cda2d54
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "コンテキストスイッチの説明として正しいものはどれか。"
- options:
  1. "メモリの内容をディスクに書き出すこと" (18자)
  2. [정답] "プロセスの状態を保存し別のプロセスの状態を復元してCPUを切り替えること" (36자)
  3. "ユーザーモードからカーネルモードへの遷移のみを指す" (25자)
  4. "プロセスを終了して新しいプロセスを起動すること" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=36, min=18)
  - **B5-a** (Medium): correct is longest (36 vs others 18,25,23)
---
### Q-79569b91-c76a-40c3-9591-9bf2c62f3bd5
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B6]
- question_text: "仮想メモリの利点として正しいものはどれか。"
- options:
  1. "プログラムの実行速度が必ず向上する" (17자)
  2. [정답] "物理メモリより大きなアドレス空間を利用できる" (22자)
  3. "ディスクI/Oが不要になる" (13자)
  4. "メモリリークが完全に防止される" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=22, min=13)
  - **B5-a** (Medium): correct is longest (22 vs others 17,13,15)
  - **B6** (Medium): slash in option: "ディスクI/Oが不要になる"
---
### Q-29063da6-e6f0-4714-8181-c0be4984111a
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "スラッシングの説明として正しいものはどれか。"
- options:
  1. [정답] "ページの入れ替えが頻発して処理効率が著しく低下する現象" (27자)
  2. "CPUの処理速度が低下する現象" (15자)
  3. "ハードディスクが故障する現象" (14자)
  4. "ネットワークの通信速度が低下する現象" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.93x (max=27, min=14)
  - **B5-a** (Medium): correct is longest (27 vs others 15,14,18)
---
### Q-41ddb427-9b7f-49d2-8c0a-96c4698996ba
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "デッドロックの説明として正しいものはどれか。"
- options:
  1. [정답] "複数のトランザクションが互いにロックを待ち合う状態" (25자)
  2. "データベースの容量が不足した状態" (16자)
  3. "ネットワーク切断でトランザクションが中断した状態" (24자)
  4. "インデックスが破損した状態" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 16,24,13)
---
### Q-dd996a7e-3fc3-4ff1-8a50-abfabc02eaba
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "プロセスとスレッドの違いとして正しいものはどれか。"
- options:
  1. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  2. "プロセスはスレッドより軽量である" (16자)
  3. "スレッドは独立したメモリ空間を持つ" (17자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 16,17,15)
---
### Q-ef47d31a-9cd7-4dab-9b93-2653f0c995dd
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "GPUの用途として最も適切なものはどれか。"
- options:
  1. [정답] "画像処理や並列計算" (9자)
  2. "データの長期保存" (8자)
  3. "ネットワーク通信の制御" (11자)
  4. "文書の印刷処理" (7자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=11, min=7)
---
### Q-6f913e4a-8c11-48d8-819b-3b52b4814389
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "B木（Bツリー）が主に使用される場面はどれか。"
- options:
  1. [정답] "データベースのインデックス" (13자)
  2. "メモリ内のソート" (8자)
  3. "ネットワークのルーティング" (13자)
  4. "画像の圧縮処理" (7자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.86x (max=13, min=7)
  - **B5-a** (Medium): correct is longest (13 vs others 8,7)
---
### Q-fcb60331-886a-4567-854f-c9549f02cf0b
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、ページングの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "メモリを固定サイズのページに分割して管理する方式" (24자)
  2. "メモリを可変サイズのセグメントに分割する方式" (22자)
  3. "メモリの使用量を監視する方式" (14자)
  4. "メモリ内のデータを暗号化する方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=24, min=14)
  - **B5-a** (Medium): correct is longest (24 vs others 22,14,16)
---
### Q-2989f042-fdfc-4ffd-8c61-5ea42b7ce44d
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、スラッシングの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "ページの入れ替えが頻発して処理効率が著しく低下する現象" (27자)
  2. "CPUの処理速度が低下する現象" (15자)
  3. "ハードディスクが故障する現象" (14자)
  4. "ネットワークの通信速度が低下する現象" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.93x (max=27, min=14)
  - **B5-a** (Medium): correct is longest (27 vs others 15,14,18)
---
### Q-d528bd4d-db5c-48de-80c1-4772136bc6bb
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、プロセスとスレッドの違いとして正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  2. "プロセスはスレッドより軽量である" (16자)
  3. "スレッドは独立したメモリ空間を持つ" (17자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 16,17,15)
---
### Q-aafd3ea4-7ffd-405b-9294-21e82c6bac26
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、デッドロックの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "複数のプロセスが互いに資源を待ち合い進行不能になる状態" (27자)
  2. "プロセスが無限ループに入る状態" (15자)
  3. "メモリが不足してプロセスが停止する状態" (19자)
  4. "CPUの使用率が100%になる状態" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=27, min=15)
  - **B5-a** (Medium): correct is longest (27 vs others 15,19,17)
---
### Q-553892e5-7330-4687-8bb0-0c4d0d6a62fa
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、デッドロックの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "複数のトランザクションが互いにロックを待ち合う状態" (25자)
  2. "データベースの容量が不足した状態" (16자)
  3. "ネットワーク切断でトランザクションが中断した状態" (24자)
  4. "インデックスが破損した状態" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 16,24,13)
---
### Q-fd6b67a8-ad7e-42c9-ba18-c81930b959b7
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、標本化（サンプリング）の説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "アナログ信号を一定間隔で測定すること" (18자)
  2. "デジタルデータを圧縮すること" (14자)
  3. "データを暗号化すること" (11자)
  4. "ファイルをバックアップすること" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 14,11,15)
---
### Q-d3b757ae-355d-430b-a027-f6019b9397ad
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、ラウンドロビン方式のプロセススケジューリングの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "各プロセスに均等な時間を割り当て順番に実行する方式" (25자)
  2. "最も優先度の高いプロセスを常に実行する方式" (21자)
  3. "実行時間の短いプロセスを優先する方式" (18자)
  4. "先に到着したプロセスを先に実行する方式" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.39x (max=25, min=18)
  - **B5-a** (Medium): correct is longest (25 vs others 21,18,19)
---
### Q-b01af69b-20fc-4edb-8c3c-2546b229b92b
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "次のシステム障害対応の文脈で、ファイルシステムの役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "ストレージ上のデータを管理する仕組み" (18자)
  2. "CPUの処理速度を管理する仕組み" (16자)
  3. "ネットワーク接続を管理する仕組み" (16자)
  4. "ユーザーの認証を管理する仕組み" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 16,16,15)
---
### Q-7d4612f3-1777-4afa-ab2e-3a06db99495c
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、セマフォの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "カウンタ変数で共有資源へのアクセスを制御する同期機構" (26자)
  2. "プロセス間でデータを送受信する仕組み" (18자)
  3. "メモリを自動的に管理する仕組み" (15자)
  4. "ファイルのアクセス権を管理する仕組み" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=26, min=15)
  - **B5-a** (Medium): correct is longest (26 vs others 18,15,18)
---
### Q-cdc855aa-d242-4cf5-8dc6-fc9eeda10f6c
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、プロセスとスレッドの違いとして正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. "スレッドはプロセスより多くのメモリを消費する" (22자)
  2. "プロセスは同一メモリ空間を共有する" (17자)
  3. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 22,17,15)
---
### Q-82d65894-4927-40e1-b64c-cdf4205baf0d
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、ページングの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "メモリを固定サイズのページに分割して管理する方式" (24자)
  2. "メモリを可変サイズのセグメントに分割する方式" (22자)
  3. "メモリの使用量を監視する方式" (14자)
  4. "メモリ内のデータを暗号化する方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=24, min=14)
  - **B5-a** (Medium): correct is longest (24 vs others 22,14,16)
---
### Q-b2493b60-0921-4896-b954-4e734cf41c56
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、スラッシングの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "ページの入れ替えが頻発して処理効率が著しく低下する現象" (27자)
  2. "CPUの処理速度が低下する現象" (15자)
  3. "ハードディスクが故障する現象" (14자)
  4. "ネットワークの通信速度が低下する現象" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.93x (max=27, min=14)
  - **B5-a** (Medium): correct is longest (27 vs others 15,14,18)
---
### Q-eab1ad8c-0a02-4685-8093-bcc61f955425
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、プロセスとスレッドの違いとして正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  2. "プロセスはスレッドより軽量である" (16자)
  3. "スレッドは独立したメモリ空間を持つ" (17자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 16,17,15)
---
### Q-5b49bc96-bb57-401a-9c89-4879291cd059
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、デッドロックの説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "複数のプロセスが互いに資源を待ち合い進行不能になる状態" (27자)
  2. "プロセスが無限ループに入る状態" (15자)
  3. "メモリが不足してプロセスが停止する状態" (19자)
  4. "CPUの使用率が100%になる状態" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=27, min=15)
  - **B5-a** (Medium): correct is longest (27 vs others 15,19,17)
---
### Q-d8d1d7ce-8962-42f5-ad3f-7404b73afb9e
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、デッドロックの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "複数のトランザクションが互いにロックを待ち合う状態" (25자)
  2. "データベースの容量が不足した状態" (16자)
  3. "ネットワーク切断でトランザクションが中断した状態" (24자)
  4. "インデックスが破損した状態" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 16,24,13)
---
### Q-7475d413-2c40-4b14-a8c4-b98fd19250c7
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、ラウンドロビン方式のプロセススケジューリングの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "各プロセスに均等な時間を割り当て順番に実行する方式" (25자)
  2. "最も優先度の高いプロセスを常に実行する方式" (21자)
  3. "実行時間の短いプロセスを優先する方式" (18자)
  4. "先に到着したプロセスを先に実行する方式" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.39x (max=25, min=18)
  - **B5-a** (Medium): correct is longest (25 vs others 21,18,19)
---
### Q-48da5143-7369-4962-ae9a-238f85c6f3ed
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、標本化（サンプリング）の説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "アナログ信号を一定間隔で測定すること" (18자)
  2. "デジタルデータを圧縮すること" (14자)
  3. "データを暗号化すること" (11자)
  4. "ファイルをバックアップすること" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 14,11,15)
---
### Q-13137e5c-d6e0-4845-b23b-06ab7a512046
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、セマフォの説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "カウンタ変数で共有資源へのアクセスを制御する同期機構" (26자)
  2. "プロセス間でデータを送受信する仕組み" (18자)
  3. "メモリを自動的に管理する仕組み" (15자)
  4. "ファイルのアクセス権を管理する仕組み" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=26, min=15)
  - **B5-a** (Medium): correct is longest (26 vs others 18,15,18)
---
### Q-57f436e6-7804-49dd-8da6-ff3a4e534ec4
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "次のプロセス管理の状況で、ファイルシステムの役割として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "ストレージ上のデータを管理する仕組み" (18자)
  2. "CPUの処理速度を管理する仕組み" (16자)
  3. "ネットワーク接続を管理する仕組み" (16자)
  4. "ユーザーの認証を管理する仕組み" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 16,16,15)
---
### Q-2e60a796-acff-4e2d-837b-c6688b3f78b3
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、プロセスとスレッドの違いとして正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. "スレッドはプロセスより多くのメモリを消費する" (22자)
  2. "プロセスは同一メモリ空間を共有する" (17자)
  3. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 22,17,15)
---
### Q-f2d0894d-d0b9-456d-840a-2199d52b2b90
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、ファイルシステムの主な役割として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. "CPUのタスクスケジューリング" (15자)
  2. "ネットワーク接続の管理" (11자)
  3. [정답] "ディスク上のデータを階層的に整理し管理する" (21자)
  4. "メモリの仮想アドレス変換" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.91x (max=21, min=11)
  - **B5-a** (Medium): correct is longest (21 vs others 15,11,12)
---
### Q-4cc89bb1-e441-448b-bcb1-e79a4783daec
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、OSのカーネルの役割として最も適切なものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "ハードウェアやプロセス、メモリなどシステム全体を制御する" (28자)
  2. "ユーザーのGUIを描画する" (13자)
  3. "アプリケーションのインストールを行う" (18자)
  4. "ファイルの圧縮と暗号化を行う" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.15x (max=28, min=13)
  - **B5-a** (Medium): correct is longest (28 vs others 13,18,14)
---
### Q-e8a9f9ec-f792-48fb-a429-d5fda0762721
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、ページングの説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. "メモリを可変サイズのセグメントに分割する" (20자)
  2. [정답] "メモリを固定サイズのページに分割し仮想アドレスを物理アドレスに変換する" (35자)
  3. "ディスク全体をメモリとして使用する" (17자)
  4. "CPUキャッシュの管理方式の一つ" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.19x (max=35, min=16)
  - **B5-a** (Medium): correct is longest (35 vs others 20,17,16)
---
### Q-32974308-3344-449d-babc-98ff6365410e
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B6]
- question_text: "次のメモリ管理の観点から、仮想メモリの利点として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. "プログラムの実行速度が必ず向上する" (17자)
  2. [정답] "物理メモリより大きなアドレス空間を利用できる" (22자)
  3. "ディスクI/Oが不要になる" (13자)
  4. "メモリリークが完全に防止される" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=22, min=13)
  - **B5-a** (Medium): correct is longest (22 vs others 17,13,15)
  - **B6** (Medium): slash in option: "ディスクI/Oが不要になる"
---
### Q-e78252a0-3e6a-4cae-80e7-a0df03c48283
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、ラウンドロビンスケジューリングの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. "最も短い実行時間のプロセスを優先する" (18자)
  2. [정답] "各プロセスに等しいタイムスライスを順番に割り当てる" (25자)
  3. "優先度の高いプロセスが常に先に実行される" (20자)
  4. "先に到着したプロセスが完了するまで実行される" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.39x (max=25, min=18)
  - **B5-a** (Medium): correct is longest (25 vs others 18,20,22)
---
### Q-0c6e768c-c6ae-49a9-93d0-ff4ebb0f6261
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、コンテキストスイッチの説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. "メモリの内容をディスクに書き出すこと" (18자)
  2. [정답] "プロセスの状態を保存し別のプロセスの状態を復元してCPUを切り替えること" (36자)
  3. "ユーザーモードからカーネルモードへの遷移のみを指す" (25자)
  4. "プロセスを終了して新しいプロセスを起動すること" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=36, min=18)
  - **B5-a** (Medium): correct is longest (36 vs others 18,25,23)
---
### Q-0583be8c-014e-4857-95d5-29ad6511ea7a
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、ページフォルトが発生する状況として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. "CPUキャッシュにデータが見つからなかった場合" (23자)
  2. [정답] "アクセスしたページが物理メモリ上に存在しない場合" (24자)
  3. "ファイルシステムのエラーが発生した場合" (19자)
  4. "プロセスの優先度が変更された場合" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=24, min=16)
  - **B5-a** (Medium): correct is longest (24 vs others 23,19,16)
---
### Q-717437e6-a3a0-42a9-93c9-6c139c106988
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "次のメモリ管理の観点から、仮想記憶方式におけるページテーブルの役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. "プロセス間の通信データを格納するための共有メモリ領域を管理する" (31자)
  2. [정답] "仮想アドレスから物理アドレスへの変換を行う対応表である" (27자)
  3. "ディスク上のファイルシステムのブロック割り当てを管理する" (28자)
  4. "CPUのレジスタ割り当てを最適化するためのテーブルである" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (27 vs others 31,28,28)
---
### Q-a3981fa3-ed68-47d2-a0c2-cae6ce6f8783
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "次のOS運用場面を想定するとき、ページ置換アルゴリズムに関する説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. "FIFOは最も使用頻度の低いページを置換し、LRUは最も古いページを置換する" (38자)
  2. "LRUとFIFOは常に同じページフォールト率を示す" (25자)
  3. [정답] "FIFOではBéládyの異常が起こりうるが、LRUでは起こらない" (33자)
  4. "LRUの方がFIFOより実装コストが低く、常にすべての面で優れている" (34자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.52x (max=38, min=25)
---
### Q-3400fa7c-5958-495f-a21c-d17a66ac4c1d
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、ページングの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "メモリを固定サイズのページに分割して管理する方式" (24자)
  2. "メモリを可変サイズのセグメントに分割する方式" (22자)
  3. "メモリの使用量を監視する方式" (14자)
  4. "メモリ内のデータを暗号化する方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=24, min=14)
  - **B5-a** (Medium): correct is longest (24 vs others 22,14,16)
---
### Q-0820c5d2-b7b6-403a-be67-0d166b5b5c9f
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、スラッシングの説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "ページの入れ替えが頻発して処理効率が著しく低下する現象" (27자)
  2. "CPUの処理速度が低下する現象" (15자)
  3. "ハードディスクが故障する現象" (14자)
  4. "ネットワークの通信速度が低下する現象" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.93x (max=27, min=14)
  - **B5-a** (Medium): correct is longest (27 vs others 15,14,18)
---
### Q-8d5884d3-79c3-4455-abe0-8ffa58e0dc58
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、プロセスとスレッドの違いとして正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  2. "プロセスはスレッドより軽量である" (16자)
  3. "スレッドは独立したメモリ空間を持つ" (17자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 16,17,15)
---
### Q-0ec50f8d-e129-46e5-950b-c87e25931629
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、デッドロックの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "複数のプロセスが互いに資源を待ち合い進行不能になる状態" (27자)
  2. "プロセスが無限ループに入る状態" (15자)
  3. "メモリが不足してプロセスが停止する状態" (19자)
  4. "CPUの使用率が100%になる状態" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=27, min=15)
  - **B5-a** (Medium): correct is longest (27 vs others 15,19,17)
---
### Q-4aa02e9e-e900-4169-9cd3-3af9216fc8d9
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、デッドロックの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "複数のトランザクションが互いにロックを待ち合う状態" (25자)
  2. "データベースの容量が不足した状態" (16자)
  3. "ネットワーク切断でトランザクションが中断した状態" (24자)
  4. "インデックスが破損した状態" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 16,24,13)
---
### Q-005aba9a-c422-4f37-865b-b7f7a5ef9289
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、標本化（サンプリング）の説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "アナログ信号を一定間隔で測定すること" (18자)
  2. "デジタルデータを圧縮すること" (14자)
  3. "データを暗号化すること" (11자)
  4. "ファイルをバックアップすること" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 14,11,15)
---
### Q-a705aa6a-db48-42bb-859b-da9176bd2a7d
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、ラウンドロビン方式のプロセススケジューリングの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "各プロセスに均等な時間を割り当て順番に実行する方式" (25자)
  2. "最も優先度の高いプロセスを常に実行する方式" (21자)
  3. "実行時間の短いプロセスを優先する方式" (18자)
  4. "先に到着したプロセスを先に実行する方式" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.39x (max=25, min=18)
  - **B5-a** (Medium): correct is longest (25 vs others 21,18,19)
---
### Q-9e11940d-2387-4805-896c-f49d6f86a1d4
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "次のプロセス管理の状況で、ファイルシステムの役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "ストレージ上のデータを管理する仕組み" (18자)
  2. "CPUの処理速度を管理する仕組み" (16자)
  3. "ネットワーク接続を管理する仕組み" (16자)
  4. "ユーザーの認証を管理する仕組み" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 16,16,15)
---
### Q-b877b21a-5d05-40ab-b786-810c351a4f9c
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、セマフォの説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "カウンタ変数で共有資源へのアクセスを制御する同期機構" (26자)
  2. "プロセス間でデータを送受信する仕組み" (18자)
  3. "メモリを自動的に管理する仕組み" (15자)
  4. "ファイルのアクセス権を管理する仕組み" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=26, min=15)
  - **B5-a** (Medium): correct is longest (26 vs others 18,15,18)
---
### Q-5f62686b-fd47-42af-8683-e4b112955112
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、プロセスとスレッドの違いとして正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. "スレッドはプロセスより多くのメモリを消費する" (22자)
  2. "プロセスは同一メモリ空間を共有する" (17자)
  3. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 22,17,15)
---
### Q-1837f2ca-be8b-40d0-8568-54ee0e2632f4
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、ファイルシステムの主な役割として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. "CPUのタスクスケジューリング" (15자)
  2. "ネットワーク接続の管理" (11자)
  3. [정답] "ディスク上のデータを階層的に整理し管理する" (21자)
  4. "メモリの仮想アドレス変換" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.91x (max=21, min=11)
  - **B5-a** (Medium): correct is longest (21 vs others 15,11,12)
---
### Q-acb89fe0-fcda-46f8-a702-33dde327ec7b
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、OSのカーネルの役割として最も適切なものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "ハードウェアやプロセス、メモリなどシステム全体を制御する" (28자)
  2. "ユーザーのGUIを描画する" (13자)
  3. "アプリケーションのインストールを行う" (18자)
  4. "ファイルの圧縮と暗号化を行う" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.15x (max=28, min=13)
  - **B5-a** (Medium): correct is longest (28 vs others 13,18,14)
---
### Q-afbb8816-584b-40b6-83b3-b69273099b3d
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、ページングの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. "メモリを可変サイズのセグメントに分割する" (20자)
  2. [정답] "メモリを固定サイズのページに分割し仮想アドレスを物理アドレスに変換する" (35자)
  3. "ディスク全体をメモリとして使用する" (17자)
  4. "CPUキャッシュの管理方式の一つ" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.19x (max=35, min=16)
  - **B5-a** (Medium): correct is longest (35 vs others 20,17,16)
---
### Q-d6a54cf6-7ca8-4cc6-9fa9-2cca8001a228
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B6]
- question_text: "次のメモリ管理の観点から、仮想メモリの利点として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. "プログラムの実行速度が必ず向上する" (17자)
  2. [정답] "物理メモリより大きなアドレス空間を利用できる" (22자)
  3. "ディスクI/Oが不要になる" (13자)
  4. "メモリリークが完全に防止される" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=22, min=13)
  - **B5-a** (Medium): correct is longest (22 vs others 17,13,15)
  - **B6** (Medium): slash in option: "ディスクI/Oが不要になる"
---
### Q-865e1a29-e422-429f-81e9-e88ccf8a6869
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、ラウンドロビンスケジューリングの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. "最も短い実行時間のプロセスを優先する" (18자)
  2. [정답] "各プロセスに等しいタイムスライスを順番に割り当てる" (25자)
  3. "優先度の高いプロセスが常に先に実行される" (20자)
  4. "先に到着したプロセスが完了するまで実行される" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.39x (max=25, min=18)
  - **B5-a** (Medium): correct is longest (25 vs others 18,20,22)
---
### Q-83d9c05f-7f04-47a7-8c47-1d8be8931f27
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、コンテキストスイッチの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. "メモリの内容をディスクに書き出すこと" (18자)
  2. [정답] "プロセスの状態を保存し別のプロセスの状態を復元してCPUを切り替えること" (36자)
  3. "ユーザーモードからカーネルモードへの遷移のみを指す" (25자)
  4. "プロセスを終了して新しいプロセスを起動すること" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=36, min=18)
  - **B5-a** (Medium): correct is longest (36 vs others 18,25,23)
---
### Q-56570bcf-3725-45f2-8550-73c452414779
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、ページフォルトが発生する状況として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. "CPUキャッシュにデータが見つからなかった場合" (23자)
  2. [정답] "アクセスしたページが物理メモリ上に存在しない場合" (24자)
  3. "ファイルシステムのエラーが発生した場合" (19자)
  4. "プロセスの優先度が変更された場合" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=24, min=16)
  - **B5-a** (Medium): correct is longest (24 vs others 23,19,16)
---
### Q-0042d412-380e-4ed8-b652-d9e2b783b95f
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "次のメモリ管理の観点から、仮想記憶方式におけるページテーブルの役割として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. "プロセス間の通信データを格納するための共有メモリ領域を管理する" (31자)
  2. [정답] "仮想アドレスから物理アドレスへの変換を行う対応表である" (27자)
  3. "ディスク上のファイルシステムのブロック割り当てを管理する" (28자)
  4. "CPUのレジスタ割り当てを最適化するためのテーブルである" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (27 vs others 31,28,28)
---
### Q-bc032077-c02e-4961-880b-736b7ee68311
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "次のOS運用場面を想定するとき、ページ置換アルゴリズムに関する説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. "FIFOは最も使用頻度の低いページを置換し、LRUは最も古いページを置換する" (38자)
  2. "LRUとFIFOは常に同じページフォールト率を示す" (25자)
  3. [정답] "FIFOではBéládyの異常が起こりうるが、LRUでは起こらない" (33자)
  4. "LRUの方がFIFOより実装コストが低く、常にすべての面で優れている" (34자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.52x (max=38, min=25)
---
### Q-641c8b1f-496b-4204-b898-571e20d95354
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、メモリ管理方式であるページングとセグメンテーションの比較として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "ページングは固定サイズで外部フラグメンテーションがなく、セグメンテーションは可変サイズで外部フラグメンテーションが起こりうる" (62자)
  2. "セグメンテーションは固定サイズで外部フラグメンテーションがなく、ページングは可変サイズである" (46자)
  3. "両方とも固定サイズで管理され、フラグメンテーションの違いはない" (31자)
  4. "ページングは論理的な単位で分割し、セグメンテーションは物理的な単位で分割する" (38자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=62, min=31)
  - **B5-a** (Medium): correct is longest (62 vs others 46,31,38)
---
### Q-e2715cf1-3061-4db5-a377-8b2120111c0e
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "次のメモリ管理の観点から、プロセススケジューリングにおける優先度ベース方式とラウンドロビン方式の比較として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. "ラウンドロビンはスタベーションが発生するが、優先度ベースでは発生しない" (35자)
  2. [정답] "優先度ベースではスタベーションが起こりうるが、エージング技法で防止できる" (36자)
  3. "ラウンドロビンは非プリエンプティブであり、実行中のプロセスは完了まで中断されない" (40자)
  4. "優先度ベースは常にラウンドロビンより応答時間が短い" (25자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=40, min=25)
---
### Q-0004dc27-3e1d-40a1-8320-109c559dadc7
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のOS運用場面を想定するとき、UNIX系ファイルシステムにおけるi-node（アイノード）の説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. "ファイル名とファイルの内容データを直接格納するデータ構造である" (31자)
  2. "ディレクトリの階層構造を表現するためのツリー構造である" (27자)
  3. [정답] "ファイルのメタデータとデータブロックへのポインタを格納し、ファイル名は含まない" (39자)
  4. "ファイルのバックアップ情報を保存するための補助構造である" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=39, min=27)
  - **B5-a** (Medium): correct is longest (39 vs others 31,27,28)
---
### Q-4fd2f136-3342-43ef-945d-69587dcb8f96
- quiz_id: 60000001-0000-0000-0000-000000000006 (CS知識 オペレーティングシステム Final)
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のシステム障害対応の文脈で、ページフォールトが発生するのはどのようなときか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "必要なページが主記憶に存在しないとき" (18자)
  2. "CPUのクロック周波数が低下したとき" (18자)
  3. "同じロックを二重に取得したとき" (15자)
  4. "ファイル名が重複したとき" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=18, min=12)
  - **B5-a** (Medium): correct is longest (18 vs others 15,12)
---
### Q-b5a8013f-9ec5-44f4-9427-7bf71aa69e17
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロセス管理の状況で、ページングの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "メモリを固定サイズのページに分割して管理する方式" (24자)
  2. "メモリを可変サイズのセグメントに分割する方式" (22자)
  3. "メモリの使用量を監視する方式" (14자)
  4. "メモリ内のデータを暗号化する方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=24, min=14)
  - **B5-a** (Medium): correct is longest (24 vs others 22,14,16)
---
### Q-1289e6b0-5c57-4327-975f-8c42caef31e6
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のメモリ管理の観点から、スラッシングの説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "ページの入れ替えが頻発して処理効率が著しく低下する現象" (27자)
  2. "CPUの処理速度が低下する現象" (15자)
  3. "ハードディスクが故障する現象" (14자)
  4. "ネットワークの通信速度が低下する現象" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.93x (max=27, min=14)
  - **B5-a** (Medium): correct is longest (27 vs others 15,14,18)
---
### Q-9db1a5ae-ce5b-4310-9830-95b0754cb4d1
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース01: ページングの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "メモリを固定サイズのページに分割して管理する方式" (24자)
  2. "メモリを可変サイズのセグメントに分割する方式" (22자)
  3. "メモリの使用量を監視する方式" (14자)
  4. "メモリ内のデータを暗号化する方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=24, min=14)
  - **B5-a** (Medium): correct is longest (24 vs others 22,14,16)
---
### Q-8c21cb95-4d0f-4a2a-978d-51ce8eef38ce
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース02: スラッシングの説明として正しいものはどれか。  原因と結果の関係を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "ページの入れ替えが頻発して処理効率が著しく低下する現象" (27자)
  2. "CPUの処理速度が低下する現象" (15자)
  3. "ハードディスクが故障する現象" (14자)
  4. "ネットワークの通信速度が低下する現象" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.93x (max=27, min=14)
  - **B5-a** (Medium): correct is longest (27 vs others 15,14,18)
---
### Q-5debec1c-5057-4bc1-a5b8-50fd3b67d68d
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース03: プロセスとスレッドの違いとして正しいものはどれか。  実運用上の影響まで踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  2. "プロセスはスレッドより軽量である" (16자)
  3. "スレッドは独立したメモリ空間を持つ" (17자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 16,17,15)
---
### Q-e71d734d-76b9-431c-bf1e-2adf45785403
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース04: デッドロックの説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "複数のプロセスが互いに資源を待ち合い進行不能になる状態" (27자)
  2. "プロセスが無限ループに入る状態" (15자)
  3. "メモリが不足してプロセスが停止する状態" (19자)
  4. "CPUの使用率が100%になる状態" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=27, min=15)
  - **B5-a** (Medium): correct is longest (27 vs others 15,19,17)
---
### Q-9dd7bccd-bab1-4538-8c0f-2884ef9aa53f
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース06: デッドロックの説明として正しいものはどれか。  実運用上の影響まで踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "複数のトランザクションが互いにロックを待ち合う状態" (25자)
  2. "データベースの容量が不足した状態" (16자)
  3. "ネットワーク切断でトランザクションが中断した状態" (24자)
  4. "インデックスが破損した状態" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 16,24,13)
---
### Q-eeb7ee45-bb8e-4ec4-9825-b2d0a0843242
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース08: 次のプロセス管理の状況で、デッドロックの説明として正しいものはどれか。 実装や運用上の含意まで含めて最も適切なものを選べ。  原因と結果の関係を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "複数のトランザクションが互いにロックを待ち合う状態" (25자)
  2. "データベースの容量が不足した状態" (16자)
  3. "ネットワーク切断でトランザクションが中断した状態" (24자)
  4. "インデックスが破損した状態" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 16,24,13)
---
### Q-37279bbe-8f05-4481-831f-9dc88a3e6a75
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B8]
- question_text: "OS運용ケース09: 次のシステム障害対応の文脈で、デッドロックの説明として正しいものはどれか。 実装や運用上の含意まで含めて最も適切なものを選べ。  実運用上の影響まで踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "複数のトランザクションが互いにロックを待ち合う状態" (25자)
  2. "データベースの容量が不足した状態" (16자)
  3. "ネットワーク切断でトランザクションが中断した状態" (24자)
  4. "インデックスが破損した状態" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 16,24,13)
  - **B8** (Medium): Korean hangul in question_text
---
### Q-416eb828-a27a-44a7-af0a-0cb9c68b86c3
- quiz_id: b69b76bc-8e71-44e5-a8db-4523dccffe35
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B8]
- question_text: "OS運용ケース10: 次のシステム障害対応の文脈で、デッドロックの説明として正しいものはどれか。 基本事項として最も適切なものを選べ。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "複数のトランザクションが互いにロックを待ち合う状態" (25자)
  2. "データベースの容量が不足した状態" (16자)
  3. "ネットワーク切断でトランザクションが中断した状態" (24자)
  4. "インデックスが破損した状態" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 16,24,13)
  - **B8** (Medium): Korean hangul in question_text
---
### Q-a56bd468-85b8-4da2-a455-39fd58cd9e00
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B8]
- question_text: "OS運용ケース11: ラウンドロビン方式のプロセススケジューリングの説明として正しいものはどれか。  原因と結果の関係を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "各プロセスに均等な時間を割り当て順番に実行する方式" (25자)
  2. "最も優先度の高いプロセスを常に実行する方式" (21자)
  3. "実行時間の短いプロセスを優先する方式" (18자)
  4. "先に到着したプロセスを先に実行する方式" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.39x (max=25, min=18)
  - **B5-a** (Medium): correct is longest (25 vs others 21,18,19)
  - **B8** (Medium): Korean hangul in question_text
---
### Q-dfeb3ff8-31c2-41ad-b251-0f10c0efc32e
- quiz_id: a6cfb45b-4b26-42c9-9e8a-ceda2bf545e4
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B8]
- question_text: "OS運용ケース15: 次のメモリ管理の観点から、標本化（サンプリング）の説明として正しいものはどれか。 前提条件を踏まえて最も適切なものを選べ。  実運用上の影響まで踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "アナログ信号を一定間隔で測定すること" (18자)
  2. "デジタルデータを圧縮すること" (14자)
  3. "データを暗号化すること" (11자)
  4. "ファイルをバックアップすること" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 14,11,15)
  - **B8** (Medium): Korean hangul in question_text
---
### Q-af183be1-1ec5-4d2a-87d5-ca5db2086aff
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "OS運用ケース16: ファイルシステムの役割として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "ストレージ上のデータを管理する仕組み" (18자)
  2. "CPUの処理速度を管理する仕組み" (16자)
  3. "ネットワーク接続を管理する仕組み" (16자)
  4. "ユーザーの認証を管理する仕組み" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 16,16,15)
---
### Q-2e3a3801-8f9b-487b-876a-2d331a048cc1
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース17: セマフォの説明として正しいものはどれか。  原因と結果の関係を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "カウンタ変数で共有資源へのアクセスを制御する同期機構" (26자)
  2. "プロセス間でデータを送受信する仕組み" (18자)
  3. "メモリを自動的に管理する仕組み" (15자)
  4. "ファイルのアクセス権を管理する仕組み" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=26, min=15)
  - **B5-a** (Medium): correct is longest (26 vs others 18,15,18)
---
### Q-36c6de85-2213-4b26-81f6-61f423a71de9
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "OS運用ケース18: 次のシステム障害対応の文脈で、ファイルシステムの役割として正しいものはどれか。 実装や運用上の含意まで含めて最も適切なものを選べ。  実運用上の影響まで踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "ストレージ上のデータを管理する仕組み" (18자)
  2. "CPUの処理速度を管理する仕組み" (16자)
  3. "ネットワーク接続を管理する仕組み" (16자)
  4. "ユーザーの認証を管理する仕組み" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 16,16,15)
---
### Q-438a8f33-8e19-4acf-bf54-91bfee216e83
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース19: 次のOS運用場面を想定するとき、ページングの説明として正しいものはどれか。 基本事項として最も適切なものを選べ。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "メモリを固定サイズのページに分割して管理する方式" (24자)
  2. "メモリを可変サイズのセグメントに分割する方式" (22자)
  3. "メモリの使用量を監視する方式" (14자)
  4. "メモリ内のデータを暗号化する方式" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=24, min=14)
  - **B5-a** (Medium): correct is longest (24 vs others 22,14,16)
---
### Q-9965ead8-dac9-46ce-acfb-2e02b584002e
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース21: 次のシステム障害対応の文脈で、スラッシングの説明として正しいものはどれか。 基本事項として最も適切なものを選べ。  実運用上の影響まで踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "ページの入れ替えが頻発して処理効率が著しく低下する現象" (27자)
  2. "CPUの処理速度が低下する現象" (15자)
  3. "ハードディスクが故障する現象" (14자)
  4. "ネットワークの通信速度が低下する現象" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.93x (max=27, min=14)
  - **B5-a** (Medium): correct is longest (27 vs others 15,14,18)
---
### Q-0e660fa1-1152-4fe5-a35c-07cc47f1139e
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: os, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "OS運用ケース22: 次のプロセス管理の状況で、ファイルシステムの役割として正しいものはどれか。 基本事項として最も適切なものを選べ。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "ストレージ上のデータを管理する仕組み" (18자)
  2. "CPUの処理速度を管理する仕組み" (16자)
  3. "ネットワーク接続を管理する仕組み" (16자)
  4. "ユーザーの認証を管理する仕組み" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 16,16,15)
---
### Q-e9412329-cd52-44db-b6d2-d1e6df524152
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: os, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OS運用ケース24: 次のプロセス管理の状況で、プロセスとスレッドの違いとして正しいものはどれか。 基本事項として最も適切なものを選べ。  実運用上の影響まで踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "スレッドは同一プロセス内でメモリ空間を共有する" (23자)
  2. "プロセスはスレッドより軽量である" (16자)
  3. "スレッドは独立したメモリ空間を持つ" (17자)
  4. "プロセスとスレッドに違いはない" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 16,17,15)
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
