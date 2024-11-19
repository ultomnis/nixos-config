{ userConfig, ... }:

{
  networking = {
    # Enable NetworkManager
    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [
        53317 # LocalSend
      ];
      allowedUDPPorts = [
        53317 # LocalSend
      ];

      checkReversePath = "loose";
    };
  };

  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];
}
