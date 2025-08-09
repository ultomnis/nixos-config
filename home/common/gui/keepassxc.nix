{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.gui.keepassxc;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.keepassxc
    ];
  };
}
