{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    networkmanagerapplet
    polkit_gnome
  ];
}
