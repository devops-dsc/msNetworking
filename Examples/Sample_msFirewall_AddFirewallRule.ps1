# DSC configuration for Firewall

configuration Sample_msFirewall_AddFirewallRule
{
    param 
    (
        [string[]]$NodeName = 'localhost'
    )

    Import-DSCResource -ModuleName msNetworking

    Node $NodeName
    {
        msFirewall Firewall
        {
            Name                  = "NotePadFirewallRule"
            DisplayName           = "Firewall Rule for Notepad.exe"
            DisplayGroup          = "NotePad Firewall Rule Group"
            Ensure                = "Present"
            Access                = "Allow"
            State                 = "Enabled"
            Profile               = ("Domain", "Private")
            Direction             = "OutBound"
            RemotePort            = ("8080", "8081")
            LocalPort             = ("9080", "9081")         
            Protocol              = "TCP"
            Description           = "Firewall Rule for Notepad.exe"  
            ApplicationPath       = "c:\windows\system32\notepad.exe"
            Service               =  "WinRM"
        }
    }
 }

Sample_msFirewall_AddFirewallRule
Start-DscConfiguration -Path Sample_msFirewall_AddFirewallRule -Wait -Verbose -Force
