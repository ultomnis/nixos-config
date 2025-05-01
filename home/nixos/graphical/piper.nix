{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.piper;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      piper
    ];
  };
}
