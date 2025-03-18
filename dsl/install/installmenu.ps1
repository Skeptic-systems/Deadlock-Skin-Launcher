Import-Module "C:\Program Files\dsl\public\args.psm1"
$validinput = $true
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
    
    write-host "[1] Install Skin"
    write-host "[2] Install Asset"
    
    write-host " > " -NoNewline -ForegroundColor Cyan
    $caseInput = Read-Host

    # Logge die Benutzereingabe
    Write-Log -Message "User input received: $caseInput" -Level INFO

    switch($caseInput){        
        1 {
            Write-Log -Message "Option 1 selected: Install Skin" -Level INFO
            & "C:\Program Files\dsl\install\skinmenu.ps1"
        }            
        2 { 
            Write-Log -Message "Option 2 selected: Install Asset" -Level INFO
            & "C:\Program Files\dsl\install\assetmenu.ps1"
        }
        "e" {
            Write-Log -Message "Option 'e' selected: Returning to main menu" -Level INFO
            & "C:\Program Files\dsl\main.ps1"
        }    
        default {
            Write-Log -Message "Invalid input received: $caseInput" -Level WARN
            write-host "Wrong Case input" -ForegroundColor Red
            start-sleep -seconds 2
            $validinput = $false
        }            
    }
} while ($validinput -eq $false)
