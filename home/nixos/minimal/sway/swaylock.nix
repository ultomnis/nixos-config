{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.sway;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland screen locker
    programs.swaylock = {
      enable = true;

      settings = {
        show-failed-attempts = true;
      };
    };
  };
}
