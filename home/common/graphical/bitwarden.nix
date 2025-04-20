{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.graphical.bitwarden;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];
  };
}
