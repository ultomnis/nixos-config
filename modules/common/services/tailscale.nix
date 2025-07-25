{ config, ... }:

let
  cfg = config.luminosity.system.services.tailscale;

in
{
  services.tailscale = {
    inherit (cfg) enable;
  };
}
