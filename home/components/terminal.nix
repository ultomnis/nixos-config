{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    brightnessctl
    ffmpeg
    playerctl
    tectonic
  ];
}
