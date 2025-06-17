{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.yt-dlp;

in
{
  # Command-line audio/video downloader
  programs.yt-dlp = {
    inherit (cfg) enable;

    settings = {
      embed-metadata = true;
      embed-thumbnail = true;
    };
  };
}
