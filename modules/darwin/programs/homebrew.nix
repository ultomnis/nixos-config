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
      "firefox"
      "iterm2"
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
