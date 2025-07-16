function Get-SSHCredentials {
    param ($EncryptedPasswords )
    begin {
        # Get-Banner
        $PassObjects = @()
    }
    process {
        $EncryptedPasswords = Get-Content -Path $PASSFILE
        foreach ($PasswordLine in $EncryptedPasswords) {

            # Decryption 
            $DecryptString = $PasswordLine | ConvertTo-SecureString
            $Ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($DecryptString)
            try {
                $Code = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($Ptr)
                Get-Logs -LogString "SUCCESS: Password decrypted"
            }
            finally {
                [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)
                Get-Logs -LogString "ERROR: with password decryption"
            }

            $Encrypted = $Code -split $PREFIX
            $Encrypted = $Encrypted | Where-Object { $_ -ne "" }
            $EncryptServer, $EncryptUsername, $EncryptPass = $Encrypted
            $EncryptPass = $EncryptPass.Substring(1)
            $EncryptPass = ConvertTo-SecureString $EncryptPass -AsPlainText -Force
            
            $PassValues = [PSCustomObject]@{
                ServerName = $EncryptServer
                Username   = $EncryptUsername
                Password   = $EncryptPass
            } 
            $Encrypted = $Code -split $PREFIX
            $Encrypted = $Encrypted | Where-Object { $_ -ne "" }

            $EncryptServer, $EncryptUsername, $EncryptPass = $Encrypted

            $PassObjects += $PassValues 
        }
    
        

    }
    end {
        #return table with credentials
        Return $PassObjects

    }
}