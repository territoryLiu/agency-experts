[CmdletBinding()]
param(
    [string]$SkillRoot = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($SkillRoot)) {
    $scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
    $SkillRoot = (Resolve-Path (Join-Path $scriptDirectory "..")).Path
}

function Add-Failure {
    param(
        [System.Collections.Generic.List[string]]$Failures,
        [string]$Message
    )
    $Failures.Add($Message) | Out-Null
}

$failures = New-Object 'System.Collections.Generic.List[string]'

$skillFile = Join-Path $SkillRoot "SKILL.md"
$referencesRoot = Join-Path $SkillRoot "references"

if (-not (Test-Path -Path $skillFile -PathType Leaf)) {
    throw "SKILL.md not found at: $skillFile"
}

if (-not (Test-Path -Path $referencesRoot -PathType Container)) {
    throw "references directory not found at: $referencesRoot"
}

$skillContent = Get-Content -Path $skillFile -Raw

$idRegex = [regex]'\| `([^`]+)` \|'
$expertIdMatches = $idRegex.Matches($skillContent)
$allExpertIds = @($expertIdMatches | ForEach-Object { $_.Groups[1].Value })
$expertIds = @($allExpertIds | Sort-Object -Unique)

if ($allExpertIds.Count -eq 0) {
    Add-Failure -Failures $failures -Message "No Expert IDs were found in SKILL.md tables."
}

$duplicateExpertIds = @(
    $allExpertIds |
    Group-Object |
    Where-Object { $_.Count -gt 1 } |
    ForEach-Object { $_.Name }
)
if ($duplicateExpertIds.Count -gt 0) {
    Add-Failure -Failures $failures -Message ("Duplicate Expert IDs in SKILL.md: " + ($duplicateExpertIds -join ", "))
}

$referenceFiles = Get-ChildItem -Path $referencesRoot -Recurse -File -Filter *.md
$allReferenceIds = @($referenceFiles | ForEach-Object { $_.BaseName })
$referenceIds = @($allReferenceIds | Sort-Object -Unique)

$duplicateReferenceIds = @(
    $allReferenceIds |
    Group-Object |
    Where-Object { $_.Count -gt 1 } |
    ForEach-Object { $_.Name }
)
if ($duplicateReferenceIds.Count -gt 0) {
    Add-Failure -Failures $failures -Message ("Duplicate reference basenames: " + ($duplicateReferenceIds -join ", "))
}

$missingReferenceFiles = @($expertIds | Where-Object { $_ -notin $referenceIds })
if ($missingReferenceFiles.Count -gt 0) {
    Add-Failure -Failures $failures -Message ("Missing files for Expert IDs: " + ($missingReferenceFiles -join ", "))
}

$unlistedReferenceFiles = @($referenceIds | Where-Object { $_ -notin $expertIds })
if ($unlistedReferenceFiles.Count -gt 0) {
    Add-Failure -Failures $failures -Message ("Reference files not listed in SKILL.md: " + ($unlistedReferenceFiles -join ", "))
}

$expectedDirectoryCounts = [ordered]@{
    "engineering" = 11
    "design" = 8
    "marketing" = 11
    "product" = 4
    "project-management" = 5
    "testing" = 8
    "support" = 6
    "spatial-computing" = 6
    "specialized" = 9
}

foreach ($entry in $expectedDirectoryCounts.GetEnumerator()) {
    $directoryPath = Join-Path $referencesRoot $entry.Key
    if (-not (Test-Path -Path $directoryPath -PathType Container)) {
        Add-Failure -Failures $failures -Message "Missing category directory: $($entry.Key)"
        continue
    }

    $actualCount = (Get-ChildItem -Path $directoryPath -File -Filter *.md | Measure-Object).Count
    if ($actualCount -ne $entry.Value) {
        Add-Failure -Failures $failures -Message ("Category count mismatch for '{0}': expected {1}, found {2}" -f $entry.Key, $entry.Value, $actualCount)
    }
}

$declaredCountRegex = [regex]'^###\s+(.+?)\s+\((\d+)\)\s+\|'
$headingToDirectory = @{
    "Engineering" = "engineering"
    "Design" = "design"
    "Marketing" = "marketing"
    "Product" = "product"
    "Project Management" = "project-management"
    "Testing" = "testing"
    "Support" = "support"
    "Spatial Computing" = "spatial-computing"
    "Specialized" = "specialized"
}

$skillLines = Get-Content -Path $skillFile
foreach ($line in $skillLines) {
    $match = $declaredCountRegex.Match($line)
    if (-not $match.Success) {
        continue
    }

    $headingName = $match.Groups[1].Value.Trim()
    $declaredCount = [int]$match.Groups[2].Value

    if (-not $headingToDirectory.ContainsKey($headingName)) {
        continue
    }

    $mappedDirectory = $headingToDirectory[$headingName]
    $expectedCount = [int]$expectedDirectoryCounts[$mappedDirectory]
    if ($declaredCount -ne $expectedCount) {
        Add-Failure -Failures $failures -Message ("Heading count mismatch for '{0}': declared {1}, expected {2}" -f $headingName, $declaredCount, $expectedCount)
    }
}

Write-Host ("Expert IDs in SKILL.md: {0}" -f $expertIds.Count)
Write-Host ("Reference files found: {0}" -f $referenceIds.Count)
Write-Host ("Checked categories: {0}" -f $expectedDirectoryCounts.Count)

if ($failures.Count -gt 0) {
    Write-Host ""
    Write-Host "Validation failed with the following issues:"
    foreach ($issue in $failures) {
        Write-Host ("- " + $issue)
    }
    exit 1
}

Write-Host "Validation passed. Expert mapping is consistent."
exit 0
