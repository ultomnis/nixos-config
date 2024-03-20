{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    ardour
    keepassxc
    libsForQt5.polkit-kde-agent
    protonvpn-gui
    qbittorrent
  ];
}
