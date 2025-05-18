{
  config,
  lib,
  osConfig ? null,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.sway;
  wallpaper =
    if (osConfig != null) then
      osConfig.luminosity.selections.wallpaper
    else
      config.luminosity.selections.wallpaper;

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
