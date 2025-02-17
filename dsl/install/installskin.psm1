import-module "C:\Users\jonas\Desktop\DSL\dsl\git\install\submenu.psm1"
# Get Config


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
    Write-Host ""
    Write-Host "Choose a Skin"
    $caseinput = Read-Host
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
            return
        }
        Default {}
    }
} while ($validinput)
}