# File Paths
$reportPath = "C:\IT-network\Reports\Network-Report.csv"
$logPath = "C:\IT-network\Logs\Network-Log.txt"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$networkInfo = [PSCustomObject]@{
    DateTime       = $timestamp
    HostName       = $env:COMPUTERNAME
    UserName       = $env:USERNAME
    IPAddress      = ""
    DefaultGateway = ""
    DNSServer      = ""
    InternetStatus = ""
}

try {
    $config = Get-NetIPConfiguration | Where-Object { $_.IPv4Address -ne $null }

    $networkInfo.IPAddress      = $config.IPv4Address.IPAddress
    $networkInfo.DefaultGateway = $config.IPv4DefaultGateway.NextHop
    $networkInfo.DNSServer      = ($config.DNSServer.ServerAddresses -join ", ")

    $pingResult = Test-Connection -ComputerName google.com -Count 1 -Quiet
    $networkInfo.InternetStatus = if ($pingResult) { "Online" } else { "Offline" }

    if (!(Test-Path $reportPath)) {
        $networkInfo | Export-Csv -Path $reportPath -NoTypeInformation
    } else {
        $networkInfo | Export-Csv -Path $reportPath -NoTypeInformation -Append
    }

    Add-Content -Path $logPath -Value "$timestamp : Network check successful."
} catch {
    Add-Content -Path $logPath -Value "$timestamp : ERROR - $_"
}
