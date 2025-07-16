function Remove-SSHHost {
    param (
        [Parameter(mandatory = $true)]
        [boolean]$Confirm,
        [Parameter(mandatory = $true)]
        [int]$HostToRemove,
        [int]$Lines
    )
    begin {
    }
    process {
        $HostToRemove -= 1 

        if ($Confirm -eq $true) {
            try {
                $HostList = Get-Content -Path $HOSTSFILE | ConvertFrom-Json
                $HostList.hostnames = $HostList.hostnames  | Where-Object { $_ -ne $HostList.hostnames[$HostToRemove] }
                $HostList | ConvertTo-Json -Depth 10 | Set-Content $HOSTSFILE
                Get-Logs -LogString "SUCCESS: Host removed"
                Write-host "Host removed"
            }
            catch {
                Get-Logs -LogString "ERROR: Something goes wrong with host remove"
            }
            
        } 

       
    }
    end {
        Start-Sleep -Seconds 1
    }
    
}