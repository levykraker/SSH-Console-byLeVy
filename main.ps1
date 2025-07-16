function SSHbL3 {
    begin {

        # Import settings 
        Import-Module $PSScriptRoot\functions\Get-Settings.psm1 -Force
        Get-Settings -SettingsPath "$PSScriptRoot\settings\settings.json" -MainPath $PSScriptRoot

        # Import log module
        Import-Module $PSScriptRoot\functions\Get-Logs.psm1 -Force
        

        # Import menu modules 
        Import-Module $PSScriptRoot\functions\navigation\Get-Menu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Get-Banner.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Set-SSHCredentialsMenu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Get-SSHCredentialsMenu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Update-SSHCredentialsMenu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Remove-SSHCredentialsMenu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Set-SSHHostMenu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Connect-SSHHostMenu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Remove-SSHHostMenu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Update-SSHHostMenu.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Get-HostsSchema.psm1 -Force
        Import-Module $PSScriptRoot\functions\navigation\Get-SSHHostMenu.psm1 -Force
        
        # Import functions modules
        Import-Module $PSScriptRoot\functions\Get-SecureEncryption.psm1 -Force
        Import-Module $PSScriptRoot\functions\password_service\Get-SSHCredentials.psm1 -Force
        Import-Module $PSScriptRoot\functions\password_service\Set-SSHCredentials.psm1 -Force
        Import-Module $PSScriptRoot\functions\password_service\Remove-SSHCredentials.psm1 -Force
        Import-Module $PSScriptRoot\functions\password_service\Update-SSHCredentials.psm1 -Force

        Import-Module $PSScriptRoot\functions\connection_service\Set-SSHHost.psm1 -Force 
        Import-Module $PSScriptRoot\functions\connection_service\Get-SSHHost.psm1 -Force 
        Import-Module $PSScriptRoot\functions\connection_service\Connect-SSHHost.psm1 -Force 
        Import-Module $PSScriptRoot\functions\connection_service\Update-SSHHost.psm1 -Force 
        Import-Module $PSScriptRoot\functions\connection_service\Remove-SSHHost.psm1 -Force 
        

        Start-Sleep -Seconds 4
        Clear-Host

        # Get-logs -LogString "=====================Program started====================="
    }   
    process {
        $Choice = Get-Menu

        # Checking credential system
        Get-SecureEncryption -MainPath $PSScriptRoot
    

        switch ($Choice) {
            '1' { Connect-SSHHostMenu; SSHbL3 }
            '2' { Set-SSHHostMenu; SSHbL3 } 
            '3' { Remove-SSHHostMenu; SSHbL3 }
            '4' { Update-SSHHostMenu ; SSHbL3 }
            '5' { Set-SSHCredentialsMenu -MainDirectory $PSScriptRoot; SSHbL3 }
            '6' { Remove-SSHCredentialsMenu; SSHbL3 }
            '7' { Update-SSHCredentialsMenu; SSHbl3 }
            '0' { Get-logs -LogString "===================== d-.-b Program end ,GOODBYE d-.-b =====================" ; break }
            default { 'Please choose option' }
        }


        
    }
    end {
        
    }
}
SSHbL3