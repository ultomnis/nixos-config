{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.grim;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.grim
    ];
  };
}
