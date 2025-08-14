{ config, ... }:

let
  cfg = config.luminosity.modules.services.networkmanager;

in
{
  # Configure network interfaces
  networking = {
    networkmanager = {
      inherit (cfg) enable;
      wifi.backend = "iwd";
    };
  };
}
