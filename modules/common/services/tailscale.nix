{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.system.services.tailscale;
  isLinux = pkgs.stdenv.isLinux;

in
{
  config = lib.mkIf cfg.enable {
    services.tailscale =
      {
        enable = true;
      }
      // lib.optionalAttrs isLinux {
        useRoutingFeatures = "${cfg.useRoutingFeatures}";
      };
  };
}
