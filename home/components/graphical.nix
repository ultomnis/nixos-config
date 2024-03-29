{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    keepassxc
    networkmanagerapplet
    polkit_gnome
    zrythm
  ];
}
