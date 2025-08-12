{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.brightnessctl;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.brightnessctl
    ];
  };
}
