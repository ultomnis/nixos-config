{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.koboldcpp;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.koboldcpp
    ];
  };
}
