{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.modules.services.plasma;

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
        baloo-widgets
        dolphin
        dolphin-plugins
        elisa
        ffmpegthumbs
        gwenview
        kate
        khelpcenter
        konsole
        krdp
        ktexteditor
        kwin-x11
        okular
        plasma-browser-integration
        plasma-workspace-wallpapers
        xwaylandvideobridge
        ;
    };

    stylix.targets = {
      gtk.enable = false;
      qt.enable = false;
    };
  };
}
