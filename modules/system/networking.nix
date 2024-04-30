{ lib, pkgs, userConfig, ... }:

{
  networking = {
    # Enable NetworkManager
    networkmanager = {
      enable = true;
      plugins = lib.mkForce [
        pkgs.networkmanager-openvpn
      ];
    };
  };
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];

  programs.nm-applet.enable = true;
}
