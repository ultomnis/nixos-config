{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.godot;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.godot
    ];
  };
}
