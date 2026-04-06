# CS network カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 82
**Rubric**: docs/exam_quality_rubric.md v2

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 0건    | 0.0% |
| Medium  | 66건    | 80.5% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 66 / 82 (80.5%)
**A2-exempt (필터링됨)**: 0건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|
| 9cc6995f... | 27 | 25 | 92.6% | 0 | 0.0% | **FAIL** |
| 10382999... | 25 | 21 | 84.0% | 0 | 0.0% | **FAIL** |
| a0000003... | 13 | 9 | 69.2% | 1 | 7.7% | **FAIL** |
| e63520ed... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |
| 4828dbf5... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |
| 64f2db3f... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |
| 3714c842... | 1 | 0 | 0.0% | 0 | 0.0% | **OK** |

**B5-b 위반 퀴즈**: 6개 — 정답 길이 분포 재조정 필요

## High 우선순위 이슈

_없음_

## Medium 우선순위 이슈

### Q-4c9943f6-3c8c-4ef1-8576-fac3f9faf845
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "IPアドレスのバージョンであるIPv4とIPv6の違いとして正しいものはどれか。"
- options:
  1. [정답] "IPv4は32ビット、IPv6は128ビットのアドレス空間を持つ" (32자)
  2. "IPv4は128ビット、IPv6は32ビットのアドレス空間を持つ" (32자)
  3. "IPv4とIPv6のアドレス空間は同じ" (19자)
  4. "IPv6はIPv4の2倍のアドレス空間を持つ" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.68x (max=32, min=19)
  - **B5-a** (Medium): correct is longest (32 vs others 19,22)
---
### Q-67b6cd95-374b-4d37-91ac-c217446f61b9
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "サブネットマスクの役割として正しいものはどれか。"
- options:
  1. [정답] "IPアドレスのネットワーク部とホスト部を区別する" (24자)
  2. "ドメイン名をIPアドレスに変換する" (17자)
  3. "データを暗号化する" (9자)
  4. "ネットワークの通信速度を制御する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.67x (max=24, min=9)
  - **B5-a** (Medium): correct is longest (24 vs others 17,9,16)
---
### Q-a039e8a3-6b1f-4f10-9dea-9f1f4c3390ae
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "Wi-Fiの説明として正しいものはどれか。"
- options:
  1. [정답] "電波を使ってケーブルなしでネットワーク接続する技術" (25자)
  2. "有線LANの高速通信規格" (12자)
  3. "携帯電話の通信規格" (9자)
  4. "衛星通信の規格" (7자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 3.57x (max=25, min=7)
  - **B5-a** (Medium): correct is longest (25 vs others 12,9,7)
---
### Q-7fe9fe81-c3d5-4175-97c6-d06ae4435dcf
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "WebSocketの特徴として正しいものはどれか。"
- options:
  1. [정답] "クライアントとサーバー間で双方向リアルタイム通信ができる" (28자)
  2. "サーバーからクライアントへの一方向通信のみ" (21자)
  3. "リクエスト・レスポンス型の通信のみ" (17자)
  4. "ファイル転送専用のプロトコル" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=28, min=14)
  - **B5-a** (Medium): correct is longest (28 vs others 21,17,14)
---
### Q-9b1f5681-c4a5-404b-a06b-3ebab582ccfb
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "NAT（Network Address Translation）の説明として正しいものはどれか。"
- options:
  1. [정답] "プライベートIPとグローバルIPを相互に変換する技術" (26자)
  2. "ドメイン名とIPアドレスを変換する技術" (19자)
  3. "データを暗号化する技術" (11자)
  4. "ネットワークの帯域制御を行う技術" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.36x (max=26, min=11)
  - **B5-a** (Medium): correct is longest (26 vs others 19,11,16)
---
### Q-9cbc0f0a-8ffb-4537-b563-f49fdad4f726
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "TLS/SSLの役割として正しいものはどれか。"
- options:
  1. [정답] "通信を暗号化して盗聴や改ざんを防ぐ" (17자)
  2. "IPアドレスを動的に割り当てる" (15자)
  3. "ドメイン名を解決する" (10자)
  4. "メールを転送する" (8자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.13x (max=17, min=8)
  - **B5-a** (Medium): correct is longest (17 vs others 15,10,8)
---
### Q-e3ceb76a-7771-4742-86e7-29dc8ccba12d
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "VLAN（Virtual LAN）の目的として正しいものはどれか。"
- options:
  1. [정답] "論理的にネットワークを分割する" (15자)
  2. "ネットワークの通信速度を向上させる" (17자)
  3. "ネットワーク上のデータを暗号化する" (17자)
  4. "ネットワーク機器を仮想化する" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.21x (max=17, min=14)
---
### Q-e45c27b9-a481-4b1d-acfb-a2a810ce48d4
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ルーティングプロトコルのOSPFの特徴として正しいものはどれか。"
- options:
  1. [정답] "リンクステート型で最短経路を計算するプロトコル" (23자)
  2. "ディスタンスベクタ型のプロトコル" (16자)
  3. "アプリケーション層で動作するプロトコル" (19자)
  4. "データを暗号化するプロトコル" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=23, min=14)
  - **B5-a** (Medium): correct is longest (23 vs others 16,19,14)
---
### Q-eef3affa-b6ac-4ea4-bc17-55ce3169947f
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ARPの役割として正しいものはどれか。"
- options:
  1. [정답] "IPアドレスからMACアドレスを解決する" (20자)
  2. "MACアドレスからIPアドレスを解決する" (20자)
  3. "ドメイン名からIPアドレスを解決する" (18자)
  4. "ポート番号を解決する" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=20, min=10)
  - **B5-a** (Medium): correct is longest (20 vs others 18,10)
---
### Q-f121718d-b935-4c10-adbf-ee050aee5e1b
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "プロトコルの説明として正しいものはどれか。"
- options:
  1. [정답] "コンピュータ間の通信の取り決め（規約）" (19자)
  2. "ネットワーク機器のこと" (11자)
  3. "IPアドレスの別名" (9자)
  4. "セキュリティソフトのこと" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.11x (max=19, min=9)
  - **B5-a** (Medium): correct is longest (19 vs others 11,9,12)
---
### Q-a7a798cd-4762-495e-8462-c78f52ba8c50
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "URLの説明として正しいものはどれか。"
- options:
  1. [정답] "インターネット上のリソースの場所を示す文字列" (22자)
  2. "ネットワーク上の機器の固有番号" (15자)
  3. "暗号化通信の規格" (8자)
  4. "メールの送信先を示す文字列" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.75x (max=22, min=8)
  - **B5-a** (Medium): correct is longest (22 vs others 15,8,13)
---
### Q-d9c0a8b0-2776-46c7-b2db-949230322a36
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "MACアドレスの説明として正しいものはどれか。"
- options:
  1. [정답] "ネットワーク機器に付与される固有の物理アドレス" (23자)
  2. "ソフトウェアで変更可能なIPアドレス" (18자)
  3. "ドメイン名のこと" (8자)
  4. "メールアドレスの別名" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.88x (max=23, min=8)
  - **B5-a** (Medium): correct is longest (23 vs others 18,8,10)
---
### Q-564ee84f-7eda-46f8-823d-35ede3a0ae81
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "プロキシサーバーの説明として正しいものはどれか。"
- options:
  1. [정답] "クライアントの代理でインターネット通信を中継するサーバー" (28자)
  2. "Webサイトのコンテンツを公開するサーバー" (21자)
  3. "メールの送受信を行うサーバー" (14자)
  4. "データベースを管理するサーバー" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=28, min=14)
  - **B5-a** (Medium): correct is longest (28 vs others 21,14,15)
---
### Q-baad3bcc-79c8-47d0-ba04-1cca3936ce93
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "FTPの役割として正しいものはどれか。"
- options:
  1. [정답] "ファイルを転送するプロトコル" (14자)
  2. "Webページを表示するプロトコル" (16자)
  3. "メールを送信するプロトコル" (13자)
  4. "暗号通信を行うプロトコル" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.33x (max=16, min=12)
---
### Q-d0f60cdb-29c9-494c-a9e4-88e4afbfe895
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ポート番号の説明として正しいものはどれか。"
- options:
  1. [정답] "通信先のアプリケーションやサービスを識別する番号" (24자)
  2. "ネットワーク機器の物理的な接続口" (16자)
  3. "IPアドレスの別名" (9자)
  4. "ルーターの設定番号" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.67x (max=24, min=9)
  - **B5-a** (Medium): correct is longest (24 vs others 16,9,9)
---
### Q-79b2103d-eedc-4008-940d-84fbfcf4057a
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ロードバランサーの役割として正しいものはどれか。"
- options:
  1. [정답] "複数のサーバーにリクエストを分散して負荷を均等にする" (26자)
  2. "ネットワークのトラフィックを監視する" (18자)
  3. "不正アクセスを検知して遮断する" (15자)
  4. "データをキャッシュして高速化する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=26, min=15)
  - **B5-a** (Medium): correct is longest (26 vs others 18,15,16)
---
### Q-ff73e900-f80e-44bb-887b-79eec1b4c0a7
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "QoS（Quality of Service）の目的として正しいものはどれか。"
- options:
  1. [정답] "ネットワーク上の通信品質を保証するために帯域・優先制御を行う" (30자)
  2. "ネットワークのセキュリティを強化する" (18자)
  3. "ネットワーク機器の障害を検知する" (16자)
  4. "ネットワークの物理構成を管理する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.88x (max=30, min=16)
  - **B5-a** (Medium): correct is longest (30 vs others 18,16,16)
---
### Q-411961f3-62fa-4249-ab46-016917e511f4
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ICMPの説明として正しいものはどれか。"
- options:
  1. [정답] "ネットワーク診断やエラー通知に使われるプロトコル" (24자)
  2. "メールを送信するプロトコル" (13자)
  3. "ファイルを転送するプロトコル" (14자)
  4. "ドメイン名を解決するプロトコル" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.85x (max=24, min=13)
  - **B5-a** (Medium): correct is longest (24 vs others 13,14,15)
---
### Q-ae38b0d8-29f5-4367-b46f-896526488caa
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "HTTPプロトコルの特徴として正しいものはどれか。"
- options:
  1. "ステートフルで接続状態を常に保持する" (18자)
  2. "バイナリプロトコルでテキストデータを扱えない" (22자)
  3. "UDPの上で動作する" (10자)
  4. [정답] "ステートレスで各リクエストが独立している" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.20x (max=22, min=10)
---
### Q-4a95ffdb-046e-42d7-90df-6d9f0472710a
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "TCPとUDPの違いとして正しいものはどれか。"
- options:
  1. "UDPはコネクション型でTCPはコネクションレスである" (27자)
  2. [정답] "TCPはコネクション型で信頼性を保証しUDPはコネクションレスで高速である" (37자)
  3. "TCPもUDPも信頼性を保証する" (16자)
  4. "UDPはTCPより常に遅い" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.85x (max=37, min=13)
  - **B5-a** (Medium): correct is longest (37 vs others 27,16,13)
---
### Q-3e2a1d63-6aad-4f1c-a869-46c0cfff7889
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "DNSの主な役割として正しいものはどれか。"
- options:
  1. [정답] "ドメイン名をIPアドレスに変換する" (17자)
  2. "データを暗号化して転送する" (13자)
  3. "パケットの経路を制御する" (12자)
  4. "メールの送受信を管理する" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.42x (max=17, min=12)
  - **B5-a** (Medium): correct is longest (17 vs others 13,12,12)
---
### Q-c51ccf96-3c0a-4d44-87e2-2ae47121a4f4
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "HTTPSにおけるTLSの役割として正しいものはどれか。"
- options:
  1. "ドメイン名をIPアドレスに変換する" (17자)
  2. [정답] "通信の暗号化とサーバー認証を行う" (16자)
  3. "パケットのルーティングを最適化する" (17자)
  4. "HTTPヘッダーを圧縮して転送速度を向上させる" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=23, min=16)
  - **B5-a** (Medium): correct is shortest (16 vs others 17,17,23)
---
### Q-3e592fb6-a9c7-4715-bca6-6815b3f8f253
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ルーティングテーブルの役割として正しいものはどれか。"
- options:
  1. "DNSの名前解決結果をキャッシュする" (18자)
  2. "ファイアウォールのルールを管理する" (17자)
  3. [정답] "パケットの宛先に基づき転送先を決定する情報を保持する" (26자)
  4. "ネットワークの帯域幅を監視する" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=26, min=15)
  - **B5-a** (Medium): correct is longest (26 vs others 18,17,15)
---
### Q-5948a20e-3f45-4a04-b5de-dee1c7f1e075
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ARP（Address Resolution Protocol）の役割として正しいものはどれか。"
- options:
  1. "ドメイン名からIPアドレスを解決する" (18자)
  2. [정답] "IPアドレスからMACアドレスを解決する" (20자)
  3. "MACアドレスからポート番号を解決する" (19자)
  4. "ポート番号からプロセスIDを解決する" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (20 vs others 18,19,18)
---
### Q-9c488480-3f20-4453-9cfa-a49cab146ed7
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "TCPのフロー制御におけるスライディングウィンドウ方式に関する説明として正しいものはどれか。"
- options:
  1. "送信側がウィンドウサイズを一方的に決定し、受信側はそれに従う" (30자)
  2. "各セグメントごとにACKを受信してから次のセグメントを送信するストップアンドウェイト方式である" (47자)
  3. [정답] "受信側が通知するウィンドウサイズに基づき、ACKを待たずに複数セグメントを連続送信できる" (44자)
  4. "ウィンドウサイズは接続確立時に固定され、通信中は変更できない" (30자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=47, min=30)
---
### Q-6f42211a-1ef3-466f-9c42-1d032c2428cf
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "DNSにおける再帰クエリと反復クエリの違いとして正しいものはどれか。"
- options:
  1. [정답] "再帰クエリではサーバが代理で最終回答を取得し、反復クエリでは次に問い合わせるべきサーバを返す" (46자)
  2. "再帰クエリは次の問い合わせ先を返し、反復クエリはサーバが代理で回答を取得する" (38자)
  3. "両方とも同じ動作であり、名称が異なるだけである" (23자)
  4. "再帰クエリはUDPでのみ使用され、反復クエリはTCPでのみ使用される" (34자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=46, min=23)
  - **B5-a** (Medium): correct is longest (46 vs others 38,23,34)
---
### Q-3f1d5530-80d4-4569-83d5-801ae13902f8
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "VPN（Virtual Private Network）のトンネリングに関する説明として正しいものはどれか。"
- options:
  1. "物理的な専用回線を敷設してプライベートネットワークを構築する技術である" (35자)
  2. [정답] "パケットをカプセル化し、公衆ネットワーク上に暗号化された仮想専用通信路を構築する技術である" (45자)
  3. "LANスイッチのVLAN機能を用いてネットワークを論理的に分割する技術である" (38자)
  4. "DNSサーバを経由してトラフィックをリダイレクトする匿名化技術である" (34자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.32x (max=45, min=34)
  - **B5-a** (Medium): correct is longest (45 vs others 35,38,34)
---
### Q-eb7cb4eb-e707-4046-b58f-48312c3aa4f4
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ファイアウォールの種類に関する説明として正しいものはどれか。"
- options:
  1. "パケットフィルタリング型はアプリケーション層のデータ内容まで検査できる" (35자)
  2. "ステートフルインスペクション型は通信の状態を追跡せず、個々のパケットを独立に判断する" (42자)
  3. "アプリケーションゲートウェイ型は処理負荷が小さく、最も高速なファイアウォールである" (41자)
  4. [정답] "ステートフルインスペクション型は通信状態を追跡し、アプリケーションゲートウェイ型はデータ内容を検査できる" (52자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.49x (max=52, min=35)
  - **B5-a** (Medium): correct is longest (52 vs others 35,42,41)
---
### Q-e30eed05-4909-4bf3-aeac-a1dc9b690293
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "HTTPS通信におけるTLSハンドシェイクの流れとして正しいものはどれか。"
- options:
  1. "サーバが最初にClientHelloを送信し、クライアントがServerHelloで応答する" (46자)
  2. "通信全体を公開鍵暗号で暗号化するため、共通鍵の生成は行わない" (30자)
  3. [정답] "クライアントがClientHelloを送信後、サーバ証明書の検証と鍵交換を経て共通鍵を生成する" (47자)
  4. "ハンドシェイクではクライアント証明書が必須であり、双方の証明書交換が常に行われる" (40자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=47, min=30)
  - **B5-a** (Medium): correct is longest (47 vs others 46,30,40)
---
### Q-e5f92954-7e54-4d88-b069-04ed04d84e3d
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "NAT（Network Address Translation）とポートフォワーディングに関する説明として正しいものはどれか。"
- options:
  1. "NATはIPv6で導入された技術であり、IPv4環境では使用されない" (34자)
  2. "NAPTでは1つのグローバルIPで1台の端末しかインターネット接続できない" (37자)
  3. "ポートフォワーディングはLAN内のすべての端末に対して同じポートを開放する仕組みである" (43자)
  4. [정답] "NAPTはポート番号も変換して複数端末の同時接続を実現し、ポートフォワーディングは外部通信を内部の特定ホストに転送する" (59자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.74x (max=59, min=34)
  - **B5-a** (Medium): correct is longest (59 vs others 34,37,43)
---
### Q-6ef7f54c-d8d6-4ee4-8aa1-4e4de03c78ff
- quiz_id: e63520ed-66ad-40b5-85e9-197d552ee9df
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "E-R図（ER図）の説明として正しいものはどれか。"
- options:
  1. [정답] "エンティティとその関連を図示したもの" (18자)
  2. "プログラムの処理の流れを示したもの" (17자)
  3. "ネットワークの接続構成を示したもの" (17자)
  4. "ユーザーの操作手順を示したもの" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 17,17,15)
---
### Q-6bdd9f99-7f68-48fc-b678-ae0f13f736f9
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "WANの説明として正しいものはどれか。"
- options:
  1. [정답] "地理的に離れた拠点を接続する広域ネットワーク" (22자)
  2. "一つの建物内のネットワーク" (13자)
  3. "無線LANのこと" (8자)
  4. "プライベートネットワークのこと" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.75x (max=22, min=8)
  - **B5-a** (Medium): correct is longest (22 vs others 13,8,15)
---
### Q-7e946e3c-ae03-4a7e-ae2e-8d4a38408327
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "DNSラウンドロビンの説明として正しいものはどれか。"
- options:
  1. [정답] "1つのドメイン名に複数のIPを関連付け問い合わせごとに異なるIPを返す" (35자)
  2. "複数のドメイン名を1つのIPアドレスに関連付ける" (24자)
  3. "DNSのキャッシュを定期的にクリアする仕組み" (22자)
  4. "DNSサーバーを冗長化する仕組み" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.19x (max=35, min=16)
  - **B5-a** (Medium): correct is longest (35 vs others 24,22,16)
---
### Q-a0680096-be57-4aa8-86a1-2f00b6aab104
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "DHCPの役割として正しいものはどれか。"
- options:
  1. [정답] "IPアドレスを自動的に割り当てる" (16자)
  2. "ドメイン名をIPアドレスに変換する" (17자)
  3. "メールを配送する" (8자)
  4. "Webページを転送する" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.13x (max=17, min=8)
---
### Q-239b75a0-c08d-4495-abb8-2d05a56135a0
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OSI参照モデルの第4層（トランスポート層）の役割として正しいものはどれか。"
- options:
  1. [정답] "エンドツーエンドの信頼性のある通信を提供する" (22자)
  2. "物理的な電気信号の伝送を行う" (14자)
  3. "IPアドレスによるルーティングを行う" (18자)
  4. "データの表現形式を変換する" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=22, min=13)
  - **B5-a** (Medium): correct is longest (22 vs others 14,18,13)
---
### Q-7c07a22d-3e8a-4517-afd4-e3c510838f99
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OSI参照モデルの第3層（ネットワーク層）の役割として正しいものはどれか。"
- options:
  1. [정답] "IPアドレスによるルーティング（経路制御）" (21자)
  2. "データの暗号化と復号" (10자)
  3. "物理的な電気信号の伝送" (11자)
  4. "アプリケーション間のデータ交換" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.10x (max=21, min=10)
  - **B5-a** (Medium): correct is longest (21 vs others 10,11,15)
---
### Q-d7cb21cc-4ae3-4e5a-99e5-d721f2f87e8a
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "IPS（侵入防止システム）がIDSと異なる点はどれか。"
- options:
  1. [정답] "不正な通信を検知するだけでなく自動的に遮断する" (23자)
  2. "検知のみで遮断は行わない" (12자)
  3. "ウイルス対策機能がある" (11자)
  4. "データの暗号化機能がある" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.09x (max=23, min=11)
  - **B5-a** (Medium): correct is longest (23 vs others 12,11,12)
---
### Q-756081f1-d881-4ef9-9018-ec54c5b0ee85
- quiz_id: 64f2db3f-c67f-4d9c-8827-147d133838db
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "TCP/IPで接続確立に使われる3ウェイハンドシェイクの正しい順序はどれか。"
- options:
  1. [정답] "SYN → SYN+ACK → ACK" (19자)
  2. "ACK → SYN → SYN+ACK" (19자)
  3. "SYN → ACK → SYN" (15자)
  4. "FIN → ACK → FIN" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.27x (max=19, min=15)
  - **B5-a** (Medium): correct is longest (19 vs others 15,15)
---
### Q-677eb171-baf0-4cf1-a455-cde153753bdd
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "Bluetooth の説明として正しいものはどれか。"
- options:
  1. [정답] "近距離の機器間を無線で接続する通信規格" (19자)
  2. "高速な有線通信規格" (9자)
  3. "長距離通信用の衛星通信規格" (13자)
  4. "インターネット接続のプロトコル" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.11x (max=19, min=9)
  - **B5-a** (Medium): correct is longest (19 vs others 9,13,15)
---
### Q-84c46c73-4fb6-42d0-aabf-185ea81703e3
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "クラウドサービスのSaaSの説明として正しいものはどれか。"
- options:
  1. [정답] "インターネット経由でソフトウェアを提供する形態" (23자)
  2. "サーバーのハードウェアを提供する形態" (18자)
  3. "OSやミドルウェアの実行環境を提供する形態" (21자)
  4. "ネットワーク回線を提供する形態" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=23, min=15)
  - **B5-a** (Medium): correct is longest (23 vs others 18,21,15)
---
### Q-b646f91a-8893-49f6-afa5-0510a6175c81
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "スイッチングハブの役割として正しいものはどれか。"
- options:
  1. [정답] "MACアドレスを基に目的の機器にデータを転送する装置" (26자)
  2. "異なるネットワーク間を接続する装置" (17자)
  3. "データを暗号化する装置" (11자)
  4. "無線LANの基地局" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.89x (max=26, min=9)
  - **B5-a** (Medium): correct is longest (26 vs others 17,11,9)
---
### Q-216a6a61-68a2-47ee-a22a-477539a26366
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ルーターの役割として正しいものはどれか。"
- options:
  1. [정답] "異なるネットワーク間でデータを中継する装置" (21자)
  2. "コンピュータ同士を直接接続する装置" (17자)
  3. "データを暗号化する装置" (11자)
  4. "Webサイトを公開する装置" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.91x (max=21, min=11)
  - **B5-a** (Medium): correct is longest (21 vs others 17,11,13)
---
### Q-16f95438-6778-43a0-86f3-ac93e96c52c4
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "DNSの役割として正しいものはどれか。"
- options:
  1. [정답] "ドメイン名をIPアドレスに変換する" (17자)
  2. "データを暗号化する" (9자)
  3. "メールを配送する" (8자)
  4. "ファイルを共有する" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.13x (max=17, min=8)
  - **B5-a** (Medium): correct is longest (17 vs others 9,8,9)
---
### Q-89bf300a-a74b-414f-98c8-a2d8d0848cc5
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "HTTPのステータスコード404が示す意味はどれか。"
- options:
  1. [정답] "リソースが見つからない（Not Found）" (22자)
  2. "サーバー内部エラー" (9자)
  3. "認証が必要" (5자)
  4. "リクエスト成功" (7자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 4.40x (max=22, min=5)
  - **B5-a** (Medium): correct is longest (22 vs others 9,5,7)
---
### Q-6637de53-593c-4282-82ae-cd19190032bd
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "TCPとUDPの違いとして正しいものはどれか。"
- options:
  1. [정답] "TCPはコネクション型で信頼性が高く、UDPはコネクションレス型で高速" (35자)
  2. "UDPはコネクション型で信頼性が高く、TCPはコネクションレス型で高速" (35자)
  3. "両方ともコネクション型である" (14자)
  4. "両方ともコネクションレス型である" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.50x (max=35, min=14)
  - **B5-a** (Medium): correct is longest (35 vs others 14,16)
---
### Q-77e0e177-ab1f-4bcf-b8bd-1c4044dcd2af
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SMTPの役割として正しいものはどれか。"
- options:
  1. [정답] "メールを送信・転送するプロトコル" (16자)
  2. "メールを受信するプロトコル" (13자)
  3. "Webページを転送するプロトコル" (16자)
  4. "ファイルを転送するプロトコル" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.23x (max=16, min=13)
  - **B5-a** (Medium): correct is longest (16 vs others 13,14)
---
### Q-4e8ef81a-454b-4479-8b1e-17c6e1a50d4f
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "IPアドレスの説明として正しいものはどれか。"
- options:
  1. [정답] "ネットワーク上の機器を識別するための番号" (20자)
  2. "Webサイトの名前のこと" (12자)
  3. "メールアドレスのこと" (10자)
  4. "ファイルの保存場所のこと" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=20, min=10)
  - **B5-a** (Medium): correct is longest (20 vs others 12,10,12)
---
### Q-6ab8f9ee-b97a-4181-aef1-2af1cf0c43e1
- quiz_id: 3714c842-5507-4f99-a185-7c5dba98a90b
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "HTTPSの「S」が意味するものはどれか。"
- options:
  1. [정답] "Secure（安全な）" (11자)
  2. "Speed（高速な）" (10자)
  3. "Simple（簡単な）" (11자)
  4. "Standard（標準的な）" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.40x (max=14, min=10)
---
### Q-15a20286-3641-45e8-a2c6-f89c10bb4fdc
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "SDN（Software Defined Networking）の説明として正しいものはどれか。"
- options:
  1. [정답] "ネットワーク制御をソフトウェアで集中管理する技術" (24자)
  2. "ハードウェアでネットワークを制御する従来型の手法" (24자)
  3. "ネットワーク機器のファームウェアを自動更新する技術" (25자)
  4. "ネットワークの通信速度を自動調整する技術" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.25x (max=25, min=20)
---
### Q-9b8bf101-92b0-4586-8331-713cf5e54d14
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "LANの説明として正しいものはどれか。"
- options:
  1. [정답] "限られた範囲で構築されるネットワーク" (18자)
  2. "世界中をつなぐネットワーク" (13자)
  3. "無線通信専用のネットワーク" (13자)
  4. "衛星通信によるネットワーク" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.38x (max=18, min=13)
  - **B5-a** (Medium): correct is longest (18 vs others 13,13,13)
---
### Q-e6aff7fb-345f-4101-9524-ca36db01eb4e
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "HTTPの説明として正しいものはどれか。"
- options:
  1. [정답] "Webページを転送するためのプロトコル" (19자)
  2. "メールを送信するためのプロトコル" (16자)
  3. "ファイルを転送するためのプロトコル" (17자)
  4. "ドメイン名を解決するプロトコル" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.27x (max=19, min=15)
  - **B5-a** (Medium): correct is longest (19 vs others 16,17,15)
---
### Q-6f4a80f1-3061-4642-b546-2542a7e0707f
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "TCPのフロー制御の目的として正しいものはどれか。"
- options:
  1. [정답] "送信速度を受信側の処理能力に合わせて調整する" (22자)
  2. "データの暗号化を行う" (10자)
  3. "ルーティングの最適化を行う" (13자)
  4. "IPアドレスの割り当てを行う" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.20x (max=22, min=10)
  - **B5-a** (Medium): correct is longest (22 vs others 10,13,14)
---
### Q-1b8993fb-7a1e-435d-b90b-8736d967adde
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のネットワーク運用場面を想定するとき、OSI参照モデルの第3層（ネットワーク層）の役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "IPアドレスによるルーティング（経路制御）" (21자)
  2. "データの暗号化と復号" (10자)
  3. "物理的な電気信号の伝送" (11자)
  4. "アプリケーション間のデータ交換" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.10x (max=21, min=10)
  - **B5-a** (Medium): correct is longest (21 vs others 10,11,15)
---
### Q-0bf5cd88-c4f1-472e-9bc9-28e6ba6c6cc7
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の通信障害の切り分けで、IPアドレスの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "ネットワーク上の機器を識別するための番号" (20자)
  2. "Webサイトの名前のこと" (12자)
  3. "メールアドレスのこと" (10자)
  4. "ファイルの保存場所のこと" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=20, min=10)
  - **B5-a** (Medium): correct is longest (20 vs others 12,10,12)
---
### Q-73f7b0a0-d553-4a32-92eb-df16ad8b7973
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のパケット転送の文脈で、TCPとUDPの違いとして正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "TCPはコネクション型で信頼性が高く、UDPはコネクションレス型で高速" (35자)
  2. "UDPはコネクション型で信頼性が高く、TCPはコネクションレス型で高速" (35자)
  3. "両方ともコネクション型である" (14자)
  4. "両方ともコネクションレス型である" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.50x (max=35, min=14)
  - **B5-a** (Medium): correct is longest (35 vs others 14,16)
---
### Q-d855c82e-d7b9-45b0-bd27-a2cf37580448
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロトコル設計の観点から、LANの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "限られた範囲で構築されるネットワーク" (18자)
  2. "世界中をつなぐネットワーク" (13자)
  3. "無線通信専用のネットワーク" (13자)
  4. "衛星通信によるネットワーク" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.38x (max=18, min=13)
  - **B5-a** (Medium): correct is longest (18 vs others 13,13,13)
---
### Q-8975d381-8947-4732-ba15-4cf0a0393e1f
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の通信障害の切り分けで、プロトコルの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "コンピュータ間の通信の取り決め（規約）" (19자)
  2. "ネットワーク機器のこと" (11자)
  3. "IPアドレスの別名" (9자)
  4. "セキュリティソフトのこと" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.11x (max=19, min=9)
  - **B5-a** (Medium): correct is longest (19 vs others 11,9,12)
---
### Q-521221ad-ff9e-4dce-ba3e-ef672d2beec0
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のパケット転送の文脈で、HTTPの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "Webページを転送するためのプロトコル" (19자)
  2. "メールを送信するためのプロトコル" (16자)
  3. "ファイルを転送するためのプロトコル" (17자)
  4. "ドメイン名を解決するプロトコル" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.27x (max=19, min=15)
  - **B5-a** (Medium): correct is longest (19 vs others 16,17,15)
---
### Q-0b0ac1a8-25e8-4ecd-a792-374675f73be1
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロトコル設計の観点から、DNSの役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "ドメイン名をIPアドレスに変換する" (17자)
  2. "データを暗号化する" (9자)
  3. "メールを配送する" (8자)
  4. "ファイルを共有する" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.13x (max=17, min=8)
  - **B5-a** (Medium): correct is longest (17 vs others 9,8,9)
---
### Q-78c6ad4c-60d7-4a94-8bb8-5af4018da9aa
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のネットワーク運用場面を想定するとき、ルーターの役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "異なるネットワーク間でデータを中継する装置" (21자)
  2. "コンピュータ同士を直接接続する装置" (17자)
  3. "データを暗号化する装置" (11자)
  4. "Webサイトを公開する装置" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.91x (max=21, min=11)
  - **B5-a** (Medium): correct is longest (21 vs others 17,11,13)
---
### Q-f6b23b36-51d4-4816-a66b-e382f1d85f34
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の通信障害の切り分けで、OSI参照モデルの第4層（トランスポート層）の役割として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "エンドツーエンドの信頼性のある通信を提供する" (22자)
  2. "物理的な電気信号の伝送を行う" (14자)
  3. "IPアドレスによるルーティングを行う" (18자)
  4. "データの表現形式を変換する" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=22, min=13)
  - **B5-a** (Medium): correct is longest (22 vs others 14,18,13)
---
### Q-bb2f834c-27d6-4826-98d6-e209612c91fb
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のパケット転送の文脈で、ロードバランサーの役割として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "複数のサーバーにリクエストを分散して負荷を均等にする" (26자)
  2. "ネットワークのトラフィックを監視する" (18자)
  3. "不正アクセスを検知して遮断する" (15자)
  4. "データをキャッシュして高速化する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=26, min=15)
  - **B5-a** (Medium): correct is longest (26 vs others 18,15,16)
---
### Q-32678748-ace1-461d-b181-eef2243e6a7a
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロトコル設計の観点から、ICMPの説明として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "ネットワーク診断やエラー通知に使われるプロトコル" (24자)
  2. "メールを送信するプロトコル" (13자)
  3. "ファイルを転送するプロトコル" (14자)
  4. "ドメイン名を解決するプロトコル" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.85x (max=24, min=13)
  - **B5-a** (Medium): correct is longest (24 vs others 13,14,15)
---
### Q-3fa20bd0-d33f-484d-97fa-8cee0ba7c256
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の通信障害の切り分けで、SMTPの役割として正しいものはどれか。  基本事項として最も適切なものを選べ。"
- options:
  1. [정답] "メールを送信・転送するプロトコル" (16자)
  2. "メールを受信するプロトコル" (13자)
  3. "Webページを転送するプロトコル" (16자)
  4. "ファイルを転送するプロトコル" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.23x (max=16, min=13)
  - **B5-a** (Medium): correct is longest (16 vs others 13,14)
---
### Q-fa9e72ad-7c56-4651-8c01-075224a6da93
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: network, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次のプロトコル設計の観点から、ポート番号の説明として正しいものはどれか。  前提条件を踏まえて最も適切なものを選べ。"
- options:
  1. [정답] "通信先のアプリケーションやサービスを識別する番号" (24자)
  2. "ネットワーク機器の物理的な接続口" (16자)
  3. "IPアドレスの別名" (9자)
  4. "ルーターの設定番号" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.67x (max=24, min=9)
  - **B5-a** (Medium): correct is longest (24 vs others 16,9,9)
---
### Q-dc0853c3-e77e-409c-90b9-1be5c2ea5cac
- quiz_id: 10382999-5e27-4c55-8873-8b71813819ae
- question_category: network, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "次の通信障害の切り分けで、OSI参照モデルの第3層（ネットワーク層）の役割として正しいものはどれか。  実装や運用上の含意まで含めて最も適切なものを選べ。"
- options:
  1. [정답] "IPアドレスによるルーティング（経路制御）" (21자)
  2. "データの暗号化と復号" (10자)
  3. "物理的な電気信号の伝送" (11자)
  4. "アプリケーション間のデータ交換" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.10x (max=21, min=10)
  - **B5-a** (Medium): correct is longest (21 vs others 10,11,15)
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
