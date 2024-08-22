{ config, ... }:

{
  programs.yt-dlp = {
    enable = true;

    # yt-dlp configuration
    settings = {
      embed-metadata = true;
      embed-thumbnail = true;
      output = "${config.home.homeDirectory}/Downloads/%(title)s.%(ext)s";
    };
  };
}
