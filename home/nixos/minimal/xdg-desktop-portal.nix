{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.minimal.xdg-desktop-portal;
  inherit (config.luminosity.home.minimal) sway;

in
{
  # XDG Desktop Portal
  xdg.portal = lib.mkMerge [
    {
      inherit (cfg) enable;
    }

    (lib.mkIf sway.enable {
      config.sway = {
        default = [
          "wlr"
        ];

        "org.freedesktop.impl.portal.FileChooser" = "kde";
        "org.freedesktop.impl.portal.Settings" = "darkman";
      };

      extraPortals = builtins.attrValues {
        inherit (pkgs) xdg-desktop-portal-wlr;
        inherit (pkgs.kdePackages) xdg-desktop-portal-kde;
      };
    })
  ];
}
