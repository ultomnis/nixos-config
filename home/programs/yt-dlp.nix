{
  programs.yt-dlp = {
    enable = true;

    # yt-dlp configuration
    settings = {
      embed-metadata = true;
      embed-thumbnail = true;
    };
  };
}
