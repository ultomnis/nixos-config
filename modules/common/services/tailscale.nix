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
  config = lib.mkIf cfg.enable {
    services.tailscale =
      {
        enable = true;
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (systemOS == "linux") {
          useRoutingFeatures = cfg.useRoutingFeatures;
        }
      );
  };
}
