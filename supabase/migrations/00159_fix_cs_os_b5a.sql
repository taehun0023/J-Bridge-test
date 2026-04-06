-- 00159_fix_cs_os_b5a.sql
-- CS os B5-a 길이편향 수정
-- 생성일: 2026-04-06
-- CONFIRMED: 99건 / DISMISSED: 0건 / UPDATE: 96건
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 패딩으로 정답=최장 패턴 해소.

BEGIN;

-- Q-8fe9e9f4: 標本化（サンプリング）の説明として正しいものはどれか。
-- correct=18, dist=[15,14,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = 'ファイルをバックアップすることが求められている'
WHERE id = '6073e421-d482-4769-9c5d-7a0f694c420a';

-- Q-396be538: プロセスとスレッドの違いとして正しいものはどれか。
-- correct=23, dist=[22,17,15] → pad longest dist 22→35
UPDATE quiz_question_options SET option_text = 'スレッドはプロセスより多くのメモリを消費することを目的とした手法である'
WHERE id = '44cf9584-9b8b-4475-a0c8-d35a6a0c6a98';

-- Q-f25b5605: OSのカーネルの役割として最も適切なものはどれか。
-- correct=28, dist=[18,14,13] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = 'アプリケーションのインストールを行うことを目的とした手法である'
WHERE id = 'bf6e121c-e3d1-4e38-823f-e4ff1f3c6145';

-- Q-93b5a028: ページングの説明として正しいものはどれか。
-- correct=35, dist=[20,17,16] → pad longest dist 20→33
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割するとして一般的に知られている'
WHERE id = '4c2564b2-caae-43b3-a662-b9fb8d4581f1';

-- Q-619d316e: ラウンドロビンスケジューリングの説明として正しいものはどれか。
-- correct=25, dist=[22,20,18] → pad longest dist 22→30
UPDATE quiz_question_options SET option_text = '先に到着したプロセスが完了するまで実行される手法のことである'
WHERE id = 'ec87907a-6a41-4077-9e1f-4939047f066b';

-- Q-e0437541: 仮想記憶方式におけるページテーブルの役割として正しいものはどれか。 [MANUAL: correct=shortest]
-- correct=27, dist=[31,28,28]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-69eaec02: ページ置換アルゴリズムに関する説明として正しいものはどれか。 [ratio fix]
-- ratio=1.52, min=25→35, max=38
UPDATE quiz_question_options SET option_text = 'LRUとFIFOは常に同じページフォールト率を示すことが主な特徴である'
WHERE id = '37acdcdc-4f1c-4fd4-9286-5aa10579efcc';

-- Q-f65dd1cb: メモリ管理方式であるページングとセグメンテーションの比較として正しいものはどれか
-- correct=62, dist=[46,38,31] → pad longest dist 46→59
UPDATE quiz_question_options SET option_text = 'セグメンテーションは固定サイズで外部フラグメンテーションがなく、ページングは可変サイズであるとして一般的に知られている'
WHERE id = '7a281ffd-1e3a-4568-9f32-5a57b7ad4b02';

-- Q-c8e08e15: プロセススケジューリングにおける優先度ベース方式とラウンドロビン方式の比較として [ratio fix]
-- ratio=1.60, min=25→37, max=40
UPDATE quiz_question_options SET option_text = '優先度ベースは常にラウンドロビンより応答時間が短いに該当する処理方式である'
WHERE id = 'ac4aa829-576b-48d1-bd23-1056cc2861de';

-- Q-9badd323: UNIX系ファイルシステムにおけるi-node（アイノード）の説明として正しいも
-- correct=39, dist=[31,28,27] → pad longest dist 31→44
UPDATE quiz_question_options SET option_text = 'ファイル名とファイルの内容データを直接格納するデータ構造であることを目的とした手法である'
WHERE id = 'b4f9fa96-49dc-49e6-a267-086d65a7887f';

-- Q-48685202: ファイルシステムの主な役割として正しいものはどれか。
-- correct=21, dist=[15,12,11] → pad longest dist 15→24
UPDATE quiz_question_options SET option_text = 'CPUのタスクスケジューリングであるとされている'
WHERE id = '5f97d4e4-ac43-4079-a569-f4340c716f88';

-- Q-f1000001: ページフォールトが発生するのはどのようなときか。
-- correct=18, dist=[18,15,12] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'CPUのクロック周波数が低下したときとして知られている手法である'
WHERE id = 'f1000001-0000-4000-b000-000000000122';

-- Q-a4659253: デッドロックの説明として正しいものはどれか。
-- correct=27, dist=[19,17,15] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'メモリが不足してプロセスが停止する状態に該当する処理方式である'
WHERE id = 'c9597c2d-ca6b-4738-ad7d-f3d9301e359e';

-- Q-032c0b44: ファイルシステムの役割として正しいものはどれか。
-- correct=18, dist=[16,16,15] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'CPUの処理速度を管理する仕組みとして知られている手法である'
WHERE id = '31e39d95-caa8-4abb-ac50-5d7c24ab81b6';

-- Q-433a7e3c: ページフォルトが発生する状況として正しいものはどれか。
-- correct=24, dist=[23,19,16] → pad longest dist 23→37
UPDATE quiz_question_options SET option_text = 'CPUキャッシュにデータが見つからなかった場合として知られている手法である'
WHERE id = '6b9f5e06-b062-46d9-85ec-58b5916000d9';

-- Q-416543ee: セマフォの説明として正しいものはどれか。
-- correct=26, dist=[18,18,15] → pad longest dist 18→30
UPDATE quiz_question_options SET option_text = 'プロセス間でデータを送受信する仕組みに該当する処理方式である'
WHERE id = '26cfa18b-da19-4d86-9c08-b2e798efff79';

-- Q-8eed3b0e: ラウンドロビン方式のプロセススケジューリングの説明として正しいものはどれか。
-- correct=25, dist=[21,19,18] → pad longest dist 21→26
UPDATE quiz_question_options SET option_text = '最も優先度の高いプロセスを常に実行する方式に該当する'
WHERE id = 'cc258f8e-76da-4dfe-8620-6806c1464996';

-- Q-50bba785: ページングの説明として正しいものはどれか。
-- correct=24, dist=[22,16,14] → pad longest dist 22→27
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割する方式に該当する'
WHERE id = 'd137c603-5488-447b-af27-ef1d1271e708';

-- Q-b530ec76: コンテキストスイッチの説明として正しいものはどれか。
-- correct=36, dist=[25,23,18] → pad longest dist 25→38
UPDATE quiz_question_options SET option_text = 'ユーザーモードからカーネルモードへの遷移のみを指すことを目的とした手法である'
WHERE id = 'd5b76861-21df-4e5a-8d33-e11cd5605771';

-- Q-79569b91: 仮想メモリの利点として正しいものはどれか。
-- correct=22, dist=[17,15,13] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'プログラムの実行速度が必ず向上することが主な目的である'
WHERE id = '3dec7c18-858c-407f-aa93-dd8b86f7aae5';

-- Q-29063da6: スラッシングの説明として正しいものはどれか。
-- correct=27, dist=[18,15,14] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度が低下する現象として知られている手法である'
WHERE id = '45587047-80b9-4a4b-8ea6-4a9c4e9e0de8';

-- Q-41ddb427: デッドロックの説明として正しいものはどれか。
-- correct=25, dist=[24,16,13] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = 'ネットワーク切断でトランザクションが中断した状態として知られている手法である'
WHERE id = 'a8e6a1f9-9e53-499f-90e1-48050427e161';

-- Q-dd996a7e: プロセスとスレッドの違いとして正しいものはどれか。
-- correct=23, dist=[17,16,15] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'スレッドは独立したメモリ空間を持つことが主な特徴である'
WHERE id = '098d28ad-9488-4f1e-9f46-5d3cadf28395';

-- Q-ef47d31a: GPUの用途として最も適切なものはどれか。 [ratio fix]
-- ratio=1.57, min=7→12, max=11
UPDATE quiz_question_options SET option_text = '文書の印刷処理に該当する'
WHERE id = '4a8d04df-d376-4c2e-b221-5d8e428f3295';

-- Q-6f913e4a: B木（Bツリー）が主に使用される場面はどれか。
-- correct=13, dist=[13,8,7] → pad longest dist 13→27
UPDATE quiz_question_options SET option_text = 'ネットワークのルーティングとして知られている手法である'
WHERE id = '30246ead-29a3-4683-868c-81a6cc9673c1';

-- Q-fcb60331: 次のOS運用場面を想定するとき、ページングの説明として正しいものはどれか。

基
-- correct=24, dist=[22,16,14] → pad longest dist 22→27
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割する方式に該当する'
WHERE id = 'c2762633-f1d4-4607-b7ec-d9ea12600364';

-- Q-2989f042: 次のシステム障害対応の文脈で、スラッシングの説明として正しいものはどれか。

基
-- correct=27, dist=[18,15,14] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度が低下する現象として知られている手法である'
WHERE id = '7b0241ce-6fff-42c1-8205-7f864bf49ae8';

-- Q-d528bd4d: 次のプロセス管理の状況で、プロセスとスレッドの違いとして正しいものはどれか。


-- correct=23, dist=[17,16,15] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'スレッドは独立したメモリ空間を持つことが主な特徴である'
WHERE id = '17177c26-c8d6-4389-b80e-ffedd1b066c5';

-- Q-aafd3ea4: 次のメモリ管理の観点から、デッドロックの説明として正しいものはどれか。

基本事
-- correct=27, dist=[19,17,15] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'メモリが不足してプロセスが停止する状態に該当する処理方式である'
WHERE id = 'cfc762ee-8f84-4d54-85bf-22039bd1c7d8';

-- Q-553892e5: 次のプロセス管理の状況で、デッドロックの説明として正しいものはどれか。

実装や
-- correct=25, dist=[24,16,13] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = 'ネットワーク切断でトランザクションが中断した状態として知られている手法である'
WHERE id = 'b63c9c68-d579-4df3-bf14-0aed4b3081b8';

-- Q-fd6b67a8: 次のメモリ管理の観点から、標本化（サンプリング）の説明として正しいものはどれか。
-- correct=18, dist=[15,14,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = 'ファイルをバックアップすることが求められている'
WHERE id = '39b732b3-dc34-4323-81d7-902988e6ee9d';

-- Q-d3b757ae: 次のOS運用場面を想定するとき、ラウンドロビン方式のプロセススケジューリングの説
-- correct=25, dist=[21,19,18] → pad longest dist 21→26
UPDATE quiz_question_options SET option_text = '最も優先度の高いプロセスを常に実行する方式に該当する'
WHERE id = '24e7bf4d-f491-492b-b54b-b5f13031d64c';

-- Q-b01af69b: 次のシステム障害対応の文脈で、ファイルシステムの役割として正しいものはどれか。

-- correct=18, dist=[16,16,15] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'CPUの処理速度を管理する仕組みとして知られている手法である'
WHERE id = 'dcc19e0d-a799-410a-9689-36134d87dfb7';

-- Q-7d4612f3: 次のプロセス管理の状況で、セマフォの説明として正しいものはどれか。

実装や運用
-- correct=26, dist=[18,18,15] → pad longest dist 18→30
UPDATE quiz_question_options SET option_text = 'プロセス間でデータを送受信する仕組みに該当する処理方式である'
WHERE id = '2ee08359-7c2d-4e03-b85a-b4c524e31bf4';

-- Q-cdc855aa: 次のメモリ管理の観点から、プロセスとスレッドの違いとして正しいものはどれか。


-- correct=23, dist=[22,17,15] → pad longest dist 22→35
UPDATE quiz_question_options SET option_text = 'スレッドはプロセスより多くのメモリを消費することを目的とした手法である'
WHERE id = 'b5a81680-93a8-4483-9dbf-f52a14d53bbe';

-- Q-82d65894: 次のOS運用場面を想定するとき、ページングの説明として正しいものはどれか。

実
-- correct=24, dist=[22,16,14] → pad longest dist 22→27
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割する方式に該当する'
WHERE id = 'fa3dddbd-202d-4f32-98ee-1c853ac24554';

-- Q-b2493b60: 次のシステム障害対応の文脈で、スラッシングの説明として正しいものはどれか。

実
-- correct=27, dist=[18,15,14] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度が低下する現象として知られている手法である'
WHERE id = '1543b1f5-d48c-46e0-8728-221c17a8a25c';

-- Q-eab1ad8c: 次のプロセス管理の状況で、プロセスとスレッドの違いとして正しいものはどれか。


-- correct=23, dist=[17,16,15] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'スレッドは独立したメモリ空間を持つことが主な特徴である'
WHERE id = '7de1ac36-8514-4654-91b0-4a817bc240f7';

-- Q-5b49bc96: 次のメモリ管理の観点から、デッドロックの説明として正しいものはどれか。

前提条
-- correct=27, dist=[19,17,15] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'メモリが不足してプロセスが停止する状態に該当する処理方式である'
WHERE id = 'e27c83f6-eed8-478c-b9e3-8a0c14ef0bce';

-- Q-d8d1d7ce: 次のシステム障害対応の文脈で、デッドロックの説明として正しいものはどれか。

実
-- correct=25, dist=[24,16,13] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = 'ネットワーク切断でトランザクションが中断した状態として知られている手法である'
WHERE id = '991cfc09-f882-40f5-84df-fd8ec83d6752';

-- Q-7475d413: 次のメモリ管理の観点から、ラウンドロビン方式のプロセススケジューリングの説明とし
-- correct=25, dist=[21,19,18] → pad longest dist 21→26
UPDATE quiz_question_options SET option_text = '最も優先度の高いプロセスを常に実行する方式に該当する'
WHERE id = '9539ea2d-1fae-4b71-84a1-0ee7947662b6';

-- Q-48da5143: 次のOS運用場面を想定するとき、標本化（サンプリング）の説明として正しいものはど
-- correct=18, dist=[15,14,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = 'ファイルをバックアップすることが求められている'
WHERE id = 'e0722ea8-0f5d-481d-b631-4688d4335a32';

-- Q-13137e5c: 次のシステム障害対応の文脈で、セマフォの説明として正しいものはどれか。

前提条
-- correct=26, dist=[18,18,15] → pad longest dist 18→30
UPDATE quiz_question_options SET option_text = 'プロセス間でデータを送受信する仕組みに該当する処理方式である'
WHERE id = 'c4dab06a-af86-4494-bf36-a3e38ea893da';

-- Q-57f436e6: 次のプロセス管理の状況で、ファイルシステムの役割として正しいものはどれか。

基
-- correct=18, dist=[16,16,15] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'CPUの処理速度を管理する仕組みとして知られている手法である'
WHERE id = '064d829a-808d-4db0-baf3-44a5f194668e';

-- Q-2e60a796: 次のメモリ管理の観点から、プロセスとスレッドの違いとして正しいものはどれか。


-- correct=23, dist=[22,17,15] → pad longest dist 22→35
UPDATE quiz_question_options SET option_text = 'スレッドはプロセスより多くのメモリを消費することを目的とした手法である'
WHERE id = '7c0dd819-67ce-4016-90b9-599da4c07563';

-- Q-f2d0894d: 次のシステム障害対応の文脈で、ファイルシステムの主な役割として正しいものはどれか
-- correct=21, dist=[15,12,11] → pad longest dist 15→24
UPDATE quiz_question_options SET option_text = 'CPUのタスクスケジューリングであるとされている'
WHERE id = '75bbf27f-09ab-4444-a7e1-3953dc8e8352';

-- Q-4cc89bb1: 次のOS運用場面を想定するとき、OSのカーネルの役割として最も適切なものはどれか
-- correct=28, dist=[18,14,13] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = 'アプリケーションのインストールを行うことを目的とした手法である'
WHERE id = '5c62fd30-a964-4357-b4fb-f2a359338acc';

-- Q-e8a9f9ec: 次のプロセス管理の状況で、ページングの説明として正しいものはどれか。

前提条件
-- correct=35, dist=[20,17,16] → pad longest dist 20→33
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割するとして一般的に知られている'
WHERE id = 'd6a5f6e7-bdf1-4455-b8b9-620258f256ff';

-- Q-32974308: 次のメモリ管理の観点から、仮想メモリの利点として正しいものはどれか。

基本事項
-- correct=22, dist=[17,15,13] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'プログラムの実行速度が必ず向上することが主な目的である'
WHERE id = 'daf5cea1-a082-4213-a331-965c244108e0';

-- Q-e78252a0: 次のOS運用場面を想定するとき、ラウンドロビンスケジューリングの説明として正しい
-- correct=25, dist=[22,20,18] → pad longest dist 22→30
UPDATE quiz_question_options SET option_text = '先に到着したプロセスが完了するまで実行される手法のことである'
WHERE id = 'a7b3ede8-91e1-4f82-aaf5-a248aef51921';

-- Q-0c6e768c: 次のシステム障害対応の文脈で、コンテキストスイッチの説明として正しいものはどれか
-- correct=36, dist=[25,23,18] → pad longest dist 25→38
UPDATE quiz_question_options SET option_text = 'ユーザーモードからカーネルモードへの遷移のみを指すことを目的とした手法である'
WHERE id = 'f1d80026-31d6-4320-ace1-7b2f682ec2e6';

-- Q-0583be8c: 次のプロセス管理の状況で、ページフォルトが発生する状況として正しいものはどれか。
-- correct=24, dist=[23,19,16] → pad longest dist 23→37
UPDATE quiz_question_options SET option_text = 'CPUキャッシュにデータが見つからなかった場合として知られている手法である'
WHERE id = '29971fb7-b3d2-4c60-9b6c-8af7f2062d5d';

-- Q-717437e6: 次のメモリ管理の観点から、仮想記憶方式におけるページテーブルの役割として正しいも [MANUAL: correct=shortest]
-- correct=27, dist=[31,28,28]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-a3981fa3: 次のOS運用場面を想定するとき、ページ置換アルゴリズムに関する説明として正しいも [ratio fix]
-- ratio=1.52, min=25→35, max=38
UPDATE quiz_question_options SET option_text = 'LRUとFIFOは常に同じページフォールト率を示すことが主な特徴である'
WHERE id = '5b47a05d-8b50-4600-828e-92389e0630ce';

-- Q-3400fa7c: 次のシステム障害対応の文脈で、ページングの説明として正しいものはどれか。

実装
-- correct=24, dist=[22,16,14] → pad longest dist 22→27
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割する方式に該当する'
WHERE id = '12dcf216-7292-4202-854f-52a03b4636fa';

-- Q-0820c5d2: 次のシステム障害対応の文脈で、スラッシングの説明として正しいものはどれか。

前
-- correct=27, dist=[18,15,14] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度が低下する現象として知られている手法である'
WHERE id = '92a4fbe7-8f86-477e-a617-d957f9902bbc';

-- Q-8d5884d3: 次のメモリ管理の観点から、プロセスとスレッドの違いとして正しいものはどれか。


-- correct=23, dist=[17,16,15] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'スレッドは独立したメモリ空間を持つことが主な特徴である'
WHERE id = '9ef31b82-34a9-4fe8-a1ee-3c9e7afa6edb';

-- Q-0ec50f8d: 次のメモリ管理の観点から、デッドロックの説明として正しいものはどれか。

実装や
-- correct=27, dist=[19,17,15] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'メモリが不足してプロセスが停止する状態に該当する処理方式である'
WHERE id = '1623f905-4f78-4f18-9ab4-a90cf19867c7';

-- Q-4aa02e9e: 次のシステム障害対応の文脈で、デッドロックの説明として正しいものはどれか。

基
-- correct=25, dist=[24,16,13] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = 'ネットワーク切断でトランザクションが中断した状態として知られている手法である'
WHERE id = '900b6395-d0c3-488a-ba80-45602bd18576';

-- Q-005aba9a: 次のメモリ管理の観点から、標本化（サンプリング）の説明として正しいものはどれか。
-- correct=18, dist=[15,14,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = 'ファイルをバックアップすることが求められている'
WHERE id = 'da75cf89-3617-4bc6-9156-3a9492dc17af';

-- Q-a705aa6a: 次のOS運用場面を想定するとき、ラウンドロビン方式のプロセススケジューリングの説
-- correct=25, dist=[21,19,18] → pad longest dist 21→26
UPDATE quiz_question_options SET option_text = '最も優先度の高いプロセスを常に実行する方式に該当する'
WHERE id = '58974507-9b09-4dfa-95a2-1c8c92899544';

-- Q-9e11940d: 次のプロセス管理の状況で、ファイルシステムの役割として正しいものはどれか。

実
-- correct=18, dist=[16,16,15] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'CPUの処理速度を管理する仕組みとして知られている手法である'
WHERE id = '434c4d41-5e4a-46f6-9cd5-84704ffb3e67';

-- Q-b877b21a: 次のプロセス管理の状況で、セマフォの説明として正しいものはどれか。

前提条件を
-- correct=26, dist=[18,18,15] → pad longest dist 18→30
UPDATE quiz_question_options SET option_text = 'プロセス間でデータを送受信する仕組みに該当する処理方式である'
WHERE id = '6e44230c-f73a-4919-81f7-c09f9b73037f';

-- Q-5f62686b: 次のメモリ管理の観点から、プロセスとスレッドの違いとして正しいものはどれか。


-- correct=23, dist=[22,17,15] → pad longest dist 22→35
UPDATE quiz_question_options SET option_text = 'スレッドはプロセスより多くのメモリを消費することを目的とした手法である'
WHERE id = 'f85b1778-506b-4efd-9dc1-259d5a73aa48';

-- Q-1837f2ca: 次のシステム障害対応の文脈で、ファイルシステムの主な役割として正しいものはどれか
-- correct=21, dist=[15,12,11] → pad longest dist 15→24
UPDATE quiz_question_options SET option_text = 'CPUのタスクスケジューリングであるとされている'
WHERE id = '8ad5ce54-364e-4d11-a80a-0e972784f357';

-- Q-acb89fe0: 次のOS運用場面を想定するとき、OSのカーネルの役割として最も適切なものはどれか
-- correct=28, dist=[18,14,13] → pad longest dist 18→31
UPDATE quiz_question_options SET option_text = 'アプリケーションのインストールを行うことを目的とした手法である'
WHERE id = '3bfcd0d0-f1a5-4089-beb9-33696d66a814';

-- Q-afbb8816: 次のプロセス管理の状況で、ページングの説明として正しいものはどれか。

実装や運
-- correct=35, dist=[20,17,16] → pad longest dist 20→33
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割するとして一般的に知られている'
WHERE id = '9a9fd929-f8bd-4c8a-b909-142e7663e10c';

-- Q-d6a54cf6: 次のメモリ管理の観点から、仮想メモリの利点として正しいものはどれか。

前提条件
-- correct=22, dist=[17,15,13] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'プログラムの実行速度が必ず向上することが主な目的である'
WHERE id = '7fdd1afd-0498-4f86-a3e1-ca1678181b82';

-- Q-865e1a29: 次のOS運用場面を想定するとき、ラウンドロビンスケジューリングの説明として正しい
-- correct=25, dist=[22,20,18] → pad longest dist 22→30
UPDATE quiz_question_options SET option_text = '先に到着したプロセスが完了するまで実行される手法のことである'
WHERE id = '55b407e4-c000-4a44-b9d8-3d0c06d7e77a';

-- Q-83d9c05f: 次のシステム障害対応の文脈で、コンテキストスイッチの説明として正しいものはどれか
-- correct=36, dist=[25,23,18] → pad longest dist 25→38
UPDATE quiz_question_options SET option_text = 'ユーザーモードからカーネルモードへの遷移のみを指すことを目的とした手法である'
WHERE id = 'e6256ea3-29c2-4317-98fb-8f71f9c97bce';

-- Q-56570bcf: 次のプロセス管理の状況で、ページフォルトが発生する状況として正しいものはどれか。
-- correct=24, dist=[23,19,16] → pad longest dist 23→37
UPDATE quiz_question_options SET option_text = 'CPUキャッシュにデータが見つからなかった場合として知られている手法である'
WHERE id = '1a1e0c63-0bca-4a2a-b2b7-89f082e57583';

-- Q-0042d412: 次のメモリ管理の観点から、仮想記憶方式におけるページテーブルの役割として正しいも [MANUAL: correct=shortest]
-- correct=27, dist=[31,28,28]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-bc032077: 次のOS運用場面を想定するとき、ページ置換アルゴリズムに関する説明として正しいも [ratio fix]
-- ratio=1.52, min=25→35, max=38
UPDATE quiz_question_options SET option_text = 'LRUとFIFOは常に同じページフォールト率を示すことが主な特徴である'
WHERE id = '50388825-4828-42e3-85c1-afafdce2adf9';

-- Q-641c8b1f: 次のプロセス管理の状況で、メモリ管理方式であるページングとセグメンテーションの比
-- correct=62, dist=[46,38,31] → pad longest dist 46→59
UPDATE quiz_question_options SET option_text = 'セグメンテーションは固定サイズで外部フラグメンテーションがなく、ページングは可変サイズであるとして一般的に知られている'
WHERE id = '3ae1004e-3113-4150-a973-812360da88ba';

-- Q-e2715cf1: 次のメモリ管理の観点から、プロセススケジューリングにおける優先度ベース方式とラウ [ratio fix]
-- ratio=1.60, min=25→37, max=40
UPDATE quiz_question_options SET option_text = '優先度ベースは常にラウンドロビンより応答時間が短いに該当する処理方式である'
WHERE id = '63fcad02-a233-44c9-933a-35b57b739f91';

-- Q-0004dc27: 次のOS運用場面を想定するとき、UNIX系ファイルシステムにおけるi-node（
-- correct=39, dist=[31,28,27] → pad longest dist 31→44
UPDATE quiz_question_options SET option_text = 'ファイル名とファイルの内容データを直接格納するデータ構造であることを目的とした手法である'
WHERE id = 'a967d6be-1b62-46c9-b4ac-aab6b85e013f';

-- Q-4fd2f136: 次のシステム障害対応の文脈で、ページフォールトが発生するのはどのようなときか。

-- correct=18, dist=[18,15,12] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'CPUのクロック周波数が低下したときとして知られている手法である'
WHERE id = '869a82cd-d4d2-4882-a85f-6bca5f959d3f';

-- Q-b5a8013f: 次のプロセス管理の状況で、ページングの説明として正しいものはどれか。

実装や運
-- correct=24, dist=[22,16,14] → pad longest dist 22→27
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割する方式に該当する'
WHERE id = '119253cf-666e-48a9-b966-262388ba9319';

-- Q-1289e6b0: 次のメモリ管理の観点から、スラッシングの説明として正しいものはどれか。

前提条
-- correct=27, dist=[18,15,14] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度が低下する現象として知られている手法である'
WHERE id = '6baf7f56-df9c-40dc-a692-2b4ac4cf1e07';

-- Q-9db1a5ae: OS運用ケース01: ページングの説明として正しいものはどれか。

基本事項とし
-- correct=24, dist=[22,16,14] → pad longest dist 22→27
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割する方式に該当する'
WHERE id = '81a5c89f-6449-4e81-bebc-3e0377b768b5';

-- Q-8c21cb95: OS運用ケース02: スラッシングの説明として正しいものはどれか。

原因と結果
-- correct=27, dist=[18,15,14] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度が低下する現象として知られている手法である'
WHERE id = '5ad987fd-1c1d-4c50-8a79-4deba0934e7d';

-- Q-5debec1c: OS運用ケース03: プロセスとスレッドの違いとして正しいものはどれか。

実運
-- correct=23, dist=[17,16,15] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'スレッドは独立したメモリ空間を持つことが主な特徴である'
WHERE id = '77f4c45d-e002-4f70-889b-2ec68050abae';

-- Q-e71d734d: OS運用ケース04: デッドロックの説明として正しいものはどれか。

基本事項と
-- correct=27, dist=[19,17,15] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'メモリが不足してプロセスが停止する状態に該当する処理方式である'
WHERE id = '4db22d56-ab32-4709-8e28-ed255e6d4b61';

-- Q-9dd7bccd: OS運用ケース06: デッドロックの説明として正しいものはどれか。

実運用上の
-- correct=25, dist=[24,16,13] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = 'ネットワーク切断でトランザクションが中断した状態として知られている手法である'
WHERE id = '64577631-dc68-4531-9a9b-e6dfe25522d7';

-- Q-eeb7ee45: OS運用ケース08: 次のプロセス管理の状況で、デッドロックの説明として正しいも
-- correct=25, dist=[24,16,13] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = 'ネットワーク切断でトランザクションが中断した状態として知られている手法である'
WHERE id = '1283e827-81e2-4c8d-ac54-a899291e53dd';

-- Q-37279bbe: OS運용ケース09: 次のシステム障害対応の文脈で、デッドロックの説明として正し
-- correct=25, dist=[24,16,13] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = 'ネットワーク切断でトランザクションが中断した状態として知られている手法である'
WHERE id = '8bbd3b1b-4d1c-4eb0-9cf0-8c106391d5dc';

-- Q-416eb828: OS運용ケース10: 次のシステム障害対応の文脈で、デッドロックの説明として正し
-- correct=25, dist=[24,16,13] → pad longest dist 24→38
UPDATE quiz_question_options SET option_text = 'ネットワーク切断でトランザクションが中断した状態として知られている手法である'
WHERE id = 'b3184ee3-7311-414b-a3d3-f0eb085bc765';

-- Q-a56bd468: OS運용ケース11: ラウンドロビン方式のプロセススケジューリングの説明として正
-- correct=25, dist=[21,19,18] → pad longest dist 21→26
UPDATE quiz_question_options SET option_text = '最も優先度の高いプロセスを常に実行する方式に該当する'
WHERE id = 'e35b5f01-4262-41f3-9c57-290e6aecec4f';

-- Q-21bfd1e6: OS運용ケース12: 標本化（サンプリング）の説明として正しいものはどれか。


-- correct=18, dist=[15,14,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = 'ファイルをバックアップすることが求められている'
WHERE id = '276e4424-de58-473c-89a5-7e66fe79abe7';

-- Q-5c4e9b76: OS運용ケース13: 次のメモリ管理の観点から、標本化（サンプリング）の説明とし
-- correct=18, dist=[15,14,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = 'ファイルをバックアップすることが求められている'
WHERE id = 'f2fdf6fa-411f-4d53-aaa8-57996525febe';

-- Q-e54f82dc: OS運용ケース14: 次のOS運用場面を想定するとき、標本化（サンプリング）の説
-- correct=18, dist=[15,14,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = 'ファイルをバックアップすることが求められている'
WHERE id = '503d5d0e-fa62-46d7-aeeb-bb78e312e838';

-- Q-dfeb3ff8: OS運용ケース15: 次のメモリ管理の観点から、標本化（サンプリング）の説明とし
-- correct=18, dist=[15,14,11] → pad longest dist 15→23
UPDATE quiz_question_options SET option_text = 'ファイルをバックアップすることが求められている'
WHERE id = '596f69d5-51df-497d-8306-7b1378fe0292';

-- Q-af183be1: OS運用ケース16: ファイルシステムの役割として正しいものはどれか。

基本事
-- correct=18, dist=[16,16,15] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'CPUの処理速度を管理する仕組みとして知られている手法である'
WHERE id = '2f25c2d6-5704-4c42-965a-e326593a74b2';

-- Q-2e3a3801: OS運用ケース17: セマフォの説明として正しいものはどれか。

原因と結果の関
-- correct=26, dist=[18,18,15] → pad longest dist 18→30
UPDATE quiz_question_options SET option_text = 'プロセス間でデータを送受信する仕組みに該当する処理方式である'
WHERE id = '382a6cac-e176-4a36-acad-d375a0c7ad43';

-- Q-36c6de85: OS運用ケース18: 次のシステム障害対応の文脈で、ファイルシステムの役割として
-- correct=18, dist=[16,16,15] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'CPUの処理速度を管理する仕組みとして知られている手法である'
WHERE id = '67e34643-c6cc-4083-81ee-97917ad16100';

-- Q-438a8f33: OS運用ケース19: 次のOS運用場面を想定するとき、ページングの説明として正し
-- correct=24, dist=[22,16,14] → pad longest dist 22→27
UPDATE quiz_question_options SET option_text = 'メモリを可変サイズのセグメントに分割する方式に該当する'
WHERE id = '7e290048-7780-4a1c-b7a1-4b9416df5547';

-- Q-9965ead8: OS運用ケース21: 次のシステム障害対応の文脈で、スラッシングの説明として正し
-- correct=27, dist=[18,15,14] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'ネットワークの通信速度が低下する現象として知られている手法である'
WHERE id = '64d0888c-6fe6-4253-8999-2addcf1fb453';

-- Q-0e660fa1: OS運用ケース22: 次のプロセス管理の状況で、ファイルシステムの役割として正し
-- correct=18, dist=[16,16,15] → pad longest dist 16→30
UPDATE quiz_question_options SET option_text = 'CPUの処理速度を管理する仕組みとして知られている手法である'
WHERE id = 'd11fadb1-c2db-4c2e-b5c4-732b40aa75fa';

-- Q-e9412329: OS運用ケース24: 次のプロセス管理の状況で、プロセスとスレッドの違いとして正
-- correct=23, dist=[17,16,15] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'スレッドは独立したメモリ空間を持つことが主な特徴である'
WHERE id = '0d427a28-7ef0-4237-8de2-37afbdc31cff';

COMMIT;