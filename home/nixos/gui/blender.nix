{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.blender;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.blender
    ];
  };
}
