{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.nautilus;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.nautilus
    ];
  };
}
