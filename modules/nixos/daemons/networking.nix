{ vars, ... }:

{
  # Configure network interfaces
  networking.networkmanager.enable = true;
  users.users.${vars.userConfig.name}.extraGroups = [ "networkmanager" ];
}
