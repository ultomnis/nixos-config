{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.okular;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kdePackages.okular
    ];
  };
}
