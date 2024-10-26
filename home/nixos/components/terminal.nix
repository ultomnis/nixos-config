{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    quickemu
    sbctl
    wl-screenrec
  ];
}
