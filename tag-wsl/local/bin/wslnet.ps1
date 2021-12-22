$FirewallNameFormat = "WSL2 ({1}) "

function Main {
  $cmd = $args[0]
  $cmd_args = $args[1..$args.Length]

  switch($cmd) {
    "status" {                        Status @cmd_args; break }
    "open"   { AsAdministrator @args; Open  @cmd_args;  break }
    "close"  { AsAdministrator @args; Close @cmd_args;  break }
    default  {                        Help;             break }
  }
}

function Help {
}

function AsAdministrator {
  # If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
  # {
  #   Start-Process powershell -Verb RunAs "-File","$(Write-Output $MyInvocation.ScriptName)","$args";
  #   exit;
  # }
}

function Status {
}

function Open {
}

function Close {
}

Main @Args

# echo "done"
# $Host.UI.RawUI.ReadKey() | Out-Null;

# netsh interface portproxy show all
# netsh interface portproxy reset
# netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=8080 connectaddress=172.22.133.188 connectport=8080

# Get-NetInterfaceConfiguration -Context PortProxy -Protocol v4Tov4
# New-NetInterfaceConfiguration -Context PortProxy -Protocol v4Tov4 -ListenAddress 0.0.0.0 -ListenPort 2222 -ConnectAddress 172.23.129.80 -ConnectPort 2222
# Remove-NetInterfaceConfiguration -Context PortProxy -Protocol v4Tov4 -ListenAddress 0.0.0.0 -ListenPort 2222
#
# Get-NetFirewallRule
# New-NetFirewallRule
# Remove-NetFirewallRule
# netsh advfirewall firewall add rule name=”WSL2 (In)” dir=in action=allow protocol=TCP localport=2222
# netsh advfirewall firewall add rule name=”WSL2 (Out)” dir=out action=allow protocol=TCP localport=2222
