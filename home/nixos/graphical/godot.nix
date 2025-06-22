{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.godot;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.godot
    ];
  };
}
