function Update-SSHCredentialsMenu {
    param ()
    
    begin {
        $Lp = Get-SSHCredentialsMenu

    }
    
    process {
        #Check if any password exists. 
        if (-not $Lp) { return }

        $CredentialsToUpdate = Read-Host "`n Please choose credentails to update: "
        if (!($CredentialsToUpdate -gt 0 -and $CredentialsToUpdate -le $Lp)) {
            while (!($CredentialsToUpdate -gt 0 -and $CredentialsToUpdate -le $Lp)) {
                $CredentialsToUpdate = Read-Host "Pick out of the range please pick again: "
            }
        }

        $FieldToUpdate = Read-Host "`nPlease choose what field you want to edit `n 1)ServerName 2)Username 3)Password 0)All"
        if (!($FieldToUpdate -ge 0 -and $FieldToUpdate -le 3)) {
            while (!($CredentialsToUpdate -gt 0 -and $CredentialsToUpdate -le 3)) {
                $CredentialsToUpdate = Read-Host "Pick out of the range please pick again: "
            }
        }

        
        switch ($FieldToUpdate) {
            '0' {
                $UpdatedServerName = Read-Host "Please provie server name: "
                $UpdatedUsername = Read-Host "Please provie new username: "
                $UpdatedPassword = Read-Host "Please provie new password: " -AsSecureString
                $ValueToUpdate = [PSCustomObject]@{
                    ServerName = $UpdatedServerName
                    Username   = $UpdatedUsername
                    Password   = $UpdatedPassword
                }
            }
            '1' {
                $UpdatedServerName = Read-Host "Please provie server name: " 
                $ValueToUpdate = [PSCustomObject]@{
                    ServerName = $UpdatedServerName
                }
            }
        
            '2' {
                $UpdatedUsername = Read-Host "Please provie new username: "
                $ValueToUpdate = [PSCustomObject]@{
                    Username = $UpdatedUsername
                }
            }
            '3' { 
                $UpdatedPassword = Read-Host "Please provie new password: " -AsSecureString
                $ValueToUpdate = [PSCustomObject]@{
                    Password = $UpdatedPassword
                } 
            }
        }
        
    }
    
    end {
        #Check if any password exists. 
        if (-not $Lp) { return }
        
        Update-SSHCredentials -CredentialsToEdit $CredentialsToUpdate -FieldToUpdate $ValueToUpdate
    }
}