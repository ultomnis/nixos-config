{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    gnome-secrets
    networkmanagerapplet
    polkit_gnome
  ];
}
