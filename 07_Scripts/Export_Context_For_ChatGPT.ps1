# Refreshes the ChatGPT context export from approved GaryOS files only.
$GaryOS = Split-Path -Parent $PSScriptRoot
$Export = Join-Path $GaryOS '21_Context_Exports\GaryOS_Context_For_ChatGPT.md'
$Log = Join-Path $GaryOS '21_Context_Exports\GaryOS_Context_Update_Log.md'
$Now = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$Sources = @(
  'GaryOS_Master_Instructions.md',
  '00_System_Profile\Machine_Profile.md',
  '11_AI_Tools\Tool_Routing_Matrix.md',
  '04_Open_Loops\Open_Loops.md',
  '05_Decisions\Decisions_Log.md',
  '17_Improvement_Loop\Self_Improvement_Rules.md'
)
$Content = "# GaryOS Context For ChatGPT`r`n`r`nGenerated: $Now`r`n`r`nThis export is generated only from approved local GaryOS files. Review before pasting into ChatGPT.`r`n"
foreach ($Source in $Sources) {
  $Path = Join-Path $GaryOS $Source
  if (Test-Path -LiteralPath $Path) {
    $Content += "`r`n`r`n## Source: $Source`r`n`r`n"
    $Content += Get-Content -LiteralPath $Path -Raw
  }
}
Set-Content -LiteralPath $Export -Value $Content -Encoding UTF8
Add-Content -LiteralPath $Log -Value "- ${Now}: Refreshed ChatGPT context export from approved GaryOS files." -Encoding UTF8
Write-Host "Refreshed $Export"
