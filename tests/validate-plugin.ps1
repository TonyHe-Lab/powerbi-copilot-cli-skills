$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot

function Assert-PathExists {
    param(
        [string]$Path,
        [string]$Message
    )

    if (-not (Test-Path $Path)) {
        throw $Message
    }
}

function Get-FrontmatterKeys {
    param([string]$Path)

    $content = Get-Content -Raw -Path $Path
    if ($content -notmatch "(?s)^---\r?\n(.*?)\r?\n---") {
        throw "Missing YAML frontmatter in $Path"
    }

    $matches[1] -split "`r?`n" |
        Where-Object { $_ -match ":" } |
        ForEach-Object { ($_ -split ":", 2)[0].Trim() }
}

$expectedFiles = @(
    "$root\.claude-plugin\plugin.json",
    "$root\README.md",
    "$root\ATTRIBUTION.md",
    "$root\LICENSE",
    "$root\docs\superpowers\specs\2026-05-29-powerbi-copilot-skill-refactor-design.md",
    "$root\docs\superpowers\plans\2026-05-29-powerbi-copilot-skill-refactor.md",
    "$root\memory-bank\projectbrief.md",
    "$root\memory-bank\productContext.md",
    "$root\memory-bank\activeContext.md",
    "$root\memory-bank\systemPatterns.md",
    "$root\memory-bank\techContext.md",
    "$root\memory-bank\progress.md",
    "$root\memory-bank\tasks\_index.md",
    "$root\memory-bank\tasks\TASK001-skill-refactor.md"
)

foreach ($file in $expectedFiles) {
    Assert-PathExists -Path $file -Message "Missing expected file: $file"
}

$expectedSkills = @(
    "modeling-semantic-models",
    "writing-dax",
    "authoring-power-query",
    "designing-power-bi-reports",
    "managing-pbip-tmdl"
)

foreach ($skill in $expectedSkills) {
    $skillFile = "$root\skills\$skill\SKILL.md"
    Assert-PathExists -Path $skillFile -Message "Missing skill file: $skillFile"

    $keys = @(Get-FrontmatterKeys -Path $skillFile)
    $unexpectedKeys = $keys | Where-Object { $_ -notin @("name", "description") }
    if ($unexpectedKeys) {
        throw "Unexpected frontmatter keys in ${skillFile}: $($unexpectedKeys -join ', ')"
    }

    foreach ($requiredKey in @("name", "description")) {
        if ($requiredKey -notin $keys) {
            throw "Missing '$requiredKey' in $skillFile"
        }
    }
}

$plugin = Get-Content -Raw -Path "$root\.claude-plugin\plugin.json" | ConvertFrom-Json
if (-not $plugin.name -or -not $plugin.description) {
    throw "plugin.json must contain at least name and description"
}

Write-Host "Plugin structure validation passed."
