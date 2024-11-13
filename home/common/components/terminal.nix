{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    exiftool
    ffmpeg
    libqalculate
  ];
}
