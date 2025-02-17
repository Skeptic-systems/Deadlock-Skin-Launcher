function Save-Config {
    param(
        [hashtable]$ConfigData,
        [string]$ConfigPath = "C:\Users\jonas\Desktop\DSL\dsl\git\install\config.conf"
    )
    if (!($ConfigPath)){
        new-item $ConfigPath
    }
    $lines = foreach ($key in $ConfigData.Keys) {
        "$key=$($ConfigData[$key])"
    }
    $lines | Set-Content -Path $ConfigPath
}

function Get-Config {
    param(
        [string]$ConfigPath = "C:\Users\jonas\Desktop\DSL\dsl\git\install\config.conf"
    )
    
    if (Test-Path $ConfigPath) {
        $configContent = Get-Content -Path $ConfigPath
        $config = $configContent | ConvertFrom-StringData
        return $config
    }
}