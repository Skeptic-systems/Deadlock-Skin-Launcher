#gameinfo.gi anpassen 
function Save-Config {
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$ConfigData,
        
        [string]$ConfigPath = "C:\Program Files\dsl\install\config.json"
    )
    
    # Bestehende Konfiguration laden (falls vorhanden)
    $existingHashtable = @{}
    if (Test-Path $ConfigPath) {
        $existingConfig = Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json
        if ($existingConfig) {
            foreach ($prop in $existingConfig.PSObject.Properties) {
                $existingHashtable[$prop.Name] = $prop.Value
            }
        }
    }
    
    # Neue Werte einfügen bzw. vorhandene überschreiben
    foreach ($key in $ConfigData.Keys) {
         $existingHashtable[$key] = $ConfigData[$key]
    }
    
    # Als JSON speichern
    $json = $existingHashtable | ConvertTo-Json -Depth 10
    $json | Set-Content -Path $ConfigPath
}

function Get-Config {
    param(
        [string]$ConfigPath = "C:\Program Files\dsl\install\config.json"
    )
    if (!(Test-Path $ConfigPath)){
        # Falls die Konfigurationsdatei noch nicht existiert, eine leere anlegen
        $emptyConfig = @{}
        $emptyConfig | ConvertTo-Json -Depth 10 | Set-Content -Path $ConfigPath
    }
    $jsonContent = Get-Content -Path $ConfigPath -Raw
    $configObject = $jsonContent | ConvertFrom-Json
    return $configObject
}

clear-host
write-host @"
    ____                 ____           __      _____ __   _          __                           __             
   / __ \___  ____ _____/ / /___  _____/ /__   / ___// /__(_)___     / /   ____ ___  ______  _____/ /_  ___  _____
  / / / / _ \/ __  / __  / / __ \/ ___/ //_/   \__ \/ //_/ / __ \   / /   / __  / / / / __ \/ ___/ __ \/ _ \/ ___/
 / /_/ /  __/ /_/ / /_/ / / /_/ / /__/ ,<     ___/ /  < / / / / /  / /___/ /_/ / /_/ / / / / /__/ / / /  __/ /    
/_____/\___/\__,_/\__,_/_/\____/\___/_/|_|   /____/_/|_/_/_/ /_/  /_____/\__,_/\__,_/_/ /_/\___/_/ /_/\___/_/     
"@ -ForegroundColor Green
write-host "by Skeptic" -ForegroundColor Cyan
Write-Host "nnn"

# Test Deadlock Path
$installpath = "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel"
if (!(Test-Path $installpath)) {
    $validinput = $false
    do {
        write-host "Deadlock ist nicht auf C installiert" -ForegroundColor Red
        write-host "Bitte den vollen Pfad bis in citadel angeben"
        $changepath = Read-Host
        if (!(Test-Path $changepath)){
            $validinput = $false
            write-host "Der Pfad $changepath konnte nicht gefunden werden"
            start-sleep -Seconds 2
        }
        else {
            $validinput = $true
            if (!(Test-Path "$changepath\addons")){
                mkdir "$changepath\addons" | Out-Null
            }
            $configData = @{ installpath = "$changepath\addons" }
            Save-Config -ConfigData $configData
        }
    } while (-not $validinput)
}
else {
    if (!(Test-Path "$installpath\addons")){
        mkdir "$installpath\addons" | Out-Null
    }
    $configData = @{ installpath = "$installpath\addons" }
    Save-Config -ConfigData $configData
}

# Wenn Dsl noch nicht installiert ist
if (!(Test-Path "C:\Program Files\dsl\main-ps1")) {
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
    $configData = @{ version = "1.0.0" }
    Save-Config -ConfigData $configData
    $config = Get-Config
    $installpath = $config.installpath
    Remove-Item -Path "$installpath\*" -Recurse -Force
    & "C:\Program Files\dsl\main.ps1"
}

# Versions-Update in der JSON (von 1.0.0 auf 2.0.0)
#$config = Get-Config
#$version = $config.version
#if ($version -eq "1.0.0") {
#    Write-Host "Aktualisiere Version von 1.0.0 auf 2.0.0..." -ForegroundColor Yellow
#    Save-Config -ConfigData @{ version = "2.0.0" }
#    $version = "2.0.0"
#}

if ($version -eq "2.0.0") {
    Write-Host "Lade neue Dateien für Version 2.0.0 nach..." -ForegroundColor Cyan
}
elseif ($version -eq "3.0.0") {
    Write-Host "Lade neue Dateien für Version 3.0.0 nach..." -ForegroundColor Cyan
}
else {
    & "C:\Program Files\dsl\main.ps1"
}
