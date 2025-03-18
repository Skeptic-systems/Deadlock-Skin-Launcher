Import-Module "C:\Program Files\dsl\public\args.psm1"
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
Write-Host "@
Are you sure you want to uninstall dsl?

[y] To uninstall dsl ans skins
[s] To uninstall dsl
[n] To go back
@"

$caseinput = Read-Host
Write-Log -Message "Uninstall menu input received: $caseinput" -Level INFO
switch ($caseinput){
    "y" {
        Write-Log -Message "User selected 'y': Uninstall dsl and skins" -Level INFO
        write-Host "Uninstall addons" -ForegroundColor Cyan
        # Load Installpath form configfile
        $jsonPath = "C:\Program Files\dsl\public\config.json"
        $config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
        $installpath = $config.installpath
        Write-Log -Message "Loaded config file. Installpath determined: $installpath" -Level INFO
        Remove-Item "$installpath" -Recurse -Force
        Write-Log -Message "Removed addons at: $installpath" -Level INFO
        Write-Host "Uninstalled addons succesfully" -ForegroundColor Green
        
        Write-Log -Message "Uninstalling dsl folder at C:\Program Files\dsl" -Level INFO
        Write-Host "Uninstalling dsl"
        Remove-Item "C:\Program Files\dsl" -Recurse -Force
        Write-Log -Message "Uninstalled dsl successfully" -Level INFO
        Write-Host "Uninstalled dsl succesfully" -ForegroundColor Green
        Start-Sleep -Seconds 2
        $validinput = $false
    }
    "s" {
        Write-Log -Message "User selected 's': Uninstall dsl only" -Level INFO
        Write-Host "Uninstalling dsl" -ForegroundColor Cyan
        Remove-Item "C:\Program Files\dsl" -Recurse -Force
        Write-Log -Message "Uninstalled dsl successfully" -Level INFO
        Start-Sleep -Seconds 2
        Write-Host "Uninstalled dsl succesfully" -ForegroundColor Green
        $validinput = $false
    }
    "n" {
        Write-Log -Message "User selected 'n': Cancel uninstall and go back" -Level INFO
        & "C:\Program Files\dsl\main.ps1"
    }
    "e" {
        Write-Log -Message "User selected 'e': Cancel uninstall and go back" -Level INFO
        & "C:\Program Files\dsl\main.ps1"
    }
    default {
        Write-Log -Message "User entered invalid uninstall option: $caseinput" -Level WARN
        Write-Host "Wrong Case Input" -ForegroundColor Red
        Start-Sleep -Seconds 2
        $validinput = $false
    }
}
} while ($validinput -eq $false)
