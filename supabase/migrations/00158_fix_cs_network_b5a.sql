-- 00158_fix_cs_network_b5a.sql
-- CS network B5-a 길이편향 수정 (Validator 검증완료)
-- 생성일: 2026-04-06
-- CONFIRMED: 65건 / DISMISSED: 1건 / UPDATE: 64건
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 패딩으로 정답=최장 패턴 해소.

BEGIN;

-- Q-4c9943f6: IPアドレスのバージョンであるIPv4とIPv6の違いとして正しいものはどれか。
-- correct=32 "IPv4は32ビット、IPv6は128ビットのアドレス空間を持つ"
-- dist "IPv4は128ビット、IPv6は32ビットのアドレス空間を持つ" (32) → same len, but correct=longest tied
-- Rewrite: swap values + add detail to break tie and make longer
UPDATE quiz_question_options SET option_text = 'IPv4は128ビットで、IPv6は32ビットのアドレス空間を使用する'
WHERE id = '3bf183ac-ca22-4867-b6dd-0204c0230e77';

-- Q-67b6cd95: サブネットマスクの役割として正しいものはどれか。
-- correct=24 "IPアドレスのネットワーク部とホスト部を区別する"
-- dist "ドメイン名をIPアドレスに変換する" (17) → pad to ~26
UPDATE quiz_question_options SET option_text = 'ドメイン名をIPアドレスに自動的に変換して通知する'
WHERE id = '1a46fd1c-9ac9-498c-b42c-3851def013a9';

-- Q-a039e8a3: Wi-Fiの説明として正しいものはどれか。
-- correct=25 "電波を使ってケーブルなしでネットワーク接続する技術"
-- dist "有線LANの高速通信規格" (12) → pad to ~27
UPDATE quiz_question_options SET option_text = 'イーサネットに準拠した有線LAN専用の高速通信規格'
WHERE id = '88fe5003-f0d0-46b0-a9bf-2609f8f5f14f';

-- Q-7fe9fe81: WebSocketの特徴として正しいものはどれか。
-- correct=28 "クライアントとサーバー間で双方向リアルタイム通信ができる"
-- dist "サーバーからクライアントへの一方向通信のみ" (21) → pad to ~30
UPDATE quiz_question_options SET option_text = 'サーバーからクライアントへのプッシュ型一方向通信のみをサポートする'
WHERE id = '75d310f4-1ea5-40c2-a483-699508938cb8';

-- Q-9b1f5681: NAT（Network Address Translation）の説明として正しいものはどれか。
-- correct=26 "プライベートIPとグローバルIPを相互に変換する技術"
-- dist "ドメイン名とIPアドレスを変換する技術" (19) → pad to ~28
UPDATE quiz_question_options SET option_text = 'ドメイン名とIPアドレスの対応関係を変換・管理する技術'
WHERE id = 'f4777c41-76d8-4ee3-b30b-595a45f2b1c0';

-- Q-9cbc0f0a: TLS/SSLの役割として正しいものはどれか。
-- correct=17 "通信を暗号化して盗聴や改ざんを防ぐ"
-- dist "IPアドレスを動的に割り当てる" (15) → pad to ~19
UPDATE quiz_question_options SET option_text = 'IPアドレスをネットワーク内で動的に割り当てる'
WHERE id = 'e55b5188-cc67-454b-9ba3-9071b341f4c9';

-- Q-e3ceb76a: VLAN（Virtual LAN）の目的として正しいものはどれか。 [ratio fix]
-- correct=15 "論理的にネットワークを分割する", max dist=17
-- dist "ネットワーク機器を仮想化する" (14) → pad to ~18
UPDATE quiz_question_options SET option_text = 'ルーターやスイッチなどのネットワーク機器を仮想化する'
WHERE id = '08f84fa7-ecc6-459e-86a5-1783bf3ab225';

-- Q-e45c27b9: ルーティングプロトコルのOSPFの特徴として正しいものはどれか。
-- correct=23 "リンクステート型で最短経路を計算するプロトコル"
-- dist "アプリケーション層で動作するプロトコル" (19) → pad to ~25
UPDATE quiz_question_options SET option_text = 'OSI参照モデルのアプリケーション層で動作するプロトコル'
WHERE id = '54554167-a84f-4c5b-af39-de731e9bc3ee';

-- Q-eef3affa: ARPの役割として正しいものはどれか。
-- correct=20 "IPアドレスからMACアドレスを解決する"
-- dist "MACアドレスからIPアドレスを解決する" (20) → same len, pad to ~22
UPDATE quiz_question_options SET option_text = 'MACアドレスを基にして対応するIPアドレスを解決する'
WHERE id = 'ff2f414b-2e28-4dc5-9abd-50375de510a8';

-- Q-f121718d: プロトコルの説明として正しいものはどれか。
-- correct=19 "コンピュータ間の通信の取り決め（規約）"
-- dist "セキュリティソフトのこと" (12) → pad to ~21
UPDATE quiz_question_options SET option_text = 'ウイルス対策などを行うセキュリティソフトのこと'
WHERE id = 'f03d6e31-1eec-42b5-bf16-b93c4ec6911d';

-- Q-a7a798cd: URLの説明として正しいものはどれか。
-- correct=22 "インターネット上のリソースの場所を示す文字列"
-- dist "ネットワーク上の機器の固有番号" (15) → pad to ~24
UPDATE quiz_question_options SET option_text = 'ネットワーク上の通信機器に割り当てられる固有番号'
WHERE id = 'f7ef2e1b-377b-4187-88eb-bea0245a1ef0';

-- Q-d9c0a8b0: MACアドレスの説明として正しいものはどれか。
-- correct=23 "ネットワーク機器に付与される固有の物理アドレス"
-- dist "ソフトウェアで変更可能なIPアドレス" (18) → pad to ~25
UPDATE quiz_question_options SET option_text = 'OS上のソフトウェア設定で自由に変更可能なIPアドレス'
WHERE id = 'ed7d60ce-c2b3-4f2d-aec2-e90289f9e982';

-- Q-564ee84f: プロキシサーバーの説明として正しいものはどれか。
-- correct=28 "クライアントの代理でインターネット通信を中継するサーバー"
-- dist "Webサイトのコンテンツを公開するサーバー" (21) → pad to ~30
UPDATE quiz_question_options SET option_text = 'Webサイトのコンテンツをインターネット上に公開するサーバー'
WHERE id = 'b8469a43-b1f0-471f-83df-eb9096540319';

-- Q-baad3bcc: FTPの役割として正しいものはどれか。 [ratio fix]
-- correct=14 "ファイルを転送するプロトコル", max dist=16
-- dist "暗号通信を行うプロトコル" (12) → pad to ~17
UPDATE quiz_question_options SET option_text = 'TLSベースの暗号通信を行うためのプロトコル'
WHERE id = '1a84b820-3712-4337-bd4b-d4b17323abd2';

-- Q-d0f60cdb: ポート番号の説明として正しいものはどれか。
-- correct=24 "通信先のアプリケーションやサービスを識別する番号"
-- dist "ネットワーク機器の物理的な接続口" (16) → pad to ~26
UPDATE quiz_question_options SET option_text = 'ネットワーク機器に設けられた物理的なケーブル接続口'
WHERE id = 'e1295752-664c-4d77-b41c-c9bf8267a7db';

-- Q-79b2103d: ロードバランサーの役割として正しいものはどれか。
-- correct=26 "複数のサーバーにリクエストを分散して負荷を均等にする"
-- dist "ネットワークのトラフィックを監視する" (18) → pad to ~28
UPDATE quiz_question_options SET option_text = 'ネットワーク上のトラフィック量をリアルタイムに監視する'
WHERE id = '9b61f170-8fe3-4dc8-9d2a-e8f609c695b8';

-- Q-ff73e900: QoS（Quality of Service）の目的として正しいものはどれか。
-- correct=30 "ネットワーク上の通信品質を保証するために帯域・優先制御を行う"
-- dist "ネットワークのセキュリティを強化する" (18) → pad to ~32
UPDATE quiz_question_options SET option_text = 'ファイアウォールやIDSを用いてネットワークのセキュリティを強化する'
WHERE id = '16a89509-9f3b-4e71-a7e0-6b4c8873e924';

-- Q-411961f3: ICMPの説明として正しいものはどれか。
-- correct=24 "ネットワーク診断やエラー通知に使われるプロトコル"
-- dist "ドメイン名を解決するプロトコル" (15) → pad to ~26
UPDATE quiz_question_options SET option_text = 'ドメイン名をIPアドレスに解決するためのプロトコル'
WHERE id = 'b311e7ab-e944-43ec-9b1f-c6e5a8b65930';

-- Q-ae38b0d8: HTTPプロトコルの特徴として正しいものはどれか。 [ratio fix]
-- correct=20 "ステートレスで各リクエストが独立している", max dist=22
-- dist "UDPの上で動作する" (10) → pad to ~23
UPDATE quiz_question_options SET option_text = 'トランスポート層のUDPプロトコルの上で動作する'
WHERE id = 'c9bb43c6-f419-4eb4-9260-ee591e5671f3';

-- Q-4a95ffdb: TCPとUDPの違いとして正しいものはどれか。
-- correct=37 "TCPはコネクション型で信頼性を保証しUDPはコネクションレスで高速である"
-- dist "UDPはコネクション型でTCPはコネクションレスである" (27) → pad to ~39
UPDATE quiz_question_options SET option_text = 'UDPはコネクション型で信頼性を保証し、TCPはコネクションレスで高速である'
WHERE id = '2d980e7b-3968-4f6d-ac30-8880a5b99b32';

-- Q-3e2a1d63: DNSの主な役割として正しいものはどれか。
-- correct=17 "ドメイン名をIPアドレスに変換する"
-- dist "データを暗号化して転送する" (13) → pad to ~19
UPDATE quiz_question_options SET option_text = 'ネットワーク上のデータを暗号化して転送する'
WHERE id = '7711d093-f6cb-43d9-ae0b-d89b66085347';

-- Q-c51ccf96: HTTPSにおけるTLSの役割として正しいものはどれか。 [MANUAL: correct=shortest]
-- correct=16, dist=[23,17,17]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-3e592fb6: ルーティングテーブルの役割として正しいものはどれか。
-- correct=26 "パケットの宛先に基づき転送先を決定する情報を保持する"
-- dist "DNSの名前解決結果をキャッシュする" (18) → pad to ~28
UPDATE quiz_question_options SET option_text = 'DNSサーバが返した名前解決の結果をローカルにキャッシュする'
WHERE id = 'd3e500bb-677f-41e6-bf57-20df72ca1ba7';

-- Q-9c488480: TCPのフロー制御におけるスライディングウィンドウ方式に関する説明として正しいものはどれか。 [ratio fix]
-- correct=44, max dist=47 (sort2), target dist(sort1)=30→46
-- dist "送信側がウィンドウサイズを一方的に決定し、受信側はそれに従う" (30) → pad to ~46
UPDATE quiz_question_options SET option_text = '送信側がウィンドウサイズを一方的に決定し、受信側はACKを返さずにそれに従う'
WHERE id = '3737a8e7-cc55-4c53-9c47-c2f08b576d42';

-- Q-6f42211a: DNSにおける再帰クエリと反復クエリの違いとして正しいものはどれか。
-- correct=46 "再帰クエリではサーバが代理で最終回答を取得し、反復クエリでは次に問い合わせるべきサーバを返す"
-- dist "再帰クエリは次の問い合わせ先を返し、反復クエリはサーバが代理で回答を取得する" (38) → pad to ~48
UPDATE quiz_question_options SET option_text = '再帰クエリではクライアントに次の問い合わせ先を返し、反復クエリではサーバが代理で回答を取得する'
WHERE id = '4be3841b-867e-47e5-b230-1fbfbdfc87df';

-- Q-3f1d5530: VPN（Virtual Private Network）のトンネリングに関する説明として正しいものはどれか。
-- correct=45 "パケットをカプセル化し、公衆ネットワーク上に暗号化された仮想専用通信路を構築する技術である"
-- dist "LANスイッチのVLAN機能を用いてネットワークを論理的に分割する技術である" (38) → pad to ~47
UPDATE quiz_question_options SET option_text = 'LANスイッチのVLAN機能を用いて社内ネットワークを論理的かつ柔軟に分割する技術である'
WHERE id = '6e87c538-181c-4a9e-aea2-58a7408a4cdd';

-- Q-eb7cb4eb: ファイアウォールの種類に関する説明として正しいものはどれか。
-- correct=52 "ステートフルインスペクション型は通信状態を追跡し、アプリケーションゲートウェイ型はデータ内容を検査できる"
-- dist "ステートフルインスペクション型は通信の状態を追跡せず、個々のパケットを独立に判断する" (42) → pad to ~54
UPDATE quiz_question_options SET option_text = 'ステートフルインスペクション型は通信の状態を追跡せず、受信した個々のパケットを独立して判断する'
WHERE id = '796969ec-3e91-4bac-a7e8-dc6e88dd8a1c';

-- Q-e30eed05: HTTPS通信におけるTLSハンドシェイクの流れとして正しいものはどれか。
-- correct=47 "クライアントがClientHelloを送信後、サーバ証明書の検証と鍵交換を経て共通鍵を生成する"
-- dist "サーバが最初にClientHelloを送信し、クライアントがServerHelloで応答する" (46) → pad to ~49
UPDATE quiz_question_options SET option_text = 'サーバ側が最初にClientHelloメッセージを送信し、クライアントがServerHelloで応答する'
WHERE id = '5983dd6c-2113-4de8-9a3c-a15494d49549';

-- Q-e5f92954: NAT（Network Address Translation）とポートフォワーディングに関する説明として正しいものはどれか。
-- correct=59 "NAPTはポート番号も変換して複数端末の同時接続を実現し、ポートフォワーディングは外部通信を内部の特定ホストに転送する"
-- dist "ポートフォワーディングはLAN内のすべての端末に対して同じポートを開放する仕組みである" (43) → pad to ~61
UPDATE quiz_question_options SET option_text = 'ポートフォワーディングはLAN内に接続されたすべての端末に対して同一のポート番号を一律に開放する仕組みである'
WHERE id = '8aacfd78-0ea5-481e-9714-aa2af0a5e64e';

-- Q-6ef7f54c: E-R図（ER図）の説明として正しいものはどれか。
-- correct=18 "エンティティとその関連を図示したもの"
-- dist "プログラムの処理の流れを示したもの" (17) → pad to ~20
UPDATE quiz_question_options SET option_text = 'プログラムの処理手順や流れを視覚的に示したもの'
WHERE id = 'dd9d6669-610b-4abb-906d-f17053d9ccd5';

-- Q-6bdd9f99: WANの説明として正しいものはどれか。
-- correct=22 "地理的に離れた拠点を接続する広域ネットワーク"
-- dist "プライベートネットワークのこと" (15) → pad to ~24
UPDATE quiz_question_options SET option_text = 'VPNなどで構築されるプライベートネットワークのこと'
WHERE id = '794f1b2c-fbf1-406f-b073-0502e450967d';

-- Q-7e946e3c: DNSラウンドロビンの説明として正しいものはどれか。
-- correct=35 "1つのドメイン名に複数のIPを関連付け問い合わせごとに異なるIPを返す"
-- dist "複数のドメイン名を1つのIPアドレスに関連付ける" (24) → pad to ~37
UPDATE quiz_question_options SET option_text = '複数の異なるドメイン名を1つのグローバルIPアドレスに関連付ける'
WHERE id = 'b781d944-1f72-44a8-899e-d5a3a0a55b07';

-- Q-a0680096: DHCPの役割として正しいものはどれか。 [ratio fix]
-- correct=16 "IPアドレスを自動的に割り当てる", max dist=17
-- dist "メールを配送する" (8) → pad to ~18
UPDATE quiz_question_options SET option_text = 'SMTPを用いてメールを宛先サーバへ配送する'
WHERE id = 'ea24c340-2ec4-40b7-aa23-64127265fcb0';

-- Q-239b75a0: OSI参照モデルの第4層（トランスポート層）の役割として正しいものはどれか。
-- correct=22 "エンドツーエンドの信頼性のある通信を提供する"
-- dist "IPアドレスによるルーティングを行う" (18) → pad to ~24
UPDATE quiz_question_options SET option_text = 'IPアドレスに基づくパケットのルーティングを行う'
WHERE id = 'aa360cb9-0bbf-440f-b89e-9e2931ab0704';

-- Q-7c07a22d: OSI参照モデルの第3層（ネットワーク層）の役割として正しいものはどれか。
-- correct=21 "IPアドレスによるルーティング（経路制御）"
-- dist "アプリケーション間のデータ交換" (15) → pad to ~23
UPDATE quiz_question_options SET option_text = 'アプリケーション間でのデータ交換やセッション管理'
WHERE id = '0c173c38-9dc4-4dc6-9088-eefb292a7421';

-- Q-d7cb21cc: IPS（侵入防止システム）がIDSと異なる点はどれか。
-- correct=23 "不正な通信を検知するだけでなく自動的に遮断する"
-- dist "検知のみで遮断は行わない" (12) → pad to ~25
UPDATE quiz_question_options SET option_text = '不正な通信パターンの検知のみを行い、遮断は実施しない'
WHERE id = '89ca4723-696e-40e1-937b-b0267b6c8665';

-- Q-756081f1: TCP/IPで接続確立に使われる3ウェイハンドシェイクの正しい順序はどれか。
-- correct=19 "SYN → SYN+ACK → ACK"
-- dist "ACK → SYN → SYN+ACK" (19) → same len, pad to ~21
-- COMMENT: symbolic sequence options — padding with whitespace/suffix is unnatural. Adding minor structure.
UPDATE quiz_question_options SET option_text = 'ACK → SYN → SYN+ACK の順'
WHERE id = '93dc7c78-4279-4911-8ccd-2c650cb6fd50';

-- Q-677eb171: Bluetooth の説明として正しいものはどれか。
-- correct=19 "近距離の機器間を無線で接続する通信規格"
-- dist "インターネット接続のプロトコル" (15) → pad to ~21
UPDATE quiz_question_options SET option_text = 'インターネットに直接接続するための通信プロトコル'
WHERE id = '3a6ba083-4477-4efb-9509-7836a340bc69';

-- Q-84c46c73: クラウドサービスのSaaSの説明として正しいものはどれか。
-- correct=23 "インターネット経由でソフトウェアを提供する形態"
-- dist "OSやミドルウェアの実行環境を提供する形態" (21) → pad to ~25
UPDATE quiz_question_options SET option_text = 'OSやミドルウェアなどのアプリケーション実行環境を提供する形態'
WHERE id = 'e7bff479-e8a0-446b-8f39-fa701e471bc5';

-- Q-b646f91a: スイッチングハブの役割として正しいものはどれか。
-- correct=26 "MACアドレスを基に目的の機器にデータを転送する装置"
-- dist "異なるネットワーク間を接続する装置" (17) → pad to ~28
UPDATE quiz_question_options SET option_text = 'IPアドレスを用いて異なるネットワーク間を接続する装置'
WHERE id = '9f60d880-a62f-4770-a004-e90a6cc9450a';

-- Q-216a6a61: ルーターの役割として正しいものはどれか。
-- correct=21 "異なるネットワーク間でデータを中継する装置"
-- dist "コンピュータ同士を直接接続する装置" (17) → pad to ~23
UPDATE quiz_question_options SET option_text = 'ケーブルを使ってコンピュータ同士を直接接続する装置'
WHERE id = '9122286e-c3f9-4996-88a1-cc2851e880ac';

-- Q-16f95438: DNSの役割として正しいものはどれか。
-- correct=17 "ドメイン名をIPアドレスに変換する"
-- dist "データを暗号化する" (9) → pad to ~19
UPDATE quiz_question_options SET option_text = 'ネットワーク上のデータを暗号化して保護する'
WHERE id = 'c6d19ecd-6c35-4b0d-a9b8-610aee2e4a83';

-- Q-89bf300a: HTTPのステータスコード404が示す意味はどれか。
-- correct=22 "リソースが見つからない（Not Found）"
-- dist "サーバー内部エラー" (9) → pad to ~24
UPDATE quiz_question_options SET option_text = 'サーバー内部で処理中にエラーが発生した（Server Error）'
WHERE id = 'b3b76781-ab3b-472a-bcc4-51dcf6450ab6';

-- Q-6637de53: TCPとUDPの違いとして正しいものはどれか。
-- correct=35 "TCPはコネクション型で信頼性が高く、UDPはコネクションレス型で高速"
-- dist "UDPはコネクション型で信頼性が高く、TCPはコネクションレス型で高速" (35) → same len, pad to ~37
UPDATE quiz_question_options SET option_text = 'UDPはコネクション型で信頼性が高く、一方TCPはコネクションレス型で高速'
WHERE id = '427a3243-1711-42f5-bdef-174e52dda618';

-- Q-77e0e177: SMTPの役割として正しいものはどれか。
-- correct=16 "メールを送信・転送するプロトコル"
-- dist "Webページを転送するプロトコル" (16) → same len, pad to ~18
UPDATE quiz_question_options SET option_text = 'HTML形式のWebページを転送するプロトコル'
WHERE id = 'eb2adab4-0e00-4b30-9f6c-8704962944ed';

-- Q-4e8ef81a: IPアドレスの説明として正しいものはどれか。
-- correct=20 "ネットワーク上の機器を識別するための番号"
-- dist "Webサイトの名前のこと" (12) → pad to ~22
UPDATE quiz_question_options SET option_text = 'ブラウザでアクセスするWebサイトの名前のこと'
WHERE id = '00a1b814-b141-4fd2-8aa8-e434dbb98ca4';

-- Q-6ab8f9ee: HTTPSの「S」が意味するものはどれか。 [ratio fix]
-- correct=11 "Secure（安全な）", max dist=14 "Standard（標準的な）"
-- dist "Speed（高速な）" (10) → pad to ~14
UPDATE quiz_question_options SET option_text = 'Speed（高速な通信）'
WHERE id = 'c29a3700-a673-4ee6-a991-1482eb5407f8';

-- Q-15a20286: SDN（Software Defined Networking）の説明として正しいものはどれか。 [ratio fix]
-- correct=24 "ネットワーク制御をソフトウェアで集中管理する技術", max dist=25
-- dist "ネットワークの通信速度を自動調整する技術" (20) → pad to ~26
UPDATE quiz_question_options SET option_text = 'トラフィック量に応じてネットワークの通信速度を自動調整する技術'
WHERE id = '8fd2efa4-2bd1-4c44-9014-dd4666381db7';

-- Q-9b8bf101: LANの説明として正しいものはどれか。
-- correct=18 "限られた範囲で構築されるネットワーク"
-- dist "世界中をつなぐネットワーク" (13) → pad to ~20
UPDATE quiz_question_options SET option_text = '世界中の拠点をつなぐ広域のネットワーク'
WHERE id = 'a61aa07f-b36c-4d9f-84d4-4d7ae1b3b843';

-- Q-e6aff7fb: HTTPの説明として正しいものはどれか。
-- correct=19 "Webページを転送するためのプロトコル"
-- dist "ファイルを転送するためのプロトコル" (17) → pad to ~21
UPDATE quiz_question_options SET option_text = 'サーバ間でファイルを安全に転送するためのプロトコル'
WHERE id = 'f7a63e1f-303f-4d85-829a-c932f0d85b50';

-- Q-6f4a80f1: TCPのフロー制御の目的として正しいものはどれか。
-- correct=22 "送信速度を受信側の処理能力に合わせて調整する"
-- dist "IPアドレスの割り当てを行う" (14) → pad to ~24
UPDATE quiz_question_options SET option_text = 'ネットワーク内の端末にIPアドレスの割り当てを行う'
WHERE id = '01e22ebe-53b1-470a-8e69-9bb62a9a229f';

-- Q-1b8993fb: 次のネットワーク運用場面を想定するとき、OSI参照モデルの第3層（ネットワーク層）の役割として正しいものはどれか。
-- correct=21 "IPアドレスによるルーティング（経路制御）"
-- dist "アプリケーション間のデータ交換" (15) → pad to ~23
UPDATE quiz_question_options SET option_text = 'アプリケーション間でのデータ交換やセッション管理'
WHERE id = '3267ebc3-484d-4583-ad38-ef1b1986ee54';

-- Q-0bf5cd88: 次の通信障害の切り分けで、IPアドレスの説明として正しいものはどれか。
-- correct=20 "ネットワーク上の機器を識別するための番号"
-- dist "Webサイトの名前のこと" (12) → pad to ~22
UPDATE quiz_question_options SET option_text = 'ブラウザでアクセスするWebサイトの名前のこと'
WHERE id = 'fa3f14d9-f5c8-4e42-b51b-1261a8eff9d3';

-- Q-73f7b0a0: 次のパケット転送の文脈で、TCPとUDPの違いとして正しいものはどれか。
-- correct=35 "TCPはコネクション型で信頼性が高く、UDPはコネクションレス型で高速"
-- dist "UDPはコネクション型で信頼性が高く、TCPはコネクションレス型で高速" (35) → same len, pad to ~37
UPDATE quiz_question_options SET option_text = 'UDPはコネクション型で信頼性が高く、一方TCPはコネクションレス型で高速'
WHERE id = '30b7527d-8a1e-4b0e-98fa-5ba2c89e30d2';

-- Q-d855c82e: 次のプロトコル設計の観点から、LANの説明として正しいものはどれか。
-- correct=18 "限られた範囲で構築されるネットワーク"
-- dist "世界中をつなぐネットワーク" (13) → pad to ~20
UPDATE quiz_question_options SET option_text = '世界中の拠点をつなぐ広域のネットワーク'
WHERE id = '7abb4f34-c50f-4887-b134-db9ee27e1329';

-- Q-8975d381: 次の通信障害の切り分けで、プロトコルの説明として正しいものはどれか。
-- correct=19 "コンピュータ間の通信の取り決め（規約）"
-- dist "セキュリティソフトのこと" (12) → pad to ~21
UPDATE quiz_question_options SET option_text = 'ウイルス対策などを行うセキュリティソフトのこと'
WHERE id = '8d57340b-d5be-4327-9e2a-26835f871564';

-- Q-521221ad: 次のパケット転送の文脈で、HTTPの説明として正しいものはどれか。
-- correct=19 "Webページを転送するためのプロトコル"
-- dist "ファイルを転送するためのプロトコル" (17) → pad to ~21
UPDATE quiz_question_options SET option_text = 'サーバ間でファイルを安全に転送するためのプロトコル'
WHERE id = '137823fe-5ba7-48aa-9962-72290c703265';

-- Q-0b0ac1a8: 次のプロトコル設計の観点から、DNSの役割として正しいものはどれか。
-- correct=17 "ドメイン名をIPアドレスに変換する"
-- dist "データを暗号化する" (9) → pad to ~19
UPDATE quiz_question_options SET option_text = 'ネットワーク上のデータを暗号化して保護する'
WHERE id = 'a342da49-64c7-45ac-bb3d-ca4920ee8334';

-- Q-78c6ad4c: 次のネットワーク運用場面を想定するとき、ルーターの役割として正しいものはどれか。
-- correct=21 "異なるネットワーク間でデータを中継する装置"
-- dist "コンピュータ同士を直接接続する装置" (17) → pad to ~23
UPDATE quiz_question_options SET option_text = 'ケーブルを使ってコンピュータ同士を直接接続する装置'
WHERE id = 'ce1a8049-2292-44c6-aec0-2d5c58095cc8';

-- Q-f6b23b36: 次の通信障害の切り分けで、OSI参照モデルの第4層（トランスポート層）の役割として正しいものはどれか。
-- correct=22 "エンドツーエンドの信頼性のある通信を提供する"
-- dist "IPアドレスによるルーティングを行う" (18) → pad to ~24
UPDATE quiz_question_options SET option_text = 'IPアドレスに基づくパケットのルーティングを行う'
WHERE id = '0fce9dcf-d0b9-414e-b618-700b7d545cfc';

-- Q-bb2f834c: 次のパケット転送の文脈で、ロードバランサーの役割として正しいものはどれか。
-- correct=26 "複数のサーバーにリクエストを分散して負荷を均等にする"
-- dist "ネットワークのトラフィックを監視する" (18) → pad to ~28
UPDATE quiz_question_options SET option_text = 'ネットワーク上のトラフィック量をリアルタイムに監視する'
WHERE id = 'b9f887f2-ca75-464e-b15c-b3deb0aeee75';

-- Q-32678748: 次のプロトコル設計の観点から、ICMPの説明として正しいものはどれか。
-- correct=24 "ネットワーク診断やエラー通知に使われるプロトコル"
-- dist "ドメイン名を解決するプロトコル" (15) → pad to ~26
UPDATE quiz_question_options SET option_text = 'ドメイン名をIPアドレスに解決するためのプロトコル'
WHERE id = '7dbb0e71-ff8a-4fa7-909b-6683a0c42054';

-- Q-3fa20bd0: 次の通信障害の切り分けで、SMTPの役割として正しいものはどれか。
-- correct=16 "メールを送信・転送するプロトコル"
-- dist "Webページを転送するプロトコル" (16) → same len, pad to ~18
UPDATE quiz_question_options SET option_text = 'HTML形式のWebページを転送するプロトコル'
WHERE id = 'a5f3509b-e1b5-49f0-a4c1-79d935a7790b';

-- Q-fa9e72ad: 次のプロトコル設計の観点から、ポート番号の説明として正しいものはどれか。
-- correct=24 "通信先のアプリケーションやサービスを識別する番号"
-- dist "ネットワーク機器の物理的な接続口" (16) → pad to ~26
UPDATE quiz_question_options SET option_text = 'ネットワーク機器に設けられた物理的なケーブル接続口'
WHERE id = '226a8ea5-4883-4aa0-ba6c-48285510d427';

-- Q-dc0853c3: 次の通信障害の切り分けで、OSI参照モデルの第3層（ネットワーク層）の役割として正しいものはどれか。
-- correct=21 "IPアドレスによるルーティング（経路制御）"
-- dist "アプリケーション間のデータ交換" (15) → pad to ~23
UPDATE quiz_question_options SET option_text = 'アプリケーション間でのデータ交換やセッション管理'
WHERE id = 'eb135d0c-6e7e-496c-ac54-1a7f0771bc10';

COMMIT;
