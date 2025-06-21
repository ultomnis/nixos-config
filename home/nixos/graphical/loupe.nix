{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.loupe;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.loupe
    ];
  };
}
