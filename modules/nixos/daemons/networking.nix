{ userConfig, ... }:

{
  # Configure network interfaces
  networking.networkmanager.enable = true;
  users.users.${userConfig.name}.extraGroups = [ "networkmanager" ];
}
