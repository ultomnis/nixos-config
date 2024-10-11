{ pkgs, ... }:

{
  xdg = {
    # XDG Desktop Portal
    portal = {
      enable = true;

      extraPortals = [
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
      ];

      configPackages = [
        pkgs.sway
      ];
    };
  };
}
