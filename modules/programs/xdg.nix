{ pkgs, ... }:

{
  # XDG Desktop Portal  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
