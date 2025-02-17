import-module "C:\Users\jonas\Desktop\DSL\dsl\git\install\config.psm1"
function Install-detail {
    param (
        [string]$Display,
        [string]$Inspectlink,
        [string]$Downloadlink
    )
    do {
    Write-Host "$Display"


    Write-Host "[i] Inspect the skin"
    Write-Host "[d] Download and install the Skin"
    Write-Host "[e] To go back"


    # Subswitch
    $installinput = Read-Host
        switch ($installinput) {
            "i" {
                Invoke-Item $Inspectlink
            }
            "d" {
                Write-Host "Downloading"
                $config = Get-Config
                $config = $config.$installpath
                Invoke-WebRequest $Downloadlink -OutFile  "$installpath\"
                Write-Host "The Skin has been successfully downloaded" -ForegroundColor Green
                return
            }
            "e" {
                return
            }
            default {
                Write-Host "Ungültige Eingabe"
                $validinput = $false
            }
        }
    }while ($validinput -eq $false)
}