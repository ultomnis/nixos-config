{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.mullvad-browser;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.mullvad-browser
    ];
  };
}
