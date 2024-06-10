{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    brightnessctl
    ffmpeg
    jmtpfs
    nvtopPackages.amd
    tectonic
    unzip
    xorg.xrandr
  ];
}
