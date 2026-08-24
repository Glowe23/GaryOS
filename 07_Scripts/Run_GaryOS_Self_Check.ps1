# Checks required GaryOS folders and files, then writes a local report inside this repository.
$GaryOS = Split-Path -Parent $PSScriptRoot
$Report = Join-Path $GaryOS '08_Reports\GaryOS_Self_Check_Report.md'
$Now = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$RequiredFolders = @('00_System_Profile','01_Inbox','02_Daily_Briefs','03_Weekly_Reviews','04_Open_Loops','05_Decisions','06_Automations','07_Scripts','08_Reports','09_AC4S_Intelligence','10_Client_Work','11_AI_Tools','12_Prompts','13_SOPs','14_Safety_Rules','15_Backups','16_Archive','17_Improvement_Loop','18_Testing','19_Release_Notes','20_Knowledge_Base','21_Context_Exports','22_Sync_Plans','23_Tool_Maps','24_Approval_Queue','25_System_Maps','26_Runbooks','27_Quality_Scores')
$RequiredFiles = @('00_System_Profile\Machine_Profile.md','08_Reports\Machine_Audit_Report.md','17_Improvement_Loop\Self_Improvement_Rules.md','11_AI_Tools\Tool_Routing_Matrix.md','21_Context_Exports\GaryOS_Context_For_ChatGPT.md','18_Testing\Test_Cases_Index.md')
$Lines = @("# GaryOS Self Check Report", "", "Generated: $Now", "", "## Folders")
foreach ($Folder in $RequiredFolders) {
  $Path = Join-Path $GaryOS $Folder
  $Status = if (Test-Path -LiteralPath $Path) { 'OK' } else { 'Missing' }
  $Lines += "- ${Folder}: $Status"
}
$Lines += ""
$Lines += "## Files"
foreach ($File in $RequiredFiles) {
  $Path = Join-Path $GaryOS $File
  $Status = if (Test-Path -LiteralPath $Path) { 'OK' } else { 'Missing' }
  $Lines += "- ${File}: $Status"
}
Set-Content -LiteralPath $Report -Value ($Lines -join "`r`n") -Encoding UTF8
Write-Host "Wrote $Report"
