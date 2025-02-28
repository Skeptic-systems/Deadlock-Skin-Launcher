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
Are you sure you want to uninstall DSL?


[y] To uninstall dsl ans skins
[s] To uninstall dsl
[n] To go back
@"

$caseinput = Read-Host
switch ($caseinput){
    "y" {
        write-Host "Uninstall addons" -ForegroundColor Cyan
        # Load Installpath form configfile
        $jsonPath = "C:\Program Files\dsl\install\config.json"
        $config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
        $installpath = $config.installpath
        Remove-Item "$installpath" -Recurse -Force
        Write-Host "Uninstalled addons succesfully" -ForegroundColor Green
        
        Write-Host "Uninstalling dsl"
        Remove-Item "C:\Program Files\dsl" -Recurse -Force
        Write-Host "Uninstalled dsl succesfully" -ForegroundColor Green
        Start-Sleep -Seconds 2
    }
    "s" {
        Write-Host "Uninstalling dsl"
        Remove-Item "C:\Program Files\dsl" -Recurse -Force
        Start-Sleep -Seconds 2
        Write-Host "Uninstalled dsl succesfully" -ForegroundColor Green
    }
    "n" {
        & "C:\Program Files\dsl\main.ps1"
    }
    "e" {
        & "C:\Program Files\dsl\main.ps1"
    }
    default {
        Write-Host "Wrong input" -ForegroundColor Red
        Start-Sleep -Seconds 2
        & "C:\Program Files\dsl\uninstall\dsl\uninstall.ps1"
    }
}
& "C:\Program Files\dsl\main.ps1"