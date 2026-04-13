# CS Network B5-a Validation Report

**Date:** 2026-04-06
**Validator:** Claude (Opus 4.6)
**Migration:** `00158_fix_cs_network_b5a.sql`

## Summary

| Metric | Count |
|--------|-------|
| Total questions reviewed | 65 |
| UPDATEs rewritten (natural) | 64 |
| Skipped (correct=shortest, unfixable) | 1 |
| Generic suffix patterns removed | 64 |

## Rewrite Techniques Applied

| Technique | Count | Example |
|-----------|-------|---------|
| Add scope/context | 22 | "データを暗号化する" -> "ネットワーク上のデータを暗号化して保護する" |
| Add technical detail | 18 | "ドメイン名を解決するプロトコル" -> "ドメイン名をIPアドレスに解決するためのプロトコル" |
| Add qualifier/condition | 12 | "ネットワークのトラフィックを監視する" -> "ネットワーク上のトラフィック量をリアルタイムに監視する" |
| Restructure sentence | 8 | "有線LANの高速通信規格" -> "イーサネットに準拠した有線LAN専用の高速通信規格" |
| Minor structural addition | 4 | "ACK -> SYN -> SYN+ACK" -> "ACK -> SYN -> SYN+ACK の順" |

## Removed Unnatural Patterns

All instances of the following generic suffixes were eliminated:

- "ことを目的とした手法である" (12 occurrences)
- "として知られている手法である" (11 occurrences)
- "であるとされている" (5 occurrences)
- "に該当する処理方式である" (5 occurrences)
- "が必要条件となっている" (3 occurrences)
- "ことが主な目的である" (2 occurrences)
- "であることが主な特徴である" (1 occurrence)
- "として一般的に知られている" (1 occurrence)
- Other generic padding (remaining)

## Skipped Questions

### Q-c51ccf96: HTTPSにおけるTLSの役割として正しいものはどれか。
- **Reason:** correct=shortest (16 chars), distractors are all longer (23, 17, 17)
- **Action required:** Either trim distractors or restructure the correct answer (out of scope for distractor-only padding)

## Quality Checks

1. **All distractors remain incorrect** -- verified each rewritten option against the question context
2. **No correct answer modified** -- only distractor UUIDs appear in WHERE clauses
3. **Natural Japanese** -- no mechanical suffix appending; each rewrite uses contextually appropriate expansion
4. **Length targets met** -- padded distractors are 1-5 chars longer than correct answer in most cases
5. **SQL syntax** -- removed stray text fragments ("実装や", "基本事項と", etc.) that appeared in the original auto-generated migration

## Duplicate Pattern Note

Several questions are "scenario variants" of the same base question (e.g., "LANの説明" appears 3 times with different question stems). These share the same distractor text and receive the same rewrite. Affected pairs:

- LAN: Q-9b8bf101 / Q-d855c82e (both -> "世界中の拠点をつなぐ広域のネットワーク")
- TCP/UDP: Q-6637de53 / Q-73f7b0a0 (both -> "UDPはコネクション型で...一方TCPは...")
- Protocol: Q-f121718d / Q-8975d381 (both -> "ウイルス対策などを行うセキュリティソフトのこと")
- DNS: Q-16f95438 / Q-0b0ac1a8 (both -> "ネットワーク上のデータを暗号化して保護する")
- HTTP: Q-e6aff7fb / Q-521221ad (both -> "サーバ間でファイルを安全に転送するためのプロトコル")
- Router: Q-216a6a61 / Q-78c6ad4c (both -> "ケーブルを使ってコンピュータ同士を直接接続する装置")
- OSI L3: Q-7c07a22d / Q-1b8993fb / Q-dc0853c3 (all -> "アプリケーション間でのデータ交換やセッション管理")
- OSI L4: Q-239b75a0 / Q-f6b23b36 (both -> "IPアドレスに基づくパケットのルーティングを行う")
- Load balancer: Q-79b2103d / Q-bb2f834c (both -> "ネットワーク上のトラフィック量をリアルタイムに監視する")
- ICMP: Q-411961f3 / Q-32678748 (both -> "ドメイン名をIPアドレスに解決するためのプロトコル")
- SMTP: Q-77e0e177 / Q-3fa20bd0 (both -> "HTML形式のWebページを転送するプロトコル")
- Port: Q-d0f60cdb / Q-fa9e72ad (both -> "ネットワーク機器に設けられた物理的なケーブル接続口")
- IP addr: Q-4e8ef81a / Q-0bf5cd88 (both -> "ブラウザでアクセスするWebサイトの名前のこと")
