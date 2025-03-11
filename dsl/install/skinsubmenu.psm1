import-module "C:\Program Files\dsl\install\skininstall.psm1"
###
$validinput = $true

function install-skin {
    param (
        [string]$Display1,
        [string]$Display2,
        [string]$Display3,
        [string]$Display4,
        [string]$Display5,
        [string]$Inspectlink1,
        [string]$Inspectlink2,
        [string]$Inspectlink3,
        [string]$Inspectlink4,
        [string]$Inspectlink5,
        [string]$Downloadlink1,
        [string]$Downloadlink2,
        [string]$Downloadlink3,
        [string]$Downloadlink4,
        [string]$Downloadlink5
    )
do{
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
    
    $isvalid1 = $false
    $isvalid2 = $false
    $isvalid3 = $false
    $isvalid4 = $false
    $isvalid5 = $false
    if ($Display1) { 
        Write-Host $Display1 
        $isvalid1 = $true
    }
    if ($Display2) { 
        Write-Host $Display2 
        $isvalid2 = $true
    }
    if ($Display3) { 
        Write-Host $Display3 
        $isvalid3 = $true
    }
    if ($Display4) { 
        Write-Host $Display4
        $isvalid4 = $true
    }
    if ($Display5) { 
        Write-Host $Display5 
        $isvalid5 = $true
    }
    Write-Host "[e] To go back"
    Write-Host ""
    write-host " > " -NoNewline -ForegroundColor cyan
    $caseInput = Read-Host
    switch ($caseInput) {
        1 {
            if ($isvalid1) {
                Install-detail -Display $Display1 -Inspectlink $Inspectlink1 -Downloadlink $Downloadlink1
        }
        }
        2 {
            if ($isvalid2) {
                Install-detail -Display $Display2 -Inspectlink $Inspectlink2 -Downloadlink $Downloadlink2
            }
        }
        3 {
            if ($isvalid3) {
                Install-detail -Display $Display3 -Inspectlink $Inspectlink3 -Downloadlink $Downloadlink3
            }
        }
        4 {
            if ($isvalid4) {
                Install-detail -Display $Display4 -Inspectlink $Inspectlink4 -Downloadlink $Downloadlink4
            }
        }
        5 {
            if ($isvalid5) {
                Install-detail -Display $Display5 -Inspectlink $Inspectlink5 -Downloadlink $Downloadlink5
            }
        }
        "e" {
            & "C:\Program Files\dsl\install\skinmenu.ps1"
        }
        Default {
            write-host "Wrong Case Input" -ForegroundColor Red
            start-sleep -Seconds 2
            $validinput = $false
        }
    }
} while ($validinput -eq $false)
}