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
        default-timeout = 5000;
      };
    };
  };
}
