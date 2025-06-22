{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.blender;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.blender
    ];
  };
}
