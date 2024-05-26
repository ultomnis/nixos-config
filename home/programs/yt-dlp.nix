{
  programs.yt-dlp = {
    enable = true;

    # yt-dlp configuration
    settings = {
      extract-audio = true;
      output = "~/Audio/%(title)s.%(ext)s";
    };
  };
}
