{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.qview;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.qview
    ];
  };
}
