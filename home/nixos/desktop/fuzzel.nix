{ pkgs, ... }:

{
  # Wayland application launcher
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        icon-theme = "Papirus";
        terminal = "${pkgs.ghostty}/bin/ghostty -e";
      };

      border = {
        width = 0;
        radius = 0;
      };

      colors = {
        background = "000000ff";
      };
    };
  };
}
