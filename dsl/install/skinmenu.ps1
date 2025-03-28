import-module "C:\Program Files\dsl\install\skinsubmenu.psm1"
import-module "C:\Program Files\dsl\public\args.psm1"
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
    write-host @"
[1] Abrams
[2] Bebop
[3] Dynamo
[4] Grey Talon (new)
[5] Haze (new)
[6] Infernus (new)
[7] Ivy
[8] Kelvin
[9] Lady Geist
[10] Lash (new)
[11] McGinnis
[12] Mirage (new)
[13] Mo and Krill
[14] Paradox
[15] Pocket
[16] Seven (new)
[17] Shiv
[18] Vindicta (new)
[19] Viper
[20] Viscous
[21] Warden (new)
[22] Wraith
[23] Yamato (new)
[24] Holiday (new)
[e] To go back
"@
    Write-Host "`n"
    write-host " > " -NoNewline -ForegroundColor cyan
    $subcaseinput = Read-Host

    Write-Log -Message "Skin submenu input received: $subcaseinput" -Level INFO

    switch ($subcaseinput) {
        1 {
            $skinName = Get-Classname -ClassName "abrams"
            if ($skinName) {
                Write-Log -Message "Skin 'abrams' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Abrams installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'abrams'" -Level INFO
                install-skin -Display1 "[1] Senator Armstrong" -Display2 "[2] Police Academy" -Display3 "[3] Dripbrams" -Display4 "[4] Doomguy" -Inspectlink1 "https://gamebanana.com/mods/561445" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/abrams/SenatorArmstrong.zip" -Inspectlink2 "https://gamebanana.com/mods/563942" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/abrams/PoliceAcademy.zip" -Inspectlink3 "https://gamebanana.com/mods/558299" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/abrams/Dripbrams.zip" -Inspectlink4 "https://gamebanana.com/mods/559162" -Downloadlink4 "https://skeptic-systems.de/data/deadlock/abrams/Doomguy.zip"
            }
        }
        2 {
            $skinName = Get-Classname -ClassName "bebop"
            if ($skinName) {
                Write-Log -Message "Skin 'bebop' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Bebop installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'bebop'" -Level INFO
                install-skin -Display1 "[1] Delivery Service" -Display2 "[2] Transformer" -Inspectlink1 "https://gamebanana.com/mods/551081" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/bebop/DeliveryService.zip" -Inspectlink2 "https://gamebanana.com/mods/559623" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/bebop/Transformer.zip" 
            }    
        }
        3 {
            $skinName = Get-Classname -ClassName "dynamo"
            if ($skinName) {
                Write-Log -Message "Skin 'dynamo' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Dynamo installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'dynamo'" -Level INFO
                install-skin -Display1 "[1] Santa Festive" -Inspectlink1 "https://gamebanana.com/mods/563199" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/dynamo/SantaFestive.zip"
            }
        }
        4 {
            $skinName = Get-Classname -ClassName "greytalon"
            if ($skinName) {
                Write-Log -Message "Skin 'greytalon' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Grey Talon installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'greytalon'" -Level INFO
                install-skin -Display1 "[1] Minecraft Skeleton (new)" -Display2 "[2] Svoi" -Inspectlink1 "https://gamebanana.com/mods/563116" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/greytalon/MinecraftSkeleton.zip" -Inspectlink2 "https://gamebanana.com/mods/556396" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/greytalon/Svoi.zip"
            }
        }
        5 {
            $skinName = Get-Classname -ClassName "haze"
            if ($skinName) {
                Write-Log -Message "Skin 'haze' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Haze installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'haze'" -Level INFO
                install-skin -Display1 "[1] Haze2.0" -Display2 "[2] Helltorn" -Display3 "[3] Voidwalker (new)" -Inspectlink1 "https://gamebanana.com/mods/561867" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/haze/Haze2.0.zip" -Inspectlink2 "https://gamebanana.com/mods/557963" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/haze/Helltorn.zip" -Inspectlink3 "https://gamebanana.com/mods/562592" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/haze/Voidwalker.zip"
            }
        }
        6 {
            $skinName = Get-Classname -ClassName "infernus"
            if ($skinName) {
                Write-Log -Message "Skin 'infernus' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Infernus installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'infernus'" -Level INFO
                install-skin -Display1 "[1] Scoutfernus" -Display2 "[2] Tommy" -Inspectlink1 "https://gamebanana.com/mods/554396" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/infernus/Scoutfernus.zip" -Inspectlink2 "https://gamebanana.com/mods/579911" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/infernus/tommy.zip"
            }
        }
        7 {
            $skinName = Get-Classname -ClassName "ivy"
            if ($skinName) {
                Write-Log -Message "Skin 'ivy' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Ivy installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'ivy'" -Level INFO
                install-skin -Display1 "[1] Christmas Sweater" -Display2 "[2] Harmless Rose" -Inspectlink1 "https://gamebanana.com/mods/572870" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/ivy/ChristmasSweater.zip" -Inspectlink2 "https://gamebanana.com/mods/556396" -Downloadlink2 "https://skeptic-systems.de/data/ivy/HarmlessRose.zip"
            }
        }
        8 {
            $skinName = Get-Classname -ClassName "kelvin"
            if ($skinName) {
                Write-Log -Message "Skin 'kelvin' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Kelvin installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'kelvin'" -Level INFO
                install-skin -Display1 "[1] Amazon Worker" -Inspectlink1 "https://gamebanana.com/mods/563199" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/dynamo/SantaFestive.zip"
            }
        }
        9 {
            $skinName = Get-Classname -ClassName "ladygeist"
            if ($skinName) {
                Write-Log -Message "Skin 'ladygeist' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Ladygeist installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'ladygeist'" -Level INFO
                install-skin -Display1 "[1] Great Fairy" -Display2 "[2] Red Geist" -Display3 "[3] Fishnet" -Inspectlink1 "https://gamebanana.com/mods/557404" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/ladygeist/GreatFairy.zip" -Inspectlink2 "https://gamebanana.com/mods/555341" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/ladygeist/RedGeist.zip" -Inspectlink3 "https://gamebanana.com/mods/556049" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/ladygeist/Fishnet.zip" 
            }
        }
        10 {
            $skinName = Get-Classname -ClassName "lash"
            if ($skinName) {
                Write-Log -Message "Skin 'lash' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Lash installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'lash'" -Level INFO
                install-skin -Display1 "[1] Megalo Don Lash" -Display2 "[2] Saxton" -Display3 "[2] Dudley (new)" -Inspectlink1 "https://gamebanana.com/mods/558856" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/lash/MegaloDonLash.zip" -Inspectlink2 "https://gamebanana.com/mods/555227" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/lash/Saxton.zip" -Inspectlink3 "https://gamebanana.com/mods/579523" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/lash/Dudley"
            }
        }
        11 {
            $skinName = Get-Classname -ClassName "mcginnius"
            if ($skinName) {
                Write-Log -Message "Skin 'mcginnius' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Mcginnius installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'mcginnius'" -Level INFO
                install-skin -Display1 "[1] TF2 Mcginnis" -Inspectlink1 "https://gamebanana.com/mods/552906" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/mcginnius/tf2mcginnis.zip"
            }
        }
        12 {
            $skinName = Get-Classname -ClassName "mirage"
            if ($skinName) {
                Write-Log -Message "Skin 'mirage' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Mirage installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'mirage'" -Level INFO
                install-skin -Display1 "[1] Mirage Reaper (new)" -Inspectlink1 "https://gamebanana.com/mods/575956" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/mirage/MirageReaper.zip"
            }
        }
        13 {
            $skinName = Get-Classname -ClassName "mo and krill"
            if ($skinName) {
                Write-Log -Message "Skin 'mo and krill' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Mo and Krill installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'mo and krill'" -Level INFO
                install-skin -Display1 "[1] Hoglin and Piglin" -Display2 "[2] Mo and Mo" -Display3 "[3] Shark and Krill" -Display4 "[4] Warwick and Powder" -Inspectlink1 "https://gamebanana.com/mods/571935" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/mo and krill/HoglinandPiglin.zip" -Inspectlink2 "https://gamebanana.com/mods/551071" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/mo and krill/MoandMo.zip" -Inspectlink3 "https://gamebanana.com/mods/556230" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/mo and krill/SharkandKrill.zip" -Inspectlink4 "https://gamebanana.com/mods/564782" -Downloadlink4 "https://skeptic-systems.de/data/deadlock/mo and krill/WarwickandPowder.zip"
            }
        }
        14 {
            $skinName = Get-Classname -ClassName "paradox"
            if ($skinName) {
                Write-Log -Message "Skin 'paradox' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Paradox installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'paradox'" -Level INFO
                install-skin -Display1 "[1] Bikini" -Display2 "[2] Bunnydox" -Display3 "[3] Echo" -Display4 "[4] Pyradox" -Inspectlink1 "https://gamebanana.com/mods/557218" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/paradox/Bikini.zip" -Inspectlink2 "https://gamebanana.com/mods/555464" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/paradox/Bunnydox.zip" -Inspectlink3 "https://gamebanana.com/mods/562166" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/paradox/Echo.zip" -Inspectlink4 "https://gamebanana.com/mods/555961" -Downloadlink4 "https://skeptic-systems.de/data/deadlock/paradox/Pyradox.zip"
            }
        }
        15 {
            $skinName = Get-Classname -ClassName "pocket"
            if ($skinName) {
                Write-Log -Message "Skin 'pocket' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Pocket installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'pocket'" -Level INFO
                install-skin -Display1 "[1] Golden Pocket" -Inspectlink1 "https://gamebanana.com/mods/559174" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/pocket/GoldenPocket.zip"
            }
        }
        16 {
            $skinName = Get-Classname -ClassName "seven"
            if ($skinName) {
                Write-Log -Message "Skin 'seven' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Seven installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'seven'" -Level INFO
                install-skin -Display1 "[1] Raiden" -Display2 "[1] Tommy" -Inspectlink1 "https://gamebanana.com/mods/564236" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/seven/Raiden.zip" -Inspectlink2 "https://gamebanana.com/mods/579911" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/seven/tommy.zip"
            }
        }
        17 {
            $skinName = Get-Classname -ClassName "shiv"
            if ($skinName) {
                Write-Log -Message "Skin 'shiv' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Shiv installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'shiv'" -Level INFO
                install-skin -Display1 "[1] Shiv but with fern hat" -Display2 "[2] Yokai" -Inspectlink1 "https://gamebanana.com/mods/559041" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/shiv/Shivbutfernhat.zip" -Inspectlink2 "https://gamebanana.com/mods/560444" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/shiv/Yokai.zip"
            }
        }
        18 {
            $skinName = Get-Classname -ClassName "vindicta"
            if ($skinName) {
                Write-Log -Message "Skin 'vindicta' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Vindicta installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'vindicta'" -Level INFO
                install-skin -Display1 "[1] Bikinidicta (new)" -Display2 "[2] Widowmaker" -Inspectlink1 "https://gamebanana.com/mods/554012" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/vindicta/Bikinidicta.zip" -Inspectlink2 "https://gamebanana.com/mods/559218" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/vindicta/Widowmaker.zip"
            }
        }
        19 {
            $skinName = Get-Classname -ClassName "viper"
            if ($skinName) {
                Write-Log -Message "Skin 'viper' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Viper installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'viper'" -Level INFO
                install-skin -Display1 "[1] Snaker" -Inspectlink1 "https://gamebanana.com/mods/573132" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/viper/Snaker.zip"
            }
        }
        20 {
            $skinName = Get-Classname -ClassName "viscous"
            if ($skinName) {
                Write-Log -Message "Skin 'viscous' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Viscous installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'viscous'" -Level INFO
                install-skin -Display1 "[1] Viscoast" -Inspectlink1 "https://gamebanana.com/mods/555180" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/viscous/Viscoast.zip"
            }
        }
        21 {
            $skinName = Get-Classname -ClassName "warden"
            if ($skinName) {
                Write-Log -Message "Skin 'warden' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Warden installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'warden'" -Level INFO
                install-skin -Display1 "[1] Feral Warden" -Display2 "[2] Tommy" -Inspectlink1 "https://gamebanana.com/mods/572702" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/warden/FeralWarden.zip" -Inspectlink2 "https://gamebanana.com/mods/579911" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/warden/tommy.zip"
            }
        }
        22 {
            $skinName = Get-Classname -ClassName "wraith"
            if ($skinName) {
                Write-Log -Message "Skin 'wraith' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Wraith installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "No skins available for 'wraith'" -Level INFO
                write-host "No skins for Wraith available"
            }
        }
        23 {
            $skinName = Get-Classname -ClassName "yamato"
            if ($skinName) {
                Write-Log -Message "Skin 'yamato' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Yamato installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'yamato'" -Level INFO
                install-skin -Display1 "[1] 2B (new)" -Display2 "[2] Mythrato" -Display3 "[3] Raiden (new)" -Inspectlink1 "https://gamebanana.com/mods/569650" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/yamato/2b.zip" -Inspectlink2 "https://gamebanana.com/mods/556418" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/yamato/Mythrato.zip" -Inspectlink3 "https://gamebanana.com/mods/559345" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/yamato/Raiden.zip"
            }
        }
        24 {
            $skinName = Get-Classname -ClassName "holiday"
            if ($skinName) {
                Write-Log -Message "Skin 'holiday' already installed: $skinName" -Level WARN
                Write-Host "There is already a skin for Holiday installed." -ForegroundColor Red
                Write-Host "The Skin is: $skinName" -ForegroundColor Red
                $validinput = $false
                Start-Sleep -Seconds 3
            }
            else {
                Write-Log -Message "Installing skin 'holiday'" -Level INFO
                install-skin -Display1 "[1] Ocelot (new)" -Inspectlink1 "https://gamebanana.com/mods/557591" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/holiday/Ocelot.zip"
            }
        }
        "e" {
            Write-Log -Message "User selected 'e': Returning to install menu" -Level INFO
            & "C:\Program Files\dsl\install\installmenu.ps1"
        }
        default {
            Write-Log -Message "Invalid input in skin submenu: $subcaseinput" -Level WARN
            write-host "Wrong Case Input" -ForegroundColor Red
            start-sleep -Seconds 2
            $validinput = $false
        }
    }
} while ($validinput -eq $false)
