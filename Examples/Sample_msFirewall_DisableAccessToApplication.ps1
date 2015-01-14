# DSC configuration for Firewall
# 

configuration Sample_msFirewall_AddFirewallRuleToNewGroup
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
            Access                = "Block"
            Description           = "Firewall Rule for Notepad.exe"  
            ApplicationPath       = "c:\windows\system32\notepad.exe"
        }
    }
 }
