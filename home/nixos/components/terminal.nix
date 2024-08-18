{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bc
    brightnessctl
    nvtopPackages.amd
    unzip
    xorg.xrandr
  ];
}
