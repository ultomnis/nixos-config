{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.utm;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.utm
    ];
  };
}
