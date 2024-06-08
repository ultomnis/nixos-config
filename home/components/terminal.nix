{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    brightnessctl
    ffmpeg
    jmtpfs
    mat2
    nvtopPackages.amd
    tectonic
    unzip
    xorg.xrandr
  ];
}
