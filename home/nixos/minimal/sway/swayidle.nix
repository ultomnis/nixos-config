{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.sway;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland idle management daemon
    services.swayidle = {
      enable = true;

      timeouts = [
        {
          # Lock the screen after 10 minutes
          timeout = 600;
          command = "${lib.getExe pkgs.swaylock} -f";
        }
        {
          # Turn off the screen after 15 minutes
          timeout = 900;
          command = ''${lib.getExe' pkgs.sway "swaymsg"} "output * power off"'';
          resumeCommand = ''${lib.getExe' pkgs.sway "swaymsg"} "output * power on"'';
        }
      ];

      events = [
        {
          event = "before-sleep";
          command = "${lib.getExe pkgs.swaylock} -f";
        }
      ];
    };
  };
}
