{ userConfig, ... }:

{
  # Enable NetworkManager
  networking.networkmanager.enable = true;
  users.users.${userConfig.username}.extraGroups = [ "networkmanager" ];
}
