{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.sway;
  inherit (config.luminosity.home.selections) wallpaper;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland screen locker
    programs.swaylock = {
      enable = true;

      settings = {
        image = lib.mkIf (wallpaper != null) wallpaper;
        scaling = "fill";
        show-failed-attempts = true;
      };
    };
  };
}
