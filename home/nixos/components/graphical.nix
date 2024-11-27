{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    mullvad-browser
    nexusmods-app-unfree
    solaar
  ];
}
