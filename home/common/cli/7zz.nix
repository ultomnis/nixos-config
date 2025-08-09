{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli._7zz;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs._7zz
    ];
  };
}
