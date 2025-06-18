{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.foot;

in
{
  # Wayland terminal emulator
  programs.foot = {
    inherit (cfg) enable;

    settings = {
      colors = {
        alpha = 0.6;
        foreground = "ffffff";
        background = "000000";
      };

      main =
        {
          include = lib.optionals (cfg.theme != null) [
            "${pkgs.foot.themes}/share/foot/themes/${cfg.theme}"
          ];

          pad = "5x5";
        }
        |> lib.recursiveUpdate (
          lib.optionalAttrs (cfg.font.name != null && cfg.font.size != null) {
            font = "${cfg.font.name}:size=${toString cfg.font.size}";
          }
        )
        |> lib.recursiveUpdate (
          lib.optionalAttrs (cfg.shell != null) {
            shell = lib.getExe pkgs.${cfg.shell};
          }
        );

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
