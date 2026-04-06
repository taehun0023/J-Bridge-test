-- 00163_fix_cs_computer_architecture_b5a.sql
-- CS computer_architecture B5-a 길이편향 수정
-- 생성일: 2026-04-06
-- CONFIRMED: 59건 / DISMISSED: 1건 / UPDATE: 59건
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 패딩으로 정답=최장 패턴 해소.

BEGIN;

-- Q-1f3c5959: パイプライン処理の説明として正しいものはどれか。
-- correct=22, dist=[18,18,16] → pad longest dist 18→23
UPDATE quiz_question_options SET option_text = '複数のCPUで同じ命令を実行する手法に該当する'
WHERE id = '2323098b-8584-401a-99b5-02861df66bcc';

-- Q-3ad0845d: クラウドコンピューティングの説明として正しいものはどれか。
-- correct=25, dist=[18,17,17] → pad longest dist 18→30
UPDATE quiz_question_options SET option_text = 'パソコン内のデータを自動保存する機能に該当する処理方式である'
WHERE id = 'a68d56f9-e579-41a8-9681-0f8684866cf3';

-- Q-8ffce741: 仮想化技術の説明として正しいものはどれか。
-- correct=24, dist=[19,15,15] → pad longest dist 19→28
UPDATE quiz_question_options SET option_text = 'ネットワークを仮想的に分離する技術のみであるとされている'
WHERE id = '9b90e201-d29f-4d5a-91ac-3f1855ce5aee';

-- Q-bbbdc219: USBの説明として正しいものはどれか。
-- correct=21, dist=[14,12,8] → pad longest dist 14→26
UPDATE quiz_question_options SET option_text = 'ネットワーク通信のプロトコルに該当する処理方式である'
WHERE id = '5a5bad4e-3772-479e-95d7-41c690bed13f';

-- Q-04687441: デバイスドライバの説明として正しいものはどれか。 [ratio fix]
-- ratio=1.47, min=15→29, max=22
UPDATE quiz_question_options SET option_text = 'ウイルスを検出するソフトウェアとして知られている手法である'
WHERE id = 'd088c0c6-f82f-49d0-bf6a-47fda7476720';

-- Q-af02fa89: SSDの特徴としてHDDと比較して正しいものはどれか。
-- correct=19, dist=[16,13,13] → pad longest dist 16→24
UPDATE quiz_question_options SET option_text = 'データの書き換え回数に制限がないことが前提である'
WHERE id = '1d20994f-893d-4736-b95f-eb176b76de01';

-- Q-aec67b25: ROMの特徴として正しいものはどれか。
-- correct=23, dist=[15,14,13] → pad longest dist 15→28
UPDATE quiz_question_options SET option_text = 'データの書き換えが高速にできることを目的とした手法である'
WHERE id = '6b952276-731e-489e-abb5-68a889469ac4';

-- Q-6b959763: OSの役割として正しいものはどれか。
-- correct=23, dist=[12,9,9] → pad longest dist 12→25
UPDATE quiz_question_options SET option_text = 'インターネットに接続することを目的とした手法である'
WHERE id = '24a391bb-f330-4cad-a147-bc79af4456af';

-- Q-0e6d3ea6: BIOSの役割として正しいものはどれか。
-- correct=23, dist=[16,13,13] → pad longest dist 16→26
UPDATE quiz_question_options SET option_text = 'アプリケーションソフトを管理することが主な目的である'
WHERE id = '4c9b9434-a9bd-4864-89b8-d53b6d5f0091';

-- Q-cf2ac45b: IoT機器の説明として正しいものはどれか。
-- correct=25, dist=[13,13,13] → pad longest dist 13→27
UPDATE quiz_question_options SET option_text = '高性能な計算処理専用の機器として知られている手法である'
WHERE id = 'b13d8a85-4ec0-4d5f-8678-446512b1c051';

-- Q-ebf6ea9e: OSの機能として最も適切なものはどれか。
-- correct=25, dist=[16,13,11] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = '表計算やワープロの機能を提供することを目的とした手法である'
WHERE id = '66669cd8-3d95-4144-987f-67436274d043';

-- Q-3d87ed0e: メモリインターリーブの目的として正しいものはどれか。
-- correct=26, dist=[13,12,10] → pad longest dist 13→27
UPDATE quiz_question_options SET option_text = 'メモリの消費電力を削減するための手法として知られている'
WHERE id = '3ea07393-1c37-4924-89d8-369662a05c41';

-- Q-64e82a5a: RAID5の特徴として正しいものはどれか。
-- correct=21, dist=[20,17,16] → pad longest dist 20→33
UPDATE quiz_question_options SET option_text = 'データを2台のディスクにミラーリングすることを目的とした手法である'
WHERE id = '785e342d-d478-48e0-9be2-30dd5a0ee26a';

-- Q-db25d877: フォールトトレラントシステムの説明として正しいものはどれか。
-- correct=26, dist=[21,19,14] → pad longest dist 21→30
UPDATE quiz_question_options SET option_text = '故障時に自動的にシャットダウンするシステムであるとされている'
WHERE id = 'e0f302c5-31de-4174-bfa8-d83b56f74eed';

-- Q-055d36e7: RAID1（ミラーリング）の説明として正しいものはどれか。
-- correct=23, dist=[20,20,16] → pad longest dist 20→25
UPDATE quiz_question_options SET option_text = 'データをストライピングして高速化する方式に該当する'
WHERE id = '00336853-08e3-435e-9e5e-80a54a17524f';

-- Q-367178a2: キャッシュミスが起こりやすい状況はどれか。
-- correct=16, dist=[16,11,11] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = 'ディスプレイケーブルが抜けていることを目的とした手法である'
WHERE id = '2d147422-047f-430d-aae8-9647704fb9f2';

-- Q-0d54e583: RISC型プロセッサの特徴として正しいものはどれか。 [ratio fix]
-- ratio=1.45, min=11→24, max=16
UPDATE quiz_question_options SET option_text = '複雑な命令セットを持つことを目的とした手法である'
WHERE id = 'e5716ea9-9901-429c-b82a-11aa2dbf5533';

-- Q-0118cfb6: 割込みを最も適切に説明しているものはどれか。
-- correct=17, dist=[12,11,10] → pad longest dist 12→22
UPDATE quiz_question_options SET option_text = 'データベースのロック方式として分類されている'
WHERE id = 'e56cccc3-bfdf-4f63-a837-cd5503014b88';

-- Q-42b4a9c4: 補助記憶装置が主記憶装置と異なる点として適切なものはどれか。
-- correct=16, dist=[14,13,9] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'CPUキャッシュを置き換えることを目的とした手法である'
WHERE id = 'b67b2704-10f8-423b-9391-e0d0bd0cfcd5';

-- Q-7ddc89bb: RAMの主な役割はどれか。
-- correct=22, dist=[17,14,10] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'すべてのファイルを自動で暗号化することが主な目的である'
WHERE id = '4a48f3d1-fe52-4ad1-813d-f4ba1b654765';

-- Q-0faf579b: 補助記憶装置が主記憶装置と異なる点として適切なものはどれか。
-- correct=16, dist=[14,13,9] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'CPUキャッシュを置き換えることを目的とした手法である'
WHERE id = '05701cfa-32ec-4559-9b09-bb93c46ecbac';

-- Q-0fd26370: キャッシュミスが起こりやすい状況はどれか。
-- correct=16, dist=[16,11,11] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = 'ディスプレイケーブルが抜けていることを目的とした手法である'
WHERE id = '597ae23b-98ee-46fe-9baa-facdca923b30';

-- Q-6bc2b9bb: コンピュータ構成におけるバスとは何か。
-- correct=19, dist=[10,9,4] → pad longest dist 10→24
UPDATE quiz_question_options SET option_text = 'パスワード管理ソフトとして知られている手法である'
WHERE id = 'd3bedac1-55d7-4e73-8c0b-ec6ef8dc2874';

-- Q-27026b02: 命令実行の流れとして自然な順序はどれか。 [ratio fix]
-- ratio=1.31, min=13→27, max=17
UPDATE quiz_question_options SET option_text = '保存 → 印刷 → 暗号化として知られている手法である'
WHERE id = 'cfc7f73f-e478-49c1-b62b-6acef6351879';

-- Q-be051e26: I/O装置に対して割込みが有効な理由として適切なものはどれか。 [ratio fix]
-- ratio=2.38, min=8→18, max=19
UPDATE quiz_question_options SET option_text = 'OSを不要にすることが主な目的である'
WHERE id = '7cfd1fe5-19ee-4542-b399-99467e7fbc40';

-- Q-43231cac: 大きなファイルを読み込むときだけアプリが遅い場合、まず疑うべきものはどれか。
-- correct=21, dist=[12,11,10] → pad longest dist 12→26
UPDATE quiz_question_options SET option_text = 'HTTPメソッドの不一致として知られている手法である'
WHERE id = '95586784-4249-4618-8709-0cf5fc70279c';

-- Q-8745031e: ボトルネックの解釈として最も適切なものはどれか。
-- correct=18, dist=[17,11,7] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = 'ネットワーク名にだけ影響する不具合として知られている手法である'
WHERE id = '04a13337-e749-4722-b4a0-6eacb7759a63';

-- Q-bc82a4ed: クロック周波数が高いことから直接読み取れることはどれか。
-- correct=31, dist=[17,15,11] → pad longest dist 17→30
UPDATE quiz_question_options SET option_text = 'すべてのプログラムが1手順で終わるとして一般的に知られている'
WHERE id = '819a31a9-dbdf-4d0c-a956-dc4063c772ea';

-- Q-526c7b50: メモリ（主記憶装置）の説明として正しいものはどれか。
-- correct=20, dist=[14,12,11] → pad longest dist 14→23
UPDATE quiz_question_options SET option_text = 'データを永続的に保存する装置であるとされている'
WHERE id = '576b6cc8-12ef-4e8d-8205-0f30997371d2';

-- Q-8a255413: CPUの役割として正しいものはどれか。
-- correct=18, dist=[13,13,12] → pad longest dist 13→22
UPDATE quiz_question_options SET option_text = 'データを長期間保存する装置であるとされている'
WHERE id = '2d980e62-453a-423a-a792-5656b13a6ea9';

-- Q-eb8f1ffe: DMAの説明として正しいものはどれか。
-- correct=28, dist=[20,20,18] → pad longest dist 20→32
UPDATE quiz_question_options SET option_text = 'CPUがすべてのデータ転送を制御する方式の一種として知られている'
WHERE id = 'a551b354-1ce5-493f-bb33-b94bd69abe23';

-- Q-fe2f52de: SSDがHDDと比べて優れている点として正しいものはどれか。 [ratio fix]
-- ratio=1.27, min=11→25, max=14
UPDATE quiz_question_options SET option_text = '容量あたりの価格が安いとして知られている手法である'
WHERE id = 'b5b5442a-454b-41ff-a71d-6a5d82075d55';

-- Q-ca7fc87f: マルチタスクの説明として正しいものはどれか。 [ratio fix]
-- ratio=1.29, min=17→31, max=22
UPDATE quiz_question_options SET option_text = '複数のファイルを同時に保存する機能として知られている手法である'
WHERE id = '686f8dfc-33ba-4ccc-bd98-8a9b83f2d2cf';

-- Q-ac5c08fc: RAMの主な役割はどれか。
-- correct=22, dist=[17,14,10] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'すべてのファイルを自動で暗号化することが主な目的である'
WHERE id = 'ff58c530-1a59-45f2-ae6f-8881455aee9e';

-- Q-528374e8: 割込みを最も適切に説明しているものはどれか。
-- correct=17, dist=[12,11,10] → pad longest dist 12→22
UPDATE quiz_question_options SET option_text = 'データベースのロック方式として分類されている'
WHERE id = 'a6deaffa-3404-46b9-ad4f-0c75d4025ccb';

-- Q-151792e4: 割り込み処理の説明として正しいものはどれか。
-- correct=24, dist=[16,16,13] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = 'プログラムの実行を永久に停止することを目的とした手法である'
WHERE id = '5efe40f0-5e70-402e-a315-092929f2e239';

-- Q-24e4c27d: MIPS（Million Instructions Per Second）の説明
-- correct=25, dist=[15,14,13] → pad longest dist 15→29
UPDATE quiz_question_options SET option_text = 'ネットワークの帯域幅を表す指標として知られている手法である'
WHERE id = '163af8bc-26de-4606-ba7f-96c2adfc3ae4';

-- Q-21a5ccb3: クロック周波数の説明として正しいものはどれか。 [ratio fix]
-- ratio=1.45, min=11→25, max=16
UPDATE quiz_question_options SET option_text = 'メモリの容量を表す指標として知られている手法である'
WHERE id = 'cfe06cd0-df0a-4061-bfa1-09b604ff2443';

-- Q-90a027db: キャッシュメモリの目的として正しいものはどれか。
-- correct=17, dist=[14,12,11] → pad longest dist 14→22
UPDATE quiz_question_options SET option_text = 'ネットワーク通信を高速化する処理のことである'
WHERE id = '4fcab378-bd10-442a-b29c-ee68b6950185';

-- Q-3609487d: ハードディスク（HDD）の説明として正しいものはどれか。
-- correct=23, dist=[15,10,8] → pad longest dist 15→27
UPDATE quiz_question_options SET option_text = '半導体を使用した高速な記憶装置に該当する処理方式である'
WHERE id = 'd6469077-ab94-4e82-bbe0-0114aa6a614e';

-- Q-9d9fe33e: RAMの特徴として正しいものはどれか。
-- correct=20, dist=[16,16,14] → pad longest dist 16→24
UPDATE quiz_question_options SET option_text = '読み取り専用で書き換えができないことが前提である'
WHERE id = 'b37494a1-7562-42e9-add4-15efad0da7cb';

-- Q-1a5013b6: 仮想記憶の説明として正しいものはどれか。
-- correct=25, dist=[19,17,17] → pad longest dist 19→28
UPDATE quiz_question_options SET option_text = 'データを暗号化してメモリに格納する技術であるとされている'
WHERE id = 'f82eb144-9782-4bec-b8e8-919feeaefe93';

-- Q-095bfc34: アドレッシングモードの一つである間接アドレッシングの説明として正しいものはどれか
-- correct=27, dist=[23,19,15] → pad longest dist 23→28
UPDATE quiz_question_options SET option_text = 'プログラムカウンタからの相対位置で指定する方式に該当する'
WHERE id = 'd811f91f-b71b-4671-afa5-0a3482f824cf';

-- Q-a64176d4: マルチプロセッサシステムの利点として正しいものはどれか。 [ratio fix]
-- ratio=1.71, min=7→21, max=12
UPDATE quiz_question_options SET option_text = '消費電力の削減として知られている手法である'
WHERE id = '0eb941f5-57e8-4a15-8160-b1b9299ad6f1';

-- Q-925cc9a0: 次のCPU動作の文脈で、CPUの役割として正しいものはどれか。

基本事項として
-- correct=18, dist=[13,13,12] → pad longest dist 13→22
UPDATE quiz_question_options SET option_text = 'データを長期間保存する装置であるとされている'
WHERE id = 'ddca4f68-7692-49a0-ae15-14ed051dab83';

-- Q-061777ab: 次のハードウェア設計の場面で、CPUの役割として正しいものはどれか。

実装や運
-- correct=18, dist=[13,13,12] → pad longest dist 13→22
UPDATE quiz_question_options SET option_text = 'データを長期間保存する装置であるとされている'
WHERE id = '6ea9d484-f318-4d1c-aaf2-8e10bd7d753b';

-- Q-a88e0972: 次の性能評価の観点から、メモリ（主記憶装置）の説明として正しいものはどれか。


-- correct=20, dist=[14,12,11] → pad longest dist 14→23
UPDATE quiz_question_options SET option_text = 'データを永続的に保存する装置であるとされている'
WHERE id = 'ab85afad-a687-4c7d-8ccb-686256e38fae';

-- Q-cc8b55ae: 次の命令実行の状況で、キャッシュメモリの目的として正しいものはどれか。

実装や
-- correct=17, dist=[14,12,11] → pad longest dist 14→22
UPDATE quiz_question_options SET option_text = 'ネットワーク通信を高速化する処理のことである'
WHERE id = '1aa4039d-724d-457a-9378-b6ff93b6389f';

-- Q-bf3ee89d: 次のハードウェア設計の場面で、RAMの主な役割はどれか。

実装や運用上の含意ま
-- correct=22, dist=[17,14,10] → pad longest dist 17→27
UPDATE quiz_question_options SET option_text = 'すべてのファイルを自動で暗号化することが主な目的である'
WHERE id = '29f4570f-d956-4ba2-8b36-6ae536dfeef8';

-- Q-56d0713e: 次のCPU動作の文脈で、割り込み処理の説明として正しいものはどれか。

実装や運
-- correct=24, dist=[16,16,13] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = 'プログラムの実行を永久に停止することを目的とした手法である'
WHERE id = 'ab54b187-d727-4c11-bddb-d3043d73c063';

-- Q-d98206e2: 次の命令実行の状況で、ハードディスク（HDD）の説明として正しいものはどれか。

-- correct=23, dist=[15,10,8] → pad longest dist 15→27
UPDATE quiz_question_options SET option_text = '半導体を使用した高速な記憶装置に該当する処理方式である'
WHERE id = '12f4db0b-ab0c-45e8-8713-17959417a06a';

-- Q-a2512eac: 次のハードウェア設計の場面で、SSDの特徴としてHDDと比較して正しいものはどれ
-- correct=19, dist=[16,13,13] → pad longest dist 16→24
UPDATE quiz_question_options SET option_text = 'データの書き換え回数に制限がないことが前提である'
WHERE id = '5bbf101d-cc97-4389-aec9-5059937e7b8a';

-- Q-8e9791f8: 次のCPU動作の文脈で、割込みを最も適切に説明しているものはどれか。

基本事項
-- correct=17, dist=[12,11,10] → pad longest dist 12→22
UPDATE quiz_question_options SET option_text = 'データベースのロック方式として分類されている'
WHERE id = '3c6dd56c-8a5e-40fc-9530-b63d4633ec13';

-- Q-358b5a16: 次の性能評価の観点から、仮想記憶の説明として正しいものはどれか。

実装や運用上
-- correct=25, dist=[19,17,17] → pad longest dist 19→28
UPDATE quiz_question_options SET option_text = 'データを暗号化してメモリに格納する技術であるとされている'
WHERE id = 'eca971e0-d6c1-4f1d-89f6-e01717eccecb';

-- Q-b0725d3d: 次の命令実行の状況で、キャッシュミスが起こりやすい状況はどれか。

前提条件を踏
-- correct=16, dist=[16,11,11] → pad longest dist 16→29
UPDATE quiz_question_options SET option_text = 'ディスプレイケーブルが抜けていることを目的とした手法である'
WHERE id = 'b82faa6b-3fd6-4f45-97c7-b16afce56013';

-- Q-5a622ceb: 次のハードウェア設計の場面で、補助記憶装置が主記憶装置と異なる点として適切なもの
-- correct=16, dist=[14,13,9] → pad longest dist 14→27
UPDATE quiz_question_options SET option_text = 'CPUキャッシュを置き換えることを目的とした手法である'
WHERE id = 'e3d9fd20-79f0-4166-9d1f-9a1e1a4c2079';

-- Q-218d4061: 次のCPU動作の文脈で、CPUの役割として正しいものはどれか。

実装や運用上の
-- correct=18, dist=[13,13,12] → pad longest dist 13→22
UPDATE quiz_question_options SET option_text = 'データを長期間保存する装置であるとされている'
WHERE id = 'dd2b35b6-8eb5-4b21-8111-75d32a487e35';

-- Q-599ca96a: 次の性能評価の観点から、メモリ（主記憶装置）の説明として正しいものはどれか。


-- correct=20, dist=[14,12,11] → pad longest dist 14→23
UPDATE quiz_question_options SET option_text = 'データを永続的に保存する装置であるとされている'
WHERE id = '864ab6f4-f3a6-4a67-a783-668de96b8607';

-- Q-333865cd: 次のハードウェア設計の場面で、キャッシュメモリの目的として正しいものはどれか。

-- correct=17, dist=[14,12,11] → pad longest dist 14→22
UPDATE quiz_question_options SET option_text = 'ネットワーク通信を高速化する処理のことである'
WHERE id = '4041b217-9f46-4ea0-b1d5-a3360c4f784c';

COMMIT;