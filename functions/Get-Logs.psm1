function Get-Logs {
    param (
        [string]$LogString
    )
    begin {
        # Get variable of log directory 
        $LogFile = $JSONSETTINGS.LogPath
        $LogPath = "$MAINROOTPATH/$LogFile"
        
        if (!(Test-Path -Path $LogPath)) {
            New-Item -Path $LogPath 
        }

        # Create date variable
        $Stamp = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")

    }
    process {
        # Create a log message 
        $LogMessage = "$Stamp $LogString"

    }
    end {
        #Add message to log file 
        Add-Content $LogPath -value $LogMessage

    }
    
}