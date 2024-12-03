{ pkgs, ... }:

{
  # Allow fontconfig to discover fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.hack
    noto-fonts
  ];
}
