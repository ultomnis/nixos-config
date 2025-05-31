{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.utm;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.utm
    ];
  };
}
