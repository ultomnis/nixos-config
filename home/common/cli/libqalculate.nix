{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.libqalculate;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.libqalculate
    ];
  };
}
