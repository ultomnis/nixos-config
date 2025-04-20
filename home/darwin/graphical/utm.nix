{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.graphical.utm;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      utm
    ];
  };
}
