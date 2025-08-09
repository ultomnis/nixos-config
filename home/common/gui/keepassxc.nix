{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.keepassxc;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.keepassxc
    ];
  };
}
