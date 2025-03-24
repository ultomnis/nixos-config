{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    ffmpeg
    libqalculate
    mat2
    unar
  ];
}
