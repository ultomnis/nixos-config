{
  config,
  lib,
  osConfig ? null,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.sway;
  nixConfig = if (osConfig != null) then osConfig else config;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland screen locker
    programs.swaylock = {
      enable = true;

      settings = {
        image = lib.mkIf (
          nixConfig.luminosity.selections.wallpaper != null
        ) nixConfig.luminosity.selections.wallpaper;

        show-failed-attempts = true;
      };
    };
  };
}
