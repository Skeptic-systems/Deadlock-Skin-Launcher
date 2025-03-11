Import-Module "C:\Program Files\dsl\public\args.psm1"
function subswitch {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        $Skin
    )
    # Übersetzung der Variablen
    $classname = $Skin.classname
    $Inspectlink = $Skin.inspectlink
    $Filename = $Skin.FileName
    $skinName = $Skin.SkinName

    do {
    Clear-Host
    Write-Host @"
    ____                 ____           __      _____ __   _          __                           __             
   / __ \___  ____ _____/ / /___  _____/ /__   / ___// /__(_)___     / /   ____ ___  ______  _____/ /_  ___  _____
  / / / / _ \/ __  / __  / / __ \/ ___/ //_/   \__ \/ //_/ / __ \   / /   / __  / / / / __ \/ ___/ __ \/ _ \/ ___/
 / /_/ /  __/ /_/ / /_/ / / /_/ / /__/ ,<     ___/ /  < / / / / /  / /___/ /_/ / /_/ / / / / /__/ / / /  __/ /    
/_____/\___/\__,_/\__,_/_/\____/\___/_/|_|   /____/_/|_/_/_/ /_/  /_____/\__,_/\__,_/_/ /_/\___/_/ /_/\___/_/     
"@ -ForegroundColor Green
    
    write-host "by Skeptic" -ForegroundColor Cyan
    Write-Host "`n`n`n"
    Write-Host "$classname"
    Write-Host "$skinName"
    Write-Host "`n"
    Write-Host "[i] Inspect the skin"
    Write-Host "[d] Delete the Skin"
    Write-Host "[e] To go back"

    $userInput = Read-Host "Please choose an option"
    switch ($userInput) {
        "i" {
            Start-Process $Inspectlink
            $validinput = $false
        }
        "d" {
            $jsonPath = "C:\Program Files\dsl\public\config.json"
            $config = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
            $installpath = $config.installpath
            write-host "$installpath"
            $skinPath = Join-Path -Path $InstallPath -ChildPath $Filename
            Remove-Item -Path $skinPath -Force
            Remove-Charlist -Filename $Filename
            if (!(test-path $skinPath)) {
                Write-Host "The skin has been successfully deleted" -ForegroundColor Green
            }
            else {
                Write-Host "The skin was not deleted an error occurred" -ForegroundColor Red
            }
        }
        "e" {
            & "C:\Program Files\dsl\uninstall\uninstall.ps1"
        }
        Default {
            $validinput = $false
        }
    }
} while ($validinput -eq $false)
& "C:\Program Files\dsl\uninstall\uninstall.ps1"
}