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

        if ($null -eq $HostList.hostnames) {
            Write-host "No host on list."
            Get-Logs -LogString "WARNING: Try to get hosts but no hosts in host.json"
        }
        else {
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
    }
    
    end {
        return $HostArray
    }
}