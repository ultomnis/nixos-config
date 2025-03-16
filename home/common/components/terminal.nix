{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    ffmpeg
    kew
    libqalculate
    libsecret
    mat2
  ];
}
