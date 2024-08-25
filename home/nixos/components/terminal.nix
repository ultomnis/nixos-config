{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    brightnessctl
    nvtopPackages.amd
  ];
}
