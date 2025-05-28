{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.networkmanager;

in
{
  config = lib.mkIf cfg.enable {
    # Configure network interfaces
    networking.networkmanager.enable = true;
  };
}
