{ lib, osConfig, ... }:

let
  inherit (osConfig.luminosity.system.selections)
    desktop
    wallpaper
    ;

in
{
  config = lib.mkIf (desktop == "sway") {
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
