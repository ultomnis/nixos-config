{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    keepassxc
    networkmanagerapplet
    protonvpn-gui
    ryujinx
    transmission-gtk
  ];
}
