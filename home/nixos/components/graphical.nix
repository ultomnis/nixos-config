{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    mullvad-browser
    transmission_4-gtk
  ];
}
