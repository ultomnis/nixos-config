{
  # Enable networking
  networking.networkmanager.enable = true;
  users.users.user.extraGroups = [ "networkmanager" ];

  # network-manager-applet
  programs.nm-applet.enable = true;

  # OpenSSH
  services.openssh.enable = true;
}
