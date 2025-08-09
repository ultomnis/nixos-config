{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.networkmanager;

in
{
  # Configure network interfaces
  networking.networkmanager = {
    inherit (cfg) enable;
    wifi.backend = "iwd";
  };
}
