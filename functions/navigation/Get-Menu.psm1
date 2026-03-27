function Get-Menu () {
    param ()
    
    begin {
        Get-Banner     
        if ("" -ne $PROXYSERVER) {
            Write-host "#####################   "
            Write-host " Connection via proxy is ON. Proxy server: $PROXYSERVER "
            Write-host "#####################   "
            Write-host ""
        }
              
        Write-Host "1) Connect to host "                                                                                              
        Write-Host "2) Add new host  "                                                                                              
        Write-Host "3) Remove host"
        Write-Host "4) Edit host"
        Write-Host "5) Enable/disable Server Proxy "
        Write-Host "0) Exit"                                                                                              


    }

    process {
        $Choice = Read-Host " Please pick an option"

    }
    end {
        Clear-Host
        return $Choice
    }
}
