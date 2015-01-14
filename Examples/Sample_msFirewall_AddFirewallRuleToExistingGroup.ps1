# DSC configuration for Firewall
# 

configuration Sample_msFirewall_AddFirewallRuleToExistingGroup
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
            Name                  = "MyFirewallRule"
            DisplayName           = "My Firewall Rule"
            DisplayGroup          = "My Firewall Rule Group"
	        Access                = "Allow"
        }

        msFirewall Firewall1
        {
            Name                  = "MyFirewallRule1"
            DisplayName           = "My Firewall Rule"
            DisplayGroup          = "My Firewall Rule Group"
            Ensure                = "Present"
            Access                = "Allow"
            State                 = "Enabled"
            Profile               = ("Domain", "Private")
        }
    }
 }
