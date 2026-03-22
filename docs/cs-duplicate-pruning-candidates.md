# CS Duplicate Pruning Candidates

## Purpose
- This document captures obvious duplicate-question groups found in the current published CS bank.
- It exists so duplicate cleanup can happen before the final cleaned-inventory recount.
- Only exact same `question_text` duplicates are listed here.

## Rule Of Use
- Keep the stronger version only.
- Prefer the row that already has:
  - explicit difficulty
  - cleaner wording
  - better distractor quality
- Delete or quarantine the weaker duplicate after content review.

## Duplicate Groups

### `computer_architecture`
- `命令を主に実行する装置はどれか。`
  - keep one:
    - `ed21380a-f5d4-4bb8-ae1a-3e7a57c594d3` (`easy`)
    - `b37ca75a-8e13-4301-93ce-095dbb8111eb` (`easy`)
- `RAMの主な役割はどれか。`
  - keep one:
    - `ac5c08fc-c575-4606-96e1-56f5b0a09f36` (`easy`)
    - `7ddc89bb-d749-4513-b313-b1a22d2c51af` (`easy`)
- `割込みを最も適切に説明しているものはどれか。`
  - keep one:
    - `528374e8-00db-44e0-939d-e0e020a5b114` (`medium`)
    - `0118cfb6-e174-4fa4-805c-2d8e12673f25` (`medium`)
- `補助記憶装置が主記憶装置と異なる点として適切なものはどれか。`
  - keep one:
    - `42b4a9c4-db49-46b4-b6ed-acf3b090d13e` (`medium`)
    - `0faf579b-34ca-4bfe-ac36-924704c079fb` (`medium`)
- `キャッシュミスが起こりやすい状況はどれか。`
  - keep one:
    - `367178a2-ff87-4aaa-8c70-ddab32107914` (`hard`)
    - `0fd26370-fd67-4c7a-a01d-259ddb57cc0f` (`hard`)

### `network`
- `TCPとUDPの違いとして正しいものはどれか。`
  - prefer the explicit-difficulty row:
    - `4a95ffdb-046e-42d7-90df-6d9f0472710a` (`easy`)
    - `6637de53-593c-4282-82ae-cd19190032bd` (`unset`)

### `os`
- `プロセスとスレッドの違いとして正しいものはどれか。`
  - prefer the explicit-difficulty row:
    - `396be538-af4e-4103-921b-14004038089b` (`easy`)
    - `dd996a7e-3fc3-4ff1-8a50-abfabc02eaba` (`unset`)
- `ページングの説明として正しいものはどれか。`
  - prefer the explicit-difficulty row:
    - `93b5a028-148a-410d-a97e-e209c3e74f45` (`medium`)
    - `50bba785-d14f-4526-a80c-9380918ef2fc` (`unset`)
- `デッドロックの説明として正しいものはどれか。`
  - both are `unset`, so wording/distractor quality review required:
    - `a4659253-e40e-4e39-b40f-3757a5d1a81d`
    - `41ddb427-9b7f-49d2-8c0a-96c4698996ba`

### `algorithm`
- `安定ソートの説明として正しいものはどれか。`
  - prefer the explicit-difficulty row unless wording is weaker:
    - `7e5062bc-c784-4f1d-8fed-ed37312a0da4` (`unset`)
    - `8104c9e1-91dc-4049-b18a-15a4c099c553` (`easy`)
- `クイックソートの平均時間計算量はどれか。`
  - prefer the explicit-difficulty row unless out-of-scope decision removes both:
    - `767ea5fd-1944-4be1-b6f7-77197be0d2f3` (`medium`)
    - `b7506d1c-5af2-439e-95c7-2bd226d95325` (`unset`)
- `マージソートの特徴として正しいものはどれか。`
  - prefer the explicit-difficulty row:
    - `e74bdf6f-92d1-4d4a-93cf-247f1cfdb680` (`medium`)
    - `3c729280-7160-4ca5-9df2-570b4f6b44fa` (`unset`)

### `database`
- `NoSQLデータベースの特徴として正しいものはどれか。`
  - both likely excluded as out-of-scope for the current DB course, but keep only one until removal is finalized:
    - `fcc61e64-c07e-48e3-8cd7-3b4d05f4e5d0` (`medium`)
    - `21e6ec52-718c-4af8-84b5-9deede0bcaa7` (`unset`)

### `security`
- `共通鍵暗号方式の特徴として正しいものはどれか。`
  - both likely out-of-scope for current lessons, but prefer explicit row if temporarily retained:
    - `53e0dbcd-5100-4250-95a1-495398c79638` (`easy`)
    - `5f0a7731-4c7e-4c6e-aa09-7e67b31d0684` (`unset`)
- `ハッシュ関数の特徴として正しいものはどれか。`
  - prefer the explicit-difficulty row:
    - `5295ae37-0be9-400e-afce-b0d9070c1f60` (`easy`)
    - `896270d4-c380-4530-af66-e9a45dfc1b0a` (`unset`)
- `デジタル署名の目的として正しいものはどれか。`
  - both likely out-of-scope for current lessons, but prefer explicit row if temporarily retained:
    - `d700383b-5958-47df-bfc3-e41f2f19bf9f` (`medium`)
    - `1e97a90c-19ff-4c9a-a4c4-8c3e8c0dd642` (`unset`)

## Immediate Cleanup Recommendations
1. Remove exact duplicates inside `computer_architecture` first.
2. Remove `unset` duplicates when an explicit-difficulty equivalent already exists.
3. Do not spend rewrite time on duplicate groups that are already classified as likely `out_of_scope`.
4. Recount category inventory after duplicate cleanup before locking shortage numbers.
