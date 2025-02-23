import-module "C:\Program Files\dsl\install\installskin.psm1"
import-module "C:\Program Files\dsl\install\args.psm1"
###

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

write-host " > " -NoNewline -ForegroundColor cyan
$caseInput = Read-Host
switch($caseInput){        
    1 {
        $validinput = $true
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
[1] Abrams
[2] Bebop
[3] Dynamo
[4] Grey Talon
[5] Haze
[6] Infernus
[7] Ivy
[8] Kelvin
[9] Lady Geist
[10] Lash
[11] McGinnis
[12] Mirage
[13] Mo and Krill
[14] Paradox
[15] Pocket
[16] Seven
[17] Shiv
[18] Vindicta
[19] Viper
[20] Viscous
[21] Warden
[22] Wraith
[23] Yamato
"@
        Write-Host "`n"
        write-host " > " -NoNewline -ForegroundColor cyan
        $subcaseinput = Read-Host
        switch ($subcaseinput) {
            1 {
                $skinName = Get-Classname -ClassName "abrams"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Abrams installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Senator Armstrong" -Display2 "[2] Police Academy" -Display3 "[3] Dripbrams" -Display4 "[4] Doomguy" -Inspectlink1 "https://gamebanana.com/mods/561445" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/abrams/SenatorArmstrong.zip" -Inspectlink2 "https://gamebanana.com/mods/563942" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/abrams/PoliceAcademy.zip" -Inspectlink3 "https://gamebanana.com/mods/558299" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/abrams/Dripbrams.zip" -Inspectlink4 "https://gamebanana.com/mods/559162" -Downloadlink4 "https://skeptic-systems.de/data/deadlock/abrams/Doomguy.zip"
                }
            }
            2 {
                $skinName = Get-Classname -ClassName "bebop"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Bebop installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Delivery Service" -Display2 "[2] Transformer"  -Inspectlink1 "https://gamebanana.com/mods/551081" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/bebop/DeliveryService.zip" -Inspectlink2 "https://gamebanana.com/mods/559623" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/bebop/Transformer.zip" 
                }    
            }
            3 {
                $skinName = Get-Classname -ClassName "dynamo"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Dynamo installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Santa Festive" -Inspectlink1 "https://gamebanana.com/mods/563199" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/dynamo/SantaFestive.zip"
                }
            }
            4 {
                $skinName = Get-Classname -ClassName "greytalon"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Grey Talon installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Minecraft Skeleton" -Display2 "[2] Svoi"  -Inspectlink1 "https://gamebanana.com/mods/563116" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/greytalon/MinecraftSkeleton.zip" -Inspectlink2 "https://gamebanana.com/mods/556396" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/greytalon/Svoi.zip"
                }
            }
            5 {
                $skinName = Get-Classname -ClassName "haze"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Haze installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Haze2.0" -Display2 "[2] Helltorn" -Display3 "[3] Voidwalker" -Inspectlink1 "https://gamebanana.com/mods/561867" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/haze/Haze2.0.zip" -Inspectlink2 "https://gamebanana.com/mods/557963" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/haze/Helltorn.zip" -Inspectlink3 "https://gamebanana.com/mods/562592" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/haze/Voidwalker.zip"
            }
            }
            6 {
                $skinName = Get-Classname -ClassName "infernus"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Infernus installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Scoutfernus" -Inspectlink1 "https://gamebanana.com/mods/554396" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/infernus/Scoutfernus.zip"
                }
            }
            7 {
                $skinName = Get-Classname -ClassName "ivy"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Ivy installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Christmas Sweater" -Display2 "[2] Harmless Rose"  -Inspectlink1 "https://gamebanana.com/mods/572870" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/ivy/ChristmasSweater.zip" -Inspectlink2 "https://gamebanana.com/mods/556396" -Downloadlink2 "https://skeptic-systems.de/data/ivy/HarmlessRose.zip"
                }
            }
            8 {
                $skinName = Get-Classname -ClassName "kelvin"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Kelvin installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Amazon Worker" -Inspectlink1 "https://gamebanana.com/mods/563199" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/dynamo/SantaFestive.zip"
                }
            }
            9 {
                $skinName = Get-Classname -ClassName "ladygeist"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Ladygeist installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Great Fairy" -Display2 "[2] Red Geist" -Display3 "[3] Fishnet" -Inspectlink1 "https://gamebanana.com/mods/557404" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/ladygeist/GreatFairy.zip" -Inspectlink2 "https://gamebanana.com/mods/555341" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/ladygeist/RedGeist.zip" -Inspectlink3 "https://gamebanana.com/mods/556049" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/ladygeist/Fishnet.zip" 
                }
            }
            10 {
                $skinName = Get-Classname -ClassName "lash"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Lash installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Megalo Don Lash" -Display2 "[2] Saxton"  -Inspectlink1 "https://gamebanana.com/mods/558856" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/lash/MegaloDonLash.zip" -Inspectlink2 "https://gamebanana.com/mods/555227" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/lash/Saxton.zip"
                }
            }
            11 {
                $skinName = Get-Classname -ClassName "mcginnius"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Mcginnius installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] TF2 Mcginnis" -Inspectlink1 "https://gamebanana.com/mods/552906" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/mcginnius/tf2mcginnis.zip"
                }
            }
            12 {
                $skinName = Get-Classname -ClassName "mirage"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Mirage installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Mirage Reaper" -Inspectlink1 "https://gamebanana.com/mods/575956" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/mirrage/MirageReaper.zip"
                }
            }
            13 {
                $skinName = Get-Classname -ClassName "mo and krill"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Mo and Krill installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Hoglin and Piglin" -Display2 "[2] Mo and Mo" -Display3 "[3] Shark and Krill" -Display4 "[4] Warwick and Powder" -Inspectlink1 "https://gamebanana.com/mods/571935" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/mo and krill/HoglinandPiglin.zip" -Inspectlink2 "https://gamebanana.com/mods/551071" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/mo and krill/MoandMo.zip" -Inspectlink3 "https://gamebanana.com/mods/556230" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/mo and krill/SharkandKrill.zip" -Inspectlink4 "https://gamebanana.com/mods/564782" -Downloadlink4 "https://skeptic-systems.de/data/deadlock/mo and krill/WarwickandPowder.zip"
                }
            }
            14 {
                $skinName = Get-Classname -ClassName "paradox"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Paradox installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Bikini" -Display2 "[2] Bunnydox" -Display3 "[3] Echo" -Display4 "[4] Pyradox" -Inspectlink1 "https://gamebanana.com/mods/557218" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/paradox/Bikini.zip" -Inspectlink2 "https://gamebanana.com/mods/555464" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/paradox/Bunnydox.zip" -Inspectlink3 "https://gamebanana.com/mods/562166" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/paradox/Echo.zip" -Inspectlink4 "https://gamebanana.com/mods/555961" -Downloadlink4 "https://skeptic-systems.de/data/deadlock/paradox/Pyradox.zip"
                }
            }
            15 {
                $skinName = Get-Classname -ClassName "pocket"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Pocket installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Golden Pocket" -Inspectlink1 "https://gamebanana.com/mods/559174" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/pocket/GoldenPocket.zip"
                }
            }
            16 {
                $skinName = Get-Classname -ClassName "seven"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Seven installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Raiden" -Inspectlink1 "https://gamebanana.com/mods/564236" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/seven/Raiden.zip"
                }
            }
            17 {
                $skinName = Get-Classname -ClassName "shiv"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Shiv installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Shiv but with fern hat" -Display2 "[2] Yokai"  -Inspectlink1 "https://gamebanana.com/mods/559041" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/shiv/Shivbutfernhat.zip" -Inspectlink2 "https://gamebanana.com/mods/560444" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/shiv/Yokai.zip"
                }
            }
            18 {
                $skinName = Get-Classname -ClassName "vindicta"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Vindicta installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Bikinidicta" -Display2 "[2] Widowmaker"  -Inspectlink1 "https://gamebanana.com/mods/554012" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/vindicta/Bikinidicta.zip" -Inspectlink2 "https://gamebanana.com/mods/559218" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/vindicta/Widowmaker.zip"
                }
            }
            19 {
                $skinName = Get-Classname -ClassName "viper"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Viper installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Snaker" -Inspectlink1 "https://gamebanana.com/mods/573132" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/viper/Snaker.zip"
                }
            }
            20 {
                $skinName = Get-Classname -ClassName "viscous"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Viscous installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Viscoast" -Inspectlink1 "https://gamebanana.com/mods/555180" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/viscous/Viscoast.zip"
                }
            }
            21 {
                $skinName = Get-Classname -ClassName "warden"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Warden installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] Feral Warden" -Inspectlink1 "https://gamebanana.com/mods/572702" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/warden/FeralWarden.zip"
                }
            }
            22 {
                $skinName = Get-Classname -ClassName "wraith"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Wraith installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                write-host "No skins for Wraith avaible"
                }
            }
            23 {
                $skinName = Get-Classname -ClassName "yamato"
                if ($skinName) {
                    Write-Host "Es ist Bereits ein Skin für Yamato installiert." -ForegroundColor Red
                    Write-Host "Der Skin ist: $skinName" -ForegroundColor Red
                    $validinput = $false
                    Start-Sleep -Seconds 3
                }
                else {
                install-skin -Display1 "[1] 2B" -Display2 "[2] Mythrato" -Display3 "[3] Raiden" -Inspectlink1 "https://gamebanana.com/mods/569650" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/yamato/2b.zip" -Inspectlink2 "https://gamebanana.com/mods/556418" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/yamato/Mythrato.zip" -Inspectlink3 "https://gamebanana.com/mods/559345" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/yamato/Raiden.zip" 
                }
            }
            "e" {
                & "C:\Users\jonas\Nextcloud\Documents\Skripts\Powershell\Deadlock Skin Launcher\Deadlock-Skin-Launcher\dsl\install\install.ps1"
            }
            default {
                $validinput = $false
            }
        }
    }            
    2 { 
        & "C:\Users\jonas\Nextcloud\Documents\Skripts\Powershell\Deadlock Skin Launcher\Deadlock-Skin-Launcher\dsl\main.ps1"
        $validinput = $true 
    }
    "e" {
        & "C:\Users\jonas\Nextcloud\Documents\Skripts\Powershell\Deadlock Skin Launcher\Deadlock-Skin-Launcher\dsl\main.ps1"
    }    
    default {
        write-host "wrong case input"
        $validinput = $false
    }            
}
} while ($validinput -eq $false)