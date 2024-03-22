{ userConfig, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];

  # network-manager-applet
  programs.nm-applet.enable = true;
}
