{ userConfig, ... }:

{
  networking = {
    # Enable NetworkManager
    networkmanager.enable = true;

    firewall = rec {
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ]; # KDE Connect
      allowedUDPPortRanges = allowedTCPPortRanges; # KDE Connect
    };
  };
  
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];
}
