function Set-ProxyMenu {
    param ()
    begin {
        Get-Banner
        Write-Host "REMEMBER: best option is use proxy server where you can connect by ssh key."
        Write-Host "If you want to disable connection via proxy just press enter without providing anything"
        Write-Host "Please provide proxy server in format 'user@servername' :"
        
    }
    process {
        $ProxyName = Read-Host "Proxy name "

    }
    end {
        Set-Proxy -ProxyName $ProxyName 
    }
}