{ config, ... }:

let
  cfg = config.luminosity.home.minimal.fuzzel;

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
