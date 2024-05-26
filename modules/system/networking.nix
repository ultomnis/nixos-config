{ userConfig, ... }:

{
  networking = {
    # Enable NetworkManager
    networkmanager.enable = true;

    # Reverse path filtering
    firewall.checkReversePath = "loose";
  };
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];

  programs.nm-applet.enable = true;
}
