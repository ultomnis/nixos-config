{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    bitwarden-cli
    quickemu
    sbctl
    wl-screenrec
  ];
}
