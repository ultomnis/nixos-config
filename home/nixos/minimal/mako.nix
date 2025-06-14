{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.mako;

in
{
  config = lib.mkIf cfg.enable {
    # Notification daemon
    services.mako = {
      enable = true;

      settings = {
        background-color = "#00000033";
        border-size = 0;
        default-timeout = 5000;
      };
    };
  };
}
