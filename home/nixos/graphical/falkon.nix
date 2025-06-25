{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.falkon;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kdePackages.falkon
    ];
  };
}
