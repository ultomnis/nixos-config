{ pkgs, ... }:

{
  # Allow fontconfig to discover fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    font-awesome
    noto-fonts
  ];
}
