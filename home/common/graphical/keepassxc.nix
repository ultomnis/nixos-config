{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.keepassxc;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.keepassxc
    ];
  };
}
