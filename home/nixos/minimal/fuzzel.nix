{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.fuzzel;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland application launcher
    programs.fuzzel = {
      enable = true;

      settings = {
        border = {
          width = 2;
          radius = 0;
        };
      };
    };
  };
}
