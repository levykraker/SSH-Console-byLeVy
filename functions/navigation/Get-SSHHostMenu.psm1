function Get-SSHHostMenu {
    param ()
    
    begin {
        Get-Banner
        $ExistHosts = Test-path -Path $HOSTSFILE
        if (!($ExistHosts)) {
            Get-Logs -LogString "WARNING: Missing file with hosts list"
            Write-host "No saved hosts, add new in main menu."
            Start-sleep 1
            return $ExistHosts
        }
            $HostsList = Get-SSHhost 
        }
    
    process {
        #If passwords not exist 
        if (!($ExistHosts)) { return $ExistHosts }

        $Lp = 1
    
        foreach ($HostObject in $HostsList) { 
            $ServerName = $HostObject.ServerName
            $ServerFriendlyName = $HostObject.FriendlyName
            $ServerDescription = $HostObject.Description
            Write-Host "$Lp) ServerName: $ServerName FriendlyName: $ServerFriendlyName Description: $ServerDescription"
            $Lp++ 
        }

    }
    end {
        #If passwords not exist 
        if (!($ExistHosts)) { return $ExistHosts }

        $Lp = $Lp - 1
        return $Lp

    }
}