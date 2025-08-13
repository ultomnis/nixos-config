{ config, ... }:

let
  cfg = config.luminosity.home.hybrid.icons;

in
{
  stylix = {
    icons = {
      inherit (cfg) enable;
      package = cfg.package;
      dark = cfg.dark;
      light = cfg.light;
    };

    targets.nixos-icons = {
      inherit (cfg) enable;
    };
  };
}
