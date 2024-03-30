{ lib, userConfig, ... }:

{
  networking = {
    # Enable NetworkManager
    networkmanager = {
      enable = true;
      plugins = lib.mkForce [];
    };
    
    # rp_filter
    firewall.checkReversePath = "loose";
  };
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];
}
