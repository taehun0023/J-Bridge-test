-- 00158_fix_cs_network_b5a.sql
-- CS network B5-a 길이편향 수정
-- 생성일: 2026-04-06
-- CONFIRMED: 65건 / DISMISSED: 1건 / UPDATE: 64건
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 패딩으로 정답=최장 패턴 해소.

BEGIN;

-- Q-4c9943f6: IPアドレスのバージョンであるIPv4とIPv6の違いとして正しいものはどれか。
-- correct=32, dist=[32,22,19] → pad longest dist 32→45
UPDATE quiz_question_options SET option_text = 'IPv4は128ビット、IPv6は32ビットのアドレス空間を持つことを目的とした手法である'
WHERE id = '3bf183ac-ca22-4867-b6dd-0204c0230e77';

-- Q-67b6cd95: サブネットマスクの役割として正しいものはどれか。
-- correct=24, dist=[17,16,9] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'ドメイン名をIPアドレスに変換することが主な目的である'
WHERE id = '1a46fd1c-9ac9-498c-b42c-3851def013a9';

-- Q-a039e8a3: Wi-Fiの説明として正しいものはどれか。
-- correct=25, dist=[12,9,7] → pad longest dist 12→26
UPDATE quiz_question_options SET option_text = '有線LANの高速通信規格として知られている手法である'
WHERE id = '88fe5003-f0d0-46b0-a9bf-2609f8f5f14f';

-- Q-7fe9fe81: WebSocketの特徴として正しいものはどれか。
-- correct=28, dist=[21,17,14] → pad longest dist 21→33
UPDATE quiz_question_options SET option_text = 'サーバーからクライアントへの一方向通信のみに該当する処理方式である'
WHERE id = '75d310f4-1ea5-40c2-a483-699508938cb8';

-- Q-9b1f5681: NAT（Network Address Translation）の説明として正し
-- correct=26, dist=[19,16,11] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'ドメイン名とIPアドレスを変換する技術に該当する処理方式である'
WHERE id = 'f4777c41-76d8-4ee3-b30b-595a45f2b1c0';

-- Q-9cbc0f0a: TLS/SSLの役割として正しいものはどれか。
-- correct=17, dist=[15,10,8] → pad longest dist 15→28
UPDATE quiz_question_options SET option_text = 'IPアドレスを動的に割り当てることを目的とした手法である'
WHERE id = 'e55b5188-cc67-454b-9ba3-9071b341f4c9';

-- Q-e3ceb76a: VLAN（Virtual LAN）の目的として正しいものはどれか。 [ratio fix]
-- ratio=1.21, min=14→27, max=17
UPDATE quiz_question_options SET option_text = 'ネットワーク機器を仮想化することを目的とした手法である'
WHERE id = '08f84fa7-ecc6-459e-86a5-1783bf3ab225';

-- Q-e45c27b9: ルーティングプロトコルのOSPFの特徴として正しいものはどれか。
-- correct=23, dist=[19,16,14] → pad longest dist 19→28
UPDATE quiz_question_options SET option_text = 'アプリケーション層で動作するプロトコルであるとされている'
WHERE id = '54554167-a84f-4c5b-af39-de731e9bc3ee';

-- Q-eef3affa: ARPの役割として正しいものはどれか。
-- correct=20, dist=[20,18,10] → pad longest dist 20→33
UPDATE quiz_question_options SET option_text = 'MACアドレスからIPアドレスを解決することを目的とした手法である'
WHERE id = 'ff2f414b-2e28-4dc5-9abd-50375de510a8';

-- Q-f121718d: プロトコルの説明として正しいものはどれか。
-- correct=19, dist=[12,11,9] → pad longest dist 12→23
UPDATE quiz_question_options SET option_text = 'セキュリティソフトのことが必要条件となっている'
WHERE id = 'f03d6e31-1eec-42b5-bf16-b93c4ec6911d';

-- Q-a7a798cd: URLの説明として正しいものはどれか。
-- correct=22, dist=[15,13,8] → pad longest dist 15→27
UPDATE quiz_question_options SET option_text = 'ネットワーク上の機器の固有番号に該当する処理方式である'
WHERE id = 'f7ef2e1b-377b-4187-88eb-bea0245a1ef0';

-- Q-d9c0a8b0: MACアドレスの説明として正しいものはどれか。
-- correct=23, dist=[18,10,8] → pad longest dist 18→27
UPDATE quiz_question_options SET option_text = 'ソフトウェアで変更可能なIPアドレスであるとされている'
WHERE id = 'ed7d60ce-c2b3-4f2d-aec2-e90289f9e982';

-- Q-564ee84f: プロキシサーバーの説明として正しいものはどれか。
-- correct=28, dist=[21,15,14] → pad longest dist 21→33
UPDATE quiz_question_options SET option_text = 'Webサイトのコンテンツを公開するサーバーに該当する処理方式である'
WHERE id = 'b8469a43-b1f0-471f-83df-eb9096540319';

-- Q-baad3bcc: FTPの役割として正しいものはどれか。 [ratio fix]
-- ratio=1.33, min=12→26, max=16
UPDATE quiz_question_options SET option_text = '暗号通信を行うプロトコルとして知られている手法である'
WHERE id = '1a84b820-3712-4337-bd4b-d4b17323abd2';

-- Q-d0f60cdb: ポート番号の説明として正しいものはどれか。
-- correct=24, dist=[16,9,9] → pad longest dist 16→28
UPDATE quiz_question_options SET option_text = 'ネットワーク機器の物理的な接続口に該当する処理方式である'
WHERE id = 'e1295752-664c-4d77-b41c-c9bf8267a7db';

-- Q-79b2103d: ロードバランサーの役割として正しいものはどれか。
-- correct=26, dist=[18,16,15] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = 'ネットワークのトラフィックを監視することを目的とした手法である'
WHERE id = '9b61f170-8fe3-4dc8-9d2a-e8f609c695b8';

-- Q-ff73e900: QoS（Quality of Service）の目的として正しいものはどれか。
-- correct=30, dist=[18,16,16] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = 'ネットワークのセキュリティを強化することを目的とした手法である'
WHERE id = '16a89509-9f3b-4e71-a7e0-6b4c8873e924';

-- Q-411961f3: ICMPの説明として正しいものはどれか。
-- correct=24, dist=[15,14,13] → pad longest dist 15→29
UPDATE quiz_question_options SET option_text = 'ドメイン名を解決するプロトコルとして知られている手法である'
WHERE id = 'b311e7ab-e944-43ec-9b1f-c6e5a8b65930';

-- Q-ae38b0d8: HTTPプロトコルの特徴として正しいものはどれか。 [ratio fix]
-- ratio=2.20, min=10→23, max=22
UPDATE quiz_question_options SET option_text = 'UDPの上で動作することを目的とした手法である'
WHERE id = 'c9bb43c6-f419-4eb4-9260-ee591e5671f3';

-- Q-4a95ffdb: TCPとUDPの違いとして正しいものはどれか。
-- correct=37, dist=[27,16,13] → pad longest dist 27→40
UPDATE quiz_question_options SET option_text = 'UDPはコネクション型でTCPはコネクションレスであることを目的とした手法である'
WHERE id = '2d980e7b-3968-4f6d-ac30-8880a5b99b32';

-- Q-3e2a1d63: DNSの主な役割として正しいものはどれか。
-- correct=17, dist=[13,12,12] → pad longest dist 13→21
UPDATE quiz_question_options SET option_text = 'データを暗号化して転送する処理のことである'
WHERE id = '7711d093-f6cb-43d9-ae0b-d89b66085347';

-- Q-c51ccf96: HTTPSにおけるTLSの役割として正しいものはどれか。 [MANUAL: correct=shortest]
-- correct=16, dist=[23,17,17]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-3e592fb6: ルーティングテーブルの役割として正しいものはどれか。
-- correct=26, dist=[18,17,15] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = 'DNSの名前解決結果をキャッシュすることを目的とした手法である'
WHERE id = 'd3e500bb-677f-41e6-bf57-20df72ca1ba7';

-- Q-9c488480: TCPのフロー制御におけるスライディングウィンドウ方式に関する説明として正しいも [ratio fix]
-- ratio=1.57, min=30→43, max=47
UPDATE quiz_question_options SET option_text = '送信側がウィンドウサイズを一方的に決定し、受信側はそれに従うことを目的とした手法である'
WHERE id = '3737a8e7-cc55-4c53-9c47-c2f08b576d42';

-- Q-6f42211a: DNSにおける再帰クエリと反復クエリの違いとして正しいものはどれか。
-- correct=46, dist=[38,34,23] → pad longest dist 38→51
UPDATE quiz_question_options SET option_text = '再帰クエリは次の問い合わせ先を返し、反復クエリはサーバが代理で回答を取得することを目的とした手法である'
WHERE id = '4be3841b-867e-47e5-b230-1fbfbdfc87df';

-- Q-3f1d5530: VPN（Virtual Private Network）のトンネリングに関する説
-- correct=45, dist=[38,35,34] → pad longest dist 38→48
UPDATE quiz_question_options SET option_text = 'LANスイッチのVLAN機能を用いてネットワークを論理的に分割する技術であることが主な特徴である'
WHERE id = '6e87c538-181c-4a9e-aea2-58a7408a4cdd';

-- Q-eb7cb4eb: ファイアウォールの種類に関する説明として正しいものはどれか。
-- correct=52, dist=[42,41,35] → pad longest dist 42→55
UPDATE quiz_question_options SET option_text = 'ステートフルインスペクション型は通信の状態を追跡せず、個々のパケットを独立に判断することを目的とした手法である'
WHERE id = '796969ec-3e91-4bac-a7e8-dc6e88dd8a1c';

-- Q-e30eed05: HTTPS通信におけるTLSハンドシェイクの流れとして正しいものはどれか。
-- correct=47, dist=[46,40,30] → pad longest dist 46→59
UPDATE quiz_question_options SET option_text = 'サーバが最初にClientHelloを送信し、クライアントがServerHelloで応答することを目的とした手法である'
WHERE id = '5983dd6c-2113-4de8-9a3c-a15494d49549';

-- Q-e5f92954: NAT（Network Address Translation）とポートフォワー
-- correct=59, dist=[43,37,34] → pad longest dist 43→56
UPDATE quiz_question_options SET option_text = 'ポートフォワーディングはLAN内のすべての端末に対して同じポートを開放する仕組みであるとして一般的に知られている'
WHERE id = '8aacfd78-0ea5-481e-9714-aa2af0a5e64e';

-- Q-6ef7f54c: E-R図（ER図）の説明として正しいものはどれか。
-- correct=18, dist=[17,17,15] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = 'プログラムの処理の流れを示したものとして知られている手法である'
WHERE id = 'dd9d6669-610b-4abb-906d-f17053d9ccd5';

-- Q-6bdd9f99: WANの説明として正しいものはどれか。
-- correct=22, dist=[15,13,8] → pad longest dist 15→26
UPDATE quiz_question_options SET option_text = 'プライベートネットワークのことが必要条件となっている'
WHERE id = '794f1b2c-fbf1-406f-b073-0502e450967d';

-- Q-7e946e3c: DNSラウンドロビンの説明として正しいものはどれか。
-- correct=35, dist=[24,22,16] → pad longest dist 24→37
UPDATE quiz_question_options SET option_text = '複数のドメイン名を1つのIPアドレスに関連付けることを目的とした手法である'
WHERE id = 'b781d944-1f72-44a8-899e-d5a3a0a55b07';

-- Q-a0680096: DHCPの役割として正しいものはどれか。 [ratio fix]
-- ratio=2.13, min=8→18, max=17
UPDATE quiz_question_options SET option_text = 'メールを配送することが主な目的である'
WHERE id = 'ea24c340-2ec4-40b7-aa23-64127265fcb0';

-- Q-239b75a0: OSI参照モデルの第4層（トランスポート層）の役割として正しいものはどれか。
-- correct=22, dist=[18,14,13] → pad longest dist 18→27
UPDATE quiz_question_options SET option_text = 'IPアドレスによるルーティングを行うことが一般的である'
WHERE id = 'aa360cb9-0bbf-440f-b89e-9e2931ab0704';

-- Q-7c07a22d: OSI参照モデルの第3層（ネットワーク層）の役割として正しいものはどれか。
-- correct=21, dist=[15,11,10] → pad longest dist 15→24
UPDATE quiz_question_options SET option_text = 'アプリケーション間のデータ交換であるとされている'
WHERE id = '0c173c38-9dc4-4dc6-9088-eefb292a7421';

-- Q-d7cb21cc: IPS（侵入防止システム）がIDSと異なる点はどれか。
-- correct=23, dist=[12,12,11] → pad longest dist 12→25
UPDATE quiz_question_options SET option_text = '検知のみで遮断は行わないとされている処理方式である'
WHERE id = '89ca4723-696e-40e1-937b-b0267b6c8665';

-- Q-756081f1: TCP/IPで接続確立に使われる3ウェイハンドシェイクの正しい順序はどれか。
-- correct=19, dist=[19,15,15] → pad longest dist 19→33
UPDATE quiz_question_options SET option_text = 'ACK → SYN → SYN+ACKとして知られている手法である'
WHERE id = '93dc7c78-4279-4911-8ccd-2c650cb6fd50';

-- Q-677eb171: Bluetooth の説明として正しいものはどれか。
-- correct=19, dist=[15,13,9] → pad longest dist 15→24
UPDATE quiz_question_options SET option_text = 'インターネット接続のプロトコルであるとされている'
WHERE id = '3a6ba083-4477-4efb-9509-7836a340bc69';

-- Q-84c46c73: クラウドサービスのSaaSの説明として正しいものはどれか。
-- correct=23, dist=[21,18,15] → pad longest dist 21→35
UPDATE quiz_question_options SET option_text = 'OSやミドルウェアの実行環境を提供する形態として知られている手法である'
WHERE id = 'e7bff479-e8a0-446b-8f39-fa701e471bc5';

-- Q-b646f91a: スイッチングハブの役割として正しいものはどれか。
-- correct=26, dist=[17,11,9] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = '異なるネットワーク間を接続する装置として知られている手法である'
WHERE id = '9f60d880-a62f-4770-a004-e90a6cc9450a';

-- Q-216a6a61: ルーターの役割として正しいものはどれか。
-- correct=21, dist=[17,13,11] → pad longest dist 17→26
UPDATE quiz_question_options SET option_text = 'コンピュータ同士を直接接続する装置であるとされている'
WHERE id = '9122286e-c3f9-4996-88a1-cc2851e880ac';

-- Q-16f95438: DNSの役割として正しいものはどれか。
-- correct=17, dist=[9,9,8] → pad longest dist 9→22
UPDATE quiz_question_options SET option_text = 'データを暗号化することを目的とした手法である'
WHERE id = 'c6d19ecd-6c35-4b0d-a9b8-610aee2e4a83';

-- Q-89bf300a: HTTPのステータスコード404が示す意味はどれか。
-- correct=22, dist=[9,7,5] → pad longest dist 9→23
UPDATE quiz_question_options SET option_text = 'サーバー内部エラーとして知られている手法である'
WHERE id = 'b3b76781-ab3b-472a-bcc4-51dcf6450ab6';

-- Q-6637de53: TCPとUDPの違いとして正しいものはどれか。
-- correct=35, dist=[35,16,14] → pad longest dist 35→49
UPDATE quiz_question_options SET option_text = 'UDPはコネクション型で信頼性が高く、TCPはコネクションレス型で高速として知られている手法である'
WHERE id = '427a3243-1711-42f5-bdef-174e52dda618';

-- Q-77e0e177: SMTPの役割として正しいものはどれか。
-- correct=16, dist=[16,14,13] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'Webページを転送するプロトコルとして知られている手法である'
WHERE id = 'eb2adab4-0e00-4b30-9f6c-8704962944ed';

-- Q-4e8ef81a: IPアドレスの説明として正しいものはどれか。
-- correct=20, dist=[12,12,10] → pad longest dist 12→25
UPDATE quiz_question_options SET option_text = 'Webサイトの名前のことが前提条件として必要である'
WHERE id = '00a1b814-b141-4fd2-8aa8-e434dbb98ca4';

-- Q-6ab8f9ee: HTTPSの「S」が意味するものはどれか。 [ratio fix]
-- ratio=1.40, min=10→24, max=14
UPDATE quiz_question_options SET option_text = 'Speed（高速な）として知られている手法である'
WHERE id = 'c29a3700-a673-4ee6-a991-1482eb5407f8';

-- Q-15a20286: SDN（Software Defined Networking）の説明として正し [ratio fix]
-- ratio=1.25, min=20→34, max=25
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度を自動調整する技術として知られている手法である'
WHERE id = '8fd2efa4-2bd1-4c44-9014-dd4666381db7';

-- Q-9b8bf101: LANの説明として正しいものはどれか。
-- correct=18, dist=[13,13,13] → pad longest dist 13→22
UPDATE quiz_question_options SET option_text = '世界中をつなぐネットワークであるとされている'
WHERE id = 'a61aa07f-b36c-4d9f-84d4-4d7ae1b3b843';

-- Q-e6aff7fb: HTTPの説明として正しいものはどれか。
-- correct=19, dist=[17,16,15] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = 'ファイルを転送するためのプロトコルとして知られている手法である'
WHERE id = 'f7a63e1f-303f-4d85-829a-c932f0d85b50';

-- Q-6f4a80f1: TCPのフロー制御の目的として正しいものはどれか。
-- correct=22, dist=[14,13,10] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'IPアドレスの割り当てを行うことを目的とした手法である'
WHERE id = '01e22ebe-53b1-470a-8e69-9bb62a9a229f';

-- Q-1b8993fb: 次のネットワーク運用場面を想定するとき、OSI参照モデルの第3層（ネットワーク層
-- correct=21, dist=[15,11,10] → pad longest dist 15→24
UPDATE quiz_question_options SET option_text = 'アプリケーション間のデータ交換であるとされている'
WHERE id = '3267ebc3-484d-4583-ad38-ef1b1986ee54';

-- Q-0bf5cd88: 次の通信障害の切り分けで、IPアドレスの説明として正しいものはどれか。

実装や
-- correct=20, dist=[12,12,10] → pad longest dist 12→25
UPDATE quiz_question_options SET option_text = 'Webサイトの名前のことが前提条件として必要である'
WHERE id = 'fa3f14d9-f5c8-4e42-b51b-1261a8eff9d3';

-- Q-73f7b0a0: 次のパケット転送の文脈で、TCPとUDPの違いとして正しいものはどれか。

実装
-- correct=35, dist=[35,16,14] → pad longest dist 35→49
UPDATE quiz_question_options SET option_text = 'UDPはコネクション型で信頼性が高く、TCPはコネクションレス型で高速として知られている手法である'
WHERE id = '30b7527d-8a1e-4b0e-98fa-5ba2c89e30d2';

-- Q-d855c82e: 次のプロトコル設計の観点から、LANの説明として正しいものはどれか。

実装や運
-- correct=18, dist=[13,13,13] → pad longest dist 13→22
UPDATE quiz_question_options SET option_text = '世界中をつなぐネットワークであるとされている'
WHERE id = '7abb4f34-c50f-4887-b134-db9ee27e1329';

-- Q-8975d381: 次の通信障害の切り分けで、プロトコルの説明として正しいものはどれか。

実装や運
-- correct=19, dist=[12,11,9] → pad longest dist 12→23
UPDATE quiz_question_options SET option_text = 'セキュリティソフトのことが必要条件となっている'
WHERE id = '8d57340b-d5be-4327-9e2a-26835f871564';

-- Q-521221ad: 次のパケット転送の文脈で、HTTPの説明として正しいものはどれか。

実装や運用
-- correct=19, dist=[17,16,15] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = 'ファイルを転送するためのプロトコルとして知られている手法である'
WHERE id = '137823fe-5ba7-48aa-9962-72290c703265';

-- Q-0b0ac1a8: 次のプロトコル設計の観点から、DNSの役割として正しいものはどれか。

実装や運
-- correct=17, dist=[9,9,8] → pad longest dist 9→22
UPDATE quiz_question_options SET option_text = 'データを暗号化することを目的とした手法である'
WHERE id = 'a342da49-64c7-45ac-bb3d-ca4920ee8334';

-- Q-78c6ad4c: 次のネットワーク運用場面を想定するとき、ルーターの役割として正しいものはどれか。
-- correct=21, dist=[17,13,11] → pad longest dist 17→26
UPDATE quiz_question_options SET option_text = 'コンピュータ同士を直接接続する装置であるとされている'
WHERE id = 'ce1a8049-2292-44c6-aec0-2d5c58095cc8';

-- Q-f6b23b36: 次の通信障害の切り分けで、OSI参照モデルの第4層（トランスポート層）の役割とし
-- correct=22, dist=[18,14,13] → pad longest dist 18→27
UPDATE quiz_question_options SET option_text = 'IPアドレスによるルーティングを行うことが一般的である'
WHERE id = '0fce9dcf-d0b9-414e-b618-700b7d545cfc';

-- Q-bb2f834c: 次のパケット転送の文脈で、ロードバランサーの役割として正しいものはどれか。

基
-- correct=26, dist=[18,16,15] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = 'ネットワークのトラフィックを監視することを目的とした手法である'
WHERE id = 'b9f887f2-ca75-464e-b15c-b3deb0aeee75';

-- Q-32678748: 次のプロトコル設計の観点から、ICMPの説明として正しいものはどれか。

実装や
-- correct=24, dist=[15,14,13] → pad longest dist 15→29
UPDATE quiz_question_options SET option_text = 'ドメイン名を解決するプロトコルとして知られている手法である'
WHERE id = '7dbb0e71-ff8a-4fa7-909b-6683a0c42054';

-- Q-3fa20bd0: 次の通信障害の切り分けで、SMTPの役割として正しいものはどれか。

基本事項と
-- correct=16, dist=[16,14,13] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'Webページを転送するプロトコルとして知られている手法である'
WHERE id = 'a5f3509b-e1b5-49f0-a4c1-79d935a7790b';

-- Q-fa9e72ad: 次のプロトコル設計の観点から、ポート番号の説明として正しいものはどれか。

前提
-- correct=24, dist=[16,9,9] → pad longest dist 16→28
UPDATE quiz_question_options SET option_text = 'ネットワーク機器の物理的な接続口に該当する処理方式である'
WHERE id = '226a8ea5-4883-4aa0-ba6c-48285510d427';

-- Q-dc0853c3: 次の通信障害の切り分けで、OSI参照モデルの第3層（ネットワーク層）の役割として
-- correct=21, dist=[15,11,10] → pad longest dist 15→24
UPDATE quiz_question_options SET option_text = 'アプリケーション間のデータ交換であるとされている'
WHERE id = 'eb135d0c-6e7e-496c-ac54-1a7f0771bc10';

COMMIT;