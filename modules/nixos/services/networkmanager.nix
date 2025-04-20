{ config, lib, ... }:

let
  inherit (config.luminosity.system.configurations) primaryUser;
  cfg = config.luminosity.system.services.networkmanager;

in
{
  config = lib.mkIf cfg.enable {
    # Configure network interfaces
    networking.networkmanager.enable = true;
    users.users.${primaryUser.name}.extraGroups = [ "networkmanager" ];
  };
}
