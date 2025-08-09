{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.gui.anki;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.anki-bin
    ];
  };
}
