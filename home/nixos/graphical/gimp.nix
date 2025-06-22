{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.gimp;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.gimp3
    ];
  };
}
