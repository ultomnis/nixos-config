{ pkgs, ... }:

{
  # GNOME Keyring
  services.gnome-keyring.enable = true;

  home.packages = with pkgs; [
    seahorse
  ];
}
