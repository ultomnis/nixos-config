{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.gwenview;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kdePackages.gwenview
    ];
  };
}
