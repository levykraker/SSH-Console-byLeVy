function Set-Proxy {
    param (
        $ProxyName
    )
    begin {
        if ("" -ne $PROXYSERVER) {
            Get-Logs -LogString "WARNING: Existing proxy server $PROXYSERVER will be replaced by $ProxyName "

        } 
        if ($null -eq $ProxyName) {
            Get-Logs -LogString "WARNING: Connection via proxy will be disabled "

        }
          
    }
    process {
    

        $PROXYSERVER = $ProxyName
        $JSONSETTINGS.proxyServer = $ProxyName

        $JSONSETTINGS | ConvertTo-Json -Depth 3 | Set-Content $JSONPATH
        
        
    }
    end {
        Write-host "Proxy updated. Backing to menu..."
    }
}