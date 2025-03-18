Import-Module "C:\Program Files\dsl\public\args.psm1"
Write-Log -Message "Module args.psm1 loaded" -Level INFO
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
write-Host "Fixing ..."
Write-Log -Message "Fixing process started" -Level INFO
$jsonPath = "C:\Program Files\dsl\public\config.json"

# Übersetzen und importieren des Pfades für die gameinfo.gi
$config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
Write-Log -Message "Config file loaded from $jsonPath" -Level INFO
$installpath = $config.installpath
Write-Log -Message "Installpath determined: $installpath" -Level INFO
$parentPath = Split-Path $installpath -Parent
$newPath = Join-Path $parentPath "gameinfo.gi"
Write-Log -Message "New path for gameinfo.gi: $newPath" -Level INFO

# Pattern vergleich 
$content = Get-Content -Path "$newPath" -Raw
Write-Log -Message "Read content from $newPath" -Level INFO
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

# Setzen des Wertes, wenn das Pattern matcht
if ([regex]::IsMatch($content, $pattern, [System.Text.RegularExpressions.RegexOptions]::Singleline)) {
    Write-Log -Message "Pattern match found in $newPath" -Level INFO
    $newContent = [regex]::Replace($content, $pattern, $replacement, [System.Text.RegularExpressions.RegexOptions]::Singleline)
    Set-Content -Path "$newPath" -Value $newContent
    Write-Log -Message "Pattern replaced and new content saved to $newPath" -Level INFO
    write-Host "addons modification was applied" -ForegroundColor Green
}
# Ansonsten öffen von Vscode oder notpad
else {
    Write-Log -Message "Pattern did not match in $newPath" -Level WARN
    write-Host "The pattern does not match in the file, please check the file" -ForegroundColor Red
    if (Get-Command code -ErrorAction SilentlyContinue) {
        Write-Log -Message "Opening $newPath in VSCode" -Level INFO
        code "$newPath"
    } else {
        Write-Log -Message "Opening $newPath in Notepad" -Level INFO
        notepad "$newPath"
    }

}
start-sleep -seconds 3
Write-Log -Message "Fixing process completed, returning to main menu" -Level INFO
& "C:\Program Files\dsl\main.ps1"
