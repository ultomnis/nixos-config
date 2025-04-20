{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.graphical.piper;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      piper
    ];
  };
}
