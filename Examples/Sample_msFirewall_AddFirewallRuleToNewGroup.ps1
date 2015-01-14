# DSC configuration for Firewall

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
            Name                  = "MyAppFirewallRule"            
            ApplicationPath       = "c:\windows\system32\MyApp.exe"
	        Access                = "Allow"
        }
    }
 }
