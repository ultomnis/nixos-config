{ userConfig, ... }:

{
  # Configure network interfaces
  networking.networkmanager.enable = true;
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];

  # System tray applet
  programs.nm-applet.enable = true;
}
