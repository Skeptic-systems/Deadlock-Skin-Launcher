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







# Test Deadlock Path
# Wenn Dsl noch nicht installiert ist
if (!(Test-Path "C:\Program Files\dsl")) {
    # Initial Download
    mkdir "C:\Program Files\dsl" -Force | Out-Null
    $zipFile = "$env:TEMP\Deadlock-Skin-Launcher.zip"
    $destinationFolder = "C:\Program Files\dsl"
    Invoke-WebRequest -Uri "https://github.com/Skeptic-systems/Deadlock-Skin-Launcher/archive/refs/heads/main.zip" -OutFile $zipFile -ErrorAction SilentlyContinue
    Expand-Archive -Path $zipFile -DestinationPath $destinationFolder -Force
    $sourceDsl = Join-Path $destinationFolder "Deadlock-Skin-Launcher-main\dsl"
    Get-ChildItem -Path $sourceDsl | ForEach-Object {
        Move-Item -Path $_.FullName -Destination $destinationFolder -Force -ErrorAction SilentlyContinue
    }
    Remove-Item -Path (Join-Path $destinationFolder "Deadlock-Skin-Launcher-main") -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item $zipFile -Force -ErrorAction SilentlyContinue
}
$Null = Read-Host


$jsonPath = "C:\Program Files\dsl\install\config.json"
if (-not (Test-Path $jsonPath)) {
    New-Item -Path $jsonPath -ItemType File -Force | Out-Null
}
# Konfiguration laden oder leeres Objekt erstellen.
$config = if (Test-Path $jsonPath) {
    Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
}
if (-not $config.installpath) {
    $defaultPath = "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel"
    
    if (Test-Path $defaultPath) {
        # Standardpfad existiert – verwende ihn.
        $installDir = Join-Path $defaultPath "addons"
        if (-not (Test-Path $installDir)) {
            New-Item -Path $installDir -ItemType Directory | Out-Null
        }
        $jsonData["version"] = "1.0.0"
        $jsonData | ConvertTo-Json -Depth 5 | Set-Content $jsonPath
        $config.installpath = $installDir
    } else {
        # Standardpfad existiert nicht – Benutzer eingeben lassen.
        do {
            $userInput = Read-Host "Bitte Pfad eingeben (Pfad muss 'steamapps\common\Deadlock\game\citadel' enthalten)"
        } until (Test-Path $userInput -and $userInput -like "*steamapps\common\Deadlock\game\citadel*")
        
        $installDir = Join-Path $userInput "addons"
        if (-not (Test-Path $installDir)) {
            New-Item -Path $installDir -ItemType Directory | Out-Null
        }
        $jsonData["version"] = "1.0.0"
        $jsonData | ConvertTo-Json -Depth 5 | Set-Content $jsonPath
        $config.installpath = $installDir
    }
    
    # Konfiguration abspeichern.
    $config | ConvertTo-Json -Depth 10 | Set-Content $jsonPath
     & "C:\Program Files\dsl\main.ps1"
} else {
    Write-Output $config.installpath
}




    #$config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
    #$installPath = $config.installpath
    #if (Test-Path $installPath) {
    #    Remove-Item "$installPath\*" -Recurse -Force
    #}
    


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
