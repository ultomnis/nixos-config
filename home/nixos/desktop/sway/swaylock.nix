{ config, lib, ... }:

let
  inherit (config.luminosity.desktop)
    environment
    selections
    ;

in
{
  config = lib.mkIf environment.sway.enable {
    # Wayland screen locker
    programs.swaylock = {
      enable = true;

      settings = {
        image = lib.mkIf (selections.wallpaper != null) selections.wallpaper;
        scaling = "fill";
        show-failed-attempts = true;
      };
    };
  };
}
