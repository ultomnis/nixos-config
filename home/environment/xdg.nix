{ inputs, pkgs, ... }:

{
  # XDG Desktop Portal
  xdg.portal = {
    enable = true;
    
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    
    configPackages = [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
  };
}
