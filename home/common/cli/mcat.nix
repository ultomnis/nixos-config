{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.mcat;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.mcat
    ];
  };
}
