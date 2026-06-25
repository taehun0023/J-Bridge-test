#Requires -Version 5.1
# テスト仕様書（名前表記・プロフィール・ダッシュボード）.xlsx を生成する
# 依存ライブラリなし（.NET System.IO.Compression で OOXML を直接組み立てる）

$ErrorActionPreference = 'Stop'

# ---- 出力先 ----------------------------------------------------------------
$outDir  = Join-Path $PSScriptRoot '..\docs'
$outPath = Join-Path $outDir 'テスト仕様書_名前-プロフィール-ダッシュボード.xlsx'
$outPath = [System.IO.Path]::GetFullPath($outPath)

# ---- ヘルパ -----------------------------------------------------------------
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
  while ($n -gt 0) {
    $m = ($n - 1) % 26
    $r = [char](65 + $m) + $r
    $n = [int][math]::Floor(($n - 1) / 26)
  }
  return $r
}

# 1行を生成（$cells は12要素の文字列配列、$styleId はセルスタイル）
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

$HEADER = @('No','テスト項目','ログインユーザー','前提条件','テスト手順','テスト内容','期待結果','実際結果','判定','確認日','確認者','備考')

# row データ → 12列に整形（No 自動採番 / 実際結果・判定・確認日・確認者は空欄）
# 入力: @(項目, ユーザー, 前提条件, 手順, 内容, 期待結果, 備考)
function ToFullRow([int]$no, [string[]]$r) {
  return @("$no", $r[0], $r[1], $r[2], $r[3], $r[4], $r[5], '', '', '', '', $r[6])
}

function BuildSheetXml([object[]]$rows) {
  $sb = New-Object System.Text.StringBuilder
  [void]$sb.Append('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
  [void]$sb.Append('<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">')
  [void]$sb.Append('<cols>')
  $widths = @(5,20,15,30,40,40,40,22,8,12,12,28)
  for ($i = 0; $i -lt $widths.Count; $i++) {
    $c = $i + 1
    [void]$sb.Append("<col min=""$c"" max=""$c"" width=""$($widths[$i])"" customWidth=""1""/>")
  }
  [void]$sb.Append('</cols>')
  [void]$sb.Append('<sheetData>')
  [void]$sb.Append((BuildRow 1 $HEADER 1))
  $rn = 2
  $no = 1
  foreach ($r in $rows) {
    $full = ToFullRow $no $r
    [void]$sb.Append((BuildRow $rn $full 2))
    $rn++; $no++
  }
  [void]$sb.Append('</sheetData>')
  [void]$sb.Append('<autoFilter ref="A1:L1"/>')
  [void]$sb.Append('</worksheet>')
  return $sb.ToString()
}

# ====================================================================
#  テストケース定義
#  各行: @(テスト項目, ログインユーザー, 前提条件, テスト手順, テスト内容, 期待結果, 備考)
# ====================================================================

$sheet1 = @(  # 名前表記
  @('ヘッダー名前表示','一般ユーザー','漢字名・カタカナ名が登録済み','ログイン後、画面右上ヘッダーのユーザー名を確認する','ヘッダーに漢字名のみが表示されることを確認する','漢字名のみが表示され、カタカナ名は表示されない','例:「森 亮太」'),
  @('一覧のふりがな表示','メンター','担当メンティに漢字名・カタカナ名が登録済み','担当メンティ一覧を表示する','各氏名が漢字の上にカタカナ（ふりがな形式）で表示されることを確認する','漢字の上段に小さくカタカナが表示される','添付画像と同じ表示形式'),
  @('カタカナ名未登録時の表示','メンター','カタカナ名が未登録のメンティが存在','当該メンティの一覧表示を確認する','カタカナ名が無い場合の表示崩れが無いことを確認する','漢字名のみ表示され、レイアウトが崩れない',''),
  @('漢字名未登録時の表示','一般ユーザー','漢字名が未登録','ヘッダー・一覧を確認する','漢字名が無い場合の代替表示を確認する','カタカナ名またはメール等の代替が表示され、エラーにならない',''),
  @('管理者ダッシュボードの名前表示','管理者','社員に漢字名・カタカナ名が登録済み','ダッシュボードの全社員一覧を確認する','一覧の名前列がふりがな形式で表示されることを確認する','漢字の上にカタカナが表示される',''),
  @('漢字・カタカナ両方での検索','管理者','社員一覧が表示されている','検索欄に漢字名／カタカナ名を入力する','漢字・カタカナどちらでも検索できることを確認する','入力に一致する社員が絞り込まれる',''),
  @('ランキング画面の名前表示','一般ユーザー','ランキングデータが存在','ランキング画面を表示する','ランキングの氏名表示形式を確認する','規定の表示形式で統一して表示される',''),
  @('通知・フィードバックの名前表示','メンター','通知が存在','通知一覧・フィードバック画面を確認する','各画面の氏名表記が統一されていることを確認する','全画面で表記ルールが統一されている','表記揺れ（漢字/カタカナ混在）が無いこと')
)

$sheet2 = @(  # プロフィール画面
  @('基本情報の表示','一般ユーザー','ログイン済み','プロフィール画面を開く','基本情報に漢字名・カタカナ名・担当メンターが表示されることを確認する','3項目が表示される',''),
  @('漢字名の編集・保存','一般ユーザー','プロフィール画面表示中','漢字名を変更し保存ボタンを押下する','漢字名が保存されることを確認する','保存成功メッセージが表示され、再読込後も反映される',''),
  @('カタカナ名の編集・保存','一般ユーザー','プロフィール画面表示中','カタカナ名を変更し保存ボタンを押下する','カタカナ名が保存されることを確認する','保存成功メッセージが表示され、再読込後も反映される',''),
  @('カタカナ名のバリデーション','一般ユーザー','プロフィール画面表示中','カタカナ名に漢字・ひらがなを入力し保存する','カタカナ以外の入力が弾かれることを確認する','バリデーションエラーが表示される、またはカタカナのみ受理される','仕様要確認'),
  @('担当メンター表示（利用者）','メンティ','担当メンターが割当済み','プロフィールの担当メンター欄を確認する','担当メンター名が表示されることを確認する','割り当てられたメンター名が読み取り専用で表示される',''),
  @('担当メンター欄の非活性','管理者','-','プロフィール画面を開く','利用者（メンティ）以外で担当メンター欄が非活性／非表示であることを確認する','メンティ以外では活性化されない',''),
  @('JLPT資格の選択・保存','一般ユーザー','プロフィール画面表示中','資格情報のJLPTレベルを選択し保存する','JLPTレベルが保存されることを確認する','保存成功し、再読込後も反映される',''),
  @('IT関連資格の複数選択','一般ユーザー','プロフィール画面表示中','IT関連資格の多重選択ドロップダウンで複数選択し保存する','複数の資格が選択・保存できることを確認する','選択した複数の資格が保存・表示される','多重選択ドロップダウン仕様'),
  @('IT関連資格の選択解除','一般ユーザー','資格が選択済み','一部の資格を選択解除し保存する','選択解除が反映されることを確認する','解除した資格が一覧から外れる',''),
  @('パスワード変更（正常）','一般ユーザー','ログイン済み','新パスワード（6文字以上）と確認用に同じ値を入力し変更する','正しくパスワードが変更できることを確認する','変更成功メッセージが表示され、新パスワードでログインできる',''),
  @('パスワード変更（不一致）','一般ユーザー','ログイン済み','新パスワードと確認用に異なる値を入力する','不一致時にエラーとなることを確認する','「パスワードが一致しません」エラーが表示される',''),
  @('パスワード変更（桁数不足）','一般ユーザー','ログイン済み','6文字未満のパスワードを入力する','桁数不足時にエラーとなることを確認する','「パスワードは6文字以上必要です」エラーが表示される','')
)

$sheet3 = @(  # メンターダッシュボード
  @('ダッシュボード表示','メンター','担当メンティが存在','メンターでログインしダッシュボードを開く','担当メンティ一覧が表形式で表示されることを確認する','各メンティの行が表示される','課題完了中心から学習進捗中心への改修'),
  @('試験列（生活日本語）','メンター','メンティが生活日本語試験を受験済み','一覧の試験―生活日本語列を確認する','最新の有効な生活日本語スコアが表示されることを確認する','点数が表示される','各領域の最新有効スコアを反映'),
  @('試験列（ビジネス日本語）','メンター','メンティがビジネス日本語試験を受験済み','一覧の試験―ビジネス日本語列を確認する','最新の有効なビジネス日本語スコアが表示されることを確認する','点数が表示される',''),
  @('課題列（生活日本語）','メンター','生活日本語課題が配信済み','課題―生活日本語列を確認する','完了数／全体数が表示されることを確認する','例:120/450 の形式で表示される',''),
  @('課題列（ビジネス日本語）','メンター','ビジネス日本語課題が配信済み','課題―ビジネス日本語列を確認する','完了数／全体数が表示されることを確認する','例:110/450 の形式で表示される',''),
  @('未完了数','メンター','過去月含め未完了課題が存在','未完了列を確認する','過去月を含む未完了課題数が表示されることを確認する','累積の未完了件数が表示される',''),
  @('遅延数','メンター','締切超過の未完了課題が存在','遅延列を確認する','締切を過ぎた未完了課題数が表示されることを確認する','遅延件数が表示され、0より大きい場合は強調表示される',''),
  @('今月進捗','メンター','今月分の課題が配信済み','今月進捗列を確認する','今月の完了数／全体数が表示されることを確認する','例:230/300 の形式で表示される',''),
  @('全体進捗','メンター','課題が配信済み','全体進捗列を確認する','全体の完了数／全体数が表示されることを確認する','例:880/1100 の形式で表示される',''),
  @('学習中／停滞の判別','メンター','課題未完了だが内部問題を解いている','一覧の進捗値を確認する','課題未完了でも学習が進行中か判別できることを確認する','進捗値の増加により「学習中」か「停滞」かを判断できる','本改修の主目的'),
  @('データ無しメンティの表示','メンター','試験・課題未実施のメンティが存在','当該行を確認する','値が0または「―」で表示されエラーにならないことを確認する','0／―表示となり、レイアウトが崩れない',''),
  @('担当外メンティの非表示','メンター','担当外のメンティが存在','一覧を確認する','自分の担当メンティのみ表示されることを確認する','担当外のメンティは表示されない','')
)

$sheet4 = @(  # 管理者ダッシュボード
  @('ダッシュボード表示','管理者','社員データが登録されている','管理者でログインしダッシュボードを開く','全社員一覧が表形式で表示されることを確認する','全社員の行が表示される',''),
  @('担当メンター列','管理者','メンターが割り当て済み','担当メンター列を確認する','各社員の担当メンター名が表示されることを確認する','メンター名が表示され、未割当は「―」表示',''),
  @('試験列（生活／ビジネス）','管理者','社員が試験を受験済み','試験―生活日本語／ビジネス日本語列を確認する','各社員の最新有効試験スコアが表示されることを確認する','各領域の点数が表示される',''),
  @('課題列（生活／ビジネス）','管理者','課題が配信済み','課題―生活日本語／ビジネス日本語列を確認する','完了数／全体数が表示されることを確認する','例:90/150 の形式で表示される',''),
  @('未完了・遅延数','管理者','未完了／締切超過課題が存在','未完了・遅延列を確認する','各社員の未完了数・遅延数が表示されることを確認する','件数が表示され、遅延>0は強調表示される',''),
  @('今月進捗・全体進捗','管理者','課題が配信済み','今月進捗・全体進捗列を確認する','今月／全体の完了数・全体数が表示されることを確認する','例:180/300、720/1000 の形式で表示される',''),
  @('検索（名前・メール・メンター）','管理者','社員一覧が表示されている','検索欄に名前・メール・メンター名を入力する','3項目で絞り込み検索できることを確認する','入力に一致する社員のみ表示される',''),
  @('進捗の昇順ソート','管理者','社員一覧が表示されている','一覧の並び順を確認する','全体進捗が低い順に並ぶことを確認する','進捗の低い社員が上位に表示される','遅れている社員を優先把握'),
  @('全ユーザー試験結果表示','管理者','社員が試験を受験済み','試験結果一覧を確認する','全ユーザーの試験結果が確認できることを確認する','全社員の試験結果が表示される',''),
  @('メンティ詳細への遷移','管理者','社員一覧が表示されている','一覧の名前リンクを押下する','レポート画面へ遷移することを確認する','該当メンティのレポート画面（/admin/reports）へ遷移する',''),
  @('過題配信UIの効率化','管理者','課題配信画面を開く','課題を一括／効率的に配信する操作を行う','改善された課題配信UIで効率的に配信できることを確認する','対象選択・配信操作がスムーズに行える','課題配信UI改善要件')
)

# ====================================================================
#  OOXML パーツ組み立て
# ====================================================================

$contentTypes = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/><Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/><Override PartName="/xl/worksheets/sheet2.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/><Override PartName="/xl/worksheets/sheet3.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/><Override PartName="/xl/worksheets/sheet4.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/><Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/></Types>
'@

$relsRoot = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/></Relationships>
'@

$workbook = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><sheets><sheet name="名前表記" sheetId="1" r:id="rId1"/><sheet name="プロフィール" sheetId="2" r:id="rId2"/><sheet name="メンターDB" sheetId="3" r:id="rId3"/><sheet name="管理者DB" sheetId="4" r:id="rId4"/></sheets></workbook>
'@

$workbookRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet2.xml"/><Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet3.xml"/><Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet4.xml"/><Relationship Id="rId5" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/></Relationships>
'@

$styles = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><fonts count="2"><font><sz val="11"/><name val="Meiryo UI"/></font><font><b/><sz val="11"/><color rgb="FFFFFFFF"/><name val="Meiryo UI"/></font></fonts><fills count="3"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="gray125"/></fill><fill><patternFill patternType="solid"><fgColor rgb="FF4472C4"/><bgColor indexed="64"/></patternFill></fill></fills><borders count="2"><border><left/><right/><top/><bottom/><diagonal/></border><border><left style="thin"><color rgb="FFB0B0B0"/></left><right style="thin"><color rgb="FFB0B0B0"/></right><top style="thin"><color rgb="FFB0B0B0"/></top><bottom style="thin"><color rgb="FFB0B0B0"/></bottom><diagonal/></border></borders><cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs><cellXfs count="3"><xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/><xf numFmtId="0" fontId="1" fillId="2" borderId="1" xfId="0" applyFont="1" applyFill="1" applyBorder="1" applyAlignment="1"><alignment horizontal="center" vertical="center" wrapText="1"/></xf><xf numFmtId="0" fontId="0" fillId="0" borderId="1" xfId="0" applyBorder="1" applyAlignment="1"><alignment vertical="top" wrapText="1"/></xf></cellXfs><cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles></styleSheet>
'@

$sheetXml1 = BuildSheetXml $sheet1
$sheetXml2 = BuildSheetXml $sheet2
$sheetXml3 = BuildSheetXml $sheet3
$sheetXml4 = BuildSheetXml $sheet4

# ---- ZIP 書き出し（エントリ名はスラッシュ区切り固定） -------------------------
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

if (Test-Path $outPath) { Remove-Item $outPath -Force }
$enc = New-Object System.Text.UTF8Encoding($false)
$fs  = [System.IO.File]::Open($outPath, [System.IO.FileMode]::Create)
$zip = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)

function AddEntry($zip, $name, $content, $enc) {
  $entry  = $zip.CreateEntry($name, [System.IO.Compression.CompressionLevel]::Optimal)
  $stream = $entry.Open()
  $bytes  = $enc.GetBytes($content)
  $stream.Write($bytes, 0, $bytes.Length)
  $stream.Dispose()
}

AddEntry $zip '[Content_Types].xml'        $contentTypes $enc
AddEntry $zip '_rels/.rels'                $relsRoot     $enc
AddEntry $zip 'xl/workbook.xml'            $workbook     $enc
AddEntry $zip 'xl/_rels/workbook.xml.rels' $workbookRels $enc
AddEntry $zip 'xl/styles.xml'              $styles       $enc
AddEntry $zip 'xl/worksheets/sheet1.xml'   $sheetXml1    $enc
AddEntry $zip 'xl/worksheets/sheet2.xml'   $sheetXml2    $enc
AddEntry $zip 'xl/worksheets/sheet3.xml'   $sheetXml3    $enc
AddEntry $zip 'xl/worksheets/sheet4.xml'   $sheetXml4    $enc

$zip.Dispose()
$fs.Close()

Write-Output "生成完了: $outPath"
Write-Output ("ケース数: 名前表記={0} / プロフィール={1} / メンターDB={2} / 管理者DB={3}" -f $sheet1.Count, $sheet2.Count, $sheet3.Count, $sheet4.Count)
