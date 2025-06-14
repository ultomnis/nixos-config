{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.foot;
  shell = osConfig.luminosity.selections.shell or config.luminosity.selections.shell;

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

          include = [
            "${pkgs.foot.themes}/share/foot/themes/rose-pine-moon"
          ];

          pad = "5x5";
          shell = lib.mkIf (shell != null) (lib.getExe pkgs.${shell});
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
  };
}
