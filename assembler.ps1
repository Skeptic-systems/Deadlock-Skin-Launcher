#gameinfo.gi anpassen 
function Save-Config {
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$ConfigData,
        
        [string]$ConfigPath = "C:\Program Files\dsl\install\config.json"
    )
    if (!($ConfigPath)){
        new-item $ConfigPath
    }
    $json = $ConfigData | ConvertTo-Json -Depth 10
    $json | Set-Content -Path $ConfigPath
}

function Get-Config {
    param(
        [string]$ConfigPath = "C:\Program Files\dsl\install\config.json"
    )
        if (!($ConfigPath)){
            new-item $ConfigPath
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
Write-Host "`n`n`n"

# Test Deadlock Path
$installpath = "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel"
if (!($installpath))
    {
    do{
        write-host "Deadlock ist nicht auf C installiert" -ForegroundColor Red
        write-host "Bitte den vollen Pfad bis in citadel angeben"
        $changepath = Read-Host
        if (!(test-path $changepath)){
            $validinput = $false
            write-host "Der Pfad $changepath konnte nicht gefunden werden"
            start-sleep -Seconds 2
        }
        else {
        mkdir "$changepath\addons"
        $configData = @{installpath = "$changepath\addons"}
        Save-Config -ConfigData $configData
        }
    } while (!($validinput))
}
else {
    if (!(test-path "$installpath\addons")){
    mkdir "$installpath\addons"}
    $configData = @{installpath = "$installpath\addons"}
    Save-Config -ConfigData $configData
}

# Wenn Dsl noch nicht installiert ist
if (!(Test-path "C:\Program Files\dsl\main-ps1")) {
    # Initial Download
    mkdir "C:\Program Files\dsl"
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

    # Save Version
    $configData = @{version = "1.0.0"}
    Save-Config -ConfigData $configData
    # Read Path
    $config = Get-Config
    $installpath = $config.installpath
    #Remove-Item -Path "$installpath\*" -Recurse -Force
    & "C:\Program Files\dsl\main.ps1"
}


#$jsonFile = "C:\Program Files\dsl\install\config.json"
#$jsonContent = Get-Content $jsonFile -Raw | ConvertFrom-Json
#if ($jsonContent.version -eq "1.0.0") { $jsonContent.version = 2.0.0" }
#$jsonContent | ConvertTo-Json -Depth 10 | Set-Content $jsonFile -Force


$config = Get-Config
$version = $config.version
elseif ($version -eq "2.0.0") {
    # Neue Dateien Nachladen
}

elseif ($version -eq "3.0.0") {
    # Neue Dateien Nachladen
}

elseif ($version -eq "4.0.0") {
    # Neue Dateien Nachladen
}

elseif ($version -eq "5.0.0") {
    # Neue Dateien Nachladen
}

elseif ($version -eq "6.0.0") {
    # Neue Dateien Nachladen
}

else {
    & "C:\Program Files\dsl\main.ps1"
}