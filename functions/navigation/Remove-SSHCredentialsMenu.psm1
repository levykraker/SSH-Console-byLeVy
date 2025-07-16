function Remove-SSHCredentialsMenu {
    param (
        
    )
    
    begin {
        $Lp = Get-SSHCredentialsMenu

    }
    
    process {
        #Check if any password exists. 
        if (-not $Lp) { return }
        $CredentialToRemove = Read-Host "`n Please choose credentials to remove: "
        if (!($CredentialToRemove -gt 0 -and $CredentialToRemove -le $Lp)) {
            while (!($CredentialToRemove -gt 0 -and $CredentialToRemove -le $Lp)) {
                $CredentialToRemove = Read-Host "Pick out of the range please pick again: "
            }
        }
        
   

        $Confirm = Read-Host "Are you sure?(y/n)"
        switch ($Confirm) {
            'y' { $Confirm = $true }
            'n' { $Confirm = $false }
            default {
                While (!($Confirm -eq 'y' -or $Confirm -eq 'n')) {
                    $Confirm = Read-Host "Wrong key, please choose y or n to confirm or decline: " 
                }
            }
        }

    }
    
    end {
        
        #Check if any password exists. 
        if (-not $Lp) { return }
        
        Remove-SSHCredentials -Confirm $Confirm -CredentialToRemove $CredentialToRemove -Lines $Lp
        
    }
}