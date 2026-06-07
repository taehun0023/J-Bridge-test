<#
.SYNOPSIS
  BFF 契約 (B-1) スモークテスト: GET /api/jbridge/users/{email}/readiness

.DESCRIPTION
  ローカル (npm run dev → http://localhost:3000) または デプロイ URL に対して
  401 / 404 / 200 の 3 シナリオを curl 相当 (Invoke-WebRequest) で検証する。

  前提: 対象サーバに WEAVUSYS_API_KEY が設定されていること。
  本スクリプトは実シークレットを必要とするため、人手で API キー・実在 email を渡す。

.EXAMPLE
  ./scripts/bff-readiness-contract-smoke.ps1 `
      -BaseUrl "http://localhost:3000" `
      -ApiKey  "<WEAVUSYS_API_KEY>" `
      -ValidEmail "real-user@example.com"

.NOTES
  自動化テスト (シークレット不要) は次を参照:
    src/app/api/jbridge/users/[email]/readiness/route.test.ts  (vitest)
#>
param(
    [string]$BaseUrl    = "http://localhost:3000",
    [Parameter(Mandatory = $true)][string]$ApiKey,
    [Parameter(Mandatory = $true)][string]$ValidEmail,
    [string]$MissingEmail = "no-such-user-zzz@example.com"
)

$ErrorActionPreference = "Stop"
$path = "/api/jbridge/users"
$pass = 0; $fail = 0

function Test-Case {
    param([string]$Name, [int]$ExpectStatus, [hashtable]$Headers, [string]$Email)
    $url = "$BaseUrl$path/$([uri]::EscapeDataString($Email))/readiness"
    try {
        $resp = Invoke-WebRequest -Uri $url -Headers $Headers -Method GET -SkipHttpErrorCheck
        $status = [int]$resp.StatusCode
    } catch {
        $status = [int]$_.Exception.Response.StatusCode.value__
    }
    if ($status -eq $ExpectStatus) {
        Write-Host "[PASS] $Name -> $status" -ForegroundColor Green
        $script:pass++
    } else {
        Write-Host "[FAIL] $Name -> expected $ExpectStatus, got $status" -ForegroundColor Red
        $script:fail++
    }
    return $resp
}

Write-Host "=== BFF B-1 契約スモーク: $BaseUrl ===" -ForegroundColor Cyan

# (a) キーなし -> 401
Test-Case -Name "(a) no Authorization header -> 401" -ExpectStatus 401 `
    -Headers @{} -Email $ValidEmail | Out-Null

# (a') 不正キー -> 401
Test-Case -Name "(a') wrong API key -> 401" -ExpectStatus 401 `
    -Headers @{ Authorization = "Bearer wrong-key" } -Email $ValidEmail | Out-Null

# (b) 正しいキー + 存在しない email -> 404
Test-Case -Name "(b) valid key + missing email -> 404" -ExpectStatus 404 `
    -Headers @{ Authorization = "Bearer $ApiKey" } -Email $MissingEmail | Out-Null

# (c) 正しいキー + 正常 -> 200 + 9 フィールド
$ok = Test-Case -Name "(c) valid key + valid email -> 200" -ExpectStatus 200 `
    -Headers @{ Authorization = "Bearer $ApiKey" } -Email $ValidEmail
if ($ok -and [int]$ok.StatusCode -eq 200) {
    $body = $ok.Content | ConvertFrom-Json
    $expected = @(
        'jlpt_score','it_japanese_score','core_programming_score','framework_score',
        'attitude_culture_score','overall_score','is_japanese','jlpt_level','recorded_at'
    ) | Sort-Object
    $actual = ($body.PSObject.Properties.Name | Sort-Object)
    if (($actual -join ',') -eq ($expected -join ',')) {
        Write-Host "       [PASS] response has exactly 9 B-1 contract fields" -ForegroundColor Green
        $pass++
    } else {
        Write-Host "       [FAIL] field mismatch. got: $($actual -join ',')" -ForegroundColor Red
        $fail++
    }
}

Write-Host "`n=== RESULT: PASS=$pass FAIL=$fail ===" -ForegroundColor Cyan
if ($fail -gt 0) { exit 1 }
