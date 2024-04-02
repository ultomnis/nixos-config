{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    brightnessctl
    exiftool
    ffmpeg
    tectonic
    unzip
  ];
}
