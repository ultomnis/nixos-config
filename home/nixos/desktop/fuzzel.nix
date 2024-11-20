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

      border = {
        width = 2;
        radius = 4;
      };

      colors = {
        background = "0f0f0fcc";
        border = "f0f0f0cc";
      };
    };
  };
}
