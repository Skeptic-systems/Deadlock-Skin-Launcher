function Save-Config {
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$ConfigData,
        
        [string]$ConfigPath = "C:\Program Files\dsl\install\config.json"
    )
    if (!($ConfigPath)){
        new-item $ConfigPath
    }
    $json = $ConfigData | ConvertTo-Json -Depth 10
    $json | Set-Content -Path $ConfigPath
}

function Get-Config {
    param(
        [string]$ConfigPath = "C:\Program Files\dsl\install\config.json"
    )
        if (!($ConfigPath)){
            new-item $ConfigPath
        }
        $jsonContent = Get-Content -Path $ConfigPath -Raw
        $configObject = $jsonContent | ConvertFrom-Json
        return $configObject
}

function Save-Charlist {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\install\charlist.json",
        [Parameter(Mandatory=$true)]
        [string]$ClassName,
        [Parameter(Mandatory=$true)]
        [string]$FileName,
        [Parameter(Mandatory=$true)]
        [string]$SkinName,
        [Parameter(Mandatory=$true)]
        [bool]$isinstalled,
        [Parameter(Mandatory=$true)]
        [string]$inspectlink
    )

    $data = @(Get-Content $FilePath -Raw | ConvertFrom-Json)
    if (-not $data) {
        $data = @()
    }
    $entry = [PSCustomObject]@{
        ClassName   = $ClassName
        FileName    = $FileName
        SkinName    = $SkinName
        isinstalled = $isinstalled
        inspectlink = $inspectlink
    }
    $data += $entry
    $data | ConvertTo-Json -Depth 3 | Out-File -FilePath $FilePath -Force
}

function Get-Charlist {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\install\charlist.json"
    )
        $data = Get-Content $FilePath -Raw | ConvertFrom-Json
        return $data
}
function Get-Classname {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\install\charlist.json",
        [Parameter(Mandatory = $true)]
        [string]$ClassName
    )
    $charlist = Get-Content $FilePath -Raw | ConvertFrom-Json
    $entry = $charlist | Where-Object { $_.ClassName -eq $ClassName }
    if ($entry) {
        return $entry.SkinName
    }
}

function Remove-Charlist {
    [CmdletBinding()]
    param(
        [string]$FilePath = "C:\Program Files\dsl\install\charlist.json",
        [Parameter(Mandatory=$true)]
        [string]$FileName
    )
    $data = Get-Content $FilePath -Raw | ConvertFrom-Json
    $newData = $data | Where-Object { $_.FileName -ne $FileName }
    $newData | ConvertTo-Json -Depth 3 | Out-File -FilePath $FilePath -Force
}
