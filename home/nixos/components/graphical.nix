{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    alpaca
    mullvad-browser
  ];
}
