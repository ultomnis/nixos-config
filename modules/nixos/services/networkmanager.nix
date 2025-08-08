{ config, ... }:

let
  cfg = config.luminosity.system.services.networkmanager;

in
{
  # Configure network interfaces
  networking.networkmanager = {
    inherit (cfg) enable;
    wifi.backend = "iwd";
  };
}
