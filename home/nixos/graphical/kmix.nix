{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.kmix;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kdePackages.kmix
    ];
  };
}
