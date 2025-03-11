function Show-ErrorMessage {
    param(
        [Parameter(Mandatory = $true)]
        [string]$title,

        [Parameter(Mandatory = $true)]
        [string]$description,

        [string]$debugvar1key,
        [string]$debugvar1value,
        [string]$debugvar2key,
        [string]$debugvar2value,
        [string]$debugvar3key,
        [string]$debugvar3value,
        [string]$debugvar4key,
        [string]$debugvar4value,
        [string]$debugvar5key,
        [string]$debugvar5value
    )
    $validinput -eq $false
    do {
    Write-Host "Error: $title" -ForegroundColor Red
    Write-Host "Description: $description" -ForegroundColor Yellow
    Write-Host ""

    if ($debugvar1value -or $debugvar2value -or $debugvar3value -or $debugvar4value -or $debugvar5value) {
        Write-Host "Debug Variables:" -ForegroundColor Cyan
    }

    if ($debugvar1value) {
        Write-Host "$debugvar1key : $debugvar1value"
    }
    if ($debugvar2value) {
        Write-Host "$debugvar2key : $debugvar2value"
    }
    if ($debugvar3value) {
        Write-Host "$debugvar3key : $debugvar3value"
    }
    if ($debugvar4value) {
        Write-Host "$debugvar4key : $debugvar4value"
    }
    if ($debugvar5value) {
        Write-Host "$debugvar5key : $debugvar5value"
    }

    Write-Host ""
    Write-Host "Please take a screenshot and submit it either via GitHub issues at https://github.com/Skeptic-systems/Deadlock-Skin-Launcher/issues or via Discord __skeptic__." -ForegroundColor Green
    Write-Host "Press [e] to go back." -ForegroundColor Green
    $read = Read-Host
    switch ($read) {
        "e" {
            & "C:\Program Files\dsl\main.ps1" 
        }
        Default {
            write-host "Wrong Case Input" -ForegroundColor Red
            start-sleep -seconds 2
            $validinput -eq $false
        }
    }
  } while ($validinput -eq $false)
}
