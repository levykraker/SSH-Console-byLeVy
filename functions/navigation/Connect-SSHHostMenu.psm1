function Connect-SSHHostMenu {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        Get-Banner
        Write-Host "Select server to connect:"
        # #Display description of schema
        Get-HostsSchema

        $HostsArray = Get-SSHhost
    }
    
    process {
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
        Connect-SSHHost -Server $Server
    }
}