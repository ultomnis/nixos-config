{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    brightnessctl
    ffmpeg
    jmtpfs
    libnatpmp
    mat2
    tectonic
    unzip
    xorg.xrandr
  ];
}
