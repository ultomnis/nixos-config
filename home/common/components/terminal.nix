{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    exiftool
    ffmpeg
    jmtpfs
    unzip
  ];
}
