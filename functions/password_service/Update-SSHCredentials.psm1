function Update-SSHCredentials {
    param (
        [Parameter(mandatory = $true)]
        [int]$CredentialsToEdit,
        [Parameter(mandatory = $true)]
        $FieldToUpdate

        
    )
    
    begin {
        $PassList = Get-SSHCredentials 
        $CredentialsToEdit = $CredentialsToEdit - 1
    }
    
    process {

        #Change specific values 
        $FieldToUpdate.PSObject.Properties | ForEach-Object {
            $Property = $_.Name
            $PassList[$CredentialsToEdit].$Property = $_.Value
        }

        Remove-Item -Path $PASSFILE -Force 

        $PassList | ForEach-Object {
            Set-SSHCredentials -Username $_.Username -Password $_.Password -SSHhost $_.ServerName
        }

    }
    
    end {
        
    }
}