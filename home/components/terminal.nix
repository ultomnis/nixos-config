{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    brightnessctl
    exiftool
    ffmpeg
    jmtpfs
    libnatpmp
    tectonic
    unzip
    wireguard-tools
  ];
}
