configuration Sample_msIPAddress_Parameterized
{
    param
    (

        [string[]]$NodeName = 'localhost',

        [Parameter(Mandatory)]
        [string]$IPAddress,

        [Parameter(Mandatory)]
        [string]$InterfaceAlias,

        [Parameter(Mandatory)]
        [string]$DefaultGateway,

        [int]$SubnetMask = 16,

        [ValidateSet("IPv4","IPv6")]
        [string]$AddressFamily = 'IPv4'
    )

    Import-DscResource -Module msNetworking

    Node $NodeName
    {
        msIPAddress NewIPAddress
        {
            IPAddress      = $IPAddress
            InterfaceAlias = $InterfaceAlias
            DefaultGateway = $DefaultGateway
            SubnetMask     = $SubnetMask
	        AddressFamily  = $AddressFamily
        }
    }
}
