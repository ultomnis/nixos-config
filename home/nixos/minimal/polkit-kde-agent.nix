{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.polkit-kde-agent;

in
{
  # PolicyKit authentication agent
  config = lib.mkIf cfg.enable {
    systemd.user.services.polkit-kde-agent-1 = {
      Unit = {
        Description = "KDE PolicyKit Agent";

        Wants = [
          config.wayland.systemd.target
        ];

        After = [
          config.wayland.systemd.target
        ];
      };

      Install = {
        WantedBy = [
          config.wayland.systemd.target
        ];
      };

      Service = {
        ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
        Restart = "on-failure";
      };
    };
  };
}
