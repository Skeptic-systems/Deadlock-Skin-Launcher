Import-Module "C:\Program Files\dsl\public\args.psm1"
Import-Module "C:\Program Files\dsl\uninstall\subswitch.psm1"
Import-Module "C:\Program Files\dsl\public\errorhandling.psm1"

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
    Write-Host "`nThe following Skins are installed:" -ForegroundColor Yellow
    Write-Host ""
    
    # Error Handling
    $jsonPath = "C:\Program Files\dsl\public\config.json"
    $testpath = Test-Path $jsonPath -ErrorAction SilentlyContinue
    $jsonContent = Get-Content $jsonPath -Raw -ErrorAction SilentlyContinue
    
    if (-Not (Test-Path $jsonPath) -or [string]::IsNullOrWhiteSpace((Get-Content $jsonPath -Raw))) {
        Write-Host "There are no skins installed" -ForegroundColor Yellow
        Show-ErrorMessage -title "File Not Found or Empty" -description "The configuration file is missing or is Empty" -debugvar1key "Path" -debugvar1value "$jsonPath" -debugvar2key "Path exists" -debugvar2value "$testpath" -debugvar3key "Json Content" -debugvar3value "$jsonContent" 
    }

    # Ermittele Konfiguration und installierte Skins
    $config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
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
            else { Write-Host "Skin 1 is not installed!"; $validinput = $false }
        }
        "2" {
            if ($entries.Count -ge 2) {
                $skin = $entries[1]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 2 is not installed!"; $validinput = $false }
        }
        "3" {
            if ($entries.Count -ge 3) {
                $skin = $entries[2]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 3 is not installed!"; $validinput = $false }
        }
        "4" {
            if ($entries.Count -ge 4) {
                $skin = $entries[3]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 4 is not installed!"; $validinput = $false }
        }
        "5" {
            if ($entries.Count -ge 5) {
                $skin = $entries[4]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 5 is not installed!"; $validinput = $false }
        }
        "6" {
            if ($entries.Count -ge 6) {
                $skin = $entries[5]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 6 is not installed!"; $validinput = $false }
        }
        "7" {
            if ($entries.Count -ge 7) {
                $skin = $entries[6]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 7 is not installed!"; $validinput = $false }
        }
        "8" {
            if ($entries.Count -ge 8) {
                $skin = $entries[7]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 8 is not installed!"; $validinput = $false }
        }
        "9" {
            if ($entries.Count -ge 9) {
                $skin = $entries[8]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 9 is not installed!"; $validinput = $false }
        }
        "10" {
            if ($entries.Count -ge 10) {
                $skin = $entries[9]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 10 is not installed!"; $validinput = $false }
        }
        "11" {
            if ($entries.Count -ge 11) {
                $skin = $entries[10]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 11 is not installed!"; $validinput = $false }
        }
        "12" {
            if ($entries.Count -ge 12) {
                $skin = $entries[11]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 12 is not installed!"; $validinput = $false }
        }
        "13" {
            if ($entries.Count -ge 13) {
                $skin = $entries[12]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 13 is not installed!"; $validinput = $false }
        }
        "14" {
            if ($entries.Count -ge 14) {
                $skin = $entries[13]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 14 is not installed!"; $validinput = $false }
        }
        "15" {
            if ($entries.Count -ge 15) {
                $skin = $entries[14]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 15 is not installed!"; $validinput = $false }
        }
        "16" {
            if ($entries.Count -ge 16) {
                $skin = $entries[15]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 16 is not installed!"; $validinput = $false }
        }
        "17" {
            if ($entries.Count -ge 17) {
                $skin = $entries[16]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 17 is not installed!"; $validinput = $false }
        }
        "18" {
            if ($entries.Count -ge 18) {
                $skin = $entries[17]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 18 is not installed!"; $validinput = $false }
        }
        "19" {
            if ($entries.Count -ge 19) {
                $skin = $entries[18]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 19 is not installed!"; $validinput = $false }
        }
        "20" {
            if ($entries.Count -ge 20) {
                $skin = $entries[19]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 20 is not installed!"; $validinput = $false }
        }
        "21" {
            if ($entries.Count -ge 21) {
                $skin = $entries[20]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 21 is not installed!"; $validinput = $false }
        }
        "22" {
            if ($entries.Count -ge 22) {
                $skin = $entries[21]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 22 is not installed!"; $validinput = $false }
        }
        "23" {
            if ($entries.Count -ge 23) {
                $skin = $entries[22]
                subswitch -Skin $skin 
                $validinput = $true
            }
            else { Write-Host "Skin 23 is not installed!"; $validinput = $false }
        }
        "e" {
            & "C:\Program Files\dsl\main.ps1"
        }
        Default {
            Write-Host "Invalid input. Please choose a valid value" -ForegroundColor Red
            start-sleep -Seconds 2
            $validinput = $false
        }
    }
} while (-not $validinput)
