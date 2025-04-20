{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.pipewire;

in
{
  config = lib.mkIf cfg.enable {
    # PipeWire multimedia framework
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true; # JACK applications

      wireplumber.extraConfig."80-bluez-properties" = {
        "monitor.bluez.properties" = {
          "bluez5.enable-hw-volume" = false;
        };
      };
    };

    # RealtimeKit system service
    security.rtkit.enable = true;
  };
}
