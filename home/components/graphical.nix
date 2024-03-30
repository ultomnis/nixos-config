{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    keepassxc
    polkit_gnome
    reaper
  ];
}
