{ config, ... }:

let
  cfg = config.luminosity.modules.services.tailscale;

in
{
  services.tailscale = {
    inherit (cfg) enable;
  };
}
