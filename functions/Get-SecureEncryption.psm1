function Get-SecureEncryption {

    param(
        [string]$MainPath
    )

    begin {
        $EncryptPath = "$MainPath\.encrypt"
        $EncryptFile = "$EncryptPath\enpass"
        Get-Logs -LogString "INFO: Checking credentials system" 
    }
    process {
        if (!(Test-Path -Path $EncryptPath)) {
            New-Item -Path $EncryptPath -ItemType Directory -Force
            Set-ItemProperty -Path $folderPath -Name Attributes -Value Hidden
            New-Item -Path $EncryptFile -ItemType File -Force
            Set-ItemProperty -Path $EncryptFile -Name Attributes -Value Hidden
        }
        

    }
    end {
        $global:PASSFILE = $EncryptFile

    }
}