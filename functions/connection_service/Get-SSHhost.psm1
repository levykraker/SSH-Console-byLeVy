function Get-SSHhost {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        $HostList = Get-Content -Path $HOSTSFILE | ConvertFrom-Json
        $Lp = 0
        $HostArray = @()
    }
    
    process {

        foreach ($Server in $HostList.hostnames) {
            $Lp += 1
            $HostObject = [PSCustomObject]@{
                LP           = $LP
                ServerName   = $Server.ServerName
                FriendlyName = $Server.FriendlyName
                Description  = $Server.Description
            }
            $HostArray += $HostObject
        }
    }
    
    end {
        return $HostArray
    }
}