{
  config,
  lib,
  systemOS,
  ...
}:

let
  cfg = config.luminosity.system.services.tailscale;

in
{
  services.tailscale =
    {
      inherit (cfg) enable;
    }
    |> lib.recursiveUpdate (
      lib.optionalAttrs (systemOS == "linux") {
        useRoutingFeatures = cfg.useRoutingFeatures;
      }
    );
}
