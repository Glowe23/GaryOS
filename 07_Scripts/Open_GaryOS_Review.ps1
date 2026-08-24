# Opens GaryOS review files inside this repository.
$GaryOS = Split-Path -Parent $PSScriptRoot
$Files = @(
  '17_Improvement_Loop\Weekly_Improvement_Review.md',
  '17_Improvement_Loop\Improvement_Scorecard.md',
  '17_Improvement_Loop\Issue_Log.md',
  '17_Improvement_Loop\Prompt_Registry.md',
  '17_Improvement_Loop\Workflow_Registry.md',
  '17_Improvement_Loop\Test_Log.md',
  '05_Decisions\Decisions_Log.md',
  '04_Open_Loops\Open_Loops.md'
)
foreach ($File in $Files) {
  $Path = Join-Path $GaryOS $File
  if (Test-Path -LiteralPath $Path) { Start-Process -FilePath $Path }
}
