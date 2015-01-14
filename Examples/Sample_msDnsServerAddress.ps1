configuration Sample_msDnsServerAddress
{
    param
    (
        [string[]]$NodeName = 'localhost',

        [Parameter(Mandatory)]
        [string]$DnsServerAddress,

        [Parameter(Mandatory)]
        [string]$InterfaceAlias,

        [ValidateSet("IPv4","IPv6")]
        [string]$AddressFamily = 'IPv4'
    )

    Import-DscResource -Module msNetworking

    Node $NodeName
    {
        msDnsServerAddress DnsServerAddress
        {
            Address        = $DnsServerAddress
            InterfaceAlias = $InterfaceAlias
            AddressFamily  = $AddressFamily
        }
    }
}
