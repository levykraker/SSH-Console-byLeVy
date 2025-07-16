function Update-SSHHostMenu {
    param ()
    
    begin {
        Get-Banner
        $HostsList = Get-SSHhost

        # #Check if any password exists. 
        if (-not $HostsList) { 
            Write-host "Host list is empty, back to menu."
            return 
        }
        # #Display description of schema
        Get-HostsSchema

        $HostsList | ForEach-Object { Write-Host $_.Lp $_.ServerName $_.FriendlyName $_.Description }
        $MeasureOfHosts = $HostsList | Measure-Object
        $CountOfHosts = $MeasureOfHosts.Count
     
    }
    
    process {
        # #Check if any password exists. 
        if (-not $HostsList) { return }
        
        $HostToUpdate = Read-Host "`n Please choose position form list to update: "
        if (!($HostToUpdate -gt 0 -and $HostToUpdate -le $CountOfHosts)) {
            while (!($HostToUpdate -gt 0 -and $HostToUpdate -le $CountOfHosts)) {
                $HostToUpdate = Read-Host "Pick out of the range please pick again: "
            }
        }
       
        $FieldToUpdate = Read-Host "`nPlease choose what field you want to edit `n 1)ServerName(FQDN or IP) 2)FriendlyName 3)Description 0)All"
        if (!($FieldToUpdate -ge 0 -and $FieldToUpdate -le 3)) {
            while (!($FieldToUpdate -ge 0 -and $FieldToUpdate -le 3)) {
                $FieldToUpdate = Read-Host "Pick out of the range please pick again: "
            }
        }

        
        switch ($FieldToUpdate) {
            '0' {
                $UpdatedServerName = Read-Host "Please provie ServerName(FQDN or IP): "
                $UpdatedFriendlyName = Read-Host "Please provie FriendlyName: "
                $UpdatedDescription = Read-Host "Please provie Description: "
                $ValueToUpdate = [PSCustomObject]@{
                    ServerName   = $UpdatedServerName
                    FriendlyName = $UpdatedFriendlyName
                    Description  = $UpdatedDescription
                }
            }
            '1' {
                $UpdatedServerName = Read-Host "Please provie ServerName(FQDN or IP): " 
                $ValueToUpdate = [PSCustomObject]@{
                    ServerName = $UpdatedServerName
                }
            }
        
            '2' {
                $UpdatedFriendlyName = Read-Host "Please provie FriendlyName: "
                $ValueToUpdate = [PSCustomObject]@{
                    FriendlyName = $UpdatedFriendlyName
                }
            }
            '3' { 
                $UpdatedDescription = Read-Host "Please provie Description: " 
                $ValueToUpdate = [PSCustomObject]@{
                    Description = $UpdatedDescription
                } 
            }
        }
        
    }
    
    end {
        # #Check if any password exists. 
        if (-not $HostsList) { return }
        
        Update-SSHhost -HostPossition $HostToUpdate -FieldToUpdate $ValueToUpdate
    }
}