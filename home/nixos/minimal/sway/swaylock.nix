{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.sway;

in
{
  # Wayland screen locker
  programs.swaylock = {
    inherit (cfg) enable;

    settings = {
      image = lib.mkIf (cfg.wallpaper != null) cfg.wallpaper;
      show-failed-attempts = true;
    };
  };
}
