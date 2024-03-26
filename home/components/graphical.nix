{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    gimp
    gnome-secrets
    networkmanagerapplet
    polkit_gnome
    reaper
  ];
}
