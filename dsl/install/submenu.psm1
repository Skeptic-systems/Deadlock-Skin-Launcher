import-module "C:\Program Files\dsl\install\args.psm1"
function Install-detail {
    param (
        [string]$Display,
        [string]$Inspectlink,
        [string]$Downloadlink
    )
    $Filtereddisplay = $Display -replace '^\[\d+\]\s*',''
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
    Write-Host "$Filtereddisplay"
    Write-Host "`n"
    Write-Host "[i] Inspect the skin"
    Write-Host "[d] Download and install the Skin"
    Write-Host "[e] To go back"


    # Subswitch
    $caseInput = Read-Host
        switch ($caseinput) {
            "i" {
                Start-Process $Inspectlink
                $validinput = $false
            }
            "d" {
                # Mit Debuggen
                Write-Host "Downloading"
                $jsonPath = "C:\Program Files\dsl\install\config.json"
                $config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
                $installpath = $config.installpath
                write-host "Installpath: $installpath"
                Write-Host "Downloading ZIP file..."
                Invoke-WebRequest "$Downloadlink" -OutFile "$env:TEMP\tmp.zip" -Verbose
                if (!(Test-Path "$env:TEMP\tmp.zip")) { Write-Host "Der Link ist ungültig, bitte wende dich an den Administrator" }
                Write-Host "Download succeeded"
                
                Write-Host "Extracting ZIP file..."
                Expand-Archive "$env:TEMP\tmp.zip" -DestinationPath "$env:TEMP\unzipped" -Force -Verbose
                if (!(Test-Path "$env:TEMP\unzipped")) { Write-Host "Extraction failed" }
                Write-Host "Extraction succeeded"
                
                $packageFolder = Get-ChildItem "$env:TEMP\unzipped" | Where-Object { $_.Name -match '^pak\d+_dir\.vpk$' } | Select-Object -First 1
                $Filename = $packageFolder.Name
                write-host "$Filename" -ForegroundColor Yellow
                
                Write-Host "Moving files..."
                Move-Item "$env:TEMP\unzipped\*" "$installpath" -Force -Verbose
                Write-Host "Files moved successfully."
                Remove-Item "$env:TEMP\tmp.zip" -Force -ErrorAction SilentlyContinue
                Remove-Item "$env:TEMP\unzipped" -Recurse -Force -ErrorAction SilentlyContinue
                

                # Ohne Debuggen
                #Invoke-WebRequest "https://skeptic-systems.de/data/deadlock/abrams/SenatorArmstrong.zip" -OutFile "$env:TEMP\tmp.zip"
                #Expand-Archive "$env:TEMP\tmp.zip" -DestinationPath "$env:TEMP\unzipped" -Force
                #$packageFolder = Get-ChildItem "$env:TEMP\unzipped" | Where-Object { $_.Name -match '^pak\d+_dir\.vpk$' } | Select-Object -First 1
                #$Filename = $packageFolder.Name
                #Move-Item "$env:TEMP\unzipped\*" "C:\Users\jonas\Desktop\test" -Force
                #remove-item "$env:TEMP\tmp.zip"
                #remove-item "$env:TEMP\unzipped"
                # Kann gelöscht werden 
                #Update-Charlist -SearchKey "FileName" -SearchValue "$Filename" -UpdateKey "isinstalled" -UpdateValue $true

                # Bestimmen von Class und Skinname
                $teile = $Downloadlink -split '/'
                $className = $teile[-2]
                $className = $className.Substring(0,1).ToUpper() + $className.Substring(1)
                $skinName = $teile[-1]
                if ($skinName.EndsWith(".zip")) {
                    $skinName = $skinName.Substring(0, $skinName.Length - 4)
                }
                $skinName = $skinName.Substring(0,1).ToUpper() + $skinName.Substring(1)

                # Eintrag in die json Datei
                Save-Charlist -ClassName $className -FileName $Filename -SkinName $skinName -inspectlink $Inspectlink
                
                # Erfolgreiche Ausgabe
                $skinPath = Join-Path -Path $InstallPath -ChildPath $Filename
                if (Test-path $skinPath) {
                    Write-Host "Skin installed successfully" -ForegroundColor Green
                }
                else {
                    write-host "The skin could not be installed" -ForegroundColor Red
                }
                start-sleep -Seconds 2

            }
            "e" {
                & "C:\Program Files\dsl\install\install.ps1"
            }
            default {
                Write-Host "Invalid input"
                $validinput = $false
                start-sleep -Seconds 2
            }
        }
    }while ($validinput -eq $false)
    & "C:\Program Files\dsl\install\install.ps1"
}
