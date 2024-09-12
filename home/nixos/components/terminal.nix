{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    nvtopPackages.amd
    sbctl
  ];
}
