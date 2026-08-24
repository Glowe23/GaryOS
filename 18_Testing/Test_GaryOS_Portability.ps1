$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $PSScriptRoot
$TestRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("GaryOS-Portability-" + [guid]::NewGuid())
$TestGaryOS = Join-Path $TestRoot 'GaryOS'

try {
    New-Item -ItemType Directory -Path (Join-Path $TestGaryOS '07_Scripts') -Force | Out-Null
    Copy-Item -Path (Join-Path $RepoRoot '07_Scripts\*.ps1') -Destination (Join-Path $TestGaryOS '07_Scripts')

    $Initializer = Join-Path $TestGaryOS '07_Scripts\Initialize_GaryOS.ps1'
    if (-not (Test-Path -LiteralPath $Initializer)) {
        throw 'The repository does not contain its portable initialization script.'
    }
    & $Initializer | Out-Null

    & (Join-Path $TestGaryOS '07_Scripts\Run_GaryOS_Self_Check.ps1') | Out-Null

    $Report = Join-Path $TestGaryOS '08_Reports\GaryOS_Self_Check_Report.md'
    if (-not (Test-Path -LiteralPath $Report)) {
        throw 'Self-check did not write its report inside the copied GaryOS repository.'
    }
    if (Select-String -LiteralPath $Report -Pattern 'Missing' -Quiet) {
        throw 'Self-check reported missing required content in the portable copy.'
    }

    Write-Output 'PASS: GaryOS self-check works from a clean temporary location.'
}
finally {
    $ResolvedTemp = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
    $ResolvedTest = [System.IO.Path]::GetFullPath($TestRoot)
    if ($ResolvedTest.StartsWith($ResolvedTemp, [System.StringComparison]::OrdinalIgnoreCase) -and (Test-Path -LiteralPath $ResolvedTest)) {
        Remove-Item -LiteralPath $ResolvedTest -Recurse -Force
    }
}
