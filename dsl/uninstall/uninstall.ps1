Import-Module "C:\Program Files\dsl\install\args.psm1"
Import-Module "C:\Program Files\dsl\uninstall\subswitch.psm1"

$validinput = $false

do {
    Clear-Host
    Write-Host @"
    ____                 ____           __      _____ __   _          __                           __             
   / __ \___  ____ _____/ / /___  _____/ /__   / ___// /__(_)___     / /   ____ ___  ______  _____/ /_  ___  _____
  / / / / _ \/ __  / __  / / __ \/ ___/ //_/   \__ \/ //_/ / __ \   / /   / __  / / / / __ \/ ___/ __ \/ _ \/ ___/
 / /_/ /  __/ /_/ / /_/ / / /_/ / /__/ ,<     ___/ /  < / / / / /  / /___/ /_/ / /_/ / / / / /__/ / / /  __/ /    
/_____/\___/\__,_/\__,_/_/\____/\___/_/|_|   /____/_/|_/_/_/ /_/  /_____/\__,_/\__,_/_/ /_/\___/_/ /_/\___/_/     
"@ -ForegroundColor Green

    Write-Host "by Skeptic" -ForegroundColor Cyan
    Write-Host "`nDie folgenden Skins sind installiert:" -ForegroundColor Yellow
    Write-Host ""

    # Ermittele Konfiguration und installierte Skins
    $config = Get-Config
    $installpath = $config.installpath
    $fileNames = Get-ChildItem -Path "$installpath\" -File | ForEach-Object { $_.Name }
    $entries = Get-Charlist

    $counter = 1
    foreach ($entry in $entries) {
        if ($fileNames -contains $entry.FileName) {
            Write-Host "[$counter] $($entry.ClassName) $($entry.SkinName)"
            $counter++
        }
    }
    Write-Host "[e] To go back"

    Write-Host "`n > " -NoNewline -ForegroundColor Cyan
    $read = Read-Host

    switch ($read) {
        "1" {
            if ($entries.Count -ge 1) {
                $skin = $entries[0]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 1 ist nicht installiert!"; $validinput = $false }
        }
        "2" {
            if ($entries.Count -ge 2) {
                $skin = $entries[1]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 2 ist nicht installiert!"; $validinput = $false }
        }
        "3" {
            if ($entries.Count -ge 3) {
                $skin = $entries[2]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 3 ist nicht installiert!"; $validinput = $false }
        }
        "4" {
            if ($entries.Count -ge 4) {
                $skin = $entries[3]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 4 ist nicht installiert!"; $validinput = $false }
        }
        "5" {
            if ($entries.Count -ge 5) {
                $skin = $entries[4]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 5 ist nicht installiert!"; $validinput = $false }
        }
        "6" {
            if ($entries.Count -ge 6) {
                $skin = $entries[5]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 6 ist nicht installiert!"; $validinput = $false }
        }
        "7" {
            if ($entries.Count -ge 7) {
                $skin = $entries[6]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 7 ist nicht installiert!"; $validinput = $false }
        }
        "8" {
            if ($entries.Count -ge 8) {
                $skin = $entries[7]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 8 ist nicht installiert!"; $validinput = $false }
        }
        "9" {
            if ($entries.Count -ge 9) {
                $skin = $entries[8]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 9 ist nicht installiert!"; $validinput = $false }
        }
        "10" {
            if ($entries.Count -ge 10) {
                $skin = $entries[9]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 10 ist nicht installiert!"; $validinput = $false }
        }
        "11" {
            if ($entries.Count -ge 11) {
                $skin = $entries[10]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 11 ist nicht installiert!"; $validinput = $false }
        }
        "12" {
            if ($entries.Count -ge 12) {
                $skin = $entries[11]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 12 ist nicht installiert!"; $validinput = $false }
        }
        "13" {
            if ($entries.Count -ge 13) {
                $skin = $entries[12]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 13 ist nicht installiert!"; $validinput = $false }
        }
        "14" {
            if ($entries.Count -ge 14) {
                $skin = $entries[13]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 14 ist nicht installiert!"; $validinput = $false }
        }
        "15" {
            if ($entries.Count -ge 15) {
                $skin = $entries[14]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 15 ist nicht installiert!"; $validinput = $false }
        }
        "16" {
            if ($entries.Count -ge 16) {
                $skin = $entries[15]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 16 ist nicht installiert!"; $validinput = $false }
        }
        "17" {
            if ($entries.Count -ge 17) {
                $skin = $entries[16]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 17 ist nicht installiert!"; $validinput = $false }
        }
        "18" {
            if ($entries.Count -ge 18) {
                $skin = $entries[17]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 18 ist nicht installiert!"; $validinput = $false }
        }
        "19" {
            if ($entries.Count -ge 19) {
                $skin = $entries[18]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 19 ist nicht installiert!"; $validinput = $false }
        }
        "20" {
            if ($entries.Count -ge 20) {
                $skin = $entries[19]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 20 ist nicht installiert!"; $validinput = $false }
        }
        "21" {
            if ($entries.Count -ge 21) {
                $skin = $entries[20]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 21 ist nicht installiert!"; $validinput = $false }
        }
        "22" {
            if ($entries.Count -ge 22) {
                $skin = $entries[21]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 22 ist nicht installiert!"; $validinput = $false }
        }
        "23" {
            if ($entries.Count -ge 23) {
                $skin = $entries[22]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 23 ist nicht installiert!"; $validinput = $false }
        }
        "e" {
            & "C:\Program Files\dsl\main.ps1"
        }
        Default {
            Write-Host "Ungültige Eingabe. Bitte wähle einen gültigen Wert." -ForegroundColor Red
            $validinput = $false
        }
    }
} while (-not $validinput)
