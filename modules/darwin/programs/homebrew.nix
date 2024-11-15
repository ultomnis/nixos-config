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
      "firefox"
      "localsend"
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
