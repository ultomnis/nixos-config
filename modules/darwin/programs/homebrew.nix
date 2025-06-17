{ config, ... }:

let
  cfg = config.luminosity.system.programs.homebrew;

in
{
  # Package manager
  homebrew = {
    inherit (cfg) enable;

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
      "keepassxc"
      "mullvad-browser"
      "steam"
      "tor-browser"
      "vmware-fusion"
    ];
  };
}
