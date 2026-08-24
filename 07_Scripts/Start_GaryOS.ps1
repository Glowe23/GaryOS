# Opens the main GaryOS files inside this repository.
$GaryOS = Split-Path -Parent $PSScriptRoot
$Files = @(
  'GaryOS_Master_Instructions.md',
  '00_System_Profile\Machine_Profile.md',
  '04_Open_Loops\Open_Loops.md',
  '05_Decisions\Decisions_Log.md',
  '17_Improvement_Loop\Issue_Log.md',
  '21_Context_Exports\GaryOS_Context_For_ChatGPT.md'
)
foreach ($File in $Files) {
  $Path = Join-Path $GaryOS $File
  if (Test-Path -LiteralPath $Path) { Start-Process -FilePath $Path }
}
