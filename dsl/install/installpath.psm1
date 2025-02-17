function verifyinstallpath {
    param ()
    do{
    $installpath = "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\addons"
    # Function Verify install path
    if (!($installpath)) {
    write-host @"
        Deadlock konnte nicht gefunden werden
        Bitte den Pfad manuell eingeben
"@              
    $installpath = Read-Host
        if (!($installpath)){
            $isinputvalid = $false
        }}
    } while ($isinputvalid)
}
