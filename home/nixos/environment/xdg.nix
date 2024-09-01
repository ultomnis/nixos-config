{ inputs, pkgs, ... }:

{
  xdg = {
    # SVG-based theme engine
    configFile."Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=KvGnomeDark
    '';

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
