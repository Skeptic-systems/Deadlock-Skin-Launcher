
import-module "C:\Users\jonas\Desktop\DSL\dsl\git\install\config.psm1"
#import-module
#import-module
# Create workdir
$workdir = "C:\Program Files\dsl"
if (!(test-path $workdir)){
    mkdir $workdir
}

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
            start-sleep -Seconds 3
        }
        else {
        mkdir $changepath\addons
        $configData = @{installpath = "$changepath\addons"}
        Save-Config -ConfigData $configData
        }
    } while (!($validinput))
}
else {
    mkdir "$installpath\addons"
    $configData = @{installpath = "$installpath\addons"}
    Save-Config -ConfigData $configData
}



do {
write-host @"
    ____                 ____           __      _____ __   _          __                           __             
   / __ \___  ____ _____/ / /___  _____/ /__   / ___// /__(_)___     / /   ____ ___  ______  _____/ /_  ___  _____
  / / / / _ \/ __ `/ __  / / __ \/ ___/ //_/   \__ \/ //_/ / __ \   / /   / __ `/ / / / __ \/ ___/ __ \/ _ \/ ___/
 / /_/ /  __/ /_/ / /_/ / / /_/ / /__/ ,<     ___/ / ,< / / / / /  / /___/ /_/ / /_/ / / / / /__/ / / /  __/ /    
/_____/\___/\__,_/\__,_/_/\____/\___/_/|_|   /____/_/|_/_/_/ /_/  /_____/\__,_/\__,_/_/ /_/\___/_/ /_/\___/_/     
"@ -ForegroundColor Green
write-host "by Skeptic" -ForegroundColor Cyan
Write-Host "`n`n`n`n"

write-host "[1] Install Assets" -ForegroundColor Yellow
Write-Host "[2]  List or uninstall Assets" -ForegroundColor Blue
Write-Host "[3]  Fix DSL" -ForegroundColor Magenta
Write-Host "[4]  Uninstall DSL" -ForegroundColor Gray
write-host "  > " -NoNewline -ForegroundColor cyan

$caseInput = Read-Host
switch($caseInput){                    
    1 {
        & "$workdir\dsl\install\install.ps1"
        $validinput = $true 
    }            
    2 { 
        & "$workdir\dsl\uninstall\uninstall.ps1"
        $validinput = $true 
    }            
    3 {
        & "$workdir\dsl\fix\fix.ps1"
        $validinput = $true 
    }            
    4 {
        & "$workdir\dsl\uninstall\dsl\uninstall.ps1"
        $validinput = $true
    }        
    default {
        write-host "wrong case input"
        $validinput = $false
    }            
}
} while ($validinput -eq $false)