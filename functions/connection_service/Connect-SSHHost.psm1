function Connect-SSHHost {
    [CmdletBinding()]
    param (
        [Parameter(mandatory = $true)]
        $Server
    )
    
    begin {
        $HostsList = Get-SSHhost
        $Server -= 1
        $ConnectServer = $HostsList[$Server].ServerName
        $ConnectionArguments = "-o PasswordAuthentication=yes"
        
        try {
            $Credential = Get-SSHCredentials | Where-Object { $_.ServerName -eq $ConnectServer }
            
            $ConnectUser = $Credential.Username
            $ConnectPass = $Credential.Password
            $AddPassToCliboard = ConvertFrom-SecureString $ConnectPass -AsPlainText
            $AddPassToCliboard | Set-Clipboard
        
            Get-Logs -LogString "INFO: Found password for chosen server "
            $PasswordExist = $true
        }
        catch {
            Get-Logs -LogString "WARNING: Not found password for chosen server"
        }


    }

    process {
        if ($true -eq $PasswordExist) {
            $StringConnection = "$ConnectUser@$ConnectServer"
            try {
                Write-Host "Password is in clipboard. Please press right mouse button and enter. If you got added your ssh key on this server you should be connected automatically in a few seconds"
                $SSHconnection = Start-Process ssh -ArgumentList $StringConnection -NoNewWindow -Wait
                Get-Logs -LogString "INFO: Connected to $ConnectServer by default ssh key  "
            }
            catch {
                Get-Logs -LogString "WARNING: Connected to $ConnectServer by using ssh key fail.Error code: $($SSHconnection.ExitCode). User will be asked for username and password. "
            }
        }
        else {
            Get-Logs -LogString "INFO: Missing info about user for this server $ConnectServer. Ask user about username and password "
            Write-host "Missing info about user for this server."
            $ConnectUser = Read-Host "Please provide name of user for this server"
            # $ConnectPass = Read-Host "Please provide password" -MaskInput
            $StringConnection = "$ConnectUser@$ConnectServer"
            Start-Process ssh -ArgumentList $StringConnection -NoNewWindow -Wait
        }

    
    }
    
    end {
        
    }
}