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
      colors.alpha = 0.6;

      main = {
        font = lib.mkIf (
          cfg.font.name != null && cfg.font.size != null
        ) "${cfg.font.name}:size=${toString cfg.font.size}";

        include =
          let
            foot-colors = pkgs.writeText "foot-colors.ini" ''
              [colors]
              background=000000
              foreground=ffffff
            '';
          in
          lib.optional (cfg.theme != null) "${pkgs.foot.themes}/share/foot/themes/${cfg.theme}"
          ++ lib.singleton (toString foot-colors);

        pad = "5x5";
        shell = lib.mkIf (cfg.shell != null) (lib.getExe pkgs.${cfg.shell});
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
