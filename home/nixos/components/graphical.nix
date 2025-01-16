{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    mullvad-browser
    protonvpn-gui
    transmission_4-gtk
  ];
}
