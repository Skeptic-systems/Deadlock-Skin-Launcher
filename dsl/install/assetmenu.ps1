import-module "C:\Program Files\dsl\install\assetinstall.psm1"
import-module "C:\Program Files\dsl\public\args.psm1"

do {
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
write-Host @"
[1] Fart Sound
[e] To go back
"@

Write-Host "`n"
write-host " > " -NoNewline -ForegroundColor cyan
$assetinput = Read-Host
    switch ($assetinput) {
    
        1 {
            $skinName = Get-Skinname -ClassName "fart"
            if ($skinName) {
                Write-Host "This asset is already installed" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 2
            }
            else {
                install-asset -Display "[1] Fart" -Inspectlink "https://gamebanana.com/mods/560795" -Downloadlink "https://skeptic-systems.de/data/deadlock/assets/fart.zip"
            }
        }
        default {
            write-Host "Wrong Case Input" -ForegroundColor Red
            start-sleep -seconds 2
            $validinput -eq $false
        }
        "e" {
           & "C:\Program Files\dsl\install\installmenu.ps1"
        }
}
} while ($validinput -eq $false)