{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    keepassxc
    networkmanagerapplet
    picard
    protonvpn-gui
    qbittorrent
    ryujinx
  ];
}
