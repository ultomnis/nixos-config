{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.qtsvg;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kdePackages.qtsvg
    ];
  };
}
