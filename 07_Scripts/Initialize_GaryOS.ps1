$ErrorActionPreference = 'Stop'
$GaryOS = Split-Path -Parent $PSScriptRoot
$Folders = @(
    '00_System_Profile','01_Inbox','02_Daily_Briefs','03_Weekly_Reviews','04_Open_Loops','05_Decisions',
    '06_Automations','07_Scripts','08_Reports','09_AC4S_Intelligence','10_Client_Work','11_AI_Tools',
    '12_Prompts','13_SOPs','14_Safety_Rules','15_Backups','16_Archive','17_Improvement_Loop','18_Testing',
    '19_Release_Notes','20_Knowledge_Base','21_Context_Exports','22_Sync_Plans','23_Tool_Maps',
    '24_Approval_Queue','25_System_Maps','26_Runbooks','27_Quality_Scores'
)

foreach ($Folder in $Folders) {
    New-Item -ItemType Directory -Path (Join-Path $GaryOS $Folder) -Force | Out-Null
}

$Files = [ordered]@{
    '00_System_Profile\Machine_Profile.md' = "# Machine Profile`r`n`r`nLocal machine information. Keep this file private."
    '04_Open_Loops\Open_Loops.md' = "# Open Loops`r`n`r`n| Date opened | Item | Owner | Priority | Next action | Deadline | Status |`r`n|---|---|---|---|---|---|---|"
    '05_Decisions\Decisions_Log.md' = "# Decisions Log`r`n`r`n| Date | Decision | Facts | Assumptions | Risks | Owner | Review date |`r`n|---|---|---|---|---|---|---|"
    '08_Reports\Machine_Audit_Report.md' = "# Machine Audit Report`r`n`r`nLocal report. Keep this file private."
    '11_AI_Tools\Tool_Routing_Matrix.md' = "# Tool Routing Matrix`r`n`r`nDocument which tool should perform each job, what it may access, and what requires approval."
    '17_Improvement_Loop\Self_Improvement_Rules.md' = "# Self Improvement Rules`r`n`r`nImprove through evidence. Test important changes. Record decisions. Preserve originals. Require approval for sensitive actions."
    '17_Improvement_Loop\Issue_Log.md' = "# Issue Log`r`n"
    '17_Improvement_Loop\Weekly_Improvement_Review.md' = "# Weekly Improvement Review`r`n"
    '17_Improvement_Loop\Improvement_Scorecard.md' = "# Improvement Scorecard`r`n"
    '17_Improvement_Loop\Prompt_Registry.md' = "# Prompt Registry`r`n"
    '17_Improvement_Loop\Workflow_Registry.md' = "# Workflow Registry`r`n"
    '17_Improvement_Loop\Test_Log.md' = "# Test Log`r`n"
    '18_Testing\Test_Cases_Index.md' = "# Test Cases Index`r`n"
    '21_Context_Exports\GaryOS_Context_For_ChatGPT.md' = "# GaryOS Context For ChatGPT`r`n`r`nGenerated local context belongs here. Review it before sharing."
    '21_Context_Exports\GaryOS_Context_Update_Log.md' = "# GaryOS Context Update Log`r`n"
    '24_Approval_Queue\Approval_Queue.md' = "# Approval Queue`r`n"
}

foreach ($File in $Files.GetEnumerator()) {
    $Path = Join-Path $GaryOS $File.Key
    if (-not (Test-Path -LiteralPath $Path)) {
        Set-Content -LiteralPath $Path -Value $File.Value -Encoding UTF8
    }
}

Write-Output "Initialized GaryOS at $GaryOS"
