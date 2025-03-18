function Save-config {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Key,
        [Parameter(Mandatory = $true)]
        [object]$Value,
        [string]$ConfigPath = "C:\Program Files\dsl\public\config.json"
    )
    if (Test-Path $ConfigPath) {
        $jsonData = Get-Content $ConfigPath -Raw | ConvertFrom-Json
        if (-not $jsonData) {
            $jsonData = @{}
        }
    } else {
        $jsonData = @{}
    }
    $jsonData[$Key] = $Value
    $jsonData | ConvertTo-Json -Depth 10 | Set-Content $ConfigPath
}

function Get-Config {
    param(
        [string]$ConfigPath = "C:\Program Files\dsl\public\config.json"
    )
    $jsonContent = Get-Content -Path $ConfigPath -Raw
    $configObject = $jsonContent | ConvertFrom-Json
    return $configObject
}


function Save-Charlist {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\public\charlist.json",
        [Parameter(Mandatory=$true)]
        [string]$ClassName,
        [Parameter(Mandatory=$true)]
        [string]$FileName,
        [Parameter(Mandatory=$true)]
        [string]$SkinName,
        [Parameter(Mandatory=$true)]
        [string]$inspectlink
    )
    if (-not (Test-Path $FilePath)) {
        $data = @()
    }
    else {
        $data = @(Get-Content $FilePath -Raw | ConvertFrom-Json)
    }
    $data = @($data)
    $data = @($data | Where-Object { $_.FileName -ne $FileName })
    $entry = [PSCustomObject]@{
        ClassName   = $ClassName
        FileName    = $FileName
        SkinName    = $SkinName
        inspectlink = $inspectlink
    }
    $data += $entry
    $data | ConvertTo-Json -Depth 3 | Out-File -FilePath $FilePath -Force
}



function Get-Charlist {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\public\charlist.json"
    )
    if (!(test-path $FilePath)) {
        New-Item -Path $FilePath -ItemType File -Force | Out-Null
    }
        $data = Get-Content $FilePath -Raw | ConvertFrom-Json
        return $data
}
function Get-Classname {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\public\charlist.json",
        [Parameter(Mandatory = $true)]
        [string]$ClassName
    )
    if (!(test-path $FilePath)) {
        New-Item -Path $FilePath -ItemType File -Force | Out-Null
    }
    $charlist = Get-Content $FilePath -Raw | ConvertFrom-Json
    $entry = $charlist | Where-Object { $_.ClassName -eq $ClassName }
    if ($entry) {
        return $entry.SkinName
    }
}

function Get-Skinname {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\public\charlist.json",
        [Parameter(Mandatory = $true)]
        [string]$AssetName
    )
    if (!(Test-Path $FilePath)) {
        New-Item -Path $FilePath -ItemType File -Force | Out-Null
    }
    $charlist = Get-Content $FilePath -Raw | ConvertFrom-Json
    $entry = $charlist | Where-Object { $_.SkinName -eq $AssetName }
    if ($entry) {
        return $entry.SkinName
    }
}


function Remove-Charlist {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\public\charlist.json",
        [Parameter(Mandatory=$true)]
        [string]$FileName
    )
    if (!(test-path $FilePath)) {
        New-Item -Path $FilePath -ItemType File -Force | Out-Null
    }
    $data = Get-Content $FilePath -Raw | ConvertFrom-Json
    $newData = $data | Where-Object { $_.FileName -ne $FileName }
    $newData | ConvertTo-Json -Depth 3 | Out-File -FilePath $FilePath -Force
}

function Write-Log {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message,
        [ValidateSet("INFO", "WARN", "ERROR")]
        [string]$Level = "INFO"
    )
    
    # Beim ersten Aufruf: Logdatei erstellen
    if (-not $global:logFilePath) {
        $logFolder = "C:\Program Files\dsl\logs"
        # Falls der Logordner nicht existiert, wird er erstellt.
        if (-not (Test-Path $logFolder)) {
            New-Item -Path $logFolder -ItemType Directory -Force | Out-Null
        }
        $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
        $global:logFilePath = "$logFolder\log_$timestamp.txt"
        New-Item -Path $global:logFilePath -ItemType File -Force | Out-Null
    }
    
    $timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timeStamp [$Level] $Message"
    Add-Content -Path $global:logFilePath -Value $logEntry
}

function Write-Log {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message,
        [ValidateSet("INFO", "WARN", "ERROR")]
        [string]$Level = "INFO"
    )

    $timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timeStamp [$Level] $Message"
    Add-Content -Path $global:logFilePath -Value $logEntry
}

