{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.libqalculate;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.libqalculate
    ];
  };
}
