{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    bitwarden-desktop
  ];
}
