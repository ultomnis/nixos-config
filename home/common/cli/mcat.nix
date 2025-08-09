{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.cli.mcat;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.mcat
    ];
  };
}
