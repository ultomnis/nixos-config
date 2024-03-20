{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    keepassxc
    polkit_gnome
    protonvpn-gui
    qbittorrent
  ];
}
