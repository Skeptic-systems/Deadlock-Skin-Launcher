#gameinfo.gi anpassen 
clear-host
write-host @"
    ____                 ____           __      _____ __   _          __                           __             
   / __ \___  ____ _____/ / /___  _____/ /__   / ___// /__(_)___     / /   ____ ___  ______  _____/ /_  ___  _____
  / / / / _ \/ __  / __  / / __ \/ ___/ //_/   \__ \/ //_/ / __ \   / /   / __  / / / / __ \/ ___/ __ \/ _ \/ ___/
 / /_/ /  __/ /_/ / /_/ / / /_/ / /__/ ,<     ___/ /  < / / / / /  / /___/ /_/ / /_/ / / / / /__/ / / /  __/ /    
/_____/\___/\__,_/\__,_/_/\____/\___/_/|_|   /____/_/|_/_/_/ /_/  /_____/\__,_/\__,_/_/ /_/\___/_/ /_/\___/_/     
"@ -ForegroundColor Green
write-host "by Skeptic" -ForegroundColor Cyan
Write-Host "`n`n`n"



$jsonPath = "C:\Program Files\dsl\install\config.json"
if (!(Test-Path $jsonPath)) {
    New-Item $jsonPath -ItemType File -Force
    $jsonData = @{}
}

$jsonPath = "C:\Program Files\dsl\install\config.json"
$config = if (Test-Path $jsonPath) { Get-Content -Path $jsonPath -Raw | ConvertFrom-Json } else { @{} }
if (-not $config.installpath) {
    $defaultPath = "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel"
    if (Test-Path $defaultPath -and $defaultPath.Contains("steamapps\common\Deadlock\game\citadel")) {
        $p = Join-Path $defaultPath "addons"
        if (-not (Test-Path $p)) { New-Item -Path $p -ItemType Directory | Out-Null }
        $config.installpath = $p
    } else {
        do { $u = Read-Host "Pfad eingeben (mind. 'steamapps\common\Deadlock\game\citadel')" } until (Test-Path $u -and $u.Contains("steamapps\common\Deadlock\game\citadel"))
        $p = Join-Path $u "addons"
        if (-not (Test-Path $p)) { New-Item -Path $p -ItemType Directory | Out-Null }
        $config.installpath = $p
    }
    $config | ConvertTo-Json -Depth 10 | Set-Content $jsonPath
} else {
    Write-Output $config.installpath
}



# Test Deadlock Path
# Wenn Dsl noch nicht installiert ist
if (!(Test-Path "C:\Program Files\dsl")) {
    # Initial Download
    mkdir "C:\Program Files\dsl" -Force | Out-Null
    $zipFile = "$env:TEMP\Deadlock-Skin-Launcher.zip"
    $destinationFolder = "C:\Program Files\dsl"
    Invoke-WebRequest -Uri "https://github.com/Skeptic-systems/Deadlock-Skin-Launcher/archive/refs/heads/main.zip" -OutFile $zipFile
    Expand-Archive -Path $zipFile -DestinationPath $destinationFolder -Force
    $sourceDsl = Join-Path $destinationFolder "Deadlock-Skin-Launcher-main\dsl"
    Get-ChildItem -Path $sourceDsl | ForEach-Object {
        Move-Item -Path $_.FullName -Destination $destinationFolder -Force -ErrorAction SilentlyContinue
    }
    Remove-Item -Path (Join-Path $destinationFolder "Deadlock-Skin-Launcher-main") -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item $zipFile -Force -ErrorAction SilentlyContinue
    $jsonData["version"] = "1.0.0"
    $jsonData | ConvertTo-Json -Depth 5 | Set-Content $jsonPath
    #$config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
    #$installPath = $config.installpath
    #if (Test-Path $installPath) {
    #    Remove-Item "$installPath\*" -Recurse -Force
    #}
     & "C:\Program Files\dsl\main.ps1"
}

    $configObject = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
    $version = $configObject.version

# Versions-Update in der JSON (von 1.0.0 auf 2.0.0)
#if ($version -eq "1.0.0") {
# Pfad zur JSON-Datei
#$config = Get-Content -Path "C:\Program Files\dsl\install\config.json" -Raw | ConvertFrom-Json
#$config.version = "2.0.0"
#$config | ConvertTo-Json -Depth 10 | Set-Content "C:\Program Files\dsl\install\config.json"
#}
#$jsonPath = "C:\Program Files\dsl\install\config.json"
#$configObject = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
#$version = $configObject.version


if ($version -eq "2.0.0") {
    Write-Host "Lade neue Dateien für Version 2.0.0 nach..." -ForegroundColor Cyan
}
elseif ($version -eq "3.0.0") {
    Write-Host "Lade neue Dateien für Version 3.0.0 nach..." -ForegroundColor Cyan
}
else {
    & "C:\Program Files\dsl\main.ps1"
}
