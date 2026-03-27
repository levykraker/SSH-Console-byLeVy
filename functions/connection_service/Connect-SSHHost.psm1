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
        if ("" -ne $PROXYSERVER) {
            $ConnectionArguments = "-o ProxyCommand=""ssh -q -W %h:%p $PROXYSERVER"" "
        }
        else {
            $ConnectionArguments = ""
        }


    }

    process {
        
        $ConnectUser = Read-Host "Please provide name of user for this server"
        Clear-Host
        $StringConnection = "$ConnectionArguments$ConnectUser@$ConnectServer"
        Start-Process ssh -ArgumentList $StringConnection -NoNewWindow -Wait
        

    
    }
    
    end {
        
    }
}