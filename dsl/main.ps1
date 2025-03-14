Unblock-File -Path "C:\Program Files\dsl\install\install.ps1" | Out-Null
Unblock-File -Path "C:\Program Files\dsl\main.ps1" | Out-Null
Unblock-File -Path "C:\Program Files\dsl\uninstall\uninstall.ps1" | Out-Null
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

write-host "[1] Install Assets" -ForegroundColor Yellow
Write-Host "[2] List or uninstall Assets" -ForegroundColor Blue
Write-Host "[3] Fix DSL" -ForegroundColor Magenta
Write-Host "[4] Uninstall DSL" -ForegroundColor Gray
write-host ""
write-host " > " -NoNewline -ForegroundColor cyan

$caseInput = Read-Host
switch($caseInput){                    
    1 {
        & "C:\Program Files\dsl\install\installmenu.ps1"
    }            
    2 { 
        & "C:\Program Files\dsl\uninstall\uninstall.ps1"
    }            
    3 {
        & "C:\Program Files\dsl\fix\fix.ps1"
    }            
    4 {
        & "C:\Program Files\dsl\uninstall\dsl\uninstall.ps1"
    }        
    default {
        write-host "wrong case input"
        $validinput = $false
    }            
}
} while ($validinput -eq $false)