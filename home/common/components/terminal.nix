{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    ffmpeg
    libqalculate
    libsecret
    mat2
    unar
  ];
}
