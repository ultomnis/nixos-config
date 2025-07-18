{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.xdg-desktop-portal;
  inherit (config.luminosity.home.desktop.minimal) sway;

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
      };

      extraPortals = builtins.attrValues {
        inherit (pkgs) xdg-desktop-portal-wlr;
        inherit (pkgs.kdePackages) xdg-desktop-portal-kde;
      };
    })
  ];
}
