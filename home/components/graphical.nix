{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    gnome-secrets
    networkmanagerapplet
    polkit_gnome
    zrythm
  ];
}
