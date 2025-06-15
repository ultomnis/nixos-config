{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.foot;
  nixConfig = if (osConfig != null) then osConfig else config;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland terminal emulator
    programs.foot = {
      enable = true;

      settings = {
        colors = {
          alpha = 0.2;
          foreground = "ffffff";
          background = "000000";
        };

        main = {
          font = lib.mkIf (
            cfg.font.name != null && cfg.font.size != null
          ) "${cfg.font.name}:size=${toString cfg.font.size}";

          include = lib.optionals (cfg.theme != null) [
            "${pkgs.foot.themes}/share/foot/themes/rose-pine-moon"
          ];

          pad = "5x5";

          shell = lib.mkIf (nixConfig.luminosity.selections.shell != null) (
            lib.getExe pkgs.${nixConfig.luminosity.selections.shell}
          );
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
  };
}
