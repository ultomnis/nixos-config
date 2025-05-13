{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.foot;
  inherit (config.luminosity.home.desktop.environment) fonts;
  inherit (config.luminosity.home.selections) shell;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland terminal emulator
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = "${fonts.mono}:size=${toString fonts.size}";
          include = "${pkgs.foot.themes}/share/foot/themes/${cfg.theme}";
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
