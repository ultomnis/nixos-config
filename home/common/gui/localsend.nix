{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.localsend;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.localsend
    ];
  };
}
