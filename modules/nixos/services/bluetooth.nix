{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.bluetooth;

in
{
  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;

      settings = {
        General = {
          FastConnectable = true;
        };
      };
    };
  };
}
