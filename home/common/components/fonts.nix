{ pkgs, ... }:

{
  # Allow fontconfig to discover fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
    noto-fonts
  ];
}
