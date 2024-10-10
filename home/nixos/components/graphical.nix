{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    alpaca
    kdePackages.qqc2-desktop-style
    mullvad-browser
  ];
}
