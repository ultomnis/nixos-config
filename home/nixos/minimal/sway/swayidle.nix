{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.swayidle;
  inherit (config.luminosity.home.desktop.minimal) sway;

in
{
  # Wayland idle management daemon
  services.swayidle = {
    inherit (cfg) enable;

    timeouts =
      lib.singleton {
        # Lock the screen after 10 minutes
        timeout = 600;
        command = "${lib.getExe pkgs.swaylock} -f";
      }
      ++ lib.optional (sway.enable) {
        # Turn off the screen after 15 minutes
        timeout = 900;
        command = ''${lib.getExe' pkgs.swayfx "swaymsg"} "output * power off"'';
        resumeCommand = ''${lib.getExe' pkgs.swayfx "swaymsg"} "output * power on"'';
      };

    events = lib.singleton {
      event = "before-sleep";
      command = "${lib.getExe pkgs.swaylock} -f";
    };
  };
}
