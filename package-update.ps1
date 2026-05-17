$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Resolve-Path (Join-Path $scriptDir "..")
$buildDir = Join-Path $projectRoot "build-qt"
$stageDir = Join-Path $scriptDir "Mabiaty_Update_v1.0.1"
$zipPath = Join-Path $scriptDir "Mabiaty_Update_v1.0.1.zip"
$notesPath = Join-Path $scriptDir "RELEASE_NOTES_v1.0.1.md"

if (-not (Test-Path $buildDir)) {
    throw "Build folder not found: $buildDir"
}

$resolvedScriptDir = [System.IO.Path]::GetFullPath($scriptDir)
$resolvedStageDir = [System.IO.Path]::GetFullPath($stageDir)
$resolvedZipPath = [System.IO.Path]::GetFullPath($zipPath)

if (-not $resolvedStageDir.StartsWith($resolvedScriptDir, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to clean a folder outside release-updates."
}

if (Test-Path $stageDir) {
    Remove-Item -LiteralPath $stageDir -Recurse -Force
}

if (Test-Path $zipPath) {
    Remove-Item -LiteralPath $zipPath -Force
}

New-Item -ItemType Directory -Path $stageDir -Force | Out-Null

$runtimeFiles = @(
    "SalesManager.exe",
    "SalesManager.exe.manifest",
    "D3Dcompiler_47.dll",
    "libgcc_s_seh-1.dll",
    "libstdc++-6.dll",
    "libwinpthread-1.dll",
    "opengl32sw.dll",
    "Qt6Core.dll",
    "Qt6Gui.dll",
    "Qt6Network.dll",
    "Qt6PrintSupport.dll",
    "Qt6Sql.dll",
    "Qt6Svg.dll",
    "Qt6Widgets.dll"
)

foreach ($file in $runtimeFiles) {
    $source = Join-Path $buildDir $file
    if (Test-Path $source) {
        Copy-Item -LiteralPath $source -Destination $stageDir -Force
    }
}

$runtimeDirs = @(
    "assets",
    "generic",
    "iconengines",
    "imageformats",
    "networkinformation",
    "platforms",
    "sqldrivers",
    "styles",
    "tls",
    "translations"
)

foreach ($dir in $runtimeDirs) {
    $source = Join-Path $buildDir $dir
    if (Test-Path $source) {
        Copy-Item -LiteralPath $source -Destination $stageDir -Recurse -Force
    }
}

if (Test-Path $notesPath) {
    Copy-Item -LiteralPath $notesPath -Destination (Join-Path $stageDir "read.md") -Force
}

Compress-Archive -Path (Join-Path $stageDir "*") -DestinationPath $zipPath -Force

Write-Host "Update package ready:"
Write-Host $resolvedZipPath
