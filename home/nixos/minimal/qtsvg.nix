{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.qtsvg;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kdePackages.qtsvg
    ];
  };
}
