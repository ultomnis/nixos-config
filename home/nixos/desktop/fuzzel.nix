{ config, lib, ... }:

let
  inherit (config.luminosity.home.selections) launcher;
  inherit (config.luminosity.home.desktop.environment) themes;

in
{
  config = lib.mkIf (launcher == "fuzzel") {
    # Wayland application launcher
    programs.fuzzel = {
      enable = true;

      settings = {
        main = {
          icon-theme = themes.iconName;
        };

        border = {
          width = 0;
          radius = 0;
        };

        colors = {
          background = "000000ff";
        };
      };
    };
  };
}
