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
        background-color = "#000000ff";
        border-size = 0;
        default-timeout = 5000;
      };
    };
  };
}
