{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    protonvpn-gui
    qbittorrent
    ryujinx
  ];
}
