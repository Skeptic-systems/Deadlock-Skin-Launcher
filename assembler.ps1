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

# DSL install über Github
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
    $trigger = $false
}


# Wird für die folgende Installpath Abfrage gebraucht
$jsonPath = "C:\Program Files\dsl\public\config.json"

# Falls die JSON-Datei noch nicht existiert, erstellen.
if (-not (Test-Path $jsonPath)) {
    New-Item -Path $jsonPath -ItemType File -Force | Out-Null
}

# JSON-Inhalt laden
$jsonContent = Get-Content -Path $jsonPath -Raw -ErrorAction SilentlyContinue

# Wenn die Datei leer oder null ist, ein leeres, geordnetes Objekt erstellen.
if (-not $jsonContent -or $jsonContent.Trim() -eq "") {
    $config = [ordered]@{}
} else {
    $config = $jsonContent | ConvertFrom-Json
}

if (-not $config.installpath) {
    $defaultPath = "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel"
    
    if (Test-Path $defaultPath) {
        # Standardpfad existiert – verwende ihn.
        $installDir = Join-Path $defaultPath "addons"
        if (-not (Test-Path $installDir)) {
            New-Item -Path $installDir -ItemType Directory | Out-Null
        }
        Remove-Item "$installDir\*" -Recurse -Force
        
        $config.version = "1.0.0"
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
        Remove-Item "$installDir\*" -Recurse -Force
        $config.version = "1.0.0"
        $config.installpath = $installDir
    }
    
    # Konfiguration abspeichern.
    $config | ConvertTo-Json -Depth 10 | Set-Content $jsonPath

    # Gameinfo.gi mit den entsprechenden Werten abspeichern
    # Der Trigger wird aus dem Onetime case von oben benutzt
    if ($trigger -eq $false){
        $parentPath = Split-Path $installDir -Parent
        $newPath = Join-Path $parentPath "gameinfo.gi"
        $content = Get-Content -Path $newPath -Raw
        $pattern = "\{\s*Game\s+citadel\s*\r?\n\s*Game\s+core\s*\r?\n\s*\}"
        $replacement = @'
{  
    Game                citadel/addons
    Mod                 citadel
    Write               citadel          
    Game                citadel
    Write               core
    Mod                 core
    Game                core        
}
'@
        if ([regex]::IsMatch($content, $pattern, [System.Text.RegularExpressions.RegexOptions]::Singleline)) {
            $newContent = [regex]::Replace($content, $pattern, $replacement, [System.Text.RegularExpressions.RegexOptions]::Singleline)
            Set-Content -Path $newPath -Value $newContent
        }
    }

    # Übergabe an die main Datei
    & "C:\Program Files\dsl\main.ps1"
}


    # Pfad zur JSON-Datei
    # $config = Get-Content -Path "C:\Program Files\dsl\public\config.json" -Raw | ConvertFrom-Json
    # $config.version = "2.0.0"
    # $config | ConvertTo-Json -Depth 10 | Set-Content "C:\Program Files\dsl\public\config.json"
    # $jsonPath = "C:\Program Files\dsl\public\config.json"
    # $configObject = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
    # $version = $configObject.version

    # $configObject = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
    # $version = $configObject.version

# Versionierung
if ($version -eq "2.0.0") {
    Write-Host "Lade neue Dateien für Version 2.0.0 nach..." -ForegroundColor Cyan
}
# Versionierung
elseif ($version -eq "3.0.0") {
    Write-Host "Lade neue Dateien für Version 3.0.0 nach..." -ForegroundColor Cyan
}
# Versionierung
else {
    & "C:\Program Files\dsl\main.ps1"
}
