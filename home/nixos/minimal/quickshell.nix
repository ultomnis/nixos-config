{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.quickshell;

in
{
  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.quickshell
    ];
  };
}
