{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    keepassxc
    networkmanagerapplet
    polkit_gnome
  ];
}
