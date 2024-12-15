{ pkgs, ... }:

{
  # Wayland application launcher
  programs.fuzzel = {
    enable = true;

    # Fuzzel configuration
    settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        icon-theme = "Papirus";
      };

      border = {
        width = 2;
        radius = 0;
      };

      colors = {
        background = "000000ff";
        border = "ffffff00";
      };
    };
  };
}
