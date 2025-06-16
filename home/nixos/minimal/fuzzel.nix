{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.fuzzel;
  inherit (config.luminosity.home.desktop.environment) gtk;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland application launcher
    programs.fuzzel = {
      enable = true;

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
  };
}
