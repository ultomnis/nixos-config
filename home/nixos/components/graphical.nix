{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    protonvpn-gui
  ];
}
