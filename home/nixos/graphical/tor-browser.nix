{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.tor-browser;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.tor-browser
    ];
  };
}
