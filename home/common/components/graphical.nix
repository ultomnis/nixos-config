{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    qbittorrent
  ];
}