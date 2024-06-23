{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    keepassxc
    protonvpn-gui
    qbittorrent
    ryujinx
  ];
}
