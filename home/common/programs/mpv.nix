{
  # Media player
  programs.mpv = {
    enable = true;

    # mpv configuration
    config = {
      deband = "no";
      keep-open = "yes";
      osd-bar = "no";
      profile = "high-quality";
      vo = "gpu-next";
    };
  };
}
