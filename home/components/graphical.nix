{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    gimp
    gnome-secrets
    networkmanagerapplet
    polkit_gnome
  ];
}
