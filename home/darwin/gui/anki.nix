{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.anki;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.anki-bin
    ];
  };
}
