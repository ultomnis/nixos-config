{
  config,
  lib,
  osConfig ? null,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.sway;
  wallpaper = osConfig.luminosity.selections.wallpaper or config.luminosity.selections.wallpaper;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland screen locker
    programs.swaylock = {
      enable = true;

      settings = {
        image = lib.mkIf (wallpaper != null) wallpaper;
        show-failed-attempts = true;
      };
    };
  };
}
