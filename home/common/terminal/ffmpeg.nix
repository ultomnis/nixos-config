{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.terminal.ffmpeg;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ffmpeg
    ];
  };
}
