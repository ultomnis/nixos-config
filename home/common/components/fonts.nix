{ pkgs, ... }:

{
  # Allow fontconfig to discover fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerdfonts
    noto-fonts
  ];
}
