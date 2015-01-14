configuration Sample_msIPAddress_FixedValue
{
    param
    (
        [string[]]$NodeName = 'localhost'
    )

    Import-DscResource -Module msNetworking

    Node $NodeName
    {
        msIPAddress NewIPAddress
        {
            IPAddress      = "2001:4898:200:7:6c71:a102:ebd8:f482"
            InterfaceAlias = "Ethernet"
            SubnetMask     = 24
            AddressFamily  = "IPV6"
        }
    }
}
