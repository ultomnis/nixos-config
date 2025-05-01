{
  config,
  lib,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.yt-dlp;

in
{
  config = lib.mkIf cfg.enable {
    # Command-line audio/video downloader
    programs.yt-dlp = {
      enable = true;

      settings = {
        embed-metadata = true;
        embed-thumbnail = true;
      };
    };
  };
}
