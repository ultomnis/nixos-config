{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    gnome-secrets
    mullvad-browser
  ];
}
