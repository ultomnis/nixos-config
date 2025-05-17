{
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.bat;

in
{
  config = lib.mkIf cfg.enable {
    # Alternative to cat
    programs.bat = {
      enable = true;

      config = {
        theme = lib.mkIf (cfg.theme != null) cfg.theme;
        squeeze-blank = true;
        squeeze-limit = "1";
      };

      themes = {
        rose-pine = {
          src = inputs.rose-pine-tm;
          file = "dist/themes/rose-pine.tmTheme";
        };
      };
    };
  };
}
