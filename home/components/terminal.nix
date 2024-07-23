{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    brightnessctl
    exiftool
    ffmpeg
    nvtopPackages.amd
    tectonic
    unzip
    xorg.xrandr
  ];
}
