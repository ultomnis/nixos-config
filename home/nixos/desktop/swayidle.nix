{ pkgs, ... }:

{
  # Wayland idle management daemon
  services.swayidle = {
    enable = true;

    timeouts = [
      {
        # Lock the screen after 10 minutes
        timeout = 600;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        # Turn off the screen after 15 minutes
        timeout = 900;
        command = ''${pkgs.sway}/bin/swaymsg "output * power off"'';
        resumeCommand = ''${pkgs.sway}/bin/swaymsg "output * power on"'';
      }
    ];

    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
  };
}
