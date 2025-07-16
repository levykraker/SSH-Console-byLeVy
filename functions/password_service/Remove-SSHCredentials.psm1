function Remove-SSHCredentials {
    param (
        [Parameter(mandatory = $true)]
        [boolean]$Confirm,
        [Parameter(mandatory = $true)]
        [int]$CredentialToRemove,
        [int]$Lines
    )
    begin {
    }
    process {

        if ($Confirm -eq $true) {
            (Get-Content $PASSFILE) | ForEach-Object { if ($_.ReadCount -ne $CredentialToRemove) { $_ } } | Set-Content $PASSFILE
            Get-Logs -LogString "SUCCESS:: Credential removed"
            #Remove last password if only one left
            if ($CredentialToRemove -eq 1 -and $Lines -eq 1) {
            
                Remove-Item -Path $PASSFILE -Force
                Get-Logs -LogString "INFO: It was last credetnial on list"
                
            }
            Write-Host "Credential removed"
        }
        else {
            Write-Host "Abandoned of remove credetnial. Wait for back to menu."   
            Get-Logs -LogString "INFO: Abandoned of remove credetnial."
        }

       
    }
    end {
        Start-Sleep -Seconds 1
    }
    
}