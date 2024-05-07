{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    keepassxc
    networkmanagerapplet
    qbittorrent
    ryujinx
  ];
}
