{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.sway;

in
{
  # Wayland screen locker
  programs.swaylock = {
    inherit (cfg) enable;

    settings =
      {
        show-failed-attempts = true;
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (cfg.wallpaper != null) {
          image = cfg.wallpaper;
        }
      );
  };
}
