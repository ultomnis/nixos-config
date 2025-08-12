{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.krita;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.krita
    ];
  };
}
