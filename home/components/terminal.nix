{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    brightnessctl
    exiftool
    ffmpeg
    jmtpfs
    nvtopPackages.amd
    tectonic
    unzip
    xorg.xrandr
  ];
}
