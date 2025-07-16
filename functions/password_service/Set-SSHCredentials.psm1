function Set-SSHCredentials {
    param (
        $Username,
        $Password,
        $SSHhost,
        $TableString
    )
    begin {
        #Load banner 
        Get-Banner
        
        #Create prefix for new credentials 
        $SecretName = $PREFIX + $SSHhost + $PREFIX + $Username + $PREFIX + $Password  

    }
    process {

        try {
            $SecretSecureString = ConvertTo-SecureString $SecretName -AsPlainText -Force
            $EncryptSecret = ConvertFrom-SecureString -SecureString $SecretSecureString
            Add-Content -Path $PASSFILE -Value $EncryptSecret
        }
        catch {
            Get-Logs -LogString "ERROR: Error with saving password to credential manager"
        }

        
    }
    end {
        Write-Host "Credentials saved. Wait for back to menu"
        Start-Sleep -Seconds 1
    }
}