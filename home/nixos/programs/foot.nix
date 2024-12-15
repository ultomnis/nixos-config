{ pkgs, ... }:

{
  # Wayland terminal emulator
  programs.foot = {
    enable = true;

    # Configuration
    settings = {
      main = {
        font = "Hack Nerd Font Mono:size=11";
        include = "${pkgs.foot.themes}/share/foot/themes/rose-pine";
      };

      bell = {
        urgent = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
