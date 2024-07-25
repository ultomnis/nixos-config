{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    brightnessctl
    cmus
    exiftool
    ffmpeg
    nvtopPackages.amd
    unzip
    xorg.xrandr
  ];
}
