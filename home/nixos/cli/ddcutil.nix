{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.ddcutil;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.ddcutil
    ];
  };
}
