{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.fuzzel;
  inherit (config.luminosity.home.desktop.environment) themes;

in
{
  config = lib.mkIf cfg.enable {
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
