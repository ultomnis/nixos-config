{ pkgs, ... }:

{
  # Idle daemon
  services.hypridle = {
    enable = true;

    lockCmd = "${pkgs.procps}/bin/pidof ${pkgs.hyprlock}/bin/hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
    beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
    afterSleepCmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";

    listeners = [
      {
        timeout = 300;
        onTimeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
        onResume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
      }
      {
        timeout = 600;
        onTimeout = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      {
        timeout = 900;
        onTimeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
        onResume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      }
    ];
  }; 
}
