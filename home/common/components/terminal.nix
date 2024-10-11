{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    cmus
    exiftool
    ffmpeg
    jmtpfs
    unzip
  ];
}
