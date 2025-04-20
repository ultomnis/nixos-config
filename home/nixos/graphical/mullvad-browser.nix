{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.graphical.mullvad-browser;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mullvad-browser
    ];
  };
}
