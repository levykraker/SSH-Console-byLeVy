function Set-SSHHostMenu {
    param ()
    begin {
        Get-Banner
        Write-Host "Please provide servername or IP:"
        Write-Host "It will be used to connection via SSH so hostname should be rechable form your console"
        
    }
    process {
        $ServerName = Read-Host "Server name "
        $ServerFriendlyName = Read-Host "Add friendly name (optional) "
        $Description = Read-Host "Add description (optional) "

    }
    end {
        Set-SSHHost -SSHhost $ServerName -ServerFriendlyName $ServerFriendlyName -Description $Description
    }
}