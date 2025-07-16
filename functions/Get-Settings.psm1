function Get-Settings {
    param (
        [string]$SettingsPath,
        [string]$MainPath
    )
    begin {
        $global:JSONSETTINGS = Get-Content -Path $SettingsPath | ConvertFrom-Json
        $global:MAINROOTPATH = $MainPath
        $global:PREFIXHOSTNAME = $JSONSETTINGS.PrefixHostname
        $global:PREFIXUSERNAME = $JSONSETTINGS.PrefixUsername
        $global:PREFIXPASS = $JSONSETTINGS.PrefixPass
        $global:PREFIX = "SSHbL3"
        $global:HOSTSFILE = $MAINROOTPATH + $JSONSETTINGS.hosts_list
    }
}