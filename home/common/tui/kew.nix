{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.tui.kew;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kew
    ];
  };
}
