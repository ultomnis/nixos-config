{ userConfig, ... }:

{
  networking = {
    # Enable NetworkManager
    networkmanager.enable = true;

    firewall = rec {
      allowedTCPPorts = [
        53317
      ];
      allowedUDPPorts = allowedTCPPorts;
    };
  };
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];
}
