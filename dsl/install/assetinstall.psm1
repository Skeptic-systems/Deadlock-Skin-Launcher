import-module "C:\Program Files\dsl\public\args.psm1"
import-module "C:\Program Files\dsl\public\errorhandling.psm1"
###
function Install-asset {
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
    Write-Host "[i] Inspect the Asset"
    Write-Host "[d] Download and install the Asset"
    Write-Host "[e] To go back"


    # Subswitch
    $caseInput = Read-Host
        switch ($caseinput) {
            "i" {
                Write-Log -Message "User selected 'Inspect the Asset' for display: $Filtereddisplay" -Level INFO
                Start-Process $Inspectlink
                $validinput = $false
            }
            "d" {
                try {
                    $response = Invoke-WebRequest -Uri $Downloadlink -Method Head -TimeoutSec 5 -ErrorAction Stop
                    if ($response.StatusCode -ne 200) {
                        Write-Log -Message "Link validation failed for $Downloadlink with status code: $($response.StatusCode)" -Level ERROR
                        Write-Host "Der Download-Link ist ungültig, bitte wende dich an den Administrator" -ForegroundColor Red
                        Show-ErrorMessage -title "Download Link is not valid" -description "Permission denied status 200" -debugvar1key "Downloadlink" -debugvar1value "$Downloadlink"
                    }
                    else {
                        Write-Log -Message "Link validation succeeded for $Downloadlink" -Level INFO
                    }
                }
                catch {
                    Write-Log -Message "Link validation error for $Downloadlink" -Level ERROR
                    Show-ErrorMessage -title "Download Link is not valid" -description "Download Link is not reachable" -debugvar1key "Downloadlink" -debugvar1value "$Downloadlink"
                }
                Write-Log -Message "Starting download for asset: $Filtereddisplay" -Level INFO
                Write-Host "Downloading"
                $jsonPath = "C:\Program Files\dsl\public\config.json"
                $config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
                $installpath = $config.installpath
                write-host "Installpath: $installpath"
                Write-Host "Downloading ZIP file..."
                Invoke-WebRequest "$Downloadlink" -OutFile "$env:TEMP\tmp.zip" -Verbose
                if (!(Test-Path "$env:TEMP\tmp.zip")) { 
                    Write-Log -Message "Download failed: $env:TEMP\tmp.zip not found for asset: $Filtereddisplay" -Level ERROR
                    Write-Host "Der Download-Link ist ungültig, bitte wende dich an den Administrator"
                    return
                }
                Write-Log -Message "Download succeeded for asset: $Filtereddisplay" -Level INFO
                Write-Host "Download succeeded"
                
                Write-Log -Message "Starting extraction for asset: $Filtereddisplay" -Level INFO
                Write-Host "Extracting ZIP file..."
                Expand-Archive "$env:TEMP\tmp.zip" -DestinationPath "$env:TEMP\unzipped" -Force -Verbose
                if (!(Test-Path "$env:TEMP\unzipped")) { 
                    Write-Log -Message "Extraction failed: $env:TEMP\unzipped not found for asset: $Filtereddisplay" -Level ERROR
                    Write-Host "Extraction failed"
                    return
                }
                Write-Log -Message "Extraction succeeded for asset: $Filtereddisplay" -Level INFO
                Write-Host "Extraction succeeded"
                
                $packageFolder = Get-ChildItem "$env:TEMP\unzipped" | Where-Object { $_.Name -match '^pak\d+_dir\.vpk$' } | Select-Object -First 1
                $Filename = $packageFolder.Name
                write-host "$Filename" -ForegroundColor Yellow
                
                Write-Log -Message "Moving files to install path: $installpath for asset: $Filtereddisplay" -Level INFO
                Write-Host "Moving files..."
                Move-Item "$env:TEMP\unzipped\*" "$installpath" -Force -Verbose
                Write-Log -Message "Files moved successfully for asset: $Filtereddisplay" -Level INFO
                Write-Host "Files moved successfully."
                Remove-Item "$env:TEMP\tmp.zip" -Force -ErrorAction SilentlyContinue
                Remove-Item "$env:TEMP\unzipped" -Recurse -Force -ErrorAction SilentlyContinue
                

                # Bestimmen von Class und Skinname
                $teile = $Downloadlink -split '/'
                $className = $teile[-2]
                $className = $className.Substring(0,1).ToUpper() + $className.Substring(1)
                $skinName = $teile[-1]
                if ($skinName.EndsWith(".zip")) {
                    $skinName = $skinName.Substring(0, $skinName.Length - 4)
                }
                $skinName = $skinName.Substring(0,1).ToUpper() + $skinName.Substring(1)

                Write-Log -Message "Determined asset details: Class: $className, Asset: $skinName" -Level INFO

                # Eintrag in die json Datei
                Save-Charlist -ClassName $className -FileName $Filename -SkinName $skinName -inspectlink $Inspectlink
                Write-Log -Message "Updated JSON with asset details: Class: $className, Asset: $skinName, Filename: $Filename" -Level INFO
                
                Write-Log -Message "Asset installation completed for: $Filtereddisplay" -Level INFO
                Write-Host "Asset installed successfully" -ForegroundColor Green
                start-sleep -Seconds 2

            }
            "e" {
                Write-Log -Message "User selected to go back from asset installation for: $Filtereddisplay" -Level INFO
                & "C:\Program Files\dsl\install\skinmenu.ps1"
            }
            default {
                Write-Log -Message "Invalid input in Install-asset for: $Filtereddisplay, input: $caseInput" -Level WARN
                Write-Host "Invalid input"
                $validinput = $false
                start-sleep -Seconds 2
            }
        }
    }while ($validinput -eq $false)
}
