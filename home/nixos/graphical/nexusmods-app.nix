{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.nexusmods-app;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.nexusmods-app
    ];
  };
}
