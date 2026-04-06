# CS security カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 113
**Rubric**: docs/exam_quality_rubric.md v2

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 4건    | 3.5% |
| Medium  | 100건    | 88.5% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 104 / 113 (92.0%)
**A2-exempt (필터링됨)**: 1건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|
| a0000005... | 35 | 16 | 45.7% | 8 | 22.9% | **FAIL** |
| a0000003... | 30 | 23 | 76.7% | 0 | 0.0% | **FAIL** |
| cc1af8e7... | 18 | 17 | 94.4% | 0 | 0.0% | **FAIL** |
| 4828dbf5... | 16 | 14 | 87.5% | 1 | 6.3% | **FAIL** |
| 40473700... | 2 | 2 | 100.0% | 0 | 0.0% | **FAIL** |
| 3714c842... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |
| 9cc6995f... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |

**B5-b 위반 퀴즈**: 7개 — 정답 길이 분포 재조정 필요

## High 우선순위 이슈

### Q-3d4a0758-eb97-4c37-ada8-4dbbb61cf404
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, A2]
- question_text: "公衆Wi-Fiの利用に関するルールとして正しいものはどれか。"
- options:
  1. "VPNを使えば利用可能" (11자)
  2. [정답] "公衆Wi-Fiの利用は禁止" (13자)
  3. "暗号化された公衆Wi-Fiなら利用可能" (19자)
  4. "緊急時のみ利用可能" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.11x (max=19, min=9)
  - **A2** (High): answer-leak bigram ratio = 75%
---
### Q-dfd05e8d-b3ad-41b0-a7fc-c49e096d3415
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: easy
- 클레임: 있음(1건)
- 위반 항목: [CLAIM]
- question_text: "重要な書類を保管するキャビネットに必要な管理はどれか。"
- options:
  1. "担当者名の表示" (7자)
  2. [정답] "施錠管理" (4자)
  3. "定期的な棚卸し" (7자)
  4. "部署名の表示" (6자)
- 자동감지 근거:
  - **CLAIM** (High): 1 claim(s): test
---
### Q-0c55e93c-5435-4179-9855-eb1bf7640f4c
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, A2]
- question_text: "重要な情報を業務遂行に必要な範囲を超えて複製することについて正しいものはどれか。"
- options:
  1. "バックアップ目的なら複製できる" (15자)
  2. [정답] "必要な範囲を超えて複製しない" (14자)
  3. "暗号化すれば自由に複製できる" (14자)
  4. "社内なら自由に複製できる" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.25x (max=15, min=12)
  - **A2** (High): answer-leak bigram ratio = 77%
---
### Q-e8d9ea22-9a9d-4887-85b4-8e7576382cee
- quiz_id: 64f2db3f-c67f-4d9c-8827-147d133838db
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [A2]
- question_text: "固定長のハッシュ値を生成し、元のデータに戻せない一方向性を持つ関数を何というか。"
- options:
  1. [정답] "ハッシュ関数" (6자)
  2. "暗号化関数" (5자)
  3. "圧縮関数" (4자)
  4. "認証関数" (4자)
- 자동감지 근거:
  - **A2** (High): answer-leak bigram ratio = 80%
---

## Medium 우선순위 이슈

### Q-e3a0d5f6-9b98-44ee-b00b-3a2e667dc7c6
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "重要な情報を識別するために最初に行うべきことは何か。"
- options:
  1. "外部からの不正アクセスを防ぐため、パスワードを設定する" (27자)
  2. [정답] "機密性に応じた秘密区分（極秘、関係者外秘等）を明示する" (27자)
  3. "データの漏洩リスクを低減するため、ファイルを暗号化して保管する" (31자)
  4. "責任の所在を明らかにするため、担当者名をファイルに記録する" (29자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (27 vs others 31,29)
---
### Q-b3272efb-6a2c-4962-83d4-8458a009a0b6
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "私用PC等の電子機器を作業場所に持ち込むことについて正しいものはどれか。"
- options:
  1. "上司に口頭で伝えれば自由に持ち込める" (18자)
  2. [정답] "許可されていない私用電子機器の持ち込みは禁止" (22자)
  3. "ウイルスチェック済みの機器なら持ち込める" (20자)
  4. "業務に使わなければ私用であっても持ち込んでよい" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.28x (max=23, min=18)
---
### Q-32300579-527f-4f11-9dca-628e16134cd2
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "AIシステムのプロンプトに入力してはいけない情報はどれか。"
- options:
  1. "一般的なプログラミングの質問" (14자)
  2. "公開されている技術ドキュメント" (15자)
  3. [정답] "当社の秘密情報や個人情報" (12자)
  4. "公開情報の翻訳依頼" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.67x (max=15, min=9)
---
### Q-896f9b06-546d-4814-b4f8-3c0da9de0f34
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "重要な情報をメールで送信する際の正しい方法はどれか。"
- options:
  1. "メール本文に直接記載する" (12자)
  2. [정답] "暗号化またはパスワード保護したファイルを添付する" (24자)
  3. "HTML形式で装飾して送信する" (15자)
  4. "CCに上司を入れれば本文に書いてよい" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=24, min=12)
  - **B5-a** (Medium): correct is longest (24 vs others 12,15,18)
---
### Q-4de43b00-ae18-4d50-95d0-f5d3e78309cb
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "重要な情報を持ち出す場合に必要な手続きはどれか。"
- options:
  1. "同僚に伝えれば持ち出せる" (12자)
  2. [정답] "上長の許可を得て台帳等で管理する" (16자)
  3. "翌日に返却すれば自由に持ち出せる" (16자)
  4. "メールで報告すれば持ち出せる" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.33x (max=16, min=12)
  - **B5-a** (Medium): correct is longest (16 vs others 12,14)
---
### Q-3a949e0b-98de-42f4-9bcc-08786b8ce368
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "PC等の電子機器に重要な情報を格納する場合に必要な措置はどれか。"
- options:
  1. "ファイル名を分かりにくくする" (14자)
  2. [정답] "暗号化またはパスワードを付加する" (16자)
  3. "隠しフォルダに保存する" (11자)
  4. "アクセス権限を自分のみにする" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
  - **B5-a** (Medium): correct is longest (16 vs others 14,11,14)
---
### Q-d3bd93c4-712f-425c-9d16-81268f64cd20
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "業務で使用するデバイスのローカルディスクに関するルールはどれか。"
- options:
  1. "暗号化すればローカルに保管してよい" (17자)
  2. [정답] "ローカルディスクにデータを保管しない" (18자)
  3. "一時的な保管は問題ない" (11자)
  4. "バックアップがあればローカルに保管可能" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=19, min=11)
---
### Q-056634a9-61dc-453e-997a-489743dbe005
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, A2-exempt]
- question_text: "メールのプレビューウィンドウ機能について正しいものはどれか。"
- options:
  1. "効率化のため積極的に利用する" (14자)
  2. [정답] "プレビューウィンドウ機能は利用しない" (18자)
  3. "信頼できる送信者のメールのみ利用する" (18자)
  4. "テキスト形式のメールのみ利用可能" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=18, min=14)
  - **B5-a** (Medium): correct is longest (18 vs others 14,16)
  - **A2-exempt** (Info): exempt (機能), bigram overlap 65%
---
### Q-6c9fdaf2-54a6-4bc7-8994-f351c700c304
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "メールの形式として推奨されるものはどれか。"
- options:
  1. "HTML形式（装飾可能）" (12자)
  2. [정답] "テキスト形式" (6자)
  3. "リッチテキスト形式" (9자)
  4. "送信先に合わせて自由に選択" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.17x (max=13, min=6)
  - **B5-a** (Medium): correct is shortest (6 vs others 12,9,13)
---
### Q-41baa4cb-b800-45cc-b0db-651e4255f0d4
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "受信したメールの添付ファイルに対する正しい対応はどれか。"
- options:
  1. "知り合いからのメールなら安全なのですぐに開く" (22자)
  2. [정답] "ウイルスチェックをかけてから開く" (16자)
  3. "ファイル名が正しければそのまま実行する" (19자)
  4. "プレビューで内容を確認してから開く" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.38x (max=22, min=16)
  - **B5-a** (Medium): correct is shortest (16 vs others 22,19,17)
---
### Q-408cfd99-db0b-4179-843f-83b654ef071f
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "重要な情報が入ったPCを廃棄する際の正しい手順はどれか。"
- options:
  1. "ファイルを削除してからゴミに出す" (16자)
  2. "初期化してから中古として売却する" (16자)
  3. [정답] "許可を得てデータ消去ツールまたは物理的破壊で廃棄し、廃棄証明書を取得する" (36자)
  4. "ハードディスクを取り出してから本体を廃棄する" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.25x (max=36, min=16)
  - **B5-a** (Medium): correct is longest (36 vs others 16,16,22)
---
### Q-4bcd0bb9-f1ff-4aef-bcde-8bcceff362cf
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "重要な情報を発送する際に守るべきルールとして正しいものはどれか。"
- options:
  1. "普通郵便で速やかに発送する" (13자)
  2. [정답] "配達記録が残る手段を使い、宛名と物品を複数人で確認する" (27자)
  3. "受取人に発送を事前連絡すれば普通郵便でよい" (21자)
  4. "電子データはメール添付で発送する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.08x (max=27, min=13)
  - **B5-a** (Medium): correct is longest (27 vs others 13,21,16)
---
### Q-50264220-8421-47e0-9124-ee0258b94f72
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "電車内で重要な情報の入ったバッグの取り扱いとして正しいものはどれか。"
- options:
  1. "網棚に置いて席に座る" (10자)
  2. "チャックを閉めて足元に置く" (13자)
  3. [정답] "バッグから手を離さない（網棚に置かない）" (20자)
  4. "隣の席に置いて見張る" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=20, min=10)
  - **B5-a** (Medium): correct is longest (20 vs others 10,13,10)
---
### Q-c38f5b95-0e5d-4a09-bda6-309f19a835bb
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "会社が指定していないAIシステムの業務利用について正しいものはどれか。"
- options:
  1. "個人情報を入力しなければ使ってよい" (17자)
  2. "無料のAIサービスなら業務利用可能" (17자)
  3. [정답] "会社が指定したAI以外は業務で使用してはならない" (24자)
  4. "上司の許可があれば使用可能" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.85x (max=24, min=13)
  - **B5-a** (Medium): correct is longest (24 vs others 17,17,13)
---
### Q-e701c690-e4a1-4bf8-b7e3-f07e0c9fa75c
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "AIシステムの出力結果を利用する際に確認すべき事項はどれか。"
- options:
  1. "出力されたコードの実行速度" (13자)
  2. [정답] "著作権・商標権等の権利侵害の有無と内容の正確性" (23자)
  3. "AIモデルのバージョン情報" (13자)
  4. "出力の文字数と品質スコア" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=23, min=12)
  - **B5-a** (Medium): correct is longest (23 vs others 13,13,12)
---
### Q-a11c2464-5aee-4486-8fd6-e6e2c7d9253e
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "情報インフラの「不正使用」に該当する行為はどれか。"
- options:
  1. "業務メールの送受信" (9자)
  2. [정답] "機密情報を第三者に漏洩する行為" (15자)
  3. "業務用ソフトウェアのインストール" (16자)
  4. "社内ポータルの閲覧" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.78x (max=16, min=9)
---
### Q-772974b9-6291-4dbd-be15-1da5853e3d60
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "お客様より貸与されていた資産（身分証、PC等）の取り扱いとして正しいものはどれか。"
- options:
  1. "契約終了後に郵送で返却する" (13자)
  2. [정답] "確実に返却する" (7자)
  3. "データを消去すれば返却不要" (13자)
  4. "次のプロジェクトでも使用してよい" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.29x (max=16, min=7)
  - **B5-a** (Medium): correct is shortest (7 vs others 13,13,16)
---
### Q-d89f3f87-bf82-46f1-bb07-be7ceeff82c1
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "業務遂行上、情報を持ち帰る必要がある場合の正しい手順はどれか。"
- options:
  1. "翌朝までに返却すれば持ち帰ってよい" (17자)
  2. [정답] "事前に責任者に届出、了解を得てから実行する" (21자)
  3. "暗号化すれば自由に持ち帰れる" (14자)
  4. "業務上必要なら自己判断で持ち帰れる" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=21, min=14)
  - **B5-a** (Medium): correct is longest (21 vs others 17,14,17)
---
### Q-015424a4-9239-4674-9b6a-040f82e3339e
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "指定されたメール・ブラウザ以外のソフトウェアの使用について正しいものはどれか。"
- options:
  1. "業務効率が上がるなら使用してよい" (16자)
  2. [정답] "指定ソフトウェア以外のインフラ使用は禁止" (20자)
  3. "オープンソースなら問題ない" (13자)
  4. "ウイルスチェック済みなら使用可能" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.54x (max=20, min=13)
  - **B5-a** (Medium): correct is longest (20 vs others 16,13,16)
---
### Q-cf1bef42-43a9-40a8-ab12-d10914cebd81
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "電子データを記憶媒体に保管して発送する場合に必要な措置はどれか。"
- options:
  1. "速達で送れば暗号化は不要" (12자)
  2. [정답] "暗号化またはパスワードを付加する" (16자)
  3. "配達記録だけ残せばよい" (11자)
  4. "受取人にパスワードを口頭で伝えれば暗号化不要" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=22, min=11)
---
### Q-41b5ba22-474a-4919-9757-6b83819135a9
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "重要な情報の入ったPC等を飛行機で運ぶ場合の正しい取り扱いはどれか。"
- options:
  1. "預け荷物として厳重に梱包する" (14자)
  2. [정답] "手荷物として機内に持ち込む" (13자)
  3. "事前に宅配便で送っておく" (12자)
  4. "航空会社の貴重品サービスを利用する" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.42x (max=17, min=12)
---
### Q-5adf8758-ecc7-4981-8851-e36cf8cca421
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "「チェーンメール」を受信した場合の正しい対応はどれか。"
- options:
  1. "内容が正しそうなら転送する" (13자)
  2. "上司に転送して判断を仰ぐ" (12자)
  3. [정답] "他人に送らず削除する" (10자)
  4. "全員に注意喚起として転送する" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.40x (max=14, min=10)
  - **B5-a** (Medium): correct is shortest (10 vs others 13,12,14)
---
### Q-80cddb7b-97c8-42fb-af4a-50dc4c9cb4df
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "貸与されたメールアドレスの取り扱いとして正しいものはどれか。"
- options:
  1. "技術コミュニティに登録してよい" (15자)
  2. [정답] "社外のメーリングリストへの登録・公開は禁止" (21자)
  3. "業務関連のサービスなら登録可能" (15자)
  4. "個人のSNSプロフィールに記載してよい" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.40x (max=21, min=15)
  - **B5-a** (Medium): correct is longest (21 vs others 15,15,19)
---
### Q-527fb0c7-ca33-42a1-8490-73462672335c
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "駅やホテルのロビーでバッグを扱う際の正しい行動はどれか。"
- options:
  1. "椅子の横に置いて座る" (10자)
  2. [정답] "バッグは常に手元に置く" (11자)
  3. "フロントに預ける" (8자)
  4. "チャックを閉めておけば足元でよい" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=16, min=8)
---
### Q-4a489dcb-7698-48d3-ab6f-50a0db9eebe2
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "情報の取扱いに関する「あらかじめ認められた情報以外にはアクセスしない」ルールの意味はどれか。"
- options:
  1. "自分の部署の情報には自由にアクセスできる" (20자)
  2. [정답] "業務上許可された情報にのみアクセスし、権限外にはアクセスしない" (31자)
  3. "アクセス権があれば全ての情報を閲覧できる" (20자)
  4. "管理者に依頼すれば何でもアクセスできる" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.63x (max=31, min=19)
  - **B5-a** (Medium): correct is longest (31 vs others 20,20,19)
---
### Q-c9405ffe-de6d-42cc-b7b5-aa0d8f1136f3
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "業務で発生したデータや書類の無断廃棄について正しいものはどれか。"
- options:
  1. "不要になったら自分の判断で廃棄してよい" (19자)
  2. [정답] "承認なく無断廃棄することは禁止" (15자)
  3. "電子データはごみ箱に入れれば廃棄できる" (19자)
  4. "1年以上経過した書類は自由に廃棄可能" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.27x (max=19, min=15)
  - **B5-a** (Medium): correct is shortest (15 vs others 19,19,18)
---
### Q-15627f2c-1ccd-4e49-8721-691c6a93e825
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "情報インフラの「私的使用」に該当するものはどれか。"
- options:
  1. "業務に必要な技術資料のダウンロード" (17자)
  2. [정답] "業務上必要としないWebサイトの閲覧" (18자)
  3. "社内メールでの業務連絡" (11자)
  4. "業務用ツールのアップデート" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=18, min=11)
  - **B5-a** (Medium): correct is longest (18 vs others 17,11,13)
---
### Q-969e8830-4a73-49fe-9938-99a7d6c77358
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "重要な情報に関する「バックアップ」の保管場所として正しいものはどれか。"
- options:
  1. "個人のUSBメモリ" (9자)
  2. [정답] "アクセスコントロールが施された安全なサーバ" (21자)
  3. "個人のクラウドストレージ" (12자)
  4. "デスクトップPCのローカルディスク" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.33x (max=21, min=9)
  - **B5-a** (Medium): correct is longest (21 vs others 9,12,17)
---
### Q-7c4f9483-4a01-4124-b1d6-abe796a2ee4d
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "業務上不要となった情報の書類・電子データの正しい処理はどれか。"
- options:
  1. "自分で判断して捨てる" (10자)
  2. [정답] "会社に返却または適切に廃棄する" (15자)
  3. "引き出しに入れて保管する" (12자)
  4. "シュレッダー後の報告は不要とする" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=16, min=10)
---
### Q-b6391d66-c746-449e-9cae-5f7fcaa21851
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "お客様の情報を取り扱う際の基本ルールとして正しいものはどれか。"
- options:
  1. "社内の誰でも見られるようにする" (15자)
  2. [정답] "目的とルールに従って扱う" (12자)
  3. "自社判断で自由に利用する" (12자)
  4. "匿名化すれば自由に使える" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.25x (max=15, min=12)
  - **B5-a** (Medium): correct is shortest (12 vs others 15)
---
### Q-f7c040ae-5eb9-418e-b89d-2e26a492ecce
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "モバイルPCの盗難防止対策として正しいものはどれか。"
- options:
  1. "常に自分のデスクに置いておき、周囲の目による監視で盗難を防ぐ" (30자)
  2. [정답] "セキュリティワイヤーや施錠管理で物理的な盗難防止対策を行う" (29자)
  3. "ログインパスワードを設定することで、盗難そのものを未然に防ぐ" (30자)
  4. "損害保険に加入することで、盗難発生時の金銭的な補償を確保する" (30자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (29 vs others 30,30,30)
---
### Q-53e0dbcd-5100-4250-95a1-495398c79638
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "共通鍵暗号方式の特徴として正しいものはどれか。"
- options:
  1. "暗号化と復号に異なる鍵を使用する" (16자)
  2. [정답] "暗号化と復号に同じ鍵を使用する" (15자)
  3. "鍵を使用せずに暗号化する" (12자)
  4. "一方向にのみ変換できる" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
---
### Q-c24e0038-28e3-4033-85e7-b963ae98e69f
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B6]
- question_text: "HTTPSの説明として正しいものはどれか。"
- options:
  1. "HTTPの高速版プロトコル" (13자)
  2. [정답] "HTTP通信をSSL/TLSで暗号化したプロトコル" (25자)
  3. "HTTP/2の別名" (9자)
  4. "HTTPにキャッシュ機能を追加したプロトコル" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.78x (max=25, min=9)
  - **B5-a** (Medium): correct is longest (25 vs others 13,9,22)
  - **B6** (Medium): slash in option: "HTTP通信をSSL/TLSで暗号化したプロトコル"
---
### Q-5295ae37-0be9-400e-afce-b0d9070c1f60
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ハッシュ関数の特徴として正しいものはどれか。"
- options:
  1. "出力から元のデータを復元できる" (15자)
  2. "入力の長さに応じて出力の長さが変わる" (18자)
  3. [정답] "任意長の入力から固定長の出力を生成する一方向関数" (24자)
  4. "同じ入力でも毎回異なる出力を生成する" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=24, min=15)
  - **B5-a** (Medium): correct is longest (24 vs others 15,18,18)
---
### Q-77ffee90-34d7-45f2-8e28-4e5f5ba36841
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ファイアウォールの基本的な役割として正しいものはどれか。"
- options:
  1. "ウイルスを検出して駆除する" (13자)
  2. "データを暗号化して送受信する" (14자)
  3. [정답] "ネットワーク通信をルールに基づき許可または拒否する" (25자)
  4. "パスワードの強度を検証する" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=25, min=13)
  - **B5-a** (Medium): correct is longest (25 vs others 13,14,13)
---
### Q-b97ded89-e900-473e-8839-7a9611ef6808
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "パスワードの安全な保存方法として正しいものはどれか。"
- options:
  1. "平文のまま保存する" (9자)
  2. "Base64エンコードして保存する" (17자)
  3. "共通鍵で暗号化して保存する" (13자)
  4. [정답] "ソルト付きハッシュ（bcrypt等）で保存する" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.56x (max=23, min=9)
  - **B5-a** (Medium): correct is longest (23 vs others 9,17,13)
---
### Q-bfd2aa49-462f-4093-8cea-7767a45f5b2d
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "VPN（Virtual Private Network）の主な目的として正しいものはどれか。"
- options:
  1. "Webサイトの表示速度を向上させる" (17자)
  2. [정답] "暗号化トンネルで安全なプライベート通信を実現する" (24자)
  3. "メールの添付ファイルを自動圧縮する" (17자)
  4. "データベースのバックアップを自動化する" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.41x (max=24, min=17)
  - **B5-a** (Medium): correct is longest (24 vs others 17,17,19)
---
### Q-1983a585-cecc-4bf8-a535-70ff8810f3f0
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "公開鍵暗号方式でデータを暗号化して送信する場合、使用する鍵の組み合わせとして正しいものはどれか。"
- options:
  1. "送信者の公開鍵で暗号化、受信者の秘密鍵で復号" (22자)
  2. [정답] "受信者の公開鍵で暗号化、受信者の秘密鍵で復号" (22자)
  3. "送信者の秘密鍵で暗号化、受信者の公開鍵で復号" (22자)
  4. "共通の秘密鍵で暗号化と復号を行う" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.38x (max=22, min=16)
  - **B5-a** (Medium): correct is longest (22 vs others 16)
---
### Q-e6c3468b-78d3-44f4-b820-186bcf5a1696
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SSL/TLSハンドシェイクの過程で行われないものはどれか。"
- options:
  1. "サーバー証明書の検証" (10자)
  2. "暗号スイートの合意" (9자)
  3. "セッション鍵の生成" (9자)
  4. [정답] "ユーザーIDとパスワードの照合" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.67x (max=15, min=9)
  - **B5-a** (Medium): correct is longest (15 vs others 10,9,9)
---
### Q-a1c79dd5-86e2-4cbc-a5a8-7daa7c7ef6cd
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "クロスサイトスクリプティング（XSS）の対策として最も基本的なものはどれか。"
- options:
  1. "SQLのパラメータ化クエリを使用する" (18자)
  2. [정답] "出力時にHTMLエスケープを行う" (16자)
  3. "HTTPSを使用する" (10자)
  4. "ファイアウォールを導入する" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=18, min=10)
---
### Q-84311e32-4611-4bc5-9b10-cfda1f0fd9ac
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "CSRF（Cross-Site Request Forgery）の対策として正しいものはどれか。"
- options:
  1. "入力値をHTMLエスケープする" (15자)
  2. "プリペアドステートメントを使用する" (17자)
  3. [정답] "CSRFトークンをフォームに埋め込み検証する" (22자)
  4. "パスワードを定期的に変更する" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=22, min=14)
  - **B5-a** (Medium): correct is longest (22 vs others 15,17,14)
---
### Q-17f32ec7-df21-49a5-8387-38ba011e1f66
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OAuth 2.0の説明として正しいものはどれか。"
- options:
  1. "パスワードを暗号化して保存するための規格" (20자)
  2. "通信を暗号化するためのプロトコル" (16자)
  3. [정답] "ユーザーの資格情報を共有せずにリソースアクセスを認可するプロトコル" (33자)
  4. "IPアドレスを隠すための匿名化プロトコル" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.06x (max=33, min=16)
  - **B5-a** (Medium): correct is longest (33 vs others 20,16,20)
---
### Q-ec3880a5-a286-4c1c-af1a-ceeeb1a990e6
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "JWT（JSON Web Token）の構造として正しいものはどれか。"
- options:
  1. "ユーザーID + パスワード + タイムスタンプ" (24자)
  2. [정답] "ヘッダー + ペイロード + 署名" (17자)
  3. "公開鍵 + 秘密鍵 + 証明書" (15자)
  4. "セッションID + Cookie + トークン" (23자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=24, min=15)
---
### Q-d700383b-5958-47df-bfc3-e41f2f19bf9f
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "デジタル署名の目的として正しいものはどれか。"
- options:
  1. "データを暗号化して機密性を保つ" (15자)
  2. [정답] "データの改ざん検出と送信者の認証" (16자)
  3. "ネットワークの通信速度を向上させる" (17자)
  4. "パスワードを安全に保存する" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.31x (max=17, min=13)
---
### Q-411ca18b-767c-4dab-9d4b-2a7c929f0a5e
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "二要素認証（2FA）の「二要素」に含まれない組み合わせはどれか。"
- options:
  1. "パスワード + ワンタイムパスワード（SMS）" (23자)
  2. "パスワード + 指紋認証" (12자)
  3. [정답] "パスワード + 秘密の質問" (13자)
  4. "パスワード + ハードウェアトークン" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=23, min=12)
---
### Q-390a4b30-4815-4d43-9efe-59e80a4d4b66
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "Content-Security-Policy（CSP）ヘッダーの目的として正しいものはどれか。"
- options:
  1. "ブラウザのキャッシュを制御する" (15자)
  2. "レスポンスの圧縮方式を指定する" (15자)
  3. [정답] "ページが読み込めるリソースの出所を制限する" (21자)
  4. "CORSの許可ドメインを指定する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.40x (max=21, min=15)
  - **B5-a** (Medium): correct is longest (21 vs others 15,15,16)
---
### Q-7b3a4ca8-94e2-40a2-91ef-20f4917244c3
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SHA-256の説明として正しいものはどれか。"
- options:
  1. "256ビットの鍵で暗号化する共通鍵暗号" (19자)
  2. [정답] "256ビットの固定長ハッシュ値を出力するハッシュ関数" (26자)
  3. "256ビットの公開鍵を生成する非対称暗号" (20자)
  4. "最大256文字のパスワードに対応する認証方式" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.37x (max=26, min=19)
  - **B5-a** (Medium): correct is longest (26 vs others 19,20,22)
---
### Q-8a681a12-6bb0-42b7-9c33-59f44f78e516
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "CORS（Cross-Origin Resource Sharing）の説明として正しいものはどれか。"
- options:
  1. "サーバー間でデータを同期する仕組み" (17자)
  2. "SQLインジェクションを防止する仕組み" (19자)
  3. [정답] "異なるオリジンからのリソースアクセスを制御する仕組み" (26자)
  4. "Cookieの有効期限を管理する仕組み" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.53x (max=26, min=17)
  - **B5-a** (Medium): correct is longest (26 vs others 17,19,19)
---
### Q-c20a4e11-247d-4525-81d3-ab984647ada3
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "セッション固定攻撃（Session Fixation）の対策として正しいものはどれか。"
- options:
  1. "HTTPSを使用する" (10자)
  2. [정답] "ログイン後にセッションIDを再生成する" (19자)
  3. "パスワードをハッシュ化して保存する" (17자)
  4. "CSRFトークンを使用する" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.90x (max=19, min=10)
  - **B5-a** (Medium): correct is longest (19 vs others 10,17,13)
---
### Q-f3925d7b-0954-4ff0-86c8-eeea6068c254
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "PKI（Public Key Infrastructure）における認証局（CA）の役割として正しいものはどれか。"
- options:
  1. "データの暗号化を実行する" (12자)
  2. "ファイアウォールの設定を管理する" (16자)
  3. [정답] "デジタル証明書を発行し公開鍵の所有者を保証する" (23자)
  4. "VPN接続のトンネルを構築する" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=23, min=12)
  - **B5-a** (Medium): correct is longest (23 vs others 12,16,15)
---
### Q-18e107e1-5065-4bfa-9a55-03f584a48cee
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "TLS 1.3における改善点として正しいものはどれか。"
- options:
  1. "ハンドシェイクが3-RTTに拡張された" (19자)
  2. "RSA鍵交換が必須になった" (13자)
  3. [정답] "ハンドシェイクが1-RTTに短縮され脆弱な暗号スイートが廃止された" (33자)
  4. "SSL 3.0との後方互換性が追加された" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.54x (max=33, min=13)
  - **B5-a** (Medium): correct is longest (33 vs others 19,13,20)
---
### Q-2ff05045-a7c0-40db-8e2c-8520f46c1b91
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "Stored XSS（格納型XSS）の説明として正しいものはどれか。"
- options:
  1. "URLパラメータに含まれたスクリプトがそのまま応答に反映される攻撃" (33자)
  2. [정답] "悪意のスクリプトがDBに保存され他ユーザー閲覧時に実行される攻撃" (32자)
  3. "DOMの操作を通じてクライアント側でスクリプトが実行される攻撃" (31자)
  4. "CSSを悪用してページの表示を改ざんする攻撃" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=33, min=22)
---
### Q-eaec6198-36e0-485f-bfce-08301a972582
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "レインボーテーブル攻撃の対策として最も効果的なものはどれか。"
- options:
  1. "より長いハッシュ関数（SHA-512等）を使用する" (25자)
  2. "ハッシュを複数回繰り返す" (12자)
  3. [정답] "ソルト（ランダムな値）を付加してハッシュ化する" (23자)
  4. "ハッシュ値を暗号化して保存する" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.08x (max=25, min=12)
---
### Q-b2cd85ba-3b74-4f8e-aa89-e872d29c521f
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "パスワードの管理方法として最も適切なものはどれか。"
- options:
  1. [정답] "サービスごとに異なる複雑なパスワードを使用する" (23자)
  2. "覚えやすいように全サービスで同じパスワードを使用する" (26자)
  3. "短くて覚えやすいパスワードを設定する" (18자)
  4. "パスワードをパソコンの画面に付箋で貼っておく" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=26, min=18)
---
### Q-e7beab20-cafb-4ad7-8a1b-d37ea63dc38d
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OAuth 2.0の認可コードフロー（Authorization Code Flow）で、認可コードからアクセストークンを取得する際に必要なものはどれか。"
- options:
  1. "ユーザーのパスワード" (10자)
  2. [정답] "認可コードとクライアントシークレット" (18자)
  3. "リフレッシュトークンのみ" (12자)
  4. "ユーザーのセッションID" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=18, min=10)
  - **B5-a** (Medium): correct is longest (18 vs others 10,12,12)
---
### Q-c265d98b-7eef-44c3-918d-322ddddacb13
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ゼロデイ脆弱性の説明として正しいものはどれか。"
- options:
  1. "発見から0日以内に修正された脆弱性" (17자)
  2. [정답] "パッチが公開されていない未修正の脆弱性" (19자)
  3. "影響範囲が0人の軽微な脆弱性" (14자)
  4. "0時(深夜)に発見された脆弱性" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.36x (max=19, min=14)
  - **B5-a** (Medium): correct is longest (19 vs others 17,14,15)
---
### Q-92886d09-ac81-44c4-8df3-4a803f893642
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "セキュアコーディングにおける入力検証の原則として正しいものはどれか。"
- options:
  1. "クライアントサイドの検証のみで十分" (17자)
  2. "ブラックリスト方式で危険な文字をフィルタする" (22자)
  3. [정답] "ホワイトリスト方式で許可パターンを定義しサーバーサイドで検証する" (32자)
  4. "入力値の長さだけを制限すれば安全" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=32, min=16)
  - **B5-a** (Medium): correct is longest (32 vs others 17,22,16)
---
### Q-d8252931-b456-4018-8ac8-1fbf1840f676
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B6]
- question_text: "HSTS（HTTP Strict Transport Security）の説明として正しいものはどれか。"
- options:
  1. "HTTPとHTTPSを自動的に切り替える仕組み" (23자)
  2. [정답] "ブラウザにHTTPS通信のみを強制しHTTPダウングレードを防止する" (34자)
  3. "HTTP/2の暗号化通信機能" (14자)
  4. "サーバー間のHTTPS通信を保証する仕組み" (21자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.43x (max=34, min=14)
  - **B5-a** (Medium): correct is longest (34 vs others 23,14,21)
  - **B6** (Medium): slash in option: "HTTP/2の暗号化通信機能"
---
### Q-f2d54c4d-bb19-43eb-b6fb-96ad43ba33f4
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "OWASP Top 10に含まれないカテゴリはどれか。"
- options:
  1. "インジェクション" (8자)
  2. "認証の不備" (5자)
  3. [정답] "ネットワーク帯域幅の最適化" (13자)
  4. "セキュリティの設定ミス" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.60x (max=13, min=5)
  - **B5-a** (Medium): correct is longest (13 vs others 8,5,11)
---
### Q-b36737da-0b86-42a8-a770-a09b45831430
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B6]
- question_text: "中間者攻撃（Man-in-the-Middle）を防ぐための技術として最も効果的なものはどれか。"
- options:
  1. "ファイアウォールの導入" (11자)
  2. "ウイルス対策ソフトの導入" (12자)
  3. [정답] "TLS/SSL証明書による暗号化と認証" (19자)
  4. "IPアドレスのフィルタリング" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=19, min=11)
  - **B5-a** (Medium): correct is longest (19 vs others 11,12,14)
  - **B6** (Medium): slash in option: "TLS/SSL証明書による暗号化と認証"
---
### Q-72e29209-80c2-47de-b178-ce557dee85db
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "JWTの「alg: none」脆弱性の説明として正しいものはどれか。"
- options:
  1. "トークンの有効期限を無期限に設定する攻撃" (20자)
  2. [정답] "アルゴリズムをnoneに変更して署名検証をバイパスする攻撃" (29자)
  3. "ペイロードに大量のデータを含めてサーバーを過負荷にする攻撃" (29자)
  4. "トークンを複製して複数のセッションを同時に利用する攻撃" (27자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=29, min=20)
  - **B5-a** (Medium): correct is longest (29 vs others 20,27)
---
### Q-dd2cb0d8-597c-4bb3-8713-4a2101bf3f61
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "脆弱性スキャンとペネトレーションテストの違いとして正しいものはどれか。"
- options:
  1. "両者は同じ手法で実施される" (13자)
  2. "脆弱性スキャンは手動、ペネトレーションテストは自動で実施される" (31자)
  3. [정답] "脆弱性スキャンは自動検出、ペネトレーションテストは専門家が実際に攻撃を試みる" (38자)
  4. "脆弱性スキャンはネットワーク、ペネトレーションテストはアプリのみが対象" (35자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.92x (max=38, min=13)
  - **B5-a** (Medium): correct is longest (38 vs others 13,31,35)
---
### Q-2881d971-0dc6-4983-9d61-72b25475c5e7
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ソーシャルエンジニアリングの説明として正しいものはどれか。"
- options:
  1. [정답] "人間の心理的弱点を利用して情報を不正入手する手法" (24자)
  2. "ソフトウェアの脆弱性を攻撃する手法" (17자)
  3. "ネットワークの盗聴を行う手法" (14자)
  4. "データを暗号化する手法" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.18x (max=24, min=11)
  - **B5-a** (Medium): correct is longest (24 vs others 17,14,11)
---
### Q-67d77013-e876-4fb6-b1a7-b7e4b7ce2a49
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "情報セキュリティポリシーの説明として正しいものはどれか。"
- options:
  1. [정답] "組織の情報セキュリティに関する基本方針を定めた文書" (25자)
  2. "ウイルス対策ソフトの設定ファイル" (16자)
  3. "ネットワークの構成図" (10자)
  4. "パスワードの一覧表" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.78x (max=25, min=9)
  - **B5-a** (Medium): correct is longest (25 vs others 16,10,9)
---
### Q-900d752c-7787-459f-b23a-fe073975b7c8
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "スパムメールの説明として正しいものはどれか。"
- options:
  1. [정답] "受信者の同意なく大量に送信される迷惑メール" (21자)
  2. "ウイルスに感染したメール" (12자)
  3. "暗号化されたメール" (9자)
  4. "電子署名付きのメール" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.33x (max=21, min=9)
  - **B5-a** (Medium): correct is longest (21 vs others 12,9,10)
---
### Q-b30fae2a-28ac-4962-b270-1ae43b5173e7
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "個人情報保護法の目的として正しいものはどれか。"
- options:
  1. [정답] "個人情報の適切な取り扱いルールを定め権利利益を保護する" (27자)
  2. "コンピュータウイルスを規制する" (15자)
  3. "インターネットの利用を制限する" (15자)
  4. "ソフトウェアの著作権を保護する" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.80x (max=27, min=15)
  - **B5-a** (Medium): correct is longest (27 vs others 15,15,15)
---
### Q-0a324bcd-96fc-4dee-9d50-1f778f7b304f
- quiz_id: 3714c842-5507-4f99-a185-7c5dba98a90b
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "情報セキュリティにおける「機密性」の説明として正しいものはどれか。"
- options:
  1. [정답] "許可された人だけが情報にアクセスできること" (21자)
  2. "情報が正確で改ざんされていないこと" (17자)
  3. "必要なときに情報を利用できること" (16자)
  4. "誰が情報にアクセスしたか記録すること" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.31x (max=21, min=16)
  - **B5-a** (Medium): correct is longest (21 vs others 17,16,18)
---
### Q-5f0a7731-4c7e-4c6e-aa09-7e67b31d0684
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "共通鍵暗号方式の特徴として正しいものはどれか。"
- options:
  1. [정답] "暗号化と復号に同じ鍵を使用する" (15자)
  2. "暗号化と復号に異なる鍵を使用する" (16자)
  3. "鍵を使用せずにデータを暗号化する" (16자)
  4. "公開鍵で暗号化し秘密鍵で復号する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is shortest (15 vs others 16,16,16)
---
### Q-283e8893-597e-436d-bea3-97dfc5b362d5
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ファイアウォールの役割として正しいものはどれか。"
- options:
  1. [정답] "許可されていない通信を遮断してネットワークを保護する" (26자)
  2. "ウイルスを検出して駆除する" (13자)
  3. "データをバックアップする" (12자)
  4. "ネットワーク速度を向上させる" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.17x (max=26, min=12)
  - **B5-a** (Medium): correct is longest (26 vs others 13,12,14)
---
### Q-e2c26b96-ff3f-4132-8d31-bb5cde7d9c22
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ハッシュ法の衝突解決方法であるチェイン法の説明として正しいものはどれか。"
- options:
  1. [정답] "同じハッシュ値のデータを連結リストで管理する" (22자)
  2. "空いているハッシュ値の場所にデータを格納する" (22자)
  3. "ハッシュテーブルのサイズを2倍に拡張する" (20자)
  4. "衝突したデータを別のテーブルに移動する" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (22 vs others 20,19)
---
### Q-12e83a12-f2fb-43c8-bf73-b07e676dfede
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "暗号化の説明として正しいものはどれか。"
- options:
  1. [정답] "データを第三者に読めない形式に変換する技術" (21자)
  2. "データを圧縮して容量を減らす技術" (16자)
  3. "データのバックアップを作成する技術" (17자)
  4. "データの検索速度を向上させる技術" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.31x (max=21, min=16)
  - **B5-a** (Medium): correct is longest (21 vs others 16,17,16)
---
### Q-5f414647-8e1d-4bc3-89e8-911f7298c9e6
- quiz_id: 9cc6995f-6c28-472b-bb4e-22ea316decc1
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "VPNの説明として正しいものはどれか。"
- options:
  1. [정답] "インターネット上に暗号化された仮想的な専用回線を構築する技術" (30자)
  2. "物理的な専用回線を敷設する技術" (15자)
  3. "無線LANの暗号化規格" (11자)
  4. "ウイルス対策ソフトの一種" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.73x (max=30, min=11)
  - **B5-a** (Medium): correct is longest (30 vs others 15,11,12)
---
### Q-1e97a90c-19ff-4c9a-a4c4-8c3e8c0dd642
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "デジタル署名の目的として正しいものはどれか。"
- options:
  1. [정답] "送信者の認証とデータの改ざん検知" (16자)
  2. "データの暗号化" (7자)
  3. "データの圧縮" (6자)
  4. "ネットワーク速度の向上" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.67x (max=16, min=6)
  - **B5-a** (Medium): correct is longest (16 vs others 7,6,11)
---
### Q-072a76df-e7c2-40da-b5fb-297869e83481
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "AES暗号の特徴として正しいものはどれか。"
- options:
  1. [정답] "米国政府標準の共通鍵暗号方式" (14자)
  2. "公開鍵暗号方式" (7자)
  3. "ハッシュ関数" (6자)
  4. "デジタル署名専用のアルゴリズム" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.50x (max=15, min=6)
---
### Q-158ddbe8-e11a-4731-b6ee-9cd706b2d4fa
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "RSA暗号の特徴として正しいものはどれか。"
- options:
  1. [정답] "素因数分解の困難さに基づく公開鍵暗号方式" (20자)
  2. "共通鍵暗号方式" (7자)
  3. "ハッシュ関数" (6자)
  4. "ストリーム暗号方式" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 3.33x (max=20, min=6)
  - **B5-a** (Medium): correct is longest (20 vs others 7,6,9)
---
### Q-c0d9eec2-a7db-4080-be59-21e7cdcea40d
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "フィッシング攻撃の説明として正しいものはどれか。"
- options:
  1. [정답] "偽のWebサイトやメールで個人情報を騙し取る攻撃" (24자)
  2. "ネットワークに大量のデータを送りつける攻撃" (21자)
  3. "ソフトウェアの脆弱性を悪用する攻撃" (17자)
  4. "物理的にコンピュータを破壊する攻撃" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.41x (max=24, min=17)
  - **B5-a** (Medium): correct is longest (24 vs others 21,17,17)
---
### Q-57e29061-5343-40ec-ab68-506747a494f9
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "二要素認証の説明として正しいものはどれか。"
- options:
  1. [정답] "2つの異なる認証要素を組み合わせて認証する方式" (23자)
  2. "パスワードを2回入力する方式" (14자)
  3. "2人の管理者が同時に承認する方式" (16자)
  4. "2つのデバイスで同時にログインする方式" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=23, min=14)
  - **B5-a** (Medium): correct is longest (23 vs others 14,16,19)
---
### Q-58d639e2-5d6b-41ba-9530-010191ad4265
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "クロスサイトスクリプティング（XSS）の説明として正しいものはどれか。"
- options:
  1. [정답] "Webサイトに悪意のあるスクリプトを埋め込みブラウザ上で実行させる攻撃" (35자)
  2. "サーバーに不正なSQLを送信する攻撃" (18자)
  3. "ネットワーク盗聴を行う攻撃" (13자)
  4. "ファイルを暗号化して身代金を要求する攻撃" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.69x (max=35, min=13)
  - **B5-a** (Medium): correct is longest (35 vs others 18,13,20)
---
### Q-bb973153-42bf-481f-afe7-028376eb4643
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "CSRF（クロスサイトリクエストフォージェリ）の説明として正しいものはどれか。"
- options:
  1. [정답] "ログイン済みの利用者に意図しないリクエストを送信させる攻撃" (29자)
  2. "Webサイトにスクリプトを埋め込む攻撃" (19자)
  3. "不正なSQL文を入力する攻撃" (14자)
  4. "パスワードを総当たりで試す攻撃" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.07x (max=29, min=14)
  - **B5-a** (Medium): correct is longest (29 vs others 19,14,15)
---
### Q-0909aee6-e229-487d-89e6-ce7db0524f08
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "不正アクセス禁止法で禁止されている行為はどれか。"
- options:
  1. [정답] "他人のID・パスワードを無断で使用してシステムに侵入する行為" (30자)
  2. "自分のパスワードを変更する行為" (15자)
  3. "公開されているWebサイトを閲覧する行為" (20자)
  4. "メールを送受信する行為" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.73x (max=30, min=11)
  - **B5-a** (Medium): correct is longest (30 vs others 15,20,11)
---
### Q-09f21c86-464d-489e-afa2-bb5dc0ec4025
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ウイルス対策ソフトの機能として正しいものはどれか。"
- options:
  1. [정답] "マルウェアの検出・隔離・駆除を行う" (17자)
  2. "ネットワークの通信速度を向上させる" (17자)
  3. "ファイルの圧縮・解凍を行う" (13자)
  4. "メールの自動送受信を行う" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.42x (max=17, min=12)
  - **B5-a** (Medium): correct is longest (17 vs others 13,12)
---
### Q-17689073-dd5e-4643-89fa-4dc0fc7be96f
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ゼロデイ攻撃の説明として正しいものはどれか。"
- options:
  1. [정답] "修正パッチ提供前に脆弱性を悪用する攻撃" (19자)
  2. "0時ちょうどに実行される攻撃" (14자)
  3. "検出率が0%の攻撃" (9자)
  4. "被害額が0円の攻撃" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.11x (max=19, min=9)
  - **B5-a** (Medium): correct is longest (19 vs others 14,9,9)
---
### Q-1ad64e11-5311-41f8-9343-2dde578f9227
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "セキュリティパッチの説明として正しいものはどれか。"
- options:
  1. [정답] "ソフトウェアの脆弱性を修正する更新プログラム" (22자)
  2. "ウイルス対策ソフトの名称" (12자)
  3. "データの暗号化ツール" (10자)
  4. "ネットワーク監視ツール" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.20x (max=22, min=10)
  - **B5-a** (Medium): correct is longest (22 vs others 12,10,11)
---
### Q-4777a3e5-a2c1-49e6-ae2c-f69133be3e55
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "トロイの木馬の説明として正しいものはどれか。"
- options:
  1. [정답] "有用なプログラムに見せかけて不正な動作を行うマルウェア" (27자)
  2. "自己複製して他のコンピュータに感染するマルウェア" (24자)
  3. "ファイルを暗号化して身代金を要求するマルウェア" (23자)
  4. "広告を強制的に表示するマルウェア" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=27, min=16)
  - **B5-a** (Medium): correct is longest (27 vs others 24,23,16)
---
### Q-50f3c0f0-ff30-49aa-9990-124e31b69af5
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SSLサーバー証明書の役割として正しいものはどれか。"
- options:
  1. [정답] "Webサイト運営者の実在性を証明し暗号化通信を可能にする" (28자)
  2. "ウイルスを検出する" (9자)
  3. "パスワードを管理する" (10자)
  4. "ファイルのバックアップを取る" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 3.11x (max=28, min=9)
  - **B5-a** (Medium): correct is longest (28 vs others 9,10,14)
---
### Q-665d43f9-b190-4637-bbdf-854c0a75761e
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "マルウェアの説明として正しいものはどれか。"
- options:
  1. [정답] "コンピュータに害を与える悪意のあるソフトウェアの総称" (26자)
  2. "セキュリティ対策ソフトの総称" (14자)
  3. "ネットワーク機器の一種" (11자)
  4. "暗号化技術の一種" (8자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 3.25x (max=26, min=8)
  - **B5-a** (Medium): correct is longest (26 vs others 14,11,8)
---
### Q-829ec65f-7be5-4e11-a261-9fa19b555541
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "アクセス権の設定の目的として正しいものはどれか。"
- options:
  1. [정답] "ユーザーごとに利用可能な機能やデータを制限する" (23자)
  2. "すべてのユーザーに同じ権限を付与する" (18자)
  3. "データの転送速度を向上させる" (14자)
  4. "プログラムの実行速度を向上させる" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=23, min=14)
  - **B5-a** (Medium): correct is longest (23 vs others 18,14,16)
---
### Q-5190d26a-f2e3-448a-ac41-859caddf1226
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "DDoS攻撃の説明として正しいものはどれか。"
- options:
  1. [정답] "多数のコンピュータから大量のリクエストを送りサービスを停止させる攻撃" (34자)
  2. "偽のWebサイトで個人情報を盗む攻撃" (18자)
  3. "ソフトウェアの脆弱性を悪用する攻撃" (17자)
  4. "USBメモリでウイルスを感染させる攻撃" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=34, min=17)
  - **B5-a** (Medium): correct is longest (34 vs others 18,17,19)
---
### Q-77949c87-0a67-4ace-8798-1376d1f2d5ad
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "IDS（侵入検知システム）の説明として正しいものはどれか。"
- options:
  1. [정답] "不正アクセスを検知して管理者に通知するシステム" (23자)
  2. "不正アクセスを検知して自動的に遮断するシステム" (23자)
  3. "ウイルスを検出して駆除するシステム" (17자)
  4. "データを暗号化するシステム" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.77x (max=23, min=13)
  - **B5-a** (Medium): correct is longest (23 vs others 17,13)
---
### Q-8b19f193-eeed-4c0f-9788-96f832eed1ba
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ペネトレーションテストの説明として正しいものはどれか。"
- options:
  1. [정답] "実際の攻撃手法を模擬してシステムの脆弱性を検証するテスト" (28자)
  2. "プログラムの機能をテストする手法" (16자)
  3. "ネットワーク速度を測定するテスト" (16자)
  4. "ハードウェアの耐久性をテストする手法" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.75x (max=28, min=16)
  - **B5-a** (Medium): correct is longest (28 vs others 16,16,18)
---
### Q-a2bf76e6-db83-4afb-9790-8077751e5d73
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "セッションハイジャックの説明として正しいものはどれか。"
- options:
  1. [정답] "セッションIDを盗み取りユーザーになりすます攻撃" (24자)
  2. "セッション中の通信を暗号化する技術" (17자)
  3. "セッションの有効時間を延長する技術" (17자)
  4. "セッションのログを記録する技術" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.60x (max=24, min=15)
  - **B5-a** (Medium): correct is longest (24 vs others 17,17,15)
---
### Q-e40a6bcb-50b1-4bd0-b881-f3ee632a09ea
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ブルートフォース攻撃の説明として正しいものはどれか。"
- options:
  1. [정답] "パスワードの全組み合わせを試す総当たり攻撃" (21자)
  2. "辞書に載っている単語だけを試す攻撃" (17자)
  3. "ネットワークを盗聴する攻撃" (13자)
  4. "偽のWebサイトに誘導する攻撃" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.62x (max=21, min=13)
  - **B5-a** (Medium): correct is longest (21 vs others 17,13,15)
---
### Q-e82bacc7-216d-4bfc-a3a1-03d6c12c0a84
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a, B6]
- question_text: "ISMS（情報セキュリティマネジメントシステム）の国際規格はどれか。"
- options:
  1. [정답] "ISO/IEC 27001" (13자)
  2. "ISO 9001" (8자)
  3. "ISO 14001" (9자)
  4. "ISO/IEC 20000" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.63x (max=13, min=8)
  - **B5-a** (Medium): correct is longest (13 vs others 8,9)
  - **B6** (Medium): slash in option: "ISO/IEC 27001"
---
### Q-f4cae4c3-e722-44b7-92ee-36e1cd3f20d0
- quiz_id: cc1af8e7-e87e-4df8-9845-6608622a7e47
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ランサムウェアの説明として正しいものはどれか。"
- options:
  1. [정답] "ファイルを暗号化し身代金を要求するマルウェア" (22자)
  2. "ウイルスを検出するソフトウェア" (15자)
  3. "データを自動でバックアップするソフトウェア" (21자)
  4. "ネットワークの速度を低下させるマルウェア" (20자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.47x (max=22, min=15)
  - **B5-a** (Medium): correct is longest (22 vs others 15,21,20)
---
### Q-896270d4-c380-4530-af66-e9a45dfc1b0a
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ハッシュ関数の特徴として正しいものはどれか。"
- options:
  1. [정답] "固定長の値を生成し元のデータに戻せない一方向性を持つ" (26자)
  2. "ハッシュ値から元のデータを復元できる" (18자)
  3. "データを暗号化・復号する" (12자)
  4. "入力データの長さに応じて出力長が変わる" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.17x (max=26, min=12)
  - **B5-a** (Medium): correct is longest (26 vs others 18,12,19)
---
### Q-af76b081-b6c2-4843-9498-b85c1f1907d6
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "SSL/TLSにおけるハイブリッド暗号方式の説明として正しいものはどれか。"
- options:
  1. [정답] "公開鍵暗号で鍵を交換し共通鍵暗号でデータを暗号化する" (26자)
  2. "公開鍵暗号のみでデータを暗号化する" (17자)
  3. "共通鍵暗号のみでデータを暗号化する" (17자)
  4. "ハッシュ関数でデータを暗号化する" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.63x (max=26, min=16)
  - **B5-a** (Medium): correct is longest (26 vs others 17,17,16)
---
### Q-d8d4b83b-a5d9-4fa9-94f8-6a24624f311b
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "PKI（公開鍵基盤）の説明として正しいものはどれか。"
- options:
  1. [정답] "認証局が公開鍵の正当性を証明する仕組み" (19자)
  2. "共通鍵を安全に配送する仕組み" (14자)
  3. "ファイアウォールを管理する仕組み" (16자)
  4. "ウイルスを検知する仕組み" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.58x (max=19, min=12)
  - **B5-a** (Medium): correct is longest (19 vs others 14,16,12)
---
### Q-e4d2a050-4c7c-40e9-8ef0-79c24f9e3e82
- quiz_id: 4828dbf5-6f6e-4ccd-8be3-7547414b180b
- question_category: security, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "公開鍵暗号方式の特徴として正しいものはどれか。"
- options:
  1. [정답] "暗号化と復号に異なる鍵のペアを使用する" (19자)
  2. "暗号化と復号に同じ鍵を使用する" (15자)
  3. "鍵を使用しない暗号方式" (11자)
  4. "常に共通鍵より高速に処理できる" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=19, min=11)
  - **B5-a** (Medium): correct is longest (19 vs others 15,11,15)
---
### Q-50993547-3ca3-4e44-8cef-95eb95c18255
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ハッシュ法における衝突（コリジョン）の説明として正しいものはどれか。"
- options:
  1. [정답] "異なるキーが同じハッシュ値になること" (18자)
  2. "ハッシュテーブルが満杯になること" (16자)
  3. "同じキーが複数回登録されること" (15자)
  4. "ハッシュ関数の計算に時間がかかること" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (18 vs others 16,15)
---
### Q-bbdb80a4-b85a-4d69-a143-4e469cf9e214
- quiz_id: a0000005-0000-0000-0000-000000000005
- question_category: security, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "テレワーク時に禁止されている行為として正しくないものはどれか。"
- options:
  1. "在宅で資料を印刷する" (10자)
  2. "画面キャプチャの取得" (10자)
  3. [정답] "自宅の安全なWi-Fiを使う" (14자)
  4. "公衆Wi-Fiに接続する" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.40x (max=14, min=10)
  - **B5-a** (Medium): correct is longest (14 vs others 10,10,12)
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
