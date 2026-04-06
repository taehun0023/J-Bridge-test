# CS computer_architecture カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 74
**Rubric**: docs/exam_quality_rubric.md v2

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 2건    | 2.7% |
| Medium  | 60건    | 81.1% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 62 / 74 (83.8%)
**A2-exempt (필터링됨)**: 0건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|
| e1afaf9c... | 23 | 20 | 87.0% | 0 | 0.0% | **FAIL** |
| bbae6864... | 17 | 15 | 88.2% | 0 | 0.0% | **FAIL** |
| 61000001... | 13 | 11 | 84.6% | 0 | 0.0% | **FAIL** |
| a0000003... | 5 | 5 | 100.0% | 0 | 0.0% | **FAIL** |
| 3714c842... | 2 | 1 | 50.0% | 0 | 0.0% | **FAIL** |

**B5-b 위반 퀴즈**: 5개 — 정답 길이 분포 재조정 필요

## High 우선순위 이슈

### Q-94e43820-fde2-478c-8a46-47cb77cced0c
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [A2]
- question_text: "次のCPU動作の文脈で、命令を主に実行する装置はどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "CPU" (3자)
  2. "SSD" (3자)
  3. "ディスプレイ" (6자)
  4. "プリンタ" (4자)
- 자동감지 근거:
  - **A2** (High): answer-leak bigram ratio = 100%
---
### Q-7e8bec44-cdf2-4e6d-88d8-7b921cf0ef44
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [A2]
- question_text: "次のCPU動作の文脈で、命令を主に実行する装置はどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "CPU" (3자)
  2. "SSD" (3자)
  3. "ディスプレイ" (6자)
  4. "プリンタ" (4자)
- 자동감지 근거:
  - **A2** (High): answer-leak bigram ratio = 100%
---

## Medium 우선순위 이슈

### Q-1f3c5959-f4a0-4d35-8af8-59136db213a1
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "パイプライン処理の説明として正しいものはどれか。"
- options:
  1. [정답] "命令実行をステージに分割して並行処理する手法" (22자)
  2. "複数のCPUで同じ命令を実行する手法" (18자)
  3. "メモリ上のデータを順番に処理する手法" (18자)
  4. "命令を一つずつ順番に実行する手法" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.38x (max=22, min=16)
  - **B5-a** (Medium): correct is longest (22 vs others 18,18,16)
---
### Q-3ad0845d-82f1-435c-bfe4-f46445f4f1b8
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "クラウドコンピューティングの説明として正しいものはどれか。"
- options:
  1. [정답] "インターネット経由でITリソースを利用するサービス" (25자)
  2. "天気予報を行うコンピュータシステム" (17자)
  3. "自社内にサーバーを設置するサービス" (17자)
  4. "パソコン内のデータを自動保存する機能" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.47x (max=25, min=17)
  - **B5-a** (Medium): correct is longest (25 vs others 17,17,18)
---
### Q-8ffce741-09a4-459e-9cda-7dc0ad2a72c0
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "仮想化技術の説明として正しいものはどれか。"
- options:
  1. [정답] "1台の物理マシンで複数の仮想環境を動作させる技術" (24자)
  2. "データを仮想的に暗号化する技術" (15자)
  3. "ネットワークを仮想的に分離する技術のみ" (19자)
  4. "仮想現実（VR）を実現する技術" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=24, min=15)
  - **B5-a** (Medium): correct is longest (24 vs others 15,19,15)
---
### Q-bbbdc219-4fc3-4a35-a5ff-53af32a86672
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "USBの説明として正しいものはどれか。"
- options:
  1. [정답] "周辺機器を接続する汎用インターフェース規格" (21자)
  2. "ネットワーク通信のプロトコル" (14자)
  3. "データ圧縮の規格" (8자)
  4. "プログラミング言語の一種" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.63x (max=21, min=8)
  - **B5-a** (Medium): correct is longest (21 vs others 14,8,12)
---
### Q-04687441-2876-44a7-8f25-b55061330270
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "デバイスドライバの説明として正しいものはどれか。"
- options:
  1. [정답] "OSが周辺機器を制御するためのソフトウェア" (21자)
  2. "ハードディスクのデータを管理するソフトウェア" (22자)
  3. "ネットワーク通信を行うためのプロトコル" (19자)
  4. "ウイルスを検出するソフトウェア" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.47x (max=22, min=15)
---
### Q-af02fa89-dc6c-46d2-bf47-c8dc9d72fd68
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SSDの特徴としてHDDと比較して正しいものはどれか。"
- options:
  1. [정답] "読み書きが高速で物理的な駆動部品がない" (19자)
  2. "記憶容量が大きく価格が安い" (13자)
  3. "データの書き換え回数に制限がない" (16자)
  4. "磁気ディスクを使用している" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.46x (max=19, min=13)
  - **B5-a** (Medium): correct is longest (19 vs others 13,16,13)
---
### Q-aec67b25-04c9-425a-b246-b1b09374ab18
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ROMの特徴として正しいものはどれか。"
- options:
  1. [정답] "読み取り専用で電源を切ってもデータが保持される" (23자)
  2. "読み書き可能で揮発性のメモリ" (14자)
  3. "データの書き換えが高速にできる" (15자)
  4. "主記憶装置として使用される" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.77x (max=23, min=13)
  - **B5-a** (Medium): correct is longest (23 vs others 14,15,13)
---
### Q-6b959763-5536-4a5a-bb9e-fc59a89b06e3
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OSの役割として正しいものはどれか。"
- options:
  1. [정답] "ハードウェアとアプリケーションの仲介・資源管理" (23자)
  2. "文書や表を作成する" (9자)
  3. "ウイルスを駆除する" (9자)
  4. "インターネットに接続する" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.56x (max=23, min=9)
  - **B5-a** (Medium): correct is longest (23 vs others 9,9,12)
---
### Q-0e6d3ea6-a8bb-4f3a-b34d-51c965fb5072
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "BIOSの役割として正しいものはどれか。"
- options:
  1. [정답] "電源投入時にハードウェア初期化とOS起動を行う" (23자)
  2. "アプリケーションソフトを管理する" (16자)
  3. "ネットワーク接続を管理する" (13자)
  4. "データのバックアップを行う" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.77x (max=23, min=13)
  - **B5-a** (Medium): correct is longest (23 vs others 16,13,13)
---
### Q-cf2ac45b-9f0b-47d1-ba8d-becb675ede27
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "IoT機器の説明として正しいものはどれか。"
- options:
  1. [정답] "インターネットに接続してデータ収集や制御を行う機器" (25자)
  2. "高性能な計算処理専用の機器" (13자)
  3. "データを暗号化する専用機器" (13자)
  4. "ネットワークを遮断する機器" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 13,13,13)
---
### Q-dcf1ef95-9184-4728-98a1-757d473da89b
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "バッチ処理の説明として正しいものはどれか。"
- options:
  1. [정답] "複数の処理をまとめて一括で実行する方式" (19자)
  2. "要求ごとにリアルタイムで処理する方式" (18자)
  3. "複数のコンピュータで分散処理する方式" (18자)
  4. "ユーザーの対話的な操作で処理する方式" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (19 vs others 18,18,18)
---
### Q-ebf6ea9e-4933-4029-9d2f-4bbf4574db61
- quiz_id: 3714c842-5507-4f99-a185-7c5dba98a90b
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OSの機能として最も適切なものはどれか。"
- options:
  1. [정답] "ハードウェア資源の管理とアプリケーションの実行制御" (25자)
  2. "表計算やワープロの機能を提供する" (16자)
  3. "ウイルスの検出と駆除を行う" (13자)
  4. "Webサイトを閲覧する" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.27x (max=25, min=11)
  - **B5-a** (Medium): correct is longest (25 vs others 16,13,11)
---
### Q-3d87ed0e-f7e2-4e89-833a-a817bd3ebd4a
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "メモリインターリーブの目的として正しいものはどれか。"
- options:
  1. [정답] "複数のメモリバンクへ交互にアクセスし速度を向上させる" (26자)
  2. "メモリの消費電力を削減する" (13자)
  3. "メモリの容量を増やす" (10자)
  4. "メモリのエラーを訂正する" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.60x (max=26, min=10)
  - **B5-a** (Medium): correct is longest (26 vs others 13,10,12)
---
### Q-64e82a5a-1fd7-43ff-aec0-d48da3f1b4f5
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "RAID5の特徴として正しいものはどれか。"
- options:
  1. [정답] "パリティを分散配置し1台の故障に耐えられる" (21자)
  2. "データを2台のディスクにミラーリングする" (20자)
  3. "ストライピングのみで冗長性がない" (16자)
  4. "3台以上のディスク故障に耐えられる" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.31x (max=21, min=16)
  - **B5-a** (Medium): correct is longest (21 vs others 20,16,17)
---
### Q-db25d877-9646-453d-86d0-7726c27f9caa
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "フォールトトレラントシステムの説明として正しいものはどれか。"
- options:
  1. [정답] "故障が発生してもシステム全体の機能を維持するシステム" (26자)
  2. "故障を検出して自動的に修理するシステム" (19자)
  3. "故障時に自動的にシャットダウンするシステム" (21자)
  4. "故障の原因を分析するシステム" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.86x (max=26, min=14)
  - **B5-a** (Medium): correct is longest (26 vs others 19,21,14)
---
### Q-055d36e7-4f6c-4b30-b61e-5c26ca7951fe
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "RAID1（ミラーリング）の説明として正しいものはどれか。"
- options:
  1. [정답] "同じデータを2台のディスクに同時に書き込む方式" (23자)
  2. "データをストライピングして高速化する方式" (20자)
  3. "パリティを使って誤り訂正する方式" (16자)
  4. "3台以上のディスクに分散書き込みする方式" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=23, min=16)
  - **B5-a** (Medium): correct is longest (23 vs others 20,16,20)
---
### Q-367178a2-ff87-4aaa-8c70-ddab32107914
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "キャッシュミスが起こりやすい状況はどれか。"
- options:
  1. [정답] "必要なデータがキャッシュ内にない" (16자)
  2. "ディスプレイケーブルが抜けている" (16자)
  3. "テーブルに主キーがない" (11자)
  4. "DNS名が解決できない" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
  - **B5-a** (Medium): correct is longest (16 vs others 11,11)
---
### Q-0d54e583-c7e0-4695-b5fd-b1d6c8b62fbf
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "RISC型プロセッサの特徴として正しいものはどれか。"
- options:
  1. [정답] "命令を単純化し高速実行を目指す" (15자)
  2. "複雑な命令セットを持つ" (11자)
  3. "1命令で複雑な処理を実行する" (14자)
  4. "マイクロプログラム方式で動作する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
---
### Q-0118cfb6-e174-4fa4-805c-2d8e12673f25
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "割込みを最も適切に説明しているものはどれか。"
- options:
  1. [정답] "CPUにイベント処理を要求する信号" (17자)
  2. "ファイルを圧縮する方式" (11자)
  3. "データベースのロック方式" (12자)
  4. "ネットワークの経路表" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.70x (max=17, min=10)
  - **B5-a** (Medium): correct is longest (17 vs others 11,12,10)
---
### Q-42b4a9c4-db49-46b4-b6ed-acf3b090d13e
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "補助記憶装置が主記憶装置と異なる点として適切なものはどれか。"
- options:
  1. [정답] "電源を切ってもデータを保持できる" (16자)
  2. "常にRAMより容量が小さい" (13자)
  3. "命令を直接実行する" (9자)
  4. "CPUキャッシュを置き換える" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.78x (max=16, min=9)
  - **B5-a** (Medium): correct is longest (16 vs others 14,13,9)
---
### Q-7ddc89bb-d749-4513-b313-b1a22d2c51af
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "RAMの主な役割はどれか。"
- options:
  1. [정답] "実行中の処理に必要なデータを一時的に保持する" (22자)
  2. "インターネット接続を提供する" (14자)
  3. "文字を画像に変換する" (10자)
  4. "すべてのファイルを自動で暗号化する" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.20x (max=22, min=10)
  - **B5-a** (Medium): correct is longest (22 vs others 14,10,17)
---
### Q-0faf579b-34ca-4bfe-ac36-924704c079fb
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "補助記憶装置が主記憶装置と異なる点として適切なものはどれか。"
- options:
  1. [정답] "電源を切ってもデータを保持できる" (16자)
  2. "常にRAMより容量が小さい" (13자)
  3. "命令を直接実行する" (9자)
  4. "CPUキャッシュを置き換える" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.78x (max=16, min=9)
  - **B5-a** (Medium): correct is longest (16 vs others 13,9,14)
---
### Q-0fd26370-fd67-4c7a-a01d-259ddb57cc0f
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "キャッシュミスが起こりやすい状況はどれか。"
- options:
  1. [정답] "必要なデータがキャッシュ内にない" (16자)
  2. "ディスプレイケーブルが抜けている" (16자)
  3. "テーブルに主キーがない" (11자)
  4. "DNS名が解決できない" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
  - **B5-a** (Medium): correct is longest (16 vs others 11,11)
---
### Q-6bc2b9bb-eb5d-49fe-8877-16d88b4bf324
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "コンピュータ構成におけるバスとは何か。"
- options:
  1. [정답] "データや制御信号をやり取りする共通経路" (19자)
  2. "予備電池" (4자)
  3. "パスワード管理ソフト" (10자)
  4. "表計算ソフトの関数" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 4.75x (max=19, min=4)
  - **B5-a** (Medium): correct is longest (19 vs others 4,10,9)
---
### Q-27026b02-4fd7-4770-92df-d6a950216783
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "命令実行の流れとして自然な順序はどれか。"
- options:
  1. [정답] "取り出し → 解読 → 実行" (14자)
  2. "保存 → 印刷 → 暗号化" (13자)
  3. "コンパイル → 経路選択 → 保管" (17자)
  4. "解読 → 停止 → 取り出し" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.31x (max=17, min=13)
---
### Q-be051e26-4927-4fdb-bbb4-2f1333b3ac6e
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "I/O装置に対して割込みが有効な理由として適切なものはどれか。"
- options:
  1. [정답] "CPUによる常時監視を減らせる" (15자)
  2. "すべてのプログラムを単一スレッド化する" (19자)
  3. "RAMをSSDに変える" (11자)
  4. "OSを不要にする" (8자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.38x (max=19, min=8)
---
### Q-43231cac-d469-4bc0-8d3d-e0bde37e671c
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "大きなファイルを読み込むときだけアプリが遅い場合、まず疑うべきものはどれか。"
- options:
  1. [정답] "補助記憶装置またはメモリ階層のボトルネック" (21자)
  2. "キーボード配列の誤り" (10자)
  3. "CSS命名規則の不統一" (11자)
  4. "HTTPメソッドの不一致" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.10x (max=21, min=10)
  - **B5-a** (Medium): correct is longest (21 vs others 10,11,12)
---
### Q-8745031e-1966-49b7-afb7-b8fc6efde3b8
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ボトルネックの解釈として最も適切なものはどれか。"
- options:
  1. [정답] "システム全体の性能を制約している部分" (18자)
  2. "最もボタン数の多い機能" (11자)
  3. "最も新しい部品" (7자)
  4. "ネットワーク名にだけ影響する不具合" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.57x (max=18, min=7)
  - **B5-a** (Medium): correct is longest (18 vs others 11,7,17)
---
### Q-bc82a4ed-fe98-429e-a05f-f106565f9856
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "クロック周波数が高いことから直接読み取れることはどれか。"
- options:
  1. [정답] "1秒あたりの周期数が多いが、総合性能が自動的に高いとは限らない" (31자)
  2. "メモリ容量が無限になる" (11자)
  3. "キャッシュミスが起こらなくなる" (15자)
  4. "すべてのプログラムが1手順で終わる" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.82x (max=31, min=11)
  - **B5-a** (Medium): correct is longest (31 vs others 11,15,17)
---
### Q-526c7b50-e02b-4ecb-8d10-a11ce0e406d2
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "メモリ（主記憶装置）の説明として正しいものはどれか。"
- options:
  1. [정답] "CPUが直接アクセスする一時的な記憶装置" (20자)
  2. "データを永続的に保存する装置" (14자)
  3. "外部機器と接続する装置" (11자)
  4. "プログラムを作成する装置" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.82x (max=20, min=11)
  - **B5-a** (Medium): correct is longest (20 vs others 14,11,12)
---
### Q-8a255413-7fe6-42d6-b260-7f1d07dca3d1
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "CPUの役割として正しいものはどれか。"
- options:
  1. [정답] "プログラムの命令を解釈し実行する装置" (18자)
  2. "データを長期間保存する装置" (13자)
  3. "画面に映像を表示する装置" (12자)
  4. "ネットワークに接続する装置" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=18, min=12)
  - **B5-a** (Medium): correct is longest (18 vs others 13,12,13)
---
### Q-eb8f1ffe-23d1-48c6-a2de-e344e068d1d3
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "DMAの説明として正しいものはどれか。"
- options:
  1. [정답] "CPUを介さず周辺機器とメモリ間で直接データ転送する方式" (28자)
  2. "CPUがすべてのデータ転送を制御する方式" (20자)
  3. "メモリ上のデータを自動的に暗号化する方式" (20자)
  4. "ディスク上のデータを直接修正する方式" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.56x (max=28, min=18)
  - **B5-a** (Medium): correct is longest (28 vs others 20,20,18)
---
### Q-fe2f52de-429c-4cd8-9f8b-11d2dc3ecb96
- quiz_id: 3714c842-5507-4f99-a185-7c5dba98a90b
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "SSDがHDDと比べて優れている点として正しいものはどれか。"
- options:
  1. [정답] "読み書きが高速で衝撃に強い" (13자)
  2. "容量あたりの価格が安い" (11자)
  3. "書き換え回数に制限がない" (12자)
  4. "データの長期保存に適している" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.27x (max=14, min=11)
---
### Q-ca7fc87f-7746-4720-bcab-ec5f3e5d22be
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "マルチタスクの説明として正しいものはどれか。"
- options:
  1. [정답] "複数のプログラムを同時に実行する機能" (18자)
  2. "1つのプログラムを複数のCPUで実行する機能" (22자)
  3. "複数のユーザーが同時にログインする機能" (19자)
  4. "複数のファイルを同時に保存する機能" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=22, min=17)
---
### Q-ac5c08fc-c575-4606-96e1-56f5b0a09f36
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "RAMの主な役割はどれか。"
- options:
  1. [정답] "実行中の処理に必要なデータを一時的に保持する" (22자)
  2. "インターネット接続を提供する" (14자)
  3. "文字を画像に変換する" (10자)
  4. "すべてのファイルを自動で暗号化する" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.20x (max=22, min=10)
  - **B5-a** (Medium): correct is longest (22 vs others 14,10,17)
---
### Q-528374e8-00db-44e0-939d-e0e020a5b114
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "割込みを最も適切に説明しているものはどれか。"
- options:
  1. [정답] "CPUにイベント処理を要求する信号" (17자)
  2. "ファイルを圧縮する方式" (11자)
  3. "データベースのロック方式" (12자)
  4. "ネットワークの経路表" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.70x (max=17, min=10)
  - **B5-a** (Medium): correct is longest (17 vs others 11,12,10)
---
### Q-151792e4-936a-4df6-a836-5bd2862ef8cd
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "割り込み処理の説明として正しいものはどれか。"
- options:
  1. [정답] "実行中の処理を中断して優先度の高い処理を実行する" (24자)
  2. "プログラムの実行を永久に停止する" (16자)
  3. "複数のプログラムを交互に実行する" (16자)
  4. "メモリのデータを書き換える" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.85x (max=24, min=13)
  - **B5-a** (Medium): correct is longest (24 vs others 16,16,13)
---
### Q-24e4c27d-8945-4fa8-a6d3-557e512a2f41
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "MIPS（Million Instructions Per Second）の説明として正しいものはどれか。"
- options:
  1. [정답] "1秒間に実行できる命令数を百万単位で表した性能指標" (25자)
  2. "メモリの転送速度を表す指標" (13자)
  3. "ディスクの回転速度を表す指標" (14자)
  4. "ネットワークの帯域幅を表す指標" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 13,14,15)
---
### Q-21a5ccb3-15b4-4f90-8023-5b5e1668f89c
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "クロック周波数の説明として正しいものはどれか。"
- options:
  1. [정답] "CPUの動作速度を表す指標" (13자)
  2. "メモリの容量を表す指標" (11자)
  3. "ディスクの回転速度を表す指標" (14자)
  4. "ネットワークの通信速度を表す指標" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
---
### Q-90a027db-9c4b-417a-a830-0cd79a865dec
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "キャッシュメモリの目的として正しいものはどれか。"
- options:
  1. [정답] "CPUと主記憶装置の速度差を埋める" (17자)
  2. "データを永続的に保存する" (12자)
  3. "ネットワーク通信を高速化する" (14자)
  4. "補助記憶の容量を増やす" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.55x (max=17, min=11)
  - **B5-a** (Medium): correct is longest (17 vs others 12,14,11)
---
### Q-3609487d-0af4-4c6a-a4a5-e109ceb52952
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ハードディスク（HDD）の説明として正しいものはどれか。"
- options:
  1. [정답] "磁気ディスクでデータを読み書きする補助記憶装置" (23자)
  2. "半導体を使用した高速な記憶装置" (15자)
  3. "光学式の記憶装置" (8자)
  4. "揮発性の一時記憶装置" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.88x (max=23, min=8)
  - **B5-a** (Medium): correct is longest (23 vs others 15,8,10)
---
### Q-9d9fe33e-dbe5-47a8-946d-9df7fe8abdc8
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "RAMの特徴として正しいものはどれか。"
- options:
  1. [정답] "読み書き可能で電源を切るとデータが消える" (20자)
  2. "読み取り専用で書き換えができない" (16자)
  3. "電源を切ってもデータが保持される" (16자)
  4. "補助記憶装置として使用される" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.43x (max=20, min=14)
  - **B5-a** (Medium): correct is longest (20 vs others 16,16,14)
---
### Q-1a5013b6-bfd6-4fb7-b959-d4308a67fa81
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "仮想記憶の説明として正しいものはどれか。"
- options:
  1. [정답] "補助記憶を使って見かけ上のメモリ空間を拡大する技術" (25자)
  2. "データを暗号化してメモリに格納する技術" (19자)
  3. "メモリの物理容量を実際に増やす技術" (17자)
  4. "キャッシュメモリの容量を増やす技術" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.47x (max=25, min=17)
  - **B5-a** (Medium): correct is longest (25 vs others 19,17,17)
---
### Q-095bfc34-3d01-4054-8080-c3b307d0825b
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "アドレッシングモードの一つである間接アドレッシングの説明として正しいものはどれか。"
- options:
  1. [정답] "指定アドレスの内容をデータのアドレスとして使用する方式" (27자)
  2. "指定アドレスのデータを直接使用する方式" (19자)
  3. "命令中に直接データを含める方式" (15자)
  4. "プログラムカウンタからの相対位置で指定する方式" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=27, min=15)
  - **B5-a** (Medium): correct is longest (27 vs others 19,15,23)
---
### Q-a64176d4-88ae-4d09-a4b4-f629c9adb091
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "マルチプロセッサシステムの利点として正しいものはどれか。"
- options:
  1. [정답] "処理能力と信頼性の向上" (11자)
  2. "メモリ使用量の削減" (9자)
  3. "消費電力の削減" (7자)
  4. "ソフトウェア開発の簡略化" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.71x (max=12, min=7)
---
### Q-925cc9a0-f7e7-4d3d-8645-5a0277f6ef99
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のCPU動作の文脈で、CPUの役割として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "プログラムの命令を解釈し実行する装置" (18자)
  2. "データを長期間保存する装置" (13자)
  3. "画面に映像を表示する装置" (12자)
  4. "ネットワークに接続する装置" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=18, min=12)
  - **B5-a** (Medium): correct is longest (18 vs others 13,12,13)
---
### Q-061777ab-d129-4146-b412-6f3bc3028253
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のハードウェア設計の場面で、CPUの役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "プログラムの命令を解釈し実行する装置" (18자)
  2. "データを長期間保存する装置" (13자)
  3. "画面に映像を表示する装置" (12자)
  4. "ネットワークに接続する装置" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=18, min=12)
  - **B5-a** (Medium): correct is longest (18 vs others 13,12,13)
---
### Q-a88e0972-bc69-45a8-a2ad-eb3288dc3372
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の性能評価の観点から、メモリ（主記憶装置）の説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "CPUが直接アクセスする一時的な記憶装置" (20자)
  2. "データを永続的に保存する装置" (14자)
  3. "外部機器と接続する装置" (11자)
  4. "プログラムを作成する装置" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.82x (max=20, min=11)
  - **B5-a** (Medium): correct is longest (20 vs others 14,11,12)
---
### Q-cc8b55ae-7190-42a3-9335-eda6194e8aed
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の命令実行の状況で、キャッシュメモリの目的として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "CPUと主記憶装置の速度差を埋める" (17자)
  2. "データを永続的に保存する" (12자)
  3. "ネットワーク通信を高速化する" (14자)
  4. "補助記憶の容量を増やす" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.55x (max=17, min=11)
  - **B5-a** (Medium): correct is longest (17 vs others 12,14,11)
---
### Q-bf3ee89d-968a-4ecd-b51c-4faf65f7c01d
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のハードウェア設計の場面で、RAMの主な役割はどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "実行中の処理に必要なデータを一時的に保持する" (22자)
  2. "インターネット接続を提供する" (14자)
  3. "文字を画像に変換する" (10자)
  4. "すべてのファイルを自動で暗号化する" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.20x (max=22, min=10)
  - **B5-a** (Medium): correct is longest (22 vs others 14,10,17)
---
### Q-56d0713e-8950-47e4-9b00-8c099a46d8c7
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のCPU動作の文脈で、割り込み処理の説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "実行中の処理を中断して優先度の高い処理を実行する" (24자)
  2. "プログラムの実行を永久に停止する" (16자)
  3. "複数のプログラムを交互に実行する" (16자)
  4. "メモリのデータを書き換える" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.85x (max=24, min=13)
  - **B5-a** (Medium): correct is longest (24 vs others 16,16,13)
---
### Q-d98206e2-1954-4036-ac51-3aa155b61190
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の命令実行の状況で、ハードディスク（HDD）の説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "磁気ディスクでデータを読み書きする補助記憶装置" (23자)
  2. "半導体を使用した高速な記憶装置" (15자)
  3. "光学式の記憶装置" (8자)
  4. "揮発性の一時記憶装置" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.88x (max=23, min=8)
  - **B5-a** (Medium): correct is longest (23 vs others 15,8,10)
---
### Q-a2512eac-9f82-4978-ba6f-90ebb987365f
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のハードウェア設計の場面で、SSDの特徴としてHDDと比較して正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "読み書きが高速で物理的な駆動部品がない" (19자)
  2. "記憶容量が大きく価格が安い" (13자)
  3. "データの書き換え回数に制限がない" (16자)
  4. "磁気ディスクを使用している" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.46x (max=19, min=13)
  - **B5-a** (Medium): correct is longest (19 vs others 13,16,13)
---
### Q-8e9791f8-74db-44ed-bbb4-19b2fccfe1da
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のCPU動作の文脈で、割込みを最も適切に説明しているものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "CPUにイベント処理を要求する信号" (17자)
  2. "ファイルを圧縮する方式" (11자)
  3. "データベースのロック方式" (12자)
  4. "ネットワークの経路表" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.70x (max=17, min=10)
  - **B5-a** (Medium): correct is longest (17 vs others 11,12,10)
---
### Q-358b5a16-9503-47f9-ad13-aada97989f12
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の性能評価の観点から、仮想記憶の説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "補助記憶を使って見かけ上のメモリ空間を拡大する技術" (25자)
  2. "データを暗号化してメモリに格納する技術" (19자)
  3. "メモリの物理容量を実際に増やす技術" (17자)
  4. "キャッシュメモリの容量を増やす技術" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.47x (max=25, min=17)
  - **B5-a** (Medium): correct is longest (25 vs others 19,17,17)
---
### Q-b0725d3d-71c7-4ffe-830e-a706dea876be
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: computer_architecture, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の命令実行の状況で、キャッシュミスが起こりやすい状況はどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "必要なデータがキャッシュ内にない" (16자)
  2. "ディスプレイケーブルが抜けている" (16자)
  3. "テーブルに主キーがない" (11자)
  4. "DNS名が解決できない" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
  - **B5-a** (Medium): correct is longest (16 vs others 11,11)
---
### Q-5a622ceb-de2f-45ce-9185-5ca1a1a336f3
- quiz_id: 61000001-0000-0000-0000-000000000006
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のハードウェア設計の場面で、補助記憶装置が主記憶装置と異なる点として適切なものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "電源を切ってもデータを保持できる" (16자)
  2. "常にRAMより容量が小さい" (13자)
  3. "命令を直接実行する" (9자)
  4. "CPUキャッシュを置き換える" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.78x (max=16, min=9)
  - **B5-a** (Medium): correct is longest (16 vs others 13,9,14)
---
### Q-218d4061-2ca8-493e-a096-2fef2bf94715
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のCPU動作の文脈で、CPUの役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "プログラムの命令を解釈し実行する装置" (18자)
  2. "データを長期間保存する装置" (13자)
  3. "画面に映像を表示する装置" (12자)
  4. "ネットワークに接続する装置" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=18, min=12)
  - **B5-a** (Medium): correct is longest (18 vs others 13,12,13)
---
### Q-599ca96a-df61-4079-8f03-121a90b9aeaa
- quiz_id: e1afaf9c-86d5-43a4-ad33-f38b904cad84
- question_category: computer_architecture, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の性能評価の観点から、メモリ（主記憶装置）の説明として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "CPUが直接アクセスする一時的な記憶装置" (20자)
  2. "データを永続的に保存する装置" (14자)
  3. "外部機器と接続する装置" (11자)
  4. "プログラムを作成する装置" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.82x (max=20, min=11)
  - **B5-a** (Medium): correct is longest (20 vs others 14,11,12)
---
### Q-333865cd-76b0-4157-bfcf-6fdd7e2f1020
- quiz_id: bbae6864-814f-4871-af38-26e042e94580
- question_category: computer_architecture, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のハードウェア設計の場面で、キャッシュメモリの目的として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "CPUと主記憶装置の速度差を埋める" (17자)
  2. "データを永続的に保存する" (12자)
  3. "ネットワーク通信を高速化する" (14자)
  4. "補助記憶の容量を増やす" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.55x (max=17, min=11)
  - **B5-a** (Medium): correct is longest (17 vs others 12,14,11)
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
