{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.mcat;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.mcat
    ];
  };
}
