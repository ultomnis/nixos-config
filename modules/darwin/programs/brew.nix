{
  # Package manager
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;

    brews = [
      "mpv"
      "yt-dlp"
    ];

    casks = [
      "aerospace"
      "mullvad-browser"
      "protonvpn"
      "steam"
    ];

    taps = [
      "nikitabobko/aerospace"
    ];
  };
}
