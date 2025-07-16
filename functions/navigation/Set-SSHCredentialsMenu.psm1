function Set-SSHCredentialsMenu {
    param ()
    begin {
        Get-Banner
        Write-Host "Please provide credentials:"
        Write-Host "Name of server, username and password"
        
    }
    process {
        $ServerName = Read-Host "Server name "
        $Username = Read-Host "Username "
        $Password = Read-Host "Password " -MaskInput
        

    }
    end {
        Set-SSHCredentials -Username $Username -Password -$Password -SSHhost $ServerName
    }
}