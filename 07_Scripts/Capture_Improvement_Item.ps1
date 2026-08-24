# Appends a GaryOS improvement item inside this repository.
param(
  [Parameter(Mandatory=$true)][string]$Item,
  [string]$Category = 'General',
  [string]$Impact = 'Medium',
  [string]$Priority = 'Medium',
  [string]$NextAction = 'Scope and decide next step'
)
$GaryOS = Split-Path -Parent $PSScriptRoot
$IssueLog = Join-Path $GaryOS '17_Improvement_Loop\Issue_Log.md'
$Now = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$Entry = @"

## Improvement Item - $Now

- Issue: $Item
- Category: $Category
- Impact: $Impact
- Priority: $Priority
- Next action: $NextAction
- Status: Open
"@
Add-Content -LiteralPath $IssueLog -Value $Entry -Encoding UTF8
Write-Host "Captured improvement item in $IssueLog"
