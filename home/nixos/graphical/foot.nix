{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.foot;
  inherit (config.luminosity.home.selections) shell;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland terminal emulator
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = lib.mkIf (
            cfg.font != null && cfg.fontSize != null
          ) "${cfg.font}:size=${toString cfg.fontSize}";

          include = lib.optionals (cfg.theme != null) [
            "${pkgs.foot.themes}/share/foot/themes/${cfg.theme}"
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
