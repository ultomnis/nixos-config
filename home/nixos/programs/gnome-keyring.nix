{ pkgs, ... }:

{
  services.gnome-keyring.enable = true;

  home.packages = with pkgs; [
    gnome-keyring
  ];
}
