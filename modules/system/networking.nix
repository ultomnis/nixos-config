{ lib, userConfig, ... }:

{
  networking = {
    # Enable NetworkManager
    networkmanager = {
      enable = true;
      plugins = lib.mkForce [];
    };

    # Reverse path filtering
    firewall.checkReversePath = "loose";
  };
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];

  programs.nm-applet.enable = true;
}
