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
      "mullvad-browser"
      "protonvpn"
      "steam"
      "utm"
    ];
  };
}
