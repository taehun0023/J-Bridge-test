#Requires -Version 5.1
# 변경정리(비기술 / 화면별 원래→바뀜) 한글 XLSX. 무의존 OOXML 직접 조립.
$ErrorActionPreference = 'Stop'
$outPath = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\docs\변경정리_260604.xlsx'))

function Esc([string]$s) {
  if ($null -eq $s) { return '' }
  $s = $s -replace '&', '&amp;'
  $s = $s -replace '<', '&lt;'
  $s = $s -replace '>', '&gt;'
  $s = $s -replace '"', '&quot;'
  return $s
}
function ColLetter([int]$n) {
  $r = ''
  while ($n -gt 0) { $m = ($n - 1) % 26; $r = [char](65 + $m) + $r; $n = [int][math]::Floor(($n - 1) / 26) }
  return $r
}
function BuildRow([int]$rowNum, [string[]]$cells, [int]$styleId) {
  $sb = New-Object System.Text.StringBuilder
  [void]$sb.Append("<row r=""$rowNum"">")
  for ($i = 0; $i -lt $cells.Count; $i++) {
    $ref = (ColLetter ($i + 1)) + $rowNum
    $val = Esc $cells[$i]
    [void]$sb.Append("<c r=""$ref"" s=""$styleId"" t=""inlineStr""><is><t xml:space=""preserve"">$val</t></is></c>")
  }
  [void]$sb.Append("</row>")
  return $sb.ToString()
}

$HEADER = @('No','화면','URL','원래','바뀜','담당자','상태')

# 입력 1행: @(화면, URL, 원래, 바뀜)
$data = @(
  @('대시보드 진척표(관리자·멘토)','/dashboard','멘토와 관리자가 서로 다른 화면. 표 머리글 2줄, 시험·과제가 생활/비즈니스로 나뉨. 줄마다 과제 주는 버튼이 있었음.','멘토도 관리자와 같은 표. 머리글 1줄로 정리하고 목표레벨·시험레벨·이해도테스트·진척률 칸 추가. 줄별 버튼 제거, 이름을 누르면 리포트로 이동.'),
  @('대시보드 진척표','/dashboard','시험 점수가 합격점/내점수 순서. 미완료·전체진척이 전체 기준.','시험 점수를 내점수/합격점 순서로 변경. 미완료·전체진척을 생활일본어 기준으로 변경.'),
  @('대시보드 과제 주기 버튼','/dashboard','상단에 項目課題·一括割り当て 버튼.','상단을 課題(항목과제)·理解テスト(이해도테스트) 두 버튼으로 정리. 대상자를 골라 한번에 부여하고, 목표 레벨별 일괄 선택도 가능.'),
  @('대시보드 인사말','/dashboard','「〇〇님 — 전 사원의 일본어 진척 현황」 문구가 떠 있었음.','삭제.'),
  @('대시보드(학습자 화면)','/dashboard','학습자 대시보드 상단에 아무것도 없었음.','「이번 달 일본어 과제(JLPT)」 카드가 생겨 진척바로 표시.'),
  @('대시보드 이해도테스트 표시(버그 수정)','/dashboard','이해도테스트를 줘도 대시보드에 —/— 로 반영이 안 됐음.','합격수/부여개수로 제대로 표시되도록 수정.'),
  @('과제배분','/admin/tasks','과제 표 + 시험 승인요청 탭(승인/거부)이 있었고 통계 카드가 6개.','사람별로 접었다 펴는 목록으로 변경. 시험 승인 기능 삭제, 통계 카드 5개.'),
  @('과제배분','/admin/tasks','관리자에게 모든 멘티가 다 보였고, 과제 내용 수정이 안 됐음.','관리자에게는 과제를 받은 사람만 표시. 과제 제목·기한·설명·개수를 바로 수정 가능.'),
  @('과제배분 과제 제목','/admin/tasks','과제 제목이 「N1 漢字 170項目（月次自動）」 처럼 표시.','뒤의 「（月次自動）」 글자 삭제(기존에 쌓인 것도 정리 완료).'),
  @('사용자관리','/admin/users','칸이 11개(시험·과제·미완료·지연·이번달·전체진척 등)로 복잡, 머리글 2줄.','이름·메일·담당멘토·역할·등록일만 남긴 간단한 표. 가운데 정렬 + 세로 구분선, 이름 칸 내용만 왼쪽 정렬.'),
  @('사용자관리','/admin/users','「一括割り当て」 버튼과 줄마다 「課題」 버튼으로 과제를 줬음.','여기서는 과제 주는 기능을 전부 없앰.'),
  @('사용자관리 프로필 편집','/admin/users','이름은 그냥 글자였고, 수정은 줄 안의 작은 선택칸으로만 가능.','이름을 누르면 그 사람 프로필 편집 창이 뜸. 이름·역할·담당멘토·전문분야·목표자격·JLPT·IT자격·비밀번호 초기화까지 한 곳에서 수정.'),
  @('프로필','/profile','「개인정보와 학습상황을 확인하세요」 안내문과 「만나서 반갑습니다, 〜님!」 인사말 박스가 있었음.','둘 다 삭제.'),
  @('프로필','/profile','본인 로그인 아이디(메일)가 안 보였고, 이름칸·JLPT칸에 설명 문구가 있었음.','아이디(메일)를 보기 전용으로 표시. 설명 문구는 삭제.'),
  @('프로필 JLPT 선택','/profile','JLPT 자격 선택이 N5~N1만 있었음.','「없음」 선택지 추가.'),
  @('상단 헤더(공통)','전체 화면 공통','톱니바퀴(설정)를 눌러야 프로필로 갔고, 이름은 누를 수 없었음.','톱니바퀴 삭제. 이름을 누르면 프로필로 이동.'),
  @('일본어(JLPT)','/japanese/jlpt','한자 진척을 100개까지만 셌음.','실제 전체 개수로 셈.'),
  @('왼쪽 메뉴(사이드바)','전체 화면 공통','메뉴 이름이 「生活日本語」.','「JLPT」로 변경.'),
  @('종합시험','공통','신청 후 승인을 받아야 응시할 수 있었음.','신청하면 바로 응시 가능(승인 불필요).'),
  @('멘토 대시보드','/mentor','담당 멘티 목록 순서가 일정하지 않았음.','이름순으로 정렬.'),
  @('이름 표시(공통)','전체 화면 공통','이름 위 후리가나(읽는 법) 글자가 작았음.','조금 키워 가독성 개선.'),
  @('공지 목록','/dashboard','공지 목록이 카드형이었음.','줄 구분선 형태로 변경.')
)

$sheetSb = New-Object System.Text.StringBuilder
[void]$sheetSb.Append('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
[void]$sheetSb.Append('<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">')
[void]$sheetSb.Append('<cols>')
$widths = @(5,26,20,58,58,12,10)
for ($i = 0; $i -lt $widths.Count; $i++) { $c = $i + 1; [void]$sheetSb.Append("<col min=""$c"" max=""$c"" width=""$($widths[$i])"" customWidth=""1""/>") }
[void]$sheetSb.Append('</cols>')
[void]$sheetSb.Append('<sheetData>')
[void]$sheetSb.Append((BuildRow 1 $HEADER 1))
$rn = 2; $no = 1
foreach ($r in $data) {
  $full = @("$no", $r[0], $r[1], $r[2], $r[3], '', '')
  [void]$sheetSb.Append((BuildRow $rn $full 2))
  $rn++; $no++
}
[void]$sheetSb.Append('</sheetData>')
[void]$sheetSb.Append('<autoFilter ref="A1:G1"/>')
[void]$sheetSb.Append('</worksheet>')
$sheetXml = $sheetSb.ToString()

$contentTypes = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/><Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/><Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/></Types>
'@
$relsRoot = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/></Relationships>
'@
$workbook = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><sheets><sheet name="変更정리" sheetId="1" r:id="rId1"/></sheets></workbook>
'@
$workbookRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/></Relationships>
'@
$styles = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><fonts count="2"><font><sz val="11"/><name val="Meiryo UI"/></font><font><b/><sz val="11"/><color rgb="FFFFFFFF"/><name val="Meiryo UI"/></font></fonts><fills count="3"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="gray125"/></fill><fill><patternFill patternType="solid"><fgColor rgb="FF4472C4"/><bgColor indexed="64"/></patternFill></fill></fills><borders count="2"><border><left/><right/><top/><bottom/><diagonal/></border><border><left style="thin"><color rgb="FFB0B0B0"/></left><right style="thin"><color rgb="FFB0B0B0"/></right><top style="thin"><color rgb="FFB0B0B0"/></top><bottom style="thin"><color rgb="FFB0B0B0"/></bottom><diagonal/></border></borders><cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs><cellXfs count="3"><xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/><xf numFmtId="0" fontId="1" fillId="2" borderId="1" xfId="0" applyFont="1" applyFill="1" applyBorder="1" applyAlignment="1"><alignment horizontal="center" vertical="center" wrapText="1"/></xf><xf numFmtId="0" fontId="0" fillId="0" borderId="1" xfId="0" applyBorder="1" applyAlignment="1"><alignment vertical="top" wrapText="1"/></xf></cellXfs><cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles></styleSheet>
'@

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
if (Test-Path $outPath) { Remove-Item $outPath -Force }
$enc = New-Object System.Text.UTF8Encoding($false)
$fs  = [System.IO.File]::Open($outPath, [System.IO.FileMode]::Create)
$zip = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)
function AddEntry($zip, $name, $content, $enc) {
  $entry = $zip.CreateEntry($name, [System.IO.Compression.CompressionLevel]::Optimal)
  $stream = $entry.Open(); $bytes = $enc.GetBytes($content); $stream.Write($bytes, 0, $bytes.Length); $stream.Dispose()
}
AddEntry $zip '[Content_Types].xml'        $contentTypes $enc
AddEntry $zip '_rels/.rels'                $relsRoot     $enc
AddEntry $zip 'xl/workbook.xml'            $workbook     $enc
AddEntry $zip 'xl/_rels/workbook.xml.rels' $workbookRels $enc
AddEntry $zip 'xl/styles.xml'              $styles       $enc
AddEntry $zip 'xl/worksheets/sheet1.xml'   $sheetXml     $enc
$zip.Dispose(); $fs.Close()

Write-Output ("생성: {0}" -f $outPath)
Write-Output ("행수(헤더 제외): {0}" -f $data.Count)

# ---- 검증: 각 XML 파트가 정상 파싱되는지 ----
$z = [System.IO.Compression.ZipFile]::OpenRead($outPath)
$ok = $true
foreach ($name in @('[Content_Types].xml','_rels/.rels','xl/workbook.xml','xl/_rels/workbook.xml.rels','xl/styles.xml','xl/worksheets/sheet1.xml')) {
  $e = $z.GetEntry($name)
  if (-not $e) { Write-Output "  [누락] $name"; $ok = $false; continue }
  $sr = New-Object System.IO.StreamReader($e.Open(), (New-Object System.Text.UTF8Encoding($false)))
  $xmlText = $sr.ReadToEnd(); $sr.Close()
  try { [xml]$null = $xmlText; Write-Output "  [OK] $name" }
  catch { Write-Output "  [XML오류] $name : $($_.Exception.Message)"; $ok = $false }
}
$z.Dispose()
Write-Output ("검증결과: {0}" -f ($(if ($ok) { '정상 (모든 파트 well-formed)' } else { '오류 있음' })))
