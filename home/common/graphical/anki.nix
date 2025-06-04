{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.anki;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.anki-bin
    ];
  };
}
