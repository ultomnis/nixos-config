{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.ffmpeg;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.ffmpeg
    ];
  };
}
