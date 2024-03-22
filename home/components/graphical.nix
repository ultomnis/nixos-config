{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    keepassxc
    polkit_gnome
    protonvpn-gui
    transmission-gtk
    zrythm
  ];
}
