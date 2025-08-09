{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.tailscale;

in
{
  services.tailscale = {
    inherit (cfg) enable;
  };
}
