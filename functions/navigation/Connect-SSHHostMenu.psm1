function Connect-SSHHostMenu {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        Get-Banner
        $HostsArray = Get-SSHhost
        if ($null -eq $HostsArray) {
            return
        }
        Write-Host "Select server to connect:"
        # #Display description of schema
        Get-HostsSchema

        
    }
    
    process {
        if ($null -eq $HostsArray) {
            return
        }

        foreach ($Server in $HostsArray) {
            $LP = $Server.LP
            $ServerName = $Server.ServerName
            $FriendlyName = $Server.FriendlyName
            $Description = $Server.Description
        
            Write-Host "$LP)     $ServerName     $FriendlyName     $Description"
        }
        
        $Server = Read-host "Please pick server to connect"

        if (!($Server -gt 0 -and $Server -le $LP)) {
            while (!($Server -gt 0 -and $Server -le $LP)) {
                $Server = Read-Host "Pick out of the range please pick again: "
            }
        }
        
        
        
    }
    
    end {
        if ($null -eq $HostsArray) {
            Write-host "No host on list. Please add hosts first."
            Start-Sleep -Seconds 2
            return
        }
        Connect-SSHHost -Server $Server
    }
}