{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.photoqt;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.photoqt
    ];
  };
}
