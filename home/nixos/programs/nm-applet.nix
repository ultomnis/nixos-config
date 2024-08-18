{ pkgs, ... }:

{
  # Network connection editor
  services.network-manager-applet.enable = true;
  
  home.packages = with pkgs; [
    networkmanagerapplet
  ];
}
