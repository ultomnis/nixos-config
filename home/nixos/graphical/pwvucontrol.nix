{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.graphical.pwvucontrol;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pwvucontrol
    ];
  };
}
