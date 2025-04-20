{ config, lib, ... }:

let
  inherit (config.luminosity.system.selections) desktop;

in
{
  config = lib.mkIf (desktop == "sway") {
    # Tiling Wayland compositor
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = [ ];
    };

    # Realtime priority
    security.pam.loginLimits = [
      {
        domain = "@users";
        item = "rtprio";
        type = "-";
        value = 1;
      }
    ];
  };
}
