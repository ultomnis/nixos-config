{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.poppler-utils;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.poppler-utils
    ];
  };
}
