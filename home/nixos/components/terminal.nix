{ pkgs, ... }:

{
  # CLI/TUI programs
  home.packages = with pkgs; [
    grim
  ];
}
