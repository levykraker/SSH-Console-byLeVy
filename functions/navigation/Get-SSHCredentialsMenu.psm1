function Get-SSHCredentialsMenu {
    param ()
    
    begin {
        Get-Banner
        $ExistPasswords = Test-path -Path $PASSFILE
        if (!($ExistPasswords)) {
            Get-Logs -LogString "INFO: No saved credetnials"
            Write-host "No saved credentials, add new in main menu."
            Start-sleep 1
            return $ExistPasswords
        }
        else {
            $CredentialList = Get-SSHCredentials -EncryptedPasswords $PASSFILE
        }
    }
    process {
        #If passwords not exist 
        if (!($ExistPasswords)) { return $ExistPasswords }

        $Lp = 1
    
        foreach ($Credential in $CredentialList) { 
            $ServerName = $Credential.ServerName
            $Username = $Credential.Username
            Write-Host "$Lp) ServerName: $ServerName Username $Username"
            $Lp++ 
        }

    }
    end {
        #If passwords not exist 
        if (!($ExistPasswords)) { return $ExistPasswords }

        $Lp = $Lp - 1
        return $Lp

    }
}