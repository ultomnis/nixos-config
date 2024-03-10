{ pkgs, ... }:

{
  # Wayland application launcher
  programs.fuzzel = {
    enable = true;

    # Fuzzel configuration
    settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
      };

      colors = {
        background = "000000bf";
      };
    };
  };
}
