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

    brews = [
      {
        name = "syncthing";
        restart_service = true;
      }
    ];

    casks = [
      "firefox"
      "lulu"
      "mullvad-browser"
      "mullvadvpn"
      "obs"
      "steam"
    ];
  };
}
