{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.kew;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kew
    ];
  };
}
