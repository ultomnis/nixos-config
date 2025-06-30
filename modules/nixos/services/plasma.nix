{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.system.services.plasma;

in
{
  config = lib.mkIf cfg.enable {
    # KDE Plasma
    services = {
      displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
      };

      desktopManager = {
        plasma6.enable = true;
      };
    };

    environment.plasma6.excludePackages = builtins.attrValues {
      inherit (pkgs.kdePackages)
        ark
        aurorae
        elisa
        gwenview
        kate
        khelpcenter
        konsole
        krdp
        ktexteditor
        kwin-x11
        plasma-browser-integration
        plasma-workspace-wallpapers
        xwaylandvideobridge
        ;
    };
  };
}
