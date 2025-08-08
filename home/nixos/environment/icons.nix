{ config, ... }:

let
  cfg = config.luminosity.home.desktop.environment.icons;

in
{
  stylix.icons = {
    inherit (cfg) enable;
    package = cfg.package;
    dark = cfg.dark;
    light = cfg.light;
  };
}
