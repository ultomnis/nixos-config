{ inputs, pkgs, ... }:

{
  # NixOS module for Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
