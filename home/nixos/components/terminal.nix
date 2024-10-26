{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    nvtopPackages.amd
    quickemu
    sbctl
    wl-screenrec
  ];
}
