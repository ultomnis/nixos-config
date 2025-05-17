{
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.btop;

in
{
  config = lib.mkIf cfg.enable {
    # Resource monitor
    programs.btop = {
      enable = true;

      settings = {
        color_theme = cfg.theme;
        theme_background = false;
        rounded_corners = false;
        vim_keys = true;
      };

      themes = {
        rose-pine = builtins.readFile (inputs.rose-pine-btop + "/rose-pine.theme");
      };
    };
  };
}
