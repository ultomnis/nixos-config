{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.cli.poppler-utils;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.poppler-utils
    ];
  };
}
