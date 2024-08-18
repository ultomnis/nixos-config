{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    cmus
    exiftool
    ffmpeg
  ];
}
