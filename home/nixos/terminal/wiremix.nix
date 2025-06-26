{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.wiremix;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.wiremix
    ];
  };
}
