{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    brightnessctl
    ffmpeg
    tectonic
    unzip
    wireguard-tools
  ];
}
