{
  # Package manager
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;

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
