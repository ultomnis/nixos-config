{ config, ... }:

let
  cfg = config.luminosity.system.services.tailscale;

in
{
  services.tailscale.useRoutingFeatures = cfg.useRoutingFeatures;
}
