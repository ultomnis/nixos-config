{ config, lib, ... }:

let
  cfg = config.luminosity.desktop.mako;

in
{
  config = lib.mkIf cfg.enable {
    # Notification daemon
    services.mako = {
      enable = true;
      backgroundColor = "#000000ff";
      borderSize = 0;
      defaultTimeout = 5000;
    };
  };
}
