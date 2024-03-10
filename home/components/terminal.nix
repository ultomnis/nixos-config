{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    brightnessctl
    ffmpeg
    grim
    playerctl
    slurp
    swww
    tectonic
  ];
}
