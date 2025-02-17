import-module "installpath.psm1"
import-module "installskin.psm1"
###

do {
write-host "[1] Install Skin"
write-host "[2] Install Soundtrack"

write-host "  > " -NoNewline -ForegroundColor cyan
$caseInput = Read-Host
$config = Get-Config
$installpath = $config.installpath
switch($caseInput){        
    1 {
        $validinput = $true
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
        $subcaseinput = Read-Host
        switch ($subcaseinput) {
            1 {
                install-skin -installpath $installpath -Display1 "[1] Senator Armstrong" -Display2 "[2] Police Academy" -Display3 "[3] Dripbrams" -Display4 "[4] Doomguy" -Inspectlink1 "https://gamebanana.com/mods/561445" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/abrams/SenatorArmstrong.zip" -Inspectlink2 "https://gamebanana.com/mods/563942" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/abrams/PoliceAcademy.zip" -Inspectlink3 "https://gamebanana.com/mods/558299" -Downloadlink3 "https://skeptic-systems.de/data/deadlock/abrams/Dripbrams.zip" -Inspectlink4 "https://gamebanana.com/mods/559162" -Downloadlink4 "https://skeptic-systems.de/data/deadlock/abrams/Doomguy.zip"
             }
            2 {
                install-skin -installpath $installpath -Display1 "[1] Delivery Service" -Display2 "[2] Transformer"  -Inspectlink1 "https://gamebanana.com/mods/561445" -Downloadlink1 "https://skeptic-systems.de/data/deadlock/abrams/SenatorArmstrong.zip" -Inspectlink2 "https://gamebanana.com/mods/563942" -Downloadlink2 "https://skeptic-systems.de/data/deadlock/abrams/PoliceAcademy.zip" 
            }
            3 {

            }
            4 {

            }
            5 {

            }
            6 {

            }
            7 {

            }
            8 {

            }
            9 {

            }
            10 {

            }
            11 {

            }
            12 {

            }
            13 {

            }
            14 {

            }
            15 {

            }
            16 {

            }
            17 {

            }
            18 {

            }
            19 {

            }
            20 {

            }
            21 {

            }
            22 {

            }
            23 {

            }
            "e" {
                return
            }
            default {

            }
        }
    }            
    2 { 
        & "$workdir\dsl\uninstall\uninstall.ps1"
        $validinput = $true 
    }
    "e" {
        & "$workdir\dsl\main.ps1"
    }    
    default {
        write-host "wrong case input"
        $validinput = $false
    }            
}
} while ($validinput -eq $false)