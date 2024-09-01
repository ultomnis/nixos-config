{ pkgs, ... }:

{
  # Wayland idle management daemon
  services.swayidle = {
    enable = true;

    timeouts = [
      {
        # Lock the screen
        timeout = 600;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        # Turn off the screen
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
