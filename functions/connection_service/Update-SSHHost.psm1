function Update-SSHHost {
    [CmdletBinding()]
    param (
        [Parameter(mandatory = $true)]
        [int]$HostPossition,
        [Parameter(mandatory = $true)]
        $FieldToUpdate
    )
    
    begin {
        $HostList = Get-SSHhost
        $HostPossition = $HostPossition - 1
    }
    
    process {
        #Change specific values 
        $FieldToUpdate.PSObject.Properties | ForEach-Object {
            $Property = $_.Name
            $HostList[$HostPossition].$Property = $_.Value
        }

        Remove-Item -Path $HOSTSFILE -Force 
    
        $HostList | ForEach-Object {
            Set-SSHHost -SSHhost $_.ServerName -ServerFriendlyName $_.FriendlyName -Description $_.Description
        }
        

    }
    
    end {
        
    }
}