{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.krita;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.krita
    ];
  };
}
