function Set-SSHHost {
    param (
        $SSHhost, 
        $ServerFriendlyName,
        $Description
    )
    begin {
        if (!(Test-Path -Path $HOSTSFILE)) {
            Get-Logs -LogString "WARNING: File $HOSTSFILE not exist. Creating new "
            New-Item -Path $HOSTSFILE | Out-null
            Get-Logs -LogString "INFO: Creating hostname schema for $HOSTFILE "
            $NewSchema = @{ hostnames = @() }
            $NewSchema | ConvertTo-Json -Depth 10 | Set-Content  -Path  $HOSTSFILE
        } 

        $HostnameList = Get-Content -Path $HOSTSFILE | ConvertFrom-Json

    
          
    }
    process {
    

        $NewServer = @{
            ServerName   = $SSHhost
            FriendlyName = $ServerFriendlyName
            Description  = $Description
        }
        $HostnameList.hostnames += $NewServer
        
        
        
    }
    end {

        $HostnameList | ConvertTo-Json -Depth 10 | Set-Content -Path $HOSTSFILE
        Get-logs -LogString ("Added $SSHhost to hostlist")

    }
}