{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.fuzzel;

in
{
  # Wayland application launcher
  programs.fuzzel = {
    inherit (cfg) enable;

    settings = {
      border = {
        width = 2;
        radius = 0;
      };
    };
  };
}
