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
      "lulu"
      "mullvad-browser"
      "protonvpn"
      "qbittorrent"
      "steam"
    ];

    taps = [
      "nikitabobko/tap"
    ];
  };
}
