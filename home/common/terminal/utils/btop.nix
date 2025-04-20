{ config, lib, ... }:

let
  cfg = config.luminosity.programs.terminal.btop;

in
{
  config = lib.mkIf cfg.enable {
    # Resource monitor
    programs.btop = {
      enable = true;

      settings = {
        color_theme = "TTY";
        theme_background = false;
        rounded_corners = false;
        vim_keys = true;
      };
    };
  };
}
