{
  # Enable networking
  networking.networkmanager.enable = true;
  users.users.user.extraGroups = [ "networkmanager" ];

  # OpenSSH
  services.openssh.enable = true;
}
