{ pkgs, ... }:

{
  # Wayland idle management daemon
  services.swayidle = {
    enable = true;

    timeouts = [
      {
        # Lock the screen
        timeout = 600;
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
      {
        # Turn off the screen
        timeout = 900;
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
        resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      } 
    ];

    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
    ];
  };
}
