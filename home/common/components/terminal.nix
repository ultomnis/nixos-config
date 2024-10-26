{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    bitwarden-cli
    exiftool
    ffmpeg
    unzip
  ];
}
