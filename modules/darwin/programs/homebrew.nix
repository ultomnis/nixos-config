{ config, ... }:

let
  cfg = config.luminosity.modules.programs.homebrew;

in
{
  # Package manager
  homebrew = {
    inherit (cfg) enable;

    # Behavior of brew bundle command during system activation
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    casks = [
      "obs"
      "steam"
    ];
  };
}
