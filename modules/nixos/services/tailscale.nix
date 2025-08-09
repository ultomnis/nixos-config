{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.tailscale;

in
{
  services.tailscale.useRoutingFeatures = cfg.useRoutingFeatures;
}
