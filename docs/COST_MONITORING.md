# コスト・モニタリング・ガイド

J-Bridge が依存する外部サービスの料金監視と予算アラート設定をまとめる。

---

## 1. 監視対象サービス

| サービス | 月額目安 (50 ユーザー規模) | 監視場所 | アラート設定 |
|---|---|---|---|
| 本番サーバー (GitHub Actions deploy ターゲット) | サーバー利用料 (規模次第) | クラウド請求 / 監視ツール | 仕入先プラン上限の 80% |
| Supabase | $25〜$50 | Dashboard → Usage | DB サイズ 8GB 制限注意 |
| Google Cloud TTS | $5〜$30 | Cloud Console → Billing | 下記 §3 で設定 |
| Judge0 (RapidAPI) | $10〜$50 | RapidAPI Dashboard | プラン上限の 80% |
| Judge0 (self-hosted) | VM 代 ($10〜$30) | クラウド請求 | VM サイズに応じ |

---

## 2. GitHub Actions / 本番サーバー使用量の確認

### GitHub Actions
```
GitHub Repository → Settings → Billing & plans → Actions usage
```

注視:
- **Actions minutes** — Free 2000 分/月、Pro 3000 分/月、Team 以上は別枠
- **Storage** — Artifacts ・ Cache 容量
- 月初に確認する習慣を

### 本番サーバー (GitHub Actions deploy ターゲット)
- ホスティング先のクラウド請求 (AWS / GCP / Azure / Cloudflare 等)
- CPU / メモリ / 帯域 / ディスク容量を監視ツールで継続確認
- スケールアップ判断は使用率 70% 超過が目安

---

## 3. Google Cloud Billing アラート (TTS)

### 3-1. Budget の作成

1. Google Cloud Console → Billing → Budgets & alerts → CREATE BUDGET
2. 設定値:
   - **Name**: `j-bridge-tts-monthly`
   - **Scope**: TTS API のみ (Filter: `Service = Cloud Text-to-Speech API`)
   - **Amount**: $50 (任意)
   - **Threshold rules**: 50%, 80%, 100%, 120%
3. 通知メール先を社内インフラ管理者に設定

### 3-2. Quota の確認

```
Google Cloud Console → IAM & Admin → Quotas → Cloud Text-to-Speech API
```

- **Characters per minute** — 過剰な並列リクエスト時に注意
- **Characters per day** — 日次上限

J-Bridge のキャッシュ機構 (Supabase Storage `tts-cache`) によりリクエスト数は抑制されているが、新規問題追加直後は急増することがある。

---

## 4. Supabase Usage の確認

```
Supabase Dashboard → プロジェクト → Settings → Usage
```

注視:
- **Database size** — Pro プランは 8GB 上限
- **Egress** — 月 250GB 超で課金 (Pro)
- **Storage** — `tts-cache` バケットが容量を圧迫しがち

容量逼迫時の対応:
- `tts-cache` バケットの古い MP3 を削除 (再生成可能)
- `audit_log` の古い行を archive (社内ポリシーに応じ)
- バックアップを別の S3 等へ移送

---

## 5. Judge0 の確認

### RapidAPI 経由
```
RapidAPI Dashboard → My Apps → 該当 App → Analytics
```

- 月間 submission 数を確認
- プラン上限に達すると 429 エラー → コード採点機能停止

### Self-hosted
- VM の CPU/メモリ使用率
- 同時実行数 (Judge0 内部キュー)

---

## 6. 月次コスト・レビュー (推奨ルーチン)

毎月 1 日に以下を実施:
- [ ] GitHub Actions usage 確認 + 本番サーバーのクラウド請求確認
- [ ] Supabase Usage 確認
- [ ] Google Cloud Billing 確認 (前月の確定額)
- [ ] Judge0 / RapidAPI 利用状況確認
- [ ] 異常な増加がないか確認 (前月比 +50% 以上は要調査)
- [ ] 結果を社内 Slack `#j-bridge-dev` に投稿

---

## 7. コスト削減アイデア

### TTS
- 同じテキストの再合成を避けるため `tts-cache` を活用 (済)
- 問題追加時のバッチ TTS pre-cache 実行 (`/api/admin/tts-precache`)

### Supabase
- 監査ログのアーカイブ・ルーチン化
- `personal_vocab` 等の使用頻度が低いテーブルの見直し

### Judge0
- self-hosted への移行 (規模が大きくなるほど有利)
- バッチ採点 (現状並列で送信、コスト最適化の余地あり)
