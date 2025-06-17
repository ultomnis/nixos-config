{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.fuzzel;
  inherit (config.luminosity.home.desktop.environment) gtk;

in
{
  # Wayland application launcher
  programs.fuzzel = {
    inherit (cfg) enable;

    settings = {
      main = {
        icon-theme = lib.mkIf (gtk.icon.name != null) gtk.icon.name;
      };

      border = {
        width = 2;
        radius = 0;
      };

      colors = {
        background = "00000099";
      };
    };
  };
}
