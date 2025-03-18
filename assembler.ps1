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

# ----------------- DSL Installation -----------------
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

# DSL Installation abgeschlossen – ab hier kann geloggt werden.
# ----------------- Logdatei anlegen -----------------
$logFolder = "C:\Program Files\dsl\logs"
if (-not (Test-Path $logFolder)) {
    New-Item -Path $logFolder -ItemType Directory -Force | Out-Null
}

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$global:logFilePath = "$logFolder\log_$timestamp.txt"
New-Item -Path $global:logFilePath -ItemType File -Force | Out-Null

# ----------------- Funktion zum Schreiben von Logeinträgen -----------------
function Write-Log {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message,
        [ValidateSet("INFO", "WARN", "ERROR")]
        [string]$Level = "INFO"
    )

    $timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timeStamp [$Level] $Message"
    Add-Content -Path $global:logFilePath -Value $logEntry
}

# ----------------- Beispielhafte Logeinträge -----------------
Write-Log -Message "DSL Installation abgeschlossen." -Level INFO

# Wird für die folgende Installpath-Abfrage gebraucht
$jsonPath = "C:\Program Files\dsl\public\config.json"

# Falls die JSON-Datei noch nicht existiert, erstellen.
if (-not (Test-Path $jsonPath)) {
    New-Item -Path $jsonPath -ItemType File -Force | Out-Null
    Write-Log -Message "Konfigurationsdatei wurde neu erstellt: $jsonPath" -Level INFO
} else {
    Write-Log -Message "Konfigurationsdatei gefunden: $jsonPath" -Level INFO
}

# JSON-Inhalt laden
$jsonContent = Get-Content -Path $jsonPath -Raw -ErrorAction SilentlyContinue

if (-not $jsonContent -or $jsonContent.Trim() -eq "") {
    $config = [ordered]@{}
    Write-Log -Message "Konfigurationsdatei war leer. Leeres Konfigurationsobjekt initialisiert." -Level INFO
} else {
    $config = $jsonContent | ConvertFrom-Json
    Write-Log -Message "Konfiguration erfolgreich geladen." -Level INFO
}
if (-not $config.installpath) {
    $defaultPath = "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel"
    if (Test-Path $defaultPath) {
        $installDir = Join-Path $defaultPath "addons"
        if (!(Test-Path $installDir)) {
            New-Item -Path $installDir -ItemType Directory | Out-Null
            Write-Log -Message "Addons-Ordner erstellt: $installDir" -Level INFO
        }
#        Remove-Item "$installDir\*" -Recurse -Force
        Write-Log -Message "Addons-Ordner bereinigt: $installDir" -Level INFO
        $config.version = "1.0.0"
        $config.installpath = $installDir
        Write-Log -Message "Standard Installationspfad gesetzt: $installDir" -Level INFO
    } else {
        Write-Log -Message "Standardpfad existiert nicht. Benutzer wird zur Eingabe eines gültigen Pfades aufgefordert." -Level WARN
        do {
            $userInput = Read-Host "Bitte Pfad eingeben (Pfad muss 'steamapps\common\Deadlock\game\citadel' enthalten)"
        } until ((Test-Path $userInput) -and ($userInput -like "*steamapps\common\Deadlock\game\citadel*"))
        
        $installDir = Join-Path $userInput "addons"
        if (-not (Test-Path $installDir)) {
            New-Item -Path $installDir -ItemType Directory | Out-Null
            Write-Log -Message "Addons-Ordner erstellt: $installDir" -Level INFO
        }
#        Remove-Item "$installDir\*" -Recurse -Force
        Write-Log -Message "Addons-Ordner bereinigt: $installDir" -Level INFO
        
        $config.version = "1.0.0"
        $config.installpath = $installDir
        Write-Log -Message "Benutzerdefinierter Installationspfad gesetzt: $installDir" -Level INFO
    }
    
    # Konfiguration abspeichern
    $config | ConvertTo-Json -Depth 10 | Set-Content $jsonPath
    Write-Log -Message "Konfiguration gespeichert: $jsonPath" -Level INFO

    # Anpassung der gameinfo.gi (nur, wenn Trigger false ist)
    if ($trigger -eq $false) {
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
            Write-Log -Message "gameinfo.gi Datei erfolgreich angepasst: $newPath" -Level INFO
        } else {
            Write-Log -Message "Kein passendes Muster in gameinfo.gi gefunden: $newPath" -Level WARN
        }
    }

    Write-Log -Message "Übergabe an main.ps1" -Level INFO
    & "C:\Program Files\dsl\main.ps1"
}

if ($version -eq "2.0.0") {
    Write-Log -Message "Lade neue Dateien für Version 2.0.0 nach..." -Level INFO
    Write-Host "Lade neue Dateien für Version 2.0.0 nach..." -ForegroundColor Cyan
}
elseif ($version -eq "3.0.0") {
    Write-Log -Message "Lade neue Dateien für Version 3.0.0 nach..." -Level INFO
    Write-Host "Lade neue Dateien für Version 3.0.0 nach..." -ForegroundColor Cyan
}
else {
    Write-Log -Message "Starte main.ps1" -Level INFO
    & "C:\Program Files\dsl\main.ps1"
}
