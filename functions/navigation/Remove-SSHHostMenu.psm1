function Remove-SSHHostMenu {
    param (
        
    )
    
    begin {

        Get-HostsSchema
        $Lp = Get-SSHHostMenu

    }
    
    process {
        #Check if any Hosts exists. 
        if (-not $Lp) { return }

       
        $HostToRemove = Read-Host "`n Please choose host form list to remove: "
        if (!($HostToRemove -gt 0 -and $HostToRemove -le $Lp)) {
            while (!($HostToRemove -gt 0 -and $HostToRemove -le $Lp)) {3
                $HostToRemove = Read-Host "Pick out of the range please pick again: "
            }
        }
        

        $Confirm = Read-Host "Are you sure?(y/n)"
        switch ($Confirm) {
            'y' { $Confirm = $true }
            'n' { $Confirm = $false }
            default {
                While (!($Confirm -eq 'y' -or $Confirm -eq 'n')) {
                    $Confirm = Read-Host "Wrong key, please choose y or n to confirm or decline: " 
                }
            }
        }

    }
    
    end {
        
        #Check if any password exists. 
        if (-not $Lp) { return }
        
        Remove-SSHHost -Confirm $Confirm -HostToRemove $HostToRemove -Lines $Lp
        
    }
}