{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    mullvad-browser
    protonvpn-gui
    qbittorrent
  ];
}