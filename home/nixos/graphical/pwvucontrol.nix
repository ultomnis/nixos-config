{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.pwvucontrol;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.pwvucontrol
    ];
  };
}
