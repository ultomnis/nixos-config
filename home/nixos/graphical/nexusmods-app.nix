{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.nexusmods-app;
  inherit (config.luminosity.home.desktop.configurations) unfree;

in
{
  config = lib.mkIf (cfg.enable && unfree.enable) {
    home.packages = [
      pkgs.nexusmods-app-unfree
    ];
  };
}
