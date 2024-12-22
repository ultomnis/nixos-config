{
  # Command-line audio/video downloader
  programs.yt-dlp = {
    enable = true;

    settings = {
      embed-metadata = true;
      embed-thumbnail = true;
    };
  };
}
