{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.graphical.tor-browser;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      tor-browser
    ];
  };
}
