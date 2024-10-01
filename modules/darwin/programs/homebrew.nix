{
  # Package manager
  homebrew = {
    enable = true;

    # Behavior of brew bundle command
    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };

    # Behavior of manually invoked Homebrew commands
    global = {
      autoUpdate = false;
    };

    casks = [
      "aerospace"
      "firefox"
      "lulu"
      "mullvad-browser"
      "mullvadvpn"
      "steam"
    ];

    taps = [
      "nikitabobko/tap"
    ];
  };
}
