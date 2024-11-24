{
  # Package manager
  homebrew = {
    enable = true;

    # Behavior of brew bundle command during system activation
    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };

    # Behavior of manually invoked Homebrew commands
    global = {
      autoUpdate = false;
    };

    casks = [
      "firefox"
      "lulu"
      "mullvad-browser"
      "obs"
      "steam"
      "utm"
    ];

    masApps = {
      WireGuard = 1451685025;
    };
  };
}
